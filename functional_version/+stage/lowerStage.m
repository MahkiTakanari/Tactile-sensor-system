function lowerStage(s)
    stage.commandWithWait(s, "D:A500,9000,400");
    stage.commandWithWait(s, "AGO:A-2000");
    pause(1);
end