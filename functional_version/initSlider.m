function s = initSlider(portName)
    s = serialport(portName, 9600);
    configureTerminator(s, "CR/LF");
    pause(0.5);
end