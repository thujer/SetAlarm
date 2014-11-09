unit SetAlarm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Spin, SmallPort, COM232;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SetAlarmButton: TBitBtn;
    CancelButton: TBitBtn;
    CMOSAlarm: TStaticText;
    Label1: TLabel;
    ActTime: TStaticText;
    Label2: TLabel;
    Timer1: TTimer;
    Label5: TLabel;
    UpDownH: TUpDown;
    UpDownM: TUpDown;
    UpDownS: TUpDown;
    Label6: TLabel;
    AlarmINT: TLabel;
    AlarmINT2: TLabel;
    DisableAlarmButton: TBitBtn;
    COM2321: TCOM232;
    XPort: TSmallPort;
    procedure CancelButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpDownHClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownMClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownSClick(Sender: TObject; Button: TUDBtnType);
    procedure SetAlarmButtonClick(Sender: TObject);
    procedure DisableAlarmButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AlarmH,AlarmM,AlarmS: Byte;
  TimeH,TimeM,TimeS: Byte;

implementation

{$R *.DFM}


function ReadCMOSByte(Adr: Byte) : Byte;
begin
  Form1.XPort.WriteByte($70,Adr);
  ReadCMOSByte:=Form1.XPort.ReadByte($71);
end;



procedure WriteCMOSByte(Adr: Byte; Data: Byte);
begin
  Form1.XPort.WriteByte($70,Adr);
  Form1.XPort.WriteByte($71,Data);
end;


procedure GetCMOSAlarm;
begin
  AlarmH:=ReadCMOSByte(5);
  AlarmM:=ReadCMOSByte(3);
  AlarmS:=ReadCMOSByte(1);
end;

procedure GetCMOSTime;
begin
  TimeH:=ReadCMOSByte(4);
  TimeM:=ReadCMOSByte(2);
  TimeS:=ReadCMOSByte(0);
end;


procedure WriteCMOSAlarm;
begin
  WriteCMOSByte(5,AlarmH);
  WriteCMOSByte(3,AlarmM);
  WriteCMOSByte(1,AlarmS);
end;


procedure TForm1.CancelButtonClick(Sender: TObject);
begin
  Close;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  GetCMOSTime;
  ActTime.Caption:=IntToHex(TimeH,2)+':'+
                   IntToHex(TimeM,2)+':'+
                   IntToHex(TimeS,2);
  if (ReadCMOSByte(11) and 32)=32 then
    AlarmINT.Caption:='Enable' else AlarmINT.Caption:='Disable';

  if (ReadCMOSByte(12) and 32)=32 then
    AlarmINT2.Caption:='ON' else AlarmINT2.Caption:='OFF';
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  GetCMOSTime;
  ActTime.Caption:=IntToHex(TimeH,2)+':'+
                   IntToHex(TimeM,2)+':'+
                   IntToHex(TimeS,2);
  GetCMOSAlarm;
  UpDownH.Position:=AlarmH;
  UpDownM.Position:=AlarmM;
  UpDownS.Position:=AlarmS;
  CMOSAlarm.Caption:=IntToHex(AlarmH,2)+':'+
                     IntToHex(AlarmM,2)+':'+
                     IntToHex(AlarmS,2);
end;


procedure TForm1.UpDownHClick(Sender: TObject; Button: TUDBtnType);
begin
  AlarmH:=UpDownH.Position;
  CMOSAlarm.Caption:=IntToHex(AlarmH,2)+':'+
                     IntToHex(AlarmM,2)+':'+
                     IntToHex(AlarmS,2);
  SetAlarmButton.Enabled:=True;
end;


procedure TForm1.UpDownMClick(Sender: TObject; Button: TUDBtnType);
begin
  AlarmM:=UpDownM.Position;
  CMOSAlarm.Caption:=IntToHex(AlarmH,2)+':'+
                     IntToHex(AlarmM,2)+':'+
                     IntToHex(AlarmS,2);
  SetAlarmButton.Enabled:=True;
end;


procedure TForm1.UpDownSClick(Sender: TObject; Button: TUDBtnType);
begin
  AlarmS:=UpDownS.Position;
  CMOSAlarm.Caption:=IntToHex(AlarmH,2)+':'+
                     IntToHex(AlarmM,2)+':'+
                     IntToHex(AlarmS,2);
  SetAlarmButton.Enabled:=True;
end;


procedure TForm1.SetAlarmButtonClick(Sender: TObject);
begin
  WriteCMOSAlarm;
  WriteCMOSByte(11,ReadCMOSByte(11) or 32);

  GetCMOSAlarm;
  CMOSAlarm.Caption:=IntToHex(AlarmH,2)+':'+
                     IntToHex(AlarmM,2)+':'+
                     IntToHex(AlarmS,2);
  CancelButton.Caption:='Exit';
  SetAlarmButton.Enabled:=False;
end;

procedure TForm1.DisableAlarmButtonClick(Sender: TObject);
begin
  WriteCMOSByte(11,ReadCMOSByte(11) and (255-32));
  CancelButton.Caption:='Exit';
  SetAlarmButton.Enabled:=True;
end;

end.
