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
    { private 宣言 }
    RandomNumber:  Integer;
    CountSeikai:   Integer;
    CountMachigai: Integer;

    DateTimeStart: TDateTime;
    CountQuestion: Integer;
    procedure UpdateNumber;

  public
    { public 宣言 }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.UpdateNumber();
{ 出題する数値を更新する処理。このフォームだけで使用する。 }
var
  RandomNumberNew: Integer;
begin
  //
  RandomNumberNew := RandomNumber;

  while RandomNumberNew = RandomNumber do
  begin
    // 数値をランダムに書き換える。
    RandomNumberNew := Random(10);
  end;

  RandomNumber := RandomNumberNew;
  TextRandomNumber.text := RandomNumber.toString;

  // 出題された問題の数を管理する変数の値を増やす。
  CountQuestion := CountQuestion + 1;
end;

procedure TForm2.Button1Click(Sender: TObject);
{ 開始ボタンを押したときの処理 }
begin
  // 開始時点の日時を保持しておく。
  DateTimeStart := Now;

  // 解いた問題数のカウンタを 0 に戻す。
  CountQuestion := 0;
  CountSeikai   := 0;
  CountMachigai := 0;

  // 正解、失敗数の表示をゼロに戻す。
  TextSeikai.Text   := CountSeikai.toString;
  TextMachigai.Text := CountMachigai.toString;

  // 〇×の表示を消す。
  Circle1.Visible := False;
  Line1.Visible   := False;

  // リストボックスを非選択状態にして利用可能にする。
  ListBox1.ClearSelection;
  ListBox1.Enabled := True;

  // 1問目のランダムな数値を作る。
  UpdateNumber;
end;

procedure TForm2.FormCreate(Sender: TObject);
{ アプリ実行開始時の処理 }
begin
  // 乱数値を保持する変数の初期値は、有効な値以外にセットしておく。
  RandomNumber := -1;

  // 一部のコンポーネントについては、ここで表示不可設定および使用不可設定を確実に入れておく。
  // こうしておけばデザインフォーム側でのプロパティの値によらず確実に設定できる。
  Circle1.Visible  := False;
  Line1.Visible    := False;
  ListBox1.Enabled := False;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin

  // 出題された数字と回答した数字をペアで表示する。
  Memo1.Lines.Insert(0,
    Format(
      '表示 = %d, 選んだ数値 = %s',
      [RandomNumber,ListBox1.Selected.Text]
    )
  );

  if (RandomNumber.toString = ListBox1.Selected.Text) then
  // 正しい回答の場合
  begin
    Memo1.Lines.Insert(0, '[正解]');

    CountSeikai     := CountSeikai + 1;
    TextSeikai.Text := CountSeikai.toString;

    Circle1.Visible := True;
    Line1.Visible   := False;
  end
  else
  // 間違った回答の場合
  begin
    Memo1.Lines.Insert(0, '[不正解]');

    CountMachigai     := CountMachigai + 1;
    TextMachigai.Text := CountMachigai.toString;

    Line1.Visible     := True;
    Circle1.Visible   := False;
  end;

  if (CountQuestion < 10 ) then
  // 解いた問題数が10問に達していないなら、次の問題を作る
    UpdateNumber
  else
  // 10問解き終わったときの処理。
  begin
    Memo1.Lines.Insert(0,Format('回答時間 %.2f' , [86400*(Now - DateTimeStart)] ) );
    Memo1.Lines.Insert(0,Format('正答数   %d'   , [CountSeikai]) );
    Memo1.Lines.Insert(0,Format('正答率   %.0f %%', [100*CountSeikai/10] ) );

    ListBox1.Enabled := False;
    exit;
  end;

end;

end.
