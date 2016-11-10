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
    { private �錾 }
  public
    { public �錾 }
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
    Memo1.Lines.Insert(0,'1�̖ڂ��o�܂���');

end;

procedure TForm1.ButtonLoopWhileClick(Sender: TObject);
var
  DiceValue: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // ����̃T�C�R���U��
  DiceValue := Random(6) + 1;

  // while �́u�����𖞂����Ԃ̓��[�v�𑱂���v
  // �����ł́u1���o��܂� = 1���o�Ȃ��ԁv�̓��[�v�𑱂���B
  while (DiceValue <> 1) do
  begin
    Memo1.Lines.Insert(0,DiceValue.toString + ' �͂���' );

    // ���[�v�̒��ŃT�C�R����U�鏈��
    DiceValue := Random(6) + 1;
  end;

  // ���[�v�𔲂�����͖ړI�̖ڂ��o�Ă���͂��ł���
  Memo1.Lines.Insert(0,DiceValue.toString + ' �L�^�[');
end;

procedure TForm1.ButtonLoopUntilClick(Sender: TObject);
var
  DiceValue: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // repeat �` until �́u���[�v���������Ȃ��Ƃ��P����s���A
  // ���������������܂Ń��[�v���J��Ԃ��v�悤�ɓ��삷��B
  repeat
    DiceValue := Random(6) + 1;

    if (DiceValue <> 6) then
      Memo1.LInes.Insert(0,DiceValue.toString + ' �͂���');
  // �����܂ł̃��[�v�̓��e�� 6 �̖ڂ��o��܂ő�����B
  until (DiceValue = 6);

  // ���[�v�𔲂�����͖ړI�̖ڂ��o�Ă���͂��ł���
  Memo1.Lines.Insert(0,DiceValue.toString + ' �L�^�[');
end;

end.
