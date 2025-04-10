function controlStageForce(s, daqStG, target)

    v_max = 500;
    v_min = 10;
    e_max = 0.6;
    e_min = 0.1;
    alpha = -log(v_min / v_max) / (e_max - abs(e_min));
    thresholds = [0.55, 0.35, 0.15, 0.05];
    applied = false(size(thresholds));

    commandWithWait(s, "MGO:A1750");
    pause(0.3)
    commandWithWait(s, "JGO:A+");

    while true
        data = read(daqStG, seconds(0.01));
        current = mean(data.Variables);
        error = target + current;

        fprintf("Voltage: %.3f V | Error: %.3f V\n", current, error);

        if error < 0.003
            commandWithWait(s, "L:A");
            fprintf("✅ 目標に到達：停止\n");
            break;
        end

        for i = 1:length(thresholds)
            if error <= thresholds(i) && ~applied(i)
                commandWithWait(s, "L:A");

                velocity = round(round(v_max * exp(-alpha * (0.6 - thresholds(i)))) / 10) * 10;
                velocity = min(max(velocity, v_min), v_max);
                cmd = sprintf("D:A%d,2000,400", velocity);

                commandWithWait(s, cmd);
                fprintf("error <= %.2f → 速度変更: %d\n", thresholds(i), velocity);
                applied(i) = true;
            end
        end

        commandWithWait(s, "JGO:A+");
    end
end