inherited frmCadRegrasProgramaFidelidade: TfrmCadRegrasProgramaFidelidade
  Caption = 'Configurar Classes - Programa de Fidelidade'
  ClientWidth = 891
  ShowHint = True
  ExplicitWidth = 899
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  object Label27: TLabel [0]
    Left = 22
    Top = 50
    Width = 98
    Height = 13
    Caption = 'Quantidade vendas:'
  end
  inherited PanelFundo: TPanel
    Width = 891
    ExplicitWidth = 891
    inherited PanelLeft: TPanel
      Width = 886
      ExplicitWidth = 886
      inherited PageControl1: TPageControl
        Width = 884
        ExplicitWidth = 884
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 876
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 876
            ExplicitWidth = 876
            inherited PageControl3: TPageControl
              Width = 876
              ActivePage = tsCadastro
              ExplicitWidth = 876
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 868
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 868
                  ExplicitWidth = 868
                  inherited GroupBox1: TGroupBox
                    Width = 864
                    ExplicitWidth = 864
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 356
                  Width = 286
                  Height = 75
                  Align = alLeft
                  Caption = 'Configura'#231#227'o das Colunas'
                  TabOrder = 0
                  Visible = False
                  object ScrollBox4: TScrollBox
                    Left = 2
                    Top = 15
                    Width = 282
                    Height = 58
                    Align = alClient
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    TabOrder = 0
                    OnEnter = ScrollBox4Enter
                  end
                end
                object DBGrid2: TDBGrid
                  Left = 286
                  Top = 356
                  Width = 582
                  Height = 75
                  Align = alClient
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  PopupMenu = PopupMenu3
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnColumnMoved = DBGrid2ColumnMoved
                  OnDrawColumnCell = DBGrid2DrawColumnCell
                  OnTitleClick = DBGrid2TitleClick
                end
                object GroupBoxConfig: TGroupBox
                  Left = 0
                  Top = 34
                  Width = 868
                  Height = 283
                  Align = alTop
                  Caption = 'Configurar'
                  TabOrder = 2
                  object PanelOutros: TPanel
                    Left = 2
                    Top = 15
                    Width = 864
                    Height = 41
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object LabelOutros: TLabel
                      Left = 28
                      Top = 13
                      Width = 65
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Asseduidade:'
                    end
                    object Label14: TLabel
                      Left = 516
                      Top = 13
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pontos:'
                    end
                    object ComboBoxOutros: TComboBox
                      Left = 98
                      Top = 10
                      Width = 368
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 13
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                      OnEnter = ComboBox1Enter
                      OnExit = ComboBoxOutros2Exit
                    end
                    object EditHwPontosOutros: TEditHw
                      Left = 556
                      Top = 11
                      Width = 121
                      Height = 21
                      TabOrder = 1
                      Text = '0'
                      Formato = fNumber
                      FormatSize = '10.2'
                    end
                  end
                  object PanelOutros2: TPanel
                    Left = 2
                    Top = 56
                    Width = 864
                    Height = 41
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label17: TLabel
                      Left = 515
                      Top = 14
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dias:'
                      Visible = False
                    end
                    object Label16: TLabel
                      Left = 602
                      Top = 14
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pontos:'
                    end
                    object LabelOutros2: TLabel
                      Left = 27
                      Top = 14
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Recebimento:'
                    end
                    object ComboBoxOutros2: TComboBox
                      Left = 98
                      Top = 11
                      Width = 368
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 13
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                      OnEnter = ComboBox1Enter
                      OnExit = ComboBoxOutros2Exit
                    end
                    object EditHwDiasPercOutros2: TEditHw
                      Left = 541
                      Top = 11
                      Width = 54
                      Height = 21
                      TabOrder = 1
                      Text = '0'
                      Visible = False
                      Formato = fInteger
                      FormatSize = '0.2'
                    end
                    object EditHwPontosOutros2: TEditHw
                      Left = 641
                      Top = 11
                      Width = 121
                      Height = 21
                      TabOrder = 2
                      Text = '0'
                      Formato = fNumber
                      FormatSize = '10.2'
                    end
                  end
                  object PanelFaixaCompra: TPanel
                    Left = 2
                    Top = 97
                    Width = 864
                    Height = 109
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 2
                    object PanelFC: TPanel
                      Left = 0
                      Top = 60
                      Width = 864
                      Height = 25
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label6: TLabel
                        Left = 109
                        Top = 6
                        Width = 37
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Pontos:'
                      end
                      object EditHwPontosFC: TEditHw
                        Left = 150
                        Top = 3
                        Width = 121
                        Height = 21
                        TabOrder = 0
                        Text = '0'
                        Formato = fNumber
                        FormatSize = '10.2'
                      end
                    end
                    object PanelFV: TPanel
                      Left = 0
                      Top = 85
                      Width = 864
                      Height = 40
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 2
                      object Label19: TLabel
                        Left = 705
                        Top = 5
                        Width = 17
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'R$:'
                        Visible = False
                      end
                      object Label20: TLabel
                        Left = 109
                        Top = 6
                        Width = 37
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Pontos:'
                      end
                      object EditHwRealFV: TEditHw
                        Left = 726
                        Top = 2
                        Width = 121
                        Height = 21
                        Enabled = False
                        TabOrder = 0
                        Text = '0'
                        Visible = False
                        Formato = fMoney
                        FormatSize = '10.2'
                      end
                      object EditHwPontosFV: TEditHw
                        Left = 150
                        Top = 2
                        Width = 121
                        Height = 21
                        TabOrder = 1
                        Text = '0'
                        Formato = fNumber
                        FormatSize = '10.2'
                      end
                    end
                    object PanelFCFV: TPanel
                      Left = 0
                      Top = 0
                      Width = 864
                      Height = 60
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label7: TLabel
                        Left = 70
                        Top = 13
                        Width = 76
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Condi'#231#227'o inicial:'
                      end
                      object Label9: TLabel
                        Left = 444
                        Top = 13
                        Width = 109
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor de compra inicial:'
                      end
                      object Label12: TLabel
                        Left = 75
                        Top = 40
                        Width = 71
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Condi'#231#227'o final:'
                      end
                      object Label13: TLabel
                        Left = 449
                        Top = 40
                        Width = 104
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor de compra final:'
                      end
                      object ComboBoxCondInicialFaixaCompra: TComboBox
                        Left = 150
                        Top = 10
                        Width = 121
                        Height = 21
                        Style = csDropDownList
                        ItemHeight = 13
                        ItemIndex = 0
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 0
                        Text = 'Maior igual'
                        OnEnter = ComboBox1Enter
                        OnExit = ComboBox1Enter
                        Items.Strings = (
                          'Maior igual'
                          'Maior')
                      end
                      object EditHwValorIniFaixaCompra: TEditHw
                        Left = 556
                        Top = 10
                        Width = 121
                        Height = 21
                        TabOrder = 1
                        Text = '0'
                        Formato = fMoney
                        FormatSize = '10.2'
                      end
                      object ComboBoxCondFinalFaixaCompra: TComboBox
                        Left = 150
                        Top = 37
                        Width = 121
                        Height = 21
                        Style = csDropDownList
                        ItemHeight = 13
                        ItemIndex = 0
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 2
                        Text = 'Menor igual'
                        OnEnter = ComboBox1Enter
                        OnExit = ComboBox1Enter
                        Items.Strings = (
                          'Menor igual'
                          'Menor')
                      end
                      object EditHwValorFimFaixaCompra: TEditHw
                        Left = 556
                        Top = 37
                        Width = 121
                        Height = 21
                        TabOrder = 3
                        Text = '0'
                        Formato = fMoney
                        FormatSize = '10.2'
                      end
                    end
                  end
                  object PanelProduto: TPanel
                    Left = 2
                    Top = 247
                    Width = 864
                    Height = 70
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 3
                    object Label10: TLabel
                      Left = 17
                      Top = 16
                      Width = 77
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Num fabricante:'
                    end
                    object Label8: TLabel
                      Left = 316
                      Top = 16
                      Width = 33
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Grupo:'
                    end
                    object Label11: TLabel
                      Left = 421
                      Top = 16
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cod Prod:'
                    end
                    object Label15: TLabel
                      Left = 573
                      Top = 16
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pontos:'
                    end
                    object Label18: TLabel
                      Left = 44
                      Top = 43
                      Width = 50
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o:'
                    end
                    object EditNumFabProduto: TEdit
                      Left = 98
                      Top = 13
                      Width = 206
                      Height = 21
                      CharCase = ecUpperCase
                      TabOrder = 0
                      OnExit = EditNumFabProdutoExit
                      OnKeyDown = EditNumFabProdutoKeyDown
                    end
                    object EditGrupoProduto: TEdit
                      Left = 352
                      Top = 13
                      Width = 56
                      Height = 21
                      CharCase = ecUpperCase
                      Enabled = False
                      TabOrder = 1
                    end
                    object EditCodProduto: TEdit
                      Left = 471
                      Top = 13
                      Width = 86
                      Height = 21
                      CharCase = ecUpperCase
                      Enabled = False
                      TabOrder = 2
                    end
                    object EditHwPontosProduto: TEditHw
                      Left = 616
                      Top = 14
                      Width = 121
                      Height = 21
                      TabOrder = 3
                      Text = '0'
                      Formato = fNumber
                      FormatSize = '10.2'
                    end
                    object EditDescricaoProduto: TEdit
                      Left = 98
                      Top = 40
                      Width = 639
                      Height = 21
                      CharCase = ecUpperCase
                      Enabled = False
                      TabOrder = 4
                      OnExit = EditNumFabProdutoExit
                      OnKeyDown = EditNumFabProdutoKeyDown
                    end
                  end
                  object PanelKit: TPanel
                    Left = 2
                    Top = 206
                    Width = 864
                    Height = 41
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 4
                    object Label21: TLabel
                      Left = 77
                      Top = 13
                      Width = 16
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Kit:'
                    end
                    object Label22: TLabel
                      Left = 516
                      Top = 13
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pontos:'
                    end
                    object EditHwPontosKit: TEditHw
                      Left = 559
                      Top = 11
                      Width = 121
                      Height = 21
                      TabOrder = 2
                      Text = '0'
                      Formato = fNumber
                      FormatSize = '10.2'
                    end
                    object EditHwKit: TEditHw
                      Left = 98
                      Top = 11
                      Width = 54
                      Height = 21
                      TabOrder = 0
                      Text = '0'
                      OnExit = EditHwKitExit
                      OnKeyDown = EditHwKitKeyDown
                      Formato = fInteger
                      FormatSize = '0.2'
                    end
                    object EditKit: TEdit
                      Left = 156
                      Top = 11
                      Width = 354
                      Height = 21
                      Enabled = False
                      TabOrder = 1
                    end
                  end
                end
                object GroupBox18: TGroupBox
                  Left = 0
                  Top = 317
                  Width = 868
                  Height = 39
                  Align = alTop
                  TabOrder = 3
                  object BitBtnExcluirConf: TBitBtn
                    Left = 274
                    Top = 10
                    Width = 75
                    Height = 25
                    Hint = 'Excluir configura'#231#227'o - [FID007]'
                    Caption = 'Excluir'
                    TabOrder = 1
                    OnClick = BitBtnExcluirConfClick
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
                  object BitBtnNovoConf: TBitBtn
                    Left = 196
                    Top = 10
                    Width = 75
                    Height = 25
                    Hint = 'Nova confiura'#231#227'o - [FID006]'
                    Caption = 'Novo'
                    TabOrder = 0
                    OnClick = BitBtnNovoConfClick
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
                  object BitBtnSalvarConf: TBitBtn
                    Left = 351
                    Top = 10
                    Width = 75
                    Height = 25
                    Hint = 'OK - [FID008]'
                    Caption = '&OK'
                    TabOrder = 2
                    OnClick = BitBtnSalvarConfClick
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
                  object BitBtnCancelarConf: TBitBtn
                    Left = 429
                    Top = 10
                    Width = 75
                    Height = 25
                    Hint = 'Cancelar'
                    Caption = '&Cancela'
                    TabOrder = 3
                    OnClick = BitBtnCancelarConfClick
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
                  object BitBtnVoltarConf: TBitBtn
                    Left = 505
                    Top = 10
                    Width = 75
                    Height = 25
                    Hint = 'Voltar a tela anterior'
                    Caption = '&Voltar'
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 4
                    OnClick = BitBtnVoltarConfClick
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                      03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                      972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                      00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                      4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                      E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                      03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                      9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                      2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                      A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                      01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                      8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                      993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                      02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                      00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  end
                end
                object Panel4: TPanel
                  Left = 0
                  Top = 0
                  Width = 868
                  Height = 34
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'REGRA 1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -21
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 4
                end
              end
            end
            inherited Panel3: TPanel
              Width = 876
              Visible = False
              ExplicitWidth = 876
              inherited LabelSeq: TLabel
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Left = 56
                Visible = False
                ExplicitLeft = 56
              end
              inherited BitBtn5: TBitBtn
                Left = 137
                Visible = False
                ExplicitLeft = 137
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair'
              end
              inherited CheckCadSeq: TCheckBox
                Visible = False
              end
              object BitBtn109: TBitBtn
                Left = 352
                Top = 10
                Width = 75
                Height = 25
                Hint = 'Voltar a tela anterior'
                Caption = '&Voltar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = BitBtn109Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                  03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                  972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                  00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                  4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                  E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                  03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                  9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                  2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                  A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                  01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                  8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                  993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                  02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                  00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 876
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 876
            ExplicitWidth = 876
            inherited imgInformation: TImage
              Left = 850
              ExplicitLeft = 850
            end
            object SpeedButton55: TSpeedButton [6]
              Left = 821
              Top = 45
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
              OnClick = SpeedButton55Click
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [FID002]'
            end
            inherited BitBtn3: TBitBtn
              Visible = False
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 876
            ExplicitWidth = 876
            inherited DBGrid1: TDBGrid
              Width = 583
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 872
              ExplicitWidth = 872
              inherited SpeedButton1: TSpeedButton
                Left = 64
                Hint = 'Configurar - [FID003]'
                Glyph.Data = {
                  F2050000424DF205000000000000B20300002800000018000000180000000100
                  08000000000040020000120B0000120B0000DF000000DF00000000000000FFFF
                  FF00908E9100FF00FF00D5A9A900AF959500B2989800A7909000A5929200A390
                  9000A08F8F00998A8A009D8F8F0093878700938A8A0089828200908989008C87
                  87007D7A7A007D7B7B007B7979009C9A9A0089878700F2F0F000E9E7E700E0DE
                  DE00C9C7C700BFBDBD007F7E7E00F3F2F200EAE9E900DEDDDD00B8B7B700A6A5
                  A5008C8B8B006DE5FF0079E7FF007FE9FF0080E6FC0083EAFF0043D9FF00369D
                  B7004EDCFF0062E1FF0054BFDA005DD1ED006AE1FF004893A6006FDCF70074E3
                  FF0075E3FF0075E6FF0077E1FA007BE2FB0083E6FF005B9FAF0093EAFF0095EA
                  FF007DBBC900A5EEFF00AFEFFF00B7F2FF00BAF2FF0010BAEB0012C9FE0013C9
                  FE0015CAFE0018CAFE001ACCFE001CCCFE001DCCFE001FCEFE0023CEFE0023C2
                  F00029D1FE002BD0FE002FD1FE0028A6C90033D4FE0035CEF70037D4FE003BD5
                  FE0044D7FE003FBADA0045C6EA004DD9FE0052DAFF0049BCDA005BDDFF005CDD
                  FF004DB6D10058CBEA0064D3F3006BD8F6007AE3FF0084E6FF005589970006C4
                  FE0006B1E9000BC6FE000BBFF4000CC6FE000FC7FE0016C4F7001ABDF00029B8
                  E2003BBBE20041ABCE0054C9EE004EB8D90058CBEF005CCEF0005FD0F2005ECA
                  EA0067CCEA0090D5EA0006ABE2000693C700099ACE000BACE2000F9DCE00158E
                  BB001693C1001893C1001EA7D500219DC900229CC70027A4CE002DABD5002D9A
                  C2002F9CC4002E98BF003FBAE70040BAE7003AA7CF0042BCE90046BFEA0049C1
                  EB004DC4ED0051C6EE0051A9C90076C2DC000689BD00078BBF000782B4000D8A
                  BB000C7FAD000F7AA7001180AD001681AD001882AD001C8AB5001A7EA7001C7E
                  A7001F8BB500208AB50028A9DE002084AD002CA9DC002EADE1002382A60032B0
                  E20035B2E30038B5E5003BB7E600459FC1007F8486000777A700076F9F000978
                  A7000973A100096D9C000A78A7000A72A1000B78A7000A6D9A000C79AC000C6D
                  9A000D74A3000E74A1001496D3001179A900169AD700117AA7001380B0001176
                  A100189CD800137AA700137BA7001B9ED9001C9FD9001B90C2001FA1DA0022A4
                  DC001A7DA70025A6DD00056695000973A500096D9E000A75A9000A73A5000B78
                  AC000D7FB5000B6D9C00118CC600128FCA001699D700888A8E00D3D3D300BDBD
                  BD00B2B2B200AFAFAF00A9A9A9009D9D9D009999990096969600939393008E8E
                  8E008989890087878700838383007E7E7E007777770003030303030303030303
                  C4AE79C403030303030303030303030303030303030303039149697DC4030303
                  03030303030303030303C47E7AAAC4A778AC7B93ABC4B98386C4030303030303
                  0303B77F7C68777690404C80975B276D81C40303030303030303C4826BBC90A9
                  67654852959A98A58DC40303030303C4CB9BB36F3533544F4765435059723C3E
                  3E99B5C4030303C23871BB8B30252B284A40664B553238365692859EAD0303B1
                  B2B0BF885C26232A4E446342454161616162758FA80303C4B4CEC1A46E34242D
                  372F60293F616161616161618E0303C4C7CEBDA18A5D3ADA21D71009CF4D6161
                  61616174C40303C49DCCB69C8770A619D1D710060402646146516AC6C40303C4
                  CACECEC0A36CD718D1D7100604055A5E3B3E3E8CC40303C4C9CDCEBA9F89D718
                  D1D7100604052C2E393D73A5C403030303C4C7CEC384D718D1D7100604055758
                  5FC2C403030303030303C5CEBEA2D718D1D710060405535531AF030303030303
                  0303C4C5C8B8D718D1D710060405A09496C4030303030303030303030303D718
                  D1D71006040503030303030303030303030303030303D718D1D7100604050303
                  0303030303030303030303030303D7D3DCDD13120B0703030303030303030303
                  030303030303DE1520D5160C0A1403030303030303030303030303030303D91D
                  D0D2D811080D03030303030303030303030303030303DB171E1AD4220E0F0303
                  030303030303030303030303030303D91F191BD61C0303030303030303030303
                  0303030303030303DEDEDEDE03030303030303030303}
                ExplicitLeft = 64
              end
              inherited SpeedButton2: TSpeedButton
                Left = 463
                Enabled = False
                Visible = False
                ExplicitLeft = 463
              end
              inherited SpeedButton3: TSpeedButton
                Left = 576
                Enabled = False
                Visible = False
                ExplicitLeft = 576
              end
              inherited SpeedButton4: TSpeedButton
                Left = 406
                Visible = False
                ExplicitLeft = 406
              end
              inherited SpeedButton5: TSpeedButton
                Left = 520
                Enabled = False
                Visible = False
                ExplicitLeft = 520
              end
              inherited SpeedButton6: TSpeedButton
                Left = 7
                Hint = 'Editar Registro - [FID009]'
                Enabled = False
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000010000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330000000000000000000000000000000000000000
                  333333330036322F2D2C2825252221211F1D1D1A1A1717003333333300363636
                  3232322F2F252221211F1D1D1A1A17003333333300363636363632322F2F2525
                  21211F1D1D1A1A00333333330036271616161616160710161616161616161A00
                  3333333300363636363636363609051110252525251D1D003333333300362716
                  1616161616242035300F16161616250033333333003636363636363636363435
                  30300D2525252500333333330036271616161616161616233130300F16162500
                  33333333003636363636363636363232233130300B2525003333333300362716
                  161616161616161616233130300F250033333333003636363636363636363232
                  2F2F233130300D003333333300362A1B1B1B1B1B1B1B1B1B1919182331301E07
                  333333330036363636363636363636363632322F232613120733333300363636
                  36363636363636363632322F2F0C362B0A083333003636363636363636363636
                  3632322F2D2D141C113033330102020202020202020202020202020202020215
                  2E3033330E0000000000000000000000000000000000000E2929333333040404
                  0404040404040404040404040403063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                Visible = False
                OnClick = SpeedButton6Click
                ExplicitLeft = 7
              end
              inherited SpeedButton7: TSpeedButton
                Left = 348
                Enabled = False
                Visible = False
                ExplicitLeft = 348
              end
              inherited SpeedButton8: TSpeedButton
                Left = 290
                Hint = 'Lan'#231'amento retroativo - Prog Fidelidade'
                Enabled = False
                Glyph.Data = {
                  56050000424D5605000000000000160300002800000018000000180000000100
                  08000000000040020000120B0000120B0000B8000000B8000000FF00FF00E3C2
                  C600B68E8A0092695900E9DCD400735E4C00958A7800726B4B00C6C0A4004D5C
                  35002D461600234612003E6A3000124508004E87420096B79000094102004F8B
                  49000546020007490300024300000084000000830000007D0000007500000074
                  000000520000005100000049000000480000004400000040000000350000018E
                  0100176B1600018B030001830400035404000F5F100003930900039009000B95
                  1100086C0D0006990F00079812000C7413000A9F19000D97180001680D00028A
                  12000CA01C000A6B1400117B1C000EA323000FA924000D911F00017513000167
                  12000A741C000D8F230011B12C000AA1250011B12D0011B02D0011A92C000B6A
                  1C0013B02F00159D2D0018A432001CAF3B0017B43A001CBB41000256170030E3
                  5F00076520000B9630001EC14A002ED55B0037DC650047FE7B001ACC510020C7
                  520024C9550026CE5A0028D15C0035E76B0034E0670037E56B003AEA6F003FF2
                  760041F4750046FF7F0014B2460023D15B002BD763002DD5620030DE680030DD
                  690035E76F003CF0760041FB7E0041F4790043F87E0045FB7E0047FE81001C9E
                  4A0032DC6C0047FF86004DFF8A0051FF930002532200047E3500035323001FC0
                  5F002BCF6A002ACB6E0032CA750027BB6C0036BA74000968370034CC7E000F6D
                  430022AA6F0040D493000F8F6300179D720044C1990021A17F0054CCB500CAFB
                  FF00D8FBFF0066B0BA00A7E5F00096EDFE0095EAFB00B7F0FB00CAF6FF0011D0
                  FF002ED7FF0036D7FC004EDEFF004CBDD80070E2FF00A4EDFE00C5F4FF000FCE
                  FF0013C9FC0019B1DA0065D7F70064CEEB0095DEF200C0F0FE000CC0FB0049C9
                  F20048C6EF005BD3F7000AB2EB0036AAD1003CB7E3000BB7F8000FB4F4000FAC
                  E9001C9ED30023A3D80030B0E6001195CF0016A1E0001DA1DA0026A9E200CFF0
                  FF000FA1E9001598DA0018A0E60020A4E90032B4F60013A1ED00004B8200004A
                  810000477B0000467A000045790000427300FFFFFF0000000000000000000000
                  1C1C00000000000000000000000000000000000000001C1C1A1C1C1C00000000
                  0000000000000000000000001C1C1815151C24181C1C1C000000000000000000
                  000000001C242321211C23161719301CB000000000000000000000001C272827
                  271C316F481B38B1AEB2200000000000000000001C2C2C2B2B1C7DB1B5706EB2
                  ADB1391DB0B00000000000001C322E2E2E1C7FB08BB3B3A1A6A2B0B094B00000
                  000000001C363536361C3DB29A8A919FAAACA89E9DB00000000000001C42403F
                  3F1C4B79B28C93B2B1B0ABA8B0000000000000001C46463C6983B1B2869BB32A
                  293BB0ACA3B0B000000000001C4C473E76B082888795B433372FB1AFA7A499B0
                  000000001C514C4C4C1CB0B0878FB34A4177B2A0A5B0B000000000001C535253
                  531C507AB08196B3B4B39298B0000000000000001C5E545E531C78B09797888F
                  8E8C8A919CB00000000000001C605F61611C80B097B0B084858DB0B089B00000
                  000000001C555662611C7BB0B07175B090B05C7CB0B00000000000001C635763
                  631C6473724974B0A9B05D1C00000000000000001C66656B6B1C6D4F5A586A7E
                  B078551C00000000000000001C665647341C454D5A6866586157591C00000000
                  000000001C66260C0F0F11223A434D595B66671C0000000000000000101F0505
                  0201B604080E222D444E6C1C000000000000000000001012100B090601040803
                  0A251C1C00000000000000000000000000001E100D0907100000000000000000
                  0000000000000000000000000010141300000000000000000000}
                Visible = False
                ExplicitLeft = 290
              end
              inherited SpeedButton11: TSpeedButton
                Left = 121
                Hint = 'Simular - [FID011]'
                Glyph.Data = {
                  E6040000424DE604000000000000A60200002800000018000000180000000100
                  08000000000040020000120B0000120B00009C0000009C00000000000000FFFF
                  FF00FF00FF00FFFEFF0042171800BD4B4C00E5ADAD00FFFCFC00FFFEFE00FFFC
                  FB008C381600874F3500FFFAF700BB530B00B65C2200FFFCFA00CB5C0700C75B
                  0A00C5692700995F3500FFF8F300D9782800FFFAF600DD6C0A00F3A96600FFF0
                  E200FFF4EA00FFF7F000FFF8F200E9872800FBAF6600FFCC9800FECC9900FECF
                  9F00FED1A400FED4A900FED5AC00FFD8B000FFDAB400FFDAB500FEDAB500FEDA
                  B600FFDCB800FFDDBA00FFDEBC00FFDEBD00FFE0C100FFE3C700FFE7CF00FFE9
                  D300FFEBD700FFF2E500FFF3E700FEF2E600FFF4E900FFF6ED00FFF7EF00FFFB
                  F700FECB9600FECC9800FECE9900FECE9A00FECE9C00FECF9C00FECF9D00FFD0
                  9F00FECF9E00FED09F00FED0A000FED1A100FED3A300FFD3A500FED3A400FFD4
                  A700FED3A600FED4A700FED5A900FED5AA00FFD7AC00FFD8AD00FED7AD00FED8
                  AF00FED9B000FED9B100FED9B200FEDCB600FFDDB800FEDCB700FEDDB800FEDD
                  BA00FEDEBB00FEDEBC00FFE0BF00FEE0BF00FFE1C100FFE1C200FFE2C200FFE2
                  C400FEE2C400FEE3C500FFE5C900FFE6CB00FEE5CA00FEE6CB00FEE6CC00FFE7
                  CE00FEE7CE00FFEAD300FFEAD400FEEAD400FFEEDC00FFEFDE00FFF0E000FEF0
                  E100FFF3E600FEF2E500FEF4E900FFF7EE00FED8AC00FEE0BD00FEE1BF00FEE1
                  C000FFE5C700FFE9CF00FFEAD100FEE9D000FEEBD500FFEDD800FFF2E200FFF3
                  E500FFF6EB00FFF8F000FFFAF400FEEEDA00FFF6EA00FFF7ED00FFFBF600FFFC
                  F800FEF6EB00FEF7ED00FFFAF300E3AF5D00FEFAF200FFFEFC00FFFEFB000081
                  0000052E050082CB82008FC1F8000C2D56001F81FF003553C700AFBDFA00001E
                  FF00041163005858580002020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020A0A0A0A0A0A0A0A0A0A0A0A0A0A
                  0A0A0A0A0A0A0A0A0A0A0A3673706E7E7C677A6077582725244B4844403D1F3A
                  3A0A0A8A34806F9B6D7D659B2E2C579B4F4D4A9B433F209B3A0A0A751A9B9B9B
                  9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B0A0A838B9B817098999A689391922A
                  060504499496953C3B0A0A8C9B9B341998999A309391925A0605044C9496953E
                  200A0A881C9B863598999A319391925D0605044E949695423D0A0A399B9B3774
                  98999A6C9391925E0605045194969541400A0A0F0C9B388298999A7F93919261
                  5C5A555494969545210A0A079B9B1C8798999A859391922F5F77592794969522
                  440A0A8F099B841B98999A6F9391926763795B579496954A460A0A039B9B8814
                  98999A71939192696461785A29537623470A0A01089B898898999A339391927D
                  682F5F2D56265124490A0A019B9B0F39143882349391926C7B6663795A575450
                  4D0A0A01019B900F168E751A72716E326B6A64625D2B28524E0A0A8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D0A0A0D101010101010101010101010
                  101E1D171E1D13970D0A0A0E121212121212121212121212121815111E150B97
                  0E0A020A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A02020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02020202020202020202}
                OnClick = SpeedButton11Click
                ExplicitLeft = 121
              end
              inherited SpeedButton12: TSpeedButton
                Left = 178
                Hint = 'Ativar - [FID004]'
                Glyph.Data = {
                  96040000424D9604000000000000560200002800000018000000180000000100
                  08000000000040020000120B0000120B0000880000008800000000000000FFFF
                  FF00FF00FF00BADCFF00C1E0FF00CBE5FF00D3E9FF00DDEEFF007DBAFF0088C0
                  FF008AC1FF008CC2FF008FC4FF0091C5FF0096C9FF0098CAFF009DCCFF009FCE
                  FF00A1CFFF00A6D1FF00A9D3FF00ABD4FF00ADD5FF00B5D9FF00C6E2FF00C9E3
                  FF00D0E7FF00EAF4FF00328EFF00348FFF003590FF003791FF003992FF003B93
                  FF003D95FF003F96FF004197FF004298FF00469AFF004A9DFF004C9EFF0050A0
                  FF0052A1FF0054A3FF0058A5FF005AA6FF005EA9FF0065ACFF0067ADFF0069AF
                  FF006BB0FF006FB2FF0072B4FF0076B6FF0083BDFF000E74FF000F75FF000F69
                  E3001176FF000F68E1000F67DE000F66DC001277FF000F62D1000F5FCC001378
                  FF000F5CC5001579FF00167AFF00187BFF00197DFF001B7EFF001C7FFF001F81
                  FF002182FF002383FF002484FF002686FF002887FF002988FF002D8AFF00308C
                  FF000167FF000268FF000369FF00046AFF00056BFF00066CFF00076DFF00086E
                  FF000A70FF000F60CF000064FF000062F800005FF300005EF000005DEE00005C
                  EB00005BE900005AE6000059E3000058E1000057DE000056DC000055D9000054
                  D7000052D1000051CF000050CC00004FCA00004EC700004DC500004CC200004B
                  C000004ABD000049BB000048B8000047B6000045B1000043AC000042AA000041
                  A7000041A5000040A300003FA000003E9E00003B9700003A9500003992000038
                  900000378E00003589000034840000338200003280000166FF00020202020202
                  0202868686868686868602020202020202020202020202028686827D78777778
                  7D8286860202020202020202020282858076706E6F70706F6E70757E86860202
                  02020202028282796E6F7273747272727273706C78858602020202028281776D
                  7274695564747372727272726C778486020202027F786E727274600F0B5F7473
                  72727272736C7886020202827B7072727274660A011555747372727272726D7E
                  8602027D756E6E6D6C71630A0101033A7073727272726F76860278796C686663
                  62685D0D0101011B226A74737272726F81865B73625F5D5C875E570F01010101
                  013064747372726E7C865B6B535657595A553811010101010101365C7272726F
                  78865B6344473E434538481301010101010101035273736F77863F5C1E254D4C
                  4E495016010101010101010F5C73736F77865B5C2832231D1F51211701010101
                  01012C677473726F78865B612A0C312627242703010101011B296D747372726E
                  7C865B6C251012312E2B2D040101010520687272727272708286023C450B1812
                  08312F040101144A5E656C7272726F768602025B642F030615352F0501134B54
                  5C626C7272726D7F860202023C370B1A071308030E4F37595C636D72726C7A86
                  020202025B39440C1907030D2C50473758535E686C79857E02020202025B3B3A
                  34150505170D352E291C376379847E020202020202025B3D634D2F0910100B33
                  2643677B837E020202020202020202025B7569523E46415666767E7E02020202
                  020202020202020202025B5B5B40425B5B5B0202020202020202}
                OnClick = SpeedButton12Click
                ExplicitLeft = 178
              end
              inherited SpeedButton23: TSpeedButton
                Left = 235
                Hint = 'Desativar - [FID005]'
                Glyph.Data = {
                  AA050000424DAA050000000000006A0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000CD000000CD00000000000000FFFF
                  FF00FF00FF004B1E1E004A1E1E004F1F1C004D1F1C004C1F1D0052211C005121
                  1B00542319005C25160065281500642815006228160060271600692A1300742D
                  1000702D11006D2C12006C2B12006E2D130088350A0081340C0080340D007F35
                  1000953B070091390800913A0900903809008E3809008B37090082350C00843B
                  1400AC450300A7430300A5420300A9440400A34104009F4004009D3E05009A3F
                  0500993D0600973D0700963D0700A4440800923C0800CE510000CE520000CC51
                  0000CA500000CA510000C9510000C7500000C64F0000C54E0000C54F0000C44E
                  0000C44F0000BF4D0000BD4B0000BD4C0000BC4B0000BC4C0000BB4A0000BB4B
                  0000BA490000BD4C0100BD4E0100B2470100C0500200BF4F0200BD4E0200B147
                  0200AF460200C0500300C0510300B4490300B2490300B44E0900AF531300A151
                  1C00C1530300C0520300C0520400C0530400C5570600C4570700C55B0900CA5B
                  0A00C65C0C00B1500B00C75D0D00C75E0D00BC590F00BB5B1200BC5B1300AD52
                  1100BA591300C1631B00BA682C00CC5F0A00CB621000C9621000CB651300C562
                  1300D46B1600CC671600CE681700CE691700D36D1A00D16C1C00CB6A1B00D16D
                  1D00C1641B00D3702000CF6F2000D4732200D4732300D4762700D8782A00BA66
                  2400D97A2B00D97A2C00CF742A00DA7D2E00CF762D00D57D3300D37B3300C576
                  3700C4773900C97D3E00DA7D2D00DA7E2D00D97D2D00D9813300D17B3100D881
                  3400E0873900E2893C00E1893B00E0883B00E1893C00E18E4200E6914500D787
                  4200E7934800E7934900E7954900E2934B00ED9D5400EB9C5300DA904D00EE9D
                  5500E6995200EE9E5600ED9E5600EE9F5700E6995500E3995700E79F5E00F4AA
                  6500EAA36300EBA66900E1A16800F3B07400EFB17700E5AB7500F2B67E00EBB2
                  7D00F6BB8600E29D5C00F3AB6700FAB26E00F4AF6D00F4B06E00EFAF7200FBBB
                  7A00EBAF7500FBBD8000EAB58100EAB88800F8C59200F6C49500F7C69700F2C4
                  9500F3C79C00F0C59A00F2C69C00FED5AC00EEC7A100F8D0A900F4CCA600F3CC
                  A700FAD3AC00FAD5B100FBDDBF00F6D9BD00FAE5D000FCE7D300FEEEDE00F8DD
                  C100FAE3CB00FBE5CE00FCEAD700020202020202020204040404040404040202
                  02020202020202020202020204040F181A28282C200D03040202020202020202
                  02020F0914263935363A3936353925110606020202020202020F0F2E34363E40
                  423E3E3E3E3E3A312B090602020202020F102A333B413E3E3E3E3E3E3E3E3E3F
                  302A0806020202021229353C3E3E3E3E3E3E3E3E3E3E3E3E402F2B070202020F
                  1F393D3E3E3F3E3E3E3E3E3E3E3E3E3E3E3E3211070202172238474B553D4644
                  3D3E3E3E3E3E3E3E3E4137230702291C5256585A5D5601010101010101013E3E
                  3E3E3E360C04292D6567686B6D6601010101010101013E3E3E3E3E352004295B
                  6A6F7173766E01010101010101013E3E3E3E3E361A04295F8589787B7D840101
                  0101010101013E3E3E3E403728042763959F8D8A8B8C01010101010101013C3E
                  3E3E403728042972A0A99A9094920101010101010101433E3E3E3E361A042960
                  A2BCA6969C9B0101010101010101483E3E3E3E351804294F9EC0BFA5ACA10101
                  0101010101014B3F3E3E3C390E0402497FB7CABFB3ADAE99938C84756C5C533F
                  3E4136240402022C5EB0C4CCBDB1AF9D938E86756C5C543F3E3C321304020202
                  457CB6C7C8C2AA97908A7A736B5A4C3E3D311E07020202022C4D80B8CBC8C9BA
                  A38F877774706957311D051502020202022C4E7EA8C3C6C6C5BEB5A7A4987759
                  1B0A15020202020202022C4A6291B2B9C0C1BBB4AB8850190B15020202020202
                  020202022C256179818382645121151502020202020202020202020202022C2C
                  2C1B162C2C2C0202020202020202}
                OnClick = SpeedButton23Click
                ExplicitLeft = 235
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 406
                Enabled = False
                Visible = False
                ExplicitLeft = 406
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 876
          ExplicitHeight = 510
          inherited pnMemo: TPanel
            object Label25: TLabel [1]
              Left = 24
              Top = 80
              Width = 3
              Height = 13
            end
            inherited listGrid: TListBox
              Align = alRight
            end
          end
        end
        object tsSimulacao: TTabSheet
          Caption = 'tsSimulacao'
          ImageIndex = 3
          object ScrollBox5: TScrollBox
            Left = 0
            Top = 0
            Width = 876
            Height = 510
            Align = alClient
            BevelInner = bvSpace
            TabOrder = 0
            object GroupBox5: TGroupBox
              Left = 0
              Top = 0
              Width = 872
              Height = 48
              Align = alTop
              Color = clBtnFace
              ParentColor = False
              TabOrder = 0
              object Label23: TLabel
                Left = 14
                Top = 20
                Width = 70
                Height = 13
                Caption = 'Data Inicial:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label24: TLabel
                Left = 201
                Top = 20
                Width = 63
                Height = 13
                Caption = 'Data Final:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object MaskEditIniSim: TMaskEdit
                Left = 87
                Top = 17
                Width = 80
                Height = 21
                EditMask = '!99/99/0000;1;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MaxLength = 10
                ParentFont = False
                TabOrder = 1
                Text = '01/08/2011'
              end
              object MaskEditFimSim: TMaskEdit
                Left = 270
                Top = 17
                Width = 80
                Height = 21
                EditMask = '!99/99/0000;1;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MaxLength = 10
                ParentFont = False
                TabOrder = 2
                Text = '02/08/2011'
              end
              object BitBtnVoltarSim: TBitBtn
                Left = 790
                Top = 15
                Width = 75
                Height = 25
                Hint = 'Voltar a tela anterior'
                Caption = '&Voltar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BitBtnVoltarConfClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                  03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                  972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                  00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                  4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                  E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                  03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                  9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                  2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                  A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                  01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                  8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                  993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                  02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                  00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object BitBtnSimularSim: TBitBtn
                Left = 514
                Top = 15
                Width = 120
                Height = 25
                Hint = 'Iniciar Simula'#231#227'o  - [FID012]'
                Caption = '&Iniciar Simula'#231#227'o'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = BitBtnSimularSimClick
                Glyph.Data = {
                  1E030000424D1E030000000000001E0200002800000010000000100000000100
                  08000000000000010000120B0000120B00007A0000007A0000000A067F003D26
                  9000E1D4FF004B2D7D0058357000FF00FF0073414F0084444C00D5555800924C
                  4E0066373800864A4B008E4B4A00EB726E00F07B7600EB7368009C554F00824C
                  4700F2796D009E3D0100BC4B0000FFFFD500FEFFEA004B4F3C00C5E3C5003273
                  3700189E350075B6830079B6860065A67400408354000D6A2B00199841002892
                  4F0069A68100AFD7BF00A5D9BB0014904B009CD3B60097D0B500439F93005191
                  8E00387679004E8B8E0022A4AF0027CEE500A0C7CC003CE1FC0016D1F80032C5
                  E30002CAF60009D0FF0011BFE90017BFE9001AADD700126A830001A5DE0003A7
                  DE0005A3D800189CCA0015749700F4FCFF000096D1000097D100115773001C89
                  B500008ECB000072AD00027BB500056DA3000673A900006AA5000068A100016A
                  A100046AA000005E9700003F6700035D9500065F9500005D9900005692000052
                  8A00005088000150870003538B00004F870000457A000150890000447A001A43
                  65000B66B5001C55980087A6DD00182E6400C4D5FF000B38AF0087A6FF004D6D
                  CC007998FF001D43E2001C42DD0000177B00011B9C002E50EB003F5BD8005E74
                  E2006C7FDA00889DFA00173CFC003450E6000A28EA002D45DE000013BB00051E
                  ED000011ED00000DFB00010DAD002028B1002324A0003F3FAA00FFFFFF000000
                  00000505050505050505050552525105050505050505050505525252363A3F52
                  5805050505050505524A4B4131353948555205050505050552525252524E5350
                  383E0505110A0A0A524549474F574D343305050610090C0B5252525252563B2D
                  37050004120D080754464443522A282E13130069030E0F192C2F303242611E1D
                  2613005E6701171A20253C5A215B5F221F130577606C7066655D6A6815166D02
                  78130505766F717274592B635C6B64291F1305050575000013181B406E734C1C
                  23130505050505051378271F3D621F2478130505050505051314141414141414
                  1413050505050505051313131313131313050505050505050505050505050505
                  0505}
              end
              object ckDet: TCheckBox
                Left = 374
                Top = 19
                Width = 130
                Height = 17
                Caption = 'Detalhado'
                TabOrder = 3
              end
              object BitBtnLancRetroativo: TBitBtn
                Left = 640
                Top = 15
                Width = 120
                Height = 25
                Hint = 'Realizar lan'#231'amentos reatroativos conta corrente - [FID025]'
                Caption = 'Lanc Retroativo'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnClick = BitBtnLancRetroativoClick
                Glyph.Data = {
                  6E020000424D6E020000000000006E0100002800000010000000100000000100
                  08000000000000010000120B0000120B00004E0000004E000000FF00FF00B68E
                  8A00CCB5B000645E4100CCD0C00018430A000A440400004B0000003E00000077
                  03000198030001900500069D0F00079D11000DA91F000DA71F000FAC2D0012B6
                  2F000B6A1C0013B12F0027A13D001FB63F001AC041001CC2480021CB52002DDA
                  5E0038F06C002FC759000E9A390039E26D0042F67A0029D862002ADA650031E3
                  6C003CF479003BF074003EFB7A003EF7780041FE800032E6700047FF870047FF
                  8B0026C2680030B166003ED48100178C520047DC960045BABA00D5FBFF0021B5
                  C900A6E9F20013B7D4002DC4E500A1F0FF009CE3F20012D1FF001192B10052DD
                  FF000FC5FA0022C5F40047B4D3006CD7F6009EE7FC000BB5ED000DAADD001196
                  C20030ACD40035B0DD00A9DDEF00C5EFFF001C9EDA0011A9F60020A3E20023A7
                  E600CBEDFF0022A6F800004B8200000000000000000000000000000000000000
                  00000000070707050500004C00000000000000070B0A07094C084C4B4C004C00
                  000000070D0C074C314C4C4B4C4C3C4C000000070F0E072D4C3B3F4746424C00
                  000000071311074C4C39334C38494C4C0000000716104C44323D4C124C414843
                  4C0000071817074C4C3E3E4C40404C4C000000071F20071C4C30362F34374C00
                  000000072127074C454C4C354C4C3A4C000000072322072B4C2A4C4A4C074C00
                  000000072829071B241A2C4C2E070000000000071D1407071519252626070000
                  0000000707030204070707261E07000000000000000605050301010707070000
                  000000000000000007070707000000000000}
              end
            end
            object GroupBox7: TGroupBox
              Left = 0
              Top = 48
              Width = 872
              Height = 153
              Align = alTop
              Caption = 'RESUMO DO PER'#205'ODO'
              TabOrder = 1
              object LabelFatVndP: TLabel
                Left = 103
                Top = 22
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label26: TLabel
                Left = 60
                Top = 24
                Width = 39
                Height = 13
                Alignment = taRightJustify
                Caption = 'Vendas:'
              end
              object Label28: TLabel
                Left = 340
                Top = 24
                Width = 81
                Height = 13
                Alignment = taRightJustify
                Caption = 'Qtde de vendas:'
              end
              object LabelQtdVndP: TLabel
                Left = 425
                Top = 22
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label29: TLabel
                Left = 223
                Top = 107
                Width = 198
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dt '#250'ltima defini'#231#227'o de classes de clientes:'
              end
              object LabelDataDefClasse: TLabel
                Left = 425
                Top = 105
                Width = 80
                Height = 16
                Caption = '01/01/2000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label60: TLabel
                Left = 20
                Top = 128
                Width = 79
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total de Pontos:'
              end
              object LabelTotPontosG: TLabel
                Left = 103
                Top = 126
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label70: TLabel
                Left = 546
                Top = 24
                Width = 190
                Height = 13
                Alignment = taRightJustify
                Caption = 'Percentual programa de fidelidade (%):'
              end
              object Label71: TLabel
                Left = 570
                Top = 44
                Width = 166
                Height = 13
                Alignment = taRightJustify
                Caption = 'Valor total programa de fidelidade:'
              end
              object LabelPerDesp: TLabel
                Left = 742
                Top = 22
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label72: TLabel
                Left = 532
                Top = 64
                Width = 204
                Height = 13
                Hint = 'Taxa de convers'#227'o (Valor monet'#225'rio de cada ponto):'
                Alignment = taRightJustify
                Caption = 'Tx conv. (Valor monet'#225'rio de cada ponto):'
              end
              object btConfirmarSimulacao: TSpeedButton
                Left = 832
                Top = 41
                Width = 37
                Height = 63
                Hint = 'Confirmar simula'#231#227'o - [FID013]'
                Flat = True
                Glyph.Data = {
                  4A030000424D4A030000000000000A0100002800000018000000180000000100
                  08000000000040020000120B0000120B0000350000003500000000000000FFFF
                  FF00FF00FF00004B0000035E0600046408000793100008961100089612000997
                  130009971400099612000996130007740E000A9915000B991600097411000C9A
                  18000D9E1B000FA01D000FA11F000C77170010951F000E7D1A00119620000F81
                  1C00118C1F00139823001197220014A727001399250013902400159A2700138F
                  2300169D2900169C2800159127001AAF31001BB033001B9F310021B83D001C9C
                  340020AA3B0023AD410028C1490028C048002FC954002EC1520035CF5E0036D0
                  60003BD768003FD96F0041DC7000020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020203020202020202020202
                  02020202020202020202020202031A0302020202020202020202020202020202
                  0202020203210623030202020202020202020202020202020202020324130F07
                  2003020202020202020202020202020202020319251D1411081E030202020202
                  02020202020202020203172D28261F0322091B03020202020202020202020202
                  0315302E2C27030203120A1C030202020202020202020202033332312A030202
                  0203100E1803020202020202020202020329342B03020202020202030F160302
                  020202020202020202032F03020202020202020203110B030202020202020202
                  0202030202020202020202020203050C03020202020202020202020202020202
                  02020202020202030D0302020202020202020202020202020202020202020202
                  0304030202020202020202020202020202020202020202020202030302020202
                  0202020202020202020202020202020202020202030202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = btConfirmarSimulacaoClick
              end
              object Label73: TLabel
                Left = 551
                Top = 86
                Width = 185
                Height = 13
                Alignment = taRightJustify
                Caption = 'Per'#237'odo vencimento dos pontos (Dias):'
              end
              object Label74: TLabel
                Left = 317
                Top = 44
                Width = 104
                Height = 13
                Alignment = taRightJustify
                Caption = 'Qte de dev (Vendas):'
              end
              object LabelQtdDevP: TLabel
                Left = 425
                Top = 42
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label75: TLabel
                Left = 30
                Top = 44
                Width = 69
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dev (Vendas):'
              end
              object LabelFatDevP: TLabel
                Left = 103
                Top = 42
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LabelFatP: TLabel
                Left = 103
                Top = 105
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label77: TLabel
                Left = 33
                Top = 107
                Width = 66
                Height = 13
                Alignment = taRightJustify
                Caption = 'Faturamento:'
              end
              object Label76: TLabel
                Left = 26
                Top = 64
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dev (Avulsas):'
              end
              object LabelFatDevAvulsasP: TLabel
                Left = 103
                Top = 63
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label78: TLabel
                Left = 315
                Top = 65
                Width = 106
                Height = 13
                Alignment = taRightJustify
                Caption = 'Qte de dev (Avulsas):'
              end
              object LabelQtdDevAvulsasP: TLabel
                Left = 425
                Top = 63
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label80: TLabel
                Left = 45
                Top = 85
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Vales Prog:'
              end
              object LabelFatVales: TLabel
                Left = 103
                Top = 84
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label81: TLabel
                Left = 331
                Top = 85
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = 'Qte de Vales Prog:'
              end
              object LabelQtdVales: TLabel
                Left = 425
                Top = 84
                Width = 8
                Height = 16
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object EditHwValorDesp: TEditHw
                Left = 742
                Top = 41
                Width = 88
                Height = 21
                TabOrder = 0
                Text = '0'
                OnExit = EditHwValorDespExit
                Formato = fNumber
                FormatSize = '10.8'
              end
              object EditHwTaxConv: TEditHw
                Left = 742
                Top = 62
                Width = 88
                Height = 21
                TabOrder = 1
                Text = '0'
                OnExit = EditHwTaxConvExit
                Formato = fNumber
                FormatSize = '10.8'
              end
              object EditHwPeriodoVenc: TEditHw
                Left = 742
                Top = 84
                Width = 88
                Height = 21
                TabOrder = 2
                Text = '0'
                OnExit = EditHwTaxConvExit
                Formato = fInteger
                FormatSize = '10.0'
              end
            end
            object PageControl2: TPageControl
              Left = 0
              Top = 201
              Width = 872
              Height = 279
              ActivePage = tsResumo
              Align = alClient
              Style = tsFlatButtons
              TabOrder = 2
              object tsResumo: TTabSheet
                Caption = 'RESUMO'
                object GroupBoxResumo: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Resumo'
                  TabOrder = 0
                  object Panel16: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    Visible = False
                    object Label63: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object Label65: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label66: TLabel
                      Left = 510
                      Top = 4
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object Label67: TLabel
                      Left = 567
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label68: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object Label69: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                  end
                  object DBGrid4: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                  object Panel17: TPanel
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Caption = 'Panel50'
                    TabOrder = 2
                    object StringGridResumo: TStringGrid
                      AlignWithMargins = True
                      Left = 4
                      Top = 4
                      Width = 852
                      Height = 192
                      Align = alClient
                      Color = clMenu
                      ColCount = 14
                      Ctl3D = True
                      FixedColor = clActiveCaption
                      FixedCols = 0
                      RowCount = 2
                      Options = [goFixedHorzLine, goHorzLine, goRangeSelect, goColSizing]
                      ParentCtl3D = False
                      TabOrder = 0
                      OnDrawCell = StringGridResumoDrawCell
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
                        325)
                    end
                  end
                end
              end
              object tsFaixaPontosValor: TTabSheet
                Caption = 'tsFaixaPontosValor'
                ImageIndex = 1
                object GroupBoxFaixaPontosPorValor: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Faixa Pontos Por Valor'
                  TabOrder = 0
                  object Panel5: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label30: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotFaixaPontosValor: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label31: TLabel
                      Left = 510
                      Top = 4
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object LabelValorTotalFaixaPontosValor: TLabel
                      Left = 567
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label33: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalFaixaPontosValor: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigFaixaPontos: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigFaixaPontosClick
                    end
                    object btAtivarFaixaPontos: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAtivarFaixaPontosClick
                    end
                    object btDesativarFaixaPontos: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarFaixaPontosClick
                    end
                  end
                  object DBGrid3: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                  object Panel50: TPanel
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Caption = 'Panel50'
                    TabOrder = 2
                    object DBGridFaixaPontosPorValor: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 858
                      Height = 198
                      Align = alClient
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              object tsAsseduidade: TTabSheet
                Caption = 'tsAsseduidade'
                ImageIndex = 2
                object GroupBoxAssiduidade: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Assiduidade'
                  TabOrder = 0
                  object Panel6: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label32: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotAsseduidade: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label35: TLabel
                      Left = 498
                      Top = 4
                      Width = 87
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Quantidade Total:'
                    end
                    object LabelQtdeTotAsseduidade: TLabel
                      Left = 587
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label37: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalAsseduidade: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigAsseduidade: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigAsseduidadeClick
                    end
                    object btAtivarAsseduidade: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAtivarAsseduidadeClick
                    end
                    object btDesativarAsseduidade: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarAsseduidadeClick
                    end
                  end
                  object DBGridAssiduidade: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
              object tsFaixaAsseduidade: TTabSheet
                Caption = 'tsFaixaAsseduidade'
                ImageIndex = 10
                object GroupBoxFaixaAssiduidade: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Faixa Assiduidade'
                  TabOrder = 0
                  object Panel14: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label54: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotFaixaAsseduidade: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label59: TLabel
                      Left = 510
                      Top = 4
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object LabelValorTotFaixaAssiduidade: TLabel
                      Left = 567
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label61: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalFaixaAsseduidade: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigFaixaAsseduidade: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigFaixaAsseduidadeClick
                    end
                    object btAtivarFaixaAsseduidade: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAtivarFaixaAsseduidadeClick
                    end
                    object btDesativarFaixaAsseduidade: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarFaixaAsseduidadeClick
                    end
                  end
                  object DBGridFaixaAssiduidade: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
              object tsFormasPag: TTabSheet
                Caption = 'tsFormasPag'
                ImageIndex = 11
                object GroupBoxFormasPag: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Formas de Pagamento'
                  TabOrder = 0
                  object Panel15: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label57: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotFormasPag: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label62: TLabel
                      Left = 498
                      Top = 4
                      Width = 87
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Quantidade Total:'
                    end
                    object LabelQtdeTotFormasPag: TLabel
                      Left = 587
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label64: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalFormasPag: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigFormasPag: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigFormasPagClick
                    end
                    object btAtivarFormasPag: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAtivarFormasPagClick
                    end
                    object BtDesativarFormasPag: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = BtDesativarFormasPagClick
                    end
                  end
                  object DBGridFormasPag: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
              object tsFaixaCompra: TTabSheet
                Caption = 'tsFaixaCompra'
                ImageIndex = 3
                object GroupBoxFaixaCompra: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Faixa Compra'
                  TabOrder = 0
                  object Panel7: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label34: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotFaixaCompra: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label38: TLabel
                      Left = 510
                      Top = 4
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object LabelValorTotalFaixaCompra: TLabel
                      Left = 567
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label40: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalFaixaCompra: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigFaixaCompra: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigFaixaCompraClick
                    end
                    object tbAtivarFaixaCompra: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = tbAtivarFaixaCompraClick
                    end
                    object btDesativarFaixaCompra: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarFaixaCompraClick
                    end
                  end
                  object DBGridFaixaCompra: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
              object tsRecPrest: TTabSheet
                Caption = 'tsRecPrest'
                ImageIndex = 9
                object GroupBoxRecPrest: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Recebimento de Presta'#231#227'o'
                  TabOrder = 0
                  object Panel13: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label51: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotRecPrest: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label56: TLabel
                      Left = 498
                      Top = 4
                      Width = 87
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Quantidade Total:'
                    end
                    object LabelQtdeTotalRecPrest: TLabel
                      Left = 587
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label58: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalRecPrest: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigurarRecPrest: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigurarRecPrestClick
                    end
                    object btAtivarRecPrest: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAtivarRecPrestClick
                    end
                    object btDesativarRecPrest: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarRecPrestClick
                    end
                  end
                  object DBGridRecPrest: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
              object tsFaixaProduto: TTabSheet
                Caption = 'tsFaixaProduto'
                ImageIndex = 4
                object GroupBoxFaixaProduto: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Faixa Produto'
                  TabOrder = 0
                  object Panel8: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label36: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotFaixaProduto: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label41: TLabel
                      Left = 510
                      Top = 4
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object LabelValorTotFaixaProduto: TLabel
                      Left = 567
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label43: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalFaixaProduto: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigFaixaProduto: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigFaixaProdutoClick
                    end
                    object btAtivarConfigFaixaProduto: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAtivarConfigFaixaProdutoClick
                    end
                    object btDesativarConfigFaixaProduto: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarConfigFaixaProdutoClick
                    end
                  end
                  object DBGridFaixaProduto: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
              object tsFaixaGrupoProd: TTabSheet
                Caption = 'tsFaixaGrupoProd'
                ImageIndex = 5
                object GroupBoxFaixaGrupoProd: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Faixa Grupo'
                  TabOrder = 0
                  object Panel9: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label39: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotFaixaGrupo: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label44: TLabel
                      Left = 510
                      Top = 4
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object LabelValorTotFaixaGrupo: TLabel
                      Left = 567
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label46: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotFaixaGrupo: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigFaixaGrupoProd: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigFaixaGrupoProdClick
                    end
                    object btAdicionarFaixaGrupoProd: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAdicionarFaixaGrupoProdClick
                    end
                    object btDesativarFaixaGrupoProd: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarFaixaGrupoProdClick
                    end
                  end
                  object DBGridFaixaGrupoProd: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
              object tsFaixaSubGrupoProd: TTabSheet
                Caption = 'tsFaixaSubGrupoProd'
                ImageIndex = 6
                object GroupBoxFaixaSubGrupoProd: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Faixa SubGrupo'
                  TabOrder = 0
                  object Panel10: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label42: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotFaixaSubGrupo: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label47: TLabel
                      Left = 510
                      Top = 4
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object LabelValorTotFaixaSubGrupo: TLabel
                      Left = 567
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label49: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalFaixaSubGrupo: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigFaixaSubGrupo: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigFaixaSubGrupoClick
                    end
                    object btAtivarFaixaSubGrupo: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAtivarFaixaSubGrupoClick
                    end
                    object btDesativarFaixaSubGrupo: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarFaixaSubGrupoClick
                    end
                  end
                  object DBGridFaixaSubGrupoProd: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
              object tsFaixaMarcaProd: TTabSheet
                Caption = 'tsFaixaMarcaProd'
                ImageIndex = 7
                object GroupBoxFaixaMarca: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Faixa Marca'
                  TabOrder = 0
                  object Panel11: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label45: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotFaixaMarca: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label50: TLabel
                      Left = 510
                      Top = 4
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object LabelValorTotFaixaMarca: TLabel
                      Left = 567
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label52: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalFaixaMarca: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigFaixaMarcaProd: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigFaixaMarcaProdClick
                    end
                    object btAtivarFaixaMarcaProd: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAtivarFaixaMarcaProdClick
                    end
                    object btDesativarFaixaMarcaProd: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarFaixaMarcaProdClick
                    end
                  end
                  object DBGridFaixaMarca: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
              object tsFaixaKitProd: TTabSheet
                Caption = 'tsFaixaKitProd'
                ImageIndex = 8
                object GroupBoxFaixaKitProd: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 864
                  Height = 248
                  Align = alClient
                  Caption = 'Faixa Kit'
                  TabOrder = 0
                  object Panel12: TPanel
                    Left = 2
                    Top = 215
                    Width = 860
                    Height = 31
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label48: TLabel
                      Left = 381
                      Top = 4
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc(%):'
                    end
                    object LabelPercTotFaixaKitProd: TLabel
                      Left = 427
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label53: TLabel
                      Left = 510
                      Top = 4
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object LabelValorTotFaixaKitProd: TLabel
                      Left = 567
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label55: TLabel
                      Left = 657
                      Top = 4
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Total de Pontos:'
                    end
                    object LabelPontosTotalFaixaKitProd: TLabel
                      Left = 738
                      Top = 4
                      Width = 7
                      Height = 13
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btConfigFaixaKitProd: TSpeedButton
                      Left = 132
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Configurar - [FID003]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                        FD2526FDFDFDFDFDFDFDFDFDFD6E2E1D25252E1D1D6E6EFDFDFDFDFDFD6E2F2F
                        2E377F2677776EFDFDFDFD1D6677BF777737377FB7F6F6251DFDFDBF7777BFBF
                        7F37377FBFBF7F776FFDFD2F2F7777BF7F6D65373737373737FDFD252F7777B6
                        A4F7A4A46E3737372FFDFD262F2F77F7F6F7A4EDF7BFBFF66EFDFD25262F6FF7
                        F6F7A4EDF7BFBFBF6EFDFDFDFD2F2FF7F6F7A4EDF77FBFFDFDFDFDFDFD2525F7
                        F6F7A4EDF72525FDFDFDFDFDFDFDFDF7F6F7A4EDF7FDFDFDFDFDFDFDFDFDFDF7
                        F7A4A4F7F7FDFDFDFDFDFDFDFDFDFDA4F607F7F7A4FDFDFDFDFDFDFDFDFDFDA4
                        F607F7A4A4FDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btConfigFaixaKitProdClick
                    end
                    object btAtivarFaixaKitProd: TSpeedButton
                      Left = 163
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Ativar - [FID004]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD14
                        1414141414FDFDFDFDFDFDFDFD14151616161616161514FDFDFDFDFD14151616
                        16161616161E1514FDFDFD151516161FB71F16161616161514FDFD151616161F
                        B7BF1F161616161615FD151E1F1F1F1FB7FFFF6F1F16161616141E1F1F1F1F1F
                        B7FFFFFFAF16161616141E2727272727BFFFFFFFFF081F1616141F6F6F676767
                        BFFFFFFFFFB71F1616141E6FB76F6F6F08FFFFF66F16161616141E6FB7AF6F6F
                        F6FFFF6F1F1616161614FD1FAFF6BFAFF6BF671F1F16161615FDFD1F27F6F6B7
                        0867271F1F16161514FDFDFD1E27B7F6F6B7B76F671F1515FDFDFDFDFD1F1FAF
                        B7B7B76F271514FDFDFDFDFDFDFDFD1E1E1E1E1E1EFDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btAtivarFaixaKitProdClick
                    end
                    object btDesativarFaixaKitProd: TSpeedButton
                      Left = 194
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Desativar - [FID005]'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000120B0000120B00000001000000000000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A6000020400000206000002080000020A0000020C0000020E000004000000040
                        20000040400000406000004080000040A0000040C0000040E000006000000060
                        20000060400000606000006080000060A0000060C0000060E000008000000080
                        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                        20004000400040006000400080004000A0004000C0004000E000402000004020
                        20004020400040206000402080004020A0004020C0004020E000404000004040
                        20004040400040406000404080004040A0004040C0004040E000406000004060
                        20004060400040606000406080004060A0004060C0004060E000408000004080
                        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                        20008000400080006000800080008000A0008000C0008000E000802000008020
                        20008020400080206000802080008020A0008020C0008020E000804000008040
                        20008040400080406000804080008040A0008040C0008040E000806000008060
                        20008060400080606000806080008060A0008060C0008060E000808000008080
                        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFD49
                        4949494949FDFDFDFDFDFDFDFD4989D0D8D0D0D8D08949FDFDFDFDFD8990D8D0
                        D0D0D0D0D0D89049FDFDFD8990D0D0D0D0D0D0D0D0D0D09049FDFD90D0D0D0D0
                        D0D0D0D0D0D0D0D889FD90D8D8D8D8FFFFFFFFFFFFD0D0D0D04990D8D9D9D9FF
                        FFFFFFFFFFD0D0D0D84990E1E2E1E1FFFFFFFFFFFFD0D0D0D04990EAEBE2E2FF
                        FFFFFFFFFFD0D0D0D04990EB09EBEBFFFFFFFFFFFFD0D0D0D84990EB09F4EBFF
                        FFFFFFFFFFD0D0D0D049FDD8ECF609F3EBE2E1D9D8D0D0D889FDFDD0E1F6F609
                        EBE2E1D9D8D0D09049FDFDFD90E109F6F60909EBEAD89089FDFDFDFDFDD0D9EC
                        090909EBE29149FDFDFDFDFDFDFDFD909090909090FDFDFDFDFD}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btDesativarFaixaKitProdClick
                    end
                  end
                  object DBGridFaixaKitProd: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 860
                    Height = 200
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
            end
            object PanelProg: TPanel
              Left = 0
              Top = 480
              Width = 872
              Height = 26
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 3
              object Label79: TLabel
                Left = 742
                Top = 2
                Width = 26
                Height = 13
                Caption = '0 / 0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Visible = False
              end
              object ProgressBar1: TProgressBar
                Left = 6
                Top = 1
                Width = 856
                Height = 18
                TabOrder = 0
              end
            end
          end
        end
        object tsAtuar: TTabSheet
          Caption = 'tsAtuar'
          ImageIndex = 4
          object pnAtuar: TPanel
            Left = 0
            Top = 1
            Width = 505
            Height = 120
            TabOrder = 0
            object Label133: TLabel
              Left = 15
              Top = 58
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Atuar:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object GroupBox6: TGroupBox
              Left = 1
              Top = 1
              Width = 503
              Height = 44
              Align = alTop
              Caption = 'Classe'
              TabOrder = 0
              object DBText3: TDBText
                Left = 25
                Top = 18
                Width = 48
                Height = 13
                AutoSize = True
                DataField = 'DESCRICAO_REGRA'
                DataSource = dtmConfig.dsRegrasProgramasFid
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object ComboBoxAtuar: TComboBox
              Left = 52
              Top = 55
              Width = 445
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              Items.Strings = (
                'VENDAS'
                'RECEBIMENTOS'
                'VENDAS/RECEBIMENTOS')
            end
            object Panel34: TPanel
              Left = 1
              Top = 89
              Width = 503
              Height = 30
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn35: TBitBtn
                Left = 249
                Top = 0
                Width = 75
                Height = 26
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn35Click
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
              object BitBtn19: TBitBtn
                Left = 174
                Top = 0
                Width = 75
                Height = 26
                Caption = '&OK'
                Default = True
                TabOrder = 0
                OnClick = BitBtn19Click
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
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Top = 402
      ExplicitTop = 402
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 891
    ExplicitWidth = 891
  end
  inherited pnStatusProcessamento: TPanel
    Top = 546
    ExplicitTop = 546
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 364
    Top = 65521
  end
  inherited PopupMenu2: TPopupMenu
    Left = 718
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 654
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 558
    Top = 65531
  end
  object PopupMenu3: TPopupMenu
    Left = 436
    Top = 65521
    object Configurarcolunas2: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = Configurarcolunas2Click
    end
    object ResetarConfiguraesdecolunas2: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = ResetarConfiguraesdecolunas2Click
    end
    object SalvardadosnoExcel2: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = SalvardadosnoExcel2Click
    end
    object ReajustarLarguradascolunas2: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = ReajustarLarguradascolunas1Click
    end
    object Copiarparareadetransferncia2: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = Copiarparareadetransferncia1Click
    end
    object Somarvaloresdacoluna2: TMenuItem
      Caption = 'Somar valores da coluna'
      OnClick = Somarvaloresdacoluna2Click
    end
  end
end
