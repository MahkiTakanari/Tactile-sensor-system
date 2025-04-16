function s = initSerial(portName, label)
    % 呼び出し元で既に存在 & 有効なら、それを返す
    if evalin("caller", sprintf("exist('%s', 'var') && isvalid(%s)", label, label))
        s = evalin("caller", label);
        fprintf("REUSE: %s (port: %s)\n", label, portName);
        return;
    end

    % 存在しない or 無効 → 新しく作る
    s = serialport(portName, 9600); 
    configureTerminator(s, "CR/LF");
    assignin("caller", label, s);  % 呼び出し元に代入
    fprintf("SET: %s (port: %s)\n", label, portName);
end
