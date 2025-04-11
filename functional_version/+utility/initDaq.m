function daqObj = initDaq(deviceID, channelID, rate, label)
    % 呼び出し元で既に存在 & 有効なら、それを返す
    if evalin("caller", sprintf("exist('%s', 'var') && isvalid(%s)", label, label))
        daqObj = evalin("caller", label);
        fprintf("REUSE: %s (device: %s)\n", label, deviceID);
        return;
    end

    % 存在しない or 無効 → 新しく作る
    daqObj = daq("ni");
    addinput(daqObj, deviceID, channelID, "Voltage");
    daqObj.Rate = rate;
    assignin("caller", label, daqObj);  % 呼び出し元に変数を作成

    fprintf("SET: %s (device: %s)\n", label, deviceID);
end