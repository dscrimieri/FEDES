program FEDES;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

uses
{$IFNDEF FPC}
  Interfaces,
{$ELSE}
{$ENDIF}
  Forms, Interfaces,
  main in 'main.pas' {MainForm},
  about in 'about.pas' {Form_about};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'FEDES';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm_about, Form_about);
  Application.Run;
end.
