% --- 初期化 ---
s_stage = stage.initStage("COM5");
s_slider = slider.initSlider("COM3");

% daqの関数化はできてない
daqStG = daq("ni");
addinput(daqStG, "cDAQ1Mod1", "ai0", "Voltage");
daqStG.Rate = 5000;


% --- 試行ループ ---
numTrials = 3;
target = 0.6;

for trial = 1:numTrials
    fprintf("\n▶ 試行 %d 開始\n", trial);
    slider.runSlider(s_slider, 31);  % スライダ初期動作
    pause(2);

    % z軸上昇・押しつけ力制御
    stage.controlStageForce(s_stage, daqStG, target);
    pause(1);

    % ↓ここにPVDF計測やスライダ走査処理が入る↓
    slier.runSlider(s_slider, 29);
    pause(1);

    % z軸下降
    stage.lowerStage(s_stage);

    % スライダ初期化
    slider.runSlider(s_slider, 31);

    fprintf("✅ 試行 %d 終了\n", trial);
end

clear all