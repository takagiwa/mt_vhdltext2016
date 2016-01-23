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

プロジェクト名vhdl01

スイッチ入力に対して論理演算を行い、結果を LED に出力します。

.. code-block:: vhdl

 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;

 entity vhdl01 is
 port (
   sw1  : in std_logic;
   sw2  : in std_logic;
   led1 : out std_logic;
   led2 : out std_logic;
   led3 : out std_logic;
   led4 : out std_logic;
   led5 : out std_logic
 );
 end vhdl01;

 architecture rtl of vhdl01 is
 begin
   led1 <= sw1;
   led2 <= sw2;
   led3 <= sw1 and sw2;
   led4 <= sw1 or sw2;
   led5 <= not sw1;
 end rtl;

このコードで出力される回路は図のようなものになります。

スイッチは基板奥の方（７セグLED 側）に倒すとH 、手前でL のレベルになります。
LED に対してはデバイスからH を与えると消灯、L を与えると点灯します。
たとえばled1 はスイッチ１番を奥に倒すと消灯、手前に倒すと点灯します。led5 は逆の点灯の仕方になります。

5.3 数値演算
==============

5.3.1 演習
^^^^^^^^^^^^

プロジェクト名vhdl02

スイッチ入力に対して数値演算を行い、LED に表示します。

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl02 i s
por t (
sw1 : in s t d l o g i c ;
sw2 : in s t d l o g i c ;
sw3 : in s t d l o g i c ;
sw4 : in s t d l o g i c ;
sw5 : in s t d l o g i c ;
sw6 : in s t d l o g i c ;
sw7 : in s t d l o g i c ;
sw8 : in s t d l o g i c ;
l ed1 : out s t d l o g i c ;
l ed2 : out s t d l o g i c ;
l ed3 : out s t d l o g i c ;
l ed4 : out s t d l o g i c ;
l ed5 : out s t d l o g i c ;
l ed6 : out s t d l o g i c ;
l ed7 : out s t d l o g i c ;
l ed8 : out s t d l o g i c ;
s l ed1 a : out s t d l o g i c ;
s l ed1b : out s t d l o g i c ;
s l e d 1 c : out s t d l o g i c ;
s l ed1d : out s t d l o g i c ;
s l e d 1 e : out s t d l o g i c ;
s l e d 1 f : out s t d l o g i c ;
s l ed1 g : out s t d l o g i c ;
s l ed2 a : out s t d l o g i c ;
s l ed2b : out s t d l o g i c ;
s l e d 2 c : out s t d l o g i c ;
s l ed2d : out s t d l o g i c ;
s l e d 2 e : out s t d l o g i c ;
s l e d 2 f : out s t d l o g i c ;
s l ed2 g : out s t d l o g i c
) ;
end vhdl02 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl02 i s
s i g n a l s sw1 : s t d l o g i c ;
s i g n a l s sw2 : s t d l o g i c ;
s i g n a l s sw3 : s t d l o g i c ;
s i g n a l s sw4 : s t d l o g i c ;
s i g n a l s sw5 : s t d l o g i c ;
s i g n a l s sw6 : s t d l o g i c ;
s i g n a l s sw7 : s t d l o g i c ;
s i g n a l s sw8 : s t d l o g i c ;
s i g n a l sw : s t d l o g i c v e c t o r (8 downto 1) ;
s i g n a l add : s t d l o g i c v e c t o r (4 downto 1) ;
s i g n a l sub : s t d l o g i c v e c t o r (4 downto 1) ;
s i g n a l l ed71 : s t d l o g i c v e c t o r (6 downto 0) ;
s i g n a l l ed72 : s t d l o g i c v e c t o r (6 downto 0) ;
begin  f i x p o l a r i t y
 r e v i s i o n 2
s sw1 <= sw1 ;
s sw2 <= sw2 ;
s sw3 <= sw3 ;
s sw4 <= sw4 ;
s sw5 <= sw5 ;
s sw6 <= sw6 ;
s sw7 <= sw7 ;
s sw8 <= sw8 ;
 r e v i s i o n 1 ( no r e v i s i o n )
s sw1 <= not sw1 ;
s sw2 <= not sw2 ;
s sw3 <= not sw3 ;
s sw4 <= not sw4 ;
s sw5 <= not sw5 ;
s sw6 <= not sw6 ;
s sw7 <= not sw7 ;
s sw8 <= not sw8 ;
   l e f t 4 swi t che s & r i g h t 4 swi t che s
   l e f t swi t ch i s MSB
sw <= s sw1 & s sw2 & s sw3 & s sw4 & s sw5 & s sw6 & s sw7 & s sw8 ;
add (4 downto 1) <= sw(8 downto 5) + sw(4 downto 1) ;
sub (4 downto 1) <= sw(8 downto 5)   sw(4 downto 1) ;
   make 7 s eg LED b i t map
l ed71 <= " 0010000 " when ( add = " 1001 " )
e l s e " 0000000 " when ( add = " 1000 " )
e l s e " 1111000 " when ( add = " 0111 " )
e l s e " 0000010 " when ( add = " 0110 " )
e l s e " 0010010 " when ( add = " 0101 " )
e l s e " 0011001 " when ( add = " 0100 " )
e l s e " 0110000 " when ( add = " 0011 " )
e l s e " 0100100 " when ( add = " 0010 " )
e l s e " 1111001 " when ( add = " 0001 " )
e l s e " 1000000 " when ( add = " 0000 " )
e l s e " 0000110 " ;
l ed72 <= " 0010000 " when ( sub = " 1001 " )
e l s e " 0000000 " when ( sub = " 1000 " )
e l s e " 1111000 " when ( sub = " 0111 " )
e l s e " 0000010 " when ( sub = " 0110 " )
e l s e " 0010010 " when ( sub = " 0101 " )
e l s e " 0011001 " when ( sub = " 0100 " )
e l s e " 0110000 " when ( sub = " 0011 " )
e l s e " 0100100 " when ( sub = " 0010 " )
e l s e " 1111001 " when ( sub = " 0001 " )
e l s e " 1000000 " when ( sub = " 0000 " )
e l s e " 0000110 " ;
   map to pin
s l ed1 a <= l ed71 ( 0 ) ;
s l ed1b <= l ed71 ( 1 ) ;
s l e d 1 c <= l ed71 ( 2 ) ;
s l ed1d <= l ed71 ( 3 ) ;
s l e d 1 e <= l ed71 ( 4 ) ;
s l e d 1 f <= l ed71 ( 5 ) ;
s l ed1 g <= l ed71 ( 6 ) ;
s l ed2 a <= l ed72 ( 0 ) ;
s l ed2b <= l ed72 ( 1 ) ;
s l e d 2 c <= l ed72 ( 2 ) ;
s l ed2d <= l ed72 ( 3 ) ;
s l e d 2 e <= l ed72 ( 4 ) ;
s l e d 2 f <= l ed72 ( 5 ) ;
s l ed2 g <= l ed72 ( 6 ) ;
   debug
l ed1 <= not add ( 4 ) ;
l ed2 <= not add ( 3 ) ;
l ed3 <= not add ( 2 ) ;
l ed4 <= not add ( 1 ) ;
l ed5 <= not sub ( 4 ) ;
l ed6 <= not sub ( 3 ) ;
l ed7 <= not sub ( 2 ) ;
l ed8 <= not sub ( 1 ) ;
end beha v i o r a l ;

スイッチの上位４ビットと下位４ビットの演算を行います。LED の上位に加算の結果、下位に減算の結果が２進数で表示されます。
たとえばスイッチを８から１まで、10100001 （1=ON, 0=OFF）とした場合、結果は10011011 、そのままならばLED の点灯パターンは01100100 となります。

5.4 条件分岐 when ～ else ～
=============================

5.4.1 演習
^^^^^^^^^^^^

プロジェクト名vhdl03

条件分岐の書き方の一つ、when ～ else ～ の例です。

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl03 i s
por t (
sw1 : in s t d l o g i c ;
sw2 : in s t d l o g i c ;
sw8 : in s t d l o g i c ;
l ed1 : out s t d l o g i c
) ;
end vhdl03 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl03 i s
begin
l ed1 <= sw2 when ( sw8 = ' 1 ' )
e l s e sw1 ;
end beha v i o r a l ;

sw8 をH レベルにしておくと、LED1 はsw2 の操作に従って点灯します。
sw8 がL レベルの場合は、LED1 はsw1 の操作に従って点灯します。
このコードから生成される回路のイメージは次の図の通りです。
この記述ではいくつでも分岐させることができます。
ans <= x1 when ( y1 = ' 1 ' )
e l s e x2 when ( y2 = ' 1 ' )
e l s e x3 when ( y3 = ' 1 ' )
e l s e x4 when ( y4 = ' 1 ' )
e l s e x5 ;

ただし、判定は記述した順番に行われます。この例でたとえばy1 ～ y4 全てが1 だっ
た場合、y1 の条件が採用されます（プライオリティエンコーダ＝選択肢に優先順位のあるセレクタ）。

5.5 条件分岐 with ～ select ～ when ～
=======================================

5.5.1 演習
^^^^^^^^^^^^

プロジェクト名vhdl04

条件分岐の書き方の一つ、with ～ select ～ when ～ の例です。

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl04 i s
por t (
sw1 : in s t d l o g i c ;
sw2 : in s t d l o g i c ;
sw3 : in s t d l o g i c ;
sw7 : in s t d l o g i c ;
sw8 : in s t d l o g i c ;
l ed1 : out s t d l o g i c
) ;
end vhdl04 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl04 i s
s i g n a l sw : s t d l o g i c v e c t o r (1 downto 0) ;
begin
sw <= sw8 & sw7 ;
with sw s e l e c t l ed1 <= sw3 when "11" ,
sw2 when "10" ,
sw1 when "01" ,
'0 ' when o the r s ;
end beha v i o r a l ;

sw7 とsw8 の設定により、LED の点滅を制御できるスイッチを切り替えられる回路です。
このコードから生成される回路のイメージは次の通りです。
中央のブロックはセレクタで、上から入力される値がブロック中の値と一致すると、そ
の箇所の信号が出力されます。

5.6 process 文
================

AND、OR、NOT などの組み合わせ回路や単純な条件分岐であればこれまでの内容で対応できますが、フリップフロップなどを組み合わせた順序回路を記述するには、process文を使用します。

ヒント

フリップフロップ専用の記述ではありませんが、フリップフロップを使用する箇所のみ
process 文を使うようにしていると、慣れていないうちはトラブルを避けやすくなります。
基本的な構成は以下の通りです。
LABEL : pr o c e s s (SENSITIVITY LIST)
begin
~ EXPRESSION ~
end pr o c e s s ;

ラベル(LABEL) を付加するかどうかは任意ですが、識別のために固有の名前をつけておくのがよいでしょう。
センシティビティリスト(SENSITIVITY-LIST) は、このprocess 文を動作させるトリガになる信号のリストを記述します。
信号名はカンマで区切ります。
式(EXPRESSION) の部分には実際の動作を記述します。ただし条件分岐は、これまでのwhen ～ else ～ やwith ～ select ～ when ～ は使用できません。後ほどでてくるif 文やcase 文を使用します（逆にif 　文やcase 文はprocess 文の外では使用できません）。
表5.1 組み合わせ
process 文のwhen ～ else ～ with ～ select ～ when ～ if ～ elsif ～ endif case ～ end case
外○ ○ × ×
中× × ○ ○

5.7 フリップフロップの基本と if 文
====================================

フリップフロップは主にD 型、SR 型、JK 型、T 型があります。これらをVHDL で記述するときは一般にprocess 文を使用します。
フリップフロップのリセットが非同期式の場合、D フリップフロップは以下のように記述します。

D FF: pr o c e s s ( r e s e t , c l o c k )
begin
i f ( r e s e t = ' 1 ' ) then
q <= ' 0 ' ;
e l s i f ( c lock ' event and c l o c k = ' 1 ' ) then
q <= d ;
end i f ;
end pr o c e s s ;

この例では、すべての信号はstd logic で定義されているとします。
入力データは信号はd 、出力データ信号はq としています。
reset にH レベルの信号を与えるとリセット動作として、q をL レベルにセットしています。
クロック信号clock がH へ変化すると、q へd を代入します。
動作例を以下に示します。
a の期間ではreset = '1' が成り立つのでq <= '0' が実行され続けます。
b のタイミングではclock'event and clock = '1' が成り立ちます。これは、clock が変化したこと（clock'event ）とclock = '1' の組み合わせで、clock が0 から1 に変化したときに成り立つ、という記述の仕方です。このときq <= d が実行されます。d が1 なので最終的にはq は1 になります。
c のタイミングもb のタイミング同様、clock が0 から1 に変化したことが成り立っています。q にはd の値0 が代入されます。
d の期間ではe やf のタイミングでclock'event が成り立っていますが、if 文（後述）でreset = '1' が先に記述されているため、e 、f は無視され、q には0 が出力され続けます。
ちなみにFPGA が起動したとき、フリップフロップの値がH 、L どちらになっているかは決まっていません。そのため図でq はリセットがかかるまではどちらの値かわかりません（不定）。

5.7.1 同期、非同期
^^^^^^^^^^^^^^^^^^^^

「非同期」動作は、クロックによらず動作する箇所、「同期」動作はクロックの変化点に合わせて動作することを示しています。
先ほどのサンプルでは、リセットは非同期動作（特にこの場合は「非同期リセット」とも呼ばれる）、データの保持は同期動作としています。

注記

データをクロックに同期して保持するものを一般にフリップフロップ、同期せずに保持するものをラッチと呼びます。
これは「ディジタルコンピューティングシステム」p54 に書かれていることと逆ですが、会社などの組織毎に異なる場合があるので注意が必要です。

警告

FPGA に実装する回路において、一般にラッチは使用するべきではないとされています。
フリップフロップを使った方が動作が予測しやすいため、デバイス自体にフリップフロップが組み込まれています。それに対しラッチは大規模回路では動作の予測が難しく、バグの元になりやすいため、です。
慣れないうちは、できる限りすべてのフリップフロップは同じクロックで動作するようにし、動作を始める前にはすべて非同期リセットを行うように組むと失敗が少なくなります。

注記

「ディジタル回路」は信号レベル（縦軸）を離散的に扱います。「同期回路」は時間軸を離散的に扱うための手法と考えられます。「非同期回路」は時間軸に不確定な要因を持つことになるため、動作の安定性に影響します。
この授業の実習では、その実習で使用するすべてのフリップフロップは同じクロックで動作させるようにします。
これらを守るためには、上のD フリップフロップの例のようなセンシティビティリスト（信号名は回路に合わせる）、if 文の構成（非同期リセットとクロックの動作しかなく、それ以上はそのif 、elsif の中に書き足していく）を基本にしていきます。

5.7.2 if 文
^^^^^^^^^^^^^

条件分岐の基本的なもので、基本的な形は以下の通りです。

i f (CONDITION) then
~ EXPRESSION ~
end i f ;

条件(CONDITION) が真であれば、処理(EXPRESSION) が実行されます。
複数の条件ごとに処理を分ける場合は以下のようになります。

i f (CONDITION A) then
~ EXPRESSION A ~
e l s i f (CONDITION B) then
~ EXPRESSION B ~
e l s i f (CONDITION C) then
~ EXPRESSION C ~
e l s e
~ EXPRESSION OTHER ~
end i f ;

条件A (CONDITION-A) が真であれば処理A (EXPRESSION-A) を実行、それ以外で条件B (CONDITION-B) が真であれば処理B (EXPRESSION-B) 、それ以外で条件C (CONDITION-C) が真であれば処理C (EXPRESSION-C)、それ以外ではその他の処理(EXPRESSION-OTHERS) を実行します。

注記
一般のプログラミング言語と異なり、「else if」ではなく「elsif」と書きます。
条件の書き方は、たとえば一致判定では
r e s e t = '1 '
数値の大小の比較では、
count >= " 1010 "
となります。
条件は複数組み合わせることができ、そのときはand 、or 、not も使用できます。
たとえば
a = '1 ' and b = '0 '
とすれば、２つの条件が満たされた場合、と判定されます。
クロックの変化点での動作、つまり同期動作について括る場合の条件は、
c lock ' event and c l o c k = '1 '
が一般的となります。これはclock の変化点と、clock がH という２つの条件のANDとなります。

注記

上記のような、クロックの変化点での動作の記述は、一つのif 文で複数書いても文法上は問題ありませんが、実際のデバイス上でそのような動作は行うことができません。
一般にprocess 文の最初のif 文の構成は最大で
pr o c e s s ( s e t , r e s e t , c l o c k )
begin
i f ( r e s e t = ' 1 ' ) then
~
e l s i f ( s e t = ' 1 ' ) then
~
e l s i f ( c lock ' event and c l o c k = ' 1 ' ) then
~
end i f ;
end pr o c e s s ;

となります。
リセット時、セット（プリセット）時、その他通常動作時を同じレベルで設定しています。
以下の書き方は許容されますが、理解できていないうちは行うべきではありません。

pr o c e s s ( c l o c k )
begin
i f ( c lock ' event and c l o c k = ' 1 ' ) then
~
end i f ;
end pr o c e s s ;
pr o c e s s ( c l o c k )
begin
i f ( c lock ' event and c l o c k = ' 0 ' ) then
~
end i f ;
end pr o c e s s ;

同じクロックで動作する書き方ですが、1 = クロックの立ち上がりと0 = クロックの立ち下がりが混在しています。この２つのprocess 文の間でデータのやりとりがあるとき、デバイス上での動作条件が厳しくなります。
以下の書き方は実機には基本的には組み込めません。

pr o c e s s ( c l o c k )
begin
i f ( c lock ' event and c l o c k = ' 1 ' ) then
~
e l s i f ( c lock ' event and c l o c k = ' 0 ' ) then
~
end i f ;
end pr o c e s s ;

同じprocess 文内で、同じクロックの1 = クロックの立ち上がりと0 = クロックの立ち下がりが混在しています。同じsignal に対してこのような動作は指示できません。それぞれの処理に異なるsignal を入れれば組み込むことはできますが、一つ前の例と同様使うべきではありません。

5.7.3 マルチソース
^^^^^^^^^^^^^^^^^^^^

HDL では、基本的に全ての行が、常に「同時」に動作していると考える必要があります。この点が、ソースコードを逐次解釈していくソフトウェアと大きく異なる点です。
これにより、signal やport への値の代入の仕方に制限があります。
a r c h i t e c t u r e r t l o f t e s t i s
s i g n a l a : s t d l o g i c ;
begin
a <= ' 0 ' ;
a <= ' 1 ' ;
end r t l ;
ソフトウェアであればこの場合、a に0 が代入された後でさらにa に1 が代入されます。
しかしHDL の場合、0 と1 の代入は同時に行おうとし、論理合成の段階でエラーとなります（エラーメッセージにはmulti source という言葉が含まれます）。
e n t i t y x i s
por t (
d1 : in s t d l o g i c ;
d2 : in s t d l o g i c ;
c l k : in s t d l o g i c ;
q : out s t d l o g i c
) ;
end x ;
a r c h i t e c t u r e r t l o f x i s
s i g n a l a : s t d l o g i c ;
begin
a proc : pr o c e s s ( c l k )
begin
i f ( clk ' event and c l k = ' 1 ' ) then
a <= d1 ;
end i f ;
end pr o c e s s ;
b proc : pr o c e s s ( c l k )
begin
i f ( clk ' event and c l k = ' 1 ' ) then
a <= d2 ;
end i f ;
end pr o c e s s ;
q <= a ;
end r t l ;
別々のprocess 文で動作させていても、同じsignal に代入しようとしているため、両方の条件が必ず衝突しない書き方出ない限り論理合成でエラーになります（そしてそのように書いたとしても不具合の修正なので書き換えているうちに条件が崩れmulti sourceのエラーになりやすいです）。
e n t i t y x i s
por t (
d1 : in s t d l o g i c ;
d2 : in s t d l o g i c ;
c l k : in s t d l o g i c ;
q : out s t d l o g i c
) ;
end x ;
a r c h i t e c t u r e r t l o f x i s
s i g n a l a : s t d l o g i c ;
begin
a proc : pr o c e s s ( c l k )
begin
i f ( clk ' event and c l k = ' 1 ' ) then
a <= d1 ;
end i f ;
end pr o c e s s ;
a <= d2 ;
q <= a ;
end r t l ;

このようなprocess 文での順序回路と、通常の組み合わせ回路でも同様です。

5.7.4 process 文、if 文によるフリップフロップの記述のお約束
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

この教科書ではこの先順序回路を多く使用します。その際、後々のトラブルを避けるため、以下のような書き方を避けることをおすすめします。

pr o c e s s ( r e s e t , c lock , a , b)
begin
i f ( r e s e t = ' 1 ' ) then
~ RESET PROCEDURE ~
e l s i f ( c lock ' event and c l o c k = '1 ' and a = ' 1 ' ) then
~ PROCEDURE A ~
e l s i f ( c lock ' event and c l o c k = '1 ' and b = ' 1 ' ) then
~ PROCEDURE B ~
end i f ;
end pr o c e s s ;

どうやら、リセット処理(RESET-PROCEDURE)、クロックに同期した上でa が1 の時の処理(PROCEDURE-A)、クロックに同期した上でb が1 の時の処理(PROCEDURE-B)を行いたいらしい。
このような場合は以下のように、クロックによる動作と論理を分離して記述すると良いでしょう。

pr o c e s s ( r e s e t , c l o c k )
begin
i f ( r e s e t = ' 1 ' ) then
~ RESET PROCEDURE ~
e l s i f ( c lock ' event and c l o c k = ' 1 ' ) then
i f ( a = ' 1 ' ) then
~ PROCEDURE A ~
e l s i f (b = ' 1 ' ) then
~ PROCEDURE B ~
end i f ;
end i f ;
end pr o c e s s ;

クロックの条件に追加で書いていると、この授業のレベルではその箇所でミスをしやすくなります。
またクロックの条件と分離することで、他へのコピー＆ペーストでのミスも減ります。
このほか、以下の箇所で代入を行っても、意図した動作にならない可能性が高いです。

pr o c e s s ( r e s e t , c l o c k )
begin
i f ( r e s e t = ' 1 ' ) then
~ RESET PROCEDURE ~
e l s i f ( c lock ' event and c l o c k = ' 1 ' ) then
~ MAIN PROCEDURE ~
end i f ;
a <= b ;
end i f ;

a へb を代入していますが、この位置ではセンシティビティリストに入るreset とclockの条件を無視した位置にあるため、どのような動作になるか保証できません。
process 文の外か、if 文の中に入れましょう。

5.7.5 演習
^^^^^^^^^^^^

プロジェクト名vhdl05

D フリップフロップを作る

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl05 i s
por t (
sw1 : in s t d l o g i c ;    data
sw2 : in s t d l o g i c ;    c l o c k
sw3 : in s t d l o g i c ;    r e s e t
l ed1 : out s t d l o g i c
) ;
end vhdl05 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl05 i s
s i g n a l d : s t d l o g i c ;
begin
d f f : pr o c e s s ( sw2 , sw3 )
begin
i f ( sw3 = ' 1 ' ) then
d <= ' 0 ' ;
e l s i f ( sw2 ' event and sw2 = ' 1 ' ) then
d <= sw1 ;
end i f ;
end pr o c e s s ;
l ed1 <= d ;
end beha v i o r a l ;

ヒント

"{"（マイナス２個）以降は改行までコメントとして無視されます。
この例では、sw1 をデータ入力、sw2 をクロック、sw3 をリセットとして使用しています。
シグナルd をD フリップフロップの実態という意味で定義しています。
sw3 をH にすると、フリップフロップをリセットします。
sw2 がH に変化したタイミング（立ち上がりエッジ）で、sw1 の内容をd へ代入します。そのほかのタイミングではsw1 の変化の影響を受けません。
process 文内の処理はsw2 とsw3 の変化でしか行われないため、センシティビティリストにはsw2 とsw3 しか書いていません。
led1 にはd の内容を出力しています。

動作確認

1. sw1、sw2、sw3 をすべてOFF にする。
2. まずsw3 をON → OFF して、リセットする。
3. sw2 をON → OFF して、led1 が変化しないことを確認する。（入力データsw1 がOFF なので、OFF のデータを改めてサンプルするだけ）
4. sw1 をON にする。
5. sw2 をON → OFF して、led1 が変化することを確認する。
6. sw1 をOFF にしてもled1 が変化しないことを確認する。
7. sw2 をON → OFF して、led1 が変化することを確認する。

5.7.6 課題
^^^^^^^^^^^^

プロジェクト名vhdl06

下記のソースコードに追記して、JK フリップフロップを作れ

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl06 i s
por t (
sw1 : in s t d l o g i c ;    J
sw2 : in s t d l o g i c ;    c l o c k
sw3 : in s t d l o g i c ;    K
sw4 : in s t d l o g i c ;    r e s e t
l ed1 : out s t d l o g i c
) ;
end vhdl06 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl06 i s
s i g n a l jk : s t d l o g i c ;
begin
j k f f p r o c : pr o c e s s ( sw4 , sw2 )
begin
i f ( sw4 = ' 1 ' ) then
   put code below
   put code above
e l s i f ( sw2 ' event and sw2 = ' 1 ' ) then
   put code below
   put code above
end i f ;
end pr o c e s s ;
l ed1 <= jk ;
end beha v i o r a l ;

２箇所の\put code below" から\put code above" の間にコードを書いてください。
ソースコード中で指定しているようなスイッチのアサインで、JK フリップフロップを作成してください。

表5.2 真理値表
sw2 (clock) sw1(J) sw3(K) led1(Q → jk)
↑以外X X 維持
↑ 0 0 維持
↑ 1 0 1
↑ 0 1 0
↑ 1 1 反転

動作確認は以下の通り行います。

1. sw1 ～ sw4 をOFF にする。
2. sw4 をON → OFF として、リセットする（led1 が点灯する）。
3. sw1 をON → OFF として、led1 が変化しないことを確認する（J だけ動かしている）。
4. sw3 をON → OFF として、led1 が変化しないことを確認する（K だけ動かしている）。
5. sw1 をON にし、sw2 をON → OFF として、led1 が消灯することを確認する。
6. sw1 をOFF にし、sw2 をON → OFF としても、led1 が消灯したままであることを確認する。
7. sw3 をON にし、sw2 をON → OFF として、led1 が点灯することを確認する。
8. sw3 をOFF にし、sw2 をON → OFF としても、led1 が点灯したままとなることを確認する。
9. sw1 、sw3 をON にし、sw2 をON → OFF として、led1 が消灯することを確認する（注記参照）。
10. sw1 、sw3 をON にしたままで、sw2 をON → OFF として、led1 が点灯することを確認する（注記参照）。

注記

最後の２つは、想定通りに動いたり、動かなかったりする。これは後述するチャタリングが原因。

5.8 カウンタ
==============

フリップフロップはクロックに合わせて値を保持します。複数ビットのフリップフロップの組み合わせの出力に加算器を接続し、その結果をフリップフロップに戻すことで、次のクロックでは加算後の結果が保持されます。
加える値が１であれば、１ずつ増えていくカウンタとなります。

プロジェクト名vhdl07

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl07 i s
por t (
gc lk0 : in s t d l o g i c ;
l ed1 : out s t d l o g i c ;
l ed2 : out s t d l o g i c ;
l ed3 : out s t d l o g i c ;
l ed4 : out s t d l o g i c ;
l ed5 : out s t d l o g i c ;
l ed6 : out s t d l o g i c ;
l ed7 : out s t d l o g i c ;
l ed8 : out s t d l o g i c
) ;
end vhdl07 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl07 i s
s i g n a l c : s t d l o g i c v e c t o r (24 downto 0) ;
begin
count : pr o c e s s ( gc lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
c <= c + 1 ;
end i f ;
end pr o c e s s ;
l ed8 <= not c (2 4) ;
l ed7 <= not c (2 3) ;
l ed6 <= not c (2 2) ;
l ed5 <= not c (2 1) ;
l ed4 <= not c (2 0) ;
l ed3 <= not c (1 9) ;
l ed2 <= not c (1 8) ;
l ed1 <= not c (1 7) ;
end beha v i o r a l ;

クロックはあらかじめ、32MHz を選択しておきます（JP3、JP4、JP5 のうちJP5 だけショートさせる）。
カウンタの信号はc で、process 文count の中でクロックの立ち上がりエッジの度に１を加えます。
c の幅は25bit なので、0 ～ 33,554,431 までの値を扱うことができます。入力しているクロックが32MHz なので、約２秒で一周するよう、LED が点灯します。
LED には、上位8bit のみ表示しています。
この記述では、ソフトウェアのfor やwhile のようなループが書かれていませんが、センシティビティリストのgclk0 の変化= クロックの変化毎にプロセス文の記述が呼び出されるため、自動的に繰り返し実行されます。

5.9 分周回路と T フリップフロップ
===================================

5.9.1 分周回路
^^^^^^^^^^^^^^^^

カウンタを応用した回路構成の一つで、元の周波数の整数分の１の周波数を作り出します。
２分周（ 1/2 の周波数）、４分周（ 1/4 の周波数）、８分周（ 1/8 の周波数）の例を図に示します。
２分周を超える場合、作られる信号の形は２つのパターンがあります。
一つは、デューティー比（ H レベルとL レベルの期間の比）ができるだけ５０：５０になるよう近づけたパターン。
もう一つは、作り出した周期の中で１クロック分だけH レベルとし、残りはL とするパターン。
通常デバイス内では後者、デバイスの外では前者が使われることが多いです。
４分周の２つめのパターンの例を以下に示します。

プロジェクト名vhdl08

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl08 i s
por t (
gc lk0 : in s t d l o g i c ;
l ed1 : out s t d l o g i c ;
l ed2 : out s t d l o g i c
) ;
end vhdl08 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl08 i s
s i g n a l c : s t d l o g i c v e c t o r (1 downto 0) ;
s i g n a l r : s t d l o g i c ;
begin
di v pr o c : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
c <= c + 1 ;
i f ( c = "11" ) then
r <= ' 1 ' ;
e l s e
r <= ' 0 ' ;
end i f ;
end i f ;
end pr o c e s s ;
l ed1 <= not r ;
l ed2 <= ' 0 ' ;
end beha v i o r a l ;

この中でc は１０進数で０～３までカウントし、r にはそのうち３のときだけ'1' がセットされます。その反転によるLED の点灯がされるため、gclk0 32MHz で４周期のうち１サイクルだけ点灯することになり、結果として単純に点灯しているled2 に比べled1が暗くなります。

5.9.2 課題
^^^^^^^^^^^^

プロジェクト名vhdl09

約１秒周期でled1 の点灯、消灯を繰り返す回路を作れ
（約0.5 秒点灯、約0.5 秒消灯を繰り返す）

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl09 i s
por t (
g c lk0 : in s t d l o g i c ;
l ed1 : out s t d l o g i c
) ;
end vhdl09 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl09 i s
s i g n a l c : s t d l o g i c v e c t o r (24 downto 0) ;    count e r
s i g n a l r : s t d l o g i c ;    i n v e r t t when i t i s H l e v e l
s i g n a l t : s t d l o g i c ;    T f l i p f l o p
begin
cnt pr o c : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
   put code below
   put code above
end i f ;
end pr o c e s s ;
t pr o c : pr o c e s s ( gc lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
   put code below
   put code above
end i f ;
end pr o c e s s ;
l ed1 <= t ;
end beha v i o r a l ;

分周回路とT フリップフロップ（のような動作）を組み合わせて作成します。基板上、JP5 のジャンパをショートし、gclk0 の周波数を32MHz に設定します。分周回路は、１クロックだけH レベルを作るような構成にする必要があります。先ほどの分周回路では"11" と比較していたところを、今回は(2^25)-1 、つまり"111111111111111111111111"と比較することになります。このときにr を1 にセットします。
T フリップフロップは単純で、入力信号が1 であれば反転、0 であればデータを維持します。
r は、32MHz を33,554,431 回カウントする毎に1 になるため、そのたびにt が反転されます。それをled1 に出力すれば、目的の回路ができあがります。

5.10 積分回路とチャタリング除去
=================================

機械的なスイッチは、切り替えたときに信号の状態が不安定な期間があります。
この不安定な期間は数ms 程度続く場合もあります。人間にとっては感知できないほど短い時間ですが、FPGA は動作が十分速いため、この細かい変化を検出し、反応してしまいます。たとえば課題vhdl06 ではこれにより不安定な動作となっています。
そのため、それを除去する回路を組み込む必要があります。これには積分回路を応用します。
積分回路は基本的にはカウンタです。入力を単純に加算していきます。これを応用し、H が入力されている間は上限まで加算（上限まで来たら値を維持）、一度でもL が来たら値をクリアします。
この応用した回路に、スイッチからの信号を入力します。スイッチを切り替えない期間では、カウンタの値は０か最大のいずれかで安定します。
スイッチを切り替えた時、入力はH とL が激しく切り替わります。応用した回路では入力のH が一定期間維持されるとH を出力するよう動作しますので、この「一定期間」が数ミリ秒となるようなカウンタの最大値を設定すれば良いことになります。
応用回路はたとえば以下のようなソースになります。clock は積分していくサイクル、sw1 がチャタリングのあるスイッチからの入力、r がチャタリング除去後の出力です。

pr o c e s s ( c l o c k )
begin
i f ( c lock ' event and c l o c k = ' 1 ' ) then
i f ( sw1 = ' 0 ' ) then
c <= " 000000000000000 " ;
e l s i f ( c /= " 111111111111111 " ) and ( sw1 = ' 1 ' ) ) then
c <= c + 1 ;
end i f ;
i f ( c = " 111111111111111 " ) then
r <= ' 1 ' ;
e l s e
r <= ' 0 ' ;
end i f ;
end i f ;
end pr o c e s s ;

最初のif 文では、カウンタによる積分回路を構成しています。
スイッチが離されたら（ sw1 = '0'）カウンタの値は即０とします。
スイッチが押された場合（ sw1 = '1'）、カウンタがいっぱいでなければ（ c /= "111111111111111"、"/="は"一致していない" の意味）カウントします（ c <= c + 1）。
このカウンタは、スイッチが押されれば、カウンタのビットがすべて１になるまでカウントを続け、離されるとすぐにすべて０に戻します。
スイッチからの信号が不安定な状態では、少しでも０がくればカウンタも０に戻されますが、十分安定すれば最後までカウントします。
32MHz であれば１周期は約31 n ｓなので、15bit で32000 回カウントすれば約１ｍｓになります。スイッチが約１ｍｓ安定すれば、最後までカウントされることになります。
次のif 文では、前のカウンタが最後までカウントされたら１、それ以外は０を出力します。スイッチ入力が安定したことを判定することができます。
このままでは１ｍｓしか対応できないため、チャタリングが除去し切れていないように見える場合はカウンタのビットを追加する必要があります。

5.11 微分回路
===============

人間や機械からの信号= 遅い信号と高速な内部の回路とのインタフェースをしやすくする回路です。
たとえばスイッチを動かす度にLED の点灯、消灯を切り替えたいとします。タイミングチャートは以下のようなものです。
スイッチ入力をクロックとしてT フリップフロップに入力できれば実現できますが、同期動作ではないためトラブルの原因になりやすく、採用できません。
出力の信号を生成しているフリップフロップのクロックが十分遅ければやはりT フリップフロップで対応できそうですが、今回のボードに限らず通常はMHz 級の動作周波数ですのでそのような動作はできません。
スイッチ入力の変化点を検出する回路ができれば、T フリップフロップでも望みの動作が可能になります。
変化点を検出するため、微分回路と呼ばれる回路を使用します。
原理は簡単で、フリップフロップ２段を通して１クロックずつ遅延した信号の間の特定の差だけを抽出します。
実際の回路は以下のようになります。

5.11.1 演習
^^^^^^^^^^^^^

プロジェクト名vhdl10

スイッチを押す度にLED の点灯、消灯を切り替える回路を作る。

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl10 i s
por t (
gc lk0 : in s t d l o g i c ;
sw1 : in s t d l o g i c ;
l ed1 : out s t d l o g i c
) ;
end vhdl10 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl10 i s
s i g n a l c : s t d l o g i c v e c t o r (14 downto 0) ;
s i g n a l r : s t d l o g i c ;
s i g n a l d1 : s t d l o g i c ;
s i g n a l d2 : s t d l o g i c ;
s i g n a l s : s t d l o g i c ;
s i g n a l t : s t d l o g i c ;
begin
   c h a t t e r i n g c anc e l
sum proc : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
i f ( sw1 = ' 0 ' ) then
c <= " 000000000000000 " ;
e l s i f ( ( c /= " 111111111111111 " ) and ( sw1 = ' 1 ' ) ) then
c <= c + 1 ;
end i f ;
i f ( c = " 111111111111111 " ) then
r <= ' 1 ' ;
e l s e
r <= ' 0 ' ;
end i f ;
end i f ;
end pr o c e s s ;
   d i f f e r e n c e
d i f f p r o c : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
d1 <= r ;
d2 <= d1 ;
end i f ;
end pr o c e s s ;
s <= d1 and ( not d2 ) ;
   T f l i p
f l o p t pr o c : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
i f ( s = ' 1 ' ) then
t <= not t ;
end i f ;
end i f ;
end pr o c e s s ;
l ed1 <= t ;
end beha v i o r a l ;

diff proc とその直後のs への代入が微分回路になります。

5.12 １０進カウンタ
=====================

5.12.1 課題
^^^^^^^^^^^^^

プロジェクト名vhdl11

０～９まで、１秒間に１ずつカウントする、１０進カウンタを作れ。カウント値は９の次は０に戻る。
signal r は１秒に１回、１サイクルだけH レベルになる信号となる。
led1 が点滅する場合は誤りがある。

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl11 i s
por t (
gc lk0 : in s t d l o g i c ;
l ed1 : out s t d l o g i c ;
s l ed1 a : out s t d l o g i c ;
s l ed1b : out s t d l o g i c ;
s l e d 1 c : out s t d l o g i c ;
s l ed1d : out s t d l o g i c ;
s l e d 1 e : out s t d l o g i c ;
s l e d 1 f : out s t d l o g i c ;
s l ed1 g : out s t d l o g i c
) ;
end vhdl11 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl11 i s
s i g n a l d : s t d l o g i c v e c t o r (24 downto 0) ;
s i g n a l r : s t d l o g i c ;
s i g n a l c : s t d l o g i c v e c t o r (3 downto 0) ;
s i g n a l s l e d : s t d l o g i c v e c t o r (6 downto 0) ;
s i g n a l ck : s t d l o g i c ;
begin
di v pr o c : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
d <= d + 1 ;
i f (d = " 1111010000100011111111111 " ) then
r <= ' 1 ' ;
d <= " 0000000000000000000000000 " ;
e l s e
r <= ' 0 ' ;
end i f ;
end i f ;
end pr o c e s s ;
cnt pr o c : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
   put code below
   put code above
end i f ;
end pr o c e s s ;
chk proc : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
i f ( c = " 1010 " ) then
ck <= not ck ;
end i f ;
end i f ;
end pr o c e s s ;
s l e d <= " 0010000 " when ( c = " 1001 " )
e l s e " 0000000 " when ( c = " 1000 " )
e l s e " 1111000 " when ( c = " 0111 " )
e l s e " 0000010 " when ( c = " 0110 " )
e l s e " 0010010 " when ( c = " 0101 " )
e l s e " 0011001 " when ( c = " 0100 " )
e l s e " 0110000 " when ( c = " 0011 " )
e l s e " 0100100 " when ( c = " 0010 " )
e l s e " 1111001 " when ( c = " 0001 " )
e l s e " 1000000 " when ( c = " 0000 " )
e l s e " 0000110 " ;
s l ed1 a <= s l e d ( 0 ) ;
s l ed1b <= s l e d ( 1 ) ;
50 第5 章演習
s l e d 1 c <= s l e d ( 2 ) ;
s l ed1d <= s l e d ( 3 ) ;
s l e d 1 e <= s l e d ( 4 ) ;
s l e d 1 f <= s l e d ( 5 ) ;
s l ed1 g <= s l e d ( 6 ) ;
l ed1 <= ck ;
end beha v i o r a l ;

７セグメントLED の点灯パターンはコードの通りになる、LED の配置は図のようになっています。port にL を出力すると、電位差で電流が流れLED が点灯します。

5.13 階層設計
===============

規模が大きくなってくると、すべてのコードを一つのarchitecture に書ききることが問題になります。そのためコードを機能ブロック毎に分割し呼び出すことができるようになっています。
例を以下に示します。

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y Y chi ld i s
por t (
~ PORT DEFINITION(CHILD) ~
) ;
end Y chi ld ;
a r c h i t e c t u r e A Y chi ld o f Y chi ld i s
~ SIGNAL DEFINITION(CHILD) ~
begin
~ EXPRESSIONS(CHILD) ~
end A Y chi ld ;
    
l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y X parent i s
por t (
~ PORT DEFINITION(PARENT) ~
) ;
end X parent ;
a r c h i t e c t u r e A X parent o f X parent i s
component Y chi ld
por t (
~ PORT DEFINITION(CHILD) ~
) ;
end component ;
~ SIGNAL DEFINITION(PARENT) ~
begin
i Y c h i l d : Y chi ld
por t map (
~ PORT CONNECTION(CHILD PARENT) ~
) ;
~ OTHER EXPRESSIONS(PARENT) ~
end A X parent ;

処理を抜き出した、他から呼び出される側のentity は、通常通り作成します。
処理を呼び出す場合は２段階の手続きがあります。
まずarchitecture からbegin までの間で、component 宣言を行います。ここで、呼び出すentity はすべて宣言します。
次にbegin の後で、実際に呼び出します。複数個呼び出すこともできますが、その場合はentity 名の前のコロンの前、インスタンス名（ここではi Y child ）はそれぞれ固有のものにします。
１０進数カウンタに階層化を適用します。

counter10.vhd

注記

counter10.vhd とledconv.vhd は、vhdl11b プロジェクトを作成した後、それぞれvhdl11b.vhd と同様にle → new → VHDL le で作成します。

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y count e r10 i s
por t (
gc lk0 : in s t d l o g i c ;
sw1 : in s t d l o g i c ;
  
e i n : in s t d l o g i c ;
c i n : in s t d l o g i c ;
  
c out : out s t d l o g i c ;
  
cnt : out s t d l o g i c v e c t o r (3 downto 0)
) ;
end counte r10 ;
a r c h i t e c t u r e beha v i o r a l o f count e r10 i s
s i g n a l c : s t d l o g i c v e c t o r (3 downto 0) ;
begin
cnt pr o c : pr o c e s s ( sw1 , g c lk0 )
begin
i f ( sw1 = ' 1 ' ) then
c <= " 0000 " ;
e l s i f ( gclk0 ' event and gc lk0 = ' 1 ' ) then
i f ( ( e i n = ' 1 ' ) and ( c i n = ' 1 ' ) ) then
   put code below
   put code above
end i f ;
end i f ;
end pr o c e s s ;
c out <= '1 ' when ( c = " 1001 " )
e l s e ' 0 ' ;
cnt <= c ;
end beha v i o r a l ;

c in は下の桁からの桁上げのリクエストを受け付けるポート、c out は上の桁への桁上げのリクエストを出力するポート。
e in はH レベルが入るとカウントを行うポート

ledconv.vhd
l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y l edconv i s
por t (
cnt : in s t d l o g i c v e c t o r (3 downto 0) ;
s l edxa : out s t d l o g i c ;
s l edxb : out s t d l o g i c ;
s l edx c : out s t d l o g i c ;
s l edxd : out s t d l o g i c ;
s l edx e : out s t d l o g i c ;
s l e d x f : out s t d l o g i c ;
s l edxg : out s t d l o g i c
) ;
end ledconv ;
a r c h i t e c t u r e beha v i o r a l o f ledconv i s
s i g n a l s l e d : s t d l o g i c v e c t o r (6 downto 0) ;
begin
s l e d <= " 0010000 " when ( cnt = " 1001 " )
e l s e " 0000000 " when ( cnt = " 1000 " )
e l s e " 1111000 " when ( cnt = " 0111 " )
e l s e " 0000010 " when ( cnt = " 0110 " )
e l s e " 0010010 " when ( cnt = " 0101 " )
e l s e " 0011001 " when ( cnt = " 0100 " )
e l s e " 0110000 " when ( cnt = " 0011 " )
e l s e " 0100100 " when ( cnt = " 0010 " )
e l s e " 1111001 " when ( cnt = " 0001 " )
e l s e " 1000000 " when ( cnt = " 0000 " )
e l s e " 0000110 " ;
s l edxa <= s l e d ( 0 ) ;
s l edxb <= s l e d ( 1 ) ;
s l edx c <= s l e d ( 2 ) ;
s l edxd <= s l e d ( 3 ) ;
s l edx e <= s l e d ( 4 ) ;
s l e d x f <= s l e d ( 5 ) ;
s l edxg <= s l e d ( 6 ) ;
end beha v i o r a l ;

プロジェクト名vhdl11b

vhdl11b.vhd

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl11b i s
por t (
gc lk0 : in s t d l o g i c ;
sw1 : in s t d l o g i c ;
s l ed1 a : out s t d l o g i c ;
s l ed1b : out s t d l o g i c ;
s l e d 1 c : out s t d l o g i c ;
s l ed1d : out s t d l o g i c ;
s l e d 1 e : out s t d l o g i c ;
s l e d 1 f : out s t d l o g i c ;
s l ed1 g : out s t d l o g i c
) ;
end vhdl11b ;
a r c h i t e c t u r e beha v i o r a l o f vhdl11b i s
component count e r10
por t (
gc lk0 : in s t d l o g i c ;
sw1 : in s t d l o g i c ;
  
e i n : in s t d l o g i c ;
c i n : in s t d l o g i c ;
  
c out : out s t d l o g i c ;
  
cnt : out s t d l o g i c v e c t o r (3 downto 0)
) ;
end component ;
component ledconv
por t (
cnt : in s t d l o g i c v e c t o r (3 downto 0) ;
s l edxa : out s t d l o g i c ;
s l edxb : out s t d l o g i c ;
s l edx c : out s t d l o g i c ;
s l edxd : out s t d l o g i c ;
s l edx e : out s t d l o g i c ;
s l e d x f : out s t d l o g i c ;
s l edxg : out s t d l o g i c
) ;
end component ;
s i g n a l d : s t d l o g i c v e c t o r (24 downto 0) ;
s i g n a l r : s t d l o g i c ;
s i g n a l c i n 1 : s t d l o g i c ;
s i g n a l c out 1 : s t d l o g i c ;
s i g n a l cnt1 : s t d l o g i c v e c t o r (3 downto 0) ;
begin
di v pr o c : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
i f (d = " 1111010000100011111111111 " ) then
d <= " 0000000000000000000000000 " ;
r <= ' 1 ' ;
e l s e
d <= d + 1 ;
r <= ' 0 ' ;
end i f ;
end i f ;
end pr o c e s s ;
c i n 1 <= ' 1 ' ;
i c o u n t e r 1 : count e r10
por t map (
gc lk0 => gclk0 ,
sw1 => sw1 ,
e i n => r ,
c i n => c in 1 ,
c out => c out 1 ,
cnt => cnt1
) ;
i c o n v 1 : ledconv
por t map (
cnt => cnt1 ,
s l edxa => s l ed1a ,
s l edxb => s led1b ,
s l edx c => s l ed1c ,
s l edxd => s led1d ,
s l edx e => s l ed1e ,
s l e d x f => s l e d 1 f ,
s l edxg => s l ed1 g
) ;
end beha v i o r a l ;

この状態で、ソースコードの関係は以下のようになります。
counter 10 を呼び出しているときのキーワード"i counter 1" やledconv に対する"i conv 1" がインスタンス名となります。固有のインスタンス名をつけることで、同じ回路ブロックを複数回呼び出すことができます。
ポートの接続はこのコードのように、左辺に呼び出される回路のポート名、=> をはさんで右辺に呼び出し側のport 名またはsignal 名を書き、カンマで区切ります。カンマは区切りなので最後の接続の後には書きません。

5.14 状態遷移と、条件分岐 case ～ when ～
===========================================

例えばカップラーメンを食べようとした場合でも、（誰かが作ってくれる場合を除いて）手順があります。

. カップラーメンの包装をといてふたを開けて小袋をとりだす。必要なものはここで入れる。
2. やかんに水を入れてコンロにかけて沸かす。
3. 沸騰するのを待つ。
4. 沸騰したら火を止めて、お湯をカップに注ぐ。
5. ３分（または５分）待つ。
6. 必要に応じて小袋の中身をカップに入れる。まぜる。
7. 食べてよし。

小袋が入ってなかったり電気ポットでお湯を沸かしたり、湯切りタイプだったりとバリエーションがありますが、オーソドックなものではこのように順番があり、例えば１、２は入れ替えたり並列に行ってもいいですが、基本的に手順通りに行います。
プログラミングもこういったところに似ていますが、このように手順通りに処理を行いたい場合、ソフトウェアと同様状態遷移の考え方を使います。
状態遷移は通常は図で状態間のつながりを描きながら設計をし、ソースコードには人間が考えながら書き込むしかありません（図を描くことでソースコードを出力してくれるツールもあります）。
ソースコード上で、各「状態」を数字で表しながらコーディングすることもできますが、各「状態」に名前をつけて管理しやすくすることができます。
（ C 言語のenum と同じような働きです）
使い方はたとえば以下のようになります。

type RAMEN i s (MAKE READY CUP, BOILWATER, POURWATER, WAIT MINUTES,
READY TO EAT) ;
s i g n a l ramen s tat : RAMEN;
begin
ramen s tat <= MAKEREADY;

１行目ではRAMEN という型を新しく定義しています。この型のとりうる値は"MAKE READY CUP"の５種類です。
２行目では、RAMEN の型のsignal 、ramen stat を宣言します。
ramen stat にはMAKE READY CUP など、定義した名前を代入したり、if 文で比較したりすることができます。ただし勝手に作った型ですので、そのままではport から出力しても使えませんし、例えばLED の点灯パターンに対しては全く対応がとれないため使えません。あくまで内部で使うのが基本です。
このようにしなくても、自分でこれらの状態を管理すれば、たとえばinteger のsignalででも管理できます。ただしわかりやすい名前をつけることで、ソースコードが理解しやすくなります。

5.15 条件分岐 case ～ when ～
===============================

注記
case 文はprocess 文の中でのみ使用できます。
状態遷移専用ではありませんが、case 文はよく組み合わされて使われます。基本的な形は以下の通りです。

cas e (CONDITION SIGNAL) i s
when (VALUE A) => ~ EXPRESSION A ~
when (VALUE B) => ~ EXPRESSION B ~
when o the r s => ~ EXPRESSION OTHER ~
end cas e ;

ある一つのsignal の値毎に処理を分岐させることができます。処理は、次のwhen まで何行でも書くことができます。

5.15.1 演習
^^^^^^^^^^^^^

スイッチによって、特定のLED を点灯させる回路を作る。
• LED1 が点灯している場合、sw2 を操作することでLED1 が消灯し、LED2 が点灯する。
• LED2 が点灯している場合、sw1 を操作することで、LED2 が消灯し、LED1 が点灯する。sw2 を操作した場合は、LED2 が消灯し、LED3 が点灯する。
• LED3 が点灯している場合、sw1 を操作することで、LED3 が消灯し、LED2 が点灯する。

swlter.vhd

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y swf i l t e r i s
por t (
gc lk0 : in s t d l o g i c ;
sw : in s t d l o g i c ;
sw out : out s t d l o g i c
) ;
end swf i l t e r ;
a r c h i t e c t u r e beha v i o r a l o f swf i l t e r i s
s i g n a l c : s t d l o g i c v e c t o r (14 downto 0) ;
s i g n a l r : s t d l o g i c ;
s i g n a l d1 : s t d l o g i c ;
s i g n a l d2 : s t d l o g i c ;
s i g n a l s : s t d l o g i c ;
begin
sum proc : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
i f ( sw = ' 0 ' ) then
c <= " 000000000000000 " ;
e l s i f ( ( c /= " 111111111111111 " ) and ( sw = ' 1 ' ) ) then
c <= c + 1 ;
end i f ;
i f ( c = " 111111111111111 " ) then
r <= ' 1 ' ;
e l s e
r <= ' 0 ' ;
end i f ;
end i f ;
end pr o c e s s ;
d i f f p r o c : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
d1 <= r ;
d2 <= d1 ;
s <= d1 and ( not d2 ) ;
end i f ;
end pr o c e s s ;
sw out <= s ;
end beha v i o r a l ;

プロジェクト名vhdl12

vhdl12.vhd

l i b r a r y i e e e ;
use i e e e . s t d l o g i c 1 1 6 4 . a l l ;
use i e e e . s t d l o g i c a r i t h . a l l ;
use i e e e . s t d l o g i c u n s i g n e d . a l l ;
e n t i t y vhdl12 i s
por t (
gc lk0 : in s t d l o g i c ;
sw1 : in s t d l o g i c ;
sw2 : in s t d l o g i c ;
l ed1 : out s t d l o g i c ;
l ed2 : out s t d l o g i c ;
l ed3 : out s t d l o g i c
) ;
end vhdl12 ;
a r c h i t e c t u r e beha v i o r a l o f vhdl12 i s
component swf i l t e r
por t (
gc lk0 : in s t d l o g i c ;
sw : in s t d l o g i c ;
sw out : out s t d l o g i c
) ;
end component ;
s i g n a l sw1d : s t d l o g i c ;
s i g n a l sw2d : s t d l o g i c ;
type LED STAT i s (P LED1 , P LED2 , P LED3) ;
s i g n a l l s t a t : LED STAT;
s i g n a l l ed : s t d l o g i c v e c t o r (3 downto 1) ;
begin
sw1 f i l t e r : swf i l t e r
por t map (
gc lk0 => gclk0 ,
sw => sw1 ,
sw out => sw1d
) ;
sw2 f i l t e r : swf i l t e r
por t map (
gc lk0 => gclk0 ,
sw => sw2 ,
sw out => sw2d
) ;
s t a t p r o c : pr o c e s s ( g c lk0 )
begin
i f ( gclk0 ' event and g c lk0 = ' 1 ' ) then
cas e l s t a t i s
when P LED1 =>
i f ( sw2d = ' 1 ' ) then
l s t a t <= P LED2 ;
end i f ;
l ed <= " 001 " ;
when P LED2 =>
i f ( sw1d = ' 1 ' ) then
l s t a t <= P LED1 ;
e l s i f ( sw2d = ' 1 ' ) then
l s t a t <= P LED3 ;
end i f ;
l ed <= " 010 " ;
when P LED3 =>
i f ( sw1d = ' 1 ' ) then
l s t a t <= P LED2 ;
end i f ;
l ed <= " 100 " ;
when o the r s =>
l s t a t <= P LED1 ;
l ed <= " 111 " ;
end cas e ;
end i f ;
end pr o c e s s ;
l ed1 <= not l ed ( 1 ) ;
l ed2 <= not l ed ( 2 ) ;
l ed3 <= not l ed ( 3 ) ;
end beha v i o r a l ;

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

vhdl11b の１０進カウンタcounter10 、7 セグLED への変換を行うledconv 、vhdl12のチャタリング除去回路swlter が応用できる。
今カウント中なのか止まっているのか、判定するsignal を作って制御する。

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

