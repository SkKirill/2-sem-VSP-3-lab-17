object Form1: TForm1
  Left = 856
  Top = 109
  Width = 560
  Height = 323
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_enter: TLabel
    Left = 13
    Top = 7
    Width = 323
    Height = 16
    Caption = #1047#1072#1085#1077#1089#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074' '#1084#1072#1090#1088#1080#1094#1091' '#1076#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object lbl_Answer: TLabel
    Left = 21
    Top = 238
    Width = 109
    Height = 13
    Caption = #1058#1091#1090' '#1073#1091#1076#1077#1090' '#1086#1090#1074#1077#1090'!'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 174
    Top = 216
    Width = 104
    Height = 15
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_count: TLabel
    Left = 350
    Top = 216
    Width = 124
    Height = 15
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1086#1083#1073#1094#1086#1074':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Enter: TStringGrid
    Left = -1
    Top = 25
    Width = 538
    Height = 184
    ColCount = 7
    DefaultColWidth = 75
    FixedCols = 0
    RowCount = 7
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
    TabOrder = 0
  end
  object Coun_R: TSpinEdit
    Left = 296
    Top = 213
    Width = 45
    Height = 22
    MaxValue = 10
    MinValue = 2
    TabOrder = 1
    Value = 7
    OnChange = Coun_RChange
    OnKeyPress = Coun_RKeyPress
  end
  object Coun_C: TSpinEdit
    Left = 488
    Top = 213
    Width = 45
    Height = 22
    MaxValue = 10
    MinValue = 2
    TabOrder = 2
    Value = 7
    OnChange = Coun_CChange
    OnKeyPress = Coun_RKeyPress
  end
  object menu: TMainMenu
    Left = 297
    Top = 65535
    object File1: TMenuItem
      Caption = 'File'
      object Open: TMenuItem
        Caption = 'Open'
        OnClick = OpenClick
      end
      object Save: TMenuItem
        Caption = 'Save'
        OnClick = SaveClick
      end
      object Save_as: TMenuItem
        Caption = 'Save as'
        OnClick = Save_asClick
      end
      object Clear: TMenuItem
        Caption = 'Clear'
        OnClick = ClearClick
      end
    end
    object Run: TMenuItem
      Caption = 'Run'
      OnClick = RunClick
    end
    object Exit: TMenuItem
      Caption = 'Exit'
      OnClick = ExitClick
    end
  end
  object Open_Dialog: TOpenDialog
    Left = 343
    Top = 65535
  end
  object Save_Dialog: TSaveDialog
    Left = 395
    Top = 65535
  end
end
