object frmConsultaBase: TfrmConsultaBase
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
  object pcAbas: TPageControl
    Left = 0
    Top = 0
    Width = 760
    Height = 440
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      object pnFiltros: TPanel
        Left = 0
        Top = 0
        Width = 752
        Height = 72
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
          Left = 506
          Top = 16
          Width = 120
          Height = 32
          Caption = 'Pesquisar'
          Enabled = False
          TabOrder = 1
        end
        object btnSair: TButton
          Left = 634
          Top = 16
          Width = 110
          Height = 32
          Caption = 'Sair'
          TabOrder = 2
          OnClick = btnSairClick
        end
      end
      object pnAcoesConsulta: TPanel
        Left = 0
        Top = 72
        Width = 752
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        Caption = ''
        TabOrder = 1
      end
      inline fraGrid: TfrmDataGridFrame
        AlignWithMargins = True
        Left = 6
        Top = 122
        Width = 740
        Height = 274
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Align = alClient
        TabOrder = 2
        TabStop = True
        ExplicitLeft = 6
        ExplicitTop = 122
        ExplicitWidth = 740
        ExplicitHeight = 274
        inherited dbgDados: TDBGrid
          Width = 740
          Height = 274
        end
      end
    end
  end
  object dsConsulta: TDataSource
    Left = 16
    Top = 72
  end
end
