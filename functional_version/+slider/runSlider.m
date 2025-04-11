function runSlider(s, code)
    cmd = sprintf("run %d", code);
    writeline(s, cmd);
    pause(1);
end