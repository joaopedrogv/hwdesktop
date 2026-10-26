object frmReestruturaVersao: TfrmReestruturaVersao
  Left = 0
  Top = 0
  Caption = 'frmReestruturaVersao'
  ClientHeight = 562
  ClientWidth = 1060
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1060
    Height = 76
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 3
      Width = 1054
      Height = 13
      Align = alTop
      Caption = 'Fiscal.fdb'
      ExplicitWidth = 46
    end
    object sqlFiscal: TMemo
      Left = 3
      Top = 16
      Width = 1054
      Height = 57
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WordWrap = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 76
    Width = 1060
    Height = 79
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    Caption = 'Panel2'
    TabOrder = 1
    object Label2: TLabel
      Left = 3
      Top = 3
      Width = 1054
      Height = 13
      Align = alTop
      Caption = 'HWF.fdb'
      ExplicitWidth = 43
    end
    object sqlHWF: TMemo
      Left = 3
      Top = 16
      Width = 1054
      Height = 60
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WordWrap = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 155
    Width = 1060
    Height = 407
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    Caption = 'Panel3'
    TabOrder = 2
    object Label3: TLabel
      Left = 3
      Top = 3
      Width = 1054
      Height = 13
      Align = alTop
      Caption = 'Hwauto.fdb'
      ExplicitWidth = 57
    end
    object sqlHwauto: TMemo
      Left = 3
      Top = 16
      Width = 1054
      Height = 388
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WordWrap = False
    end
  end
end
