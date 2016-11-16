//---------------------------------------------------------------------------

#ifndef uNumberMatchingH
#define uNumberMatchingH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.ListBox.hpp>
#include <FMX.Memo.hpp>
#include <FMX.Objects.hpp>
#include <FMX.ScrollBox.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE で管理されるコンポーネント
	TButton *Button1;
	TRectangle *Rectangle1;
	TText *TextSeikai;
	TRectangle *Rectangle2;
	TText *TextMachigai;
	TMemo *Memo1;
	TRectangle *Rectangle3;
	TCircle *Circle1;
	TLine *Line1;
	TLine *Line2;
	TListBox *ListBox1;
	TText *TextRandomNumber;
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall ListBox1Click(TObject *Sender);
private:	// ユーザー宣言
	int RandomNumber;
	int CountSeikai;
	int CountMachigai;
	int CountQuestion;
	TDateTime DateTimeStart;
	void __fastcall UpdateNumber(void);
public:		// ユーザー宣言
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
