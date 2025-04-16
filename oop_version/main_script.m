% --- 初期化 ---
stage = StageController("COM5");
slider = SliderController("COM3");
daqStG = utility.initDaq("cDAQ1Mod1", "ai0", 5000, "daqStG");
daqPVDF = utility.initDaq("Dev2", "ai1", 5000, "daqPVDF");

stage.lower();
slider.runSeq(31);
disp("RESET: Stage & Slider position")

% --- 試行ループ ---
numTrials = 3;
target = 0.6;
duration = 1;

for trial = 1:numTrials
    fprintf("\n▶▶ 試行 %d 開始\n", trial);

    disp("▶ z軸ステージ上昇 → 所望の押しつけ力を制御中...");
    stage.controlForce(daqStG, target);

    disp("▶ PVDFセンサの計測開始");
    [t, v] = PVDFHandler.meas(daqPVDF, duration);

    disp("▶ スライダ走査開始");
    slider.runSeq(29);

    PVDFHandler.plot(t, v);

    disp("▶ z軸ステージ下降");
    stage.lower();

    disp("▶ スライダ初期位置へ戻す");
    slider.runSeq(31);

    fprintf("✅ 試行 %d 終了\n", trial);
end
