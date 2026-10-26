inherited FrmCadPerfilProdutos: TFrmCadPerfilProdutos
  Left = 285
  Top = 28
  Caption = 'Perfil de Produtos'
  ClientHeight = 612
  ClientWidth = 834
  ExplicitWidth = 842
  ExplicitHeight = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 834
    Height = 593
    ExplicitWidth = 834
    ExplicitHeight = 593
    inherited Splitter2: TSplitter
      Height = 591
      ExplicitHeight = 591
    end
    inherited PanelLeft: TPanel
      Width = 829
      Height = 591
      ExplicitWidth = 829
      ExplicitHeight = 591
      inherited PageControl1: TPageControl
        Width = 827
        Height = 589
        ExplicitWidth = 827
        ExplicitHeight = 589
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 819
          ExplicitHeight = 558
          inherited ScrollBox1: TScrollBox
            Width = 819
            Height = 558
            ExplicitWidth = 819
            ExplicitHeight = 558
            inherited PageControl3: TPageControl
              Width = 819
              Height = 510
              ExplicitWidth = 819
              ExplicitHeight = 510
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 811
                ExplicitHeight = 479
                inherited ScrollBox3: TScrollBox
                  Width = 811
                  Height = 479
                  ExplicitWidth = 811
                  ExplicitHeight = 479
                  inherited GroupBox1: TGroupBox
                    Height = 0
                    Align = alNone
                    Enabled = False
                    Visible = False
                    ExplicitHeight = 0
                  end
                  object GroupBox7: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 807
                    Height = 48
                    Align = alTop
                    Caption = 'Cadastro de Perfil de Produtos'
                    TabOrder = 1
                    object Label47: TLabel
                      Left = 50
                      Top = 23
                      Width = 62
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit45
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit45: TDBEdit
                      Left = 114
                      Top = 21
                      Width = 454
                      Height = 21
                      Hint = 'Descri'#231#227'o do Perfil'
                      CharCase = ecUpperCase
                      DataField = 'DESCR_PERFIL'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                    end
                  end
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 48
                    Width = 807
                    Height = 197
                    Align = alTop
                    Caption = 'Dados do Produto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 2
                    object Label6: TLabel
                      Left = 467
                      Top = 176
                      Width = 37
                      Height = 13
                      Caption = 'CFOP:'
                      FocusControl = dbeNatOperacao
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 47
                      Top = 52
                      Width = 62
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = dbeDescricao
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label11: TLabel
                      Left = 69
                      Top = 76
                      Width = 40
                      Height = 13
                      Caption = 'Marca:'
                      FocusControl = dbeMarca
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 398
                      Top = 128
                      Width = 106
                      Height = 13
                      Caption = 'Altera Cod Cupom:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label15: TLabel
                      Left = 272
                      Top = 101
                      Width = 40
                      Height = 13
                      Caption = 'Isento:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 18
                      Top = 128
                      Width = 91
                      Height = 13
                      Caption = 'N'#227'o Incid'#234'ncia:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label17: TLabel
                      Left = 57
                      Top = 101
                      Width = 52
                      Height = 13
                      Caption = 'Unidade:'
                      FocusControl = dbeUnidade
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label21: TLabel
                      Left = 594
                      Top = 128
                      Width = 113
                      Height = 13
                      Caption = 'Altera Desc Cupom:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label22: TLabel
                      Left = 80
                      Top = 176
                      Width = 29
                      Height = 13
                      Caption = 'CST:'
                      FocusControl = dbeCST
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label25: TLabel
                      Left = 425
                      Top = 101
                      Width = 79
                      Height = 13
                      Caption = 'Isento Pis/C.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label26: TLabel
                      Left = 32
                      Top = 152
                      Width = 77
                      Height = 13
                      Caption = 'Emb.Produto:'
                      FocusControl = dbeEmbProduto
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label28: TLabel
                      Left = 212
                      Top = 152
                      Width = 100
                      Height = 13
                      Caption = 'Qtde Embalagem:'
                      FocusControl = dbeQtdeEmbalagem
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label29: TLabel
                      Left = 453
                      Top = 151
                      Width = 51
                      Height = 13
                      Caption = 'Balanca:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label30: TLabel
                      Left = 636
                      Top = 151
                      Width = 71
                      Height = 13
                      Caption = 'Val. P/ Bal.:'
                      FocusControl = dbeValBalanca
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label35: TLabel
                      Left = 508
                      Top = 27
                      Width = 64
                      Height = 13
                      Caption = 'Tipo Prod.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label40: TLabel
                      Left = 250
                      Top = 176
                      Width = 62
                      Height = 13
                      Caption = 'C'#243'd. NBM:'
                      FocusControl = dbeNBM
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 46
                      Top = 27
                      Width = 65
                      Height = 13
                      Caption = 'Sub Grupo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label24: TLabel
                      Left = 605
                      Top = 176
                      Width = 98
                      Height = 13
                      Caption = 'CFOP Interestad:'
                      FocusControl = DBEdit2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object dbeNatOperacao: TDBEdit
                      Left = 507
                      Top = 168
                      Width = 72
                      Height = 21
                      Hint = 'C'#243'digo de Natureza de opera'#231#227'o'
                      CharCase = ecUpperCase
                      DataField = 'CODIGO_NOP'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 18
                    end
                    object dbeDescricao: TDBEdit
                      Left = 114
                      Top = 44
                      Width = 376
                      Height = 21
                      Hint = 'Descri'#231#227'o do Produto'
                      CharCase = ecUpperCase
                      DataField = 'DESCR_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                    end
                    object dbeMarca: TDBEdit
                      Left = 155
                      Top = 68
                      Width = 335
                      Height = 21
                      Hint = 'Descri'#231#227'o da marca'
                      CharCase = ecUpperCase
                      DataField = 'MARCA_P'
                      DataSource = dtmProdutos.dsPerfilProd
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 5
                    end
                    object dbeUnidade: TDBEdit
                      Left = 114
                      Top = 93
                      Width = 72
                      Height = 21
                      Hint = 'Unidade do produto'
                      CharCase = ecUpperCase
                      DataField = 'UNIDADE'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                    end
                    object dbeCST: TDBEdit
                      Left = 114
                      Top = 168
                      Width = 72
                      Height = 21
                      Hint = 'C'#243'digo da situa'#231#227'o tribut'#225'ria para o produto.'
                      CharCase = ecUpperCase
                      DataField = 'CST_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 16
                    end
                    object dbeEmbProduto: TDBEdit
                      Left = 114
                      Top = 144
                      Width = 72
                      Height = 21
                      Hint = 'Tipo de embalagem unit'#225'ria. Exemplo: 1X1KG ou 1X5KG, etc.'
                      CharCase = ecUpperCase
                      DataField = 'EMB_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 12
                    end
                    object dbeQtdeEmbalagem: TDBEdit
                      Left = 316
                      Top = 144
                      Width = 72
                      Height = 21
                      Hint = 'Quantidade de itens que vem na embalagem do produto.'
                      CharCase = ecUpperCase
                      DataField = 'QTDEMB'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 13
                    end
                    object dbeValBalanca: TDBEdit
                      Left = 708
                      Top = 143
                      Width = 72
                      Height = 21
                      Hint = 
                        'Validade em dias para que se monte o arquivo para carga na balan' +
                        #231'a filizola.'
                      CharCase = ecUpperCase
                      DataField = 'VALIDADE_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 15
                    end
                    object dbeNBM: TDBEdit
                      Left = 316
                      Top = 168
                      Width = 72
                      Height = 21
                      Hint = '[F3: Consultar] [F4: Novo] - C'#243'gigo NBM/NCM do produto'
                      CharCase = ecUpperCase
                      DataField = 'NBM'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 17
                      OnExit = dbeNBMExit
                      OnKeyDown = dbeNBMKeyDown
                    end
                    object dbeIsento: TDBComboBox
                      Left = 316
                      Top = 93
                      Width = 72
                      Height = 21
                      Hint = 'O produto '#233' isento de imposto icms?'
                      CharCase = ecUpperCase
                      DataField = 'ISENTO_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      ParentFont = False
                      TabOrder = 7
                      OnExit = dbeIsentoExit
                    end
                    object dbeIsentoPis: TDBComboBox
                      Left = 507
                      Top = 93
                      Width = 73
                      Height = 21
                      Hint = 'Produto isento ou n'#227'o de pis e cofins na opera'#231#227'o de venda.'
                      CharCase = ecUpperCase
                      DataField = 'ISENTO_PIS'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      ParentFont = False
                      TabOrder = 8
                    end
                    object dbcbBalanca: TDBComboBox
                      Left = 507
                      Top = 143
                      Width = 72
                      Height = 21
                      Hint = 
                        'O produto vai fazer parte do arquivo que '#233' montado para balan'#231'a ' +
                        'Filizola?'
                      CharCase = ecUpperCase
                      DataField = 'BALANCA_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      ParentFont = False
                      TabOrder = 14
                      OnExit = dbcbBalancaExit
                    end
                    object dbeDescCupom: TDBComboBox
                      Left = 708
                      Top = 120
                      Width = 73
                      Height = 21
                      Hint = 'Alterar ou n'#227'o a descri'#231#227'o do cupom fiscal durante sua emiss'#227'o.'
                      CharCase = ecUpperCase
                      DataField = 'ALT_DESC_CUPOM'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      ParentFont = False
                      TabOrder = 11
                      OnExit = dbeDescCupomExit
                    end
                    object dbcbAlteraCodCupom: TDBComboBox
                      Left = 507
                      Top = 120
                      Width = 73
                      Height = 21
                      Hint = 'Alterar ou n'#227'o os dados do cupom fiscal durante sua emiss'#227'o.'
                      CharCase = ecUpperCase
                      DataField = 'ALT_COD_CUPOM'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      ParentFont = False
                      TabOrder = 10
                      OnExit = dbcbAlteraCodCupomExit
                    end
                    object dbcbTipoProd: TDBComboBox
                      Left = 573
                      Top = 20
                      Width = 207
                      Height = 21
                      Hint = 
                        'P - Produtos industrializados / M - M'#243'veis / E - Eletrodomestico' +
                        's / O - Outros'#39
                      CharCase = ecUpperCase
                      DataField = 'TIP_PROD_IND'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'P - PRODUTO INDUSTRIALIZADO'
                        'M - M'#211'VEL'
                        'E - ELETRODOM'#201'STICO'
                        'O - OUTROS')
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 2
                      OnExit = dbcbTipoProdExit
                    end
                    object dbeNaoIncidencia: TDBComboBox
                      Left = 114
                      Top = 120
                      Width = 73
                      Height = 21
                      Hint = 'Incid'#234'ncia ou n'#227'o de imposto sobre o produto'
                      CharCase = ecUpperCase
                      Color = clWhite
                      DataField = 'N_INCIDENCIA_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      ParentFont = False
                      TabOrder = 9
                      OnExit = dbeNaoIncidenciaExit
                    end
                    object dbeCodSubGrupo: TDBEdit
                      Left = 114
                      Top = 20
                      Width = 38
                      Height = 21
                      Hint = '[F3: Consultar] [F4: Novo]  - Subgrupo do produto '
                      CharCase = ecUpperCase
                      DataField = 'SUB_G_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      OnKeyDown = dbeCodSubGrupoKeyDown
                    end
                    object dblkSubGrupo: TDBLookupComboBox
                      Left = 155
                      Top = 20
                      Width = 335
                      Height = 21
                      Hint = '[F3: Consultar] [F4: Novo]  - Subgrupo do produto '
                      DataField = 'SUB_G_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      KeyField = 'CODIGO_SUBGR'
                      ListField = 'DESCRICAO'
                      ListSource = dtmProdutos.dsLocSGrupoPerfil
                      ParentFont = False
                      TabOrder = 1
                      OnKeyDown = DBEdit1KeyDown
                    end
                    object DBEdit1: TDBEdit
                      Left = 114
                      Top = 68
                      Width = 38
                      Height = 21
                      Hint = '[F3: Consultar] [F4: Novo]  - C'#243'digo da marca'
                      CharCase = ecUpperCase
                      DataField = 'COD_MARCA'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnExit = DBEdit1Exit
                      OnKeyDown = DBEdit1KeyDown
                    end
                    object DBEdit2: TDBEdit
                      Left = 708
                      Top = 168
                      Width = 73
                      Height = 21
                      Hint = 
                        'Relaciona estados cujo produto paga substitui'#231#227'o tribut'#225'ria com ' +
                        'os clientes destes estados.'
                      CharCase = ecUpperCase
                      DataField = 'CFOP_INTER_N_CONT'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 19
                    end
                  end
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 245
                    Width = 807
                    Height = 135
                    Align = alTop
                    Caption = 'Pre'#231'os:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 3
                    object Label9: TLabel
                      Left = 44
                      Top = 111
                      Width = 65
                      Height = 13
                      Caption = 'Loca'#231#227'o 1:'
                      FocusControl = dbeLocacao1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 337
                      Top = 111
                      Width = 65
                      Height = 13
                      Caption = 'Loca'#231#227'o 2:'
                      FocusControl = dbeLocacao2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label13: TLabel
                      Left = 39
                      Top = 15
                      Width = 70
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'P(%) Varejo:'
                      FocusControl = dbePercTabela
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label18: TLabel
                      Left = 57
                      Top = 39
                      Width = 52
                      Height = 13
                      Caption = 'P(%) 30 :'
                      FocusControl = dbeP30
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label19: TLabel
                      Left = 57
                      Top = 63
                      Width = 52
                      Height = 13
                      Caption = 'P(%) 60 :'
                      FocusControl = dbeP60
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 57
                      Top = 87
                      Width = 52
                      Height = 13
                      Caption = 'P(%) 90 :'
                      FocusControl = dbeP90
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label36: TLabel
                      Left = 191
                      Top = 15
                      Width = 213
                      Height = 13
                      Caption = 'Perc. Margem Min Venda Atac(PMM):'
                      FocusControl = dbePMN
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label37: TLabel
                      Left = 484
                      Top = 15
                      Width = 223
                      Height = 13
                      Caption = 'Perc. Margem Min Venda Verejo(PMM):'
                      FocusControl = dbePMNVarejo
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label41: TLabel
                      Left = 252
                      Top = 39
                      Width = 152
                      Height = 13
                      Caption = 'Perc(30 dias) Prec.Tab+%:'
                      FocusControl = dbePerc30
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label42: TLabel
                      Left = 252
                      Top = 63
                      Width = 152
                      Height = 13
                      Caption = 'Perc(60 dias) Prec.Tab+%:'
                      FocusControl = dbePerc60
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label43: TLabel
                      Left = 252
                      Top = 87
                      Width = 152
                      Height = 13
                      Caption = 'Perc(90 dias) Prec.Tab+%:'
                      FocusControl = dbePerc90
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label33: TLabel
                      Left = 629
                      Top = 39
                      Width = 78
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Desc Max(%):'
                      FocusControl = DBEdit3
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object dbeLocacao1: TDBEdit
                      Left = 115
                      Top = 107
                      Width = 72
                      Height = 21
                      Hint = 'Primeira aloca'#231#227'o do produto.'
                      CharCase = ecUpperCase
                      DataField = 'LOCACAO_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 10
                    end
                    object dbeLocacao2: TDBEdit
                      Left = 405
                      Top = 107
                      Width = 72
                      Height = 21
                      Hint = 'Segunda aloca'#231#227'o do produto.'
                      CharCase = ecUpperCase
                      DataField = 'LOCACAO_PROD_1'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 11
                    end
                    object dbePercTabela: TDBEdit
                      Left = 114
                      Top = 12
                      Width = 72
                      Height = 21
                      Hint = 'Percentual do mark up para forma'#231#227'o do pre'#231'o de venda.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_TB_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      OnExit = dbePercTabelaExit
                    end
                    object dbeP30: TDBEdit
                      Left = 114
                      Top = 36
                      Width = 72
                      Height = 21
                      Hint = 'Percentual para montagem do pre'#231'o de venda com 30 dias.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_TB_PROD3'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnExit = dbeP30Exit
                    end
                    object dbeP60: TDBEdit
                      Left = 114
                      Top = 60
                      Width = 72
                      Height = 21
                      Hint = 'Percentual para montagem do pre'#231'o de venda com 30 e 60 dias.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_TB_PROD6'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                      OnExit = dbeP60Exit
                    end
                    object dbeP90: TDBEdit
                      Left = 114
                      Top = 83
                      Width = 72
                      Height = 21
                      Hint = 'Percentual para montagem do pre'#231'o de venda com 30, 60 e 90 dias.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_TB_PROD9'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 8
                      OnExit = dbeP90Exit
                    end
                    object dbePMN: TDBEdit
                      Left = 405
                      Top = 12
                      Width = 72
                      Height = 21
                      Hint = 'Percentual de margem minima para o produto na venda por atacado.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_TB_ATAC'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                    end
                    object dbePMNVarejo: TDBEdit
                      Left = 708
                      Top = 12
                      Width = 72
                      Height = 21
                      Hint = 'Percentual de margem m'#237'nima para o produto vendido no varejo.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_TB_VARE'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                    end
                    object dbePerc30: TDBEdit
                      Left = 405
                      Top = 36
                      Width = 72
                      Height = 21
                      Hint = 
                        'Percentual em que '#233' aumentado o preco de venda com 30 dias, quan' +
                        'do o pre'#231'o a vista '#233' alterado.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_AD_30'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                    end
                    object dbePerc60: TDBEdit
                      Left = 405
                      Top = 60
                      Width = 72
                      Height = 21
                      Hint = 
                        'Percentual em que '#233' aumentado o preco de venda com 30 e 60 dias,' +
                        ' quando o pre'#231'o a vista '#233' alterado.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_AD_60'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 7
                    end
                    object dbePerc90: TDBEdit
                      Left = 405
                      Top = 84
                      Width = 72
                      Height = 21
                      Hint = 
                        'Percentual em que '#233' aumentado o preco de venda com 30, 60 e 90 d' +
                        'ias, quando o pre'#231'o a vista '#233' alterado.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_AD_90'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 9
                    end
                    object DBEdit3: TDBEdit
                      Left = 708
                      Top = 36
                      Width = 72
                      Height = 21
                      Hint = 
                        'Percentual em que '#233' aumentado o preco de venda com 30 dias, quan' +
                        'do o pre'#231'o a vista '#233' alterado.'
                      CharCase = ecUpperCase
                      DataField = 'MAX_DESC_ITEM'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 5
                    end
                  end
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 380
                    Width = 807
                    Height = 93
                    Align = alTop
                    Caption = 'Nota Fiscal / Impostos / Valores'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 4
                    object Label14: TLabel
                      Left = 93
                      Top = 47
                      Width = 21
                      Height = 13
                      Caption = 'IPI:'
                      FocusControl = dbeIPI
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label23: TLabel
                      Left = 236
                      Top = 47
                      Width = 27
                      Height = 13
                      Caption = 'ICM:'
                      FocusControl = dbeICM
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label31: TLabel
                      Left = 415
                      Top = 70
                      Width = 92
                      Height = 13
                      Caption = 'Comiss'#227'o Prod.:'
                      FocusControl = dbeComissaoProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label32: TLabel
                      Left = 204
                      Top = 70
                      Width = 59
                      Height = 13
                      Caption = 'C'#243'd. PPS:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label38: TLabel
                      Left = 7
                      Top = 21
                      Width = 107
                      Height = 13
                      Caption = 'Necessita Acomp.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label39: TLabel
                      Left = 233
                      Top = 21
                      Width = 30
                      Height = 13
                      Caption = 'Dias:'
                      FocusControl = dbeDias
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label34: TLabel
                      Left = 604
                      Top = 70
                      Width = 87
                      Height = 13
                      Caption = 'Com.Prod. Ger:'
                      FocusControl = dbeComProdGer
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label44: TLabel
                      Left = 585
                      Top = 47
                      Width = 105
                      Height = 13
                      Caption = 'Aliquota Red ECF:'
                      FocusControl = dbeAliquotaRed
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label82: TLabel
                      Left = 15
                      Top = 70
                      Width = 99
                      Height = 13
                      Caption = 'Totalizador Red.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object dbeIPI: TDBEdit
                      Left = 114
                      Top = 42
                      Width = 72
                      Height = 21
                      Hint = 
                        'Al'#237'quota que IPI para c'#225'lculo na venda do produto caso este tenh' +
                        'a que recolher o imposto.'
                      CharCase = ecUpperCase
                      DataField = 'IPI_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                    end
                    object dbeICM: TDBEdit
                      Left = 266
                      Top = 42
                      Width = 72
                      Height = 21
                      Hint = 'Al'#237'quota do icms para o produto.'
                      CharCase = ecUpperCase
                      DataField = 'ICM_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                    end
                    object dbeComissaoProd: TDBEdit
                      Left = 510
                      Top = 65
                      Width = 72
                      Height = 21
                      Hint = 'Percentual de comiss'#227'o para vendedor na venda do produto.'
                      CharCase = ecUpperCase
                      DataField = 'COMISSAO_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 7
                    end
                    object dbeDias: TDBEdit
                      Left = 266
                      Top = 18
                      Width = 72
                      Height = 21
                      Hint = 'Dias para acompanhamento do produto no p'#243's vendas.'
                      CharCase = ecUpperCase
                      DataField = 'DIAS_ACOMP'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                    end
                    object dbcbNecAcomp: TDBComboBox
                      Left = 114
                      Top = 18
                      Width = 72
                      Height = 21
                      Hint = 'Indica se o produto necessita de acompanhamento para p'#243's vendas.'
                      CharCase = ecUpperCase
                      DataField = 'NEC_ACOMP'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#195'O'
                        'SIM')
                      ParentFont = False
                      TabOrder = 0
                      OnExit = dbcbNecAcompExit
                    end
                    object dblkcbPPS: TDBLookupComboBox
                      Left = 266
                      Top = 66
                      Width = 72
                      Height = 21
                      Hint = 'C'#243'digo do Pre'#231'o p'#250'blico sugerido.'
                      DataField = 'COD_PPS'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      KeyField = 'COD_PPS'
                      ListField = 'COD_PPS'
                      ListSource = dtmProdutos.dsLocPPSPerfilProd
                      ParentFont = False
                      TabOrder = 6
                    end
                    object dbeComProdGer: TDBEdit
                      Left = 694
                      Top = 65
                      Width = 72
                      Height = 21
                      Hint = 'Percentual de comiss'#227'o paga para o gerente na venda do produto.'
                      CharCase = ecUpperCase
                      DataField = 'COMISSAO_PROD_GER'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 8
                    end
                    object dbeAliquotaRed: TDBEdit
                      Left = 694
                      Top = 42
                      Width = 72
                      Height = 21
                      Hint = 'Al'#237'quota de redu'#231#227'o para venda no cupom.'
                      CharCase = ecUpperCase
                      DataField = 'ALIQ_RED_PROD'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                    end
                    object DBEdit72: TDBEdit
                      Left = 114
                      Top = 66
                      Width = 72
                      Height = 21
                      Hint = 'Totalizador para redu'#231#227'o no ECF.'
                      CharCase = ecUpperCase
                      DataField = 'TOT_ALIQ'
                      DataSource = dtmProdutos.dsPerfilProd
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 5
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 510
              Width = 819
              ExplicitTop = 510
              ExplicitWidth = 819
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [PRO132]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [PRO133]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 819
          ExplicitHeight = 558
          inherited GroupBox3: TGroupBox
            Width = 819
            ExplicitWidth = 819
            inherited imgInformation: TImage
              Left = 793
              ExplicitLeft = 752
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PRO125]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRO126]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 819
            Height = 485
            ExplicitWidth = 819
            ExplicitHeight = 485
            inherited Splitter1: TSplitter
              Height = 424
              ExplicitHeight = 427
            end
            inherited DBGrid1: TDBGrid
              Width = 526
              Height = 424
              DataSource = dtmProdutos.dsPerfilProd
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_PERFIL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_NOP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUB_G_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOCACAO_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOCACAO_PROD_1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCR_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IPI_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ICM_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_TB_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MARCA_P'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALT_COD_CUPOM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_RED_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMISSAO_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ISENTO_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_INCIDENCIA_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_TB_PROD3'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_TB_PROD6'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_TB_PROD9'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALT_DESC_CUPOM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CST_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_PPS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_DSGS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ISENTO_PIS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMB_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QTDEMB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BALANCA_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALIDADE_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESTSUBSTR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMISSAO_PROD_GER'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_RED_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIP_PROD_IND'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_TB_ATAC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_TB_VARE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NEC_ACOMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIAS_ACOMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NBM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_AD_30'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_AD_60'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_AD_90'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCR_PERFIL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_MARCA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOT_ALIQ'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 815
              ExplicitWidth = 815
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRO127]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO128]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PRO131]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [PRO130]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 424
              ExplicitHeight = 424
              inherited ScrollBox2: TScrollBox
                Height = 407
                ExplicitHeight = 407
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 819
          ExplicitHeight = 558
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 731
      Height = 591
      ExplicitLeft = 731
      ExplicitHeight = 591
      inherited bMarketingHW: TBitBtn
        Top = 569
        ExplicitTop = 569
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 593
    Width = 834
    ExplicitTop = 593
    ExplicitWidth = 834
  end
  inherited pnStatusProcessamento: TPanel
    Top = 523
    ExplicitTop = 523
  end
  inherited PopupMenu2: TPopupMenu
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 526
    Top = 27
  end
end
