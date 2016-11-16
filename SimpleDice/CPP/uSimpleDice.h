//---------------------------------------------------------------------------

#ifndef uSimpleDiceH
#define uSimpleDiceH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Memo.hpp>
#include <FMX.ScrollBox.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
//---------------------------------------------------------------------------
class TForm2 : public TForm
{
__published:	// IDE �ŊǗ������R���|�[�l���g
	TButton *ButtonThrowDice;
	TMemo *Memo1;
	TButton *ButtonLoopWhile;
	TButton *ButtonLoopUntil;
	void __fastcall ButtonThrowDiceClick(TObject *Sender);
	void __fastcall ButtonLoopWhileClick(TObject *Sender);
	void __fastcall ButtonLoopUntilClick(TObject *Sender);
private:	// ���[�U�[�錾
public:		// ���[�U�[�錾
	__fastcall TForm2(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm2 *Form2;
//---------------------------------------------------------------------------
#endif
