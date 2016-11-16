unit uSimpleDice;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    ButtonThrowDice: TButton;
    Memo1: TMemo;
    ButtonLoopWhile: TButton;
    ButtonLoopUntil: TButton;
    procedure ButtonThrowDiceClick(Sender: TObject);
    procedure ButtonLoopWhileClick(Sender: TObject);
    procedure ButtonLoopUntilClick(Sender: TObject);
  private
    { private 宣言 }
  public
    { public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ButtonThrowDiceClick(Sender: TObject);
var
  // 変数 DiceValue の定義
  //
  // 実演では手作業で入力していたが、
  // IDE の入力支援機能を使えば手作業で入力する必要はない。
  // その変数名が登場した箇所で [ctrl] 実際には begin - end の間で
  // Ctrl + Shift + V を押すだけで自動的に変数定義が追加できる。
  DiceValue: Integer;
begin
  // Random(6) は 0, 1, 2, 3, 4, 5 の値をとるので、
  // さいころとして使うために + 1 する。
  DiceValue := Random(6) + 1;

  // Memo1 の先頭にさいころの値を差し込む。
  // DiceValue は数値型（Integer) だけど、
  // 表示の際は文字列型にする必要があるので toString を指定する。
  Memo1.Lines.Insert(0,DiceValue.toString);

  // if文による条件分岐
  if DiceValue = 1 then
    Memo1.Lines.Insert(0,'1の目が出ました');

end;

procedure TForm1.ButtonLoopWhileClick(Sender: TObject);
var
  DiceValue: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // 初回のサイコロ振り
  DiceValue := Random(6) + 1;

  // while ループは、条件を満たす間は処理を実行する。
  // 「1が出るまで繰り返す」という処理は「１が出ない間は繰り返す」と
  // 表現することができる。
  // なお、whileループは最初に継続条件の判定を行うため、
  // while の前に値が設定されていることが必要。
  // ここでは「1が出るまで = 1が出ない間」はループを続ける。
  while (DiceValue <> 1) do
  begin
    Memo1.Lines.Insert(0,DiceValue.toString + ' はずれ' );

    // ループの中でサイコロを振る処理
    DiceValue := Random(6) + 1;
  end;

  // この処理は while の後にあるので、
  // 今回の実装では while の条件が不成立となった後に
  // かならず実行される処理となる。
  Memo1.Lines.Insert(0,DiceValue.toString + ' キター');
end;

procedure TForm1.ButtonLoopUntilClick(Sender: TObject);
var
  DiceValue: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // repeat ～ until は「ループ処理を少なくとも１回実行し、
  // 条件が満たされるまでループを繰り返す」ように動作する。
  repeat
    // さいころを振る。
    DiceValue := Random(6) + 1;

    // while ループと同様に 'はずれ' の文字を出すためには
    // ループの中で値を検証せねばならない。
    if (DiceValue <> 6) then
      Memo1.LInes.Insert(0,DiceValue.toString + ' はずれ');

  // ここまでのループの内容を 6 の目が出るまで続ける。
  until (DiceValue = 6);

  // この処理は until の後にあるので、
  // 今回の実装では until の終了条件が満たされた後に
  // かならず実行される処理となる。
  Memo1.Lines.Insert(0,DiceValue.toString + ' キター');
end;

end.
