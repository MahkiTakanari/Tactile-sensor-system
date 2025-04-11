function s = initSlider(portName)
    s = serialport(portName, 9600);
    configureTerminator(s, "CR/LF");
end