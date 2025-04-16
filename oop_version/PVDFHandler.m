classdef PVDFHandler
    methods(Static)
        function [t, v] = meas(daqObj, duration)
            start(daqObj, "Duration", seconds(duration));
            data = read(daqObj, seconds(duration));
            t = data.Time;
            v = data.Variables;
        end

        function plot(t, v)
            figure;
            plot(t, v);
            xlabel("time [s]");
            ylabel("voltage [V]");
            title("PVDF output");
            grid on; box on;
        end
    end
end