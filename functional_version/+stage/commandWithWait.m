function commandWithWait(s, command)
    writeline(s, command);
    while true
        writeline(s, "Q:A2");
        pause(0.02);
        if s.NumBytesAvailable > 0
            status = readline(s);
            if contains(status, "K") || command == "JGO:A+"
                break;
            end
        end
    end
end