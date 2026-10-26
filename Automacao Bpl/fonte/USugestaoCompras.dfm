inherited FrmSugestaoCompra: TFrmSugestaoCompra
  Left = 165
  Caption = 'Sugest'#227'o de Compras'
  ClientHeight = 572
  ClientWidth = 884
  ExplicitWidth = 892
  ExplicitHeight = 606
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 884
    Height = 553
    ExplicitWidth = 884
    ExplicitHeight = 553
    inherited Splitter2: TSplitter
      Height = 551
      ExplicitLeft = 891
      ExplicitHeight = 581
    end
    inherited PanelLeft: TPanel
      Width = 879
      Height = 551
      ExplicitWidth = 879
      ExplicitHeight = 551
      inherited PageControl1: TPageControl
        Width = 877
        Height = 549
        ExplicitWidth = 877
        ExplicitHeight = 549
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 869
          ExplicitHeight = 518
          inherited ScrollBox1: TScrollBox
            Width = 869
            Height = 518
            ExplicitWidth = 869
            ExplicitHeight = 518
            inherited PageControl3: TPageControl
              Width = 869
              Height = 470
              ExplicitWidth = 869
              ExplicitHeight = 470
              inherited TabSheet3: TTabSheet
                Caption = 'Processar Sugestao'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 861
                ExplicitHeight = 439
                inherited ScrollBox3: TScrollBox
                  Width = 861
                  Height = 439
                  ExplicitWidth = 861
                  ExplicitHeight = 439
                  inherited GroupBox1: TGroupBox
                    Width = 857
                    Height = 69
                    Caption = ''
                    ExplicitWidth = 857
                    ExplicitHeight = 69
                    object Label8: TLabel
                      Left = 6
                      Top = 13
                      Width = 133
                      Height = 13
                      Caption = 'Estoque Seguran'#231'a(%):'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object CheckProdMov: TCheckBox
                      Left = 236
                      Top = 13
                      Width = 137
                      Height = 17
                      Hint = 'Apenas produtos movimentados'
                      Caption = 'Produtos Movimentados'
                      TabOrder = 1
                    end
                    object MaskEdit4: TMaskEdit
                      Left = 141
                      Top = 9
                      Width = 65
                      Height = 21
                      Hint = 'Estoque de segura'#231#227'o padr'#227'o'
                      TabOrder = 0
                      OnExit = MaskEdit14Exit
                    end
                    object CheckSugPorGrade: TCheckBox
                      Left = 401
                      Top = 13
                      Width = 177
                      Height = 17
                      Hint = 'Sugest'#227'o de compras feita utilizado a grade do produto'
                      Caption = 'Sugest'#227'o de Compra por grade'
                      TabOrder = 2
                      OnClick = CheckSugPorGradeClick
                    end
                    object RadioGroup1: TRadioGroup
                      AlignWithMargins = True
                      Left = 581
                      Top = 6
                      Width = 177
                      Height = 58
                      Hint = 'Somente produtos com grade ou todos'
                      Margins.Top = 0
                      BiDiMode = bdLeftToRight
                      Enabled = False
                      Items.Strings = (
                        'Somente produtos com grade'
                        'Todos os produtos')
                      ParentBiDiMode = False
                      TabOrder = 3
                    end
                    object CheckArrendVlSug: TCheckBox
                      Left = 236
                      Top = 31
                      Width = 137
                      Height = 17
                      Caption = 'Arredonda Vlr Sugest'#227'o'
                      Checked = True
                      State = cbChecked
                      TabOrder = 4
                    end
                    object CheckMostrarUltimaVnd: TCheckBox
                      Left = 401
                      Top = 31
                      Width = 177
                      Height = 17
                      Hint = 'Mostrar '#218'ltima Venda'
                      Caption = 'Mostrar '#218'ltima Venda'
                      TabOrder = 5
                      OnClick = CheckSugPorGradeClick
                    end
                    object CheckDescrRed: TCheckBox
                      Left = 236
                      Top = 48
                      Width = 159
                      Height = 17
                      Hint = 'Mostrar a descri'#231#227'o reduzida no relat'#243'rio da sugest'#227'o de Compra'
                      Caption = 'Descri'#231#227'o Reduzida'
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 6
                    end
                    object CheckExibirTransf: TCheckBox
                      Left = 401
                      Top = 48
                      Width = 177
                      Height = 17
                      Caption = 'Exibir Transfer'#234'ncias'
                      TabOrder = 7
                      OnClick = CheckSugPorGradeClick
                    end
                  end
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 69
                    Width = 857
                    Height = 100
                    Align = alTop
                    TabOrder = 1
                    object Label6: TLabel
                      Left = 34
                      Top = 12
                      Width = 77
                      Height = 13
                      Caption = 'Grupo Inicial:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label15: TLabel
                      Left = 427
                      Top = 12
                      Width = 70
                      Height = 13
                      Caption = 'Grupo Final:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label18: TLabel
                      Left = 8
                      Top = 36
                      Width = 103
                      Height = 13
                      Caption = 'Sub Grupo Inicial:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label24: TLabel
                      Left = 401
                      Top = 34
                      Width = 96
                      Height = 13
                      Caption = 'Sub Grupo Final:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label13: TLabel
                      Left = 34
                      Top = 56
                      Width = 77
                      Height = 13
                      Caption = 'Grade Inicial:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label21: TLabel
                      Left = 427
                      Top = 56
                      Width = 70
                      Height = 13
                      Caption = 'Grade Final:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 33
                      Top = 77
                      Width = 78
                      Height = 13
                      Caption = 'Marca Inicial:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label14: TLabel
                      Left = 426
                      Top = 77
                      Width = 71
                      Height = 13
                      Caption = 'Marca Final:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBLookupComboBoxGrupoProdSugIni: TDBLookupComboBox
                      Left = 174
                      Top = 8
                      Width = 215
                      Height = 21
                      Hint = 'Grupo inicial'
                      DropDownWidth = 550
                      KeyField = 'CODIGO_GRUP'
                      ListField = 'DESCRICAO;CODIGO_GRUP'
                      ListSource = dtmSugestaoCompras.dsLocGrupoIni
                      TabOrder = 1
                      OnExit = DBLookupComboBoxGrupoProdSugIniExit
                    end
                    object DBLookupComboBoxGrupoProdSugFim: TDBLookupComboBox
                      Left = 559
                      Top = 8
                      Width = 215
                      Height = 21
                      Hint = 'Grupo final'
                      DropDownWidth = 550
                      KeyField = 'CODIGO_GRUP'
                      ListField = 'DESCRICAO;CODIGO_GRUP'
                      ListSource = dtmSugestaoCompras.dsLocGrupoFim
                      TabOrder = 3
                      OnExit = DBLookupComboBoxGrupoProdSugFimExit
                    end
                    object DBLookupComboBoxSubGrupoProdSugIni: TDBLookupComboBox
                      Left = 174
                      Top = 30
                      Width = 215
                      Height = 21
                      Hint = 'Subgrupo inicial'
                      DropDownWidth = 300
                      KeyField = 'CODIGO_SUBGR'
                      ListField = 'DESCRICAO'
                      ListSource = dtmSugestaoCompras.dsLocSubGIni
                      TabOrder = 5
                      OnExit = DBLookupComboBoxSubGrupoProdSugIniExit
                    end
                    object DBLookupComboBoxSubGrupoProdSugFim: TDBLookupComboBox
                      Left = 559
                      Top = 30
                      Width = 215
                      Height = 21
                      Hint = 'Subgrupo final'
                      DropDownWidth = 300
                      KeyField = 'CODIGO_SUBGR'
                      ListField = 'DESCRICAO'
                      ListSource = dtmSugestaoCompras.dsLocSubGFim
                      TabOrder = 7
                      OnExit = DBLookupComboBoxSubGrupoProdSugFimExit
                    end
                    object DBLookupComboBoxGradeProdSugIni: TDBLookupComboBox
                      Left = 174
                      Top = 52
                      Width = 215
                      Height = 21
                      Hint = 'Grade inicial'
                      KeyField = 'COD_GRADE'
                      ListField = 'DESCRICAO;COD_GRADE;DESCRICAO1'
                      ListSource = dtmSugestaoCompras.dsLocGradeIni
                      TabOrder = 9
                      OnExit = DBLookupComboBoxGradeProdSugIniExit
                    end
                    object DBLookupComboBoxGradeProdSugFim: TDBLookupComboBox
                      Left = 559
                      Top = 52
                      Width = 215
                      Height = 21
                      Hint = 'Grade final'
                      KeyField = 'COD_GRADE'
                      ListField = 'DESCRICAO;COD_GRADE;DESCRICAO1'
                      ListSource = dtmSugestaoCompras.dsLocGradeFim
                      TabOrder = 11
                      OnExit = DBLookupComboBoxGradeProdSugFimExit
                    end
                    object DBLookupComboBoxMarcaProdSugIni: TDBLookupComboBox
                      Left = 174
                      Top = 74
                      Width = 215
                      Height = 21
                      Hint = 'Marca inicial'
                      KeyField = 'COD_MARCA'
                      ListField = 'DESCRICAO_MARCA'
                      ListSource = dtmSugestaoCompras.dsLocMarcas
                      TabOrder = 13
                      OnExit = DBLookupComboBoxMarcaProdSugIniExit
                    end
                    object EditGrupoProdSugIni: TEditMoeda
                      Left = 113
                      Top = 8
                      Width = 60
                      Height = 21
                      Hint = 'C'#243'digo do grupo inicial'
                      Alignment = taRightJustify
                      TabOrder = 0
                      FormatReal = fInteger
                      FormatSize = '10.2'
                      OnExit = EditGrupoProdSugIniExit
                    end
                    object EditGrupoProdSugFim: TEditMoeda
                      Left = 499
                      Top = 8
                      Width = 60
                      Height = 21
                      Hint = 'C'#243'digo do grupo final'
                      Alignment = taRightJustify
                      TabOrder = 2
                      FormatReal = fInteger
                      FormatSize = '10.2'
                      OnExit = EditGrupoProdSugFimExit
                    end
                    object EditSubGrupoProdSugIni: TEditMoeda
                      Left = 113
                      Top = 30
                      Width = 60
                      Height = 21
                      Hint = 'C'#243'digo do subgrupo inicial'
                      Alignment = taRightJustify
                      TabOrder = 4
                      FormatReal = fInteger
                      FormatSize = '10.2'
                      OnExit = EditSubGrupoProdSugIniExit
                    end
                    object EditSubGrupoProdSugFim: TEditMoeda
                      Left = 499
                      Top = 30
                      Width = 60
                      Height = 21
                      Hint = 'C'#243'digo do subgrupo final'
                      Alignment = taRightJustify
                      TabOrder = 6
                      FormatReal = fInteger
                      FormatSize = '10.2'
                      OnExit = EditSubGrupoProdSugFimExit
                    end
                    object EditGradeProdSugIni: TEditMoeda
                      Left = 113
                      Top = 52
                      Width = 60
                      Height = 21
                      Hint = 'C'#243'digo da grade inicial'
                      Alignment = taRightJustify
                      TabOrder = 8
                      FormatReal = fInteger
                      FormatSize = '10.2'
                      OnExit = EditGradeProdSugIniExit
                    end
                    object EditGradeProdSugFim: TEditMoeda
                      Left = 499
                      Top = 52
                      Width = 60
                      Height = 21
                      Hint = 'C'#243'digo da grade final'
                      Alignment = taRightJustify
                      TabOrder = 10
                      FormatReal = fInteger
                      FormatSize = '10.2'
                      OnExit = EditGradeProdSugFimExit
                    end
                    object EditMarcaProdSugIni: TEditMoeda
                      Left = 113
                      Top = 74
                      Width = 60
                      Height = 21
                      Hint = 'C'#243'digo da marca inicial'
                      Alignment = taRightJustify
                      TabOrder = 12
                      FormatReal = fInteger
                      FormatSize = '10.2'
                      OnExit = EditMarcaProdSugIniExit
                    end
                    object EditMarcaProdSugFim: TEditMoeda
                      Left = 499
                      Top = 74
                      Width = 60
                      Height = 21
                      Hint = 'C'#243'digo da marca final'
                      Alignment = taRightJustify
                      TabOrder = 14
                      FormatReal = fInteger
                      FormatSize = '10.2'
                      OnExit = EditMarcaProdSugFimExit
                    end
                    object DBLookupComboBoxMarcaProdSugFim: TDBLookupComboBox
                      Left = 560
                      Top = 74
                      Width = 215
                      Height = 21
                      Hint = 'Marca final'
                      KeyField = 'COD_MARCA'
                      ListField = 'DESCRICAO_MARCA'
                      ListSource = dtmSugestaoCompras.dsLocMarcas
                      TabOrder = 15
                      OnExit = DBLookupComboBoxMarcaProdSugFimExit
                    end
                    object CheckExcGrupo: TCheckBox
                      Left = 776
                      Top = 10
                      Width = 88
                      Height = 17
                      Hint = 'Marque aqui para colocar exce'#231#227'o aos grupos citados na sele'#231#227'o'
                      Caption = 'Exceto'
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 16
                    end
                    object CheckExcSubGrupo: TCheckBox
                      Left = 776
                      Top = 33
                      Width = 88
                      Height = 17
                      Hint = 'Marque aqui para colocar exce'#231#227'o aos Sub grupos Citados'
                      Caption = 'Exceto'
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 17
                    end
                    object CheckExcGrades: TCheckBox
                      Left = 777
                      Top = 54
                      Width = 88
                      Height = 17
                      Hint = 'Marque aqui para colocar exce'#231#227'o '#224's Grades Citadas'
                      Caption = 'Exceto'
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 18
                    end
                    object CheckexecMarcas: TCheckBox
                      Left = 777
                      Top = 76
                      Width = 88
                      Height = 17
                      Hint = 'Marque aqui para colocar exce'#231#227'o '#224's Marcas Citadas'
                      Caption = 'Exceto'
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 19
                    end
                  end
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 360
                    Width = 857
                    Height = 74
                    Align = alTop
                    TabOrder = 4
                    object Label25: TLabel
                      Left = 2
                      Top = 15
                      Width = 108
                      Height = 13
                      Align = alTop
                      Caption = 'Produto Analizado:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object ProgressBar1: TProgressBar
                      Left = 2
                      Top = 28
                      Width = 853
                      Height = 16
                      Align = alTop
                      TabOrder = 0
                    end
                    object BitBtn14: TBitBtn
                      Left = 8
                      Top = 46
                      Width = 110
                      Height = 25
                      Hint = 'Gerar a sugest'#227'o'
                      Caption = '&Gerar Sugest'#227'o'
                      TabOrder = 1
                      OnClick = BitBtn14Click
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B0000000100000001000000630000007B
                        0000089C210010A5290010B539007BD67B00FF00FF00FFFFFF00FFFFFF00FFFF
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
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00060606060606
                        0606060606060606060606060606060606060606060606060606060606060601
                        0000000001060606060606060606000003030202000006060606060606000003
                        0304040202000006060606060100030404040404020200010606060600030404
                        0403030404020200060606060005040403030303040402000606060600050404
                        0303030304040200060606060005050404030304040202000606060601000505
                        0404040402020001060606060600000505040402020000060606060606060000
                        0505020200000606060606060606060100000000010606060606060606060606
                        0606060606060606060606060606060606060606060606060606}
                    end
                    object BitBtn15: TBitBtn
                      Left = 124
                      Top = 46
                      Width = 110
                      Height = 25
                      Hint = 'Cancelar o processamento da sugest'#227'o'
                      Caption = '&Parar'
                      TabOrder = 2
                      OnClick = BitBtn15Click
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B0000000100000001000000109C000818
                        9C0008219C0010219C001029A5001831A5000010AD000018C6000821C6001029
                        C6001831C6000018CE000021CE000829CE001029CE001031CE000021D6001031
                        D6001831D6001839D6002139D6001031DE001831DE001839DE002139DE002142
                        DE002942DE00314ADE004252DE000029E7000831E7001031E7001039E7001839
                        E7002139E7002939E7001042E7001842E7002142E7002942E7003142E700294A
                        E700314AE7003152E7003952E7004252E700425AE7004A5AE7004A63E7005263
                        E700526BEF005A6BEF005273EF005A73EF006B7BEF006B84EF008C94EF00FF00
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
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00393939393939
                        3939393939393939393939393939393939393939393939393939393304000000
                        000000000002333939393909070809090D0E0E0C0B0603393939390B11122227
                        2625201E1D0B00393939391012272A29292524201E0C003939393911262C2B2A
                        292521201E0F0039393939222A2C2B2A2925201F1E0F00393939392A2E2D2B2A
                        27171515150F00393939392C302E2C281A171115150F00393939392D32301C2A
                        1A181316150F0039393939303735302D2B1B1A19140F01393939393538363431
                        302F2E2C290F053939393935352F2C2A2A272314130A33393939393939393939
                        3939393939393939393939393939393939393939393939393939}
                    end
                    object btDefinirEmp: TBitBtn
                      Left = 240
                      Top = 46
                      Width = 110
                      Height = 25
                      Hint = 'Definir Empresas'
                      Caption = '&Definir Empresas'
                      TabOrder = 3
                      OnClick = btDefinirEmpClick
                      Glyph.Data = {
                        CE010000424DCE01000000000000CE0000002800000010000000100000000100
                        08000000000000010000120B0000120B0000260000002600000000000000FFFF
                        FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                        5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                        8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                        1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                        430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                        0202020202020202020202020202020202020202020202021212020202020202
                        0202020202020212181B120202020202020202020202121F1C141D1202020202
                        02020202021223211E12171A1202020202020202122425201202121519120202
                        02020202021222120A03020212161202020202020203120C080B030202121312
                        02020202030F0E0803070903020202121202020310110D030203050803020202
                        12120202030E0302020202030603020202020202020302020202020203040302
                        0202020202020202020202020202030302020202020202020202020202020203
                        030202020202020202020202020202020202}
                    end
                  end
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 169
                    Width = 857
                    Height = 129
                    Align = alTop
                    TabOrder = 2
                    object Label26: TLabel
                      Left = 3
                      Top = 10
                      Width = 54
                      Height = 13
                      Caption = 'Mercado:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label27: TLabel
                      Left = 184
                      Top = 10
                      Width = 44
                      Height = 13
                      Caption = 'Origem:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object GroupBox33: TGroupBox
                      Left = 356
                      Top = 9
                      Width = 418
                      Height = 114
                      Caption = 'Tempo C'#237'clico'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      object Label126: TLabel
                        Left = 9
                        Top = 23
                        Width = 133
                        Height = 13
                        Caption = 'Tempo Processamento:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label136: TLabel
                        Left = 33
                        Top = 45
                        Width = 109
                        Height = 13
                        Caption = 'Tempo de Entrega:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label146: TLabel
                        Left = 24
                        Top = 67
                        Width = 118
                        Height = 13
                        Caption = 'Tempo de Aloca'#231#227'o:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label147: TLabel
                        Left = 31
                        Top = 89
                        Width = 111
                        Height = 13
                        Caption = 'Frequ'#234'ncia Pedido:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label148: TLabel
                        Left = 215
                        Top = 24
                        Width = 129
                        Height = 13
                        Caption = 'Qtde Meses Sugest'#227'o:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object ComboBox13: TComboBox
                        Left = 346
                        Top = 20
                        Width = 65
                        Height = 21
                        Hint = 'Quantidade de Meses usada na sugest'#227'o'
                        ItemHeight = 13
                        TabOrder = 4
                        OnExit = MaskEdit14Exit
                        Items.Strings = (
                          '1'
                          '2'
                          '3'
                          '4'
                          '5'
                          '6'
                          '7'
                          '8'
                          '9'
                          '10'
                          '11'
                          '12')
                      end
                      object MaskEdit14: TMaskEdit
                        Left = 144
                        Top = 20
                        Width = 65
                        Height = 21
                        Hint = 'Tempo de processamento'
                        TabOrder = 0
                        OnExit = MaskEdit14Exit
                      end
                      object MaskEdit15: TMaskEdit
                        Left = 144
                        Top = 42
                        Width = 65
                        Height = 21
                        Hint = 'Tempo de entrega'
                        TabOrder = 1
                        OnExit = MaskEdit14Exit
                      end
                      object MaskEdit16: TMaskEdit
                        Left = 144
                        Top = 64
                        Width = 65
                        Height = 21
                        Hint = 'Tempo de aloca'#231#227'o'
                        TabOrder = 2
                        OnExit = MaskEdit14Exit
                      end
                      object MaskEdit17: TMaskEdit
                        Left = 144
                        Top = 86
                        Width = 65
                        Height = 21
                        Hint = 'Frequ'#234'ncia do pedido'
                        TabOrder = 3
                        OnExit = MaskEdit14Exit
                      end
                    end
                    object CheckListBoxMercado: TCheckListBox
                      Left = 3
                      Top = 27
                      Width = 170
                      Height = 97
                      Hint = 'Tipo de venda do item'
                      ItemHeight = 13
                      Items.Strings = (
                        'V - VAREJO'
                        'A - ATACADO'
                        'C - CONSIGNADO'
                        'T - TELEVENDA'
                        'P - APLICADORES'
                        'O - OUTRAS EMPRESAS'
                        'S - CONSUMO')
                      TabOrder = 0
                    end
                    object CheckListBoxOrigem: TCheckListBox
                      Left = 179
                      Top = 27
                      Width = 170
                      Height = 97
                      Hint = 'Tipo de origem da venda do item'
                      ItemHeight = 13
                      Items.Strings = (
                        'V  - VENDAS NORMAIS'
                        'P  - PROMO'#199#213'ES'
                        'D  - DESCARTES'
                        'T  - TRANSFER'#202'NCIA'
                        'A  - AJUSTE DE INVENT'#193'RIO'
                        'O  - OFICINA DA EMPRESA')
                      TabOrder = 1
                    end
                  end
                  object GroupBox11: TGroupBox
                    Left = 0
                    Top = 298
                    Width = 857
                    Height = 62
                    Align = alTop
                    Caption = 'Classifica'#231#227'o dos produtos'
                    TabOrder = 3
                    object Label7: TLabel
                      Left = 20
                      Top = 18
                      Width = 91
                      Height = 13
                      Caption = 'Valor Demanda:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 184
                      Top = 18
                      Width = 84
                      Height = 13
                      Caption = 'Valor Estoque:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label11: TLabel
                      Left = 65
                      Top = 40
                      Width = 46
                      Height = 13
                      Caption = 'Volume:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 200
                      Top = 40
                      Width = 68
                      Height = 13
                      Caption = 'Frequ'#234'ncia:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 341
                      Top = 18
                      Width = 86
                      Height = 13
                      Caption = 'Pre'#231'o Unit'#225'rio:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label19: TLabel
                      Left = 500
                      Top = 18
                      Width = 79
                      Height = 13
                      Caption = 'Popularidade:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label22: TLabel
                      Left = 362
                      Top = 40
                      Width = 65
                      Height = 13
                      Caption = 'Atualidade:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object ComboVlDem: TComboBox
                      Left = 113
                      Top = 15
                      Width = 65
                      Height = 19
                      Hint = 'Classifica'#231#227'o segundo segundo a demanda'
                      Style = csOwnerDrawFixed
                      ItemHeight = 13
                      TabOrder = 0
                      Items.Strings = (
                        ''
                        'A'
                        'B'
                        'C'
                        'D')
                    end
                    object ComboVlEstoque: TComboBox
                      Left = 270
                      Top = 15
                      Width = 65
                      Height = 19
                      Hint = 'Classifica'#231#227'o segundo segundo o valor de estoque'
                      Style = csOwnerDrawFixed
                      ItemHeight = 13
                      TabOrder = 1
                      Items.Strings = (
                        ''
                        'X'
                        'Y'
                        'Z'
                        'W')
                    end
                    object ComboVolume: TComboBox
                      Left = 113
                      Top = 37
                      Width = 65
                      Height = 19
                      Hint = 'Classifica'#231#227'o sobre volume de venda'
                      Style = csOwnerDrawFixed
                      ItemHeight = 13
                      TabOrder = 4
                      Items.Strings = (
                        ''
                        'Q1'
                        'Q2'
                        'Q3'
                        'Q4')
                    end
                    object ComboFrequencia: TComboBox
                      Left = 270
                      Top = 37
                      Width = 65
                      Height = 19
                      Hint = 'Classifica'#231#227'o do produto por frequ'#234'ncia de venda'
                      Style = csOwnerDrawFixed
                      ItemHeight = 13
                      TabOrder = 5
                      Items.Strings = (
                        ''
                        'F1'
                        'F2'
                        'F3'
                        'F4')
                    end
                    object ComboPrecoUn: TComboBox
                      Left = 429
                      Top = 15
                      Width = 65
                      Height = 19
                      Hint = 'Classifica'#231#227'o do produto por pre'#231'o de compra'
                      Style = csOwnerDrawFixed
                      ItemHeight = 13
                      TabOrder = 2
                      Items.Strings = (
                        ''
                        '$A'
                        '$B'
                        '$C')
                    end
                    object ComboPopularidade: TComboBox
                      Left = 579
                      Top = 15
                      Width = 65
                      Height = 19
                      Hint = 'Classifica'#231#227'o do produto por popularidade'
                      Style = csOwnerDrawFixed
                      ItemHeight = 13
                      TabOrder = 3
                      Items.Strings = (
                        ''
                        'P1'
                        'P2'
                        'P3'
                        'P4')
                    end
                    object ComboAtualidade: TComboBox
                      Left = 429
                      Top = 37
                      Width = 65
                      Height = 19
                      Hint = 'Classifica'#231#227'o do produto sobre atualidade de venda'
                      Style = csOwnerDrawFixed
                      ItemHeight = 13
                      TabOrder = 6
                      Items.Strings = (
                        ''
                        'T1'
                        'T2'
                        'T3'
                        'T4')
                    end
                  end
                end
              end
              object tsSugestao: TTabSheet
                Caption = 'Ver Sugest'#227'o de Compras'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object PageControl2: TPageControl
                  Left = 0
                  Top = 0
                  Width = 861
                  Height = 439
                  ActivePage = TabSheet4
                  Align = alClient
                  Style = tsFlatButtons
                  TabOrder = 0
                  object TabSheet4: TTabSheet
                    Caption = 'Sugest'#227'o'
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                    object GroupBox9: TGroupBox
                      Left = 0
                      Top = 333
                      Width = 853
                      Height = 42
                      Align = alBottom
                      ParentBackground = False
                      TabOrder = 1
                      object SpeedButtonSelTodos: TSpeedButton
                        Left = 717
                        Top = 13
                        Width = 23
                        Height = 21
                        Hint = 'Selecionar todos'
                        Flat = True
                        Glyph.Data = {
                          CE010000424DCE01000000000000CE0000002800000010000000100000000100
                          08000000000000010000120B0000120B0000260000002600000000000000FFFF
                          FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                          5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                          8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                          1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                          430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                          0202020202020202020202020202020202020202020202021212020202020202
                          0202020202020212181B120202020202020202020202121F1C141D1202020202
                          02020202021223211E12171A1202020202020202122425201202121519120202
                          02020202021222120A03020212161202020202020203120C080B030202121312
                          02020202030F0E0803070903020202121202020310110D030203050803020202
                          12120202030E0302020202030603020202020202020302020202020203040302
                          0202020202020202020202020202030302020202020202020202020202020203
                          030202020202020202020202020202020202}
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = SpeedButtonSelTodosClick
                      end
                      object SpeedButtonDesTodos: TSpeedButton
                        Left = 746
                        Top = 13
                        Width = 23
                        Height = 21
                        Hint = 'Desfazer sele'#231#227'o'
                        Flat = True
                        Glyph.Data = {
                          AA010000424DAA01000000000000AA0000002800000010000000100000000100
                          08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                          FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                          AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                          9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                          8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                          02020202020202020202020202020202020202021C1C02020202020202020202
                          0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                          021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                          021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                          1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                          1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                          020202020202020202021B1B0202020202020202020202020202021B1B020202
                          0202020202020202020202020202}
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = SpeedButtonDesTodosClick
                      end
                      object SpeedButtonBuscasProdutosSug: TSpeedButton
                        Left = 775
                        Top = 13
                        Width = 23
                        Height = 21
                        Hint = 'Localizar produtos'
                        Flat = True
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000D30E0000D30E00000001000000010000181810001818
                          18002929290031313100313931004A39310039393900423939004A423900524A
                          3900424242004A4A42004A4A4A00524A4A0052524A00735A4A00525252005A5A
                          5A007B6B5A00846B5A00636363006B6363006B6B6B0094846B00737373009484
                          73009C8C7300737B7B007B7B7B0094947B00A5947B00848484009C948400A594
                          8400AD94840084848C008C8C8C0094948C00A59C8C00AD9C8C00ADA58C00EFBD
                          8C0094949400A59C9400B5A59400BDB59400C6B59400DEBD9400EFBD9400F7BD
                          9400EFC6940094949C009C9C9C00A5A59C00B5AD9C00EFBD9C00E7C69C00EFC6
                          9C00E7CE9C009CA5A500A5A5A500A5ADA500B5ADA500B5B5A500C6BDA500CEBD
                          A500D6BDA500E7C6A500F7CEA500EFD6A500FFD6A500ADADAD00B5ADAD00B5B5
                          AD00DEC6AD00EFC6AD00DECEAD00EFCEAD00F7CEAD00F7D6AD00FFD6AD00F7DE
                          AD00B5B5B500CEC6B500E7CEB500F7D6B500FFD6B500FFDEB500BDBDBD00EFD6
                          BD00F7D6BD00FFD6BD00F7DEBD00FFDEBD00FFE7BD00BDBDC600BDC6C600C6C6
                          C600F7D6C600F7DEC600FFDEC600FFF7C600C6C6CE00CECECE00D6D6CE00EFDE
                          CE00FFDECE00F7E7CE00FFE7CE00FFEFCE00D6D6D600DEDED600FFDED600FFE7
                          D600FFEFD600DEDEDE00FFF7DE00FFFFDE00E7E7E700EFE7E700FFEFE700FFF7
                          E700FFFFE700EFEFEF00FFF7EF00FFFFEF00F7F7F700FFFFF700FF00FF00F7FF
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
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080808080
                          8080808080808080808080808080808080808080808052068080808080808080
                          8080808080470C2A1C80808080808080808080803C0A2A6E2480808080808080
                          808080471134612A80808080808080808080581634522A808080808080343434
                          34801601161F808080808080580C0D0C103C06165880808080808033176B7974
                          7121166F808080808080580779744A4A6C7F15618080808080803C2E714B3030
                          386B1A18808080808080344271634444646C271F808080808080494056647474
                          5A561E2380808080808067265071817F70561D3C80808080808080672D4F7A74
                          4541588080808080808080803C3F453A53358080808080808080}
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = SpeedButtonBuscasProdutosSugClick
                      end
                      object BitBtn9: TBitBtn
                        Left = 301
                        Top = 11
                        Width = 95
                        Height = 26
                        Caption = 'Montar Pedido'
                        TabOrder = 3
                        OnClick = BitBtn9Click
                      end
                      object BitBtn10: TBitBtn
                        Left = 10
                        Top = 11
                        Width = 95
                        Height = 26
                        Caption = 'Demanda Mensal'
                        TabOrder = 0
                        OnClick = BitBtn10Click
                      end
                      object BitBtn11: TBitBtn
                        Left = 107
                        Top = 11
                        Width = 95
                        Height = 26
                        Caption = 'Produto Similar'
                        TabOrder = 1
                        OnClick = BitBtn11Click
                      end
                      object BitBtn12: TBitBtn
                        Left = 204
                        Top = 11
                        Width = 95
                        Height = 26
                        Caption = 'Altera Sug.'
                        TabOrder = 2
                        OnClick = BitBtn12Click
                      end
                      object BitBtn13: TBitBtn
                        Left = 803
                        Top = 7
                        Width = 39
                        Height = 34
                        TabOrder = 7
                        OnClick = BitBtn13Click
                        Glyph.Data = {
                          76060000424D7606000000000000360400002800000018000000180000000100
                          08000000000040020000F30E0000F30E00000001000000010000421821004221
                          21004A2121004A29290031313100523131005A31310039393100313939003939
                          390042D642004A4A4A007B4A5200844A52004A525200525252005A525200524A
                          5A008C4A5A0052525A0063636300736363007B6363006B6B6300736B63007B6B
                          63006B5A6B00845A6B007B636B0084636B006B6B6B00846B6B008C6B6B008C63
                          7300846B73008C6B73009C6B7300737373007B737300847373007B947300A56B
                          7B00A5737B00737B7B007B7B7B00847B7B009C7B7B00A57B7B00AD7B7B007B84
                          7B00A5847B0084CE7B008CFF7B00847B84008C7B8400947B8400BD7B84007384
                          840084848400A5848400AD848400B58484009C848C00848C8C008C8C8C00948C
                          8C009C8C8C00BD8C8C00C68C8C0084948C00BD8C9400C68C9400849494008C94
                          9400949494009C9494008C9C940094DE9400AD7B9C008C849C008C949C009494
                          9C00AD949C008C9C9C00949C9C009C9C9C00A59C9C00B5A59C009CEF9C00A57B
                          A500A5A5A500ADA5A500B5A5A500AD9CAD009CA5AD00BDA5AD00A5ADAD00ADAD
                          AD00B5ADAD00ADB5B500B5B5B500B5B5BD00BDB5BD00B5BDBD00BDBDBD00BDD6
                          BD00C6C6C600CEC6C600C6C6CE00C6CECE00CECECE00D6CECE00CED6CE00D6CE
                          D600CED6D600D6D6D600DED6D600D6DEDE00DEDEDE00DEE7DE00E7D6E700DEE7
                          E700E7E7E700EFE7E700E7EFE700E7EFEF00EFEFEF00F7EFEF00EFF7F700F7F7
                          F700FF00FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00828282828282
                          82828282828282828282828282828282828282828282828282825A5555555555
                          55555A828282828282828282828282825564737A7D7E7E7E7C76686256828282
                          82828282828282820B2B7E816D676A6470846A260B658282828282828282820F
                          0B1E7E81736B6F6A73846C170B0F648282828282821E140B0B3A81807671746F
                          768472310B0B0B1E828282821E0B0B0B0B3F7972543F40645E7E6D3A0B0B0B0B
                          1782822C0B102D0F0B1E556163636464605A51170B13390E0B1E820F142D3A14
                          140B0B0B0B0B0B0B0B0B0B0B14116411110B820F355448534C49544A54403145
                          4C4954504F6434531A09820F55686661412D221F1F1D1B1C1920213759536464
                          5D0B821461755B23243B2F434447464643442A3C29162869640B82256472360D
                          383C2F2F30302E2E302F323C3D124E7861148240646E370C0D060B0B0B0B0B0B
                          0B0B0B060D0C3E6C613A8268646E52000B03151616151516161618050902566E
                          64618282646F5F010B578484848484848484845C0B025C6E648282826863644B
                          2741848484848484848483411C42676368828282827D7A7E7B737A8383838484
                          848075737A7F7B7C82828282828282828277768184846E646464647282828282
                          8282828282828282826F7683847E64646B6A6E73828282828282828282828282
                          826A6E818176646484847E6E828282828282828282828282826A6E81816E6476
                          847A6E82828282828282828282828282826864737364647E7A6E828282828282
                          8282828282828282826A61646464686E6E828282828282828282}
                      end
                      object BitBtn16: TBitBtn
                        Left = 398
                        Top = 11
                        Width = 115
                        Height = 26
                        Caption = 'Montar Lista Cota'#231#227'o'
                        TabOrder = 4
                        OnClick = BitBtn16Click
                      end
                      object BitBtn19: TBitBtn
                        Left = 515
                        Top = 11
                        Width = 115
                        Height = 26
                        Caption = 'Montar Transfer'#234'ncias'
                        TabOrder = 5
                        OnClick = BitBtn19Click
                      end
                      object BitBtn20: TBitBtn
                        Left = 633
                        Top = 11
                        Width = 75
                        Height = 25
                        Hint = 'Cancelar o processamento da sugest'#227'o'
                        Caption = '&Parar'
                        TabOrder = 6
                        OnClick = BitBtn15Click
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000130B0000130B0000000100000001000000109C000818
                          9C0008219C0010219C001029A5001831A5000010AD000018C6000821C6001029
                          C6001831C6000018CE000021CE000829CE001029CE001031CE000021D6001031
                          D6001831D6001839D6002139D6001031DE001831DE001839DE002139DE002142
                          DE002942DE00314ADE004252DE000029E7000831E7001031E7001039E7001839
                          E7002139E7002939E7001042E7001842E7002142E7002942E7003142E700294A
                          E700314AE7003152E7003952E7004252E700425AE7004A5AE7004A63E7005263
                          E700526BEF005A6BEF005273EF005A73EF006B7BEF006B84EF008C94EF00FF00
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
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00393939393939
                          3939393939393939393939393939393939393939393939393939393304000000
                          000000000002333939393909070809090D0E0E0C0B0603393939390B11122227
                          2625201E1D0B00393939391012272A29292524201E0C003939393911262C2B2A
                          292521201E0F0039393939222A2C2B2A2925201F1E0F00393939392A2E2D2B2A
                          27171515150F00393939392C302E2C281A171115150F00393939392D32301C2A
                          1A181316150F0039393939303735302D2B1B1A19140F01393939393538363431
                          302F2E2C290F053939393935352F2C2A2A272314130A33393939393939393939
                          3939393939393939393939393939393939393939393939393939}
                      end
                    end
                    object StGradS: TStringGrid
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Width = 847
                      Height = 327
                      Align = alClient
                      Color = clMenu
                      ColCount = 18
                      Ctl3D = True
                      FixedColor = clWhite
                      RowCount = 2
                      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
                      ParentCtl3D = False
                      TabOrder = 0
                      OnDblClick = StGradSDblClick
                      OnDrawCell = StGradSDrawCell
                      ColWidths = (
                        64
                        38
                        94
                        99
                        91
                        82
                        64
                        205
                        64
                        64
                        249
                        64
                        311
                        120
                        64
                        64
                        64
                        64)
                    end
                    object pnProgressBar: TPanel
                      Left = 0
                      Top = 375
                      Width = 853
                      Height = 33
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 2
                      object lbProgressBar: TLabel
                        Left = 0
                        Top = 0
                        Width = 108
                        Height = 13
                        Align = alTop
                        Caption = 'Produto Analizado:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object ProgressBar2: TProgressBar
                        Left = 0
                        Top = 13
                        Width = 849
                        Height = 16
                        Align = alTop
                        TabOrder = 0
                      end
                    end
                  end
                  object TabSheet5: TTabSheet
                    Caption = 'Valor Mensal Venda'
                    ImageIndex = 1
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                    object GroupBox8: TGroupBox
                      Left = 0
                      Top = 370
                      Width = 853
                      Height = 38
                      Align = alBottom
                      ParentBackground = False
                      TabOrder = 0
                      object Label9: TLabel
                        Left = 13
                        Top = 14
                        Width = 76
                        Height = 13
                        Caption = 'M'#233'dia Di'#225'ria:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object BitBtn7: TBitBtn
                        Left = 599
                        Top = 9
                        Width = 75
                        Height = 25
                        Hint = 'Retornar para sugest'#227'o'
                        Caption = '&Voltar'
                        TabOrder = 0
                        OnClick = BitBtn7Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
                          1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
                          BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
                          007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
                          4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
                          E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
                          00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
                          FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
                          F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
                          00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
                          5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
                          F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
                          00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
                          E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
                          F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
                          00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
                          6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
                          FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
                          00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
                          9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
                          CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
                          00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                    end
                    object DBGrid2: TDBGrid
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Width = 847
                      Height = 364
                      Align = alClient
                      DataSource = dtmSugestaoCompras.dsBuscasSugestao1
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                    end
                  end
                  object TabSheet6: TTabSheet
                    Caption = 'Similares'
                    ImageIndex = 2
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                    object GroupBox7: TGroupBox
                      Left = 0
                      Top = 369
                      Width = 853
                      Height = 39
                      Align = alBottom
                      ParentBackground = False
                      TabOrder = 0
                      object BitBtn8: TBitBtn
                        Left = 596
                        Top = 9
                        Width = 75
                        Height = 25
                        Hint = 'Retornar para sugest'#227'o'
                        Caption = '&Voltar'
                        TabOrder = 0
                        OnClick = BitBtn7Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
                          1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
                          BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
                          007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
                          4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
                          E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
                          00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
                          FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
                          F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
                          00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
                          5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
                          F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
                          00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
                          E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
                          F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
                          00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
                          6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
                          FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
                          00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
                          9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
                          CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
                          00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                    end
                    object DBGrid3: TDBGrid
                      Left = 0
                      Top = 0
                      Width = 853
                      Height = 369
                      Align = alClient
                      DataSource = dtmSugestaoCompras.dsBuscasClasses1
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                    end
                  end
                  object TabSheet7: TTabSheet
                    Caption = 'Lista Cota'#231#227'o'
                    ImageIndex = 3
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                    object pnListaCotacao: TPanel
                      Left = 0
                      Top = 0
                      Width = 853
                      Height = 377
                      Align = alTop
                      TabOrder = 0
                      object GroupBox12: TGroupBox
                        Left = 1
                        Top = 76
                        Width = 851
                        Height = 265
                        Align = alClient
                        TabOrder = 1
                        object DBGrid4: TDBGrid
                          Left = 2
                          Top = 15
                          Width = 847
                          Height = 248
                          Align = alClient
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          OnCellClick = DBGrid4CellClick
                          OnDrawColumnCell = DBGrid4DrawColumnCell
                          OnKeyDown = DBGrid4KeyDown
                          OnTitleClick = DBGrid4TitleClick
                        end
                      end
                      object GroupBox10: TGroupBox
                        Left = 1
                        Top = 1
                        Width = 851
                        Height = 75
                        Align = alTop
                        TabOrder = 0
                        object Label17: TLabel
                          Left = 94
                          Top = 14
                          Width = 50
                          Height = 13
                          Caption = 'Descri'#231#227'o:'
                        end
                        object Label23: TLabel
                          Left = 82
                          Top = 38
                          Width = 62
                          Height = 13
                          Caption = 'Observa'#231#227'o:'
                        end
                        object btSelectAll: TSpeedButton
                          Left = 671
                          Top = 27
                          Width = 23
                          Height = 21
                          Hint = 'Selecionar todos'
                          Flat = True
                          Glyph.Data = {
                            CE010000424DCE01000000000000CE0000002800000010000000100000000100
                            08000000000000010000120B0000120B0000260000002600000000000000FFFF
                            FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                            5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                            8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                            1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                            430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                            0202020202020202020202020202020202020202020202021212020202020202
                            0202020202020212181B120202020202020202020202121F1C141D1202020202
                            02020202021223211E12171A1202020202020202122425201202121519120202
                            02020202021222120A03020212161202020202020203120C080B030202121312
                            02020202030F0E0803070903020202121202020310110D030203050803020202
                            12120202030E0302020202030603020202020202020302020202020203040302
                            0202020202020202020202020202030302020202020202020202020202020203
                            030202020202020202020202020202020202}
                          ParentShowHint = False
                          ShowHint = True
                          OnClick = btSelectAllClick
                        end
                        object btUnSelectAll: TSpeedButton
                          Left = 700
                          Top = 27
                          Width = 23
                          Height = 21
                          Hint = 'Desfazer sele'#231#227'o'
                          Flat = True
                          Glyph.Data = {
                            AA010000424DAA01000000000000AA0000002800000010000000100000000100
                            08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                            FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                            AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                            9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                            8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                            02020202020202020202020202020202020202021C1C02020202020202020202
                            0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                            021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                            021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                            1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                            1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                            020202020202020202021B1B0202020202020202020202020202021B1B020202
                            0202020202020202020202020202}
                          ParentShowHint = False
                          ShowHint = True
                          OnClick = btUnSelectAllClick
                        end
                        object Edit1: TEdit
                          Left = 150
                          Top = 11
                          Width = 506
                          Height = 21
                          CharCase = ecUpperCase
                          TabOrder = 0
                        end
                        object Memo1: TMemo
                          Left = 150
                          Top = 38
                          Width = 506
                          Height = 33
                          TabOrder = 1
                        end
                      end
                      object GroupBox13: TGroupBox
                        Left = 1
                        Top = 341
                        Width = 851
                        Height = 35
                        Align = alBottom
                        TabOrder = 2
                        object BitBtn18: TBitBtn
                          Left = 332
                          Top = 7
                          Width = 75
                          Height = 25
                          Hint = 'Gravar a Lista de Cota'#231#227'o'
                          Caption = '&OK'
                          TabOrder = 0
                          OnClick = BitBtn18Click
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
                        object BitBtn17: TBitBtn
                          Left = 413
                          Top = 7
                          Width = 75
                          Height = 25
                          Hint = 'Cancelar'
                          Caption = '&Cancela'
                          TabOrder = 1
                          OnClick = BitBtn17Click
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
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 470
              Width = 869
              ExplicitTop = 470
              ExplicitWidth = 869
              inherited BitBtn4: TBitBtn
                Hint = 'Gravar a sugest'#227'o de compras'
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair do formul'#225'rio'
              end
              inherited CheckCadSeq: TCheckBox
                Tag = 1
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 869
          ExplicitHeight = 518
          inherited GroupBox3: TGroupBox
            Width = 869
            ExplicitWidth = 869
            inherited imgInformation: TImage
              Left = 843
              ExplicitLeft = 854
            end
            object SpeedButton59: TSpeedButton [6]
              Left = 656
              Top = 43
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000007B00000084
                0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
              OnClick = SpeedButton59Click
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [SUG020]'
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
            Width = 869
            Height = 445
            ExplicitWidth = 869
            ExplicitHeight = 445
            inherited Splitter1: TSplitter
              Height = 384
              ExplicitHeight = 384
            end
            inherited DBGrid1: TDBGrid
              Width = 576
              Height = 384
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_SUGESTAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'DT_SUGESTAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'USODEGRADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QTDMESSUG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = False
                end>
            end
            inherited Panel2: TPanel
              Width = 865
              ExplicitWidth = 865
              inherited SpeedButton1: TSpeedButton
                Left = 292
                Enabled = False
                Visible = False
                ExplicitLeft = 292
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SUG022]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [SUG023]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Left = 7
                Hint = 'Recupera dados da Sugest'#227'o Selecionada'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000130F0000130F00000001000000010000392918003131
                  310021214A007B5A4A007363520018425A00846B5A000842630021526B005263
                  6B0029637B00847B7B0084847B008C847B009C948C004A6B9C009C9C9C00B5B5
                  B500E7CEB5003139BD008CB5C60010A5D60029ADD600D6D6D60042A5DE00DEDE
                  DE000010E700F7EFE700299CEF002973F70073DEF70042E7F700FF00FF008CEF
                  FF008CF7FF009CFFFF00ADFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020161616161616161616161616161616161616161616
                  20202016222222221E1E1E1E1E1E1E1E1E16161E1E1E1E162020201622222221
                  211E1E1E1E1E1E1E1E1624161E1E1E1620202016222222222221211E1E1E1E1E
                  1E162424161E1E162020201622222222222121211E1E1E1E1E16242422161E16
                  202020162323222222222121211E1E1E1E162222222216162020201623231910
                  10100B010311211E1E16161616161616202020162323232222222203000A091E
                  1E1E1E1E1E1E1E1620202016232323232322221714221D081E1E1E1E1E1E1E16
                  20202016232323232323222215221D1D0721211E1E1E1E162020201623231910
                  10100B0B0B151F1D1D080B0B0B0B1E162020201623232323232323232222151F
                  1D1D0521211E1E16202020162323232323232323232222151F1D1D0821211E16
                  20202016232323232323232323222222151F1D1D072121162020201616161616
                  161616161616161616151F1D1301161620202020202020202020202020202020
                  202015180D0C01202020202020202020202020202020202020202006251B0402
                  20202020202020202020202020202020202020200E120A1D1320202020202020
                  202020202020202020202020200F1C1D13202020202020202020202020202020
                  2020202020201A1A202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020}
                OnClick = SpeedButton6Click
                ExplicitLeft = 7
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Top = 3
                Enabled = False
                Visible = False
                ExplicitTop = 3
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [SUG021]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 384
              ExplicitHeight = 384
              inherited ScrollBox2: TScrollBox
                Height = 367
                ExplicitHeight = 367
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 869
          ExplicitHeight = 518
        end
        object tsMultiempresa: TTabSheet
          Caption = 'Multiempresa'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMultiempresa: TPanel
            Left = 1
            Top = 3
            Width = 704
            Height = 230
            TabOrder = 0
            OnEnter = pnMultiempresaEnter
            object pnMultiempresaBottom: TPanel
              Left = 1
              Top = 195
              Width = 702
              Height = 34
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButtonMultiempresaSel: TSpeedButton
                Left = 643
                Top = 6
                Width = 23
                Height = 21
                Hint = 'Selecionar todas'
                Flat = True
                Glyph.Data = {
                  CE010000424DCE01000000000000CE0000002800000010000000100000000100
                  08000000000000010000120B0000120B0000260000002600000000000000FFFF
                  FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                  5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                  8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                  1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                  430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                  0202020202020202020202020202020202020202020202021212020202020202
                  0202020202020212181B120202020202020202020202121F1C141D1202020202
                  02020202021223211E12171A1202020202020202122425201202121519120202
                  02020202021222120A03020212161202020202020203120C080B030202121312
                  02020202030F0E0803070903020202121202020310110D030203050803020202
                  12120202030E0302020202030603020202020202020302020202020203040302
                  0202020202020202020202020202030302020202020202020202020202020203
                  030202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonMultiempresaSelClick
              end
              object SpeedButtonMultiempresaDesm: TSpeedButton
                Left = 672
                Top = 6
                Width = 23
                Height = 21
                Hint = 'Desfazer sele'#231#227'o'
                Flat = True
                Glyph.Data = {
                  AA010000424DAA01000000000000AA0000002800000010000000100000000100
                  08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                  FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                  AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                  9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                  8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                  02020202020202020202020202020202020202021C1C02020202020202020202
                  0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                  021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                  021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                  1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                  1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                  020202020202020202021B1B0202020202020202020202020202021B1B020202
                  0202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonMultiempresaDesmClick
              end
              object btnMultiempresaOK: TBitBtn
                Left = 271
                Top = 2
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = btnMultiempresaOKClick
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
              object btnMultiempresaCancelar: TBitBtn
                Left = 352
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = btnMultiempresaCancelarClick
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
            end
            object DBGridMultiempresa: TDBGrid
              Left = 1
              Top = 1
              Width = 702
              Height = 194
              Align = alClient
              DataSource = dtmSugestaoCompras.dsSugestaoEmpresa
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGridMultiempresaCellClick
              OnDrawColumnCell = DBGridMultiempresaDrawColumnCell
              OnKeyDown = DBGridMultiempresaKeyDown
            end
          end
        end
        object tsMontarPedidoCompra: TTabSheet
          Caption = 'Montar Pedido Compra'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMontarPedidoCompra: TPanel
            Left = 1
            Top = 3
            Width = 864
            Height = 515
            TabOrder = 0
            object pnMontarPedidoCompraClient: TPanel
              Left = 1
              Top = 1
              Width = 862
              Height = 478
              Align = alClient
              TabOrder = 0
              object Splitter3: TSplitter
                Left = 1
                Top = 369
                Width = 860
                Height = 3
                Cursor = crVSplit
                Align = alBottom
                OnMoved = Splitter3Moved
                ExplicitLeft = 2
                ExplicitTop = 138
                ExplicitWidth = 773
              end
              object Splitter5: TSplitter
                Left = 1
                Top = 121
                Width = 860
                Height = 2
                Cursor = crVSplit
                Align = alTop
                OnMoved = Splitter5Moved
                ExplicitLeft = -1
                ExplicitTop = 125
              end
              object GroupBoxMontarPedidoCompraProdDet: TGroupBox
                Left = 1
                Top = 372
                Width = 860
                Height = 105
                Align = alBottom
                Caption = 'Compras realizadas nos '#250'ltimos 365 dias'
                TabOrder = 0
                object DBGridMontarPedidoCompraProdDet: TDBGrid
                  Left = 2
                  Top = 15
                  Width = 856
                  Height = 88
                  Align = alClient
                  DataSource = dtmSugestaoCompras.dsCustosProd
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'COD_NF'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NUM_NOTA_NFE'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SERIE'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DATA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PREC_CUS_MED'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PR_CUSC_PROD'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FORNEC'
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
                      FieldName = 'CPFCGC'
                      Visible = True
                    end>
                end
              end
              object GroupBoxMontarPedidoCompraClient: TGroupBox
                Left = 1
                Top = 123
                Width = 860
                Height = 246
                Align = alClient
                Caption = 'Produtos sugest'#227'o'
                TabOrder = 1
                object DBGridMontarPedidoCompraProd: TDBGrid
                  Left = 2
                  Top = 15
                  Width = 856
                  Height = 229
                  Align = alClient
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnCellClick = DBGridMontarPedidoCompraProdCellClick
                  OnDrawColumnCell = DBGridMontarPedidoCompraProdDrawColumnCell
                  OnKeyDown = DBGridMontarPedidoCompraProdKeyDown
                  OnTitleClick = DBGridMontarPedidoCompraProdTitleClick
                end
              end
              object GroupBoxMontarPedidoCompraTop: TGroupBox
                Left = 1
                Top = 1
                Width = 860
                Height = 120
                Align = alTop
                Caption = 'Fornecedores (Compras realizadas nos '#250'ltimos 365 dias)'
                TabOrder = 2
                object Panel6: TPanel
                  Left = 2
                  Top = 15
                  Width = 856
                  Height = 44
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object lbInfPedido: TLabel
                    Left = 710
                    Top = 2
                    Width = 131
                    Height = 13
                    Caption = 'Pedido de compra realizado'
                  end
                  object SpeedButtonSelTodosEmpFornec: TSpeedButton
                    Left = 467
                    Top = 1
                    Width = 23
                    Height = 21
                    Hint = 'Selecionar todos'
                    Flat = True
                    Glyph.Data = {
                      CE010000424DCE01000000000000CE0000002800000010000000100000000100
                      08000000000000010000120B0000120B0000260000002600000000000000FFFF
                      FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                      5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                      8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                      1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                      430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                      0202020202020202020202020202020202020202020202021212020202020202
                      0202020202020212181B120202020202020202020202121F1C141D1202020202
                      02020202021223211E12171A1202020202020202122425201202121519120202
                      02020202021222120A03020212161202020202020203120C080B030202121312
                      02020202030F0E0803070903020202121202020310110D030203050803020202
                      12120202030E0302020202030603020202020202020302020202020203040302
                      0202020202020202020202020202030302020202020202020202020202020203
                      030202020202020202020202020202020202}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButtonSelTodosEmpFornecClick
                  end
                  object SpeedButtonDesTodosEmpFornec: TSpeedButton
                    Left = 496
                    Top = 1
                    Width = 23
                    Height = 21
                    Hint = 'Desfazer sele'#231#227'o'
                    Flat = True
                    Glyph.Data = {
                      AA010000424DAA01000000000000AA0000002800000010000000100000000100
                      08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                      FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                      AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                      9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                      8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                      02020202020202020202020202020202020202021C1C02020202020202020202
                      0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                      021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                      021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                      1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                      1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                      020202020202020202021B1B0202020202020202020202020202021B1B020202
                      0202020202020202020202020202}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButtonDesTodosEmpFornecClick
                  end
                  object ckFiltrarPorFornecedor: TCheckBox
                    Left = 660
                    Top = 24
                    Width = 173
                    Height = 17
                    Caption = 'Filtrar produtos por fornecedor'
                    TabOrder = 1
                    OnClick = ckFiltrarPorFornecedorClick
                  end
                  object pnInfPedido: TPanel
                    Left = 651
                    Top = 2
                    Width = 49
                    Height = 13
                    BevelOuter = bvNone
                    Color = 10223541
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBackground = False
                    ParentFont = False
                    TabOrder = 2
                  end
                  object RadioGroupOrdenarCliente: TRadioGroup
                    Left = 0
                    Top = 0
                    Width = 461
                    Height = 44
                    Align = alLeft
                    Caption = 'Ordenar'
                    Columns = 4
                    ItemIndex = 0
                    Items.Strings = (
                      'Empresa'
                      'C'#243'digo'
                      'Nome Fantasia'
                      'Raz'#227'o Social')
                    TabOrder = 0
                    OnClick = RadioGroupOrdenarClienteClick
                  end
                  object ckFiltrarPorEmpresa: TCheckBox
                    Left = 468
                    Top = 24
                    Width = 173
                    Height = 17
                    Caption = 'Filtrar produtos por empresa'
                    TabOrder = 3
                    OnClick = ckFiltrarPorEmpresaClick
                  end
                end
                object DBGridMontarPedidoCompraProdTop: TDBGrid
                  Left = 382
                  Top = 59
                  Width = 476
                  Height = 59
                  Align = alClient
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnCellClick = DBGridMontarPedidoCompraProdTopCellClick
                  OnDrawColumnCell = DBGridMontarPedidoCompraProdTopDrawColumnCell
                  OnKeyDown = DBGridMontarPedidoCompraProdTopKeyDown
                end
                object DBGridMontarPedidoCompraProdTop2: TDBGrid
                  Left = 2
                  Top = 59
                  Width = 380
                  Height = 59
                  Align = alLeft
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 2
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnCellClick = DBGridMontarPedidoCompraProdTopCellClick
                  OnDrawColumnCell = DBGridMontarPedidoCompraProdTopDrawColumnCell
                  OnKeyDown = DBGridMontarPedidoCompraProdTopKeyDown
                end
              end
            end
            object pnMontarPedidoCompraBottom: TPanel
              Left = 1
              Top = 479
              Width = 862
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btMontarPedidoCompraOK: TBitBtn
                Left = 351
                Top = 3
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = btMontarPedidoCompraOKClick
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
              object btMontarPedidoCompraCancelar: TBitBtn
                Left = 432
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = btMontarPedidoCompraCancelarClick
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
            end
          end
        end
        object tsMontarPedidoCompra2: TTabSheet
          Caption = 'Montar Pedido Compra'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMontarPedidoCompra2: TPanel
            Left = 1
            Top = 15
            Width = 576
            Height = 202
            TabOrder = 0
            OnEnter = pnMontarPedidoCompra2Enter
            object pnMontarPedidoCompra2Top: TPanel
              Left = 1
              Top = 36
              Width = 574
              Height = 135
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object lbVendedor2: TLabel
                Left = 45
                Top = 41
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
              object Label28: TLabel
                Left = 44
                Top = 65
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cond Pag:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label29: TLabel
                Left = 75
                Top = 89
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label30: TLabel
                Left = 35
                Top = 17
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
              object EditMoedaVend2: TEditMoeda
                Left = 106
                Top = 38
                Width = 60
                Height = 21
                Hint = 'C'#243'digo do vendedor'
                Alignment = taRightJustify
                TabOrder = 2
                FormatReal = fInteger
                FormatSize = '10.2'
                OnExit = EditMoedaVend2Exit
                OnKeyDown = EditMoedaVend2KeyDown
              end
              object DBLookupComboBoxVend2: TDBLookupComboBox
                Left = 167
                Top = 38
                Width = 306
                Height = 21
                Hint = 'Vendedor'
                KeyField = 'COD_VENDEDOR'
                ListField = 'NOME_VENDEDOR'
                ListSource = dtmSugestaoCompras.dsVendedor
                TabOrder = 3
                OnExit = DBLookupComboBoxVend2Exit
              end
              object EditMoedaCondPag2: TEditMoeda
                Left = 106
                Top = 62
                Width = 60
                Height = 21
                Hint = 'C'#243'digo da condi'#231#227'o de pagamento'
                Alignment = taRightJustify
                TabOrder = 4
                FormatReal = fInteger
                FormatSize = '10.2'
                OnExit = EditMoedaCondPag2Exit
              end
              object DBLookupComboBoxCondPag2: TDBLookupComboBox
                Left = 167
                Top = 62
                Width = 306
                Height = 21
                Hint = 'Condi'#231#227'o de pagamento'
                KeyField = 'COD_COND_PAG'
                ListField = 'DESC_COND_PAG'
                ListSource = dtmSugestaoCompras.dsCondPagPed
                TabOrder = 5
                OnExit = DBLookupComboBoxCondPag2Exit
              end
              object ComboBoxTipoPedido2: TComboBox
                Left = 106
                Top = 86
                Width = 367
                Height = 21
                Hint = 'Indica se '#233' pedido URGENTE ou NORMAL'
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 6
                Text = 'NORMAL '
                Items.Strings = (
                  'NORMAL '
                  'URGENTE')
              end
              object EditMoedaFornec2: TEditMoeda
                Left = 106
                Top = 14
                Width = 60
                Height = 21
                Hint = 'C'#243'digo do fornecedor'
                Alignment = taRightJustify
                TabOrder = 0
                FormatReal = fInteger
                FormatSize = '10.2'
                OnExit = EditMoedaFornec2Exit
                OnKeyDown = EditMoedaFornec2KeyDown
              end
              object EditMoedaEmpFornec2: TEditMoeda
                Left = 479
                Top = 14
                Width = 60
                Height = 21
                Hint = 'C'#243'digo da empresa'
                Alignment = taRightJustify
                TabOrder = 7
                Visible = False
                FormatReal = fInteger
                FormatSize = '10.2'
              end
              object DBLookupComboBoxFornec2: TDBLookupComboBox
                Left = 167
                Top = 14
                Width = 306
                Height = 21
                Hint = 'Fornecedor'
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE'
                ListSource = dtmSugestaoCompras.dsFornec
                TabOrder = 1
                OnExit = DBLookupComboBoxFornec2Exit
              end
              object ckSalvarOpcoes: TCheckBox
                Left = 21
                Top = 113
                Width = 548
                Height = 17
                Caption = 
                  'N'#227'o exibir esse formul'#225'ro novamente (Salvar vendedor, condi'#231#227'o d' +
                  'e pagamento e tipo pedido por empresa)'
                TabOrder = 8
              end
            end
            object pnMontarPedidoCompra2Fornec: TPanel
              Left = 1
              Top = 1
              Width = 574
              Height = 35
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
            end
            object pnMontarPedidoCompra2Bottom: TPanel
              Left = 1
              Top = 171
              Width = 574
              Height = 30
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtnMontarPedidoCompra2OK: TBitBtn
                Left = 207
                Top = 1
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtnMontarPedidoCompra2OKClick
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
              object BitBtnMontarPedidoCompra2Cancel: TBitBtn
                Left = 288
                Top = 1
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtnMontarPedidoCompra2CancelClick
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
            end
          end
        end
        object tsBuscarProdutosSugCompras: TTabSheet
          Caption = 'Montar Pedido Compra'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnLocalizarProdSug: TPanel
            Left = 3
            Top = 3
            Width = 702
            Height = 422
            TabOrder = 0
            OnEnter = pnLocalizarProdSugEnter
            object Panel4: TPanel
              Left = 1
              Top = 391
              Width = 700
              Height = 30
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtnLocalizarProdSugOK: TBitBtn
                Left = 270
                Top = 1
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtnLocalizarProdSugOKClick
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
              object BitBtnLocalizarProdSugCancel: TBitBtn
                Left = 351
                Top = 1
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtnLocalizarProdSugCancelClick
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
            end
            object GroupBoxLocalizarProdSugAlClient: TGroupBox
              Left = 1
              Top = 89
              Width = 700
              Height = 302
              Align = alClient
              Caption = 'Produtos sugest'#227'o'
              TabOrder = 2
              object DBGridLocalizarProdSug: TDBGrid
                Left = 2
                Top = 15
                Width = 696
                Height = 285
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = DBGridMontarPedidoCompraProdCellClick
                OnDrawColumnCell = DBGridMontarPedidoCompraProdDrawColumnCell
                OnKeyDown = DBGridMontarPedidoCompraProdKeyDown
                OnTitleClick = DBGridMontarPedidoCompraProdTitleClick
              end
            end
            object GroupBoxLocalizarProdSugTop: TGroupBox
              Left = 1
              Top = 1
              Width = 700
              Height = 88
              Align = alTop
              Caption = 'Localizar'
              TabOrder = 0
              object lbGrupoProd: TLabel
                Left = 9
                Top = 32
                Width = 54
                Height = 13
                Caption = 'Grupo Prod'
              end
              object lbCodProd: TLabel
                Left = 73
                Top = 32
                Width = 44
                Height = 13
                Caption = 'Cod Prod'
              end
              object lbNumFabr: TLabel
                Left = 137
                Top = 32
                Width = 75
                Height = 13
                Caption = 'Num Fabricante'
              end
              object lbDescrProd: TLabel
                Left = 299
                Top = 32
                Width = 46
                Height = 13
                Caption = 'Descri'#231#227'o'
              end
              object SpeedButtonSelTodosProd: TSpeedButton
                Left = 627
                Top = 14
                Width = 23
                Height = 21
                Hint = 'Selecionar todos'
                Flat = True
                Glyph.Data = {
                  CE010000424DCE01000000000000CE0000002800000010000000100000000100
                  08000000000000010000120B0000120B0000260000002600000000000000FFFF
                  FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                  5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                  8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                  1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                  430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                  0202020202020202020202020202020202020202020202021212020202020202
                  0202020202020212181B120202020202020202020202121F1C141D1202020202
                  02020202021223211E12171A1202020202020202122425201202121519120202
                  02020202021222120A03020212161202020202020203120C080B030202121312
                  02020202030F0E0803070903020202121202020310110D030203050803020202
                  12120202030E0302020202030603020202020202020302020202020203040302
                  0202020202020202020202020202030302020202020202020202020202020203
                  030202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonSelTodosProdClick
              end
              object SpeedButtonDesTodosProd: TSpeedButton
                Left = 656
                Top = 14
                Width = 23
                Height = 21
                Hint = 'Desfazer sele'#231#227'o'
                Flat = True
                Glyph.Data = {
                  AA010000424DAA01000000000000AA0000002800000010000000100000000100
                  08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                  FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                  AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                  9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                  8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                  02020202020202020202020202020202020202021C1C02020202020202020202
                  0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                  021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                  021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                  1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                  1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                  020202020202020202021B1B0202020202020202020202020202021B1B020202
                  0202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonDesTodosProdClick
              end
              object Label31: TLabel
                Left = 398
                Top = 14
                Width = 131
                Height = 13
                Caption = 'Pedido de compra realizado'
              end
              object EditGrupoProd: TEdit
                Left = 8
                Top = 47
                Width = 58
                Height = 21
                CharCase = ecUpperCase
                MaxLength = 6
                TabOrder = 0
                OnKeyPress = EditGrupoProdKeyPress
              end
              object EditCodProd: TEdit
                Left = 69
                Top = 47
                Width = 58
                Height = 21
                CharCase = ecUpperCase
                MaxLength = 6
                TabOrder = 1
                OnKeyPress = EditCodProdKeyPress
              end
              object EditNumFabr: TEdit
                Left = 133
                Top = 47
                Width = 161
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 2
              end
              object BitBtnLocalizarProdSugAlClient: TBitBtn
                Left = 609
                Top = 45
                Width = 75
                Height = 25
                Hint = 'Localizar produto'
                Caption = '&Procurar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = BitBtnLocalizarProdSugAlClientClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                  73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                  8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                  9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                  A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                  AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                  BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                  D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                  E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                  F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                  424242424242424242422B39180B42424242424242424242424243443C180B42
                  4242424242424242424242444438180B42424242424242424242424244433918
                  0A424242424242424242424242444335004201101A114242424242424242453D
                  05072F343434291942424242424242221A2D34343437403E0442424242424206
                  231C303437404146284242424242421B210F30373A414140310D42424242421F
                  20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                  2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                  4227312D21252314424242424242424242420E141B1B42424242}
              end
              object EditDescrProd: TEdit
                Left = 298
                Top = 47
                Width = 287
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 3
              end
              object Panel5: TPanel
                Left = 536
                Top = 14
                Width = 49
                Height = 13
                BevelOuter = bvNone
                Color = 10223541
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 5
              end
            end
          end
        end
        object tsOpcoesSug: TTabSheet
          Caption = 'Op'#231#245'es'
          ImageIndex = 7
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnOpcoesSug: TPanel
            Left = 3
            Top = 3
            Width = 486
            Height = 126
            TabOrder = 0
            OnEnter = pnOpcoesSugEnter
            object pnOpcoesSugBottom: TPanel
              Left = 1
              Top = 92
              Width = 484
              Height = 33
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 3
              object pnOpcoesSugOK: TBitBtn
                Left = 162
                Top = 2
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = pnOpcoesSugOKClick
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
              object pnOpcoesSugCancel: TBitBtn
                Left = 243
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = pnOpcoesSugCancelClick
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
            end
            object CheckMostrarUltimaVnd2: TCheckBox
              Left = 21
              Top = 38
              Width = 177
              Height = 17
              Hint = 'Mostrar '#218'ltima Venda'
              Caption = 'Mostrar '#218'ltima Venda'
              TabOrder = 1
              OnClick = CheckSugPorGradeClick
            end
            object CheckExibirTransf2: TCheckBox
              Left = 21
              Top = 61
              Width = 177
              Height = 17
              Caption = 'Exibir Transfer'#234'ncias'
              Enabled = False
              TabOrder = 2
              OnClick = CheckSugPorGradeClick
            end
            object CheckMostrarDescrRed2: TCheckBox
              Left = 21
              Top = 15
              Width = 177
              Height = 17
              Hint = 'Mostrar a descri'#231#227'o reduzida no relat'#243'rio da sugest'#227'o de Compra'
              Caption = 'Descri'#231#227'o Reduzida'
              TabOrder = 0
              OnClick = CheckSugPorGradeClick
            end
          end
        end
        object tsMontarTransferencias: TTabSheet
          Caption = 'tsMontarTransferencias'
          ImageIndex = 8
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMontarTrasferencias: TPanel
            Left = 1
            Top = 3
            Width = 856
            Height = 512
            TabOrder = 0
            object Splitter4: TSplitter
              Left = 1
              Top = 141
              Width = 854
              Height = 2
              Cursor = crVSplit
              Align = alTop
              OnMoved = Splitter4Moved
              ExplicitTop = 73
              ExplicitWidth = 718
            end
            object GroupBoxMontarTrasferenciasTop: TGroupBox
              Left = 1
              Top = 26
              Width = 854
              Height = 115
              Align = alTop
              Caption = 'Empresas'
              TabOrder = 0
              object DBGridMontarTrasferenciasTop: TDBGrid
                Left = 2
                Top = 15
                Width = 850
                Height = 98
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = DBGridMontarTrasferenciasTopCellClick
                OnDrawColumnCell = DBGridMontarTrasferenciasTopDrawColumnCell
                OnKeyDown = DBGridMontarTrasferenciasTopKeyDown
              end
            end
            object GroupBoxMontarTrasferenciasAlClient: TGroupBox
              Left = 1
              Top = 143
              Width = 854
              Height = 333
              Align = alClient
              Caption = 'Produtos sugest'#227'o'
              TabOrder = 1
              object DBGridMontarTrasferenciasAlClient: TDBGrid
                Left = 2
                Top = 15
                Width = 850
                Height = 316
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = DBGridMontarTrasferenciasAlClientCellClick
                OnDrawColumnCell = DBGridMontarTrasferenciasAlClientDrawColumnCell
                OnKeyDown = DBGridMontarTrasferenciasAlClientKeyDown
                OnTitleClick = DBGridMontarPedidoCompraProdTitleClick
              end
            end
            object pnMontarTrasferenciasAlBottom: TPanel
              Left = 1
              Top = 476
              Width = 854
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtnMontarTrasferenciasOK: TBitBtn
                Left = 347
                Top = 3
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtnMontarTrasferenciasOKClick
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
              object BitBtnMontarTrasferenciasCancel: TBitBtn
                Left = 428
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtnMontarTrasferenciasCancelClick
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
            end
            object pnMontarTrasferenciasTop: TPanel
              Left = 1
              Top = 1
              Width = 854
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 3
              object Label36: TLabel
                Left = 694
                Top = 5
                Width = 112
                Height = 13
                Caption = 'Transfer'#234'ncia realizada'
              end
              object SpeedButtonSelTodosEmpTransf: TSpeedButton
                Left = 467
                Top = 4
                Width = 23
                Height = 21
                Hint = 'Selecionar todos'
                Flat = True
                Glyph.Data = {
                  CE010000424DCE01000000000000CE0000002800000010000000100000000100
                  08000000000000010000120B0000120B0000260000002600000000000000FFFF
                  FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                  5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                  8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                  1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                  430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                  0202020202020202020202020202020202020202020202021212020202020202
                  0202020202020212181B120202020202020202020202121F1C141D1202020202
                  02020202021223211E12171A1202020202020202122425201202121519120202
                  02020202021222120A03020212161202020202020203120C080B030202121312
                  02020202030F0E0803070903020202121202020310110D030203050803020202
                  12120202030E0302020202030603020202020202020302020202020203040302
                  0202020202020202020202020202030302020202020202020202020202020203
                  030202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonSelTodosEmpTransfClick
              end
              object SpeedButtonDesTodosEmpTranf: TSpeedButton
                Left = 496
                Top = 4
                Width = 23
                Height = 21
                Hint = 'Desfazer sele'#231#227'o'
                Flat = True
                Glyph.Data = {
                  AA010000424DAA01000000000000AA0000002800000010000000100000000100
                  08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                  FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                  AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                  9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                  8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                  02020202020202020202020202020202020202021C1C02020202020202020202
                  0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                  021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                  021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                  1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                  1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                  020202020202020202021B1B0202020202020202020202020202021B1B020202
                  0202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonDesTodosEmpTranfClick
              end
              object Panel8: TPanel
                Left = 635
                Top = 5
                Width = 49
                Height = 13
                BevelOuter = bvNone
                Color = 10223541
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
              end
            end
          end
        end
        object tsOpcoesTransf: TTabSheet
          Caption = 'tsOpcoesTransf'
          ImageIndex = 9
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMontarTrasferencias3: TPanel
            Left = 1
            Top = 15
            Width = 592
            Height = 336
            TabOrder = 0
            OnEnter = pnMontarTrasferencias3Enter
            object pnMontarTrasferencias3Cliente: TPanel
              Left = 1
              Top = 1
              Width = 590
              Height = 30
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = '1 - EMPRESA 554545454545454'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object pnMontarTrasferencias3Bottom: TPanel
              Left = 1
              Top = 305
              Width = 590
              Height = 30
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 5
              object BitBtnMontarTrasferencias3OK: TBitBtn
                Left = 215
                Top = 1
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtnMontarTrasferencias3OKClick
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
              object BitBtnMontarTrasferencias3Cancel: TBitBtn
                Left = 296
                Top = 1
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtnMontarTrasferencias3CancelClick
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
            end
            object GroupBoxMontarTrasferenciasDest: TGroupBox
              Left = 1
              Top = 164
              Width = 590
              Height = 104
              Align = alClient
              Caption = 'Pedido de Compra (Destino)'
              TabOrder = 3
              object Label37: TLabel
                Left = 31
                Top = 29
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
              object Label38: TLabel
                Left = 74
                Top = 81
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label39: TLabel
                Left = 45
                Top = 56
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
              object EditMoedaFornecedor3: TEditMoeda
                Left = 106
                Top = 26
                Width = 60
                Height = 21
                Hint = 'C'#243'digo do fornecedor'
                Alignment = taRightJustify
                Enabled = False
                TabOrder = 0
                FormatReal = fInteger
                FormatSize = '10.2'
                OnExit = EditMoedaFornecedor3Exit
                OnKeyDown = EditMoedaFornecedor3KeyDown
              end
              object DBLookupComboBoxFornecedor3: TDBLookupComboBox
                Left = 167
                Top = 26
                Width = 348
                Height = 21
                Hint = 'Fornecedor'
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE'
                ListSource = dtmSugestaoCompras.dsFornec
                TabOrder = 1
                OnExit = DBLookupComboBoxFornecedor3Exit
              end
              object ComboBoxTipoPedido3: TComboBox
                Left = 106
                Top = 78
                Width = 409
                Height = 21
                Hint = 'Indica se '#233' pedido URGENTE ou NORMAL'
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 4
                Text = 'NORMAL '
                Items.Strings = (
                  'NORMAL '
                  'URGENTE')
              end
              object EditMoedaEmpFornecedor3: TEditMoeda
                Left = 521
                Top = 26
                Width = 60
                Height = 21
                Hint = 'C'#243'digo da empresa'
                Alignment = taRightJustify
                TabOrder = 5
                Visible = False
                FormatReal = fInteger
                FormatSize = '10.2'
              end
              object DBLookupComboBoxVendPed3: TDBLookupComboBox
                Left = 167
                Top = 53
                Width = 348
                Height = 21
                Hint = 'Vendedor'
                KeyField = 'COD_VENDEDOR'
                ListField = 'NOME_VENDEDOR'
                ListSource = dtmSugestaoCompras.dsVendedor2
                TabOrder = 3
                OnExit = DBLookupComboBoxVendPed3Exit
              end
              object EditMoedaVendPed3: TEditMoeda
                Left = 106
                Top = 53
                Width = 60
                Height = 21
                Hint = 'C'#243'digo do vendedor'
                Alignment = taRightJustify
                TabOrder = 2
                FormatReal = fInteger
                FormatSize = '10.2'
                OnExit = EditMoedaVendPed3Exit
                OnKeyDown = EditMoedaVendPed3KeyDown
              end
            end
            object GroupBox16: TGroupBox
              Left = 1
              Top = 268
              Width = 590
              Height = 37
              Align = alBottom
              TabOrder = 4
              object Label33: TLabel
                Left = 40
                Top = 12
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cond Pag:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object EditMoedaCondPag3: TEditMoeda
                Left = 106
                Top = 9
                Width = 60
                Height = 21
                Hint = 'C'#243'digo da condi'#231#227'o de pagamento'
                Alignment = taRightJustify
                TabOrder = 0
                FormatReal = fInteger
                FormatSize = '10.2'
                OnExit = EditMoedaCondPag3Exit
              end
              object DBLookupComboBoxCondPag3: TDBLookupComboBox
                Left = 167
                Top = 9
                Width = 348
                Height = 21
                Hint = 'Condi'#231#227'o de pagamento'
                KeyField = 'COD_COND_PAG'
                ListField = 'DESC_COND_PAG'
                ListSource = dtmSugestaoCompras.dsCondPagPed
                TabOrder = 1
                OnExit = DBLookupComboBoxCondPag3Exit
              end
            end
            object pnMontarTrasferenciasDest: TPanel
              Left = 1
              Top = 134
              Width = 590
              Height = 30
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = '2 - EMPRESA 656887879789'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object GroupBoxMontarTrasferenciasOrig: TGroupBox
              Left = 1
              Top = 31
              Width = 590
              Height = 103
              Align = alTop
              Caption = 'Transfer'#234'ncia (Origem)'
              TabOrder = 1
              object Label32: TLabel
                Left = 45
                Top = 55
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
              object Label35: TLabel
                Left = 56
                Top = 30
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
              object Label34: TLabel
                Left = 12
                Top = 80
                Width = 88
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo de Venda:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label40: TLabel
                Left = 307
                Top = 80
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Origem:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object EditMoedaVend3: TEditMoeda
                Left = 106
                Top = 52
                Width = 60
                Height = 21
                Hint = 'C'#243'digo do vendedor'
                Alignment = taRightJustify
                TabOrder = 3
                FormatReal = fInteger
                FormatSize = '10.2'
                OnExit = EditMoedaVend3Exit
                OnKeyDown = EditMoedaVend3KeyDown
              end
              object DBLookupComboBoxVend3: TDBLookupComboBox
                Left = 167
                Top = 52
                Width = 348
                Height = 21
                Hint = 'Vendedor'
                KeyField = 'COD_VENDEDOR'
                ListField = 'NOME_VENDEDOR'
                ListSource = dtmSugestaoCompras.dsVendedor
                TabOrder = 4
                OnExit = DBLookupComboBoxVend3Exit
              end
              object EditMoedaCliente3: TEditMoeda
                Left = 106
                Top = 26
                Width = 60
                Height = 21
                Hint = 'C'#243'digo do cliente'
                Alignment = taRightJustify
                Enabled = False
                TabOrder = 0
                FormatReal = fInteger
                FormatSize = '10.2'
                OnExit = EditMoedaCliente3Exit
                OnKeyDown = EditMoedaCliente3KeyDown
              end
              object EditMoedaEmpCliente3: TEditMoeda
                Left = 521
                Top = 26
                Width = 60
                Height = 21
                Hint = 'C'#243'digo da empresa'
                Alignment = taRightJustify
                TabOrder = 2
                Visible = False
                FormatReal = fInteger
                FormatSize = '10.2'
              end
              object DBLookupComboBoxCliente3: TDBLookupComboBox
                Left = 167
                Top = 26
                Width = 348
                Height = 21
                Hint = 'Cliente'
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE'
                ListSource = dtmSugestaoCompras.dsCliente
                TabOrder = 1
                OnExit = DBLookupComboBoxCliente3Exit
              end
              object ComboBoxTipoVenda3: TComboBox
                Left = 106
                Top = 77
                Width = 151
                Height = 21
                Hint = 'Tipo de Venda'
                Style = csDropDownList
                ItemHeight = 0
                TabOrder = 5
              end
              object ComboBoxOrigemVenda3: TComboBox
                Left = 356
                Top = 77
                Width = 159
                Height = 21
                Hint = 'Origem Venda'
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 6
                Items.Strings = (
                  'V - VENDAS NORMAIS'
                  'P - PROMO'#199#213'ES'
                  'D - DESCARTES'
                  'T - TRANSFER'#202'NCIA'
                  'A - AJUSTE DE INVENT'#193'RIO')
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 894
      Width = 0
      ExplicitLeft = 894
      ExplicitWidth = 0
      inherited bMarketingHW: TBitBtn
        Width = 9
        ExplicitWidth = 9
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 553
    Width = 884
    ExplicitTop = 553
    ExplicitWidth = 884
  end
  inherited PopupMenu1: TPopupMenu
    Left = 492
    Top = 17
  end
  inherited PopupMenu2: TPopupMenu
    Left = 606
    Top = 19
  end
  inherited Timer1: TTimer
    Left = 550
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 662
    Top = 19
  end
end
