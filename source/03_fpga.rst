FPGA について
===============

デジタル回路の最小単位は、AND、OR、NOT 等の論理素子で、さらにこれらを組み合わせたXOR とフリップフロップが多用されます。これらの単機能デバイス（たとえば16 ピンのIC など）は多く販売されていました。

プロセッサやメモリなどは大規模なデジタル回路で、上記のような機能を組み合わせてIC 、LSI という形で設計されます。

1990 年代中盤のプロセッサやメモリは単体では機能が少なく、基板上で、上記のような単機能デバイスを組み合わせたサポート回路が必要となっていました。

これらのサポート回路をまた新しいIC 、LSI で設計することも可能でしたが、対象となるCPU や、基板が対象としている機能などで必要となる回路が異なるため、現実的ではありませんでした。

ちなみに小規模なIC 、LSI でも実際のデバイスにするまでに数千万から億単位の費用がかかるそうです。

そこで、大量の論理素子と、それらをつなぐ大量の配線＋スイッチをあらかじめIC 内に作り込んでおき、素子、スイッチ毎にON、OFF を設定することで、まるで専用のICのように使おうという考えが生まれ、そのようなデバイスが作られました。

これがFPGA の始まりとなります。

IC 、LSI の技術の進歩とともに規模も大きくなり、動作速度も高くなり、現在ではただのサポート回路にとどまらず、信号処理の分野でも使われています。

性能や価格では、億単位の費用をかけたLSI にはかなわないため、そういった対応ができない分野で多く使われています。

例：

製品の初期開発
 たとえば第３世代携帯電話の端末、基地局の開発は、世界標準の規格がまだ確定していない時期から始まっているため、後から変更が必要な可能性がとても高い状態でした。そのため、あとから内容を変更できるよう基板はFPGA を搭載して製造しておき、仕様変更があってもすぐ対応できるようにします（LSI では製造にも時間がかかります）。
特殊な信号処理装置
 たとえば金融取引向けには一般のパソコンにも組み込める、単にFPGA が載っているだけの基板が使われます。内容は会社それぞれが独自のノウハウで設計するため、全てのユーザ共通とはできないので、空っぽのままで販売されます。

.. note::

 実際にこの授業で使用するデバイスは「PLD」と呼ばれます。PLD は Programmable Logic Device の略です。プログラム可能な論理デバイス、となります。

 対してFPGA はField Programmable Gate Array の略です。現場（Field）でプログラム可能なゲート（論理）の集合、となります。

 できることはほぼ同じですが、以下のような特徴で分けています。

 CPLD

 - フラッシュメモリを内蔵し、電源を入れるとすぐ使える。
 - 回路規模は小さめ。
 - 基本的に論理回路しか入ってない。
 - 動作速度が比較的高い。
 - 構造上、XOR が少し苦手。

 FPGA

 - 動作のプログラムは揮発性のメモリに格納されるので、電源を切ると内容が失われる。そのため別途フラッシュメモリが必要。
 - 回路規模はかなり大きい。
 - 高機能（乗算用ハードウェアが入っていたり、メモリが入っていたりする）。
 - 動作速度は今ではだいぶ高くなってきた。

 それぞれのデバイスの構成要素は以下の図のようになっています。いずれもD フリップフロップと組み合わせ回路がセットになっており、その入力をプログラムするような形です。このセットがデバイスの中に多数組み込まれ、相互に接続できるよう配線とスイッチも同様に多数用意されます。

 CPLD とFPGA の間の大きな違いは組み合わせ回路の構成です。CPLD は大量の ANDと多入力 OR を組み合わせていますが（実際には NOT も入ります）、FPGA は AND 、OR に縛られない LUT (LookUp Table) を使用します。たとえば４入力の AND 、４入力の OR に限らず、"4" 等の任意の数値と一致したときに H を出力する、というようなことも簡単にできるよう、より柔軟な構造になっています。

 いずれの場合でもD フリップフロップが既に組み込まれていますので、AND を組み合わせたようなフリップフロップを改めて記述する必要はなく、むしろ期待通りに動作しない可能性があります。

3.1 HDL
---------

ディジタル回路を組み込んだIC やLSI の開発では、初期にはAND 、OR 、NOT 、フリップフロップをCAD 上で回路図のように配置して接続していました。

こういったCAD は、IC 、LSI メーカー毎に異なるため、たとえば完成したデータを違うLSI メーカーで製造しなければいけなくなったとき、互換性が無いため入力＆確認し直しが必要になっていました。

こういった状況を避けるために、IC 、LSI の開発も、ソフトウェアのようにテキストで行おうという動きがでてきました。このジャンルの言語はHDL （Hardware Description Language）と呼ばれます。

ソフトウェアと同様、HDL も様々なものが開発されましたが、現在の主流はVerilogHDLとVHDL です。

.. note::

 HDL は一般にソフトウェアとは異なる考え方が必要になります。それだけ、ソフトウェアのプログラマに比べ人口が少ないです。
 現在ソフトウェアの開発環境は無料で入手できるようになり、早ければ小学生から始める人もいます。
 特に研究の分野ではFPGA に興味を持つ方は多いのですが、開発環境やサンプルボードが高価なこともあり、独学で覚えられる環境は多くありませんでした。
 HDL を多少でも理解できると、その分対応できる仕事が広がります。ただ、通常のC 言語をベースにもっとたくさんの人がFPGA 開発できるようにする動きも以前からあり、少しずつ成果が出始めてきています。

3.2 VerilogHDL とVHDL
-----------------------

各言語の特徴を以下に示します（筆者の独断と偏見を含む）

VerilogHDL

- 民間主導- ツールメーカーが開発した。
- 比較的便利な記述ができるようになっている。
- 文法上記述ミスが許容される傾向がある＝ デバッグ時に大変なことが多い。
- 日本でのシェアは、こちらがかすかに多いかもしれない。
- C 言語に近い、と評されることがあるものの、上記のような動きがあることから、むしろBASIC の方が近いと感じる。
- 無料のシミュレータがあるため、特に趣味の範囲での人気はVHDL より高い模様。

VHDL

- 米国国防省主導- ソフトウェアのプログラミング言語をベースに策定
- 融通が利かず、あまり高機能でない。コード量は多くなる傾向かもしれない。
- 海外でのシェアは、こちらがかすかに多いかもしれない。
- BASIC ににたキーワードもあるものの、文法エラーの検出の強さはC 言語に近い。
