object Form_about: TForm_about
  Left = 322
  Top = 133
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'About'
  ClientHeight = 161
  ClientWidth = 307
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 50
    Top = 16
    Width = 200
    Height = 24
    Caption = 'FEDES   Version 1.0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 26
    Top = 64
    Width = 251
    Height = 13
    Caption = '2009 FEDES (Finite Element Data Exchange System)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 46
    Width = 289
    Height = 2
  end
  object Bevel2: TBevel
    Left = 8
    Top = 111
    Width = 290
    Height = 2
  end
  object Label6: TLabel
    Left = 26
    Top = 92
    Width = 138
    Height = 13
    Caption = 'Developed by: Shukri Afazov'
  end
  object Bevel3: TBevel
    Left = 8
    Top = 187
    Width = 409
    Height = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 125
    Width = 307
    Height = 36
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 208
    ExplicitWidth = 410
    object Button1: TButton
      Left = 222
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
