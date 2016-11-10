unit uUseRandom;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Effects,
  FMX.Objects;

type
  TForm1 = class(TForm)
    ButtonIf: TButton;
    Memo1: TMemo;
    ButtonLoopWhile: TButton;
    ButtonLoopRepeat: TButton;
    ButtonClearMemo: TButton;
    GlowEffect1: TGlowEffect;
    GlowEffect2: TGlowEffect;
    GlowEffect3: TGlowEffect;
    GlowEffect4: TGlowEffect;
    procedure ButtonIfClick(Sender: TObject);
    procedure ButtonLoopWhileClick(Sender: TObject);
    procedure ButtonLoopRepeatClick(Sender: TObject);
    procedure ButtonClearMemoClick(Sender: TObject);
  private
    { private 宣言 }
  public
    { public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ButtonIfClick(Sender: TObject);
{ if 文による条件分岐の例 }
var
  RandomNumber: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // Random は 0 ～ n までの乱数を生成するので、
  // ここでは 6 を指定することで 0 ～ 5 の値を得る。
  // これに 1 を加えることで 1 ～ 6 の値を得る。
  RandomNumber := Random(6) + 1;

  // TMemo の先頭に数値を差し込みます。
  Memo1.Lines.Insert(0, RandomNumber.toString );

  // if ～ then ～ else で２種類の場合分けの例
  if (RandomNumber <= 3) then
    Memo1.Lines.Insert(0, '３以下' )
  else
    Memo1.Lines.Insert(0, '３より大きい' );

  // ２つの条件が同時に成立した場合の例
  if (2 <= RandomNumber) AND (RandomNumber <= 4) then
    Memo1.Lines.Insert(0, '２～４の間' );

  // ２つの条件のどちらかが成立した場合の例
  if (RandomNumber = 1) OR (RandomNumber = 6) then
    Memo1.Lines.Insert(0, '１か６' );
end;

procedure TForm1.ButtonClearMemoClick(Sender: TObject);
{ Memo1 の内容をクリアする }
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.ButtonLoopRepeatClick(Sender: TObject);
{ repeat ～ until による条件分岐の例 }
var
  RandomNumber1, RandomNumber2: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // repeat ～ until は「ループ処理を少なくとも１回実行し、
  // 条件が満たされるまでループを繰り返す」ように動作する。
  repeat
    // ２つのさいころを振る。
    RandomNumber1 := Random(6) + 1;
    RandomNumber2 := Random(6) + 1;

    // ゾロ目ではないならメッセージを出す。
    if (RandomNumber1 <> RandomNumber2) then
      Memo1.Lines.Insert(0,
        RandomNumber1.toString + '-' + RandomNumber2.toString + ' はずれ' );

    // ここまでの処理をゾロ目になるまで続ける。
  until (RandomNumber1 = RandomNumber2);

  // ループを抜けた状態は必ずゾロ目である。
  Memo1.Lines.Insert(0,
    RandomNumber1.toString + '-' + RandomNumber2.toString + ' ゾロ目キター' );
end;

procedure TForm1.ButtonLoopWhileClick(Sender: TObject);
{ while による条件分岐の例 }
var
  RandomNumber1, RandomNumber2: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // 初回のさいころ振り
  RandomNumber1 := Random(6) + 1;
  RandomNumber2 := Random(6) + 1;

  // while は「条件を満たす間はループを続ける」
  // だから最初の値比較のときに条件を満たさない場合は
  // ループを実行しない。
  // ここでは「２つの値が違う」間はループを続ける。
  while (RandomNumber1 <> RandomNumber2) do
  begin
    Memo1.Lines.Insert(0,
      RandomNumber1.toString + '-' + RandomNumber2.toString + ' はずれ' );

    // ゾロ目が出ていないので、ループの中で再度さいころを振る。
    // 今回のケースでは同じ処理を while の中と外で
    // ２か所記述せねばならず、このような処理は while には向かない。
    RandomNumber1 := Random(6) + 1;
    RandomNumber2 := Random(6) + 1;
  end;

  // ループを抜けた状態は必ずゾロ目である。
  Memo1.Lines.Insert(0,
    RandomNumber1.toString + '-' + RandomNumber2.toString + ' ゾロ目キター' );

end;

end.
