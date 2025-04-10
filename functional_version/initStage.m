function s = initStage(portName)
    s = serialport(portName, 9600);
    configureTerminator(s, "CR/LF");
    pause(0.5);
    writeline(s, "D:A500,2000,400");  % 初期速度設定
end