function runSlider(velocity, distance, direction, s)
    V = velocity;
    VS = V;
    D = distance;

    cmd = sprintf("D %d", D);
    writeline(s, cmd);
    res = readline(s);
    res = readline(s);
    
    cmd = sprintf("V %d", V);
    writeline(s, cmd);
    res = readline(s);
    res = readline(s);
    
    cmd = sprintf("VS %d", VS);
    writeline(s, cmd);
    res = readline(s);
    res = readline(s);

    if direction == "+"
        writeline(s, "H +");
    elseif direction == "-"
        writeline(s, "H -");
    end
    res = readline(s);
    res = readline(s);

    writeline(s, "INC")
    res = readline(s);
end
     

    