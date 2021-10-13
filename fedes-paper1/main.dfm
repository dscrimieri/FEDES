object MainForm: TMainForm
  Left = 183
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FEDES'
  ClientHeight = 648
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 672
    Height = 648
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 688
    object TabSheet1: TTabSheet
      Caption = 'ABAQUS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnEnter = TabSheet1Enter
      ExplicitHeight = 651
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 649
        Height = 57
        Caption = 'Choose software with result data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object AbaqusAbaqus: TRadioButton
          Left = 16
          Top = 24
          Width = 65
          Height = 17
          Cursor = crHandPoint
          Caption = 'ABAQUS'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = AbaqusAbaqusClick
        end
        object AbaqusAnsys: TRadioButton
          Left = 128
          Top = 24
          Width = 57
          Height = 17
          Cursor = crHandPoint
          Caption = 'ANSYS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 1
          OnClick = AbaqusAnsysClick
        end
        object AbaqusDeform: TRadioButton
          Left = 326
          Top = 24
          Width = 65
          Height = 17
          Cursor = crHandPoint
          Caption = 'DEFORM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 2
          OnClick = AbaqusDeformClick
        end
        object AbaqusVulcan: TRadioButton
          Left = 440
          Top = 24
          Width = 73
          Height = 17
          Cursor = crHandPoint
          Caption = 'VULCAN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 3
          OnClick = AbaqusVulcanClick
        end
        object AbaqusMorfeo: TRadioButton
          Left = 552
          Top = 24
          Width = 81
          Height = 17
          Cursor = crHandPoint
          Caption = 'XML'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 4
          OnClick = AbaqusMorfeoClick
        end
        object AbaqusMarc: TRadioButton
          Left = 231
          Top = 24
          Width = 57
          Height = 17
          Cursor = crHandPoint
          Caption = 'MARC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 5
          OnClick = AbaqusMarcClick
        end
      end
      object Panel2: TPanel
        Left = 8
        Top = 72
        Width = 649
        Height = 160
        BevelOuter = bvLowered
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 54
          Width = 261
          Height = 16
          Caption = 'Please append the output file for model one:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 105
          Width = 250
          Height = 16
          Caption = 'Please append the input file for model two:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 253
          Height = 16
          Caption = 'Please append the input file for model one:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EditAbaqus1: TEdit
          Left = 8
          Top = 24
          Width = 441
          Height = 24
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object BitBtnAbaqus1: TBitBtn
          Left = 472
          Top = 24
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtnAbaqus1Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object EditAbaqus2: TEdit
          Left = 8
          Top = 72
          Width = 441
          Height = 24
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object BitBtnAbaqus2: TBitBtn
          Left = 472
          Top = 72
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = BitBtnAbaqus2Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtnAbaqus3: TBitBtn
          Left = 472
          Top = 120
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BitBtnAbaqus3Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object EditAbaqus3: TEdit
          Left = 8
          Top = 120
          Width = 441
          Height = 24
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
      end
      object Panel6: TPanel
        Left = 8
        Top = 238
        Width = 649
        Height = 41
        BevelOuter = bvLowered
        TabOrder = 2
        object BitBtnAbaqus4: TBitBtn
          Left = 472
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Read data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtnAbaqus4Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000010000000000000101
            0100020202000303030004040400050505000606060007070700080808000909
            09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
            1100121212001313130014141400151515001616160017171700181818001919
            19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
            2100222222002323230024242400252525002626260027272700282828002929
            29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
            3100323232003333330034343400353535003636360037373700383838003939
            39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
            4100424242004343430044444400454545004646460047474700484848004949
            49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
            5100525252005353530054545400555555005656560057575700585858005959
            59005A5A5A005B5B5B005F5F5F0064636300686868006C6B6B00727171007777
            77007C7B7B007F7F7F008382820086858500898888008E8D8D00919090009392
            9200959494009695950096959500969595009695950097969600979696009796
            96009796960098969600999797009A9898009C9999009E9B9B00A19D9D00A39E
            9E00A59F9F00A6A0A000A8A0A000AAA1A100ACA3A200ADA3A300AEA3A300AFA4
            A400B0A5A400B1A6A600B2A8A800B4ABAB00BAAFAE00BEB2B200B9B3B400B0B4
            B700A8B5BB009DB7C00093BAC60089BECD0081BFD10074C1D6006CC1D90064C1
            DA005EC1DC0057C1DD004FC2E1004AC5E50045C7E90041C9EB003ACBEF0033CD
            F2002DCFF40027D0F70020D0F8001DD1FA0022D1F9002DD3F9003CD5F8004AD7
            F70056D9F7005DD9F60063DAF60067DAF6006BDBF60070DCF50076DEF5007FDF
            F5008BE2F50091E3F50096E4F5009DE3F200A3E3F100AEE2ED00B9E1EA00C4E1
            E700CFE1E500D4E1E500D7E1E500DCE1E400E0E0E300E2DFE300E3DBE400E4D4
            E500E7C4E700ECAAEA00F090ED00F378F000F55BF300F935F800FC15FB00FE09
            FD00FE02FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00F703FC00E50EF500C91DEC00A034DF007F47D4006954CD00575EC6004768
            C1003970BC002D78B800237EB4001A82B2001585B0001486B0001587B1001488
            B2001488B3001589B400168AB400178AB500178CB600188DB8001A8FBA001B91
            BC001B94BF001E98C2001D9CC7001D9EC9001D9FCA001DA0CC001EA1CD0021A3
            CE0023A4CE0027A5CF0029A7D1002AA9D2002CAAD3002CABD300CECECECECECE
            CEF8FEE6CECECECECECECECECEFBFAE6F3FFFFEDE8FFFCCECECECECECEFBFFFF
            F79CA1FB9291FBCECECECEEEF394A994989DA0A38FAFABEDCECECE92FF94ACAA
            A39B9DA2A8A998FFFBCECEF1FA94A9ABA792949A9D9D9D9CFFCECEF0FF96A68D
            6F6F6F6F949D9D9DF5CECEF1FFFFA36FB7897E876FA2ADAFF3CECEEEF8FF966F
            B7897E876FA9AF8DFBCECECEE6F9986FB7897E876FA591E6CECECECECEEBF06F
            B7897E876FF3F1CECECECECECECECE6FB7867D876FCECECECECECECECECECE6F
            897B737C6FCECECECECECECECECECE6FB6877B826FCECECECECECECECECECE6F
            B7B788796FCECECECECECECECECECECE6F6F6F6FCECECECECECE}
        end
        object ProgressBarAbaqus1: TProgressBar
          Left = 8
          Top = 8
          Width = 441
          Height = 25
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 285
        Width = 649
        Height = 74
        Caption = 'Variables to be mapped'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object CheckBoxAbaqusStress: TCheckBox
          Left = 13
          Top = 32
          Width = 84
          Height = 17
          Caption = 'Stresses'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 0
        end
        object CheckBoxAbaqusTotalStrain: TCheckBox
          Left = 255
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Total Strains'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxAbaqusPlasticStrain: TCheckBox
          Left = 375
          Top = 32
          Width = 108
          Height = 17
          Caption = 'Plastic Strains'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 2
        end
        object CheckBoxAbaqusAccumulatedStrain: TCheckBox
          Left = 506
          Top = 32
          Width = 140
          Height = 17
          Caption = 'Accumulated Strain'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 3
        end
        object CheckBoxAbaqusDisplacement: TCheckBox
          Left = 120
          Top = 32
          Width = 121
          Height = 17
          Caption = 'Displacements'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 4
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 365
        Width = 649
        Height = 65
        Caption = 'Mapping technique'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object RadioButtonMUSF: TRadioButton
          Left = 16
          Top = 32
          Width = 81
          Height = 17
          Caption = 'MUESF'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RadioButtonDMUFP: TRadioButton
          Left = 192
          Top = 32
          Width = 69
          Height = 17
          Caption = 'DMUFP'
          TabOrder = 1
        end
        object RadioButtonDMUE: TRadioButton
          Left = 376
          Top = 32
          Width = 65
          Height = 17
          Caption = 'DMUE'
          TabOrder = 2
        end
        object RadioButtonNPM: TRadioButton
          Left = 528
          Top = 32
          Width = 57
          Height = 17
          Caption = 'NPM'
          TabOrder = 3
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 436
        Width = 649
        Height = 90
        Caption = 'Scale Factor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Label1: TLabel
          Left = 13
          Top = 26
          Width = 53
          Height = 16
          Caption = 'Stresses'
        end
        object Label6: TLabel
          Left = 128
          Top = 26
          Width = 90
          Height = 16
          Caption = 'Displacements'
        end
        object Label8: TLabel
          Left = 255
          Top = 26
          Width = 83
          Height = 16
          Caption = 'Total Straines'
        end
        object Label10: TLabel
          Left = 381
          Top = 26
          Width = 84
          Height = 16
          Caption = 'Plastic Strains'
        end
        object Label16: TLabel
          Left = 504
          Top = 26
          Width = 115
          Height = 16
          Caption = 'Accumulated Strain'
        end
        object EditStresses: TEdit
          Left = 13
          Top = 48
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 0
          Text = '1'
          OnKeyPress = EditStressesKeyPress
        end
        object EditDisplacements: TEdit
          Left = 128
          Top = 48
          Width = 81
          Height = 24
          Enabled = False
          TabOrder = 1
          Text = '1'
          OnKeyPress = EditDisplacementsKeyPress
        end
        object EditTotalStrains: TEdit
          Left = 255
          Top = 48
          Width = 83
          Height = 24
          Enabled = False
          TabOrder = 2
          Text = '1'
          OnKeyPress = EditTotalStrainsKeyPress
        end
        object EditPlasticStrains: TEdit
          Left = 381
          Top = 48
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 3
          Text = '1'
          OnKeyPress = EditPlasticStrainsKeyPress
        end
        object EditAccumulatedStrain: TEdit
          Left = 504
          Top = 48
          Width = 81
          Height = 24
          Enabled = False
          TabOrder = 4
          Text = '1'
          OnKeyPress = EditAccumulatedStrainKeyPress
        end
      end
      object BitBtnAbaqusCalculate: TBitBtn
        Left = 446
        Top = 532
        Width = 206
        Height = 25
        Caption = 'Calculate'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = BitBtnAbaqusCalculateClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000000000000101
          0100020202000303030004040400050505000606060007070700080808000909
          09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
          1100121212001313130014141400151515001616160017171700181818001919
          19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
          2100222222002323230024242400252525002626260027272700282828002929
          29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
          3100323232003333330034343400353535003636360037373700383838003939
          39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
          4100424242004343430044444400454545004646460047474700484848004949
          49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
          5100525252005353530054545400555555005656560057575700585858005959
          59005A5A5A005B5B5B005F5F5F0064636300686868006C6B6B00727171007777
          77007C7B7B007F7F7F008382820086858500898888008E8D8D00919090009392
          9200959494009695950096959500969595009695950097969600979696009796
          96009796960098969600999797009A9898009C9999009E9B9B00A19D9D00A39E
          9E00A59F9F00A6A0A000A8A0A000AAA1A100ACA3A200ADA3A300AEA3A300AFA4
          A400B0A5A400B1A6A600B2A8A800B4ABAB00BAAFAE00BEB2B200B9B3B400B0B4
          B700A8B5BB009DB7C00093BAC60089BECD0081BFD10074C1D6006CC1D90064C1
          DA005EC1DC0057C1DD004FC2E1004AC5E50045C7E90041C9EB003ACBEF0033CD
          F2002DCFF40027D0F70020D0F8001DD1FA0022D1F9002DD3F9003CD5F8004AD7
          F70056D9F7005DD9F60063DAF60067DAF6006BDBF60070DCF50076DEF5007FDF
          F5008BE2F50091E3F50096E4F5009DE3F200A3E3F100AEE2ED00B9E1EA00C4E1
          E700CFE1E500D4E1E500D7E1E500DCE1E400E0E0E300E2DFE300E3DBE400E4D4
          E500E7C4E700ECAAEA00F090ED00F378F000F55BF300F935F800FC15FB00FE09
          FD00FE02FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00F703FC00E50EF500C91DEC00A034DF007F47D4006954CD00575EC6004768
          C1003970BC002D78B800237EB4001A82B2001585B0001486B0001587B1001488
          B2001488B3001589B400168AB400178AB500178CB600188DB8001A8FBA001B91
          BC001B94BF001E98C2001D9CC7001D9EC9001D9FCA001DA0CC001EA1CD0021A3
          CE0023A4CE0027A5CF0029A7D1002AA9D2002CAAD3002CABD300CECECECECECE
          CEF8FEE6CECECECECECECECECEFBFAE6F3FFFFEDE8FFFCCECECECECECEFBFFFF
          F79CA1FB9291FBCECECECEEEF394A994989DA0A38FAFABEDCECECE92FF94ACAA
          A39B9DA2A8A998FFFBCECEF1FA94A9ABA792949A9D9D9D9CFFCECEF0FF96A68D
          6F6F6F6F949D9D9DF5CECEF1FFFFA36FB7897E876FA2ADAFF3CECEEEF8FF966F
          B7897E876FA9AF8DFBCECECEE6F9986FB7897E876FA591E6CECECECECEEBF06F
          B7897E876FF3F1CECECECECECECECE6FB7867D876FCECECECECECECECECECE6F
          897B737C6FCECECECECECECECECECE6FB6877B826FCECECECECECECECECECE6F
          B7B788796FCECECECECECECECECECECE6F6F6F6FCECECECECECE}
      end
      object BitBtnSave2: TBitBtn
        Left = 351
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Save Method B'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = BitBtnSave2Click
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF97433F97433FB59A9BB59A9BB59A9BB5
          9A9BB59A9BB59A9BB59A9B93303097433FFF00FFFF00FFFF00FFFF00FF97433F
          D66868C66060E5DEDF92292A92292AE4E7E7E0E3E6D9DFE0CCC9CC8F201FAF46
          4697433FFF00FFFF00FFFF00FF97433FD06566C25F5FE9E2E292292A92292AE2
          E1E3E2E6E8DDE2E4CFCCCF8F2222AD464697433FFF00FFFF00FFFF00FF97433F
          D06565C15D5DECE4E492292A92292ADFDDDFE1E6E8E0E5E7D3D0D28A1E1EAB44
          4497433FFF00FFFF00FFFF00FF97433FD06565C15B5CEFE6E6EDE5E5E5DEDFE0
          DDDFDFE0E2E0E1E3D6D0D2962A2AB24A4A97433FFF00FFFF00FFFF00FF97433F
          CD6263C86060C96767CC7272CA7271C66969C46464CC6D6CCA6667C55D5DCD65
          6597433FFF00FFFF00FFFF00FF97433FB65553C27B78D39D9CD7A7A5D8A7A6D8
          A6A5D7A09FD5A09FD7A9A7D8ABABCC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FFFF00FF
          97433FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F99743
          3FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtnSave1: TBitBtn
        Left = 183
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Save Method A'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = BitBtnSave1Click
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF97433F97433FB59A9BB59A9BB59A9BB5
          9A9BB59A9BB59A9BB59A9B93303097433FFF00FFFF00FFFF00FFFF00FF97433F
          D66868C66060E5DEDF92292A92292AE4E7E7E0E3E6D9DFE0CCC9CC8F201FAF46
          4697433FFF00FFFF00FFFF00FF97433FD06566C25F5FE9E2E292292A92292AE2
          E1E3E2E6E8DDE2E4CFCCCF8F2222AD464697433FFF00FFFF00FFFF00FF97433F
          D06565C15D5DECE4E492292A92292ADFDDDFE1E6E8E0E5E7D3D0D28A1E1EAB44
          4497433FFF00FFFF00FFFF00FF97433FD06565C15B5CEFE6E6EDE5E5E5DEDFE0
          DDDFDFE0E2E0E1E3D6D0D2962A2AB24A4A97433FFF00FFFF00FFFF00FF97433F
          CD6263C86060C96767CC7272CA7271C66969C46464CC6D6CCA6667C55D5DCD65
          6597433FFF00FFFF00FFFF00FF97433FB65553C27B78D39D9CD7A7A5D8A7A6D8
          A6A5D7A09FD5A09FD7A9A7D8ABABCC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FFFF00FF
          97433FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F99743
          3FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtnClear: TBitBtn
        Left = 8
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Clear'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = BitBtnClearClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6
          A4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFE
          FCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBC2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFC
          FBC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFAF5FEFCFBFEFAF5FEFAF5FE
          FCFBFEFAF5FEFAF5FEFCFBFEFAF5FEFAF5C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFA
          F5C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FE
          F7F0FEF7F0FEF7F0FEF7F0FEF7F0FEF7F0C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FEF3E9FEF7F0FEF7F0FEF3E9FEF7F0FEF7
          F0C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FEF3E9FEF3E9FEF3E9FE
          F3E9FEF3E9FEF3E9FEF3E9FEF3E9FEF3E9C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFF0E2FFF0E2FEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEE
          DEC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FFEEDEFFF0E2FEF3E9FF
          EEDEFFF0E2DDCFC2DDCFC2DDCFC2DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEEDEFFEEDEFFEEDEFFEEDEFFEEDEFFEEDEC3B4A8C3B4A8C3B4A8C3B4
          A8C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFEEDEFFEAD7FFEEDEFFEAD7FF
          EAD7FFEEDEB0A296B0A296B0A296B0A296C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEAD7FFEAD7FFEAD7FFEAD7FFEAD7C9B9ACFEFAF5FEF7F0E6DAD9C2A6
          A4FF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4FFEAD7FFE6D0FFEAD7FFE6D0FF
          EAD7C5B5A9FEFAF5DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          C2A6A4FFE6D0FFE6D0FFE6D0FFE6D0FFE6D0C9B9ACDDCFC2C2A6A4FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2
          A6A4C2A6A4C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtnAbaqusClose: TBitBtn
        Left = 512
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Close'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = BitBtnAbaqusCloseClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF01079F0313A90418AE0419AE0313A90108A0FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01049D041CB10730C00734C407
          35C50735C50734C30731C1041FB301069EFF00FFFF00FFFF00FFFF00FFFF00FF
          0109A1052BC30735C70733C20732C20732C20732C20732C20733C30735C4062D
          BE020CA4FF00FFFF00FFFF00FF01049B052BCA0636D80431CD0027C4032EC107
          32C20732C20430C10027BF042FC10735C4072EBE01069EFF00FFFF00FF031ABA
          0537E70331DD123DD86480E01840CB002CC1022DC00F38C46580D91B43C7052F
          C10735C5051FB3FF00FF01049E0430E40436F1002AE45070E9FFFFFFB7C4F10D
          36CA042DC3A2B2E8FFFFFF6984DA0026BE0733C30731C10108A0020FAF0336FA
          0335F80232EE0A35E88CA2F2FFFFFFB4C2F1A9B8EDFFFFFFA7B7E9133AC4052F
          C10732C20734C40313AA0619BC1747FE093AFC0435F80131F0002BE891A5F4FF
          FFFFFFFFFFABBAEF062FC5022DC00732C20732C20736C50419AE0B1DBE4168FE
          1C49FC0335FB0031F90531F2A4B5F7FFFFFFFFFFFFB9C6F20D36D0002CC60732
          C20732C20736C50418AD0613B45B7CFC486CFD0133FB113CFBA1B4FEFFFFFFA4
          B6F892A7F5FFFFFFB6C4F21A41D3042FC80732C40734C30212A90003A04A6AF3
          8FA6FF1F46FB4C6FFCFFFFFFA7B8FE0733F6002AED8CA2F6FFFFFF627FE70028
          D00734CC0730C300069FFF00FF1A2FCB99AFFF8BA2FE214DFB4D71FC0E3DFB00
          30FB0031F70636F14C6EF1103CE30432DB0636D7041CB5FF00FFFF00FF0004A0
          415EECB8C7FF9CAFFD3A5CFC0A3AFB0335FB0335FB0133F9052FF20635EB0537
          E9052CCD00049CFF00FFFF00FFFF00FF0309A54260ECA9BBFFBDCAFF8EA5FE64
          83FD5073FC4A6EFD3961FD1444F9042CD70109A2FF00FFFF00FFFF00FFFF00FF
          FF00FF0004A01E32CD5876F6859EFE8BA3FF7994FE5376FC234AF0051EC50104
          9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0004A00917B610
          22C30D1FC20311B401059FFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'ANSYS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      OnEnter = TabSheet2Enter
      ExplicitHeight = 651
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 649
        Height = 57
        Caption = 'Choose software with result data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object RadioButtonAnsys1: TRadioButton
          Left = 16
          Top = 24
          Width = 73
          Height = 17
          Cursor = crHandPoint
          Caption = 'ABAQUS'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = RadioButtonAnsys1Click
        end
        object RadioButtonAnsys2: TRadioButton
          Left = 128
          Top = 24
          Width = 65
          Height = 17
          Cursor = crHandPoint
          Caption = 'ANSYS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 1
          OnClick = RadioButtonAnsys2Click
        end
        object RadioButtonAnsys3: TRadioButton
          Left = 232
          Top = 24
          Width = 57
          Height = 17
          Cursor = crHandPoint
          Caption = 'MARC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 2
          OnClick = RadioButtonAnsys3Click
        end
        object RadioButtonAnsys4: TRadioButton
          Left = 328
          Top = 24
          Width = 73
          Height = 17
          Cursor = crHandPoint
          Caption = 'DEFORM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 3
          OnClick = RadioButtonAnsys4Click
        end
        object RadioButtonAnsys5: TRadioButton
          Left = 440
          Top = 24
          Width = 66
          Height = 17
          Cursor = crHandPoint
          Caption = 'VULCAN'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 4
          OnClick = RadioButtonAnsys5Click
        end
        object RadioButtonAnsys6: TRadioButton
          Left = 552
          Top = 24
          Width = 81
          Height = 17
          Cursor = crHandPoint
          Caption = 'XML'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 5
          OnClick = RadioButtonAnsys6Click
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 72
        Width = 649
        Height = 201
        BevelOuter = bvLowered
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 8
          Width = 253
          Height = 16
          Caption = 'Please append the input file for model one:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 54
          Width = 261
          Height = 16
          Caption = 'Please append the output file for model one:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 105
          Width = 250
          Height = 16
          Caption = 'Please append the input file for model two:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 8
          Top = 150
          Width = 424
          Height = 16
          Caption = 
            'Please append the input file with the coordinates of the integra' +
            'tion points'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EditAnsys1: TEdit
          Left = 8
          Top = 24
          Width = 441
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object EditAnsys2: TEdit
          Left = 8
          Top = 72
          Width = 441
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EditAnsys3: TEdit
          Left = 8
          Top = 120
          Width = 441
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object BitBtnAnsys1: TBitBtn
          Left = 472
          Top = 24
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = BitBtnAnsys1Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtnAnsys2: TBitBtn
          Left = 472
          Top = 72
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BitBtnAnsys2Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtnAnsys3: TBitBtn
          Left = 472
          Top = 120
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = BitBtnAnsys3Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object EditAnsys4: TEdit
          Left = 8
          Top = 168
          Width = 441
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object BitBtnAnsys4: TBitBtn
          Left = 472
          Top = 168
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = BitBtnAnsys4Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
      end
      object Panel7: TPanel
        Left = 8
        Top = 279
        Width = 649
        Height = 41
        BevelOuter = bvLowered
        TabOrder = 2
        object ProgressBarAnsys1: TProgressBar
          Left = 8
          Top = 8
          Width = 441
          Height = 25
          TabOrder = 0
        end
        object BitBtnAnsys5: TBitBtn
          Left = 472
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Read data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtnAnsys5Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000010000000000000101
            0100020202000303030004040400050505000606060007070700080808000909
            09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
            1100121212001313130014141400151515001616160017171700181818001919
            19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
            2100222222002323230024242400252525002626260027272700282828002929
            29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
            3100323232003333330034343400353535003636360037373700383838003939
            39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
            4100424242004343430044444400454545004646460047474700484848004949
            49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
            5100525252005353530054545400555555005656560057575700585858005959
            59005A5A5A005B5B5B005F5F5F0064636300686868006C6B6B00727171007777
            77007C7B7B007F7F7F008382820086858500898888008E8D8D00919090009392
            9200959494009695950096959500969595009695950097969600979696009796
            96009796960098969600999797009A9898009C9999009E9B9B00A19D9D00A39E
            9E00A59F9F00A6A0A000A8A0A000AAA1A100ACA3A200ADA3A300AEA3A300AFA4
            A400B0A5A400B1A6A600B2A8A800B4ABAB00BAAFAE00BEB2B200B9B3B400B0B4
            B700A8B5BB009DB7C00093BAC60089BECD0081BFD10074C1D6006CC1D90064C1
            DA005EC1DC0057C1DD004FC2E1004AC5E50045C7E90041C9EB003ACBEF0033CD
            F2002DCFF40027D0F70020D0F8001DD1FA0022D1F9002DD3F9003CD5F8004AD7
            F70056D9F7005DD9F60063DAF60067DAF6006BDBF60070DCF50076DEF5007FDF
            F5008BE2F50091E3F50096E4F5009DE3F200A3E3F100AEE2ED00B9E1EA00C4E1
            E700CFE1E500D4E1E500D7E1E500DCE1E400E0E0E300E2DFE300E3DBE400E4D4
            E500E7C4E700ECAAEA00F090ED00F378F000F55BF300F935F800FC15FB00FE09
            FD00FE02FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00F703FC00E50EF500C91DEC00A034DF007F47D4006954CD00575EC6004768
            C1003970BC002D78B800237EB4001A82B2001585B0001486B0001587B1001488
            B2001488B3001589B400168AB400178AB500178CB600188DB8001A8FBA001B91
            BC001B94BF001E98C2001D9CC7001D9EC9001D9FCA001DA0CC001EA1CD0021A3
            CE0023A4CE0027A5CF0029A7D1002AA9D2002CAAD3002CABD300CECECECECECE
            CEF8FEE6CECECECECECECECECEFBFAE6F3FFFFEDE8FFFCCECECECECECEFBFFFF
            F79CA1FB9291FBCECECECEEEF394A994989DA0A38FAFABEDCECECE92FF94ACAA
            A39B9DA2A8A998FFFBCECEF1FA94A9ABA792949A9D9D9D9CFFCECEF0FF96A68D
            6F6F6F6F949D9D9DF5CECEF1FFFFA36FB7897E876FA2ADAFF3CECEEEF8FF966F
            B7897E876FA9AF8DFBCECECEE6F9986FB7897E876FA591E6CECECECECEEBF06F
            B7897E876FF3F1CECECECECECECECE6FB7867D876FCECECECECECECECECECE6F
            897B737C6FCECECECECECECECECECE6FB6877B826FCECECECECECECECECECE6F
            B7B788796FCECECECECECECECECECECE6F6F6F6FCECECECECECE}
        end
      end
      object GroupBox6: TGroupBox
        Left = 12
        Top = 326
        Width = 649
        Height = 67
        Caption = 'Variables to be mapped'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object CheckBoxAnsysStress: TCheckBox
          Left = 13
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Stresses'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 0
        end
        object CheckBoxAnsysDisplacement: TCheckBox
          Left = 120
          Top = 32
          Width = 122
          Height = 17
          Caption = 'Displacements'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxAnsysTotalStrain: TCheckBox
          Left = 255
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Total Strains'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 2
        end
        object CheckBoxAnsysPlasticStrain: TCheckBox
          Left = 375
          Top = 32
          Width = 106
          Height = 17
          Caption = 'Plastic Strains'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 3
        end
        object CheckBoxAnsysAccumulatedStrain: TCheckBox
          Left = 506
          Top = 32
          Width = 134
          Height = 17
          Caption = 'Accumulated Strain'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 4
        end
      end
      object GroupBox8: TGroupBox
        Left = 8
        Top = 399
        Width = 649
        Height = 59
        Caption = 'Mapping technique'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object RadioButtonAnsysMUESF: TRadioButton
          Left = 16
          Top = 32
          Width = 70
          Height = 17
          Caption = 'MUESF'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RadioButtonAnsysDMUFP: TRadioButton
          Left = 192
          Top = 32
          Width = 64
          Height = 17
          Caption = 'DMUFP'
          TabOrder = 1
        end
        object RadioButtonAnsysDMUE: TRadioButton
          Left = 376
          Top = 32
          Width = 61
          Height = 17
          Caption = 'DMUE'
          TabOrder = 2
        end
        object RadioButtonAnsysNPM: TRadioButton
          Left = 528
          Top = 32
          Width = 57
          Height = 17
          Caption = 'NPM'
          TabOrder = 3
        end
      end
      object GroupBox10: TGroupBox
        Left = 8
        Top = 458
        Width = 649
        Height = 81
        Caption = 'Scale Factor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Label20: TLabel
          Left = 13
          Top = 26
          Width = 53
          Height = 16
          Caption = 'Stresses'
        end
        object Label23: TLabel
          Left = 128
          Top = 26
          Width = 90
          Height = 16
          Caption = 'Displacements'
        end
        object Label24: TLabel
          Left = 255
          Top = 26
          Width = 83
          Height = 16
          Caption = 'Total Straines'
        end
        object Label25: TLabel
          Left = 381
          Top = 26
          Width = 84
          Height = 16
          Caption = 'Plastic Strains'
        end
        object Label26: TLabel
          Left = 504
          Top = 26
          Width = 115
          Height = 16
          Caption = 'Accumulated Strain'
        end
        object EditAnsysStress: TEdit
          Left = 13
          Top = 46
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 0
          Text = '1'
          OnKeyPress = EditAnsysStressKeyPress
        end
        object EditAnsysDisplacement: TEdit
          Left = 128
          Top = 46
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 1
          Text = '1'
          OnKeyPress = EditAnsysDisplacementKeyPress
        end
        object EditAnsysTotalStrain: TEdit
          Left = 254
          Top = 48
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 2
          Text = '1'
          OnKeyPress = EditAnsysTotalStrainKeyPress
        end
        object EditAnsysPlasticStrain: TEdit
          Left = 381
          Top = 46
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 3
          Text = '1'
          OnKeyPress = EditAnsysPlasticStrainKeyPress
        end
        object EditAnsysAccumulatedStrain: TEdit
          Left = 504
          Top = 46
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 4
          Text = '1'
          OnKeyPress = EditAnsysAccumulatedStrainKeyPress
        end
      end
      object BitBtnAnsysCalculate: TBitBtn
        Left = 446
        Top = 545
        Width = 206
        Height = 25
        Caption = 'Calculate'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = BitBtnAnsysCalculateClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000000000000101
          0100020202000303030004040400050505000606060007070700080808000909
          09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
          1100121212001313130014141400151515001616160017171700181818001919
          19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
          2100222222002323230024242400252525002626260027272700282828002929
          29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
          3100323232003333330034343400353535003636360037373700383838003939
          39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
          4100424242004343430044444400454545004646460047474700484848004949
          49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
          5100525252005353530054545400555555005656560057575700585858005959
          59005A5A5A005B5B5B005F5F5F0064636300686868006C6B6B00727171007777
          77007C7B7B007F7F7F008382820086858500898888008E8D8D00919090009392
          9200959494009695950096959500969595009695950097969600979696009796
          96009796960098969600999797009A9898009C9999009E9B9B00A19D9D00A39E
          9E00A59F9F00A6A0A000A8A0A000AAA1A100ACA3A200ADA3A300AEA3A300AFA4
          A400B0A5A400B1A6A600B2A8A800B4ABAB00BAAFAE00BEB2B200B9B3B400B0B4
          B700A8B5BB009DB7C00093BAC60089BECD0081BFD10074C1D6006CC1D90064C1
          DA005EC1DC0057C1DD004FC2E1004AC5E50045C7E90041C9EB003ACBEF0033CD
          F2002DCFF40027D0F70020D0F8001DD1FA0022D1F9002DD3F9003CD5F8004AD7
          F70056D9F7005DD9F60063DAF60067DAF6006BDBF60070DCF50076DEF5007FDF
          F5008BE2F50091E3F50096E4F5009DE3F200A3E3F100AEE2ED00B9E1EA00C4E1
          E700CFE1E500D4E1E500D7E1E500DCE1E400E0E0E300E2DFE300E3DBE400E4D4
          E500E7C4E700ECAAEA00F090ED00F378F000F55BF300F935F800FC15FB00FE09
          FD00FE02FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00F703FC00E50EF500C91DEC00A034DF007F47D4006954CD00575EC6004768
          C1003970BC002D78B800237EB4001A82B2001585B0001486B0001587B1001488
          B2001488B3001589B400168AB400178AB500178CB600188DB8001A8FBA001B91
          BC001B94BF001E98C2001D9CC7001D9EC9001D9FCA001DA0CC001EA1CD0021A3
          CE0023A4CE0027A5CF0029A7D1002AA9D2002CAAD3002CABD300CECECECECECE
          CEF8FEE6CECECECECECECECECEFBFAE6F3FFFFEDE8FFFCCECECECECECEFBFFFF
          F79CA1FB9291FBCECECECEEEF394A994989DA0A38FAFABEDCECECE92FF94ACAA
          A39B9DA2A8A998FFFBCECEF1FA94A9ABA792949A9D9D9D9CFFCECEF0FF96A68D
          6F6F6F6F949D9D9DF5CECEF1FFFFA36FB7897E876FA2ADAFF3CECEEEF8FF966F
          B7897E876FA9AF8DFBCECECEE6F9986FB7897E876FA591E6CECECECECEEBF06F
          B7897E876FF3F1CECECECECECECECE6FB7867D876FCECECECECECECECECECE6F
          897B737C6FCECECECECECECECECECE6FB6877B826FCECECECECECECECECECE6F
          B7B788796FCECECECECECECECECECECE6F6F6F6FCECECECECECE}
      end
      object BitBtnAnsysClose: TBitBtn
        Left = 512
        Top = 576
        Width = 140
        Height = 25
        Caption = 'Close'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = BitBtnAnsysCloseClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF01079F0313A90418AE0419AE0313A90108A0FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01049D041CB10730C00734C407
          35C50735C50734C30731C1041FB301069EFF00FFFF00FFFF00FFFF00FFFF00FF
          0109A1052BC30735C70733C20732C20732C20732C20732C20733C30735C4062D
          BE020CA4FF00FFFF00FFFF00FF01049B052BCA0636D80431CD0027C4032EC107
          32C20732C20430C10027BF042FC10735C4072EBE01069EFF00FFFF00FF031ABA
          0537E70331DD123DD86480E01840CB002CC1022DC00F38C46580D91B43C7052F
          C10735C5051FB3FF00FF01049E0430E40436F1002AE45070E9FFFFFFB7C4F10D
          36CA042DC3A2B2E8FFFFFF6984DA0026BE0733C30731C10108A0020FAF0336FA
          0335F80232EE0A35E88CA2F2FFFFFFB4C2F1A9B8EDFFFFFFA7B7E9133AC4052F
          C10732C20734C40313AA0619BC1747FE093AFC0435F80131F0002BE891A5F4FF
          FFFFFFFFFFABBAEF062FC5022DC00732C20732C20736C50419AE0B1DBE4168FE
          1C49FC0335FB0031F90531F2A4B5F7FFFFFFFFFFFFB9C6F20D36D0002CC60732
          C20732C20736C50418AD0613B45B7CFC486CFD0133FB113CFBA1B4FEFFFFFFA4
          B6F892A7F5FFFFFFB6C4F21A41D3042FC80732C40734C30212A90003A04A6AF3
          8FA6FF1F46FB4C6FFCFFFFFFA7B8FE0733F6002AED8CA2F6FFFFFF627FE70028
          D00734CC0730C300069FFF00FF1A2FCB99AFFF8BA2FE214DFB4D71FC0E3DFB00
          30FB0031F70636F14C6EF1103CE30432DB0636D7041CB5FF00FFFF00FF0004A0
          415EECB8C7FF9CAFFD3A5CFC0A3AFB0335FB0335FB0133F9052FF20635EB0537
          E9052CCD00049CFF00FFFF00FFFF00FF0309A54260ECA9BBFFBDCAFF8EA5FE64
          83FD5073FC4A6EFD3961FD1444F9042CD70109A2FF00FFFF00FFFF00FFFF00FF
          FF00FF0004A01E32CD5876F6859EFE8BA3FF7994FE5376FC234AF0051EC50104
          9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0004A00917B610
          22C30D1FC20311B401059FFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtnAnsysSave: TBitBtn
        Left = 349
        Top = 576
        Width = 140
        Height = 25
        Caption = 'Save'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = BitBtnAnsysSaveClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF97433F97433FB59A9BB59A9BB59A9BB5
          9A9BB59A9BB59A9BB59A9B93303097433FFF00FFFF00FFFF00FFFF00FF97433F
          D66868C66060E5DEDF92292A92292AE4E7E7E0E3E6D9DFE0CCC9CC8F201FAF46
          4697433FFF00FFFF00FFFF00FF97433FD06566C25F5FE9E2E292292A92292AE2
          E1E3E2E6E8DDE2E4CFCCCF8F2222AD464697433FFF00FFFF00FFFF00FF97433F
          D06565C15D5DECE4E492292A92292ADFDDDFE1E6E8E0E5E7D3D0D28A1E1EAB44
          4497433FFF00FFFF00FFFF00FF97433FD06565C15B5CEFE6E6EDE5E5E5DEDFE0
          DDDFDFE0E2E0E1E3D6D0D2962A2AB24A4A97433FFF00FFFF00FFFF00FF97433F
          CD6263C86060C96767CC7272CA7271C66969C46464CC6D6CCA6667C55D5DCD65
          6597433FFF00FFFF00FFFF00FF97433FB65553C27B78D39D9CD7A7A5D8A7A6D8
          A6A5D7A09FD5A09FD7A9A7D8ABABCC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FFFF00FF
          97433FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F99743
          3FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtnAnsysClear: TBitBtn
        Left = 183
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Clear'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = BitBtnAnsysClearClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6
          A4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFE
          FCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBC2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFC
          FBC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFAF5FEFCFBFEFAF5FEFAF5FE
          FCFBFEFAF5FEFAF5FEFCFBFEFAF5FEFAF5C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFA
          F5C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FE
          F7F0FEF7F0FEF7F0FEF7F0FEF7F0FEF7F0C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FEF3E9FEF7F0FEF7F0FEF3E9FEF7F0FEF7
          F0C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FEF3E9FEF3E9FEF3E9FE
          F3E9FEF3E9FEF3E9FEF3E9FEF3E9FEF3E9C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFF0E2FFF0E2FEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEE
          DEC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FFEEDEFFF0E2FEF3E9FF
          EEDEFFF0E2DDCFC2DDCFC2DDCFC2DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEEDEFFEEDEFFEEDEFFEEDEFFEEDEFFEEDEC3B4A8C3B4A8C3B4A8C3B4
          A8C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFEEDEFFEAD7FFEEDEFFEAD7FF
          EAD7FFEEDEB0A296B0A296B0A296B0A296C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEAD7FFEAD7FFEAD7FFEAD7FFEAD7C9B9ACFEFAF5FEF7F0E6DAD9C2A6
          A4FF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4FFEAD7FFE6D0FFEAD7FFE6D0FF
          EAD7C5B5A9FEFAF5DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          C2A6A4FFE6D0FFE6D0FFE6D0FFE6D0FFE6D0C9B9ACDDCFC2C2A6A4FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2
          A6A4C2A6A4C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'DEFORM'
      ImageIndex = 3
      OnEnter = TabSheet4Enter
      ExplicitHeight = 651
      object GroupBox7: TGroupBox
        Left = 8
        Top = 8
        Width = 649
        Height = 57
        Caption = 'Choose software with result data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object RadioButtonDeform1: TRadioButton
          Left = 16
          Top = 24
          Width = 65
          Height = 17
          Cursor = crHandPoint
          Caption = 'ABAQUS'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = RadioButtonDeform1Click
        end
        object RadioButtonDeform2: TRadioButton
          Left = 128
          Top = 24
          Width = 58
          Height = 17
          Cursor = crHandPoint
          Caption = 'ANSYS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 1
          OnClick = RadioButtonDeform2Click
        end
        object RadioButtonDeform3: TRadioButton
          Left = 232
          Top = 24
          Width = 51
          Height = 17
          Cursor = crHandPoint
          Caption = 'MARC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 2
          OnClick = RadioButtonDeform3Click
        end
        object RadioButtonDeform4: TRadioButton
          Left = 328
          Top = 24
          Width = 68
          Height = 17
          Cursor = crHandPoint
          Caption = 'DEFORM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 3
          OnClick = RadioButtonDeform4Click
        end
        object RadioButtonDeform5: TRadioButton
          Left = 440
          Top = 24
          Width = 69
          Height = 17
          Cursor = crHandPoint
          Caption = 'VULCAN'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 4
          OnClick = RadioButtonDeform5Click
        end
        object RadioButtonDeform6: TRadioButton
          Left = 554
          Top = 24
          Width = 79
          Height = 17
          Cursor = crHandPoint
          Caption = 'XML'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 5
          OnClick = RadioButtonDeform6Click
        end
      end
      object Panel3: TPanel
        Left = 8
        Top = 72
        Width = 649
        Height = 160
        BevelOuter = bvLowered
        TabOrder = 1
        object Label11: TLabel
          Left = 8
          Top = 8
          Width = 253
          Height = 16
          Caption = 'Please append the input file for model one:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 8
          Top = 54
          Width = 261
          Height = 16
          Caption = 'Please append the output file for model one:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 105
          Width = 250
          Height = 16
          Caption = 'Please append the input file for model two:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EditDeform1: TEdit
          Left = 8
          Top = 24
          Width = 442
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object EditDeform2: TEdit
          Left = 8
          Top = 72
          Width = 442
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EditDeform3: TEdit
          Left = 8
          Top = 120
          Width = 441
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object BitBtnDeform1: TBitBtn
          Left = 472
          Top = 24
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = BitBtnDeform1Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtnDefrom2: TBitBtn
          Left = 472
          Top = 72
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BitBtnDefrom2Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtnDeform3: TBitBtn
          Left = 472
          Top = 120
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = BitBtnDeform3Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
      end
      object Panel8: TPanel
        Left = 8
        Top = 238
        Width = 649
        Height = 41
        BevelOuter = bvLowered
        TabOrder = 2
        object BitBtnDeform4: TBitBtn
          Left = 472
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Read data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtnDeform4Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000010000000000000101
            0100020202000303030004040400050505000606060007070700080808000909
            09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
            1100121212001313130014141400151515001616160017171700181818001919
            19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
            2100222222002323230024242400252525002626260027272700282828002929
            29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
            3100323232003333330034343400353535003636360037373700383838003939
            39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
            4100424242004343430044444400454545004646460047474700484848004949
            49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
            5100525252005353530054545400555555005656560057575700585858005959
            59005A5A5A005B5B5B005F5F5F0064636300686868006C6B6B00727171007777
            77007C7B7B007F7F7F008382820086858500898888008E8D8D00919090009392
            9200959494009695950096959500969595009695950097969600979696009796
            96009796960098969600999797009A9898009C9999009E9B9B00A19D9D00A39E
            9E00A59F9F00A6A0A000A8A0A000AAA1A100ACA3A200ADA3A300AEA3A300AFA4
            A400B0A5A400B1A6A600B2A8A800B4ABAB00BAAFAE00BEB2B200B9B3B400B0B4
            B700A8B5BB009DB7C00093BAC60089BECD0081BFD10074C1D6006CC1D90064C1
            DA005EC1DC0057C1DD004FC2E1004AC5E50045C7E90041C9EB003ACBEF0033CD
            F2002DCFF40027D0F70020D0F8001DD1FA0022D1F9002DD3F9003CD5F8004AD7
            F70056D9F7005DD9F60063DAF60067DAF6006BDBF60070DCF50076DEF5007FDF
            F5008BE2F50091E3F50096E4F5009DE3F200A3E3F100AEE2ED00B9E1EA00C4E1
            E700CFE1E500D4E1E500D7E1E500DCE1E400E0E0E300E2DFE300E3DBE400E4D4
            E500E7C4E700ECAAEA00F090ED00F378F000F55BF300F935F800FC15FB00FE09
            FD00FE02FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00F703FC00E50EF500C91DEC00A034DF007F47D4006954CD00575EC6004768
            C1003970BC002D78B800237EB4001A82B2001585B0001486B0001587B1001488
            B2001488B3001589B400168AB400178AB500178CB600188DB8001A8FBA001B91
            BC001B94BF001E98C2001D9CC7001D9EC9001D9FCA001DA0CC001EA1CD0021A3
            CE0023A4CE0027A5CF0029A7D1002AA9D2002CAAD3002CABD300CECECECECECE
            CEF8FEE6CECECECECECECECECEFBFAE6F3FFFFEDE8FFFCCECECECECECEFBFFFF
            F79CA1FB9291FBCECECECEEEF394A994989DA0A38FAFABEDCECECE92FF94ACAA
            A39B9DA2A8A998FFFBCECEF1FA94A9ABA792949A9D9D9D9CFFCECEF0FF96A68D
            6F6F6F6F949D9D9DF5CECEF1FFFFA36FB7897E876FA2ADAFF3CECEEEF8FF966F
            B7897E876FA9AF8DFBCECECEE6F9986FB7897E876FA591E6CECECECECEEBF06F
            B7897E876FF3F1CECECECECECECECE6FB7867D876FCECECECECECECECECECE6F
            897B737C6FCECECECECECECECECECE6FB6877B826FCECECECECECECECECECE6F
            B7B788796FCECECECECECECECECECECE6F6F6F6FCECECECECECE}
        end
        object ProgressBarDeform1: TProgressBar
          Left = 8
          Top = 8
          Width = 441
          Height = 25
          TabOrder = 1
        end
      end
      object GroupBox11: TGroupBox
        Left = 8
        Top = 285
        Width = 649
        Height = 74
        Caption = 'Variables to be mapped'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object CheckBoxDeformStress: TCheckBox
          Left = 13
          Top = 32
          Width = 84
          Height = 17
          Caption = 'Stresses'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 0
        end
        object CheckBoxDeformTotalStrain: TCheckBox
          Left = 255
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Total Strains'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxDeformPlasticStrain: TCheckBox
          Left = 375
          Top = 32
          Width = 108
          Height = 17
          Caption = 'Plastic Strains'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 2
        end
        object CheckBoxDeformAccumulatedStrain: TCheckBox
          Left = 506
          Top = 32
          Width = 140
          Height = 17
          Caption = 'Accumulated Strain'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 3
        end
        object CheckBoxDeformDisplacement: TCheckBox
          Left = 128
          Top = 32
          Width = 121
          Height = 17
          Caption = 'Displacements'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 4
        end
      end
      object GroupBox12: TGroupBox
        Left = 8
        Top = 365
        Width = 649
        Height = 65
        Caption = 'Mapping technique'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object RadioButtonDeformMUESF: TRadioButton
          Left = 16
          Top = 32
          Width = 81
          Height = 17
          Caption = 'MUESF'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RadioButtonDeformDMUFP: TRadioButton
          Left = 192
          Top = 32
          Width = 69
          Height = 17
          Caption = 'DMUFP'
          TabOrder = 1
        end
        object RadioButtonDeformDMUE: TRadioButton
          Left = 376
          Top = 32
          Width = 65
          Height = 17
          Caption = 'DMUE'
          TabOrder = 2
        end
        object RadioButtonDeformNPM: TRadioButton
          Left = 528
          Top = 32
          Width = 57
          Height = 17
          Caption = 'NPM'
          TabOrder = 3
        end
      end
      object GroupBox13: TGroupBox
        Left = 8
        Top = 436
        Width = 649
        Height = 90
        Caption = 'Scale Factor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Label27: TLabel
          Left = 13
          Top = 26
          Width = 53
          Height = 16
          Caption = 'Stresses'
        end
        object Label28: TLabel
          Left = 128
          Top = 26
          Width = 90
          Height = 16
          Caption = 'Displacements'
        end
        object Label29: TLabel
          Left = 255
          Top = 26
          Width = 83
          Height = 16
          Caption = 'Total Straines'
        end
        object Label30: TLabel
          Left = 381
          Top = 26
          Width = 84
          Height = 16
          Caption = 'Plastic Strains'
        end
        object Label31: TLabel
          Left = 504
          Top = 26
          Width = 115
          Height = 16
          Caption = 'Accumulated Strain'
        end
        object EditDeformStress: TEdit
          Left = 13
          Top = 48
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 0
          Text = '1'
          OnKeyPress = EditStressesKeyPress
        end
        object EditDeformDisplacement: TEdit
          Left = 128
          Top = 48
          Width = 81
          Height = 24
          Enabled = False
          TabOrder = 1
          Text = '1'
          OnKeyPress = EditDisplacementsKeyPress
        end
        object EditDeformTotalStrain: TEdit
          Left = 255
          Top = 48
          Width = 83
          Height = 24
          Enabled = False
          TabOrder = 2
          Text = '1'
          OnKeyPress = EditTotalStrainsKeyPress
        end
        object EditDeformPlasticStrain: TEdit
          Left = 381
          Top = 48
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 3
          Text = '1'
          OnKeyPress = EditPlasticStrainsKeyPress
        end
        object EditDeformAccumulatedStrain: TEdit
          Left = 504
          Top = 48
          Width = 81
          Height = 24
          Enabled = False
          TabOrder = 4
          Text = '1'
          OnKeyPress = EditAccumulatedStrainKeyPress
        end
      end
      object BitBtnDeformCalculate: TBitBtn
        Left = 446
        Top = 532
        Width = 206
        Height = 25
        Caption = 'Calculate'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = BitBtnDeformCalculateClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000000000000101
          0100020202000303030004040400050505000606060007070700080808000909
          09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
          1100121212001313130014141400151515001616160017171700181818001919
          19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
          2100222222002323230024242400252525002626260027272700282828002929
          29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
          3100323232003333330034343400353535003636360037373700383838003939
          39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
          4100424242004343430044444400454545004646460047474700484848004949
          49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
          5100525252005353530054545400555555005656560057575700585858005959
          59005A5A5A005B5B5B005F5F5F0064636300686868006C6B6B00727171007777
          77007C7B7B007F7F7F008382820086858500898888008E8D8D00919090009392
          9200959494009695950096959500969595009695950097969600979696009796
          96009796960098969600999797009A9898009C9999009E9B9B00A19D9D00A39E
          9E00A59F9F00A6A0A000A8A0A000AAA1A100ACA3A200ADA3A300AEA3A300AFA4
          A400B0A5A400B1A6A600B2A8A800B4ABAB00BAAFAE00BEB2B200B9B3B400B0B4
          B700A8B5BB009DB7C00093BAC60089BECD0081BFD10074C1D6006CC1D90064C1
          DA005EC1DC0057C1DD004FC2E1004AC5E50045C7E90041C9EB003ACBEF0033CD
          F2002DCFF40027D0F70020D0F8001DD1FA0022D1F9002DD3F9003CD5F8004AD7
          F70056D9F7005DD9F60063DAF60067DAF6006BDBF60070DCF50076DEF5007FDF
          F5008BE2F50091E3F50096E4F5009DE3F200A3E3F100AEE2ED00B9E1EA00C4E1
          E700CFE1E500D4E1E500D7E1E500DCE1E400E0E0E300E2DFE300E3DBE400E4D4
          E500E7C4E700ECAAEA00F090ED00F378F000F55BF300F935F800FC15FB00FE09
          FD00FE02FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00F703FC00E50EF500C91DEC00A034DF007F47D4006954CD00575EC6004768
          C1003970BC002D78B800237EB4001A82B2001585B0001486B0001587B1001488
          B2001488B3001589B400168AB400178AB500178CB600188DB8001A8FBA001B91
          BC001B94BF001E98C2001D9CC7001D9EC9001D9FCA001DA0CC001EA1CD0021A3
          CE0023A4CE0027A5CF0029A7D1002AA9D2002CAAD3002CABD300CECECECECECE
          CEF8FEE6CECECECECECECECECEFBFAE6F3FFFFEDE8FFFCCECECECECECEFBFFFF
          F79CA1FB9291FBCECECECEEEF394A994989DA0A38FAFABEDCECECE92FF94ACAA
          A39B9DA2A8A998FFFBCECEF1FA94A9ABA792949A9D9D9D9CFFCECEF0FF96A68D
          6F6F6F6F949D9D9DF5CECEF1FFFFA36FB7897E876FA2ADAFF3CECEEEF8FF966F
          B7897E876FA9AF8DFBCECECEE6F9986FB7897E876FA591E6CECECECECEEBF06F
          B7897E876FF3F1CECECECECECECECE6FB7867D876FCECECECECECECECECECE6F
          897B737C6FCECECECECECECECECECE6FB6877B826FCECECECECECECECECECE6F
          B7B788796FCECECECECECECECECECECE6F6F6F6FCECECECECECE}
      end
      object BitBtnDeformClose: TBitBtn
        Left = 512
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Close'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = BitBtnAbaqusCloseClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF01079F0313A90418AE0419AE0313A90108A0FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01049D041CB10730C00734C407
          35C50735C50734C30731C1041FB301069EFF00FFFF00FFFF00FFFF00FFFF00FF
          0109A1052BC30735C70733C20732C20732C20732C20732C20733C30735C4062D
          BE020CA4FF00FFFF00FFFF00FF01049B052BCA0636D80431CD0027C4032EC107
          32C20732C20430C10027BF042FC10735C4072EBE01069EFF00FFFF00FF031ABA
          0537E70331DD123DD86480E01840CB002CC1022DC00F38C46580D91B43C7052F
          C10735C5051FB3FF00FF01049E0430E40436F1002AE45070E9FFFFFFB7C4F10D
          36CA042DC3A2B2E8FFFFFF6984DA0026BE0733C30731C10108A0020FAF0336FA
          0335F80232EE0A35E88CA2F2FFFFFFB4C2F1A9B8EDFFFFFFA7B7E9133AC4052F
          C10732C20734C40313AA0619BC1747FE093AFC0435F80131F0002BE891A5F4FF
          FFFFFFFFFFABBAEF062FC5022DC00732C20732C20736C50419AE0B1DBE4168FE
          1C49FC0335FB0031F90531F2A4B5F7FFFFFFFFFFFFB9C6F20D36D0002CC60732
          C20732C20736C50418AD0613B45B7CFC486CFD0133FB113CFBA1B4FEFFFFFFA4
          B6F892A7F5FFFFFFB6C4F21A41D3042FC80732C40734C30212A90003A04A6AF3
          8FA6FF1F46FB4C6FFCFFFFFFA7B8FE0733F6002AED8CA2F6FFFFFF627FE70028
          D00734CC0730C300069FFF00FF1A2FCB99AFFF8BA2FE214DFB4D71FC0E3DFB00
          30FB0031F70636F14C6EF1103CE30432DB0636D7041CB5FF00FFFF00FF0004A0
          415EECB8C7FF9CAFFD3A5CFC0A3AFB0335FB0335FB0133F9052FF20635EB0537
          E9052CCD00049CFF00FFFF00FFFF00FF0309A54260ECA9BBFFBDCAFF8EA5FE64
          83FD5073FC4A6EFD3961FD1444F9042CD70109A2FF00FFFF00FFFF00FFFF00FF
          FF00FF0004A01E32CD5876F6859EFE8BA3FF7994FE5376FC234AF0051EC50104
          9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0004A00917B610
          22C30D1FC20311B401059FFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtnDeformSave: TBitBtn
        Left = 349
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Save'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = BitBtnDeformSaveClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF97433F97433FB59A9BB59A9BB59A9BB5
          9A9BB59A9BB59A9BB59A9B93303097433FFF00FFFF00FFFF00FFFF00FF97433F
          D66868C66060E5DEDF92292A92292AE4E7E7E0E3E6D9DFE0CCC9CC8F201FAF46
          4697433FFF00FFFF00FFFF00FF97433FD06566C25F5FE9E2E292292A92292AE2
          E1E3E2E6E8DDE2E4CFCCCF8F2222AD464697433FFF00FFFF00FFFF00FF97433F
          D06565C15D5DECE4E492292A92292ADFDDDFE1E6E8E0E5E7D3D0D28A1E1EAB44
          4497433FFF00FFFF00FFFF00FF97433FD06565C15B5CEFE6E6EDE5E5E5DEDFE0
          DDDFDFE0E2E0E1E3D6D0D2962A2AB24A4A97433FFF00FFFF00FFFF00FF97433F
          CD6263C86060C96767CC7272CA7271C66969C46464CC6D6CCA6667C55D5DCD65
          6597433FFF00FFFF00FFFF00FF97433FB65553C27B78D39D9CD7A7A5D8A7A6D8
          A6A5D7A09FD5A09FD7A9A7D8ABABCC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FFFF00FF
          97433FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F99743
          3FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtnDeformClear: TBitBtn
        Left = 184
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Clear'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6
          A4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFE
          FCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBC2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFC
          FBC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFAF5FEFCFBFEFAF5FEFAF5FE
          FCFBFEFAF5FEFAF5FEFCFBFEFAF5FEFAF5C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFA
          F5C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FE
          F7F0FEF7F0FEF7F0FEF7F0FEF7F0FEF7F0C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FEF3E9FEF7F0FEF7F0FEF3E9FEF7F0FEF7
          F0C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FEF3E9FEF3E9FEF3E9FE
          F3E9FEF3E9FEF3E9FEF3E9FEF3E9FEF3E9C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFF0E2FFF0E2FEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEE
          DEC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FFEEDEFFF0E2FEF3E9FF
          EEDEFFF0E2DDCFC2DDCFC2DDCFC2DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEEDEFFEEDEFFEEDEFFEEDEFFEEDEFFEEDEC3B4A8C3B4A8C3B4A8C3B4
          A8C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFEEDEFFEAD7FFEEDEFFEAD7FF
          EAD7FFEEDEB0A296B0A296B0A296B0A296C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEAD7FFEAD7FFEAD7FFEAD7FFEAD7C9B9ACFEFAF5FEF7F0E6DAD9C2A6
          A4FF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4FFEAD7FFE6D0FFEAD7FFE6D0FF
          EAD7C5B5A9FEFAF5DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          C2A6A4FFE6D0FFE6D0FFE6D0FFE6D0FFE6D0C9B9ACDDCFC2C2A6A4FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2
          A6A4C2A6A4C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'XML'
      ImageIndex = 5
      OnEnter = TabSheet10Enter
      ExplicitHeight = 651
      object GroupBox9: TGroupBox
        Left = 8
        Top = 8
        Width = 649
        Height = 57
        Caption = 'Choose software with result data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object RadioButtonMorpheo1: TRadioButton
          Left = 16
          Top = 24
          Width = 65
          Height = 17
          Cursor = crHandPoint
          Caption = 'ABAQUS'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = RadioButtonMorpheo1Click
        end
        object RadioButtonMorpheo2: TRadioButton
          Left = 128
          Top = 24
          Width = 58
          Height = 17
          Cursor = crHandPoint
          Caption = 'ANSYS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 1
          OnClick = RadioButtonMorpheo2Click
        end
        object RadioButtonMorpheo3: TRadioButton
          Left = 232
          Top = 24
          Width = 59
          Height = 17
          Cursor = crHandPoint
          Caption = 'MARC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 2
          OnClick = RadioButtonMorpheo3Click
        end
        object RadioButtonMorpheo4: TRadioButton
          Left = 328
          Top = 24
          Width = 66
          Height = 17
          Cursor = crHandPoint
          Caption = 'DEFORM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 3
          OnClick = RadioButtonMorpheo4Click
        end
        object RadioButtonMorpheo5: TRadioButton
          Left = 440
          Top = 24
          Width = 65
          Height = 17
          Cursor = crHandPoint
          Caption = 'VULCAN'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 4
          OnClick = RadioButtonMorpheo5Click
        end
        object RadioButtonMorpheo6: TRadioButton
          Left = 551
          Top = 24
          Width = 82
          Height = 17
          Cursor = crHandPoint
          Caption = 'XML'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 5
          OnClick = RadioButtonMorpheo6Click
        end
      end
      object Panel4: TPanel
        Left = 8
        Top = 72
        Width = 649
        Height = 160
        BevelOuter = bvLowered
        TabOrder = 1
        object Label15: TLabel
          Left = 8
          Top = 8
          Width = 253
          Height = 16
          Caption = 'Please append the input file for model one:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 8
          Top = 54
          Width = 261
          Height = 16
          Caption = 'Please append the output file for model one:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 8
          Top = 105
          Width = 250
          Height = 16
          Caption = 'Please append the input file for model two:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EditMorpheo1: TEdit
          Left = 8
          Top = 24
          Width = 442
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object EditMorpheo2: TEdit
          Left = 8
          Top = 72
          Width = 442
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EditMorpheo3: TEdit
          Left = 8
          Top = 120
          Width = 442
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object BitBtnMorpheo1: TBitBtn
          Left = 472
          Top = 24
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = BitBtnMorpheo1Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtnMorpheo2: TBitBtn
          Left = 472
          Top = 72
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BitBtnMorpheo2Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtnMorpheo3: TBitBtn
          Left = 472
          Top = 120
          Width = 161
          Height = 25
          Caption = 'Open file'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = BitBtnMorpheo3Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
      end
      object Panel10: TPanel
        Left = 8
        Top = 238
        Width = 649
        Height = 41
        BevelOuter = bvLowered
        TabOrder = 2
        object BitBtnMorpheo4: TBitBtn
          Left = 472
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Read data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtnMorpheo4Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000010000000000000101
            0100020202000303030004040400050505000606060007070700080808000909
            09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
            1100121212001313130014141400151515001616160017171700181818001919
            19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
            2100222222002323230024242400252525002626260027272700282828002929
            29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
            3100323232003333330034343400353535003636360037373700383838003939
            39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
            4100424242004343430044444400454545004646460047474700484848004949
            49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
            5100525252005353530054545400555555005656560057575700585858005959
            59005A5A5A005B5B5B005F5F5F0064636300686868006C6B6B00727171007777
            77007C7B7B007F7F7F008382820086858500898888008E8D8D00919090009392
            9200959494009695950096959500969595009695950097969600979696009796
            96009796960098969600999797009A9898009C9999009E9B9B00A19D9D00A39E
            9E00A59F9F00A6A0A000A8A0A000AAA1A100ACA3A200ADA3A300AEA3A300AFA4
            A400B0A5A400B1A6A600B2A8A800B4ABAB00BAAFAE00BEB2B200B9B3B400B0B4
            B700A8B5BB009DB7C00093BAC60089BECD0081BFD10074C1D6006CC1D90064C1
            DA005EC1DC0057C1DD004FC2E1004AC5E50045C7E90041C9EB003ACBEF0033CD
            F2002DCFF40027D0F70020D0F8001DD1FA0022D1F9002DD3F9003CD5F8004AD7
            F70056D9F7005DD9F60063DAF60067DAF6006BDBF60070DCF50076DEF5007FDF
            F5008BE2F50091E3F50096E4F5009DE3F200A3E3F100AEE2ED00B9E1EA00C4E1
            E700CFE1E500D4E1E500D7E1E500DCE1E400E0E0E300E2DFE300E3DBE400E4D4
            E500E7C4E700ECAAEA00F090ED00F378F000F55BF300F935F800FC15FB00FE09
            FD00FE02FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
            FE00F703FC00E50EF500C91DEC00A034DF007F47D4006954CD00575EC6004768
            C1003970BC002D78B800237EB4001A82B2001585B0001486B0001587B1001488
            B2001488B3001589B400168AB400178AB500178CB600188DB8001A8FBA001B91
            BC001B94BF001E98C2001D9CC7001D9EC9001D9FCA001DA0CC001EA1CD0021A3
            CE0023A4CE0027A5CF0029A7D1002AA9D2002CAAD3002CABD300CECECECECECE
            CEF8FEE6CECECECECECECECECEFBFAE6F3FFFFEDE8FFFCCECECECECECEFBFFFF
            F79CA1FB9291FBCECECECEEEF394A994989DA0A38FAFABEDCECECE92FF94ACAA
            A39B9DA2A8A998FFFBCECEF1FA94A9ABA792949A9D9D9D9CFFCECEF0FF96A68D
            6F6F6F6F949D9D9DF5CECEF1FFFFA36FB7897E876FA2ADAFF3CECEEEF8FF966F
            B7897E876FA9AF8DFBCECECEE6F9986FB7897E876FA591E6CECECECECEEBF06F
            B7897E876FF3F1CECECECECECECECE6FB7867D876FCECECECECECECECECECE6F
            897B737C6FCECECECECECECECECECE6FB6877B826FCECECECECECECECECECE6F
            B7B788796FCECECECECECECECECECECE6F6F6F6FCECECECECECE}
        end
        object ProgressBarMorpheo1: TProgressBar
          Left = 8
          Top = 8
          Width = 441
          Height = 25
          TabOrder = 1
        end
      end
      object GroupBox18: TGroupBox
        Left = 8
        Top = 285
        Width = 649
        Height = 74
        Caption = 'Variables to be mapped'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object CheckBoxMorpheoStress: TCheckBox
          Left = 13
          Top = 32
          Width = 84
          Height = 17
          Caption = 'Stresses'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 0
        end
        object CheckBoxMorpheoTotalStrain: TCheckBox
          Left = 255
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Total Strains'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxMorpheoPlasticStrain: TCheckBox
          Left = 375
          Top = 32
          Width = 108
          Height = 17
          Caption = 'Plastic Strains'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 2
        end
        object CheckBoxMorpheoAccumulatedStrain: TCheckBox
          Left = 506
          Top = 32
          Width = 140
          Height = 17
          Caption = 'Accumulated Strain'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 3
        end
        object CheckBoxMorpheoDisplacement: TCheckBox
          Left = 120
          Top = 32
          Width = 121
          Height = 17
          Caption = 'Displacements'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 4
        end
      end
      object GroupBox19: TGroupBox
        Left = 8
        Top = 365
        Width = 649
        Height = 65
        Caption = 'Mapping technique'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object RadioButtonMorpheoMUESF: TRadioButton
          Left = 16
          Top = 32
          Width = 81
          Height = 17
          Caption = 'MUESF'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RadioButtonMorpheoDMUFP: TRadioButton
          Left = 192
          Top = 32
          Width = 69
          Height = 17
          Caption = 'DMUFP'
          TabOrder = 1
        end
        object RadioButtonMorpheoDMUE: TRadioButton
          Left = 376
          Top = 32
          Width = 65
          Height = 17
          Caption = 'DMUE'
          TabOrder = 2
        end
        object RadioButtonMorpheoNPM: TRadioButton
          Left = 528
          Top = 32
          Width = 57
          Height = 17
          Caption = 'NPM'
          TabOrder = 3
        end
      end
      object GroupBox20: TGroupBox
        Left = 8
        Top = 436
        Width = 649
        Height = 90
        Caption = 'Scale Factor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Label37: TLabel
          Left = 13
          Top = 26
          Width = 53
          Height = 16
          Caption = 'Stresses'
        end
        object Label38: TLabel
          Left = 128
          Top = 26
          Width = 90
          Height = 16
          Caption = 'Displacements'
        end
        object Label39: TLabel
          Left = 255
          Top = 26
          Width = 83
          Height = 16
          Caption = 'Total Straines'
        end
        object Label40: TLabel
          Left = 381
          Top = 26
          Width = 84
          Height = 16
          Caption = 'Plastic Strains'
        end
        object Label41: TLabel
          Left = 504
          Top = 26
          Width = 115
          Height = 16
          Caption = 'Accumulated Strain'
        end
        object EditMorpheoStress: TEdit
          Left = 13
          Top = 48
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 0
          Text = '1'
          OnKeyPress = EditStressesKeyPress
        end
        object EditMorpheoDisplacement: TEdit
          Left = 128
          Top = 48
          Width = 81
          Height = 24
          Enabled = False
          TabOrder = 1
          Text = '1'
          OnKeyPress = EditDisplacementsKeyPress
        end
        object EditMorpheoTotalStrain: TEdit
          Left = 255
          Top = 48
          Width = 83
          Height = 24
          Enabled = False
          TabOrder = 2
          Text = '1'
          OnKeyPress = EditTotalStrainsKeyPress
        end
        object EditMorpheoPlasticStrain: TEdit
          Left = 381
          Top = 48
          Width = 84
          Height = 24
          Enabled = False
          TabOrder = 3
          Text = '1'
          OnKeyPress = EditPlasticStrainsKeyPress
        end
        object EditMorpheoAccumulatedStrain: TEdit
          Left = 504
          Top = 48
          Width = 81
          Height = 24
          Enabled = False
          TabOrder = 4
          Text = '1'
          OnKeyPress = EditAccumulatedStrainKeyPress
        end
      end
      object BitBtnMorpheoCalculate: TBitBtn
        Left = 446
        Top = 532
        Width = 206
        Height = 25
        Caption = 'Calculate'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = BitBtnMorpheoCalculateClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000000000000101
          0100020202000303030004040400050505000606060007070700080808000909
          09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
          1100121212001313130014141400151515001616160017171700181818001919
          19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
          2100222222002323230024242400252525002626260027272700282828002929
          29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
          3100323232003333330034343400353535003636360037373700383838003939
          39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
          4100424242004343430044444400454545004646460047474700484848004949
          49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
          5100525252005353530054545400555555005656560057575700585858005959
          59005A5A5A005B5B5B005F5F5F0064636300686868006C6B6B00727171007777
          77007C7B7B007F7F7F008382820086858500898888008E8D8D00919090009392
          9200959494009695950096959500969595009695950097969600979696009796
          96009796960098969600999797009A9898009C9999009E9B9B00A19D9D00A39E
          9E00A59F9F00A6A0A000A8A0A000AAA1A100ACA3A200ADA3A300AEA3A300AFA4
          A400B0A5A400B1A6A600B2A8A800B4ABAB00BAAFAE00BEB2B200B9B3B400B0B4
          B700A8B5BB009DB7C00093BAC60089BECD0081BFD10074C1D6006CC1D90064C1
          DA005EC1DC0057C1DD004FC2E1004AC5E50045C7E90041C9EB003ACBEF0033CD
          F2002DCFF40027D0F70020D0F8001DD1FA0022D1F9002DD3F9003CD5F8004AD7
          F70056D9F7005DD9F60063DAF60067DAF6006BDBF60070DCF50076DEF5007FDF
          F5008BE2F50091E3F50096E4F5009DE3F200A3E3F100AEE2ED00B9E1EA00C4E1
          E700CFE1E500D4E1E500D7E1E500DCE1E400E0E0E300E2DFE300E3DBE400E4D4
          E500E7C4E700ECAAEA00F090ED00F378F000F55BF300F935F800FC15FB00FE09
          FD00FE02FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
          FE00F703FC00E50EF500C91DEC00A034DF007F47D4006954CD00575EC6004768
          C1003970BC002D78B800237EB4001A82B2001585B0001486B0001587B1001488
          B2001488B3001589B400168AB400178AB500178CB600188DB8001A8FBA001B91
          BC001B94BF001E98C2001D9CC7001D9EC9001D9FCA001DA0CC001EA1CD0021A3
          CE0023A4CE0027A5CF0029A7D1002AA9D2002CAAD3002CABD300CECECECECECE
          CEF8FEE6CECECECECECECECECEFBFAE6F3FFFFEDE8FFFCCECECECECECEFBFFFF
          F79CA1FB9291FBCECECECEEEF394A994989DA0A38FAFABEDCECECE92FF94ACAA
          A39B9DA2A8A998FFFBCECEF1FA94A9ABA792949A9D9D9D9CFFCECEF0FF96A68D
          6F6F6F6F949D9D9DF5CECEF1FFFFA36FB7897E876FA2ADAFF3CECEEEF8FF966F
          B7897E876FA9AF8DFBCECECEE6F9986FB7897E876FA591E6CECECECECEEBF06F
          B7897E876FF3F1CECECECECECECECE6FB7867D876FCECECECECECECECECECE6F
          897B737C6FCECECECECECECECECECE6FB6877B826FCECECECECECECECECECE6F
          B7B788796FCECECECECECECECECECECE6F6F6F6FCECECECECECE}
      end
      object BitBtn15: TBitBtn
        Left = 512
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Close'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = BitBtnAbaqusCloseClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF01079F0313A90418AE0419AE0313A90108A0FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01049D041CB10730C00734C407
          35C50735C50734C30731C1041FB301069EFF00FFFF00FFFF00FFFF00FFFF00FF
          0109A1052BC30735C70733C20732C20732C20732C20732C20733C30735C4062D
          BE020CA4FF00FFFF00FFFF00FF01049B052BCA0636D80431CD0027C4032EC107
          32C20732C20430C10027BF042FC10735C4072EBE01069EFF00FFFF00FF031ABA
          0537E70331DD123DD86480E01840CB002CC1022DC00F38C46580D91B43C7052F
          C10735C5051FB3FF00FF01049E0430E40436F1002AE45070E9FFFFFFB7C4F10D
          36CA042DC3A2B2E8FFFFFF6984DA0026BE0733C30731C10108A0020FAF0336FA
          0335F80232EE0A35E88CA2F2FFFFFFB4C2F1A9B8EDFFFFFFA7B7E9133AC4052F
          C10732C20734C40313AA0619BC1747FE093AFC0435F80131F0002BE891A5F4FF
          FFFFFFFFFFABBAEF062FC5022DC00732C20732C20736C50419AE0B1DBE4168FE
          1C49FC0335FB0031F90531F2A4B5F7FFFFFFFFFFFFB9C6F20D36D0002CC60732
          C20732C20736C50418AD0613B45B7CFC486CFD0133FB113CFBA1B4FEFFFFFFA4
          B6F892A7F5FFFFFFB6C4F21A41D3042FC80732C40734C30212A90003A04A6AF3
          8FA6FF1F46FB4C6FFCFFFFFFA7B8FE0733F6002AED8CA2F6FFFFFF627FE70028
          D00734CC0730C300069FFF00FF1A2FCB99AFFF8BA2FE214DFB4D71FC0E3DFB00
          30FB0031F70636F14C6EF1103CE30432DB0636D7041CB5FF00FFFF00FF0004A0
          415EECB8C7FF9CAFFD3A5CFC0A3AFB0335FB0335FB0133F9052FF20635EB0537
          E9052CCD00049CFF00FFFF00FFFF00FF0309A54260ECA9BBFFBDCAFF8EA5FE64
          83FD5073FC4A6EFD3961FD1444F9042CD70109A2FF00FFFF00FFFF00FFFF00FF
          FF00FF0004A01E32CD5876F6859EFE8BA3FF7994FE5376FC234AF0051EC50104
          9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0004A00917B610
          22C30D1FC20311B401059FFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtnMorpheoSave: TBitBtn
        Left = 349
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Save'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = BitBtnMorpheoSaveClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF97433F97433FB59A9BB59A9BB59A9BB5
          9A9BB59A9BB59A9BB59A9B93303097433FFF00FFFF00FFFF00FFFF00FF97433F
          D66868C66060E5DEDF92292A92292AE4E7E7E0E3E6D9DFE0CCC9CC8F201FAF46
          4697433FFF00FFFF00FFFF00FF97433FD06566C25F5FE9E2E292292A92292AE2
          E1E3E2E6E8DDE2E4CFCCCF8F2222AD464697433FFF00FFFF00FFFF00FF97433F
          D06565C15D5DECE4E492292A92292ADFDDDFE1E6E8E0E5E7D3D0D28A1E1EAB44
          4497433FFF00FFFF00FFFF00FF97433FD06565C15B5CEFE6E6EDE5E5E5DEDFE0
          DDDFDFE0E2E0E1E3D6D0D2962A2AB24A4A97433FFF00FFFF00FFFF00FF97433F
          CD6263C86060C96767CC7272CA7271C66969C46464CC6D6CCA6667C55D5DCD65
          6597433FFF00FFFF00FFFF00FF97433FB65553C27B78D39D9CD7A7A5D8A7A6D8
          A6A5D7A09FD5A09FD7A9A7D8ABABCC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FF97433F
          CC6667F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F9CC66
          6797433FFF00FFFF00FFFF00FF97433FCC6667F9F9F9F9F9F9F9F9F9F9F9F9F9
          F9F9F9F9F9F9F9F9F9F9F9F9F9F9CC666797433FFF00FFFF00FFFF00FFFF00FF
          97433FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F99743
          3FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object BitBtnMorpheoClear: TBitBtn
        Left = 184
        Top = 577
        Width = 140
        Height = 25
        Caption = 'Clear'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2A6
          A4C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFE
          FCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBC2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFCFBFEFC
          FBC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEFAF5FEFCFBFEFAF5FEFAF5FE
          FCFBFEFAF5FEFAF5FEFCFBFEFAF5FEFAF5C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFAF5FEFA
          F5C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FE
          F7F0FEF7F0FEF7F0FEF7F0FEF7F0FEF7F0C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FEF7F0FEF7F0FEF7F0FEF7F0FEF3E9FEF7F0FEF7F0FEF3E9FEF7F0FEF7
          F0C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FEF3E9FEF3E9FEF3E9FE
          F3E9FEF3E9FEF3E9FEF3E9FEF3E9FEF3E9C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFF0E2FFF0E2FEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEEDEFEF3E9FFEE
          DEC2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FEF3E9FFEEDEFFF0E2FEF3E9FF
          EEDEFFF0E2DDCFC2DDCFC2DDCFC2DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEEDEFFEEDEFFEEDEFFEEDEFFEEDEFFEEDEC3B4A8C3B4A8C3B4A8C3B4
          A8C2A6A4FF00FFFF00FFFF00FFFF00FFC2A6A4FFEEDEFFEAD7FFEEDEFFEAD7FF
          EAD7FFEEDEB0A296B0A296B0A296B0A296C2A6A4FF00FFFF00FFFF00FFFF00FF
          C2A6A4FFEAD7FFEAD7FFEAD7FFEAD7FFEAD7C9B9ACFEFAF5FEF7F0E6DAD9C2A6
          A4FF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4FFEAD7FFE6D0FFEAD7FFE6D0FF
          EAD7C5B5A9FEFAF5DDCFC2C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          C2A6A4FFE6D0FFE6D0FFE6D0FFE6D0FFE6D0C9B9ACDDCFC2C2A6A4FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A6A4C2A6A4C2A6A4C2A6A4C2A6A4C2
          A6A4C2A6A4C2A6A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'model1'
    Filter = 'Fortran File (*.for)|.for'
    Left = 48
    Top = 88
  end
  object MainMenu1: TMainMenu
    Left = 600
    Top = 16
    object File1: TMenuItem
      Caption = 'File'
      OnClick = File1Click
      object xml1: TMenuItem
        Caption = 'Save model one in XML file'
        OnClick = Close1Click
      end
      object xml2: TMenuItem
        Caption = 'Save model two in XML file'
        OnClick = SavemodeltwoinXMLformat1Click
      end
      object Print1: TMenuItem
        Caption = 'Print main form'
      end
      object Close2: TMenuItem
        Caption = 'Close'
        OnClick = Close2Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Help2: TMenuItem
        Caption = 'Manual...'
        OnClick = Help2Click
      end
      object About1: TMenuItem
        Caption = 'About...'
        OnClick = About1Click
      end
    end
  end
  object SaveDialogAbaqusMethodB: TSaveDialog
    FileName = 'model1'
    Filter = 'Abaqus Input File (*.inp)|*.inp'
    Left = 44
    Top = 25
  end
  object OpenDialogAnsys1: TOpenDialog
    Filter = 'Abaqus file (*.inp)|*.inp'
    Left = 144
    Top = 24
  end
  object OpenDialogAnsys2: TOpenDialog
    Filter = 'Abaqus file (*.dat)|*.dat'
    Left = 144
    Top = 56
  end
  object OpenDialogAnsys3: TOpenDialog
    Filter = 'Ansys file (*.inp)|*.inp|Ansys file (*.txt)|*.txt'
    Left = 144
    Top = 80
  end
  object SaveDialogAnsys1: TSaveDialog
    FileName = 'Model1'
    Left = 144
    Top = 144
  end
  object OpenDialogDeform1: TOpenDialog
    Filter = 'Abaqus Input (.inp)|*.inp'
    Left = 344
    Top = 16
  end
  object OpenDialogDeform2: TOpenDialog
    Filter = 'Abaqus Output (.dat)|*dat'
    Left = 344
    Top = 48
  end
  object OpenDialogDeform3: TOpenDialog
    Filter = 'Deform Input (.key)|*.key'
    Left = 344
    Top = 80
  end
  object SaveDialogDeform1: TSaveDialog
    FileName = 'model1'
    Left = 344
    Top = 112
  end
  object OpenDialogMorpheo1: TOpenDialog
    Filter = 'Abaqus input file (.inp)|*.inp'
    Left = 568
    Top = 24
  end
  object OpenDialogMorpheo2: TOpenDialog
    Filter = 'Abaqus output file (.dat)|*.dat'
    Left = 592
    Top = 56
  end
  object OpenDialogMorpheo3: TOpenDialog
    Filter = 'Morpheo input file (.vtu)|*.vtu'
    Left = 568
    Top = 88
  end
  object SaveDialogMorpheo1: TSaveDialog
    FileName = 'model1'
    Left = 568
    Top = 120
  end
  object XMLDocument1: TXMLDocument
    Left = 536
    Top = 32
    DOMVendorDesc = 'MSXML'
  end
  object OpenDialogMARC1: TOpenDialog
    Filter = 'Abaqus file (*.inp)|*.inp'
    Left = 240
    Top = 24
  end
  object OpenDialogmarc2: TOpenDialog
    Filter = 'Abaqus file (*.dat)|*.dat'
    Left = 224
    Top = 80
  end
  object OpenDialogmarc3: TOpenDialog
    Filter = 'Marc file (*.t19)|*.t19'
    Left = 240
    Top = 96
  end
  object SaveDialogmarc1: TSaveDialog
    FileName = 'model1'
    Left = 240
    Top = 128
  end
  object SaveDialogxml: TSaveDialog
    FileName = 'model1'
    Filter = 'XML file (*vtu)|*vtu'
    Left = 48
    Top = 56
  end
  object OpenDialog1Abaqus: TOpenDialog
    Filter = 'Abaqus input (*.inp)|*.inp'
    Left = 8
    Top = 24
  end
  object OpenDialog2Abaqus: TOpenDialog
    Filter = 'Abaqus output (*.dat)|*.dat'
    Left = 8
    Top = 56
  end
  object OpenDialog3Abaqus: TOpenDialog
    Filter = 'Abaqus input (*.inp)|*.inp'
    Left = 8
    Top = 88
  end
  object OpenDialogAnsys4: TOpenDialog
    Filter = 'Ansys file (*.txt)|*.txt'
    Left = 144
    Top = 112
  end
  object OpenDialogChainDisplacements: TOpenDialog
    Filter = 'Neutral file (*.vtu)|*.vtu'
    Left = 528
  end
end
