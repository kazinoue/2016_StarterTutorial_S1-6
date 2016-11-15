unit uNumberMatching;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  FMX.ScrollBox, FMX.Memo, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, FMX.Edit;

type
  TForm2 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Memo1: TMemo;
    Rectangle1: TRectangle;
    TextSeikai: TText;
    Rectangle2: TRectangle;
    TextMachigai: TText;
    Circle1: TCircle;
    Line1: TLine;
    Line2: TLine;
    Rectangle3: TRectangle;
    TextRandomNumber: TText;
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private �錾 }
    RandomNumber:  Integer;
    CountSeikai:   Integer;
    CountMachigai: Integer;

    DateTimeStart: TDateTime;
    CountQuestion: Integer;
    procedure UpdateNumber;

  public
    { public �錾 }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.UpdateNumber();
{ �o�肷�鐔�l���X�V���鏈���B���̃t�H�[�������Ŏg�p����B }
var
  RandomNumberNew: Integer;
begin
  //
  RandomNumberNew := RandomNumber;

  while RandomNumberNew = RandomNumber do
  begin
    // ���l�������_���ɏ���������B
    RandomNumberNew := Random(10);
  end;

  RandomNumber := RandomNumberNew;
  TextRandomNumber.text := RandomNumber.toString;

  // �o�肳�ꂽ���̐����Ǘ�����ϐ��̒l�𑝂₷�B
  CountQuestion := CountQuestion + 1;
end;

procedure TForm2.Button1Click(Sender: TObject);
{ �J�n�{�^�����������Ƃ��̏��� }
begin
  // �J�n���_�̓�����ێ����Ă����B
  DateTimeStart := Now;

  // ��������萔�̃J�E���^�� 0 �ɖ߂��B
  CountQuestion := 0;
  CountSeikai   := 0;
  CountMachigai := 0;

  // �����A���s���̕\�����[���ɖ߂��B
  TextSeikai.Text   := CountSeikai.toString;
  TextMachigai.Text := CountMachigai.toString;

  // �Z�~�̕\���������B
  Circle1.Visible := False;
  Line1.Visible   := False;

  // ���X�g�{�b�N�X���I����Ԃɂ��ė��p�\�ɂ���B
  ListBox1.ClearSelection;
  ListBox1.Enabled := True;

  // 1��ڂ̃����_���Ȑ��l�����B
  UpdateNumber;
end;

procedure TForm2.FormCreate(Sender: TObject);
{ �A�v�����s�J�n���̏��� }
begin
  // �����l��ێ�����ϐ��̏����l�́A�L���Ȓl�ȊO�ɃZ�b�g���Ă����B
  RandomNumber := -1;

  // �ꕔ�̃R���|�[�l���g�ɂ��ẮA�����ŕ\���s�ݒ肨��юg�p�s�ݒ���m���ɓ���Ă����B
  // �������Ă����΃f�U�C���t�H�[�����ł̃v���p�e�B�̒l�ɂ�炸�m���ɐݒ�ł���B
  Circle1.Visible  := False;
  Line1.Visible    := False;
  ListBox1.Enabled := False;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin

  // �o�肳�ꂽ�����Ɖ񓚂����������y�A�ŕ\������B
  Memo1.Lines.Insert(0,
    Format(
      '�\�� = %d, �I�񂾐��l = %s',
      [RandomNumber,ListBox1.Selected.Text]
    )
  );

  if (RandomNumber.toString = ListBox1.Selected.Text) then
  // �������񓚂̏ꍇ
  begin
    Memo1.Lines.Insert(0, '[����]');

    CountSeikai     := CountSeikai + 1;
    TextSeikai.Text := CountSeikai.toString;

    Circle1.Visible := True;
    Line1.Visible   := False;
  end
  else
  // �Ԉ�����񓚂̏ꍇ
  begin
    Memo1.Lines.Insert(0, '[�s����]');

    CountMachigai     := CountMachigai + 1;
    TextMachigai.Text := CountMachigai.toString;

    Line1.Visible     := True;
    Circle1.Visible   := False;
  end;

  if (CountQuestion < 10 ) then
  // ��������萔��10��ɒB���Ă��Ȃ��Ȃ�A���̖������
    UpdateNumber
  else
  // 10������I������Ƃ��̏����B
  begin
    Memo1.Lines.Insert(0,Format('�񓚎��� %.2f' , [86400*(Now - DateTimeStart)] ) );
    Memo1.Lines.Insert(0,Format('������   %d'   , [CountSeikai]) );
    Memo1.Lines.Insert(0,Format('������   %.0f %%', [100*CountSeikai/10] ) );

    ListBox1.Enabled := False;
    exit;
  end;

end;

end.
