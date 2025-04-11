% --- 初期化 ---

s_stage = utility.initSerial("COM5", "s_stage");
s_slider = utility.initSerial("COM3", "s_slider");
daqStg = utility.initDaq("cDAQ1Mod1", "ai0", 5000, "daqStg");
daqPVDF = utility.initDaq("Dev2", "ai1", 5000, "daqPVDF");

stage.lowerStage(s_stage);
slider.runSlider(s_slider, 31);
disp("RESET: Stage & Slider position")

% --- 試行ループ ---
numTrials = 3;
target = 0.6;

for trial = 1:numTrials
    fprintf("\n▶▶ 試行 %d 開始\n", trial);

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