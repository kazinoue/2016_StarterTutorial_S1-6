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
  DiceValue: Integer;
begin
  DiceValue := Random(6) + 1;
  Memo1.Lines.Insert(0,DiceValue.toString);

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

  // while は「条件を満たす間はループを続ける」
  // ここでは「1が出るまで = 1が出ない間」はループを続ける。
  while (DiceValue <> 1) do
  begin
    Memo1.Lines.Insert(0,DiceValue.toString + ' はずれ' );

    // ループの中でサイコロを振る処理
    DiceValue := Random(6) + 1;
  end;

  // ループを抜けた後は目的の目が出ているはずである
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
    DiceValue := Random(6) + 1;

    if (DiceValue <> 6) then
      Memo1.LInes.Insert(0,DiceValue.toString + ' はずれ');
  // ここまでのループの内容を 6 の目が出るまで続ける。
  until (DiceValue = 6);

  // ループを抜けた後は目的の目が出ているはずである
  Memo1.Lines.Insert(0,DiceValue.toString + ' キター');
end;

end.
