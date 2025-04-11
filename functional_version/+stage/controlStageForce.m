function controlStageForce(s, daqStG, target)
    % 速度変化閾値
    thresholds = [0.55, 0.35, 0.15, 0.05];
    % 各閾値の速度設定決定
    v_max = 500;
    v_min = 10;
    e_max = 0.6;
    e_min = 0.1;
    coef_alpha = -log(v_min / v_max) / (e_max - abs(e_min));
    
    % 速度更新判定用論理配列
    applied = false(size(thresholds));

    while true
        data = read(daqStG, seconds(0.01));
        current = mean(data.Variables);
        error = target + current;

        fprintf("Voltage: %.3f V | Error: %.3f V\n", current, error);

        if error < -0.5
            stage.commandWithWait(s, "L:A");
            fprintf("⚠️ オーバーシュート警告：error = %.3f V\n", error);
            stage.commandWithWait(s, "AGO:A-2000");
            applied(:) = false;  % 速度段階リセット
            pause(2);  % 落ち着かせてから再試行
            continue;

        elseif error < 0.003
            stage.commandWithWait(s, "L:A");
            fprintf("✅ 目標に到達：停止\n");
            break;

        else        
            stage.commandWithWait(s, "JGO:A+");
            
            for i = 1:length(thresholds)
                if error <= thresholds(i) && ~applied(i)
                    stage.commandWithWait(s, "L:A");
    
                    velocity = round(round(v_max * exp(-coef_alpha * (0.6 - thresholds(i)))) / 10) * 10;
                    velocity = min(max(velocity, v_min), v_max);
    
                    cmd = sprintf("D:A%d,2000,400", velocity);
                    stage.commandWithWait(s, cmd);
                    
                    fprintf("error <= %.2f → 速度変更: %d\n", thresholds(i), velocity);
                    applied(i) = true;
                end
            end
        end

        stage.commandWithWait(s, "JGO:A+");
    end
    pause(1);
end