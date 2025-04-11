function plotPVDF(t, v)
    figure;
    plot(t, v);
    xlabel("time [s]");
    ylabel("voltage [V]");
    title("PVDF output");
    grid on; box on;
end