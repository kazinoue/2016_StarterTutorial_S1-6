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
	// 変数 DiceValue の定義
	int DiceValue;

	// Random(6) は 0, 1, 2, 3, 4, 5 の値をとるので、
	// さいころとして使うために + 1 する。
	DiceValue = Random(6) + 1;

	// Memo1 の先頭にさいころの値を差し込む。
	// DiceValue は数値型（int) だけど、
	// 表示の際は文字列型にする必要があるので IntToStr で型変換する。
	Memo1->Lines->Insert(0,IntToStr(DiceValue));

	// if文による条件分岐
	// Delphiとは違い、then を記述する必要はない
	if (DiceValue == 1)
		Memo1->Lines->Insert(0,L"1の目が出ました");
}
//---------------------------------------------------------------------------
void __fastcall TForm2::ButtonLoopWhileClick(TObject *Sender)
{
	// 変数 DiceValue の定義
	int DiceValue;

	Memo1->Lines->Insert(0,L"");

	// 初回のサイコロ振り
	DiceValue = Random(6) + 1;

	// while ループは、条件を満たす間は処理を実行する。
	// 「1が出るまで繰り返す」という処理は「１が出ない間は繰り返す」と
	// 表現することができる。
	// なお、whileループは最初に継続条件の判定を行うため、
	// while の前に値が設定されていることが必要。
	// ここでは「1が出るまで = 1が出ない間」はループを続ける。

	// Delphi では <> で比較したが、C++ では != を用いる
	while (DiceValue != 1) {
		Memo1->Lines->Insert(0,IntToStr(DiceValue) + L" はずれ" );

		// ループの中でサイコロを振る処理
		DiceValue = Random(6) + 1;
	}
	// この処理は while の後にあるので、
	// 今回の実装では while の条件が不成立となった後に
	// かならず実行される処理となる。
	Memo1->Lines->Insert(0,IntToStr(DiceValue) + L" キター" );
}
//---------------------------------------------------------------------------
void __fastcall TForm2::ButtonLoopUntilClick(TObject *Sender)
{
	// 変数 DiceValue の定義
	int DiceValue;

	Memo1->Lines->Insert(0,L"");

	// C/C++ には repeat ～ until は無く、
	// 代わりに do ～ while という形で while ループを書く。
	// while なので記述すべき条件はループの継続条件である。
	// (repeat はループの終了条件)
	do {
		// さいころを振る。
		DiceValue = Random(6) + 1;

		// 前述の while ループと同様に 'はずれ' の文字を出すためには
		// ループの中で値を検証せねばならない。
		if (DiceValue != 6)
		  Memo1->Lines->Insert(0,IntToStr(DiceValue) + L" はずれ");

	}
	// ここまでのループの内容を 6 の目が出るまで続ける。
	while (DiceValue != 6);

	// Delphi の repeat と同じロジックで判定式を書きたい場合は
	// 以下のように判定式全体に ! をつければよい（あまり意味がないが）
	// while ( !(DiceValue == 6) );


	// この処理は until の後にあるので、
	// 今回の実装では until の終了条件が満たされた後に
	// かならず実行される処理となる。
	Memo1->Lines->Insert(0,IntToStr(DiceValue) + L" キター" );
}
//---------------------------------------------------------------------------
