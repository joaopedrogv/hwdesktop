inherited FrmMetas: TFrmMetas
  Left = 214
  Top = 83
  Caption = 'Controlar Metas'
  ClientHeight = 606
  ClientWidth = 862
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  ExplicitLeft = 214
  ExplicitTop = 83
  ExplicitWidth = 870
  ExplicitHeight = 640
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 587
    Width = 862
    Height = 19
    Panels = <>
    ExplicitLeft = 400
    ExplicitTop = 240
    ExplicitWidth = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 862
    Height = 587
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 256
    ExplicitTop = 152
    ExplicitWidth = 289
    ExplicitHeight = 193
    object TabSheet1: TTabSheet
      Caption = 'Empresas'
      ExplicitWidth = 281
      ExplicitHeight = 165
      object PageControl2: TPageControl
        Left = 0
        Top = 33
        Width = 854
        Height = 526
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        ExplicitTop = 67
        ExplicitWidth = 776
        ExplicitHeight = 350
        object TabSheet2: TTabSheet
          Caption = 'Comiss'#245'es'
          ExplicitWidth = 281
          ExplicitHeight = 165
        end
        object TabSheet3: TTabSheet
          Caption = 'Custos'
          ImageIndex = 1
          ExplicitWidth = 281
          ExplicitHeight = 165
        end
        object TabSheet4: TTabSheet
          Caption = 'Finan'#231'as e Indicadores'
          ImageIndex = 2
          ExplicitWidth = 281
          ExplicitHeight = 165
        end
        object TabSheet5: TTabSheet
          Caption = 'Vendas'
          ImageIndex = 3
          ExplicitWidth = 768
          ExplicitHeight = 322
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 33
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 776
        object Label1: TLabel
          Left = 4
          Top = 14
          Width = 45
          Height = 13
          Caption = 'Empresa:'
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 53
          Top = 6
          Width = 238
          Height = 21
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 297
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Obter >>'
          TabOrder = 1
        end
        object BitBtn2: TBitBtn
          Left = 378
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Sair'
          TabOrder = 2
          OnClick = BitBtn2Click
        end
      end
    end
  end
end
