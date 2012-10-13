object Form1: TForm1
  Left = 340
  Top = 316
  BorderStyle = bsDialog
  Caption = #1050#1090#1086' '#1090#1072#1084'?'
  ClientHeight = 76
  ClientWidth = 254
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
  object EditUser: TEdit
    Left = 25
    Top = 28
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = EditUserKeyPress
  end
  object Button1: TButton
    Left = 153
    Top = 26
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076
    TabOrder = 1
    OnClick = Button1Click
  end
  object XPManifest1: TXPManifest
    Left = 8
    Top = 8
  end
end
