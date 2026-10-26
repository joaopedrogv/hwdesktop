inherited FrmPainelControl: TFrmPainelControl
  Caption = 'Painel de Controle Metas/Realizado'
  FormStyle = fsMDIChild
  Visible = True
  OnClose = FormClose
  ExplicitWidth = 792
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 33
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -70
    ExplicitWidth = 854
    object Label1: TLabel
      Left = 4
      Top = 14
      Width = 45
      Height = 13
      Caption = 'Empresa:'
    end
    object Label2: TLabel
      Left = 304
      Top = 14
      Width = 90
      Height = 13
      Caption = 'M'#234's de refer'#234'ncia:'
    end
    object Label3: TLabel
      Left = 471
      Top = 14
      Width = 23
      Height = 13
      Caption = 'Ano:'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 53
      Top = 6
      Width = 238
      Height = 21
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 575
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Obter >>'
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 656
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object Edit1: TEdit
      Left = 400
      Top = 6
      Width = 58
      Height = 21
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 500
      Top = 6
      Width = 69
      Height = 21
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 784
    Height = 431
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 304
    ExplicitTop = 232
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel3: TPanel
      Left = 1
      Top = 336
      Width = 782
      Height = 94
      Align = alBottom
      TabOrder = 0
    end
    object TreeView1: TTreeView
      Left = 1
      Top = 1
      Width = 290
      Height = 335
      Align = alLeft
      Indent = 19
      TabOrder = 1
    end
    object PageControl1: TPageControl
      Left = 291
      Top = 1
      Width = 492
      Height = 335
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'Previsto/Realizado'
        ExplicitWidth = 281
      end
      object TabSheet2: TTabSheet
        Caption = 'Linha de Tend'#234'ncia'
        ImageIndex = 1
        ExplicitWidth = 281
      end
    end
  end
end
