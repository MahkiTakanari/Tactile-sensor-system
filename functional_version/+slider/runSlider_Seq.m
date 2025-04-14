function runSlider_Seq(s, code)
    cmd = sprintf("run %d", code);
    writeline(s, cmd);
    pause(2);
end