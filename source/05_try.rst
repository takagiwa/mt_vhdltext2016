============
第5章 演習
============

5.1 注意事項
==============

- 開発環境 Quatus II のプロジェクトは、実習項目毎に作り直してください。流用するとトラブルの元になります。
- Quatus II の中で日本語を入力するのは避けましょう。こちらもトラブルの元になります。

5.2 論理演算
==============

5.2.1 演習
^^^^^^^^^^^^

プロジェクト名 vhdl01

スイッチ入力に対して論理演算を行い、結果を LED に出力します。

.. literalinclude:: sources/vhdl01.vhd
  :language: vhdl

このコードで出力される回路は図のようなものになります。

.. only:: not latex

 .. figure:: figure/figure06.png
  :align: center

.. only:: latex

 .. figure:: figure/figure06.eps
  :align: center

スイッチは基板奥の方（７セグLED 側）に倒すとH 、手前でL のレベルになります。
LED に対してはデバイスからH を与えると消灯、L を与えると点灯します。
たとえばled1 はスイッチ１番を奥に倒すと消灯、手前に倒すと点灯します。led5 は逆の点灯の仕方になります。

5.3 数値演算
==============

5.3.1 演習
^^^^^^^^^^^^

プロジェクト名 vhdl02

スイッチ入力に対して数値演算を行い、LED に表示します。

.. literalinclude:: sources/vhdl02.vhd
  :language: vhdl

スイッチの上位４ビットと下位４ビットの演算を行います。LED の上位に加算の結果、下位に減算の結果が２進数で表示されます。

たとえばスイッチを８から１まで、10100001 （1=ON, 0=OFF）とした場合、結果は10011011 、そのままならばLED の点灯パターンは01100100 となります。

.. only:: not latex

 .. figure:: figure/figure07.png
  :align: center

.. only:: latex

 .. figure:: figure/figure07.eps
  :align: center


5.4 条件分岐 when ～ else ～
=============================

5.4.1 演習
^^^^^^^^^^^^

プロジェクト名 vhdl03

条件分岐の書き方の一つ、when ～ else ～ の例です。

.. literalinclude:: sources/vhdl03.vhd
  :language: vhdl

sw8 をH レベルにしておくと、LED1 はsw2 の操作に従って点灯します。

sw8 がL レベルの場合は、LED1 はsw1 の操作に従って点灯します。

このコードから生成される回路のイメージは次の図の通りです。

.. only:: not latex

 .. figure:: figure/figure08.png
  :align: center

.. only:: latex

 .. figure:: figure/figure08.eps
  :align: center


この記述ではいくつでも分岐させることができます。

.. code-block:: vhdl

 ans <= x1 when (y1 = '1')
   else x2 when (y2 = '1')
   else x3 when (y3 = '1')
   else x4 when (y4 = '1')
   else x5;

ただし、判定は記述した順番に行われます。この例でたとえばy1 ～ y4 全てが1 だった場合、y1 の条件が採用されます（プライオリティエンコーダ＝選択肢に優先順位のあるセレクタ）。

5.5 条件分岐 with ～ select ～ when ～
=======================================

5.5.1 演習
^^^^^^^^^^^^

プロジェクト名vhdl04

条件分岐の書き方の一つ、with ～ select ～ when ～ の例です。

.. literalinclude:: sources/vhdl04.vhd
  :language: vhdl

sw7 とsw8 の設定により、LED の点滅を制御できるスイッチを切り替えられる回路です。

このコードから生成される回路のイメージは次の通りです。

.. only:: not latex

 .. figure:: figure/figure09.png
  :align: center

.. only:: latex

 .. figure:: figure/figure09.eps
  :align: center

中央のブロックはセレクタで、上から入力される値がブロック中の値と一致すると、その箇所の信号が出力されます。

5.6 process 文
================

AND、OR、NOT などの組み合わせ回路や単純な条件分岐であればこれまでの内容で対応できますが、フリップフロップなどを組み合わせた順序回路を記述するには、process文を使用します。

ヒント

フリップフロップ専用の記述ではありませんが、フリップフロップを使用する箇所のみ process 文を使うようにしていると、慣れていないうちはトラブルを避けやすくなります。

基本的な構成は以下の通りです。

.. code-block:: vhdl

 LABEL: process (SENSITIVITY-LIST)
 begin
   ～ EXPRESSION ～
 end process;

ラベル(LABEL) を付加するかどうかは任意ですが、識別のために固有の名前をつけておくのがよいでしょう。

センシティビティリスト(SENSITIVITY-LIST) は、このprocess 文を動作させるトリガになる信号のリストを記述します。

信号名はカンマで区切ります。

式(EXPRESSION) の部分には実際の動作を記述します。ただし条件分岐は、これまでのwhen ～ else ～ やwith ～ select ～ when ～ は使用できません。後ほどでてくるif 文やcase 文を使用します（逆にif 　文やcase 文はprocess 文の外では使用できません）。

.. csv-table:: 組み合わせ
 :header-rows: 1

 "process 文の", "when ～ else ～", "with ～ select ～ when ～", "if ～ elsif ～ endif", "case ～ end case"
 "外", "○", "○", "×", "×"
 "中", "×", "×", "○", "○"


5.7 フリップフロップの基本と if 文
====================================

フリップフロップは主にD 型、SR 型、JK 型、T 型があります。これらをVHDL で記述するときは一般にprocess 文を使用します。

フリップフロップのリセットが非同期式の場合、D フリップフロップは以下のように記述します。

.. code-block:: vhdl

 D_FF: process (reset, clock)
 begin
   if (reset = '1') then
     q <= '0';
   elsif (clock'event and clock = '1') then
     q <= d;
   end if;
 end process;

この例では、すべての信号は std_logic で定義されているとします。

入力データは信号は d 、出力データ信号は q としています。

reset に H レベルの信号を与えるとリセット動作として、q をL レベルにセットしています。

クロック信号 clock が H へ変化すると、q へ d を代入します。

.. only:: not latex

 .. figure:: figure/figure12.png
  :align: center

.. only:: latex

 .. figure:: figure/figure12.eps
  :align: center

動作例を以下に示します。

.. only:: not latex

 .. figure:: figure/figure10.png
  :align: center

.. only:: latex

 .. figure:: figure/figure10.eps
  :align: center

a の期間では reset = '1' が成り立つので q <= '0' が実行され続けます。

b のタイミングでは clock'event and clock = '1' が成り立ちます。これは、clock が変化したこと（clock'event）と clock = '1' の組み合わせで、clock が 0 から 1 に変化したときに成り立つ、という記述の仕方です。このとき q <= d が実行されます。d が 1 なので最終的には q は 1 になります。

c のタイミングも b のタイミング同様、clock が 0 から 1 に変化したことが成り立っています。q には d の値 0 が代入されます。

d の期間では e や f のタイミングで clock'event が成り立っていますが、if 文（後述）で reset = '1' が先に記述されているため、e 、f は無視され、q には 0 が出力され続けます。

ちなみに FPGA が起動したとき、フリップフロップの値が H 、L どちらになっているかは決まっていません。そのため図で q はリセットがかかるまではどちらの値かわかりません（不定）。

5.7.1 同期、非同期
^^^^^^^^^^^^^^^^^^^^

「非同期」動作は、クロックによらず動作する箇所、「同期」動作はクロックの変化点に合わせて動作することを示しています。

先ほどのサンプルでは、リセットは非同期動作（特にこの場合は「非同期リセット」とも呼ばれる）、データの保持は同期動作としています。

.. note::

 データをクロックに同期して保持するものを一般にフリップフロップ、同期せずに保持するものをラッチと呼びます。

 これは「ディジタルコンピューティングシステム」p54 に書かれていることと逆ですが、会社などの組織毎に異なる場合があるので注意が必要です。

.. warning::

 FPGA に実装する回路において、一般にラッチは使用するべきではないとされています。

 フリップフロップを使った方が動作が予測しやすいため、デバイス自体にフリップフロップが組み込まれています。それに対しラッチは大規模回路では動作の予測が難しく、バグの元になりやすいため、です。

 慣れないうちは、できる限りすべてのフリップフロップは同じクロックで動作するようにし、動作を始める前にはすべて非同期リセットを行うように組むと失敗が少なくなります。

.. note::

 「ディジタル回路」は信号レベル（縦軸）を離散的に扱います。「同期回路」は時間軸を離散的に扱うための手法と考えられます。「非同期回路」は時間軸に不確定な要因を持つことになるため、動作の安定性に影響します。

 この授業の実習では、その実習で使用するすべてのフリップフロップは同じクロックで動作させるようにします。

 これらを守るためには、上のD フリップフロップの例のようなセンシティビティリスト（信号名は回路に合わせる）、if 文の構成（非同期リセットとクロックの動作しかなく、それ以上はそのif 、elsif の中に書き足していく）を基本にしていきます。

5.7.2 if 文
^^^^^^^^^^^^^

条件分岐の基本的なもので、基本的な形は以下の通りです。

.. code-block:: vhdl

 if (CONDITION) then
   ～ EXPRESSION ～
 end if;

条件(CONDITION) が真であれば、処理(EXPRESSION) が実行されます。
複数の条件ごとに処理を分ける場合は以下のようになります。

.. code-block:: vhdl

 if (CONDITION_A) then
   ～ EXPRESSION_A ～
 elsif (CONDITION_B) then
   ～ EXPRESSION_B ～
 elsif (CONDITION_C) then
   ～ EXPRESSION_C ～
 else
   ～ EXPRESSION_OTHER ～
 end if;

条件A (CONDITION-A) が真であれば処理A (EXPRESSION-A) を実行、それ以外で条件B (CONDITION-B) が真であれば処理B (EXPRESSION-B) 、それ以外で条件C (CONDITION-C) が真であれば処理C (EXPRESSION-C)、それ以外ではその他の処理(EXPRESSION-OTHERS) を実行します。

.. note::

 一般のプログラミング言語と異なり、「else if」ではなく「elsif」と書きます。

条件の書き方は、たとえば一致判定では

.. code-block:: vhdl

 reset = '1'

数値の大小の比較では、

.. code-block:: vhdl

 count >= "1010"

となります。

条件は複数組み合わせることができ、そのときは and 、or 、not も使用できます。

たとえば

.. code-block:: vhdl

 a = '1' and b = '0'

とすれば、２つの条件が満たされた場合、と判定されます。
クロックの変化点での動作、つまり同期動作について括る場合の条件は、

.. code-block:: vhdl

 clock'event and clock = '1'

が一般的となります。これは clock の変化点と、clock が H という２つの条件のANDとなります。

.. note::

 上記のような、クロックの変化点での動作の記述は、一つの if 文で複数書いても文法上は問題ありませんが、実際のデバイス上でそのような動作は行うことができません。

一般に process 文の最初の if 文の構成は最大で

.. code-block:: vhdl

 process (set, reset, clock)
 begin
   if (reset = '1') then
     ～
   elsif (set = '1') then
     ～
   elsif (clock'event and clock = '1') then
     ～
   end if ;
 end process;

となります。

リセット時、セット（プリセット）時、その他通常動作時を同じレベルで設定しています。

以下の書き方は許容されますが、理解できていないうちは行うべきではありません。

.. code-block:: vhdl

 process (clock)
 begin
   if (clock'event and clock = '1') then 
     ～
   end if;
 end process;
 process (clock)
 begin
   if (clock'event and clock = '0') then 
     ～
   end if;
 end process;

同じクロックで動作する書き方ですが、1 = クロックの立ち上がりと 0 = クロックの立ち下がりが混在しています。この２つの process 文の間でデータのやりとりがあるとき、デバイス上での動作条件が厳しくなります。

以下の書き方は実機には基本的には組み込めません。

.. code-block:: vhdl

 process (clock)
 begin
   if (clock'event and clock = '1') then
     ～
   elsif (clock'event and clock = '0') then
     ～
   end if;
 end process;

同じ process 文内で、同じクロックの 1 = クロックの立ち上がりと 0 = クロックの立ち下がりが混在しています。同じ signal に対してこのような動作は指示できません。それぞれの処理に異なる signal を入れれば組み込むことはできますが、一つ前の例と同様使うべきではありません。

5.7.3 マルチソース
^^^^^^^^^^^^^^^^^^^^

HDL では、基本的に全ての行が、常に「同時」に動作していると考える必要があります。この点が、ソースコードを逐次解釈していくソフトウェアと大きく異なる点です。

これにより、signal や port への値の代入の仕方に制限があります。

.. code-block:: vhdl

 architecture rtl of test is
   signal a : std_logic;
 begin
   a <= '0';
   a <= '1';
 end rtl;

ソフトウェアであればこの場合、a に 0 が代入された後でさらに a に 1 が代入されます。
しかし HDL の場合、0 と 1 の代入は同時に行おうとし、論理合成の段階でエラーとなります（エラーメッセージには multi source という言葉が含まれます）。

.. code-block:: vhdl

 entity x is
   port (
     d1 : in std_logic;
     d2 : in std_logic;
     clk : in std_logic;
     q : out std_logic
   ) ;
 end x;

 architecture rtl of x is
   signal a : std_logic;
 begin
   a_proc : process (clk)
   begin
     if (clk'event and clk = '1') then
       a <= d1;
     end if;
   end process;

   b_proc : process (clk)
   begin
     if (clk'event and clk = '1') then
       a <= d2;
     end if;
   end process;

   q <= a;

 end rtl;

別々の process 文で動作させていても、同じ signal に代入しようとしているため、両方の条件が必ず衝突しない書き方出ない限り論理合成でエラーになります（そしてそのように書いたとしても不具合の修正なので書き換えているうちに条件が崩れ multi source のエラーになりやすいです）。

.. code-block:: vhdl

 entity x is
   port (
     d1 : in std_logic;
     d2 : in std_logic;
     clk : in std_logic;
     q : out std_logic
   ) ;
 end x ;

 architecture rtl of x is
   signal a : std_logic;
 begin
   a proc : process (clk)
   begin
     if (clk'event and clk = '1') then
       a <= d1;
     end if;
   end process;

   a <= d2;
   q <= a;

 end rtl;

このような process 文での順序回路と、通常の組み合わせ回路でも同様です。

5.7.4 process 文、if 文によるフリップフロップの記述のお約束
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

この教科書ではこの先順序回路を多く使用します。その際、後々のトラブルを避けるため、以下のような書き方を避けることをおすすめします。

.. code-block:: vhdl

 process (reset, clock, a, b)
 begin
   if (reset = '1') then
     ～ RESET-PROCEDURE ～
   elsif (clock'event and clock = '1' and a = '1') then
     ～ PROCEDURE-A ～
   elsif (clock'event and clock = '1' and b = '1') then
     ～ PROCEDURE-B ～
   end if;
 end process;

どうやら、リセット処理(RESET-PROCEDURE)、クロックに同期した上で a が 1 の時の処理(PROCEDURE-A)、クロックに同期した上で b が 1 の時の処理(PROCEDURE-B)を行いたいらしい。

このような場合は以下のように、クロックによる動作と論理を分離して記述すると良いでしょう。

.. code-block:: vhdl

 process (reset , clock)
 begin
   if (reset = '1') then
     ～ RESET PROCEDURE ～
   elsif (clock'event and clock = '1') then
     if (a = '1') then
       ～ PROCEDURE A ～
     elsif (b = '1') then
       ～ PROCEDURE B ～
     end if;
   end if;
 end process ;

クロックの条件に追加で書いていると、この授業のレベルではその箇所でミスをしやすくなります。

またクロックの条件と分離することで、他へのコピー＆ペーストでのミスも減ります。

このほか、以下の箇所で代入を行っても、意図した動作にならない可能性が高いです。

.. code-block:: vhdl

 process (reset , clock)
 begin
   if (reset = '1') then
     ～ RESET PROCEDURE ～
   elsif (clock'event and clock = '1') then
     ～ MAIN PROCEDURE ～
   end if;
   a <= b;
 end process;

a へ b を代入していますが、この位置ではセンシティビティリストに入る reset と clock の条件を無視した位置にあるため、どのような動作になるか保証できません。

process 文の外か、if 文の中に入れましょう。

5.7.5 演習
^^^^^^^^^^^^

プロジェクト名 vhdl05

D フリップフロップを作る

.. literalinclude:: sources/vhdl05.vhd
  :language: vhdl

ヒント

"--"（マイナス２個）以降は改行までコメントとして無視されます。

この例では、sw1 をデータ入力、sw2 をクロック、sw3 をリセットとして使用しています。

シグナル d を D フリップフロップの実態という意味で定義しています。

sw3 を H にすると、フリップフロップをリセットします。

sw2 が H に変化したタイミング（立ち上がりエッジ）で、sw1 の内容を d へ代入します。そのほかのタイミングでは sw1 の変化の影響を受けません。

process 文内の処理は sw2 と sw3 の変化でしか行われないため、センシティビティリストには sw2 と sw3 しか書いていません。

led1 には d の内容を出力しています。

.. only:: not latex

 .. figure:: figure/figure13.png
  :align: center

.. only:: latex

 .. figure:: figure/figure13.eps
  :align: center


動作確認

#. sw1、sw2、sw3 をすべてOFF にする。
#. まず sw3 を ON → OFF して、リセットする。
#. sw2 を ON → OFF して、led1 が変化しないことを確認する。（入力データ sw1 が OFF なので、OFF のデータを改めてサンプルするだけ）
#. sw1 を ON にする。
#. sw2 を ON → OFF して、 led1 が変化することを確認する。
#. sw1 を OFF にしても led1 が変化しないことを確認する。
#. sw2 を ON → OFF して、 led1 が変化することを確認する。

5.7.6 課題
^^^^^^^^^^^^

プロジェクト名 vhdl06

下記のソースコードに追記して、JK フリップフロップを作れ

.. literalinclude:: sources/vhdl06.vhd
  :language: vhdl

２箇所の"put code below" から"put code above" の間にコードを書いてください。

ソースコード中で指定しているようなスイッチのアサインで、JK フリップフロップを作成してください。

.. only:: not latex

 .. figure:: figure/figure14.png
  :align: center

.. only:: latex

 .. figure:: figure/figure14.eps
  :align: center

.. csv-table:: 真理値表
 :header-rows: 1

 "sw2 (clock)", "sw1(J)", "sw3(K)", "led1(Q → jk)"
 "↑以外", "X", "X", "維持"
 "↑", "0", "0", "維持"
 "↑", "1", "0", "1"
 "↑", "0", "1", "0"
 "↑", "1", "1", "反転"

動作確認は以下の通り行います。

#. sw1 ～ sw4 を OFF にする。
#. sw4 を ON → OFF として、リセットする（led1 が点灯する）。
#. sw1 を ON → OFF として、led1 が変化しないことを確認する（J だけ動かしている）。
#. sw3 を ON → OFF として、led1 が変化しないことを確認する（K だけ動かしている）。
#. sw1 を ON にし、sw2 を ON → OFF として、led1 が消灯することを確認する。
#. sw1 を OFF にし、sw2 を ON → OFF としても、led1 が消灯したままであることを確認する。
#. sw3 を ON にし、sw2 を ON → OFF として、led1 が点灯することを確認する。
#. sw3 を OFF にし、sw2 を ON → OFF としても、led1 が点灯したままとなることを確認する。
#. sw1 、sw3 を ON にし、sw2 を ON → OFF として、led1 が消灯することを確認する（注記参照）。
#. sw1 、sw3 を ON にしたままで、sw2 を ON → OFF として、led1 が点灯することを確認する（注記参照）。

.. note::

 最後の２つは、想定通りに動いたり、動かなかったりする。これは後述するチャタリングが原因。

5.8 カウンタ
==============

フリップフロップはクロックに合わせて値を保持します。複数ビットのフリップフロップの組み合わせの出力に加算器を接続し、その結果をフリップフロップに戻すことで、次のクロックでは加算後の結果が保持されます。

加える値が１であれば、１ずつ増えていくカウンタとなります。

.. only:: not latex

 .. figure:: figure/figure15.png
  :align: center

.. only:: latex

 .. figure:: figure/figure15.eps
  :align: center

プロジェクト名 vhdl07

.. literalinclude:: sources/vhdl07.vhd
  :language: vhdl

クロックはあらかじめ、32MHz を選択しておきます（JP3、JP4、JP5 のうち JP5 だけショートさせる）。

カウンタの信号は c で、process 文 count の中でクロックの立ち上がりエッジの度に１を加えます。

c の幅は 25bit なので、0 ～ 33,554,431 までの値を扱うことができます。入力しているクロックが 32MHz なので、約２秒で一周するよう、LED が点灯します。

LED には、上位 8bit のみ表示しています。

この記述では、ソフトウェアの for や while のようなループが書かれていませんが、センシティビティリストの gclk0 の変化 = クロックの変化毎にプロセス文の記述が呼び出されるため、自動的に繰り返し実行されます。

5.9 分周回路と T フリップフロップ
===================================

5.9.1 分周回路
^^^^^^^^^^^^^^^^

カウンタを応用した回路構成の一つで、元の周波数の整数分の１の周波数を作り出します。

２分周（ 1/2 の周波数）、４分周（ 1/4 の周波数）、８分周（ 1/8 の周波数）の例を図に示します。

.. only:: not latex

 .. figure:: figure/figure16.png
  :align: center

.. only:: latex

 .. figure:: figure/figure16.eps
  :align: center

２分周を超える場合、作られる信号の形は２つのパターンがあります。

一つは、デューティー比（ H レベルとL レベルの期間の比）ができるだけ５０：５０になるよう近づけたパターン。

もう一つは、作り出した周期の中で１クロック分だけH レベルとし、残りはL とするパターン。

通常デバイス内では後者、デバイスの外では前者が使われることが多いです。

４分周の２つめのパターンの例を以下に示します。

プロジェクト名 vhdl08

.. literalinclude:: sources/vhdl08.vhd
  :language: vhdl

この中で c は１０進数で０～３までカウントし、r にはそのうち３のときだけ '1' がセットされます。その反転による LED の点灯がされるため、gclk0 32MHz で４周期のうち１サイクルだけ点灯することになり、結果として単純に点灯している led2 に比べ led1 が暗くなります。

.. only:: not latex

 .. figure:: figure/figure17.png
  :align: center

.. only:: latex

 .. figure:: figure/figure17.eps
  :align: center

5.9.2 課題
^^^^^^^^^^^^

プロジェクト名 vhdl09

約１秒周期でled1 の点灯、消灯を繰り返す回路を作れ
（約0.5 秒点灯、約0.5 秒消灯を繰り返す）

.. literalinclude:: sources/vhdl09.vhd
  :language: vhdl

分周回路と T フリップフロップ（のような動作）を組み合わせて作成します。基板上、JP5 のジャンパをショートし、gclk0 の周波数を 32MHz に設定します。分周回路は、１クロックだけ H レベルを作るような構成にする必要があります。先ほどの分周回路では "11" と比較していたところを、今回は (2^25)-1 、つまり"111111111111111111111111"と比較することになります。このときに r を 1 にセットします。

T フリップフロップは単純で、入力信号が 1 であれば反転、0 であればデータを維持します。

r は、32MHz を 33,554,431 回カウントする毎に 1 になるため、そのたびに t が反転されます。それを led1 に出力すれば、目的の回路ができあがります。

5.10 積分回路とチャタリング除去
=================================

機械的なスイッチは、切り替えたときに信号の状態が不安定な期間があります。

.. only:: not latex

 .. figure:: figure/figure18.png
  :align: center

.. only:: latex

 .. figure:: figure/figure18.eps
  :align: center

この不安定な期間は数ms 程度続く場合もあります。人間にとっては感知できないほど短い時間ですが、FPGA は動作が十分速いため、この細かい変化を検出し、反応してしまいます。たとえば課題 vhdl06 ではこれにより不安定な動作となっています。

そのため、それを除去する回路を組み込む必要があります。これには積分回路を応用します。

.. only:: not latex

 .. figure:: figure/figure19.png
  :align: center

.. only:: latex

 .. figure:: figure/figure19.eps
  :align: center

積分回路は基本的にはカウンタです。入力を単純に加算していきます。これを応用し、H が入力されている間は上限まで加算（上限まで来たら値を維持）、一度でも L が来たら値をクリアします。

この応用した回路に、スイッチからの信号を入力します。スイッチを切り替えない期間では、カウンタの値は０か最大のいずれかで安定します。

スイッチを切り替えた時、入力は H と L が激しく切り替わります。応用した回路では入力の H が一定期間維持されると H を出力するよう動作しますので、この「一定期間」が数ミリ秒となるようなカウンタの最大値を設定すれば良いことになります。

.. only:: not latex

 .. figure:: figure/figure20.png
  :align: center

.. only:: latex

 .. figure:: figure/figure20.eps
  :align: center

応用回路はたとえば以下のようなソースになります。clock は積分していくサイクル、sw1 がチャタリングのあるスイッチからの入力、r がチャタリング除去後の出力です。

.. code-block:: vhdl

 process (clock)
 begin
   if (clock'event and clock = '1') then
     if (sw1 = '0') then
       c <= "000000000000000";
     elsif (c /= "111111111111111") and (sw1 = '1')) then
       c <= c + 1;
     end if;

     if (c = "111111111111111") then
       r <= '1';
     else
       r <= '0';
     end if;
   end if;
 end process;

最初のif 文では、カウンタによる積分回路を構成しています。

スイッチが離されたら（sw1 = '0'）カウンタの値は即０とします。

スイッチが押された場合（sw1 = '1'）、カウンタがいっぱいでなければ（c /= "111111111111111"、"/="は"一致していない" の意味）カウントします（c <= c + 1）。

このカウンタは、スイッチが押されれば、カウンタのビットがすべて１になるまでカウントを続け、離されるとすぐにすべて０に戻します。

スイッチからの信号が不安定な状態では、少しでも０がくればカウンタも０に戻されますが、十分安定すれば最後までカウントします。

32MHz であれば１周期は約 31nｓなので、15bit で 32000 回カウントすれば約１ｍｓになります。スイッチが約１ｍｓ安定すれば、最後までカウントされることになります。

次の if 文では、前のカウンタが最後までカウントされたら１、それ以外は０を出力します。スイッチ入力が安定したことを判定することができます。

このままでは１ｍｓしか対応できないため、チャタリングが除去し切れていないように見える場合はカウンタのビットを追加する必要があります。

5.11 微分回路
===============

人間や機械からの信号= 遅い信号と高速な内部の回路とのインタフェースをしやすくする回路です。

たとえばスイッチを動かす度に LED の点灯、消灯を切り替えたいとします。タイミングチャートは以下のようなものです。

.. only:: not latex

 .. figure:: figure/figure21.png
  :align: center

.. only:: latex

 .. figure:: figure/figure21.eps
  :align: center

スイッチ入力をクロックとしてT フリップフロップに入力できれば実現できますが、同期動作ではないためトラブルの原因になりやすく、採用できません。

出力の信号を生成しているフリップフロップのクロックが十分遅ければやはり T フリップフロップで対応できそうですが、今回のボードに限らず通常は MHz 級の動作周波数ですのでそのような動作はできません。

.. only:: not latex

 .. figure:: figure/figure22.png
  :align: center

.. only:: latex

 .. figure:: figure/figure22.eps
  :align: center

スイッチ入力の変化点を検出する回路ができれば、T フリップフロップでも望みの動作が可能になります。

.. only:: not latex

 .. figure:: figure/figure23.png
  :align: center

.. only:: latex

 .. figure:: figure/figure23.eps
  :align: center

変化点を検出するため、微分回路と呼ばれる回路を使用します。

.. only:: not latex

 .. figure:: figure/figure24.png
  :align: center

.. only:: latex

 .. figure:: figure/figure24.eps
  :align: center

原理は簡単で、フリップフロップ２段を通して１クロックずつ遅延した信号の間の特定の差だけを抽出します。

実際の回路は以下のようになります。

.. only:: not latex

 .. figure:: figure/figure25.png
  :align: center

.. only:: latex

 .. figure:: figure/figure25.eps
  :align: center

5.11.1 演習
^^^^^^^^^^^^^

プロジェクト名vhdl10

スイッチを押す度にLED の点灯、消灯を切り替える回路を作る。

.. literalinclude:: sources/vhdl10.vhd
  :language: vhdl

diff proc とその直後の s への代入が微分回路になります。

5.12 １０進カウンタ
=====================

5.12.1 課題
^^^^^^^^^^^^^

プロジェクト名 vhdl11

０～９まで、１秒間に１ずつカウントする、１０進カウンタを作れ。カウント値は９の次は０に戻る。
signal r は１秒に１回、１サイクルだけH レベルになる信号となる。
led1 が点滅する場合は誤りがある。

.. literalinclude:: sources/vhdl11.vhd
  :language: vhdl

７セグメント LED の点灯パターンはコードの通りになる、LED の配置は図のようになっています。port に L を出力すると、電位差で電流が流れLED が点灯します。

.. only:: latex

 .. figure:: figure/figure26.eps
  :align: center

5.13 階層設計
===============

規模が大きくなってくると、すべてのコードを一つのarchitecture に書ききることが問題になります。そのためコードを機能ブロック毎に分割し呼び出すことができるようになっています。
例を以下に示します。

.. code-block:: vhdl

 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;

 entity Y_child is
   port (
   ～ PORT_DEFINITION(CHILD) ～
   );
 end Y child ;

 architecture A_Y_child of Y_child is
   ～ SIGNAL_DEFINITION(CHILD) ～
 begin
   ～ EXPRESSIONS(CHILD) ～
 end A Y chi ld ;


 library ieee ;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;

 entity X_parent is
   port (
     ～ PORT_DEFINITION(PARENT) ～
   );
 end X_parent;

 architecture A_X_parent of X_parent is

   component Y_child
     port (
       ～ PORT_DEFINITION(CHILD) ～
     );
   end component;

   ～ SIGNAL_DEFINITION(PARENT) ～

 begin

   i_Y_child : Y_child
     port map (
       ～ PORT_CONNECTION(CHILD PARENT) ～
     );

   ～ OTHER_EXPRESSIONS(PARENT) ～

 end A_X_parent;

処理を抜き出した、他から呼び出される側の entity は、通常通り作成します。

処理を呼び出す場合は２段階の手続きがあります。

まず architecture から begin までの間で、component 宣言を行います。ここで、呼び出す entity はすべて宣言します。

次に begin の後で、実際に呼び出します。複数個呼び出すこともできますが、その場合は entity 名の前のコロンの前、インスタンス名（ここでは i_Y_child ）はそれぞれ固有のものにします。

１０進数カウンタに階層化を適用します。

.. note::

 counter10.vhd とledconv.vhd は、vhdl11b プロジェクトを作成した後、それぞれ vhdl11b.vhd と同様にfile → new → VHDL file で作成します。

counter10.vhd

.. literalinclude:: sources/counter10.vhd
  :language: vhdl

c_in は下の桁からの桁上げのリクエストを受け付けるポート、c_out は上の桁への桁上げのリクエストを出力するポート。

e_in はH レベルが入るとカウントを行うポート

ledconv.vhd

.. literalinclude:: sources/ledconv.vhd
  :language: vhdl

プロジェクト名 vhdl11b

vhdl11b.vhd

.. literalinclude:: sources/vhdl11b.vhd
  :language: vhdl

この状態で、ソースコードの関係は以下のようになります。

.. only:: latex

 .. figure:: figure/figure27.eps
  :align: center

counter10 を呼び出しているときのキーワード "i_counter1" や ledconv に対する "i_conv1" がインスタンス名となります。固有のインスタンス名をつけることで、同じ回路ブロックを複数回呼び出すことができます。

ポートの接続はこのコードのように、左辺に呼び出される回路のポート名、=> をはさんで右辺に呼び出し側の port 名または signal 名を書き、カンマで区切ります。カンマは区切りなので最後の接続の後には書きません。

5.14 状態遷移と、条件分岐 case ～ when ～
===========================================

例えばカップラーメンを食べようとした場合でも、（誰かが作ってくれる場合を除いて）手順があります。

#. カップラーメンの包装をといてふたを開けて小袋をとりだす。必要なものはここで入れる。
#. やかんに水を入れてコンロにかけて沸かす。
#. 沸騰するのを待つ。
#. 沸騰したら火を止めて、お湯をカップに注ぐ。
#. ３分（または５分）待つ。
#. 必要に応じて小袋の中身をカップに入れる。まぜる。
#. 食べてよし。

小袋が入ってなかったり電気ポットでお湯を沸かしたり、湯切りタイプだったりとバリエーションがありますが、オーソドックなものではこのように順番があり、例えば１、２は入れ替えたり並列に行ってもいいですが、基本的に手順通りに行います。

プログラミングもこういったところに似ていますが、このように手順通りに処理を行いたい場合、ソフトウェアと同様状態遷移の考え方を使います。

状態遷移は通常は図で状態間のつながりを描きながら設計をし、ソースコードには人間が考えながら書き込むしかありません（図を描くことでソースコードを出力してくれるツールもあります）。

ソースコード上で、各「状態」を数字で表しながらコーディングすることもできますが、各「状態」に名前をつけて管理しやすくすることができます。

（ C 言語のenum と同じような働きです）

使い方はたとえば以下のようになります。

.. code-block:: vhdl

 type RAMEN is (MAKE_READY_CUP, BOILWATER, POURWATER, WAIT_MINUTES, READY_TO_EAT);
 signal ramen_stat : RAMEN;
 begin
   ramen_stat <= MAKEREADY;

１行目では RAMEN という型を新しく定義しています。この型のとりうる値は"MAKE_READY_CUP"以降の５種類です。

２行目では、RAMEN の型の signal 、ramen_stat を宣言します。

ramen_stat には MAKE_READY_CUP など、定義した名前を代入したり、if 文で比較したりすることができます。ただし勝手に作った型ですので、そのままでは port から出力しても使えませんし、例えば LED の点灯パターンに対しては全く対応がとれないため使えません。あくまで内部で使うのが基本です。

このようにしなくても、自分でこれらの状態を管理すれば、たとえば integer の signal ででも管理できます。ただしわかりやすい名前をつけることで、ソースコードが理解しやすくなります。

5.15 条件分岐 case ～ when ～
===============================

.. note::

 case 文はprocess 文の中でのみ使用できます。

 状態遷移専用ではありませんが、case 文はよく組み合わされて使われます。基本的な形は以下の通りです。

.. code-block:: vhdl

 case (CONDITION_SIGNAL) is
   when (VALUE_A) => ～ EXPRESSION A ～
   when (VALUE_B) => ～ EXPRESSION B ～
   when others => ～ EXPRESSION OTHER ～
 end case;

ある一つの signal の値毎に処理を分岐させることができます。処理は、次の when まで何行でも書くことができます。

5.15.1 演習
^^^^^^^^^^^^^

スイッチによって、特定のLED を点灯させる回路を作る。
* LED1 が点灯している場合、sw2 を操作することでLED1 が消灯し、LED2 が点灯する。
* LED2 が点灯している場合、sw1 を操作することで、LED2 が消灯し、LED1 が点灯する。sw2 を操作した場合は、LED2 が消灯し、LED3 が点灯する。
* LED3 が点灯している場合、sw1 を操作することで、LED3 が消灯し、LED2 が点灯する。

swfilter.vhd

.. literalinclude:: sources/swfilter.vhd
  :language: vhdl

プロジェクト名 vhdl12

vhdl12.vhd

.. literalinclude:: sources/vhdl12.vhd
  :language: vhdl

case 文とは関係ありませんが、swlter はsw にスイッチからの信号を接続し、sw outにチャタリング除去後の信号を出力する回路ブロックです。

5.16 ストップウォッチ
=======================

1/100 秒単位のストップウォッチを実装する。

表示は４桁の７セグLED で行い、１０進数のカウントで、99.99 秒までカウントできること。

5.16.1 課題：最小限の構成
^^^^^^^^^^^^^^^^^^^^^^^^^^^

ラップ・スプリット機能の無いストップウォッチを実装する。

操作は２つのスイッチで行う。

スタート・ストップ押す毎にカウント動作とストップを切り替える。

カウント動作中に押してストップした後、再度押した場合、続きからカウント動作を行う。

リセット押すとカウントしていた値をクリアする。

カウント動作中に押した場合の動作は定義しない（どのように動作してもよい）。

99.99 秒の次のカウントは未定義（どのように動作してもよい）。

5.16.1.1 ヒント
"""""""""""""""""

vhdl11b の１０進カウンタcounter10 、7 セグLED への変換を行う ledconv 、vhdl12のチャタリング除去回路 swfilter が応用できる。

今カウント中なのか止まっているのか、判定する signal を作って制御する。

5.16.2 課題：応用
^^^^^^^^^^^^^^^^^^^

ラップ、またはスプリット、または両方の機能のついたストップウォッチを実装する。

操作は２つのスイッチで行う。

スタート・ストップ押す毎にカウント動作とストップを切り替える。

カウント動作中に押してストップした後、再度押した場合、続きからカウント動作を行う。

ラップ/スプリット・リセット押したときの動作状況に合わせて、このスイッチの動作も変化する。

カウントがストップしている時に押すとリセット動作として、カウントしていた値をクリアする。

カウント動作中に押すとスプリット動作として、表示している値を止める。カウント動作は継続する。

スプリット状態で再度押した場合、カウントしている値の表示を再開する。

カウント動作中にスイッチを押して表示を止め、ストップボタンでカウントを停止しても表示は維持する。

その状態でこのスイッチを押すと、カウントがストップした値を表示する。

この状態でもう一度このスイッチを押すと、カウントはクリアする（リセット）その前にスタートのスイッチを押すと、その値からカウントを再開する。

ラップの場合、ボタンを押すと表示している値をとめ、カウントは０から再開する。

ラップ機能、スプリット機能を両方実装する場合は、スイッチの一つをモードの切り替えに割り振る。

99.99 秒の次のカウントは00.00 秒とする。

5.16.2.1 ヒント
"""""""""""""""""

現在どの状況にいるのかを保持するシグナルか状態遷移を応用する。

5.16.3 その他課題
^^^^^^^^^^^^^^^^^^^

タイマーを作成する。

表示は、上位２桁が「分」、下位２桁が「秒」とする。

第一段階は、決められた時間（たとえば３分など）のカウントダウンを行う。０までカウントダウンが完了したらそこで停止する。

リセットするとカウントする時間をリロードする。

第二段階は、カウントする時間を２つから選べるようにする（たとえば３分と５分）。

最後は、任意の時間を設定できるようにする。

