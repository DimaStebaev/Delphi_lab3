object Form2: TForm2
  Left = 286
  Top = 191
  BorderStyle = bsDialog
  Caption = #1042#1077#1095#1077#1088#1080#1085#1082#1072
  ClientHeight = 338
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 69
    Top = 8
    Width = 198
    Height = 21
    Caption = #1055#1088#1080#1074#1077#1090#1089#1090#1074#1091#1077#1084' '#1090#1077#1073#1103','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object LabelUser: TLabel
    Left = 118
    Top = 40
    Width = 99
    Height = 21
    Caption = 'LabelUser'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 65
    Top = 72
    Width = 53
    Height = 13
    Caption = #1043#1086#1089#1090#1080#1085#1085#1072#1103
  end
  object Label3: TLabel
    Left = 229
    Top = 72
    Width = 29
    Height = 13
    Caption = #1050#1091#1093#1085#1103
  end
  object ListBoxGost: TListBox
    Left = 19
    Top = 88
    Width = 145
    Height = 201
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 0
  end
  object ListBoxKuh: TListBox
    Left = 171
    Top = 88
    Width = 145
    Height = 201
    ItemHeight = 13
    TabOrder = 1
  end
  object Button1: TButton
    Left = 130
    Top = 304
    Width = 75
    Height = 25
    Caption = #1059#1081#1090#1080
    TabOrder = 2
    OnClick = Button1Click
  end
end
