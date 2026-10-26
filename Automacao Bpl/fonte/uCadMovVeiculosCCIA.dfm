inherited frmEstMotosCCIA: TfrmEstMotosCCIA
  Caption = 'Ve'#237'culos com Movimenta'#231#227'o'
  ExplicitWidth = 814
  ExplicitHeight = 602
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel [0]
    Left = 45
    Top = 187
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cliente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label26: TLabel [1]
    Left = 231
    Top = 277
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor Compra:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        ActivePage = TabSheet1
        Style = tsFlatButtons
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 789
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Height = 510
            ExplicitHeight = 510
            inherited PageControl3: TPageControl
              Height = 462
              ActivePage = TabSheet_Dados
              Style = tsFlatButtons
              OnChange = PageControl3Change
              ExplicitHeight = 462
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 781
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Height = 431
                  ExplicitHeight = 431
                end
              end
              object TabSheet_Dados: TTabSheet
                Caption = 'Dados do Ve'#237'culo'
                ImageIndex = 1
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 431
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 270
                    Width = 777
                    Height = 0
                    Align = alTop
                    Caption = 'GroupBox1'
                    TabOrder = 0
                    Visible = False
                  end
                  object Panel10: TPanel
                    Left = 0
                    Top = 0
                    Width = 777
                    Height = 270
                    Align = alTop
                    TabOrder = 1
                    object Label33: TLabel
                      Left = 39
                      Top = 13
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Codigo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label37: TLabel
                      Left = 37
                      Top = 35
                      Width = 46
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Modelo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label66: TLabel
                      Left = 494
                      Top = 150
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Motor:'
                      FocusControl = DBEdit5
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label68: TLabel
                      Left = 454
                      Top = 127
                      Width = 77
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tp Fins Seg.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label79: TLabel
                      Left = 43
                      Top = 59
                      Width = 40
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Marca:'
                      FocusControl = DBEdit14
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label80: TLabel
                      Left = 295
                      Top = 12
                      Width = 42
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Chassi:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label81: TLabel
                      Left = 494
                      Top = 12
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Placa:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label82: TLabel
                      Left = 59
                      Top = 104
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cor:'
                      FocusControl = DBEdit27
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label83: TLabel
                      Left = 10
                      Top = 82
                      Width = 73
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Combustivel:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label34: TLabel
                      Left = 31
                      Top = 150
                      Width = 52
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ano.Fab:'
                      FocusControl = DBEdit11
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label75: TLabel
                      Left = 22
                      Top = 173
                      Width = 61
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cilindrada:'
                      FocusControl = DBEdit28
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label87: TLabel
                      Left = 161
                      Top = 150
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ano Mod:'
                      FocusControl = DBEdit33
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label88: TLabel
                      Left = 194
                      Top = 173
                      Width = 22
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'HP:'
                      FocusControl = DBEdit32
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label89: TLabel
                      Left = 304
                      Top = 150
                      Width = 53
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cilindros:'
                      FocusControl = DBEdit35
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label92: TLabel
                      Left = 473
                      Top = 173
                      Width = 58
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Renavam:'
                      FocusControl = DBEdit43
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label64: TLabel
                      Left = 437
                      Top = 59
                      Width = 94
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Lota'#231#227'o: (Pass.)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label65: TLabel
                      Left = 441
                      Top = 104
                      Width = 90
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Mod. Renavam:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label70: TLabel
                      Left = 444
                      Top = 82
                      Width = 87
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Esp. Renavam:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label6: TLabel
                      Left = 171
                      Top = 13
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Situa'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label63: TLabel
                      Left = 39
                      Top = 127
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cliente:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 12
                      Top = 198
                      Width = 69
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Fornecedor:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 461
                      Top = 198
                      Width = 70
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo Venda:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label25: TLabel
                      Left = 3
                      Top = 244
                      Width = 80
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Compra:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label27: TLabel
                      Left = 206
                      Top = 244
                      Width = 104
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Sug. Venda:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label28: TLabel
                      Left = 480
                      Top = 244
                      Width = 51
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' Com.:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label29: TLabel
                      Left = 17
                      Top = 222
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc. Red.:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label30: TLabel
                      Left = 205
                      Top = 221
                      Width = 105
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Red. Sobre Lucro:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 85
                      Top = 9
                      Width = 65
                      Height = 21
                      DataField = 'CODIGO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit4: TDBEdit
                      Left = 85
                      Top = 124
                      Width = 39
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 15
                      OnExit = DBEdit4Exit
                      OnKeyDown = DBEdit4KeyDown
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 128
                      Top = 124
                      Width = 296
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmVeiculosCCIA.dsClientesEstMotos
                      TabOrder = 16
                    end
                    object DBEdit5: TDBEdit
                      Left = 537
                      Top = 147
                      Width = 180
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MOTOREST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 21
                    end
                    object DBEdit14: TDBEdit
                      Left = 85
                      Top = 55
                      Width = 39
                      Height = 21
                      Hint = 'Marca do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_MARCA'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 6
                      OnKeyDown = DBEdit14KeyDown
                    end
                    object DBEdit18: TDBEdit
                      Left = 343
                      Top = 9
                      Width = 125
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI_C'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 2
                      OnExit = DBEdit18Exit
                    end
                    object DBEdit26: TDBEdit
                      Left = 537
                      Top = 9
                      Width = 180
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'PLACAEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 3
                    end
                    object DBEdit27: TDBEdit
                      Left = 85
                      Top = 101
                      Width = 39
                      Height = 21
                      Hint = 'Cor do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_COR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 12
                      OnKeyDown = DBEdit27KeyDown
                    end
                    object DBEdit31: TDBEdit
                      Left = 85
                      Top = 32
                      Width = 39
                      Height = 21
                      Hint = 'Marca do Modelo.'
                      DataField = 'VERSAOEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 4
                      OnExit = DBEdit31Exit
                      OnKeyDown = DBEdit31KeyDown
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 128
                      Top = 32
                      Width = 296
                      Height = 21
                      Hint = 'Marca do Modelo.'
                      DataField = 'VERSAOEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'CODIGO'
                      ListField = 'DESCRICAO'
                      ListSource = DtmVeiculosCCIA.dsModVeiculosEstMotos
                      TabOrder = 5
                    end
                    object DBLookupComboBox7: TDBLookupComboBox
                      Left = 128
                      Top = 101
                      Width = 296
                      Height = 21
                      Hint = 'Cor do Ve'#237'culo.'
                      DataField = 'COD_COR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'COD_COR'
                      ListField = 'DESCRICAO_COR'
                      ListSource = DtmVeiculosCCIA.dsCorEstMotos
                      TabOrder = 13
                    end
                    object DBLookupComboBox8: TDBLookupComboBox
                      Left = 128
                      Top = 55
                      Width = 296
                      Height = 21
                      Hint = 'Marca do Ve'#237'culo.'
                      DataField = 'COD_MARCA'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      KeyField = 'COD_MARCA'
                      ListField = 'DESCRICAO_MARCA'
                      ListSource = DtmVeiculosCCIA.dsMarcaEstMotos
                      TabOrder = 7
                    end
                    object DBLookupComboBox9: TDBLookupComboBox
                      Left = 128
                      Top = 78
                      Width = 296
                      Height = 21
                      Hint = 'Combust'#237'vel do Modelo.'
                      DataField = 'COD_COMBUSTIVEL'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      KeyField = 'CODIGO_TPCOMB'
                      ListField = 'DESCR_COMB'
                      ListSource = DtmVeiculosCCIA.dsCombustivelEstMotos
                      TabOrder = 10
                    end
                    object DBEdit8: TDBEdit
                      Left = 85
                      Top = 78
                      Width = 39
                      Height = 21
                      Hint = 'Combust'#237'vel do Modelo.'
                      DataField = 'COD_COMBUSTIVEL'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 9
                      OnKeyDown = DBEdit8KeyDown
                    end
                    object DBEdit11: TDBEdit
                      Left = 85
                      Top = 147
                      Width = 65
                      Height = 21
                      Hint = 'Ano de Fabrica'#231#227'o.'
                      DataField = 'ANO_FABEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 18
                    end
                    object DBEdit28: TDBEdit
                      Left = 85
                      Top = 170
                      Width = 65
                      Height = 21
                      Hint = 'Cilindradas.'
                      DataField = 'CILINDRADAEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 22
                    end
                    object DBEdit32: TDBEdit
                      Left = 218
                      Top = 170
                      Width = 65
                      Height = 21
                      Hint = 'HP.'
                      DataField = 'HPEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 23
                    end
                    object DBEdit33: TDBEdit
                      Left = 218
                      Top = 147
                      Width = 65
                      Height = 21
                      Hint = 'Ano Modelo.'
                      DataField = 'ANO_MODEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 19
                    end
                    object DBEdit35: TDBEdit
                      Left = 359
                      Top = 147
                      Width = 65
                      Height = 21
                      Hint = 'Cilindros.'
                      DataField = 'CILINDROSEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 20
                    end
                    object DBEdit43: TDBEdit
                      Left = 537
                      Top = 170
                      Width = 180
                      Height = 21
                      DataField = 'RENAVAMEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 24
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 537
                      Top = 55
                      Width = 180
                      Height = 21
                      Hint = 'Quantidade de pessoas que o ve'#237'culo pode transportar'
                      Style = csDropDownList
                      DataField = 'LOTACAOEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        '01'
                        '02'
                        '03'
                        '04'
                        '05')
                      TabOrder = 8
                    end
                    object DBLookupComboBox5: TDBLookupComboBox
                      Left = 537
                      Top = 124
                      Width = 180
                      Height = 21
                      Hint = 'Esp'#233'cie V'#233'iculo.'
                      DataField = 'COD_ESPE_SEG'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'CODIGO_ESP'
                      ListField = 'DESCRICAO_ESP'
                      ListSource = DtmVeiculosCCIA.dsEspecieEstMotos
                      TabOrder = 17
                    end
                    object ComboBox4: TComboBox
                      Left = 537
                      Top = 78
                      Width = 180
                      Height = 21
                      Enabled = False
                      ItemHeight = 13
                      TabOrder = 11
                      Text = 'ComboBox4'
                      Items.Strings = (
                        '01 - PASSAGEIRO'
                        '02 - CARGA'
                        '03 - MISTO'
                        '04 - CORRIDA'
                        '05 - TRA'#199#195'O'
                        '06 - ESPECIAL')
                    end
                    object ComboBox5: TComboBox
                      Left = 537
                      Top = 101
                      Width = 180
                      Height = 21
                      Enabled = False
                      ItemHeight = 13
                      TabOrder = 14
                      Text = 'ComboBox5'
                      Items.Strings = (
                        '04 - MOTOCICLO'
                        '03 - MOTONETA'
                        '05 - TRICICLO'
                        '02 - CICLOMOTO'
                        '')
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 232
                      Top = 9
                      Width = 57
                      Height = 21
                      Hint = 'Status Uso'
                      CharCase = ecUpperCase
                      DataField = 'STATUS_USO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        'N - NOVO'
                        'U - USADO')
                      TabOrder = 1
                      OnExit = DBComboBox3Exit
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 128
                      Top = 194
                      Width = 295
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      DataField = 'COD_FORNECEDOR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmVeiculosCCIA.dsFornecedorEstMotos
                      TabOrder = 26
                    end
                    object DBEdit2: TDBEdit
                      Left = 85
                      Top = 194
                      Width = 39
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      DataField = 'COD_FORNECEDOR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 25
                      OnExit = DBEdit2Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 537
                      Top = 194
                      Width = 180
                      Height = 21
                      Hint = 'Tipo de Contrato'
                      DataField = 'STATUS_CONTRATO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        'VENDA'
                        'CONSIGNADO'
                        'INTERMEDIACAO')
                      TabOrder = 27
                    end
                    object DBEdit10: TDBEdit
                      Left = 85
                      Top = 241
                      Width = 110
                      Height = 21
                      Hint = 'HP.'
                      DataField = 'VL_COMPRA'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 30
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit12: TDBEdit
                      Left = 313
                      Top = 241
                      Width = 110
                      Height = 21
                      Hint = 'HP.'
                      DataField = 'VALOR_VEN'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 31
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit13: TDBEdit
                      Left = 537
                      Top = 240
                      Width = 180
                      Height = 21
                      Hint = 'HP.'
                      DataField = 'COM_ENT'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 32
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit15: TDBEdit
                      Left = 85
                      Top = 218
                      Width = 110
                      Height = 21
                      Hint = 'HP.'
                      DataField = 'PERC_RED'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 28
                      OnExit = DBEdit10Exit
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 313
                      Top = 217
                      Width = 110
                      Height = 21
                      Hint = 'Tipo de Contrato'
                      DataField = 'RED_LUCRO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 29
                    end
                  end
                  object Panel11: TPanel
                    Left = 0
                    Top = 270
                    Width = 777
                    Height = 157
                    Align = alClient
                    TabOrder = 2
                    object PageControl2: TPageControl
                      Left = 1
                      Top = 1
                      Width = 775
                      Height = 155
                      ActivePage = TabSheet6
                      Align = alClient
                      Style = tsFlatButtons
                      TabOrder = 0
                      object TabSheet6: TTabSheet
                        Caption = 'Kits'
                        object GroupBox23: TGroupBox
                          Left = 0
                          Top = 0
                          Width = 767
                          Height = 36
                          Align = alTop
                          TabOrder = 0
                          object Label11: TLabel
                            Left = 610
                            Top = 13
                            Width = 84
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Data Cadastro:'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object DBText1: TDBText
                            Left = 700
                            Top = 13
                            Width = 65
                            Height = 17
                            DataField = 'DAT_CAD_PROD'
                            DataSource = dtmProdutos.dsProdutos
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object BitBtn7: TBitBtn
                            Left = 4
                            Top = 9
                            Width = 75
                            Height = 22
                            Hint = 'Incluir Registro - [PRO012]'
                            Caption = '&Incluir'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 0
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000420B0000420B00000001000000010000B5847300AD73
                              8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                              D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                              FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                              1111111111111111111111111101020202020202020202020211111111011313
                              1313131313131313021111111101131313131313131313130211111111011313
                              1313131313131313021111111101131313131313131313130211111111011313
                              1313131313131313021111111101131313131313131313130211111111011313
                              13131313131313130211111112121210101010101010101002111111120D120C
                              0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                              120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                              0808080806000211111111111212120707070707050011111111}
                          end
                          object BitBtn8: TBitBtn
                            Left = 84
                            Top = 9
                            Width = 75
                            Height = 22
                            Hint = 'Alterar Registro - [PRO014]'
                            Caption = '&Alterar'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 1
                            Glyph.Data = {
                              6E030000424D6E030000000000006E0200002800000010000000100000000100
                              08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                              FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
                              5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
                              5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
                              8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
                              2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
                              C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
                              3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
                              EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
                              E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
                              CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
                              8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
                              BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
                              6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
                              F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
                              F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
                              A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
                              DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
                              B400010B9900010A95002732D000000081000202020202020202020202020202
                              020207070707070707070707070707020202076D594A585662515D5C5B6B0702
                              02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
                              02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
                              020234013E416705261B151130640D02020234016E484142241E1A1310310A02
                              02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
                              02023C010101016E4F6835181D06787676023C01010101017071322A27797581
                              878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
                              848B403A3A3A3A3A3A3A3A2C0202028C8902}
                          end
                          object BitBtn12: TBitBtn
                            Left = 164
                            Top = 9
                            Width = 75
                            Height = 22
                            Hint = 'Excluir Registro - [PRO016]'
                            Caption = '&Deletar'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 2
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000220B0000220B000000010000000100000031DE000031
                              E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                              0404040404040404000004000004040404040404040404000004040000000404
                              0404040404040000040404000000000404040404040000040404040402000000
                              0404040400000404040404040404000000040000000404040404040404040400
                              0101010004040404040404040404040401010204040404040404040404040400
                              0201020304040404040404040404030201040403030404040404040404050203
                              0404040405030404040404040303050404040404040303040404040303030404
                              0404040404040403040403030304040404040404040404040404030304040404
                              0404040404040404040404040404040404040404040404040404}
                          end
                        end
                        object Panel13: TPanel
                          Left = 0
                          Top = 36
                          Width = 767
                          Height = 88
                          Align = alClient
                          Caption = 'Panel12'
                          TabOrder = 1
                          object DBGrid9: TDBGrid
                            Left = 1
                            Top = 1
                            Width = 765
                            Height = 86
                            Hint = 
                              'Quaisquer altera'#231#245'es em algum c'#243'digo de barras somente ser'#225' efet' +
                              'ivamente confirmada ap'#243's confirma'#231#227'o nas modifica'#231'oes do produto' +
                              '.'
                            Align = alClient
                            DataSource = dtmProdutos.dsCodBarra
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            ReadOnly = True
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                          end
                        end
                      end
                      object TabSheet7: TTabSheet
                        Caption = 'Opcionais'
                        ImageIndex = 1
                        object GroupBox24: TGroupBox
                          Left = 0
                          Top = 0
                          Width = 767
                          Height = 36
                          Align = alTop
                          TabOrder = 0
                          object Label71: TLabel
                            Left = 610
                            Top = 13
                            Width = 84
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Data Cadastro:'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object DBText2: TDBText
                            Left = 700
                            Top = 13
                            Width = 65
                            Height = 17
                            DataField = 'DAT_CAD_PROD'
                            DataSource = dtmProdutos.dsProdutos
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object BitBtn11: TBitBtn
                            Left = 4
                            Top = 9
                            Width = 75
                            Height = 22
                            Hint = 'Incluir Registro - [PRO012]'
                            Caption = '&Incluir'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 0
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000420B0000420B00000001000000010000B5847300AD73
                              8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                              D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                              FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                              1111111111111111111111111101020202020202020202020211111111011313
                              1313131313131313021111111101131313131313131313130211111111011313
                              1313131313131313021111111101131313131313131313130211111111011313
                              1313131313131313021111111101131313131313131313130211111111011313
                              13131313131313130211111112121210101010101010101002111111120D120C
                              0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                              120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                              0808080806000211111111111212120707070707050011111111}
                          end
                          object BitBtn14: TBitBtn
                            Left = 84
                            Top = 9
                            Width = 75
                            Height = 22
                            Hint = 'Alterar Registro - [PRO014]'
                            Caption = '&Alterar'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 1
                            Glyph.Data = {
                              6E030000424D6E030000000000006E0200002800000010000000100000000100
                              08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                              FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
                              5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
                              5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
                              8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
                              2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
                              C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
                              3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
                              EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
                              E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
                              CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
                              8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
                              BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
                              6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
                              F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
                              F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
                              A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
                              DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
                              B400010B9900010A95002732D000000081000202020202020202020202020202
                              020207070707070707070707070707020202076D594A585662515D5C5B6B0702
                              02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
                              02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
                              020234013E416705261B151130640D02020234016E484142241E1A1310310A02
                              02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
                              02023C010101016E4F6835181D06787676023C01010101017071322A27797581
                              878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
                              848B403A3A3A3A3A3A3A3A2C0202028C8902}
                          end
                          object BitBtn15: TBitBtn
                            Left = 164
                            Top = 9
                            Width = 75
                            Height = 22
                            Hint = 'Excluir Registro - [PRO016]'
                            Caption = '&Deletar'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 2
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000220B0000220B000000010000000100000031DE000031
                              E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                              0404040404040404000004000004040404040404040404000004040000000404
                              0404040404040000040404000000000404040404040000040404040402000000
                              0404040400000404040404040404000000040000000404040404040404040400
                              0101010004040404040404040404040401010204040404040404040404040400
                              0201020304040404040404040404030201040403030404040404040404050203
                              0404040405030404040404040303050404040404040303040404040303030404
                              0404040404040403040403030304040404040404040404040404030304040404
                              0404040404040404040404040404040404040404040404040404}
                          end
                        end
                        object Panel12: TPanel
                          Left = 0
                          Top = 36
                          Width = 767
                          Height = 88
                          Align = alClient
                          Caption = 'Panel12'
                          TabOrder = 1
                          object DBGrid7: TDBGrid
                            Left = 1
                            Top = 1
                            Width = 765
                            Height = 86
                            Hint = 
                              'Quaisquer altera'#231#245'es em algum c'#243'digo de barras somente ser'#225' efet' +
                              'ivamente confirmada ap'#243's confirma'#231#227'o nas modifica'#231'oes do produto' +
                              '.'
                            Align = alClient
                            DataSource = dtmProdutos.dsCodBarra
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            ReadOnly = True
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                          end
                        end
                      end
                    end
                  end
                end
              end
              object TabSheet_Pendencias: TTabSheet
                Caption = 'Pend'#234'ncias'
                ImageIndex = 3
                object ScrollBox7: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 431
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox12: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 777
                    Height = 72
                    Align = alTop
                    TabOrder = 0
                    object Label43: TLabel
                      Left = 42
                      Top = 18
                      Width = 49
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Assunto:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label44: TLabel
                      Left = 524
                      Top = 18
                      Width = 86
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dt. Pend'#234'ncia:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label45: TLabel
                      Left = 33
                      Top = 45
                      Width = 58
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit_Data_Pendencia: TDBEdit
                      Left = 613
                      Top = 15
                      Width = 120
                      Height = 21
                      Hint = 'Data da pend'#234'ncia.'
                      CharCase = ecUpperCase
                      DataField = 'DATA_PENDENCIA'
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      Enabled = False
                      TabOrder = 2
                    end
                    object DBLookupComboBox_Assunto_Pendencia: TDBLookupComboBox
                      Left = 139
                      Top = 15
                      Width = 329
                      Height = 21
                      Hint = 'Tipo de Pend'#234'ncia.'
                      DataField = 'COD_TP_PENDENCIA'
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      KeyField = 'COD_TP_PENDENCIA'
                      ListField = 'DESCRICAO'
                      ListSource = DtmVeiculosCCIA.dsAbreTPPendencia
                      TabOrder = 1
                    end
                    object DBEdit_Descricao_Pendencia: TDBEdit
                      Left = 94
                      Top = 42
                      Width = 639
                      Height = 21
                      Hint = 'Descri'#231#227'o da Ped'#234'ncia.'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      TabOrder = 3
                    end
                    object DBEdit_Assunto_Pendencia: TDBEdit
                      Left = 94
                      Top = 15
                      Width = 39
                      Height = 21
                      Hint = 'Tipo de Pend'#234'ncia.'
                      DataField = 'COD_TP_PENDENCIA'
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      TabOrder = 0
                      OnKeyDown = DBEdit_Assunto_PendenciaKeyDown
                    end
                  end
                  object GroupBox13: TGroupBox
                    Left = 0
                    Top = 72
                    Width = 777
                    Height = 106
                    Align = alTop
                    TabOrder = 1
                    object Label46: TLabel
                      Left = 51
                      Top = 49
                      Width = 40
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Status:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label47: TLabel
                      Left = 538
                      Top = 77
                      Width = 72
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dt. Prevista:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label49: TLabel
                      Left = 23
                      Top = 21
                      Width = 68
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Funcion'#225'rio:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label50: TLabel
                      Left = 59
                      Top = 77
                      Width = 32
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit_DataPrevista_Pendencia: TDBEdit
                      Left = 613
                      Top = 74
                      Width = 120
                      Height = 21
                      Hint = 'Data prevista.'
                      CharCase = ecUpperCase
                      DataField = 'DATA_PREVISTA'
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      TabOrder = 3
                    end
                    object DBLookupComboBox_Funcionario_Pendencia: TDBLookupComboBox
                      Left = 94
                      Top = 17
                      Width = 378
                      Height = 21
                      Hint = 'Funcion'#225'rio respons'#225'vel.'
                      DataField = 'COD_FUNC_PENDENCIA'
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = DtmVeiculosCCIA.dsColaboradorEstMotos
                      TabOrder = 0
                    end
                    object DBEdit_Valor_Pendencia: TDBEdit
                      Left = 94
                      Top = 74
                      Width = 120
                      Height = 21
                      Hint = 'Valor da pend'#234'ncia.'
                      CharCase = ecUpperCase
                      DataField = 'VALOR_PENDENCIA'
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      TabOrder = 2
                    end
                    object DBComboBox_Status_Pendencia: TDBComboBox
                      Left = 94
                      Top = 46
                      Width = 121
                      Height = 21
                      Hint = 'Status pend'#234'ncia.'
                      Style = csDropDownList
                      DataField = 'STATUS_PENDENCIA'
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      ItemHeight = 13
                      Items.Strings = (
                        'PENDENTE'
                        'REGULAR')
                      TabOrder = 1
                    end
                  end
                  object GroupBox17: TGroupBox
                    Left = 0
                    Top = 178
                    Width = 777
                    Height = 46
                    Align = alTop
                    TabOrder = 2
                    object Label61: TLabel
                      Left = 576
                      Top = 22
                      Width = 34
                      Height = 13
                      Caption = 'Total:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit_SomaTotalPendencia: TDBEdit
                      Left = 613
                      Top = 19
                      Width = 120
                      Height = 21
                      BiDiMode = bdRightToLeft
                      CharCase = ecUpperCase
                      Enabled = False
                      ParentBiDiMode = False
                      TabOrder = 5
                    end
                    object BitBtn_Novo_Pendencia: TBitBtn
                      Left = 8
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Novo Pend'#234'ncia - [VEI022]'
                      Caption = 'Novo'
                      TabOrder = 0
                      OnClick = BitBtn_Novo_PendenciaClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B00000001000000010000B5847300AD73
                        8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                        D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                        FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                        1111111111111111111111111101020202020202020202020211111111011313
                        1313131313131313021111111101131313131313131313130211111111011313
                        1313131313131313021111111101131313131313131313130211111111011313
                        1313131313131313021111111101131313131313131313130211111111011313
                        13131313131313130211111112121210101010101010101002111111120D120C
                        0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                        120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                        0808080806000211111111111212120707070707050011111111}
                    end
                    object BitBtn_Alterar_Pendencia: TBitBtn
                      Left = 89
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Alterar Pend'#234'ncia - [VEI021]'
                      Caption = 'Alterar'
                      TabOrder = 1
                      OnClick = BitBtn_Alterar_PendenciaClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B00000001000000010000000000000084
                        0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                        52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                        9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                        A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                        B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                        BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                        DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                        FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                        0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                        2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                        31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                        363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                        2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                        443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                        4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                        3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                    end
                    object BitBtn_Salvar_Pendencia: TBitBtn
                      Left = 170
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Salvar Pend'#234'ncia - [VEI020]'
                      Caption = 'Salvar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnClick = BitBtn_Salvar_PendenciaClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000220B0000220B00000001000000010000942929009431
                        31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
                        4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
                        5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
                        73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
                        8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
                        A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
                        BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
                        CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
                        E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
                        33343433332505050B4848191516111B27384647452D0002131048191515111A
                        05184046492E0102121048191515111C03032F42493200011210481915151120
                        0601243A493200011210481915151221231D1F27322C04041310481915151515
                        1515151313151515160F48190D111E282B292B2828292B26150C481909384544
                        4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
                        3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
                        4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
                        4343434343434630130F4848092D3A363636363636363A2A0748}
                    end
                    object BitBtn_Cancelar_Pendencia: TBitBtn
                      Left = 251
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Cancelar Ped'#234'ncia'
                      Caption = 'Cancelar'
                      TabOrder = 3
                      OnClick = BitBtn_Cancelar_PendenciaClick
                      Glyph.Data = {
                        12020000424D1202000000000000120100002800000010000000100000000100
                        08000000000000010000120B0000120B0000370000003700000000000000FFFF
                        FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
                        DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
                        EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
                        EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
                        E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
                        DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
                        E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
                        0202020202020202020202020202020202020202020202020236360202020202
                        0236360202020202361A28360202020236302E36020202023621182A36020236
                        332B34360202020202362419293636312C353602020202020202361E11272D2B
                        3236020202020202020202361B26252F36020202020202020202023612172022
                        36020202020202020202360F06131C0A2336020202020202023607080E363614
                        0B1F3602020202023603041036020236160D1D36020202023605093602020202
                        36150C3602020202023636020202020202363602020202020202020202020202
                        02020202020202020202020202020202020202020202}
                    end
                    object BitBtn_Excluir_Pendencia: TBitBtn
                      Left = 332
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Excluir Pend'#234'ncia - [VEI023]'
                      Caption = 'Excluir'
                      TabOrder = 4
                      OnClick = BitBtn_Excluir_PendenciaClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000220B0000220B000000010000000100000031DE000031
                        E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                        0404040404040404000004000004040404040404040404000004040000000404
                        0404040404040000040404000000000404040404040000040404040402000000
                        0404040400000404040404040404000000040000000404040404040404040400
                        0101010004040404040404040404040401010204040404040404040404040400
                        0201020304040404040404040404030201040403030404040404040404050203
                        0404040405030404040404040303050404040404040303040404040303030404
                        0404040404040403040403030304040404040404040404040404030304040404
                        0404040404040404040404040404040404040404040404040404}
                    end
                  end
                  object Panel7: TPanel
                    Left = 0
                    Top = 224
                    Width = 777
                    Height = 188
                    Align = alTop
                    Caption = 'Panel7'
                    TabOrder = 3
                    object DBGrid3: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 775
                      Height = 186
                      Align = alClient
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnKeyDown = DBGrid3KeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'COD_PENDENCIA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCRICAO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCRICAO_TP'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_PENDENCIA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_PREVISTA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_PENDENCIA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'STATUS_PENDENCIA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_FUNC'
                          Title.Caption = 'Cod Func'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_FUNC_PENDENCIA'
                          Title.Caption = 'Cod Func Previsao'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_TIPOPENDENCIA'
                          Title.Caption = 'Cod Tipo Pend'#234'ncia'
                          Visible = True
                        end>
                    end
                  end
                  object Panel8: TPanel
                    Left = 0
                    Top = 412
                    Width = 777
                    Height = 15
                    Align = alClient
                    TabOrder = 4
                    object Label10: TLabel
                      Left = 52
                      Top = 8
                      Width = 48
                      Height = 13
                      Caption = 'Usu'#225'rio:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBLookupComboBox_Usuario_Pendencia: TDBLookupComboBox
                      Left = 106
                      Top = 6
                      Width = 294
                      Height = 21
                      DataField = 'COD_FUNC'
                      DataSource = DtmVeiculosCCIA.dsPendencias
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = DtmVeiculosCCIA.dsColaboradorEstMotos
                      TabOrder = 0
                    end
                  end
                end
              end
              object TabSheet_Despesas: TTabSheet
                Caption = 'Despesas'
                ImageIndex = 4
                object ScrollBox8: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 431
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox14: TGroupBox
                    Left = 0
                    Top = 63
                    Width = 777
                    Height = 125
                    Align = alTop
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    object Label53: TLabel
                      Left = 47
                      Top = 45
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' Cheque:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label54: TLabel
                      Left = 72
                      Top = 72
                      Width = 41
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Status:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label55: TLabel
                      Left = 250
                      Top = 98
                      Width = 92
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dt. Vencimento:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label58: TLabel
                      Left = 8
                      Top = 19
                      Width = 105
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Controle de Caixa:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label59: TLabel
                      Left = 79
                      Top = 99
                      Width = 34
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label32: TLabel
                      Left = 282
                      Top = 19
                      Width = 60
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Despesas:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit_Valor_Despesa: TDBEdit
                      Left = 115
                      Top = 95
                      Width = 120
                      Height = 21
                      Hint = 'Valor.'
                      CharCase = ecUpperCase
                      DataField = 'VALOR_DESPESA'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      TabOrder = 4
                    end
                    object DBEdit_DataVencimento_Despesa: TDBEdit
                      Left = 348
                      Top = 95
                      Width = 120
                      Height = 21
                      Hint = 'Data de Vencimento.'
                      CharCase = ecUpperCase
                      DataField = 'DATA_VENCIMENTO'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      TabOrder = 5
                    end
                    object DBEdit_Controle_Despesa: TDBEdit
                      Left = 115
                      Top = 15
                      Width = 120
                      Height = 21
                      Hint = 'Controle do Caixa.'
                      CharCase = ecUpperCase
                      DataField = 'CODIGO_CTRL'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      TabOrder = 0
                    end
                    object DBEdit_N_CH_Despesa: TDBEdit
                      Left = 115
                      Top = 42
                      Width = 120
                      Height = 21
                      Hint = 'N'#186' Cheque.'
                      CharCase = ecUpperCase
                      DataField = 'N_CH'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      TabOrder = 1
                    end
                    object DBMemo_Despesa_Despesa: TDBMemo
                      Left = 348
                      Top = 14
                      Width = 400
                      Height = 75
                      Hint = 'Observa'#231#227'o.'
                      DataField = 'DESPESAS'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      TabOrder = 3
                    end
                    object DBComboBox_Status_Despesa: TDBComboBox
                      Left = 114
                      Top = 69
                      Width = 121
                      Height = 21
                      Hint = 'Status'
                      Style = csDropDownList
                      DataField = 'STATUS_DESPESA'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      ItemHeight = 13
                      Items.Strings = (
                        'PENDENTE'
                        'REGULAR')
                      TabOrder = 2
                    end
                  end
                  object GroupBox15: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 777
                    Height = 63
                    Align = alTop
                    TabOrder = 0
                    object Label51: TLabel
                      Left = 19
                      Top = 40
                      Width = 69
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Fornecedor:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label52: TLabel
                      Left = 536
                      Top = 19
                      Width = 75
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dt. Despesa:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 38
                      Top = 15
                      Width = 50
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Assunto:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit_Data_Despesa: TDBEdit
                      Left = 613
                      Top = 16
                      Width = 123
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DATA_DESPESA'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      Enabled = False
                      TabOrder = 4
                    end
                    object DBLookupComboBox_Fornecedor_Despesa: TDBLookupComboBox
                      Left = 139
                      Top = 36
                      Width = 329
                      Height = 21
                      Hint = 'Fornecedor.'
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmVeiculosCCIA.dsFornecDespesa
                      TabOrder = 3
                    end
                    object DBLookupComboBox_Assunto_Despesa: TDBLookupComboBox
                      Left = 139
                      Top = 13
                      Width = 329
                      Height = 21
                      Hint = 'Tipo de Despesa.'
                      DataField = 'COD_TP_DESPESA'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      KeyField = 'COD_TP_DESPESA'
                      ListField = 'DESCRICAO'
                      ListSource = DtmVeiculosCCIA.dsAbreTPDespesa
                      TabOrder = 1
                    end
                    object DBEdit_Assunto_Despesa: TDBEdit
                      Left = 94
                      Top = 13
                      Width = 39
                      Height = 21
                      Hint = 'Tipo de Despesa.'
                      DataField = 'COD_TP_DESPESA'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      TabOrder = 0
                      OnKeyDown = DBEdit_Assunto_DespesaKeyDown
                    end
                    object DBEdit_Fornecedor_Despesa: TDBEdit
                      Left = 94
                      Top = 36
                      Width = 39
                      Height = 21
                      Hint = 'Fornecedor.'
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      TabOrder = 2
                      OnExit = DBEdit_Fornecedor_DespesaExit
                      OnKeyDown = DBEdit_Fornecedor_DespesaKeyDown
                    end
                  end
                  object GroupBox18: TGroupBox
                    Left = 0
                    Top = 188
                    Width = 777
                    Height = 46
                    Align = alTop
                    TabOrder = 2
                    object Label62: TLabel
                      Left = 577
                      Top = 22
                      Width = 34
                      Height = 13
                      Caption = 'Total:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object BitBtn_Alterar_Despesa: TBitBtn
                      Left = 89
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Alterar Despesas  - [VEI028]'
                      Caption = 'Alterar'
                      TabOrder = 0
                      OnClick = BitBtn_Alterar_DespesaClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B00000001000000010000000000000084
                        0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                        52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                        9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                        A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                        B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                        BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                        DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                        FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                        0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                        2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                        31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                        363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                        2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                        443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                        4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                        3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                    end
                    object BitBtn_Cancelar_Despesa: TBitBtn
                      Left = 251
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Cancelar Despesas'
                      Caption = 'Cancelar'
                      TabOrder = 2
                      OnClick = BitBtn_Cancelar_DespesaClick
                      Glyph.Data = {
                        12020000424D1202000000000000120100002800000010000000100000000100
                        08000000000000010000120B0000120B0000370000003700000000000000FFFF
                        FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
                        DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
                        EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
                        EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
                        E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
                        DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
                        E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
                        0202020202020202020202020202020202020202020202020236360202020202
                        0236360202020202361A28360202020236302E36020202023621182A36020236
                        332B34360202020202362419293636312C353602020202020202361E11272D2B
                        3236020202020202020202361B26252F36020202020202020202023612172022
                        36020202020202020202360F06131C0A2336020202020202023607080E363614
                        0B1F3602020202023603041036020236160D1D36020202023605093602020202
                        36150C3602020202023636020202020202363602020202020202020202020202
                        02020202020202020202020202020202020202020202}
                    end
                    object BitBtn_Excluir_Despesa: TBitBtn
                      Left = 332
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Excluir Despesas - [VEI030]'
                      Caption = 'Excluir'
                      TabOrder = 3
                      OnClick = BitBtn_Excluir_DespesaClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000220B0000220B000000010000000100000031DE000031
                        E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                        0404040404040404000004000004040404040404040404000004040000000404
                        0404040404040000040404000000000404040404040000040404040402000000
                        0404040400000404040404040404000000040000000404040404040404040400
                        0101010004040404040404040404040401010204040404040404040404040400
                        0201020304040404040404040404030201040403030404040404040404050203
                        0404040405030404040404040303050404040404040303040404040303030404
                        0404040404040403040403030304040404040404040404040404030304040404
                        0404040404040404040404040404040404040404040404040404}
                    end
                    object BitBtn_Salvar_Despesa: TBitBtn
                      Left = 170
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Salvar Despesas - [VEI027]'
                      Caption = 'Salvar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      OnClick = BitBtn_Salvar_DespesaClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000220B0000220B00000001000000010000942929009431
                        31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
                        4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
                        5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
                        73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
                        8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
                        A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
                        BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
                        CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
                        E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
                        33343433332505050B4848191516111B27384647452D0002131048191515111A
                        05184046492E0102121048191515111C03032F42493200011210481915151120
                        0601243A493200011210481915151221231D1F27322C04041310481915151515
                        1515151313151515160F48190D111E282B292B2828292B26150C481909384544
                        4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
                        3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
                        4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
                        4343434343434630130F4848092D3A363636363636363A2A0748}
                    end
                    object DBEdit_SomaTotalDespesa: TDBEdit
                      Left = 613
                      Top = 19
                      Width = 123
                      Height = 21
                      BiDiMode = bdRightToLeft
                      CharCase = ecUpperCase
                      Enabled = False
                      ParentBiDiMode = False
                      TabOrder = 4
                    end
                    object BitBtn_Novo_Despesa: TBitBtn
                      Left = 8
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Novo Despesa - [VEI029]'
                      Caption = 'Novo'
                      TabOrder = 5
                      OnClick = BitBtn_Novo_DespesaClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B00000001000000010000B5847300AD73
                        8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                        D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                        FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                        1111111111111111111111111101020202020202020202020211111111011313
                        1313131313131313021111111101131313131313131313130211111111011313
                        1313131313131313021111111101131313131313131313130211111111011313
                        1313131313131313021111111101131313131313131313130211111111011313
                        13131313131313130211111112121210101010101010101002111111120D120C
                        0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                        120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                        0808080806000211111111111212120707070707050011111111}
                    end
                  end
                  object Panel6: TPanel
                    Left = 0
                    Top = 234
                    Width = 777
                    Height = 183
                    Align = alTop
                    TabOrder = 3
                    object DBGrid4: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 775
                      Height = 181
                      Align = alClient
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnKeyDown = DBGrid4KeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'COD_DESPESA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCRICAO_DESP'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NOME_CLIENTE'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'RAZAO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NOME_CTRL'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'N_CH'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESPESAS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_DESPESA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_DESPESA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'STATUS_DESPESA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_VENCIMENTO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_PAGAMENTO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CODIGO_CTRL'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_FUNC'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_CLIENTE'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_TP_DESPESA'
                          Visible = True
                        end>
                    end
                  end
                  object Panel9: TPanel
                    Left = 0
                    Top = 417
                    Width = 777
                    Height = 10
                    Align = alClient
                    TabOrder = 4
                    object Label57: TLabel
                      Left = 52
                      Top = 8
                      Width = 48
                      Height = 13
                      Caption = 'Usu'#225'rio:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBLookupComboBox12: TDBLookupComboBox
                      Left = 106
                      Top = 4
                      Width = 294
                      Height = 21
                      DataField = 'COD_FUNC'
                      DataSource = DtmVeiculosCCIA.dsDespesas
                      Enabled = False
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = DtmVeiculosCCIA.dsColaboradorEstMotos
                      TabOrder = 0
                    end
                  end
                end
              end
              object TabSheet_Notas: TTabSheet
                Caption = 'Notas'
                ImageIndex = 5
                object ScrollBox9: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 431
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox7: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 777
                    Height = 427
                    Align = alClient
                    Caption = 'Notas Fiscais'
                    TabOrder = 0
                    object BitBtn29: TBitBtn
                      Left = 592
                      Top = 413
                      Width = 86
                      Height = 25
                      Caption = '&Visualizar'
                      TabOrder = 0
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        16030000424D1603000000000000160200002800000010000000100000000100
                        08000000000000010000120B0000120B0000780000007800000000000000FFFF
                        FF00807AA100FF00FF00B6919300A4908C00F4F0EF00E7CABC00D4805100D991
                        6800E0A58400D9834F00E1966600DA926800DA976D00DEAB8B00C5B4AA00E39F
                        7300E6A47800EAAC8100E9BC9F00EFD0BC00F7E0D000F0995B00E69D6900F2C0
                        9800F3CCAD00EFC9AB00FEE5D000FFF3E900FFFAF600FBF6F200FCC08B00E9D4
                        C200FAE5D300FFD1A300F8D5B400FEF4EA00E1D8CF00DAD5D000FEFCFA00AB75
                        3D00FCE2C500FCE6CF00FFEAD400FAD3A300FFFAF400FFD7A500FEE6C700CAB7
                        9E00F3EDE500FEFBF700FEF3E300D3CBC000B5B0A900FFFAF300FFDDA700FFDD
                        A100FFEAC600FFF6E600D5CEC000EAE9E700FFFAEB00FFFEFB00B4B4B100FEFE
                        FC00EDEDEB00FFFFFE00BABBB800C2C4C1006EB4590062D18800186F7500CEE2
                        F8001A6AC7009DCAFF00A7CFFF00ADD3FF00C0D5EE00D8EAFF003289FF002A68
                        B8004D99FF00569EFF00589FFF005BA0FE005C96E5005F98E30080B7FF00A1C7
                        F700A6C5EF001673FF001676FF00287FFF00398AFF005D8CD1001873FF001974
                        FF001B75FF001C76FF002378FA002D75E9002A69D100317BEB0099B6E3000F59
                        E100135DE0001864E3001E60D8003767BF005F8BD7009EA7B7001A57CA002358
                        C2001344B400D5D7DC00093BC200415B9F001F42EF00E0E0E000030303030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        69706D7572030303030303030303675F6F100F1705710303030303035C572D2F
                        3823120B20216E6C0303030351313A302A1B0D18242C3E5A6503036329392534
                        221408132B1D1E01686A034A463B2E37160A0C1A362741430466034847013F33
                        1509111C32444506026403744E010128070E19261F013D5964036B76014F4C58
                        50567335407701535B03625E525403030303614B423C495D0303030303030303
                        03030303614D5560030303030303030303030303030361030303030303030303
                        0303030303030303030303030303030303030303030303030303}
                    end
                    object GroupBox8: TGroupBox
                      Left = 18
                      Top = 18
                      Width = 743
                      Height = 195
                      Caption = 'Entrada'
                      TabOrder = 1
                      object DBGrid5: TDBGrid
                        Left = 2
                        Top = 15
                        Width = 739
                        Height = 178
                        Align = alClient
                        DataSource = DtmVeiculosCCIA.dsVisNotasE
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                      end
                    end
                    object GroupBox9: TGroupBox
                      Left = 18
                      Top = 216
                      Width = 743
                      Height = 195
                      Caption = 'Sa'#237'da'
                      TabOrder = 2
                      object DBGrid6: TDBGrid
                        Left = 2
                        Top = 15
                        Width = 739
                        Height = 178
                        Align = alClient
                        DataSource = DtmVeiculosCCIA.dsVisNotasV
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                      end
                    end
                    object BitBtn20: TBitBtn
                      Left = 680
                      Top = 413
                      Width = 81
                      Height = 25
                      Caption = 'I&mprimir'
                      TabOrder = 3
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        82020000424D8202000000000000820100002800000010000000100000000100
                        08000000000000010000120B0000120B0000530000005300000000000000FFFF
                        FF002E2D2F005D5C5E00FF00FF0047454700565456008E8C8E00484748005B5A
                        5B00CCCBCC0073707200BBB8BA00B5B2B400AAA7A900C0BDBF00908E8F008280
                        8100E7E5E600DAD8D900ABA9AA00817E7F00CECBCC00C4C1C200AAA6A700B5B1
                        B200E0DCDD007D787900E5E0E100D3CFCF00DDDADA00DAD7D700CECCCC00C9C7
                        C700C6C4C400B8B6B600EFEEEE00CCCBCB00CAC9C900C6C5C500BBBABA00B8B7
                        B700AD807D00BB878100D3AAA500EAA79900FFB69F00FFB8A300FCC2B100F0CB
                        C000FFC5B100FEC4B000FFC7B200FFCFBF00FFD1C100FFD4C200FFE0D300FEE6
                        DC00FFE1D300FFE2D500FFF6F200D9D0CB00D1D0CF00EAE9E7008F959100C4C7
                        C5008EAB9E007FA092008BAD9F009DB2A900A7B8B1001F1F21002F2F31003939
                        3B003C3C3D0035353600F0F0F000E3E3E300D9D9D900D3D3D300CACACA00B8B8
                        B800606060000404040404040404040404040404040404494949494904040404
                        0404040404040449040404044752045252520404040404044B060B11470E0552
                        173E22520404040452142315221903480208070D520404520C52202452212619
                        10094A520404521852273F52250F161A1C1D295204045252504D521E211B4052
                        42464F520404520A4E52204C5128414544435204040452525204523C3D1F1213
                        525204040404040404042A313732302B040404040404040404042A3B35332E2A
                        040404040404040404042C3A35332F2A0404040404040404042A393836342D04
                        0404040404040404042A2A2A2A2A2A0404040404040404040404040404040404
                        040404040404}
                    end
                  end
                end
              end
              object TabSheet_Contratos: TTabSheet
                Caption = 'Contratos'
                ImageIndex = 7
                object ScrollBox6: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 431
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox5: TGroupBox
                    Left = 17
                    Top = 3
                    Width = 752
                    Height = 430
                    Caption = 'Contratos'
                    TabOrder = 0
                    object DBGrid8: TDBGrid
                      Left = 15
                      Top = 24
                      Width = 722
                      Height = 353
                      DataSource = DtmVeiculosCCIA.dsVisContratos
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                    end
                    object BitBtn13: TBitBtn
                      Left = 572
                      Top = 391
                      Width = 86
                      Height = 25
                      Caption = 'V&isualizar'
                      TabOrder = 1
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        16030000424D1603000000000000160200002800000010000000100000000100
                        08000000000000010000120B0000120B0000780000007800000000000000FFFF
                        FF00807AA100FF00FF00B6919300A4908C00F4F0EF00E7CABC00D4805100D991
                        6800E0A58400D9834F00E1966600DA926800DA976D00DEAB8B00C5B4AA00E39F
                        7300E6A47800EAAC8100E9BC9F00EFD0BC00F7E0D000F0995B00E69D6900F2C0
                        9800F3CCAD00EFC9AB00FEE5D000FFF3E900FFFAF600FBF6F200FCC08B00E9D4
                        C200FAE5D300FFD1A300F8D5B400FEF4EA00E1D8CF00DAD5D000FEFCFA00AB75
                        3D00FCE2C500FCE6CF00FFEAD400FAD3A300FFFAF400FFD7A500FEE6C700CAB7
                        9E00F3EDE500FEFBF700FEF3E300D3CBC000B5B0A900FFFAF300FFDDA700FFDD
                        A100FFEAC600FFF6E600D5CEC000EAE9E700FFFAEB00FFFEFB00B4B4B100FEFE
                        FC00EDEDEB00FFFFFE00BABBB800C2C4C1006EB4590062D18800186F7500CEE2
                        F8001A6AC7009DCAFF00A7CFFF00ADD3FF00C0D5EE00D8EAFF003289FF002A68
                        B8004D99FF00569EFF00589FFF005BA0FE005C96E5005F98E30080B7FF00A1C7
                        F700A6C5EF001673FF001676FF00287FFF00398AFF005D8CD1001873FF001974
                        FF001B75FF001C76FF002378FA002D75E9002A69D100317BEB0099B6E3000F59
                        E100135DE0001864E3001E60D8003767BF005F8BD7009EA7B7001A57CA002358
                        C2001344B400D5D7DC00093BC200415B9F001F42EF00E0E0E000030303030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        69706D7572030303030303030303675F6F100F1705710303030303035C572D2F
                        3823120B20216E6C0303030351313A302A1B0D18242C3E5A6503036329392534
                        221408132B1D1E01686A034A463B2E37160A0C1A362741430466034847013F33
                        1509111C32444506026403744E010128070E19261F013D5964036B76014F4C58
                        50567335407701535B03625E525403030303614B423C495D0303030303030303
                        03030303614D5560030303030303030303030303030361030303030303030303
                        0303030303030303030303030303030303030303030303030303}
                    end
                    object BitBtn16: TBitBtn
                      Left = 662
                      Top = 391
                      Width = 81
                      Height = 25
                      Caption = 'I&mprimir'
                      TabOrder = 2
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        82020000424D8202000000000000820100002800000010000000100000000100
                        08000000000000010000120B0000120B0000530000005300000000000000FFFF
                        FF002E2D2F005D5C5E00FF00FF0047454700565456008E8C8E00484748005B5A
                        5B00CCCBCC0073707200BBB8BA00B5B2B400AAA7A900C0BDBF00908E8F008280
                        8100E7E5E600DAD8D900ABA9AA00817E7F00CECBCC00C4C1C200AAA6A700B5B1
                        B200E0DCDD007D787900E5E0E100D3CFCF00DDDADA00DAD7D700CECCCC00C9C7
                        C700C6C4C400B8B6B600EFEEEE00CCCBCB00CAC9C900C6C5C500BBBABA00B8B7
                        B700AD807D00BB878100D3AAA500EAA79900FFB69F00FFB8A300FCC2B100F0CB
                        C000FFC5B100FEC4B000FFC7B200FFCFBF00FFD1C100FFD4C200FFE0D300FEE6
                        DC00FFE1D300FFE2D500FFF6F200D9D0CB00D1D0CF00EAE9E7008F959100C4C7
                        C5008EAB9E007FA092008BAD9F009DB2A900A7B8B1001F1F21002F2F31003939
                        3B003C3C3D0035353600F0F0F000E3E3E300D9D9D900D3D3D300CACACA00B8B8
                        B800606060000404040404040404040404040404040404494949494904040404
                        0404040404040449040404044752045252520404040404044B060B11470E0552
                        173E22520404040452142315221903480208070D520404520C52202452212619
                        10094A520404521852273F52250F161A1C1D295204045252504D521E211B4052
                        42464F520404520A4E52204C5128414544435204040452525204523C3D1F1213
                        525204040404040404042A313732302B040404040404040404042A3B35332E2A
                        040404040404040404042C3A35332F2A0404040404040404042A393836342D04
                        0404040404040404042A2A2A2A2A2A0404040404040404040404040404040404
                        040404040404}
                    end
                  end
                end
              end
              object TabSheet_Oficina: TTabSheet
                Caption = 'Oficina'
                ImageIndex = 6
                object ScrollBox10: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 431
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox6: TGroupBox
                    Left = 17
                    Top = 3
                    Width = 752
                    Height = 430
                    Caption = 'Oficina'
                    TabOrder = 0
                    object DBGrid2: TDBGrid
                      Left = 15
                      Top = 24
                      Width = 722
                      Height = 353
                      DataSource = DtmVeiculosCCIA.dsVisOficina
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                    end
                    object BitBtn9: TBitBtn
                      Left = 572
                      Top = 391
                      Width = 86
                      Height = 25
                      Caption = 'V&isualizar'
                      TabOrder = 1
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        16030000424D1603000000000000160200002800000010000000100000000100
                        08000000000000010000120B0000120B0000780000007800000000000000FFFF
                        FF00807AA100FF00FF00B6919300A4908C00F4F0EF00E7CABC00D4805100D991
                        6800E0A58400D9834F00E1966600DA926800DA976D00DEAB8B00C5B4AA00E39F
                        7300E6A47800EAAC8100E9BC9F00EFD0BC00F7E0D000F0995B00E69D6900F2C0
                        9800F3CCAD00EFC9AB00FEE5D000FFF3E900FFFAF600FBF6F200FCC08B00E9D4
                        C200FAE5D300FFD1A300F8D5B400FEF4EA00E1D8CF00DAD5D000FEFCFA00AB75
                        3D00FCE2C500FCE6CF00FFEAD400FAD3A300FFFAF400FFD7A500FEE6C700CAB7
                        9E00F3EDE500FEFBF700FEF3E300D3CBC000B5B0A900FFFAF300FFDDA700FFDD
                        A100FFEAC600FFF6E600D5CEC000EAE9E700FFFAEB00FFFEFB00B4B4B100FEFE
                        FC00EDEDEB00FFFFFE00BABBB800C2C4C1006EB4590062D18800186F7500CEE2
                        F8001A6AC7009DCAFF00A7CFFF00ADD3FF00C0D5EE00D8EAFF003289FF002A68
                        B8004D99FF00569EFF00589FFF005BA0FE005C96E5005F98E30080B7FF00A1C7
                        F700A6C5EF001673FF001676FF00287FFF00398AFF005D8CD1001873FF001974
                        FF001B75FF001C76FF002378FA002D75E9002A69D100317BEB0099B6E3000F59
                        E100135DE0001864E3001E60D8003767BF005F8BD7009EA7B7001A57CA002358
                        C2001344B400D5D7DC00093BC200415B9F001F42EF00E0E0E000030303030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        69706D7572030303030303030303675F6F100F1705710303030303035C572D2F
                        3823120B20216E6C0303030351313A302A1B0D18242C3E5A6503036329392534
                        221408132B1D1E01686A034A463B2E37160A0C1A362741430466034847013F33
                        1509111C32444506026403744E010128070E19261F013D5964036B76014F4C58
                        50567335407701535B03625E525403030303614B423C495D0303030303030303
                        03030303614D5560030303030303030303030303030361030303030303030303
                        0303030303030303030303030303030303030303030303030303}
                    end
                    object BitBtn10: TBitBtn
                      Left = 662
                      Top = 391
                      Width = 81
                      Height = 25
                      Caption = 'I&mprimir'
                      TabOrder = 2
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        82020000424D8202000000000000820100002800000010000000100000000100
                        08000000000000010000120B0000120B0000530000005300000000000000FFFF
                        FF002E2D2F005D5C5E00FF00FF0047454700565456008E8C8E00484748005B5A
                        5B00CCCBCC0073707200BBB8BA00B5B2B400AAA7A900C0BDBF00908E8F008280
                        8100E7E5E600DAD8D900ABA9AA00817E7F00CECBCC00C4C1C200AAA6A700B5B1
                        B200E0DCDD007D787900E5E0E100D3CFCF00DDDADA00DAD7D700CECCCC00C9C7
                        C700C6C4C400B8B6B600EFEEEE00CCCBCB00CAC9C900C6C5C500BBBABA00B8B7
                        B700AD807D00BB878100D3AAA500EAA79900FFB69F00FFB8A300FCC2B100F0CB
                        C000FFC5B100FEC4B000FFC7B200FFCFBF00FFD1C100FFD4C200FFE0D300FEE6
                        DC00FFE1D300FFE2D500FFF6F200D9D0CB00D1D0CF00EAE9E7008F959100C4C7
                        C5008EAB9E007FA092008BAD9F009DB2A900A7B8B1001F1F21002F2F31003939
                        3B003C3C3D0035353600F0F0F000E3E3E300D9D9D900D3D3D300CACACA00B8B8
                        B800606060000404040404040404040404040404040404494949494904040404
                        0404040404040449040404044752045252520404040404044B060B11470E0552
                        173E22520404040452142315221903480208070D520404520C52202452212619
                        10094A520404521852273F52250F161A1C1D295204045252504D521E211B4052
                        42464F520404520A4E52204C5128414544435204040452525204523C3D1F1213
                        525204040404040404042A313732302B040404040404040404042A3B35332E2A
                        040404040404040404042C3A35332F2A0404040404040404042A393836342D04
                        0404040404040404042A2A2A2A2A2A0404040404040404040404040404040404
                        040404040404}
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 462
              ExplicitTop = 462
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro -  [VEI067]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 789
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Height = 201
            ExplicitHeight = 201
            inherited imgInformation: TImage
              Height = 184
              ExplicitHeight = 192
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [VEI064]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [VEI065]'
            end
            object groupAvancadas: TGroupBox
              Left = 2
              Top = 73
              Width = 466
              Height = 124
              Caption = 'Op'#231#245'es Avan'#231'adas'
              TabOrder = 11
              Visible = False
              object GroupBox28: TGroupBox
                Left = 4
                Top = 15
                Width = 162
                Height = 109
                Caption = 'Posi'#231#227'o'
                TabOrder = 0
                object ckTransfDep: TCheckBox
                  Left = 8
                  Top = 17
                  Width = 131
                  Height = 17
                  Caption = 'Transfer'#234'ncia Dep'#244'sito'
                  TabOrder = 0
                end
                object ckDemons: TCheckBox
                  Left = 8
                  Top = 35
                  Width = 103
                  Height = 17
                  Caption = 'Demonstra'#231#227'o'
                  TabOrder = 1
                end
                object ckTransito: TCheckBox
                  Left = 8
                  Top = 88
                  Width = 65
                  Height = 17
                  Caption = 'Transito'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object ckReserva: TCheckBox
                  Left = 8
                  Top = 53
                  Width = 65
                  Height = 17
                  Caption = 'Reserva'
                  TabOrder = 3
                end
                object ckUsadoTroca: TCheckBox
                  Left = 8
                  Top = 70
                  Width = 103
                  Height = 17
                  Caption = 'Usado na Troca'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                end
              end
              object GroupBox21: TGroupBox
                Left = 166
                Top = 15
                Width = 298
                Height = 109
                Caption = 'Situa'#231#227'o'
                TabOrder = 1
                object ckNovo: TCheckBox
                  Left = 9
                  Top = 35
                  Width = 71
                  Height = 17
                  Caption = 'Novo'
                  TabOrder = 0
                end
                object ckComEstoque: TCheckBox
                  Left = 9
                  Top = 53
                  Width = 84
                  Height = 17
                  Caption = 'Com Estoque'
                  TabOrder = 1
                end
                object ckSemEstoque: TCheckBox
                  Left = 115
                  Top = 53
                  Width = 82
                  Height = 17
                  Caption = 'Sem Estoque'
                  TabOrder = 2
                end
                object ckUsado: TCheckBox
                  Left = 115
                  Top = 35
                  Width = 67
                  Height = 17
                  Caption = 'Usado'
                  TabOrder = 3
                end
                object ckEstReal: TCheckBox
                  Left = 9
                  Top = 71
                  Width = 94
                  Height = 17
                  Caption = 'Estoque Real'
                  TabOrder = 4
                end
                object ckCons: TCheckBox
                  Left = 115
                  Top = 71
                  Width = 79
                  Height = 17
                  Caption = 'Consignado'
                  TabOrder = 5
                end
                object ckInter: TCheckBox
                  Left = 203
                  Top = 71
                  Width = 86
                  Height = 17
                  Caption = 'Intermedia'#231#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                end
              end
            end
            object groupAdicional: TGroupBox
              Left = 471
              Top = 73
              Width = 277
              Height = 127
              Caption = 'Pesquisa Adicional'
              TabOrder = 12
              Visible = False
              OnExit = groupAdicionalExit
              object Label13: TLabel
                Left = 7
                Top = 54
                Width = 51
                Height = 13
                Caption = 'Conte'#250'do:'
              end
              object Label14: TLabel
                Left = 21
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label19: TLabel
                Left = 157
                Top = 54
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label21: TLabel
                Left = 10
                Top = 78
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 64
                Top = 19
                Width = 203
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 64
                Top = 46
                Width = 203
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object MaskEdit8: TMaskEdit
                Left = 193
                Top = 46
                Width = 74
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 64
                Top = 46
                Width = 72
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 64
                Top = 72
                Width = 72
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
          end
          inherited Panel1: TPanel
            Top = 201
            Height = 309
            ExplicitTop = 201
            ExplicitHeight = 309
            inherited Splitter1: TSplitter
              Height = 237
              ExplicitHeight = 229
            end
            inherited DBGrid1: TDBGrid
              Height = 237
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [VEI066]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [VEI085]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Visible = False
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Venda'
                Glyph.Data = {
                  4E030000424D4E030000000000000E0100002800000018000000180000000100
                  08000000000040020000120B0000120B0000360000003600000000000000FFFF
                  FF00FF00FF008E2425006826270064262700A6424300C14D4E005F262700732F
                  3000C1515200AF4A4B00AC494A0060292A005B272800D35C5D007A353600BB52
                  5300B24E4F006D303100A04748007E383900652D2E00AB4D4E0073343500DD65
                  66009E484900803A3B00E1686900A34C4D00E76D6E0093454600A64F5000F276
                  7700803E3F00F3777800BC5C5D00DD6E6F00FF818200FC7F8000FE818200A057
                  58009C58590060363700FE929300690F0F00681A1A0060393900CB7A7A00C678
                  780064424200F8A4A4006F6D6B00434241000202353502020202020202020202
                  0202020202020202020202023535020202020202020202020202020202020202
                  0202020235350202020202020202020202020202020202020202020235350202
                  0202020202020202020202020202020202020202353502020202020202020202
                  0202020202020202020202023535020202020202020202020202020202020202
                  0202020235350202020202020202020202020202020202020202020235350202
                  0202020202020202020202020202020202020202353502020202020202020202
                  0202020202020202020202023535020202020202020202020202020202020202
                  020202023535020202020202020202160E0E0E0E0E0E0E020202020235352F0E
                  0202020202020531332C28211E19110E0E02020235352B252420151009042E30
                  332C28211E190F0B0E02020235352B262627231C07032D30332C28211E190F0B
                  0E02020235352B262627231C07032D30332C28211E190F0B0E02020235352B26
                  2627231C07032D30332C28211E190F0B0E02020235352B262627231C07032D30
                  332C28211E190F0B0E02020235352B262627231C07032D30332C28211E190F0B
                  0E02020235352B262627231C07032D30332C28211E190F0C0E02020235352B26
                  2627231C07032D30332C28211E190F0C0E02020235352B262627231C07032D30
                  332C28211E190F0A0E02020235352B262627231C07032D292A221F1D1A14120A
                  0E0202023535320E131B1D1706032D180E02020202020E0E0E02020235353402
                  020202020E0E080D02020202020202020202}
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Dados Reais'
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  30ADD930ADD930ADD930ADD9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF30ADD9BCF4FA95F7FC86EFF949C2E449
                  C2E449C2E430ADD930ADD921A9D9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  30ADD99CE1F1A8FFFF95FCFF98FCFF99FBFF95F7FF8AEFFD7DE6F749C2E449C2
                  E4FF00FFFF00FFFF00FF30ADD930ADD930ADD97FD2EAACFCFE90F8FF91F7FF8F
                  F4FF8EF4FF90F5FF91F5FF96F7FF6ED3ED30ADD9FF00FFFF00FF30ADD98EE6F5
                  30ADD930ADD99DECF794FCFF91F7FF90F5FF8DF3FF8DF3FF8AF1FE8BF0FF70D5
                  EE30ADD9FF00FFFF00FF30ADD978DAEF30ADD972E1F330ADD9A8FEFE8FF9FF92
                  F6FF8DF4FF8CF3FF8CF1FE8CF1FF70D5EE82E9FC30ADD9FF00FF30ADD978D9EE
                  30ADD996FAFD30ADD990D9EE97E5F397E7F5A6F2FB98F8FF87F2FF89F1FF6CD2
                  EC8CF1FF5BD1EAFF00FF30ADD972DAEF30ADD9A3FFFF81ECF730ADD930ADD930
                  ADD976CEE994E5F5A4F7FE96F7FF79DDF592F3FF90F3FA33B5DD30ADD973E0F2
                  30ADD99DFFFF99FFFF9AFEFF96FBFF94F9FE30ADD930ADD988D9EEA7E7F49DE2
                  F6A7E8F7B7F4FB52C0E230ADD996F9FD30ADD9A1FFFF92FBFF92F8FF93F7FF98
                  FAFF9AFDFF90F7FE30ADD930ADD930ADD933ABD73FB1D930ADD830ADD9A3FFFF
                  30ADD99CF4FAA7FFFFA1FFFF99FDFF7BDFF230ADD930ADD930ADD930ADD930AD
                  D933B5DDFF00FFFF00FF30ADD99DFFFF8BF4FA30ADD930ADD930ADD930ADD930
                  ADD963C6E477D0E974CEEB7ED4ED86DBEF52C0E2FF00FFFF00FF30ADD9A1FFFF
                  92FBFF92F8FF93F7FF98FAFF9AFDFF90F7FE70DEF365CFE95FCBE833ABD73FB1
                  D930ADD8FF00FFFF00FF30ADD99CF4FAA7FFFFA1FFFF99FDFF7BDFF230ADD930
                  ADD930ADD930ADD930ADD9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF30ADD9
                  30ADD930ADD930ADD930ADD9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              inherited SpeedButton8: TSpeedButton
                Left = 349
                Hint = 'Reserva - [VEI068]'
                Glyph.Data = {
                  C6050000424DC605000000000000860300002800000018000000180000000100
                  08000000000040020000120B0000120B0000D4000000D400000000000000FFFF
                  FF000B0A8F001312950012118A001E1B90004B4997003631890057528E006A66
                  96006F6B9800706D8F00514A8800514987005D54870060578300685E88005D54
                  79008C88990075727D0086828B00635A6E00FF00FF007A6F7A0074696C003534
                  340087838200675E5B002D2C2B0057514900534E420047433800444138005E5C
                  560049463B0078756A003D3B33004240360047453C0035342E00403F38004645
                  3C00363633002D2D2C002324240022232300262727002425250087AAFE0097B5
                  FE007B9DFE0083A4FE008BABFE004974FE004A75FE004C78FE00507AFE005781
                  FE005782FE005882FE005A82FE005F87FE006E93FE002856FF002F5CFF003763
                  FE005F84FE001D48FF00204BFF002853FF002A55FE002D57FF002D57FE002D59
                  FE00345AFE00385FFE003D64FE004068FE004268FF000A34FF000C36FF000D37
                  FF000D39FF000F38FF00113AFF00123CFF00123DFF00133EFF001641FF001741
                  FF001842FF001B43FE000328FF000329FF00052CFF00052DFF00062EFF00062C
                  FE00072EFF00072FFF000930FF000A31FF00001EFF00001FFF000020FF000022
                  FF000023FF000122FF000123FF000124FF000223FC000322FF000728FF00092A
                  FF000019FF00001BFF00001CFF000018FE00001BFE000018FC00001AFC00001C
                  FA00011CFB00011BFA00011CFA000421FE000017FB000017F8000016F7000016
                  F6000016F4000015F3000016F3000015F0000016F0000014EF000013EE000013
                  EB000012EA000013EA000012E9000011E6000011E5000011E3000010E2000011
                  E200000FDC00000EDA00000FDA00000DD500000DD300000CCF00000CCE00000A
                  C700000AC6000009C9000009C5000009C4000009C2000009C1000008C0000009
                  C0000008BD000008BC000007BB000007B8000006B6000005B5000005B4000005
                  B2000005B0000005AF000004AF000004AD000003A9000003A6000003A5000003
                  A4000002A3000001A0000002A00000029F0000009E0000019D0000029C000001
                  9A0000009600000196000000950000019500000092000000910000008F000000
                  8E0000008C0000008B0000008A00000089000000880001018C0003038F000505
                  8C000707900026289C0028289200373737002727270026262600252525002424
                  2400232323002222220016161616161616161616161616161616161616161616
                  161616161616161616CECECECECECECECECECECE1616161616161616161616CE
                  CECECECECECECECECECECECECECE1616161616161616CECECECECECECECE2ECE
                  CECECECECECECE16161616161616CECFD1D2D2D3D32DD1D22DD2D22CD0CFCE16
                  161616161616D2D12B2A282926221E1F202524271C2FD216161616161616CD21
                  23130B0A09080C0D0E0F11151B1D19161616161616161A1206CC03CAC8C2C2C2
                  C7C902050710181616161616161614CBC4C5C5C4C4C3C3C3C3C3C3C3C2041716
                  16161616161616A5B4B8BBC0C5C6C6C5C5C3C1C0C0BD1616161616161616169B
                  9E9A999DA0A3A6AAAFB7BCBEBFB616161616161616161695928F8B898C909397
                  A1A9B2BABFB51616161616161616168E837E727275808791969DA8B3BEB41616
                  1616161616161685676C6C69686673818D969FACB9B11616161616161616167C
                  6554534F625C69747F8F97A4B0AE1616161616161616166F53595A5857515E6B
                  7382929CABAD16161616161616161670474649484458505D67778D98A6A91616
                  16161616161616713C3E3537414355606A768896A4A716161616161616161616
                  42313B3A364557646D748595A216161616161616161616164B33303938405663
                  6C7487969E1616161616161616161616164D32343D3F525F6A788A9616161616
                  161616161616161616164A4C4E5B616E79849416161616161616161616161616
                  161616167D7B7A868F1616161616161616161616161616161616161616161616
                  16161616161616161616}
                OnClick = SpeedButton8Click
                ExplicitLeft = 349
              end
              inherited SpeedButton11: TSpeedButton
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 179
                Top = 5
                Visible = False
                ExplicitLeft = 179
                ExplicitTop = 5
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 237
              ExplicitHeight = 237
              inherited ScrollBox2: TScrollBox
                Height = 220
                ExplicitHeight = 220
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitTop = 27
          ExplicitHeight = 510
        end
        object tsReserva: TTabSheet
          Caption = 'tsReserva'
          ImageIndex = 3
          object pnReserva: TPanel
            Left = 0
            Top = 0
            Width = 660
            Height = 257
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Label15: TLabel
              Left = 500
              Top = 13
              Width = 81
              Height = 13
              Caption = 'Dados do Ve'#237'culo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 44
              Top = 35
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 8
              Top = 62
              Width = 80
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nome Cliente:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 29
              Top = 112
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vendedor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 33
              Top = 136
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Situa'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 15
              Top = 163
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'Observa'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 12
              Top = 86
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fone Cliente:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 275
              Top = 87
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Data:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Memo1: TMemo
              Left = 438
              Top = 32
              Width = 210
              Height = 101
              Enabled = False
              Lines.Strings = (
                '')
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 94
              Top = 32
              Width = 39
              Height = 21
              Hint = 'Cliente'
              CharCase = ecUpperCase
              DataField = 'COD_CLIENTE'
              DataSource = DtmVeiculosCCIA.dsEstMotos
              TabOrder = 1
              OnExit = DBEdit3Exit
              OnKeyDown = DBEdit3KeyDown
            end
            object DBLookupComboBox4: TDBLookupComboBox
              Left = 137
              Top = 32
              Width = 295
              Height = 21
              Hint = 'Cliente'
              DataField = 'COD_CLIENTE'
              DataSource = DtmVeiculosCCIA.dsEstMotos
              KeyField = 'COD_CLIENTE'
              ListField = 'NOME_CLIENTE'
              ListSource = DtmVeiculosCCIA.dsClientesEstMotos
              TabOrder = 2
            end
            object DBEdit6: TDBEdit
              Left = 94
              Top = 59
              Width = 338
              Height = 21
              Hint = 'Nome do Cliente'
              CharCase = ecUpperCase
              DataField = 'NOME_RES'
              DataSource = DtmVeiculosCCIA.dsEstMotos
              TabOrder = 3
            end
            object DBLookupComboBox10: TDBLookupComboBox
              Left = 94
              Top = 109
              Width = 338
              Height = 21
              DataField = 'VENDEDOR_RES'
              DataSource = DtmVeiculosCCIA.dsEstMotos
              Enabled = False
              KeyField = 'COD_VENDEDOR'
              ListField = 'NOME_VENDEDOR'
              ListSource = DtmVeiculosCCIA.dsColaboradorEstMotos
              TabOrder = 6
            end
            object DBComboBox4: TDBComboBox
              Left = 94
              Top = 136
              Width = 338
              Height = 21
              CharCase = ecUpperCase
              DataField = 'SIT_RES'
              DataSource = DtmVeiculosCCIA.dsEstMotos
              ItemHeight = 13
              Items.Strings = (
                'V - VENDIDO'
                'N - N'#195'O VENDIDO')
              TabOrder = 7
            end
            object BitBtn17: TBitBtn
              Left = 246
              Top = 222
              Width = 75
              Height = 25
              Hint = 'Salvar Registro -  [VEI069]'
              Caption = '&OK'
              TabOrder = 9
              OnClick = BitBtn17Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000008C00000094
                0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
                210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
                420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
                94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
                04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
                0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
                170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
                13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
                1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
                1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
                1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
                1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
            end
            object BitBtn18: TBitBtn
              Left = 341
              Top = 222
              Width = 75
              Height = 25
              Hint = 'Cancelar Registro'
              Caption = '&Cancela'
              TabOrder = 10
              OnClick = BitBtn18Click
              Glyph.Data = {
                12020000424D1202000000000000120100002800000010000000100000000100
                08000000000000010000120B0000120B0000370000003700000000000000FFFF
                FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
                DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
                EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
                EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
                E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
                DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
                E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
                0202020202020202020202020202020202020202020202020236360202020202
                0236360202020202361A28360202020236302E36020202023621182A36020236
                332B34360202020202362419293636312C353602020202020202361E11272D2B
                3236020202020202020202361B26252F36020202020202020202023612172022
                36020202020202020202360F06131C0A2336020202020202023607080E363614
                0B1F3602020202023603041036020236160D1D36020202023605093602020202
                36150C3602020202023636020202020202363602020202020202020202020202
                02020202020202020202020202020202020202020202}
            end
            object DBMemo1: TDBMemo
              Left = 94
              Top = 163
              Width = 554
              Height = 53
              DataField = 'OBS_RES'
              DataSource = DtmVeiculosCCIA.dsEstMotos
              TabOrder = 8
            end
            object BitBtn19: TBitBtn
              Left = 8
              Top = 222
              Width = 107
              Height = 25
              Hint = 'Retirar Reserva - [VEI070]'
              Caption = '&Retirar Reserva'
              TabOrder = 11
              OnClick = BitBtn19Click
              Glyph.Data = {
                9E030000424D9E030000000000009E0200002800000010000000100000000100
                08000000000000010000120B0000120B00009A0000009A00000000000000FFFF
                FF00FF00FF000146030001450300014303000142030001340200013302000130
                020002510400024C0400029E0A00029D0A00014D0400014A04000141030003A0
                0B00039E0B00039D0A00039C0B00026A06000269060003960A00038C0A00037B
                080003780800025205000357060003A70C0003A60C0003A50C0003A10C0003A0
                0C00039F0C00039E0C00039D0C00027E090004A30D00049F0D00036B0A000365
                090005A00F00059F0E0006A00F0008A0120006780E00044F090006680D0010A6
                1B0013A91E0034B73E0095DC9A0006A71600034F09000AA3180006620F000874
                12001BAF2A003FBC4900A6E2AB00AFE5B400EEFAEF0007A5180009AF1C00066B
                110013992300DAF3DD000AAB1F000A991F000BA42000BCEAC2000DAB280016AB
                2E0021A3360070D080000FB02D000D822300138C2A001DA4350026B441000EA9
                2D0010AC300011A3300038BB5200B1E6BC0011AB340012AA340017AF39002DB8
                4E0038B454004BBF670017B641001B9D3D002BA649004CBD690056C57300C4ED
                CE00D0F0D800DDF4E3001FB2480023BC4F0042B8630046BC660081D8990017A3
                41006ACC880016AF480018B54A0019B14C001BB14C001CB24E001EB7510020B5
                4F0020B5520021B151002FBC5D00E9F8EE0020B4520021B5530022B6550022B5
                54002ABA5C002BB85C002CBA5D002EBB5E0030BB600038BD67003EBD690050C7
                7A0054C57A0098E0B10036BD670044C6740049C7790057CA810066CF8C0068D0
                8E0089DAA70097E0B200D1F2DD0078D99F0083DDA70092DEB00098E1B5009AE1
                B600C2EDD30090E0B100AAE7C500C5F0D800E5F7ED00A7E7C400BDEED400D0F4
                E300020202020209100A0A0508020202020202020204041A14222224250E0E02
                020202023629261E110C22211F1E16070202022F41443A2D0D13232323211D15
                0B02022F52484B37232323232323221D0B021C4D5C514732231212232323231F
                19061C696C563E3B27232A332B23232017063073707175625958493D342C2321
                220F39807A778B01968F6843013C3121221B2E82856F7D92010101010101553F
                24032E5F8E786F7C8A8C0101016354351803024A94896B6E797B870161504640
                2802024A609588766D72848364574C4528020202426A9991817F7C7E74655338
                02020202025B5B909897938D865D5D02020202020202024F5A67665E4E020202
                0202}
            end
            object DBEdit7: TDBEdit
              Left = 94
              Top = 84
              Width = 130
              Height = 21
              Hint = 'N'#250'mero de telefone do cliente'
              CharCase = ecUpperCase
              DataField = 'FONE_RES'
              DataSource = DtmVeiculosCCIA.dsEstMotos
              TabOrder = 4
            end
            object DBEdit9: TDBEdit
              Left = 312
              Top = 84
              Width = 120
              Height = 21
              Hint = 'N'#250'mero de telefone do cliente'
              CharCase = ecUpperCase
              DataField = 'DATA_RES'
              DataSource = DtmVeiculosCCIA.dsEstMotos
              Enabled = False
              TabOrder = 5
            end
          end
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 308
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 446
    Top = 65523
  end
  inherited Timer1: TTimer
    Left = 406
    Top = 65523
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 374
    Top = 65523
  end
end
