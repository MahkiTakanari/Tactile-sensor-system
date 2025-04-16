[33mcommit effd4f0327ec93bd1670f458acba5132d02c28f2[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmain[m[33m, [m[1;31morigin/main[m[33m)[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Fri Apr 11 12:56:30 2025 +0900

    [fix] シリアル通信・Daqのinitを書き換え
    
    utility/に関数を作成して実装

[33mcommit 69c1060435d7a67585095835067e81a83b5c513a[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Fri Apr 11 12:04:49 2025 +0900

    [add] 関数ファイル構造の整理

[33mcommit 4c9a8ac76625c8c273f9778cd4dfb36d65650294[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Fri Apr 11 11:43:25 2025 +0900

    [rm] 見覚えのないファイル削除

[33mcommit e885c735c3dcc81430a79ff5cfd74c504d19b8e2[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Fri Apr 11 11:19:09 2025 +0900

    [update] .mlxの内容を.mに反映、微修正
    
    .mの時はfigure;でウィンドウ毎回生成するように

[33mcommit 8b3ef8c096f524574567014ff2d16a6a4fa594b2[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Fri Apr 11 11:12:14 2025 +0900

    [update] 右コラムのui微修正
    
    微修正＋PVDF出力のグラフも追加

[33mcommit c53d32683e181c2c279175855ea267e977a15c4d[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Fri Apr 11 10:40:53 2025 +0900

    [update] オーバーシュートのデバッグを反映

[33mcommit aec71a469dd5e055e3c569400cbec787cd09cf22[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Fri Apr 11 10:34:19 2025 +0900

    [fix] オーバーシュートのデバッグ
    
    オーバーシュート判定してからステージ上昇するように修正

[33mcommit 85f3432521378ecdd8397ff95243c40a3297030e[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Fri Apr 11 10:24:17 2025 +0900

    [fix] 問題なく動作

[33mcommit 2237b6db488948a782f5e79f1189105da41d748b[m
Merge: e1ed19d f7d1f84
Author: WinMahki <emc.leguza@gmail.com>
Date:   Thu Apr 10 21:21:13 2025 +0900

    Merge branch 'main' of github.com:MahkiTakanari/Tactile-sensor-system

[33mcommit e1ed19d376310347333f2839e08765fd60a14821[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Thu Apr 10 21:19:01 2025 +0900

    [fix] デバッグ必要かも
    
    オーバーシュートがうまく動作しない

[33mcommit f7d1f84addf0460bc160274c3955987c6b2eeefe[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Thu Apr 10 20:57:04 2025 +0900

    [fix] 名前空間仕様に変更
    
    関数の呼び出しを対応させただけ

[33mcommit dc1c8b1c78b26c95cde2fabb029ace8deb6102d3[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Thu Apr 10 20:51:05 2025 +0900

    [update] 名前空間で関数管理
    
    +stage/+sliderを追加、振り分け

[33mcommit bb32239436ade83eed376f918d6ac089d41d620e[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Thu Apr 10 20:27:00 2025 +0900

    [update] 関数ベースで正常にシステム動作
    
    pvdf計測部分はなし。とりあえず動いた状態で中身は汚いので整理する必要ある

[33mcommit 064f134f8c3ea62c11a5e6a553729dac58bd72f2[m
Merge: 98cab4f ffe6927
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Thu Apr 10 20:10:06 2025 +0900

    Merge branch 'main' of https://github.com/MahkiTakanari/Tactile-sensor-system

[33mcommit 98cab4f61e7c1393ed5b9747ae4956ed6e30abc4[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Thu Apr 10 20:06:13 2025 +0900

    [update] オーバーシュート時の制動処理を追記
    
    controlStageForce.mとmain_script.mを修正

[33mcommit ffe69273540c9967c8b356d270e7d2a172a7810b[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Thu Apr 10 12:57:24 2025 +0900

    [update] オーバーシュートした時の制動処理を追記
    
    error < -0.5 でwhileループcontinue;

[33mcommit 2f2a374491037eea7e873058345f60d5a0412fe5[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Thu Apr 10 12:30:47 2025 +0900

    [update] 関数化の途中経過
    
    ステージとスライダ制御までを書いた

[33mcommit 41332d88accc93228aa532b0f453c978d500d75e[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Thu Apr 10 10:49:26 2025 +0900

    [add] touchでとりあえずファイルを作った
    
    7ファイル追加

[33mcommit 9b7852be553d8ebd9c8269d975f8a344d41bfea3[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Thu Apr 10 10:26:18 2025 +0900

    [add] 新規ディレクトリを追加
    
    構造化関数ベースとクラスベースのコードを生成する

[33mcommit 76b7832ee75ab3e15d1393a10669db9138e7b3f0[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Thu Apr 10 10:22:12 2025 +0900

    [add] 自動生成ファイルを無視する.gitignoreを追加
    
    これに記述するファイル、拡張子はgitが無視するようになる

[33mcommit 59b080c28616872ed9d3e406ceb18eba34c2661a[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Thu Apr 10 09:33:13 2025 +0900

    [test] Macにcloneしたのでpush test

[33mcommit d6210c2e6bba73935e7f0bee67aa314071144c6d[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Wed Apr 9 21:31:21 2025 +0900

    [update] 最新に更新
    
    pushしてないバージョンがあったので更新

[33mcommit 4d1e383b0f179b7875084457403ec6f34db7b024[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Wed Apr 9 21:26:44 2025 +0900

    [update] tactile_sens_systemでの変更点を更新
    
    更新して動くように調整も

[33mcommit bc429441af7dec7de208f4187251e03866ff3399[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Wed Apr 9 20:50:38 2025 +0900

    [update] コメント追加
    
    リニアスライダはEMP400で使うと楽だが,matlabで制御するときは癖あり

[33mcommit c76034de73b78953ab3190f97fc8c8a9e691f9c6[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Wed Apr 9 20:40:23 2025 +0900

    [add] 直動スライダの制御プログラム
    
    シーケンスではなく指定した速度・距離を走査するように改良

[33mcommit 4d0c791f04f56550fd69199565e5e12c392ece4f[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Wed Apr 9 17:38:52 2025 +0900

    [fix] ポート番号変更とコメント追加
    
    １３０行目を変更、１３４行目に追加

[33mcommit 24af9275966690ebbc8f0d550a3c26380029ed6f[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Wed Apr 9 17:16:50 2025 +0900

    [fix] スライダーのシリアルポート番号を変更
    
    130行目：com3 → com356

[33mcommit fd1ce20d0ba551d5cac8b89ac909a9fd874aeb27[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Tue Apr 8 12:53:44 2025 +0900

    [add] システム全体のプログラム ライブエディタver.
    
    一つ前にpushしたtactile_sens_system_script.mを.mlxにコピペしたもの

[33mcommit c0cec5efba35f752be7e3411e8dc3d799017682c[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Tue Apr 8 12:48:23 2025 +0900

    [add] システム全体のスクリプトファイル
    
    とりあえず３試行連続して動くようにデバック済み

[33mcommit a02ba4ab3c76c1a1c3b5aa3f4a37b399059c52ee[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Mon Apr 7 15:36:58 2025 +0900

    [add] 単純なシリアル通信に使ってたプログラム
    
    z軸ステージとスライダのシリアル通信に使ってた。メモを残してるくらい

[33mcommit be02cdea2c3c14ecbf14aaa163bfa5c036d2af09[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Mon Apr 7 15:32:12 2025 +0900

    [add] z軸ステージを制御するプログラム
    
    ひずみゲージ値をdaqで取得して押しつけ力を計測

[33mcommit 606f348b536974fc42d51314c29081574190c87b[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Mon Apr 7 15:03:06 2025 +0900

    Delete index.html

[33mcommit b24cbda3836517e5f1cce5d150846f98248d46bc[m
Author: MahkiTakanari <emc.leguza@gmail.com>
Date:   Mon Apr 7 15:02:50 2025 +0900

    Delete readme.txt

[33mcommit 37e10ee1859b78f3bc7414a98b6edfb4cc8f6c07[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Mon Apr 7 12:24:49 2025 +0900

    passなし設定

[33mcommit 36e4bcd077777cb5ee79a99a8b842540ca170178[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Mon Apr 7 12:15:05 2025 +0900

    test

[33mcommit 426651f9cf86cba92e661c12d44c70581f84d033[m
Author: WinMahki <emc.leguza@gmail.com>
Date:   Mon Apr 7 12:12:26 2025 +0900

    test
