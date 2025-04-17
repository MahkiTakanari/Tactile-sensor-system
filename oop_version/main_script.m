% 初期値設定
numTrials = 3;
target = 0.6;
duration = 1;
SamplingRate = 5000;

% --- 初期化 ---
stage = StageController("COM6");
slider = SliderController("COM3");
daqStG = utility.initDaq("cDAQ1Mod1", "ai0", SamplingRate, "daqStG");
daqPVDF = utility.initDaq("Dev2", "ai1", SamplingRate, "daqPVDF");

stage.lower();
slider.runSeq(31);
disp("RESET: Stage & Slider position")

z_contact = [];

% --- 試行ループ ---
for trial = 1:numTrials
    fprintf("\n▶▶ 試行 %d 開始\n", trial);
    
    if trial == 1
        disp("▶ 接触位置記録上昇");
        z_contact = stage.controlForce(daqStG, target);
    else
        disp("▶ 接触位置まで移動");
        stage.goToZ(z_contact);
        pause(0.5);
        
        disp("▶ z軸ステージ上昇 → 所望の押しつけ力を制御中...");
        stage.controlForce(daqStG, target);
    end

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
