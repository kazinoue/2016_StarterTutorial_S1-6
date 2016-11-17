//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "uNumberMatching.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm1 *Form1;
//---------------------------------------------------------------------------
// �A�v�����s�J�n���̏���
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
  // �����l��ێ�����ϐ��̏����l�́A�L���Ȓl�ȊO�ɃZ�b�g���Ă����B
  RandomNumber = -1;

  // �ꕔ�̃R���|�[�l���g�ɂ��ẮA�����ŕ\���s�ݒ肨��юg�p�s�ݒ���m���ɓ���Ă����B
  // �������Ă����΃f�U�C���t�H�[�����ł̃v���p�e�B�̒l�ɂ�炸�m���ɐݒ�ł���B
  Circle1->Visible  = False;
  Line1->Visible    = False;
  ListBox1->Enabled = False;
}

// �y���Ӂz���ʂ̕ϐ��錾�� uNumberMatching.h �ōs���Ă��܂��B

//---------------------------------------------------------------------------
// �o�肷�鐔�l���X�V���鏈���B���̃t�H�[�������Ŏg�p����B
void __fastcall TForm1::UpdateNumber(void)
{
	int RandomNumberNew;

	// ���O�̃����_���l�ƈقȂ�l���o�Ă���Ԃ͗������擾��������B
	// Delphi �� repeat �` until �Ƃ͏I���������Ⴄ���Ƃɒ��ӂ���B
	do {
		// ���l�������_���ɏ���������B
		RandomNumberNew = Random(10);
	}
	while (RandomNumberNew == RandomNumber);

	// �ŏI�I�Ɍ��肳�ꂽ�l��������B
	RandomNumber = RandomNumberNew;
	TextRandomNumber->Text = IntToStr(RandomNumber);

	// �o�肳�ꂽ���̐����Ǘ�����ϐ��̒l�𑝂₷�B
	CountQuestion = CountQuestion + 1;
}

//---------------------------------------------------------------------------
// �J�n�{�^�����������Ƃ��̏���
void __fastcall TForm1::Button1Click(TObject *Sender)
{

	// �J�n���_�̓�����ێ����Ă����B
	DateTimeStart = Now();

	// ��������萔�̃J�E���^�� 0 �ɖ߂��B
	CountQuestion = 0;
	CountSeikai   = 0;
	CountMachigai = 0;

	// �����A���s���̕\�����[���ɖ߂��B
	TextSeikai->Text   = IntToStr(CountSeikai);
	TextMachigai->Text = IntToStr(CountMachigai);

	// �Z�~�̕\���������B
	Circle1->Visible = False;
	Line1->Visible   = False;

	// ���X�g�{�b�N�X���I����Ԃɂ��ė��p�\�ɂ���B
	ListBox1->ClearSelection();
	ListBox1->Enabled = True;

	// 1��ڂ̃����_���Ȑ��l�����B
	UpdateNumber();
}
//---------------------------------------------------------------------------
// ���X�g�{�b�N�X�̐��l���N���b�N�����Ƃ��̏���
void __fastcall TForm1::ListBox1Click(TObject *Sender)
{

	// �o�肳�ꂽ�����Ɖ񓚂����������y�A�ŕ\������B
	Memo1->Lines->Insert(0,
		UnicodeString().sprintf(
			L"�\�� = %d, �I�񂾐��l = %s",
			RandomNumber,ListBox1->Selected->Text
		)
	);

	if (IntToStr(RandomNumber) == ListBox1->Selected->Text)
	{
		// �������񓚂̏ꍇ
		Memo1->Lines->Insert(0, L"[����]");

		// C/C++ �̏������Ȃ�A���ʂ� CountSeikai++ �Ə����B
		CountSeikai      = CountSeikai + 1;
		TextSeikai->Text = IntToStr(CountSeikai);

		// �Z��\�����ā~������
		Circle1->Visible = True;
		Line1->Visible   = False;
	}
	else
	{
		// �Ԉ�����񓚂̏ꍇ
		Memo1->Lines->Insert(0, L"[�s����]");

		// C/C++ �̏������Ȃ�A���ʂ� CountMachigai++ �Ə����B
		CountMachigai      = CountMachigai + 1;
		TextMachigai->Text = IntToStr(CountMachigai);

		// �~��\�����āZ������
		Line1->Visible     = True;
		Circle1->Visible   = False;
	}

	if (CountQuestion < 10 ) {
		// ��������萔��10��ɒB���Ă��Ȃ��Ȃ�A���̖������
		UpdateNumber();
	}
	else
	{
		// 10������I������Ƃ��̏����B
		// �v�Z���ʂ������i�����_�t���̒l�j�ƂȂ�ӏ��ɂ��Ă�
		// �v�Z��̕ϐ��^���w�肵�Ă����Ȃ��ƈӐ}���Ȃ��v�Z���ʂɂȂ邱�Ƃ�����B
		Memo1->Lines->Insert(0,
			UnicodeString().sprintf(
				L"�񓚎��� %.2f", static_cast<float>(86400*(Now() - DateTimeStart) )
			)
		);
		Memo1->Lines->Insert(0,UnicodeString().sprintf(L"������   %d"     , CountSeikai ) );
		Memo1->Lines->Insert(0,
			UnicodeString().sprintf(
				L"������   %.0f %%", static_cast<float>(100*CountSeikai/10)
			)
		);

		// �����񓚂����Ȃ��̂Ń��X�g�{�b�N�X�𖳌���
		ListBox1->Enabled = False;
	}
}
//---------------------------------------------------------------------------
