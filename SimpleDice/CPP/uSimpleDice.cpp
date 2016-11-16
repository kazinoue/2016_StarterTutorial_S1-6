//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "uSimpleDice.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm2::ButtonThrowDiceClick(TObject *Sender)
{
	// �ϐ� DiceValue �̒�`
	int DiceValue;

	// Random(6) �� 0, 1, 2, 3, 4, 5 �̒l���Ƃ�̂ŁA
	// ��������Ƃ��Ďg�����߂� + 1 ����B
	DiceValue = Random(6) + 1;

	// Memo1 �̐擪�ɂ�������̒l���������ށB
	// DiceValue �͐��l�^�iint) �����ǁA
	// �\���̍ۂ͕�����^�ɂ���K�v������̂� IntToStr �Ō^�ϊ�����B
	Memo1->Lines->Insert(0,IntToStr(DiceValue));

	// if���ɂ���������
	// Delphi�Ƃ͈Ⴂ�Athen ���L�q����K�v�͂Ȃ�
	if (DiceValue == 1)
		Memo1->Lines->Insert(0,L"1�̖ڂ��o�܂���");
}
//---------------------------------------------------------------------------
void __fastcall TForm2::ButtonLoopWhileClick(TObject *Sender)
{
	// �ϐ� DiceValue �̒�`
	int DiceValue;

	Memo1->Lines->Insert(0,L"");

	// ����̃T�C�R���U��
	DiceValue = Random(6) + 1;

	// while ���[�v�́A�����𖞂����Ԃ͏��������s����B
	// �u1���o��܂ŌJ��Ԃ��v�Ƃ��������́u�P���o�Ȃ��Ԃ͌J��Ԃ��v��
	// �\�����邱�Ƃ��ł���B
	// �Ȃ��Awhile���[�v�͍ŏ��Ɍp�������̔�����s�����߁A
	// while �̑O�ɒl���ݒ肳��Ă��邱�Ƃ��K�v�B
	// �����ł́u1���o��܂� = 1���o�Ȃ��ԁv�̓��[�v�𑱂���B

	// Delphi �ł� <> �Ŕ�r�������AC++ �ł� != ��p����
	while (DiceValue != 1) {
		Memo1->Lines->Insert(0,IntToStr(DiceValue) + L" �͂���" );

		// ���[�v�̒��ŃT�C�R����U�鏈��
		DiceValue = Random(6) + 1;
	}
	// ���̏����� while �̌�ɂ���̂ŁA
	// ����̎����ł� while �̏������s�����ƂȂ������
	// ���Ȃ炸���s����鏈���ƂȂ�B
	Memo1->Lines->Insert(0,IntToStr(DiceValue) + L" �L�^�[" );
}
//---------------------------------------------------------------------------
void __fastcall TForm2::ButtonLoopUntilClick(TObject *Sender)
{
	// �ϐ� DiceValue �̒�`
	int DiceValue;

	Memo1->Lines->Insert(0,L"");

	// C/C++ �ɂ� repeat �` until �͖����A
	// ����� do �` while �Ƃ����`�� while ���[�v�������B
	// while �Ȃ̂ŋL�q���ׂ������̓��[�v�̌p�������ł���B
	// (repeat �̓��[�v�̏I������)
	do {
		// ���������U��B
		DiceValue = Random(6) + 1;

		// �O�q�� while ���[�v�Ɠ��l�� '�͂���' �̕������o�����߂ɂ�
		// ���[�v�̒��Œl�����؂��˂΂Ȃ�Ȃ��B
		if (DiceValue != 6)
		  Memo1->Lines->Insert(0,IntToStr(DiceValue) + L" �͂���");

	}
	// �����܂ł̃��[�v�̓��e�� 6 �̖ڂ��o��܂ő�����B
	while (DiceValue != 6);

	// Delphi �� repeat �Ɠ������W�b�N�Ŕ��莮�����������ꍇ��
	// �ȉ��̂悤�ɔ��莮�S�̂� ! ������΂悢�i���܂�Ӗ����Ȃ����j
	// while ( !(DiceValue == 6) );


	// ���̏����� until �̌�ɂ���̂ŁA
	// ����̎����ł� until �̏I���������������ꂽ���
	// ���Ȃ炸���s����鏈���ƂȂ�B
	Memo1->Lines->Insert(0,IntToStr(DiceValue) + L" �L�^�[" );
}
//---------------------------------------------------------------------------
