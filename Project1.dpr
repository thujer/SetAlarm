program Project1;

uses
  Forms,
  SetAlarm in 'SetAlarm.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
