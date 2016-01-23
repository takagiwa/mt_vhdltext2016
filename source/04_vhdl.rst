VHDL
======

4.1 基本形
------------

VHDL のソースコードは、基本的には以下のような形です。

.. only:: not latex

 .. figure:: figure/figure01.png
  :align: center

.. only:: latex

 .. figure:: figure/figure01.eps
  :align: center


これがテンプレートとなります。コードを記述するときは、この中の x、y、３つの枠の中を、目的に合わせて書き換えます。

ここで x は entity 名、y は architecture 名です。ポート宣言はこの entity が外部とやりとりする信号（たとえば実際のデバイスのピン）を宣言します。

entity 名はこの回路に対する自由な名前（たとえば機能から名付けるなど）、architecture名はどの entity に対しても同じ「rtl」という名前をつけておけば通常問題ありません。

これらは以下のようなイメージになります。

ファイルにはいくつかの entity 、architecture を含めることができますが、この実習では一つのファイルに一つの entity 、architecture を保存し、ファイル名は entity 名に合わせて設定してください。

4.1.1 解説
^^^^^^^^^^^^

4.1.1.1 entity とその周辺
"""""""""""""""""""""""""""

entity と architecture はいずれもそれ単体では何もできません。わざわざ分かれているところから想像できるとおり、同じ entity に対して異なる architecture を適用させることもできますが、この授業では扱いません。

また entity 、architecture が動作するためには、entity の前にある４行のライブラリ宣言が必要です。

ここでは ieee の 1164 、arith 、unsigned を呼び出しています。この授業ではこの組み合わせを使用しますので、この４行のライブラリ宣言もそのまま使用します。

C 言語のインクルードファイルの宣言などと異なり、ファイルに複数の entity 、architecture を記述する場合、ライブラリ宣言は entity 毎に宣言し直す必要があります。４個の entity を記述していれば、その都度、合計４回のライブラリ宣言が必要です。

4.1.2 ファイルとの関係
^^^^^^^^^^^^^^^^^^^^^^^^

一般にファイル名と entity 名をそろえ、拡張子は「.vhd」とします。

一つのファイルに複数の entity 、architecture を記述することもできますが、その際はそれに対応した use 、library の宣言も必要です。

この授業では、一つのファイルに一つの entity 、architecture とするのがよいでしょう。

またライブラリのうち unsigned は名前から想像できるとおり符号なしの演算を行います。符号付きの演算を行いたい場合は代わりに signed を呼び出します。一つの entity 、architecture 内では混在はできません。

4.2 信号の種類
----------------

信号は、ソフトウェアで言う変数と同様のイメージから考えてください。

たとえば C 言語であれば char 、int 、float 等があるように、VHDL でもライブラリを読み込むことで以下のような信号が扱えます。

4.2.1 std_logic
^^^^^^^^^^^^^^^^^

1bit の信号。通常使用する値は 0、1、Z です。

直値を扱う場合、1bit 分ずつシングルクオートで括ります。

0、1 は信号の L レベル、 H レベルに対応します。

Z は「ハイインピーダンス」で、その信号が無い、何もつながっていない状態を作ります。この授業の範囲では使いません。

例

.. code-block:: vhdl

 ' 0 ' , ' 1 ' , 'Z '

4.2.2 std_logic_vector
^^^^^^^^^^^^^^^^^^^^^^^^

std_logic を束ねたもので、任意のビット数を扱うことができます。

各ビットに代入できる値は std_logic と同じです。

束ねるビット数は宣言時に決めておきます。たとえば１０進数で０～１００までを扱うには 7bit 必要ですので、７本の std_logic を束ねるため、以下のような形式になります。

.. code-block:: vhdl

 std_logic_vector(6 downto 0)

この場合、MSB [#f41]_ が bit 6 、LSB [#f42]_ が bit 0 という宣言になります。ここに代入する値は、たとえば１０進数の１０であれば

.. code-block:: vhdl

 "0001010"

というふうにダブルクオーテーションで括ります。左が bit6 、右が bit0 です。代入する値は、代入先の信号とビット幅が一致している必要があります [#f43]_ 。

例

.. code-block:: vhdl

 "0000", "010101010", "00Z00Z"

括弧（）でビット番号を指定することで、std_logic として 1bit 抜き出して扱うことができます。

.. note::

 std_logic_vector(0 to 6) という宣言の仕方もありますが、ソースやプロジェクトの中で混在させるのはバグのもとになるので通常はどちらかに統一します。

 この授業では downto に統一します。

 図の上を MSB、下を LSB とした場合、downto と to の関係は次の図のようになります。

4.2.3 integer
^^^^^^^^^^^^^^^

10 進数を直接扱います。bit は意識しません。std_logic や std_logic_vector とは直接接続することはできません。

4.3 ポート宣言
----------------

ポート宣言では、この entity （回路ブロック）が外部とやりとりする信号を定義します。

複数の信号を定義でき、それぞれ以下のような形です。

ポート名: 方向信号型

定義の区切りにセミコロンが必要です。定義の終わりを示すものでは無いので、最後の定義ではセミコロンは書きません。

例

.. code-block:: vhdl

 extsignal1 : in std_logic;
 extsignal2 : out std_logic_vector(3 downto 0);
 extsignal3 : inout std_logic;
 extsignal4 : buffer std_logic

ポート名は任意の名前をつけ、architecture 内からその信号にアクセスできます。

方向については上記の４パターンがあります。

in
 この entity への入力です。architecture 内では読むことしかできません。

out
 この entity からの出力です。architecture 内で書き込むことしかできません。

inout
 入出力両方ができます。architecture 内では読み書きができますが、信号が衝突すると電気的に短絡（ショート）となるため、エラーとなります。エラーにならない対応はこの授業では扱いません。

buffer
 この entity からの出力です。out との違いは信号の再利用ができることですが、制約もあるので使うのは避けた方がよいでしょう。

それぞれのイメージを図に示します。読み書きは他の signal へ、または signal からの「代入」と読み替えてもよいでしょう。

buffer と inout はこの授業では使用しません。

4.4 シグナル宣言
------------------

アーキテクチャの中で使用する信号を宣言します。アーキテクチャの記述の中で、beginの前に行います（begin より後には宣言できません）。

例

.. code-block:: vhdl

 signal intsignal1 : std_logic;
 signal intsignal2 : std_logic_vector(3 downto 0);
 signal intsignal3 : integer;
 signal intsignal4 : std_logic;

"signal" キーワードの後に、ポート宣言と同様に任意の名前をつけます。信号の種類もポート宣言と同様です。

アーキテクチャ内部でのみ使用するので、方向は記述しません。

また全ての宣言で末尾はセミコロンで閉じます。

4.5 値の代入
--------------

代入は "<=" で行います。

例（１）

.. code-block:: vhdl

 intsignal1 <= '1';
 intsignal4 <= intesignal1;
 intsignal2 <= "0000";
 intsignal3 <= 5;

std_logic_vector の場合は値の扱い方にバリエーションがあるのでここで解説します。

.. code-block::vhdl

 intsignal2 <= "00" & "01";
 intsignal2 <= "111" & intsignal1;

合計したビット数が代入先の信号に一致していれば、＆で結合できます。

.. code-block::vhdl

 intsignal2(0) <= intsignal4;
 intsignal1 <= intsignal2(1);

括弧でビットを指定すれば、std_logic を代入したり、参照したりできます。

4.6 もう一つの信号 variable と代入
-----------------------------------

VHDL には port 、signal の他にもう一つ、variable という信号のタイプがあります。

variable は後述する process 文の中でのみ使用でき、信号のタイプは他と同様 std_logic 等を使うことができます。

代入には := を使います。

variable はこの授業では扱いません。

.. rubric:: Footnotes

.. [#f41] 変化することにより全体の値が大きく変化するビット
.. [#f42] 変化から値全体の変化が一番小さいビット
.. [#f43] ビット幅が一致していなくてもツール上エラーにならない場合があり、発見しづらいバグになりやすいです。
