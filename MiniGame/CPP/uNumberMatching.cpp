//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "uNumberMatching.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm1 *Form1;
//---------------------------------------------------------------------------
// アプリ実行開始時の処理
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
  // 乱数値を保持する変数の初期値は、有効な値以外にセットしておく。
  RandomNumber = -1;

  // 一部のコンポーネントについては、ここで表示不可設定および使用不可設定を確実に入れておく。
  // こうしておけばデザインフォーム側でのプロパティの値によらず確実に設定できる。
  Circle1->Visible  = False;
  Line1->Visible    = False;
  ListBox1->Enabled = False;
}

// 【注意】共通の変数宣言は uNumberMatching.h で行っています。

//---------------------------------------------------------------------------
// 出題する数値を更新する処理。このフォームだけで使用する。
void __fastcall TForm1::UpdateNumber(void)
{
	int RandomNumberNew;

	// 直前のランダム値と異なる値が出ている間は乱数を取得し続ける。
	// Delphi の repeat ～ until とは終了条件が違うことに注意する。
	do {
		// 数値をランダムに書き換える。
		RandomNumberNew = Random(10);
	}
	while (RandomNumberNew == RandomNumber);

	// 最終的に決定された値を代入する。
	RandomNumber = RandomNumberNew;
	TextRandomNumber->Text = IntToStr(RandomNumber);

	// 出題された問題の数を管理する変数の値を増やす。
	CountQuestion = CountQuestion + 1;
}

//---------------------------------------------------------------------------
// 開始ボタンを押したときの処理
void __fastcall TForm1::Button1Click(TObject *Sender)
{

	// 開始時点の日時を保持しておく。
	DateTimeStart = Now();

	// 解いた問題数のカウンタを 0 に戻す。
	CountQuestion = 0;
	CountSeikai   = 0;
	CountMachigai = 0;

	// 正解、失敗数の表示をゼロに戻す。
	TextSeikai->Text   = IntToStr(CountSeikai);
	TextMachigai->Text = IntToStr(CountMachigai);

	// 〇×の表示を消す。
	Circle1->Visible = False;
	Line1->Visible   = False;

	// リストボックスを非選択状態にして利用可能にする。
	ListBox1->ClearSelection();
	ListBox1->Enabled = True;

	// 1問目のランダムな数値を作る。
	UpdateNumber();
}
//---------------------------------------------------------------------------
// リストボックスの数値をクリックしたときの処理
void __fastcall TForm1::ListBox1Click(TObject *Sender)
{

	// 出題された数字と回答した数字をペアで表示する。
	Memo1->Lines->Insert(0,
		UnicodeString().sprintf(
			L"表示 = %d, 選んだ数値 = %s",
			RandomNumber,ListBox1->Selected->Text
		)
	);

	if (IntToStr(RandomNumber) == ListBox1->Selected->Text)
	{
		// 正しい回答の場合
		Memo1->Lines->Insert(0, L"[正解]");

		// C/C++ の書き方なら、普通は CountSeikai++ と書く。
		CountSeikai      = CountSeikai + 1;
		TextSeikai->Text = IntToStr(CountSeikai);

		// 〇を表示して×を消す
		Circle1->Visible = True;
		Line1->Visible   = False;
	}
	else
	{
		// 間違った回答の場合
		Memo1->Lines->Insert(0, L"[不正解]");

		// C/C++ の書き方なら、普通は CountMachigai++ と書く。
		CountMachigai      = CountMachigai + 1;
		TextMachigai->Text = IntToStr(CountMachigai);

		// ×を表示して〇を消す
		Line1->Visible     = True;
		Circle1->Visible   = False;
	}

	if (CountQuestion < 10 ) {
		// 解いた問題数が10問に達していないなら、次の問題を作る
		UpdateNumber();
	}
	else
	{
		// 10問解き終わったときの処理。
		// 計算結果が実数（小数点付きの値）となる箇所については
		// 計算後の変数型を指定しておかないと意図しない計算結果になることがある。
		Memo1->Lines->Insert(0,
			UnicodeString().sprintf(
				L"回答時間 %.2f", static_cast<float>(86400*(Now() - DateTimeStart) )
			)
		);
		Memo1->Lines->Insert(0,UnicodeString().sprintf(L"正答数   %d"     , CountSeikai ) );
		Memo1->Lines->Insert(0,
			UnicodeString().sprintf(
				L"正答率   %.0f %%", static_cast<float>(100*CountSeikai/10)
			)
		);

		// もう回答させないのでリストボックスを無効化
		ListBox1->Enabled = False;
	}
}
//---------------------------------------------------------------------------
