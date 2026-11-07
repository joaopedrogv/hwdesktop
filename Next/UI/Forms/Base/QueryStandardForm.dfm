object frmQueryStandard: TfrmQueryStandard
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Consulta - Next'
  ClientHeight = 440
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 16
  object pnFiltros: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    Caption = ''
    TabOrder = 0
    inline fraFiltros: TfrmFilterFrame
      Left = 0
      Top = 2
      Width = 420
      Height = 60
      Visible = True
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 2
      ExplicitWidth = 420
      ExplicitHeight = 60
    end
    object btnPesquisar: TButton
      Left = 624
      Top = 16
      Width = 120
      Height = 32
      Caption = 'Pesquisar'
      Enabled = False
      TabOrder = 1
    end
  end
  inline fraGrid: TfrmDataGridFrame
    AlignWithMargins = True
    Left = 6
    Top = 70
    Width = 748
    Height = 364
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    TabOrder = 1
    TabStop = True
    ExplicitLeft = 6
    ExplicitTop = 70
    ExplicitWidth = 748
    ExplicitHeight = 364
    inherited dbgDados: TDBGrid
      Width = 748
      Height = 364
    end
  end
  object dsConsulta: TDataSource
    Left = 16
    Top = 72
  end
end
