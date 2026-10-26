inherited frmEscolhaHistoricoPadrao: TfrmEscolhaHistoricoPadrao
  AutoSize = True
  Caption = 'Escolha de Hist'#243'rico Padr'#227'o do Plano de Contas'
  ClientHeight = 284
  ClientWidth = 699
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  ExplicitWidth = 707
  ExplicitHeight = 318
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 699
    Height = 284
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 7
      Top = 8
      Width = 681
      Height = 217
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 677
        Height = 213
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            Width = 640
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 7
      Top = 231
      Width = 681
      Height = 41
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 
        'D'#234' Enter ou um duplo clique sobre o Hist'#243'rico padr'#227'o selecionado' +
        '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
    end
  end
end
