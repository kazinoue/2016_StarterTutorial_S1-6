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
    { private �錾 }
  public
    { public �錾 }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ButtonIfClick(Sender: TObject);
{ if ���ɂ���������̗� }
var
  RandomNumber: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // Random �� 0 �` n �܂ł̗����𐶐�����̂ŁA
  // �����ł� 6 ���w�肷�邱�Ƃ� 0 �` 5 �̒l�𓾂�B
  // ����� 1 �������邱�Ƃ� 1 �` 6 �̒l�𓾂�B
  RandomNumber := Random(6) + 1;

  // TMemo �̐擪�ɐ��l���������݂܂��B
  Memo1.Lines.Insert(0, RandomNumber.toString );

  // if �` then �` else �łQ��ނ̏ꍇ�����̗�
  if (RandomNumber <= 3) then
    Memo1.Lines.Insert(0, '�R�ȉ�' )
  else
    Memo1.Lines.Insert(0, '�R���傫��' );

  // �Q�̏����������ɐ��������ꍇ�̗�
  if (2 <= RandomNumber) AND (RandomNumber <= 4) then
    Memo1.Lines.Insert(0, '�Q�`�S�̊�' );

  // �Q�̏����̂ǂ��炩�����������ꍇ�̗�
  if (RandomNumber = 1) OR (RandomNumber = 6) then
    Memo1.Lines.Insert(0, '�P���U' );
end;

procedure TForm1.ButtonClearMemoClick(Sender: TObject);
{ Memo1 �̓��e���N���A���� }
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.ButtonLoopRepeatClick(Sender: TObject);
{ repeat �` until �ɂ���������̗� }
var
  RandomNumber1, RandomNumber2: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // repeat �` until �́u���[�v���������Ȃ��Ƃ��P����s���A
  // ���������������܂Ń��[�v���J��Ԃ��v�悤�ɓ��삷��B
  repeat
    // �Q�̂��������U��B
    RandomNumber1 := Random(6) + 1;
    RandomNumber2 := Random(6) + 1;

    // �]���ڂł͂Ȃ��Ȃ烁�b�Z�[�W���o���B
    if (RandomNumber1 <> RandomNumber2) then
      Memo1.Lines.Insert(0,
        RandomNumber1.toString + '-' + RandomNumber2.toString + ' �͂���' );

    // �����܂ł̏������]���ڂɂȂ�܂ő�����B
  until (RandomNumber1 = RandomNumber2);

  // ���[�v�𔲂�����Ԃ͕K���]���ڂł���B
  Memo1.Lines.Insert(0,
    RandomNumber1.toString + '-' + RandomNumber2.toString + ' �]���ڃL�^�[' );
end;

procedure TForm1.ButtonLoopWhileClick(Sender: TObject);
{ while �ɂ���������̗� }
var
  RandomNumber1, RandomNumber2: Integer;
begin
  Memo1.Lines.Insert(0,'');

  // ����̂�������U��
  RandomNumber1 := Random(6) + 1;
  RandomNumber2 := Random(6) + 1;

  // while �́u�����𖞂����Ԃ̓��[�v�𑱂���v
  // ������ŏ��̒l��r�̂Ƃ��ɏ����𖞂����Ȃ��ꍇ��
  // ���[�v�����s���Ȃ��B
  // �����ł́u�Q�̒l���Ⴄ�v�Ԃ̓��[�v�𑱂���B
  while (RandomNumber1 <> RandomNumber2) do
  begin
    Memo1.Lines.Insert(0,
      RandomNumber1.toString + '-' + RandomNumber2.toString + ' �͂���' );

    // �]���ڂ��o�Ă��Ȃ��̂ŁA���[�v�̒��ōēx���������U��B
    // ����̃P�[�X�ł͓��������� while �̒��ƊO��
    // �Q�����L�q���˂΂Ȃ炸�A���̂悤�ȏ����� while �ɂ͌����Ȃ��B
    RandomNumber1 := Random(6) + 1;
    RandomNumber2 := Random(6) + 1;
  end;

  // ���[�v�𔲂�����Ԃ͕K���]���ڂł���B
  Memo1.Lines.Insert(0,
    RandomNumber1.toString + '-' + RandomNumber2.toString + ' �]���ڃL�^�[' );

end;

end.
