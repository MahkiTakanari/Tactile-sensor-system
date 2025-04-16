classdef SliderController
    properties
        s   % serialport
    end

    methods
        % コンストラクタ（再利用優先）
        function obj = SliderController(port)
            found = serialportfind("Port", port);
            if ~isempty(found) && isvalid(found(1))
                obj.s = found(1);
                fprintf("REUSE: existing serialport on %s\n", port);
            else
                try
                    obj.s = serialport(port, 9600);
                    configureTerminator(obj.s, "CR/LF");
                    fprintf("SET: serialport on %s\n", port);
                catch ME
                    rethrow(ME);
                end
            end
        end

        % runSeq メソッド
        function runSeq(obj, code)
            cmd = sprintf("run %d", code);
            writeline(obj.s, cmd);
            pause(2);
        end
    end
end
