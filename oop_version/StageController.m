classdef StageController
    properties
        s           % serialport
        v_max = 500
        v_min = 10
        e_max = 0.6
        e_min = 0.1
        coef_alpha
        thresholds = [0.55, 0.35, 0.15, 0.05];
    end

    methods
        % コンストラクタ
        function obj = StageController(port)
            % まず再利用できる serialport オブジェクトがあるか確認
            found = serialportfind("Port", port);
            if ~isempty(found) && isvalid(found(1))
                obj.s = found(1);
                fprintf("REUSE: existing serialport on %s\n", port);
            else
                % serialport を新しく開く（ここでしか例外の可能性が残らない）
                try
                    obj.s = serialport(port, 9600);
                    configureTerminator(obj.s, "CR/LF");
                    fprintf("SET: serialport on %s\n", port);
                catch ME
                    rethrow(ME);  % 再利用不可かつ開けない → 本当のエラー
                end
            end

            obj.coef_alpha = -log(obj.v_min / obj.v_max) / (obj.e_max - abs(obj.e_min));
        end

        % インスタンスメソッド
        function commandWithWait(obj, cmd)
            writeline(obj.s, cmd);
            while true
                writeline(obj.s, "Q:A2");
                pause(0.02);
                if obj.s.NumBytesAvailable > 0
                    status = readline(obj.s);
                    if contains(status, "K") || cmd == "JGO:A+"
                        break;
                    end
                end
            end
        end

        function z = controlForce(obj, daqStG, target)
            applied = false(size(obj.thresholds));
            contactSaved = false;
            z_contact = NaN;

            while true
                data = read(daqStG, seconds(0.01));
                current = mean(data.Variables);
                error = target + current;

                fprintf("Voltage: %.3f V | Error: %.3f V\n", current, error);

                if ~contactSaved && current < -0.07
                    obj.commandWithWait("L:A");
                    z_contact = obj.getCurrentZ();
                    contactSaved = true;
                    fprintf("📍 接触点検出：Z = %d（current = %.3f）\n", z_contact, current);
                end

                if error < -0.05
                    obj.commandWithWait("L:A");
                    fprintf("\n⚠️ オーバーシュート警告：%.3f V\n", error);
                    obj.commandWithWait("AGO:A0");
                    applied(:) = false;
                    pause(2);
                    continue;
                elseif error < 0.003
                    obj.commandWithWait("L:A");
                    fprintf("\n✅ 目標到達： %.3f V\n", current);
                    break;
                else
                    obj.commandWithWait("JGO:A+");
                    for i = 1:length(obj.thresholds)
                        if error <= obj.thresholds(i) && ~applied(i)
                            obj.commandWithWait("L:A");
                            velocity = round(round(obj.v_max * exp(-obj.coef_alpha * (0.6 - obj.thresholds(i)))) / 10) * 10;
                            velocity = min(max(velocity, obj.v_min), obj.v_max);
                            obj.commandWithWait(sprintf("D:A%d,2000,400", velocity));
                            fprintf("error <= %.2f → 速度変更: %d\n", obj.thresholds(i), velocity);
                            applied(i) = true;
                        end
                    end
                end
                obj.commandWithWait("JGO:A+");
            end
            pause(1);

            if nargout > 0
                z = z_contact;
            end
        end

        function z = getCurrentZ(obj)
            writeline(obj.s, "Q:A1");
            z = readline(obj.s);
        end

        function goToZ(obj, z)
            z = z - 200; % 接触位置から200下げる
            cmd = sprintf("AGO:A%d", z);
            obj.commandWithWait(cmd);
        end

        function lower(obj)
            obj.commandWithWait("D:A500,9000,400");
            obj.commandWithWait("AGO:A0");
            pause(0.3);
        end
    end
end