object Form1: TForm1
  Left = 514
  Top = 106
  VertScrollBar.Style = ssFlat
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Set CMOS alarm'
  ClientHeight = 259
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 296
    Height = 259
    Align = alClient
    Color = clTeal
    TabOrder = 0
    object Label1: TLabel
      Left = 176
      Top = 40
      Width = 88
      Height = 16
      Caption = 'CMOS Alarm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 124
      Height = 16
      Caption = 'Aktual CMOS time'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 136
      Width = 121
      Height = 13
      Caption = 'Alarm interupt enable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 176
      Top = 136
      Width = 71
      Height = 13
      Caption = 'Alarm active'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object AlarmINT: TLabel
      Left = 56
      Top = 152
      Width = 40
      Height = 13
      Caption = 'Enable'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object AlarmINT2: TLabel
      Left = 192
      Top = 152
      Width = 24
      Height = 13
      Caption = 'OFF'
      Color = clLime
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object SetAlarmButton: TBitBtn
      Left = 32
      Top = 184
      Width = 89
      Height = 25
      Caption = 'Set alarm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = SetAlarmButtonClick
    end
    object CancelButton: TBitBtn
      Left = 168
      Top = 184
      Width = 89
      Height = 25
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = CancelButtonClick
    end
    object CMOSAlarm: TStaticText
      Left = 176
      Top = 56
      Width = 83
      Height = 28
      AutoSize = False
      Caption = '12:00:00'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object ActTime: TStaticText
      Left = 32
      Top = 56
      Width = 83
      Height = 28
      AutoSize = False
      Caption = '12:00:00'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object UpDownH: TUpDown
      Left = 184
      Top = 88
      Width = 17
      Height = 33
      Min = 0
      Max = 35
      Position = 0
      TabOrder = 4
      Wrap = False
      OnClick = UpDownHClick
    end
    object UpDownM: TUpDown
      Left = 208
      Top = 88
      Width = 17
      Height = 33
      Min = 0
      Max = 89
      Position = 0
      TabOrder = 5
      Wrap = False
      OnClick = UpDownMClick
    end
    object UpDownS: TUpDown
      Left = 232
      Top = 88
      Width = 17
      Height = 33
      Min = 0
      Max = 89
      Position = 0
      TabOrder = 6
      Wrap = False
      OnClick = UpDownSClick
    end
    object DisableAlarmButton: TBitBtn
      Left = 32
      Top = 224
      Width = 89
      Height = 25
      Caption = 'Disable alarm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = DisableAlarmButtonClick
    end
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 128
    Top = 56
  end
  object COM2321: TCOM232
  end
  object XPort: TSmallPort
    Opened = True
    Left = 32
  end
end
