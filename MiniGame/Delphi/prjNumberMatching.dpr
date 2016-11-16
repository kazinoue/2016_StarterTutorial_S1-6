program prjNumberMatching;

uses
  System.StartUpCopy,
  FMX.Forms,
  uNumberMatching in 'uNumberMatching.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
