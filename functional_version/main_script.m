% --- 初期化 ---
s_stage = initStage("COM5");
s_slider = initSlider("COM3");

daqStG = daq("ni");
addinput(daqStG, "cDAQ1Mod1", "ai0", "Voltage");
daqStG.Rate = 5000;

% --- 試行ループ ---
numTrials = 3;
target = 0.6;

for trial = 1:numTrials
    fprintf("\n▶ 試行 %d 開始\n", trial);
    runSlider(s_slider, 31);  % スライダ初期動作
    pause(2);

    % z軸上昇・押しつけ力制御
    controlStageForce(s_stage, daqStG, target);

    % ↓ここにPVDF計測やスライダ走査処理が入る↓

    % z軸下降
    lowerStage(s_stage);

    % スライダ初期化
    runSlider(s_slider, 30);

    fprintf("✅ 試行 %d 終了\n", trial);
end