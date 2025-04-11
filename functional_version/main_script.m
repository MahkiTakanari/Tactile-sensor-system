% --- 初期化 ---

s_stage = utility.initSerial("COM5", "s_stage");
s_slider = utility.initSerial("COM3", "s_slider");
daqStG = utility.initDaq("cDAQ1Mod1", "ai0", 5000, "daqStG");
daqPVDF = utility.initDaq("Dev2", "ai1", 5000, "daqPVDF");

stage.lowerStage(s_stage);
slider.runSlider(s_slider, 31);
disp("RESET: Stage & Slider position")

% --- 試行ループ ---
numTrials = 3;
target = 0.6;
duration = 1;

for trial = 1:numTrials
    fprintf("\n▶▶ 試行 %d 開始\n", trial);

    % -----------------------
    % 1. 押しつけ力制御（z軸）
    % -----------------------
    disp("▶ z軸ステージ上昇 → 所望の押しつけ力を制御中...");
    % この辺に前回接触のMGOを入れる
    stage.controlStageForce(s_stage, daqStG, target);

    % -----------------------
    % 2. PVDF計測の開始
    % -----------------------
    disp("▶ PVDFセンサの計測開始");
    % 計測スタート

    start(daqPVDF, "Duration", seconds(duration));
    data = read(daqPVDF, seconds(duration));
    t = data.Time;
    v = data.Variables;

    % -----------------------
    % 3. スライダ動作（走査）
    % -----------------------
    disp("▶ スライダ走査開始");
    slider.runSlider(s_slider, 29);

    figure;
    plot(t, v);
    xlabel("time [s]");
    ylabel("voltage [V]");
    title("PVDF output");
    grid on; box on;

    % -----------------------
    % 4. z軸ステージを下降
    % -----------------------
    disp("▶ z軸ステージ下降");
    stage.lowerStage(s_stage);

    % -----------------------
    % 5. スライダを初期位置へ
    % -----------------------
    disp("▶ スライダ初期位置へ戻す");
    slider.runSlider(s_slider, 31);

    fprintf("✅ 試行 %d 終了\n", trial);
end
