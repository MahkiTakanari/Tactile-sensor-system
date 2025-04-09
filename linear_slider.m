% スライダ制御のプログラム
% writelineするたびにreadlineで読まないとバッファが溜まって？* Syntax error.
% 値設定系は2回、動作系は1回readlineするように

if ~exist("s_slider", "var") || ~isvalid(s_slider)
    s_slider = serialport("COM3", 9600);
    configureTerminator(s_slider, "CR/LF");
    disp("s_slider SETTING")
end

V = 40000;
VS = V;
D = 50;

cmd = sprintf("D %d", D);
writeline(s_slider, cmd);
res = readline(s_slider)
res = readline(s_slider)


cmd = sprintf("V %d", V);
writeline(s_slider, cmd);
res = readline(s_slider)
res = readline(s_slider)

cmd = sprintf("VS %d", VS);
writeline(s_slider, cmd);
res = readline(s_slider)
res = readline(s_slider)

writeline(s_slider, "INC")
res = readline(s_slider)
 
