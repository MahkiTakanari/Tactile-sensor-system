function lowerStage(s)
    commandWithWait(s, "D:A500,9000,400");
    commandWithWait(s, "AGO:A-2000");
    pause(1);
end