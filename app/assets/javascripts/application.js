// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require_tree .


// ---------------------
// users/informationのjs
// ---------------------

window.onload = function() {
    if(document.getElementById("arrow-right") != null){
        let sliderImages = document.querySelectorAll('.slide');
        let arrowRight = document.getElementById('arrow-right');
        let arrowLeft = document.getElementById('arrow-left');
        let current = 0;
        function startSlide(){
            sliderImages[0].style.display = 'block';
        }

        arrowRight.addEventListener('click', function() {
          console.log("ok");
            sliderImages[current].style.display = 'none';
            if(current === sliderImages.length - 1){
                current = -1;
            }
            sliderImages[current + 1].style.display = 'block';
            current++;
        });

        arrowLeft.addEventListener('click', function() {
            sliderImages[current].style.display = 'none';
            if(current === 0){
                current = sliderImages.length;
            }
            sliderImages[current - 1].style.display = 'block';
            current--;
        });

        startSlide();
    }

    // ----------------------------------
    // users/skillのストップウォッチのjs
    // ----------------------------------
    if(document.getElementById("timer") != null){
        'use strict';

        let timer = document.getElementById('timer');
        let start = document.getElementById('start');
        let stop = document.getElementById('stop');
        let reset = document.getElementById('reset');

        // ---------------------------------------
        //クリック時の時間を保持するための変数定義
        // ---------------------------------------

        let startTime;

        // -----------------------------
        // 経過時刻を更新するための変数
        // -----------------------------

        let elapsedTime = 0;

        // -------------------------------------------------------------
        // タイマーを止めるにclearTimeoutを使う
        // そのためにはclearTimeoutの引数に渡すためのタイマーのidが必要
        // -------------------------------------------------------------

        let timerId;

        // ---------------------------------------------------------------------
        // タイマーをストップ -> 再開させたら0になってしまうのを避けるための変数
        // ---------------------------------------------------------------------

        let timeToadd = 0;

        // ---------------------------------------------------------------------------------------------
        //  ミリ秒の表示ではなく、分とか秒に直すための関数, 他のところからも呼び出すので別関数として作る
        //  計算方法として135200ミリ秒経過したとしてそれを分とか秒に直すと -> 02:15:200
        // ---------------------------------------------------------------------------------------------

        function updateTimetText(){

            // ----------------------------------------------------
            // m(分) = 135200 / 60000ミリ秒で割った数の商　-> 2分
            // ----------------------------------------------------

            let m = Math.floor(elapsedTime / 60000);

            // ----------------------------------------------------------------------
            // s(秒) = 135200 % 60000ミリ秒で / 1000 (ミリ秒なので1000で割る) -> 15秒
            // ----------------------------------------------------------------------

            let s = Math.floor(elapsedTime % 60000 / 1000);

            // ---------------------------------------------------------
            //  ms(ミリ秒) = 135200ミリ秒を % 1000ミリ秒で割った数の余り
            // ---------------------------------------------------------
            let ms = elapsedTime % 1000;

            // --------------------------------------------------------------
            //  HTML 上で表示の際の桁数を固定する　例）3 => 03　、 12 -> 012
            //  javascriptでは文字列数列を連結すると文字列になる
            //  文字列の末尾2桁を表示したいのでsliceで負の値(-2)引数で渡す
            // --------------------------------------------------------------

            m = ('0' + m).slice(-2);
            s = ('0' + s).slice(-2);
            ms = ('0' + ms).slice(-3);

            // ---------------------------------
            //  HTMLのid　timer部分に表示させる
            // ---------------------------------

            timer.textContent = m + ':' + s + ':' + ms;
        }

        // ------------------------
        //  再帰的に使える用の関数
        // ------------------------

        function countUp(){

            // ----------------------------------------------
            // timerId変数はsetTimeoutの返り値になるので代入
            // ----------------------------------------------

            timerId = setTimeout(function(){

                // -------------------------------------------------------------------------------------
                //  経過時刻は現在時刻をミリ秒で示すDate.now()からstartを押した時の時刻(startTime)を引く
                // -------------------------------------------------------------------------------------

                elapsedTime = Date.now() - startTime + timeToadd;
                updateTimetText();

                // ----------------------------------------------------------
                //  countUp関数自身を呼ぶことで10ミリ秒毎に以下の計算を始める
                // ----------------------------------------------------------

                countUp();

            // ---------------------------------------------------------
            // 1秒以下の時間を表示するために10ミリ秒後に始めるよう宣言
            // ---------------------------------------------------------

            },10);
        }

        // -----------------------------------------------------------------
        // startボタンにクリック時のイベントを追加(タイマースタートイベント)
        // -----------------------------------------------------------------
        start.addEventListener('click',function(){

            // --------------------------
            // 在時刻を示すDate.nowを代入
            // --------------------------

            startTime = Date.now();

            // -------------------------------
            // 再帰的に使えるように関数を作成
            // -------------------------------
            countUp();
        });

        // ----------------------------------------------------------------
        //stopボタンにクリック時のイベントを追加(タイマーストップイベント)
        // ----------------------------------------------------------------

        stop.addEventListener('click',function(){

            //------------------------------------------------------------------------------------------------------
            // タイマーを止めるにはclearTimeoutを使う、そのためにはclearTimeoutの引数に渡すためのタイマーのidが必要
            // -----------------------------------------------------------------------------------------------------
           clearTimeout(timerId);

            // -------------------------------------------------------------------------------------------------------------------------------------
            //タイマーに表示される時間elapsedTimeが現在時刻かたスタートボタンを押した時刻を引いたものなので、
            //タイマーを再開させたら0になってしまう。elapsedTime = Date.now - startTime
            //それを回避するためには過去のスタート時間からストップ時間までの経過時間を足してあげなければならない。
            // elapsedTime = Date.now - startTime + timeToadd (timeToadd = ストップを押した時刻(Date.now)から直近のスタート時刻(startTime)を引く)
            //--------------------------------------------------------------------------------------------------------------------------------------
           timeToadd += Date.now() - startTime;
        });

        // ------------------------------------------------------------------
        // resetボタンにクリック時のイベントを追加(タイマーリセットイベント)
        // ------------------------------------------------------------------

        reset.addEventListener('click',function(){

            // --------------------------------------------------------------------------------------------------
            // 経過時刻を更新するための変数elapsedTimeを0にしてあげつつ、updateTimetTextで0になったタイムを表示。
            // --------------------------------------------------------------------------------------------------

            elapsedTime = 0;

            // ----------------------------------------------------------
            // リセット時に0に初期化したいのでリセットを押した際に0を代入
            // ----------------------------------------------------------

            timeToadd = 0;

            //---------------------------------------
            //updateTimetTextで0になったタイムを表示
            // --------------------------------------

            updateTimetText();

        });

    };
    if(document.getElementById("omikuji_btn") != null){

        // ----------------------------------------------------------------
        // users/informationのおみくじ
        // ランダムに結果が出るように指定している
        // ----------------------------------------------------------------

            document.getElementById( "omikuji_btn" ).onclick = function() {
                let rnd = Math.floor( Math.random() * 10 );
                let omikuji;
                if (rnd === 0) omikuji = "大吉"+"(絶好調!!)";
                if (rnd === 1) omikuji = "吉"+"(今日は良い1日になりそう！)";
                if (rnd === 2) omikuji = "中吉"+"(ちょっといいことあるかも...!)";
                if (rnd === 3) omikuji = "小吉"+"(初心を大切に行動しよう!)";
                if (rnd === 4) omikuji = "末吉"+"(山あり谷ありな1日かも...!)";
                if (rnd === 5) omikuji = "凶"+"(周りを見ながら注意して行動しよう...!)";
                if (rnd === 6) omikuji = "大吉"+"(絶好調!!)";
                if (rnd === 7) omikuji = "大吉"+"(絶好調!!)";
                if (rnd === 8) omikuji = "吉"+"(今日は良い1日になりそう！)";
                if (rnd === 9) omikuji = "小吉"+"(初心を大切に行動しよう!)";
                alert(omikuji);
            };
    }
};