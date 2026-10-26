inherited frmCadOrdemCarregamento: TfrmCadOrdemCarregamento
  Caption = 'Cadastro de Ordem de Carregamento'
  ClientWidth = 801
  ExplicitWidth = 809
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 801
    ExplicitWidth = 801
    inherited PanelLeft: TPanel
      Width = 796
      ExplicitWidth = 796
      inherited PageControl1: TPageControl
        Width = 794
        ExplicitWidth = 794
        inherited TabSheet1: TTabSheet
          ExplicitWidth = 786
          inherited ScrollBox1: TScrollBox
            Width = 786
            ExplicitWidth = 786
            inherited PageControl3: TPageControl
              Width = 786
              ActivePage = tsCadastro
              ExplicitWidth = 786
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 778
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 778
                  ExplicitWidth = 778
                  inherited GroupBox1: TGroupBox
                    Width = 774
                    ExplicitWidth = 774
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 778
                  Height = 431
                  Align = alClient
                  Caption = 'Cadastro de Ordem de Carregamento'
                  TabOrder = 0
                  OnEnter = GroupBox4Enter
                  object Label6: TLabel
                    Left = 150
                    Top = 29
                    Width = 33
                    Height = 13
                    Caption = 'Codigo'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 137
                    Top = 56
                    Width = 46
                    Height = 13
                    Caption = 'Descri'#231#227'o'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 138
                    Top = 110
                    Width = 45
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Motorista'
                    FocusControl = DBEdit4
                  end
                  object Label9: TLabel
                    Left = 140
                    Top = 164
                    Width = 43
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Faturista'
                    FocusControl = DBEdit5
                  end
                  object Label10: TLabel
                    Left = 128
                    Top = 191
                    Width = 55
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Conferente'
                    FocusControl = DBEdit6
                  end
                  object Label11: TLabel
                    Left = 150
                    Top = 137
                    Width = 33
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Ve'#237'culo'
                    FocusControl = DBEdit7
                  end
                  object Label12: TLabel
                    Left = 157
                    Top = 83
                    Width = 26
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Setor'
                    FocusControl = DBEdit6
                  end
                  object Label13: TLabel
                    Left = 398
                    Top = 218
                    Width = 62
                    Height = 13
                    Caption = 'Peso M'#225'ximo'
                    FocusControl = DBEdit8
                  end
                  object Label19: TLabel
                    Left = 391
                    Top = 245
                    Width = 70
                    Height = 13
                    Caption = 'Peso da Carga'
                    FocusControl = DBEdit14
                  end
                  object Label20: TLabel
                    Left = 369
                    Top = 272
                    Width = 95
                    Height = 13
                    Caption = 'Data Carregamento'
                    FocusControl = DBEdit15
                  end
                  object Label21: TLabel
                    Left = 134
                    Top = 299
                    Width = 49
                    Height = 13
                    Caption = 'Ajudantes'
                    FocusControl = DBMemo1
                  end
                  object Label14: TLabel
                    Left = 607
                    Top = 218
                    Width = 158
                    Height = 13
                    Caption = 'Habilitar ou Desabilitar [OCR034]'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object DBText1: TDBText
                    Left = 189
                    Top = 218
                    Width = 156
                    Height = 17
                    DataField = 'PESO_MAXIMO'
                    DataSource = dtmOrdemCarregamento.dsVeicTrCons2
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label15: TLabel
                    Left = 85
                    Top = 218
                    Width = 98
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Peso M'#225'ximo Ve'#237'culo'
                    FocusControl = DBEdit8
                  end
                  object DBText9: TDBText
                    Left = 189
                    Top = 241
                    Width = 156
                    Height = 17
                    DataField = 'PLACA'
                    DataSource = dtmOrdemCarregamento.dsVeicTrCons2
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label28: TLabel
                    Left = 118
                    Top = 241
                    Width = 65
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Placa Ve'#237'culo:'
                    FocusControl = DBEdit8
                  end
                  object DBEdit1: TDBEdit
                    Left = 189
                    Top = 26
                    Width = 134
                    Height = 21
                    DataField = 'COD_CARGA'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 189
                    Top = 53
                    Width = 412
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'DESCRICAO'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 189
                    Top = 80
                    Width = 67
                    Height = 21
                    DataField = 'COD_SETOR'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    TabOrder = 2
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 262
                    Top = 80
                    Width = 339
                    Height = 21
                    DataField = 'COD_SETOR'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    KeyField = 'COD_SETOR'
                    ListField = 'SETOR'
                    ListSource = dtmOrdemCarregamento.dsSetorCons2
                    TabOrder = 3
                  end
                  object DBEdit4: TDBEdit
                    Left = 189
                    Top = 107
                    Width = 67
                    Height = 21
                    DataField = 'COD_MOTORISTA'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    TabOrder = 4
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 262
                    Top = 107
                    Width = 339
                    Height = 21
                    DataField = 'COD_MOTORISTA'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    KeyField = 'COD_VENDEDOR'
                    ListField = 'NOME_VENDEDOR'
                    ListSource = dtmOrdemCarregamento.dsColabCons2
                    TabOrder = 5
                  end
                  object DBEdit5: TDBEdit
                    Left = 189
                    Top = 134
                    Width = 67
                    Height = 21
                    DataField = 'COD_VEIC'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    TabOrder = 6
                    OnExit = DBEdit5Exit
                  end
                  object DBLookupComboBox3: TDBLookupComboBox
                    Left = 262
                    Top = 134
                    Width = 339
                    Height = 21
                    DataField = 'COD_VEIC'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    KeyField = 'COD_VEIC'
                    ListField = 'MODELO'
                    ListSource = dtmOrdemCarregamento.dsVeicTrCons2
                    TabOrder = 7
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit6: TDBEdit
                    Left = 189
                    Top = 161
                    Width = 67
                    Height = 21
                    DataField = 'COD_FATURISTA'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    TabOrder = 8
                  end
                  object DBLookupComboBox4: TDBLookupComboBox
                    Left = 262
                    Top = 161
                    Width = 339
                    Height = 21
                    DataField = 'COD_FATURISTA'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    KeyField = 'COD_VENDEDOR'
                    ListField = 'NOME_VENDEDOR'
                    ListSource = dtmOrdemCarregamento.dsColabCons2
                    TabOrder = 9
                  end
                  object DBEdit7: TDBEdit
                    Left = 189
                    Top = 188
                    Width = 67
                    Height = 21
                    DataField = 'COD_CONFERENTE'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    TabOrder = 10
                  end
                  object DBLookupComboBox10: TDBLookupComboBox
                    Left = 262
                    Top = 188
                    Width = 339
                    Height = 21
                    DataField = 'COD_CONFERENTE'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    KeyField = 'COD_VENDEDOR'
                    ListField = 'NOME_VENDEDOR'
                    ListSource = dtmOrdemCarregamento.dsColabCons2
                    TabOrder = 11
                  end
                  object DBEdit8: TDBEdit
                    Left = 467
                    Top = 215
                    Width = 134
                    Height = 21
                    DataField = 'PESO_MAX'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    TabOrder = 12
                  end
                  object DBEdit14: TDBEdit
                    Left = 467
                    Top = 242
                    Width = 134
                    Height = 21
                    DataField = 'PESO_CARGA'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    Enabled = False
                    TabOrder = 13
                  end
                  object DBEdit15: TDBEdit
                    Left = 467
                    Top = 269
                    Width = 134
                    Height = 21
                    DataField = 'DATA_CARREGAMENTO'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    TabOrder = 14
                  end
                  object DBMemo1: TDBMemo
                    Left = 189
                    Top = 296
                    Width = 412
                    Height = 89
                    DataField = 'AJUDANTES'
                    DataSource = dtmOrdemCarregamento.dsCarga
                    TabOrder = 15
                  end
                  object Panel4: TPanel
                    Left = 2
                    Top = 387
                    Width = 774
                    Height = 42
                    Align = alBottom
                    BevelOuter = bvNone
                    BorderWidth = 5
                    TabOrder = 16
                    object BitBtn8: TBitBtn
                      Left = 5
                      Top = 5
                      Width = 764
                      Height = 32
                      Hint = 'Itens da Carga'
                      Align = alClient
                      Caption = 'Itens da Carga'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                      Visible = False
                      OnClick = BitBtn8Click
                      Glyph.Data = {
                        F6060000424DF606000000000000360000002800000018000000180000000100
                        180000000000C0060000120B0000120B00000000000000000000FF00FF295A8C
                        29638C29638C29638C29638C29638C29638C29638C29638C29638C29638C2963
                        8C29638C29638C29638C29638C31638C31638C31638C31638C31638C31638CFF
                        00FFFF00FF2973AD5A94BD5A94BD6394C6639CC6639CC6639CC6639CC66B9CC6
                        6BA5C66BA5CE6BA5CE6BA5CE73A5CE73A5CE73ADCE73ADCE73ADD67BADD67BAD
                        D67BB5D62973ADFF00FFFF00FF2973AD5A94BD29638C29638C29638C31638C31
                        638C31638C31638C6BA5C66BA5CE6BA5CE6BA5CE316394316B94316B94316B94
                        316B94316B94316B947BB5D62973ADFF00FFFF00FF2973AD427BA5427BA5427B
                        A54A7BA54A7BA54A7BA54A7BA54A84AD4A84AD4A84AD4A84AD4A84AD4A84AD52
                        84AD5284AD5284AD528CAD528CB5528CB5528CB52973ADFF00FFFF00FF2973AD
                        73ADCE73ADCE7BADCE7BADCE7BADCE7BADCE7BADD67BADD67BADD67BB5D684B5
                        D684B5D684B5D684B5D684B5D684B5D684B5DE84B5DE84B5DE8CBDDE2973ADFF
                        00FFFF00FF2973AD082942082942082942082942082942082942082942082942
                        0829420829420829420829420829420829420829420829420829420829420829
                        420829422973ADFF00FFFF00FF2973AD2973AD2973AD2973AD2973AD2973AD29
                        73AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD
                        2973AD2973AD2973AD2973AD2973ADFF00FFFF00FF2973AD2973ADB5D6E784B5
                        D67BB5CE73B5CE73ADCE73ADCE73ADCE73ADCE73ADCE73ADCE73ADCE73ADCE73
                        ADCE73ADCE73B5CE7BB5CE84B5D68CC6DE2973AD2973ADFF00FFFF00FFFF00FF
                        2973ADA5CEDE5A8CA5528CA5528CA5528CA5528CA5528CA5528CAD528CA5528C
                        A5528CAD5284A5528CA5528CA5528CA5528CA56394B584BDD62973AD6B9CC6FF
                        00FFFF00FFFF00FF2973ADA5CEDE5A94B55A94B55A94B55A94B55A94B55A94B5
                        5A94B55A94B55A94B5528CA55A8CA552849C528CA5528CA552849C5A8CA57BB5
                        CE2973ADFF00FFFF00FFFF00FFFF00FF2973ADA5CEDE63A5C6639CBD639CBD63
                        9CBD639CBD639CBD639CBD639CBD639CBD528CAD4A849C4A7B9C52849C4A849C
                        4A7B9C528CA57BB5CE2973ADFF00FFFF00FFFF00FFFF00FF2973ADA5CEDE63A5
                        C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663
                        A5C663A5C663A5C663A5C663A5C67BB5D62973ADFF00FFFF00FFFF00FFFF00FF
                        2973ADA5CEDE63A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5
                        C663A5C663A5C663A5C663A5C663A5C663A5C663A5C67BB5D62973ADFF00FFFF
                        00FFFF00FFFF00FF2973ADA5CEDE63A5C663A5C663A5C663A5C663A5C663A5C6
                        63A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C67BB5
                        D62973ADFF00FFFF00FFFF00FFFF00FF2973ADA5CEDE639CBD63A5C6639CBD63
                        A5C6639CBD63A5C6639CB5639CB5639CB563A5C66BA5C66BA5C66BA5C66BA5C6
                        6BA5C66BA5C684BDD62973ADFF00FFFF00FFFF00FFFF00FF2973ADA5CEE7527B
                        945A94B552849C639CBD4A7B94639CBD52849C52849C52849C5A8CA55A94AD5A
                        94B56BADCE6BADCE6BADCE6BADCE84BDD62973ADFF00FFFF00FFFF00FFFF00FF
                        2973ADADCEE7639CB5639CB563A5C6639CB5639CB5639CB5639CB5639CBD639C
                        B5639CB5639CB56BA5C66BADCE6BADCE6BADCE6BADCE84BDD62973ADFF00FFFF
                        00FFFF00FFFF00FF2973ADADD6E75A94B55A94AD639CB55A94AD5A94AD5A94AD
                        639CB56394B55A94AD5A94AD5A94AD6BA5C66BADCE6BADCE6BADCE6BADCE84BD
                        DE2973ADFF00FFFF00FFFF00FFFF00FF2973ADADD6E7D6DEE7D6DEE7BDD6DEC6
                        D6E7D6DEE7DEDEE79CC6DEDEDEE7D6DEE7DEDEE7B5CEDED6DEE784B5D66BADCE
                        6BADCE73B5D68CBDDE2973ADFF00FFFF00FFFF00FFFF00FF2973ADADD6E7FFF7
                        EFFFF7EFDEDEE7FFF7EFFFF7EFFFF7EFD6DEE7F7EFEFFFF7EFF7EFEFEFEFEFEF
                        EFEF94BDDE73B5D673B5D673B5D68CC6DE2973ADFF00FFFF00FFFF00FFFF00FF
                        2973ADB5D6EF84BDDE7BB5D673B5D673B5D673B5D673B5D673B5D673B5D673B5
                        D673B5D673B5D673B5D673B5D673B5D67BB5D684BDDE94C6E72973ADFF00FFFF
                        00FFFF00FFFF00FF2973ADBDDEEFB5DEEFB5D6EFADD6E7ADD6E7ADD6E7ADD6E7
                        ADD6E7ADD6E7ADD6E7ADD6E7ADD6E7ADD6E7ADD6E7ADD6E7B5D6EFB5DEEFBDDE
                        EF2973ADFF00FFFF00FFFF00FFFF00FF7BA5CE2973AD2973AD2973AD2973AD29
                        73AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD
                        2973AD2973AD2973AD7BA5CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 786
              ExplicitWidth = 786
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar dados - [OCR033]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
              inherited BitBtn6: TBitBtn
                Left = 692
                ExplicitLeft = 692
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 786
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 786
            ExplicitWidth = 786
            inherited imgInformation: TImage
              Left = 760
              ExplicitLeft = 760
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [OCR029]'
            end
            inherited BitBtn2: TBitBtn
              TabOrder = 10
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [OCR030]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              TabOrder = 11
              Visible = False
            end
            object BitBtn7: TBitBtn
              Left = 498
              Top = 42
              Width = 75
              Height = 25
              Hint = 'Montar Ordem Carregamento'
              Caption = '&Montar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              OnClick = BitBtn7Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000420B0000420B00000001000000010000CE630000FFD6
                AD00FFE7C600FFEFDE00FFEFE700FFF7EF0042B5F7008CD6F700B5DEF700FF00
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
                090909090909090909090900000000000000000000000000000009000B0B0505
                0303030402020101010009000B0B0B050505030303020202010009000B0B0B0B
                0505050303040201010009000B0B0B0B0B0B050503030302010009000B0B0B0B
                0B0B0B0505030402010009000B0B0B0B0B0B0B0B050A0A0A010009000B0B0B0B
                0B0B0B0B0B0A060A010009000B0B0B0B0B0B0B0A0A0A060A0A0A09000B0B0B0B
                0B0B0B0A07080808070A09000B0B0B0B0B0B0B0A0A0A080A0A0A090000000000
                00000000000A080A000009090000000000000000000A0A0A0009090909090909
                0909090909090909090909090909090909090909090909090909}
            end
          end
          inherited Panel1: TPanel
            Width = 786
            ExplicitWidth = 786
            inherited Splitter1: TSplitter
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Width = 493
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 782
              ExplicitWidth = 782
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [OCR031]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [OCR032]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Left = 691
                Top = -20
                Enabled = False
                Visible = False
                ExplicitLeft = 691
                ExplicitTop = -20
              end
              inherited SpeedButton5: TSpeedButton
                Left = 748
                Top = -20
                Enabled = False
                Visible = False
                ExplicitLeft = 748
                ExplicitTop = -20
              end
              inherited SpeedButton6: TSpeedButton
                Left = 235
                Hint = 'Efetuar Carregamento de Mercadorias - [OCR037]'
                Glyph.Data = {
                  C2040000424DC204000000000000420000002800000018000000180000000100
                  10000300000080040000120B0000120B00000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7CE71C84108410E71C1F7C1F7C1F7CEF3DEF3DEF3D
                  EF3DEF3DEF3DEF3DEF3DEF3DF1451F7C1F7C1F7C1F7C1F7C1F7CA71C8258817C
                  817C8258A71C1F7C8D31B656F75EF75EF75EF75EF75EF75EF75EF75ED8621F7C
                  1F7C1F7C1F7C1F7C3965834027719452944E276D833C524A4A29B556433D433D
                  433D433D433D433D433D433D433D433D433D433D1F7C1F7C396582448B655A67
                  5A6BAC61623C10424A29524A433D126FD06ACF66CF66CF66CE66CF66CF66D06A
                  126FC5551F7C1F7C5965843C6A71BD77BD776A658334734E4A299452433DF06A
                  AD628C628C5E6C5E6C5E8C5E8C62AD62F06AC5551F7C1F7C1F7C2A298250415C
                  415863400A291F7C6B2DF75E433DD06A8D628C628C628C628C628C628C628D62
                  D06AC5551F7C1F7C1F7C1F7C4E39E72408214E391F7C1F7C32461863433DF06A
                  AD628C628C628C628C628C628C628D62F06AC5551F7C1F7C1F7C1F7C1F7CD65A
                  EF3D1F7C1F7C1F7C734E1863433DF06AAD66AD66AD66AD66AD66AD66AD66AD66
                  F06AC5551F7C1F7C1F7C1F7C1F7C1863EF3D1F7C1F7C1F7C734E1863433DF16E
                  CE6AAD66AD66AD66AD66AD66AD66CE6AF16EC5551F7C1F7C1F7C1F7C1F7C1863
                  EF3D1F7C1F7C1F7C734E1863433D126FEF6ACE6ACE6ACE6ACE6ACE6ACE6AEF6A
                  126FC5551F7C1F7C1F7C1F7C1F7C1863EF3D1F7C1F7C1F7C734E1863433D7777
                  767756775573557355735573567776777777C5551F7C1F7C1F7C1F7C1F7C1863
                  EF3D1F7C1F7C1F7C734E1863433DC555C555C555C555C555C555C555C555C555
                  C555C5551F7C1F7C1F7C1F7C1F7C186310421F7C1F7C1F7C734E1863433D126F
                  F06ACF66CF66D06AF16AC6551F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C5256
                  D65AAD3552561F7C734E1863433DF06AAE668D628D62AE66F06AC5551F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C5256F75E31466C2D734E1863433DF06A
                  AD628C628C62AD62F06AC5551F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7CDA6AD65A734E1863433DF06AAD668D628D62AD66F06AC5551F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C5256734E1863433DF16E
                  CE66AD66AD66CE66F16EC5551F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C734E1863433D126FEF6ACF6ACF6AEF6A126FC5551F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C734E1863433D7777
                  76775677567776777777C5551F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C734E1863433DC555C555C555C555C555C555C5551F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C5256734E9452F9661F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C6340
                  634063405256D65AF9661F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C63402258225C634052561F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C63406340
                  63405F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
                OnClick = SpeedButton6Click
                ExplicitLeft = 235
              end
              inherited SpeedButton7: TSpeedButton
                Left = 349
                Hint = 'Reabrir documento - [OCR041]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230B0000230B00000001000000010000009C00000073
                  0800B5848400EFCE9400C6A59C00EFCE9C00C6ADA500BDD6A500F7D6A500F7D6
                  AD00F7D6B500F7DEB500F7DEBD00F7DEC600F7E7C600F7E7CE00F7E7D600FFEF
                  DE00FFF7E700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00131313130412
                  12121210100F0F0F0D0D0D0B09090505021313131313041212121210100F0F0F
                  0D0D0D0B0909050502131313131304121010100F0F0F0D0D0D0B0B0905050505
                  02131313131306121110100F0F0D0C0C0A090905050503030213131313130610
                  1110100F0D0D0C0A0909050505030303021313131313061011100F0D0D0C0A09
                  0905050505030303021313131313040F10100D0C0C0A09090505050503030303
                  021313131313040F0F0D0D0C0A0909050505050303030303021313130113040D
                  0E0D0C0A090905050505030303030303021313130001020D0E0C0B0A09080505
                  0503030303030303021301010000010202020202020202020202020202020202
                  0213000000000001131313131313131313131313131313131313000000000007
                  1313131313131313131313131313131313131313000007131313131313131313
                  1313131313131313131313130007020202020202020202020202020202020202
                  021313131313040D0E0C0B0A090805050503030303030303021313131313040D
                  0E0D0C0A090905050505030303030303021313131313040F0F0D0D0C0A090905
                  0505050303030303021313131313060F10100D0C0C0A09090505050503030303
                  021313131313061011100F0D0D0C0A0909050505050303030213131313130610
                  1110100F0D0D0C0A090905050503030302131313131304121110100F0F0D0C0C
                  0A0909050505030302131313131304121212100F0F0F0D0D0D0B0B0905050505
                  021313131313041212121210100F0F0F0D0D0D0B090905050213}
                OnClick = SpeedButton7Click
                ExplicitLeft = 349
              end
              inherited SpeedButton8: TSpeedButton
                Left = 292
                Hint = 'Fechar Carregamento - [OCR038]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF52ADE752ADE752ADE752ADE743A5E544A7E552ADE752ADE752ADE752
                  ADE7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF52ADE752ADE752ADE743A5E5C0E2F5B3DBF344A7
                  E552ADE752ADE752ADE78BC1DC51ABD751ABD751ABD751ABD751ABD751ABD751
                  ABD751ABD751ABD751ABD751ABD777B9D9FF00FF52ADE752ADE752ADE73AA2E4
                  FFFFFFF0F8FC3CA3E452ADE752ADE752ADE751ABD751ABD751ABD751ABD751AB
                  D751ABD751ABD751ABD751ABD751ABD751ABD751ABD777B9D9FF00FF52ADE752
                  ADE752ADE73EA4E4C5E4F7B0D8F342A5E552ADE752ADE752ADE751ABD751ABD7
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51ABD777B9
                  D9FF00FF52ADE752ADE750ACE73EA4E4FFFFFFFFFFFE39A2E452ADE752ADE752
                  ADE751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD7
                  51ABD751ABD777B9D9FF00FF52ADE752ADE750ACE73DA3E4FFFFFFFFFFFF3BA2
                  E452ADE752ADE752ADE751ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751
                  ABD7FFFFFF51ABD751ABD751ABD777B9D9FF00FF52ADE752ADE752ADE750ACE7
                  39A1E43BA2E452ADE752ADE752ADE752ADE751ABD751ABD751ABD751ABD7FFFF
                  FF51ABD751ABD751ABD7FFFFFF51ABD751ABD751ABD76DB5D9FF00FFFF00FF52
                  ADE76AB5E5FF00FFFF00FFFF00FFFF00FF6AB5E552ADE7FF00FF51ABD751ABD7
                  51ABD751ABD7FFFFFF51ABD751ABD751ABD7FFFFFF51ABD751ABD751ABD751AB
                  D7B5D0DDFF00FF52ADE768B5E6FF00FFFF00FFFF00FFFF00FF68B5E652ADE7FF
                  00FF51ABD751ABD751ABD7FFFFFFFFFFFFFFFFFF51ABD7FFFFFFFFFFFFFFFFFF
                  51ABD751ABD751ABD799C6DCFF00FF52ADE767B4E6FF00FFFF00FFFF00FFFF00
                  FF66B4E752ADE7FF00FF51ABD751ABD751ABD795D6F4FFFFFF95D6F451ABD7C9
                  F7FFFFFFFFC9F7FF51ABD751ABD751ABD77BBBD9FF00FF52ADE76AB5E5FF00FF
                  FF00FFFF00FFFF00FF55AEE652ADE7FF00FF51ABD751ABD751ABD751ABD7FFFF
                  FF51ABD751ABD751ABD7FFFFFF51ABD751ABD751ABD751ABD754ACD7FF00FFB1
                  D0E452ADE75AB0E6B3D2E6B5D3E75AB0E652ADE7B3D0E3FF00FF51ABD751ABD7
                  51ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751AB
                  D751ABD76EB6D9FF00FFFF00FF52ADE752ADE752ADE752ADE7FF00FFFF00FFFF
                  00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD7
                  51ABD751ABD751ABD751ABD751ABD768B3D8BBD2DEFF00FFFF00FFFF00FFFF00
                  FFBCD3DEFF00FFFF00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD751
                  ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD7FCFCFC
                  7ABAD97BBAD95FB0D851ABD7FF00FFFF00FF51ABD751ABD751ABD751ABD751AB
                  D751ABD751ABD7FFFFFFFFFFFFFFFFFFFFFFFF51ABD751ABD751ABD751ABD751
                  ABD751ABD7FFFFFF51ABD751ABD751ABD751ABD7FF00FFFF00FF51ABD751ABD7
                  51ABD751ABD751ABD751ABD751ABD7FFFFFFFFFFFFFFFFFFFFFFFF51ABD751AB
                  D751ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751ABD751ABD7FF00FFFF
                  00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD7FFFFFFFFFFFFFFFFFF
                  FFFFFF51ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751AB
                  D751ABD7FF00FFFF00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD7FF
                  FFFFFFFFFFFFFFFFFFFFFF51ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF
                  51ABD751ABD751ABD751ABD7FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF95D6F451ABD751ABD751ABD7FF00FFFF00FFCBE8F251ABD7
                  51ABD751ABD751ABD751ABD751ABD751ABD7CBF8FFFEFEFEFFFFFFFCFEFE51AB
                  D751ABD751ABD751ABD751ABD795D6F4FFFFFF92D4F551ABD751ABD7FF00FFFF
                  00FFFF00FFFF00FF74B9DC51ABD751ABD751ABD751ABD751ABD751ABD77DC8EC
                  FFFFFFFFFFFFC9F7FF51ABD751ABD751ABD751ABD751ABD795D6F4FFFFFF95D6
                  F451ABD7FF00FFFF00FFFF00FFFF00FFFF00FFA8CCDE51ABD751ABD751ABD751
                  ABD751ABD751ABD751ABD7D1FBFEFEFEFEE5FEFE51ABD751ABD751ABD751ABD7
                  51ABD795D6F4FFFFFF95D6F3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF8CC2DC51ABD751ABD751ABD751ABD751ABD751ABD78FCFEFFEFEFEF4FEFE51
                  ABD751ABD751ABD751ABD751ABD795D6F4FFFFFFFF00FFFF00FF}
                OnClick = SpeedButton8Click
                ExplicitLeft = 292
              end
              inherited SpeedButton11: TSpeedButton
                Left = 178
                Hint = 
                  'Adicionar e remover mercadorias a ordem de carregamento - [OCR04' +
                  '3]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FF295A8C
                  29638C29638C29638C29638C29638C29638C29638C29638C29638C29638C2963
                  8C29638C29638C29638C29638C31638C31638C31638C31638C31638C31638CFF
                  00FFFF00FF2973AD5A94BD5A94BD6394C6639CC6639CC6639CC6639CC66B9CC6
                  6BA5C66BA5CE6BA5CE6BA5CE73A5CE73A5CE73ADCE73ADCE73ADD67BADD67BAD
                  D67BB5D62973ADFF00FFFF00FF2973AD5A94BD29638C29638C29638C31638C31
                  638C31638C31638C6BA5C66BA5CE6BA5CE6BA5CE316394316B94316B94316B94
                  316B94316B94316B947BB5D62973ADFF00FFFF00FF2973AD427BA5427BA5427B
                  A54A7BA54A7BA54A7BA54A7BA54A84AD4A84AD4A84AD4A84AD4A84AD4A84AD52
                  84AD5284AD5284AD528CAD528CB5528CB5528CB52973ADFF00FFFF00FF2973AD
                  73ADCE73ADCE7BADCE7BADCE7BADCE7BADCE7BADD67BADD67BADD67BB5D684B5
                  D684B5D684B5D684B5D684B5D684B5D684B5DE84B5DE84B5DE8CBDDE2973ADFF
                  00FFFF00FF2973AD082942082942082942082942082942082942082942082942
                  0829420829420829420829420829420829420829420829420829420829420829
                  420829422973ADFF00FFFF00FF2973AD2973AD2973AD2973AD2973AD2973AD29
                  73AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD
                  2973AD2973AD2973AD2973AD2973ADFF00FFFF00FF2973AD2973ADB5D6E784B5
                  D67BB5CE73B5CE73ADCE73ADCE73ADCE73ADCE73ADCE73ADCE73ADCE73ADCE73
                  ADCE73ADCE73B5CE7BB5CE84B5D68CC6DE2973AD2973ADFF00FFFF00FFFF00FF
                  2973ADA5CEDE5A8CA5528CA5528CA5528CA5528CA5528CA5528CAD528CA5528C
                  A5528CAD5284A5528CA5528CA5528CA5528CA56394B584BDD62973AD6B9CC6FF
                  00FFFF00FFFF00FF2973ADA5CEDE5A94B55A94B55A94B55A94B55A94B55A94B5
                  5A94B55A94B55A94B5528CA55A8CA552849C528CA5528CA552849C5A8CA57BB5
                  CE2973ADFF00FFFF00FFFF00FFFF00FF2973ADA5CEDE63A5C6639CBD639CBD63
                  9CBD639CBD639CBD639CBD639CBD639CBD528CAD4A849C4A7B9C52849C4A849C
                  4A7B9C528CA57BB5CE2973ADFF00FFFF00FFFF00FFFF00FF2973ADA5CEDE63A5
                  C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663
                  A5C663A5C663A5C663A5C663A5C67BB5D62973ADFF00FFFF00FFFF00FFFF00FF
                  2973ADA5CEDE63A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5
                  C663A5C663A5C663A5C663A5C663A5C663A5C663A5C67BB5D62973ADFF00FFFF
                  00FFFF00FFFF00FF2973ADA5CEDE63A5C663A5C663A5C663A5C663A5C663A5C6
                  63A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C663A5C67BB5
                  D62973ADFF00FFFF00FFFF00FFFF00FF2973ADA5CEDE639CBD63A5C6639CBD63
                  A5C6639CBD63A5C6639CB5639CB5639CB563A5C66BA5C66BA5C66BA5C66BA5C6
                  6BA5C66BA5C684BDD62973ADFF00FFFF00FFFF00FFFF00FF2973ADA5CEE7527B
                  945A94B552849C639CBD4A7B94639CBD52849C52849C52849C5A8CA55A94AD5A
                  94B56BADCE6BADCE6BADCE6BADCE84BDD62973ADFF00FFFF00FFFF00FFFF00FF
                  2973ADADCEE7639CB5639CB563A5C6639CB5639CB5639CB5639CB5639CBD639C
                  B5639CB5639CB56BA5C66BADCE6BADCE6BADCE6BADCE84BDD62973ADFF00FFFF
                  00FFFF00FFFF00FF2973ADADD6E75A94B55A94AD639CB55A94AD5A94AD5A94AD
                  639CB56394B55A94AD5A94AD5A94AD6BA5C66BADCE6BADCE6BADCE6BADCE84BD
                  DE2973ADFF00FFFF00FFFF00FFFF00FF2973ADADD6E7D6DEE7D6DEE7BDD6DEC6
                  D6E7D6DEE7DEDEE79CC6DEDEDEE7D6DEE7DEDEE7B5CEDED6DEE784B5D66BADCE
                  6BADCE73B5D68CBDDE2973ADFF00FFFF00FFFF00FFFF00FF2973ADADD6E7FFF7
                  EFFFF7EFDEDEE7FFF7EFFFF7EFFFF7EFD6DEE7F7EFEFFFF7EFF7EFEFEFEFEFEF
                  EFEF94BDDE73B5D673B5D673B5D68CC6DE2973ADFF00FFFF00FFFF00FFFF00FF
                  2973ADB5D6EF84BDDE7BB5D673B5D673B5D673B5D673B5D673B5D673B5D673B5
                  D673B5D673B5D673B5D673B5D673B5D67BB5D684BDDE94C6E72973ADFF00FFFF
                  00FFFF00FFFF00FF2973ADBDDEEFB5DEEFB5D6EFADD6E7ADD6E7ADD6E7ADD6E7
                  ADD6E7ADD6E7ADD6E7ADD6E7ADD6E7ADD6E7ADD6E7ADD6E7B5D6EFB5DEEFBDDE
                  EF2973ADFF00FFFF00FFFF00FFFF00FF7BA5CE2973AD2973AD2973AD2973AD29
                  73AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD2973AD
                  2973AD2973AD2973AD7BA5CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton11Click
                ExplicitLeft = 178
              end
              inherited SpeedButton12: TSpeedButton
                Left = 406
                Hint = 'Informar sa'#237'da da carga - [OCR044]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8BC2DD51ABD751AB
                  D751ABD751ABD751ABD751ABD751ABD751ABD751ABD7FFFFFFB9E9FCFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  51ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD7FFFF
                  FF51ABD790C4DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD7
                  51ABD751ABD7FFFFFF51ABD751ABD7FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF51ABD751ABD751ABD751ABD751ABD751
                  ABD751ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD772B9DCFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF51ABD751ABD751AB
                  D751ABD751ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751
                  ABD7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  51ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD7FFFF
                  FF51ABD751ABD751ABD7FF00FFFF00FFFF00FFFF00FFB88D60AD753CB88D60FF
                  00FFFF00FFFF00FF51ABD751ABD751ABD751ABD7FFFFFFFFFFFF51ABD751ABD7
                  51ABD751ABD7FFFFFF51ABD751ABD751ABD7FF00FFFF00FFFF00FFB88D60AD75
                  3CAD753CAD753CB88D60FF00FFFF00FF51ABD751ABD751ABD751ABD7FFFFFFFF
                  FFFF51ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751ABD7B57D47B67F48
                  FFFFFFAD753CAD753CAD753CAD753CAD753CFFFFFFFF00FF51ABD751ABD751AB
                  D751ABD7FFFFFFFFFFFF51ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751
                  ABD7B3793FB47A40F4EBE3BF9468AD753CAD753CAD753CBF9468F5EDE5FF00FF
                  FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFB2E7FF51ABD751ABD7B3793FB47A40D8BA9CF6F0EABF9468AD753CBF9468F6
                  F0EAD8BA9CFF00FF6ABBE253AEDB53AEDB53AEDBC1F0FFFFFFFFFFFFFFD7FFFF
                  51ABD751ABD751ABD7E2FFFF51ABD751ABD7B3793FB47A40B2783ED8BA9CF4EB
                  E3FFFFFFF4EBE3D8BA9CB2783EFF00FFFF00FFA6CCDE5BB1DB53AEDB53AEDB56
                  B0DBBCEEFFFFFFFF90D3F451ABD751ABD751ABD7DCFFFF51ABD7B3793FB3783E
                  B3783EB3783EB3783EB3783EB3783EC9AA8BB3783EB3793FC7A685FF00FFFF00
                  FF87C1DD53AEDB56AFDB56AFDB7CC5EAFEFEFE51ABD751ABD751ABD751ABD7D9
                  FEFEB47C43DBBFA4FFFFFFFEFEFEFEFEFEFEFEFEB3783FC8A98BB3783EB3783E
                  B2773DB6804BD1BDA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFBF946AEFE3D7FFFFFFFFFFFFFEFEFEFEFEFEB37940C9
                  AA8BB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EFF00FFFF00FFD5C6B7D0AC89FDFDFDFFFFFFFDFD
                  FDFDFDFDB37940C8A98BB3783EB3783EB2773DB2773DB2773DB3783EB2773DB2
                  773DB3783EB2773DB2773DB3783EB2773DB2773DFF00FFFF00FFFF00FFBE9164
                  F2E9E1FFFFFFFEFEFEFEFEFEB3793FC8A98BB3783EB3783EB2773DB2773DB277
                  3DB3783EB2773DB2773DB3783EB2773DB2773DB3783EB2773DB2773DFF00FFFF
                  00FFFF00FFD1BDA8B3793FB37940B37940B37940B3783ECDB49BB3783EB3783E
                  B2773DB2773DB2773DB3783EB2773DB2773DB3783EB2773DB2773DB3783EB277
                  3DB2773DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFB3783EB3783EB2773DB2773DB2773DB3783EB2773DB2
                  773DB3783EB2773DB2773DB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB2773DB2773DB277
                  3DB3783EB2773DB2773DB3783EB2773DB2773DB3783EB2773DB2773DFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783E
                  B2773DB2773DB2773DB3783EB2773DB2773DB3783EB2773DB2773DB3783EB277
                  3DB2773DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFC5A280B37940B2773DB2773DB2773DB3783EB2773DB2773DB3783EB2773D
                  B2773DB3783EB2773DBE946AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton12Click
                ExplicitLeft = 406
              end
              inherited SpeedButton23: TSpeedButton
                Left = 463
                Enabled = False
                Visible = False
                ExplicitLeft = 463
              end
              inherited SpeedButton24: TSpeedButton
                Left = 520
                Enabled = False
                Visible = False
                ExplicitLeft = 520
              end
              inherited SpeedButton25: TSpeedButton
                Left = 691
                Top = -20
                Enabled = False
                Visible = False
                ExplicitLeft = 691
                ExplicitTop = -20
              end
              inherited SpeedButton26: TSpeedButton
                Left = 577
                Enabled = False
                Visible = False
                ExplicitLeft = 577
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 786
          ExplicitHeight = 510
        end
        object tsPesquisaVenda: TTabSheet
          Caption = 'tsPesquisaVenda'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnPesqVenda: TPanel
            Left = 64
            Top = 72
            Width = 449
            Height = 169
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 4
            TabOrder = 0
            OnEnter = pnPesqVendaEnter
            object Splitter3: TSplitter
              Left = 4
              Top = 45
              Width = 437
              Height = 5
              Cursor = crVSplit
              Align = alTop
            end
            object Splitter4: TSplitter
              Left = 4
              Top = 115
              Width = 437
              Height = 5
              Cursor = crVSplit
              Align = alBottom
              ExplicitTop = 132
            end
            object Panel10: TPanel
              Left = 4
              Top = 4
              Width = 437
              Height = 41
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object EditHw1: TEditHw
                Left = 116
                Top = 8
                Width = 121
                Height = 21
                TabOrder = 0
                Text = '                                   0'
                Formato = fInteger
                FormatSize = '0.2'
              end
              object BitBtn12: TBitBtn
                Left = 243
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Procurar'
                Caption = 'Procurar'
                TabOrder = 1
                OnClick = BitBtn12Click
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
              object BitBtn16: TBitBtn
                Left = 324
                Top = 6
                Width = 101
                Height = 25
                Hint = 'Nova Consulta'
                Caption = 'Nova Consulta'
                TabOrder = 2
                Visible = False
                OnClick = BitBtn16Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000420B0000420B00000001000000010000004A0000005A
                  00000052080018520800005A0800006B080021521000295A1000186310000873
                  1000295A1800315A180010631800186B1800185A210039632100108421004263
                  29004A632900186B290010942900527331004A7B3100528C390018AD39007373
                  4200218C4200529442006394420021B54200639C4A0018BD4A0029C65200639C
                  5A0029CE5A0031E76B005A6B730042EF73004A637B00EFBD8400B58C8C00C694
                  8C00BD9C8C00BD949400C6949400F7CE9400C6A59C00C6AD9C00CEAD9C00F7CE
                  9C004A7BA500CEADA500D6B5A500DEBDA500F7D6A500DEC6AD00FFE7AD00CEB5
                  B500F7DEB500FFE7B500D6BDBD00DED6BD00E7DEBD006B9CC600FFEFC600FFF7
                  C600FFF7CE00F7EFD600FFFFD6002184DE001884E700188CE700218CEF00B5D6
                  EF00FFF7EF00FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004B262B4B4B4B
                  4B4B4B4B4B4B4B4B4B4B3F47322C4B4B4B4B4B4B4B4B4B4B4B4B4C4D48322C4B
                  4B4B4B4B4B4B4B4B4B4B4B4D4D46322C4B4B4B4B4B4B4B4B4B4B4B4B4D4C4732
                  2B4B4B4B4B4B4B4B4B4B4B4B4B4D4C452400000001004B4B4B4B4B4B4B4B4E49
                  0E110B07090906334B4B4B4B4B4B4B3934404444081F0519284B4B4B4B000029
                  3A364244211818153D4B4B4B000D040F382D00000520220900004B4B021D1D0C
                  1727171A142523100F2F4B00102325141A172D1B0C1D1D13432E000009222005
                  0000363117040D163E4B4B4B0018180A374F4A2D271C1E412A4B4B4B00051F00
                  4B3C4340383B3A304B4B4B4B4B0009090003120F35354B4B4B4B}
              end
            end
            object Panel11: TPanel
              Left = 4
              Top = 120
              Width = 437
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn14: TBitBtn
                Left = 139
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Utilizar'
                Caption = 'Utilizar'
                Enabled = False
                TabOrder = 0
                OnClick = BitBtn14Click
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  10000300000000020000120B0000120B00000000000000000000007C0000E003
                  00001F0000007467813A813A813661366136613241324132422E422E222E222A
                  222A0226545FA13EA13EC142A23EA23EA23A813A8136623662324232422E422E
                  222A222A0226A13EE146C142C142A23E813A525FED4E6136623662324232422E
                  422E222A222AA13EE146C146C142A13E0E57FF7FFF7F853E8236623662324232
                  422E422E222AC142E14AE146C142ED52FF7FFF7FFF7F54638136623662366232
                  4232422E222AC142014BC146C94ADD7BFF7F7667FF7FFF7FA53E823A62366236
                  62324232222EC142E14A0D53FF7FFF7F546361365463FF7F7667813682366236
                  62364232422EC146E1465463FF7F5463813AC142833EDD7BFF7FC946813A8236
                  62366232422EE146214FC342E94EA13EE24AE246C2420E57FF7FBB776136823A
                  823662364232E14644574557265726530653054F054BA33EB96FFF7F305BA33E
                  A33E823A4132E14A475B475B465726532653054F054FE54AC746FF7FFF7FC946
                  A33EA33E6132E14A675B475B4657465726532553054F054FC446305BFF7FDD7B
                  A746A33E6132014B675F675B465B4657265725532553054F054BA33E986BFF7F
                  7667A33E6136014F675F675B665B465B465725532553054F054FE44AA4427667
                  C946A33E6136014F4457455B4557455724532453044F044F044BE34AE346A23E
                  C342A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                  813A813A7467}
              end
              object BitBtn15: TBitBtn
                Left = 220
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn15Click
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  10000300000000020000120B0000120B00000000000000000000007C0000E003
                  00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
                  83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
                  835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
                  835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
                  835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
                  A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
                  A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
                  A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
                  A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
                  A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
                  E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
                  0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
                  0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
                  C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
                  8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
                  E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
                  C160C260D472}
              end
            end
            object pnPesqVendaText: TPanel
              Left = 4
              Top = 50
              Width = 437
              Height = 65
              Align = alClient
              BevelKind = bkTile
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object Label18: TLabel
                Left = 0
                Top = 0
                Width = 321
                Height = 16
                Align = alClient
                Alignment = taCenter
                Caption = 'Informe o n'#250'mero da venda acima e clique em Procurar'
                Layout = tlCenter
                WordWrap = True
              end
            end
          end
        end
        object tsCarregamento: TTabSheet
          Caption = 'tsCarregamento'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnCarregamento: TPanel
            Left = 3
            Top = 3
            Width = 783
            Height = 507
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            OnEnter = pnCarregamentoEnter
            OnExit = pnCarregamentoExit
            object pgControlCarreamento: TPageControl
              Left = 0
              Top = 0
              Width = 779
              Height = 503
              ActivePage = tsEntrega
              Align = alClient
              Style = tsFlatButtons
              TabOrder = 0
              object tsEntrega: TTabSheet
                Caption = 'tsEntrega'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Panel14: TPanel
                  Left = 0
                  Top = 431
                  Width = 771
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object BitBtn20: TBitBtn
                    Left = 583
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Avan'#231'ar'
                    Caption = 'Avan'#231'ar'
                    TabOrder = 0
                    OnClick = BitBtn20Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F0000007467813A813A813661366136613241324132422E422E222E222A
                      222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232422E422E
                      222A222A0226A13EC142C142C142A23EA23EA23A61366136623662324232422E
                      422E222A222AA13EC146C146C142C142A23EA23E6136A7426136623662324232
                      422E422E222AC142E146E146C146C142C142A23E6136DD7BED4E613662366232
                      4232422E222AC142E146E14AC142A13EA13EA13E6136FF7FFF7FED4E61366236
                      62324232222EC142E14AC142CB4A305B305B305B305BFF7FFF7FFF7F525F6136
                      62364232422EC146014BA142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5463
                      61366232422EE146014FC142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FED4E
                      613662364232E1462453E44ACB4A305B305B305B305BFF7FFF7FFF7FED4E6236
                      823A82364132E14A45574657054F044BE44AE44A823AFF7FFF7FED4E823EA33E
                      A33E823A6132E14A4557465B4657265725532553823ADD7BA742A33EC342C342
                      A33EA23A6132014B455B665B465B465725532553823AA742C342E44AC346C342
                      A342A23E6136014F455B665B665B465745572553A23EE44A044BE44AE346C346
                      C342A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
                      C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                      813A813A7467}
                  end
                  object BitBtn25: TBitBtn
                    Left = 502
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Cancelar'
                    Caption = 'Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn25Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
                      83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
                      835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
                      835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
                      835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
                      A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
                      A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
                      A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
                      A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
                      A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
                      E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
                      0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
                      0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
                      C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
                      8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
                      E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
                      C160C260D472}
                  end
                  object BitBtn31: TBitBtn
                    Left = 664
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Concluir'
                    Caption = 'Concluir'
                    TabOrder = 2
                    OnClick = BitBtn19Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F0000007467813A813A813661366136613241324132422E422E222E222A
                      222A0226545FA13EA13EC142A23EA23EA23A813A8136623662324232422E422E
                      222A222A0226A13EE146C142C142A23E813A525FED4E6136623662324232422E
                      422E222A222AA13EE146C146C142A13E0E57FF7FFF7F853E8236623662324232
                      422E422E222AC142E14AE146C142ED52FF7FFF7FFF7F54638136623662366232
                      4232422E222AC142014BC146C94ADD7BFF7F7667FF7FFF7FA53E823A62366236
                      62324232222EC142E14A0D53FF7FFF7F546361365463FF7F7667813682366236
                      62364232422EC146E1465463FF7F5463813AC142833EDD7BFF7FC946813A8236
                      62366232422EE146214FC342E94EA13EE24AE246C2420E57FF7FBB776136823A
                      823662364232E14644574557265726530653054F054BA33EB96FFF7F305BA33E
                      A33E823A4132E14A475B475B465726532653054F054FE54AC746FF7FFF7FC946
                      A33EA33E6132E14A675B475B4657465726532553054F054FC446305BFF7FDD7B
                      A746A33E6132014B675F675B465B4657265725532553054F054BA33E986BFF7F
                      7667A33E6136014F675F675B665B465B465725532553054F054FE44AA4427667
                      C946A33E6136014F4457455B4557455724532453044F044F044BE34AE346A23E
                      C342A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                      813A813A7467}
                  end
                end
                object DBRadioGroup1: TDBRadioGroup
                  Left = 0
                  Top = 0
                  Width = 771
                  Height = 105
                  Align = alTop
                  Caption = 'Tipo de Carregamento'
                  DataField = 'TIPO_ENTREGA'
                  DataSource = dtmOrdemCarregamento.dsCarga
                  Items.Strings = (
                    'Carregamento para entrega Parcial de Mercadorias'
                    'Carregamento para entrega Total de Mercadorias')
                  ParentBackground = True
                  TabOrder = 1
                  Values.Strings = (
                    'PARCIAL'
                    'TOTAL')
                end
              end
              object tsTotal: TTabSheet
                Caption = 'tsTotal'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Panel13: TPanel
                  Left = 0
                  Top = 431
                  Width = 771
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object BitBtn18: TBitBtn
                    Left = 583
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Avan'#231'ar'
                    Caption = 'Avan'#231'ar'
                    TabOrder = 0
                    OnClick = BitBtn18Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F0000007467813A813A813661366136613241324132422E422E222E222A
                      222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232422E422E
                      222A222A0226A13EC142C142C142A23EA23EA23A61366136623662324232422E
                      422E222A222AA13EC146C146C142C142A23EA23E6136A7426136623662324232
                      422E422E222AC142E146E146C146C142C142A23E6136DD7BED4E613662366232
                      4232422E222AC142E146E14AC142A13EA13EA13E6136FF7FFF7FED4E61366236
                      62324232222EC142E14AC142CB4A305B305B305B305BFF7FFF7FFF7F525F6136
                      62364232422EC146014BA142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5463
                      61366232422EE146014FC142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FED4E
                      613662364232E1462453E44ACB4A305B305B305B305BFF7FFF7FFF7FED4E6236
                      823A82364132E14A45574657054F044BE44AE44A823AFF7FFF7FED4E823EA33E
                      A33E823A6132E14A4557465B4657265725532553823ADD7BA742A33EC342C342
                      A33EA23A6132014B455B665B465B465725532553823AA742C342E44AC346C342
                      A342A23E6136014F455B665B665B465745572553A23EE44A044BE44AE346C346
                      C342A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
                      C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                      813A813A7467}
                  end
                  object BitBtn19: TBitBtn
                    Left = 664
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Concluir'
                    Caption = 'Concluir'
                    TabOrder = 1
                    OnClick = BitBtn19Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F0000007467813A813A813661366136613241324132422E422E222E222A
                      222A0226545FA13EA13EC142A23EA23EA23A813A8136623662324232422E422E
                      222A222A0226A13EE146C142C142A23E813A525FED4E6136623662324232422E
                      422E222A222AA13EE146C146C142A13E0E57FF7FFF7F853E8236623662324232
                      422E422E222AC142E14AE146C142ED52FF7FFF7FFF7F54638136623662366232
                      4232422E222AC142014BC146C94ADD7BFF7F7667FF7FFF7FA53E823A62366236
                      62324232222EC142E14A0D53FF7FFF7F546361365463FF7F7667813682366236
                      62364232422EC146E1465463FF7F5463813AC142833EDD7BFF7FC946813A8236
                      62366232422EE146214FC342E94EA13EE24AE246C2420E57FF7FBB776136823A
                      823662364232E14644574557265726530653054F054BA33EB96FFF7F305BA33E
                      A33E823A4132E14A475B475B465726532653054F054FE54AC746FF7FFF7FC946
                      A33EA33E6132E14A675B475B4657465726532553054F054FC446305BFF7FDD7B
                      A746A33E6132014B675F675B465B4657265725532553054F054BA33E986BFF7F
                      7667A33E6136014F675F675B665B465B465725532553054F054FE44AA4427667
                      C946A33E6136014F4457455B4557455724532453044F044F044BE34AE346A23E
                      C342A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                      813A813A7467}
                  end
                  object BitBtn26: TBitBtn
                    Left = 502
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Cancelar'
                    Caption = 'Cancelar'
                    TabOrder = 2
                    OnClick = BitBtn25Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
                      83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
                      835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
                      835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
                      835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
                      A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
                      A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
                      A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
                      A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
                      A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
                      E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
                      0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
                      0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
                      C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
                      8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
                      E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
                      C160C260D472}
                  end
                end
                object DBRadioGroup2: TDBRadioGroup
                  Left = 0
                  Top = 0
                  Width = 771
                  Height = 105
                  Align = alTop
                  Caption = 'Conferencia de Carga'
                  DataField = 'CONFERIR'
                  DataSource = dtmOrdemCarregamento.dsCarga
                  Items.Strings = (
                    
                      'Sim ( Ao efetuar a conferencia de carga todas as mercadorias dev' +
                      'er'#227'o ser marcadas e informadas as quantidades )'
                    
                      'N'#227'o ( N'#227'o '#233' necess'#225'rio marcar as mercadorias, o sistema ir'#225' faze' +
                      'r isso automaticamente )')
                  ParentBackground = True
                  TabOrder = 1
                  Values.Strings = (
                    'S'
                    'N')
                end
              end
              object tsParcial: TTabSheet
                Caption = 'tsParcial'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Panel15: TPanel
                  Left = 0
                  Top = 431
                  Width = 771
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn22: TBitBtn
                    Left = 664
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Concluir'
                    Caption = 'Concluir'
                    TabOrder = 0
                    OnClick = BitBtn19Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F0000007467813A813A813661366136613241324132422E422E222E222A
                      222A0226545FA13EA13EC142A23EA23EA23A813A8136623662324232422E422E
                      222A222A0226A13EE146C142C142A23E813A525FED4E6136623662324232422E
                      422E222A222AA13EE146C146C142A13E0E57FF7FFF7F853E8236623662324232
                      422E422E222AC142E14AE146C142ED52FF7FFF7FFF7F54638136623662366232
                      4232422E222AC142014BC146C94ADD7BFF7F7667FF7FFF7FA53E823A62366236
                      62324232222EC142E14A0D53FF7FFF7F546361365463FF7F7667813682366236
                      62364232422EC146E1465463FF7F5463813AC142833EDD7BFF7FC946813A8236
                      62366232422EE146214FC342E94EA13EE24AE246C2420E57FF7FBB776136823A
                      823662364232E14644574557265726530653054F054BA33EB96FFF7F305BA33E
                      A33E823A4132E14A475B475B465726532653054F054FE54AC746FF7FFF7FC946
                      A33EA33E6132E14A675B475B4657465726532553054F054FC446305BFF7FDD7B
                      A746A33E6132014B675F675B465B4657265725532553054F054BA33E986BFF7F
                      7667A33E6136014F675F675B665B465B465725532553054F054FE44AA4427667
                      C946A33E6136014F4457455B4557455724532453044F044F044BE34AE346A23E
                      C342A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                      813A813A7467}
                  end
                  object BitBtn27: TBitBtn
                    Left = 502
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Cancelar'
                    Caption = 'Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn25Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
                      83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
                      835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
                      835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
                      835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
                      A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
                      A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
                      A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
                      A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
                      A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
                      E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
                      0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
                      0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
                      C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
                      8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
                      E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
                      C160C260D472}
                  end
                end
                object GroupBox7: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 771
                  Height = 431
                  Align = alClient
                  Caption = 'Mercadorias da Ordem de Carregamento'
                  TabOrder = 0
                  OnEnter = GroupBox7Enter
                  object Panel16: TPanel
                    Left = 2
                    Top = 15
                    Width = 767
                    Height = 414
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 4
                    TabOrder = 0
                    object Panel17: TPanel
                      Left = 4
                      Top = 369
                      Width = 759
                      Height = 41
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label26: TLabel
                        Left = 188
                        Top = 11
                        Width = 85
                        Height = 13
                        Caption = 'Data de Entregua'
                      end
                      object BitBtn23: TBitBtn
                        Left = 658
                        Top = 6
                        Width = 75
                        Height = 25
                        Hint = 'Entregas'
                        Caption = 'Entregas'
                        TabOrder = 0
                        OnClick = BitBtn23Click
                        Glyph.Data = {
                          42020000424D4202000000000000420000002800000010000000100000000100
                          10000300000000020000120B0000120B00000000000000000000007C0000E003
                          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C7362C648D6661F7C1F7C
                          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C3669A64CC15CA158735E39671F7C
                          1F7C1F7C1F7C1F7C1F7C1F7C1F7C12618250C164207D207DC15C945E39673967
                          1F7C1F7C1F7C1F7C1F7CC950A158E070207D207D207D207DC15C945E5A6B5A6B
                          5A6B1F7C1F7C1F7C824C0075207D207D207D207D207D207DC15C94625A6B5A6B
                          5A6B62441F7C1F7C8250207D207D207D207D207D207D207DC15CB5627B6F7B6F
                          7B6F82501F7C1F7C8250207D207D207D207D207D207D207DC15CB5627B6F7B6F
                          7B6F82501F7C1F7C8250207D207D207D207D207D207D207DC15CD5669C739C73
                          9C7382501F7C1F7C8250207D207D207D207D207D207D207DC15CD6669C739C73
                          9C7382501F7C1F7C8250207D207D207D207D207D207D207DC15CD66ABD77BD77
                          BD7782501F7C1F7C8250207D207D207D207D207D207D207DC15CF66ABD77BD77
                          BD7782501F7C1F7C8250207D207D207D207D207D207D207DC15CF76ADE7BDE7B
                          DE7B82501F7C1F7C8250207D207D207D207D207D207DE16C8254F76EDE7BDE7B
                          DE7B82501F7C1F7C82500079E16CC15C825462484951EF599466BD7BFF7FFF7F
                          FF7F82501F7C1F7C84444951315ED66A7B77FF7FFF7FFF7FFF7FFF7FFF7FDD7F
                          377F82501F7C1F7C1F7C084D4951495149514951085182508250825082508250
                          825062441F7C}
                      end
                      object MaskEdit4: TMaskEdit
                        Left = 279
                        Top = 8
                        Width = 120
                        Height = 21
                        BiDiMode = bdLeftToRight
                        EditMask = '!99/99/0000;1;_'
                        MaxLength = 10
                        ParentBiDiMode = False
                        TabOrder = 1
                        Text = '  /  /    '
                      end
                    end
                    object DBGrid4: TDBGrid
                      Left = 4
                      Top = 21
                      Width = 759
                      Height = 266
                      Align = alClient
                      DataSource = dtmOrdemCarregamento.dsCargaIt
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnDrawColumnCell = DBGrid4DrawColumnCell
                      OnDblClick = DBGrid4DblClick
                      OnKeyDown = DBGrid4KeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'SEL'
                          Visible = False
                        end
                        item
                          Expanded = False
                          FieldName = 'NITEM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUM_FAB_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCRICAO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANTIDADE_VENDA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PESO_TOTAL'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUM_VENDA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'GRUPO_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_PROD'
                          Visible = True
                        end>
                    end
                    object Panel18: TPanel
                      Left = 4
                      Top = 328
                      Width = 759
                      Height = 41
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      Caption = 
                        'Para fazer a conferencia clique com o mouse 2 vezes sobre o item' +
                        ' ou pressione Enter e informe a quantidade'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 2
                    end
                    object Panel12: TPanel
                      Left = 4
                      Top = 287
                      Width = 759
                      Height = 41
                      Align = alBottom
                      BevelOuter = bvNone
                      TabOrder = 3
                      Visible = False
                      OnExit = Panel12Exit
                      object Label22: TLabel
                        Left = 487
                        Top = 14
                        Width = 133
                        Height = 13
                        Caption = 'Pressione Esc para cancelar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clGray
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object EditHw2: TEditHw
                        Left = 279
                        Top = 10
                        Width = 121
                        Height = 21
                        TabOrder = 0
                        Text = '                      0,000000'
                        OnKeyDown = EditHw2KeyDown
                        Formato = fFixed
                        FormatSize = '0.6'
                      end
                      object BitBtn24: TBitBtn
                        Left = 406
                        Top = 6
                        Width = 75
                        Height = 25
                        Hint = 'Carregar - [OCR039]'
                        Caption = 'Carregar'
                        TabOrder = 1
                        OnClick = BitBtn24Click
                        Glyph.Data = {
                          42020000424D4202000000000000420000002800000010000000100000000100
                          10000300000000020000120B0000120B00000000000000000000007C0000E003
                          00001F0000001F7C6B2D8410841029251F7C1F7CE71CE71CE71CE71CE71CE71C
                          E71C0A291F7C8C318244817C817C825429250821171217121712171217121712
                          171217121712A514817CBD7FBD7FE574841CE71C7E473D3F1D37FC36FC32FC36
                          1D373D3F1712C6186174BD7FBD7FC564A520E71C7E471D3BDC2EDC2ABC2ADC2A
                          DC2E1D3B1712CE398440415C4158633C8C3108217E471D37DC2EDC2ABC26BC26
                          DC2E1D3717121F7C5249E71CE71C52491F7C6B2D7E473D3BFD32DD2EDC2ADD2E
                          FD323D3B17121F7C1F7C1F7C4A291F7C1F7C8C317E477E477E477E477E477E47
                          7E477E4717121F7C1F7C1F7C4A291F7C1F7C8C31171217121712171217121712
                          1712171217121F7C1F7C1F7C4A291F7C1F7C8C317E475D3F3D3B1D3B3D3B3D3F
                          17121F7C1F7C1F7C1F7C1F7C4E391F7C1F7C8C317E473D3B1D37FD321D373D3B
                          17121F7C1F7C1F7C1F7C1F7C1F7C4E391F7C8C317E473D3F1D371D371D373D3F
                          17121F7C1F7C1F7C1F7C1F7C1F7C1F7CCE398C317E477E435E3F5E3B5E3F5E43
                          17121F7C1F7C1F7C1F7C1F7C1F7C1F7C39678C31171217121712171217121712
                          17121F7C1F7C1F7C1F7C1F7C50558C318C3131461F7C1F7C1F7C1F7C1F7C1F7C
                          1F7C1F7C1F7C635422542258C654B55618631F7C1F7C1F7C1F7C1F7C1F7C1F7C
                          1F7C1F7C1F7C645C2260E768CF711F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                          1F7C1F7C1F7C}
                      end
                    end
                    object CheckBox8: TCheckBox
                      Left = 4
                      Top = 4
                      Width = 759
                      Height = 17
                      Align = alTop
                      Caption = 'Mercadoria retirada no local'
                      TabOrder = 4
                    end
                  end
                end
              end
              object tsHistorico2: TTabSheet
                Caption = 'tsHistorico2'
                ImageIndex = 3
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox8: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 771
                  Height = 431
                  Align = alClient
                  Caption = 'Informa'#231#245'es sobre o Carregamento / Entrega'
                  TabOrder = 0
                  object Panel19: TPanel
                    Left = 2
                    Top = 15
                    Width = 767
                    Height = 414
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 4
                    TabOrder = 0
                    object Panel20: TPanel
                      Left = 4
                      Top = 369
                      Width = 759
                      Height = 41
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object BitBtn21: TBitBtn
                        Left = 658
                        Top = 6
                        Width = 75
                        Height = 25
                        Hint = 'Voltar'
                        Caption = 'Voltar'
                        TabOrder = 0
                        OnClick = BitBtn21Click
                        Glyph.Data = {
                          42020000424D4202000000000000420000002800000010000000100000000100
                          10000300000000020000120B0000120B00000000000000000000007C0000E003
                          00001F0000007467813A813A813661366136613241324132422E422E222E222A
                          222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232412E212E
                          212A222A0226A13EE146C142C142A23EA23EA23A823A61366236212EAC4AF056
                          8842012A222AA13EE146C146C142C142A23EA23E613641328236212EFF7FFF7F
                          776B212E222AC142E14AE146C146C142C142413644364132823A212EFF7FFF7F
                          776B212E222AC142014BE14AE146C1464136AC4A776B4136823A212EFF7FFF7F
                          776B212E222EC142014B014BE1464132CE52FF7F776B41326136012EFF7FFF7F
                          776B212E422EC146014FE14A2132345FFF7FFF7FDD7BF056F0565667FF7FFF7F
                          345F4132422EE146E14A43365667FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                          884261364232E146A242CE52FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF056
                          413282364132E14A4657833E8842996FFF7FFF7FDD7BAA468842884244364236
                          A33E823A6132E14A675B465BE54E4236CE52DD7B776B823AE44AE346C342C342
                          A33EA23A6132014B675F665B465B4657A3422336CE52823EE44AE346C346C342
                          A33EA23E6136014F675F665B665B465745572553623A823E044BE34AE346C346
                          C242A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
                          C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                          813A813A7467}
                      end
                      object BitBtn28: TBitBtn
                        Left = 210
                        Top = 6
                        Width = 335
                        Height = 25
                        Hint = 'Remover informa'#231#227'o de Entrega - [OCR040]'
                        Caption = 'Remover informa'#231#227'o de Entrega'
                        TabOrder = 1
                        OnClick = BitBtn28Click
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
                    object DBGrid5: TDBGrid
                      Left = 4
                      Top = 45
                      Width = 759
                      Height = 324
                      Align = alClient
                      DataSource = dtmOrdemCarregamento.dsCargaItH
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NITEM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NITEM_H'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANTIDADE_ENTREGUE'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_ENTREGA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_CARREGAMENTO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_HORA_CARREGAMENTO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'TIPO_ENTREGA'
                          Visible = True
                        end>
                    end
                    object Panel21: TPanel
                      Left = 4
                      Top = 4
                      Width = 759
                      Height = 41
                      Align = alTop
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 2
                      object Label23: TLabel
                        Left = 11
                        Top = 12
                        Width = 48
                        Height = 13
                        Caption = 'Produto:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label24: TLabel
                        Left = 529
                        Top = 12
                        Width = 68
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Quantidade:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBText5: TDBText
                        Left = 65
                        Top = 12
                        Width = 100
                        Height = 17
                        DataField = 'NUM_FAB_PROD'
                        DataSource = dtmOrdemCarregamento.dsCargaIt
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBText6: TDBText
                        Left = 171
                        Top = 12
                        Width = 352
                        Height = 17
                        DataField = 'DESCRICAO'
                        DataSource = dtmOrdemCarregamento.dsCargaIt
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBText7: TDBText
                        Left = 603
                        Top = 12
                        Width = 150
                        Height = 17
                        DataField = 'QUANTIDADE_VENDA'
                        DataSource = dtmOrdemCarregamento.dsCargaIt
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                    end
                  end
                end
                object Panel22: TPanel
                  Left = 0
                  Top = 431
                  Width = 771
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                end
              end
            end
          end
        end
        object tsImpressao: TTabSheet
          Caption = 'tsImpressao'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnImpressao: TPanel
            Left = 1
            Top = 0
            Width = 608
            Height = 457
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            OnEnter = pnImpressaoEnter
            object RadioGroup1: TRadioGroup
              Left = 6
              Top = 6
              Width = 592
              Height = 123
              Align = alClient
              Caption = 'Tipo de Impress'#227'o'
              TabOrder = 0
            end
            object Panel23: TPanel
              Left = 6
              Top = 406
              Width = 592
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn29: TBitBtn
                Left = 216
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Imprimir'
                Caption = 'Imprimir'
                TabOrder = 0
                OnClick = BitBtn29Click
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  10000300000000020000120B0000120B00000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                  4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                  92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                  EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                  734EF75E104210429452AE358610861086108610861086108610861086108610
                  AE35945210423146F75EAE358610861086108610861086108610861086108610
                  AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                  9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                  F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                  B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                  1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                  1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
              end
              object BitBtn30: TBitBtn
                Left = 297
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn30Click
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  10000300000000020000120B0000120B00000000000000000000007C0000E003
                  00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
                  83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
                  835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
                  835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
                  835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
                  A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
                  A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
                  A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
                  A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
                  A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
                  E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
                  0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
                  0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
                  C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
                  8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
                  E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
                  C160C260D472}
              end
            end
            object Panel24: TPanel
              Left = 6
              Top = 219
              Width = 592
              Height = 187
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 2
              Visible = False
              object Label25: TLabel
                Left = 6
                Top = 6
                Width = 161
                Height = 13
                Align = alTop
                Caption = 'Selecione os Carregamentos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBGrid6: TDBGrid
                Left = 6
                Top = 19
                Width = 576
                Height = 158
                Align = alClient
                DataSource = dtmOrdemCarregamento.dsEntr
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = DBGrid6CellClick
                OnDrawColumnCell = DBGrid6DrawColumnCell
                OnDblClick = DBGrid6DblClick
                OnKeyDown = DBGrid6KeyDown
                OnMouseUp = DBGrid6MouseUp
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SEL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_ENTREGA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_ENTREGA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_CARREGAMENTO'
                    Visible = True
                  end>
              end
            end
            object Panel25: TPanel
              Left = 6
              Top = 189
              Width = 592
              Height = 30
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 3
              object CheckBox4: TCheckBox
                Left = 262
                Top = 6
                Width = 106
                Height = 17
                Caption = 'Imprimir Descri'#231#227'o'
                TabOrder = 0
              end
              object CheckBox6: TCheckBox
                Left = 374
                Top = 6
                Width = 89
                Height = 17
                Caption = 'Nome Fantasia'
                TabOrder = 1
              end
              object CheckBox9: TCheckBox
                Left = 6
                Top = 6
                Width = 77
                Height = 17
                Caption = 'Detalhado'
                TabOrder = 2
                OnClick = CheckBox9Click
              end
              object CheckBox10: TCheckBox
                Left = 478
                Top = 6
                Width = 106
                Height = 17
                Caption = 'Imprimir Aloca'#231#227'o'
                TabOrder = 3
              end
              object CheckBox5: TCheckBox
                Left = 89
                Top = 6
                Width = 167
                Height = 17
                Caption = 'Detalhar recebimento pedidos'
                TabOrder = 4
              end
            end
            object RadioGroup3: TRadioGroup
              Left = 6
              Top = 159
              Width = 592
              Height = 30
              Align = alBottom
              Caption = 'Ordenar Mercadorias Por'
              Columns = 3
              ItemIndex = 0
              Items.Strings = (
                'Aloca'#231#227'o'
                'C'#243'digo'
                'Descri'#231#227'o')
              TabOrder = 4
            end
            object RadioGroup2: TRadioGroup
              Left = 6
              Top = 129
              Width = 592
              Height = 30
              Align = alBottom
              Caption = 'Ordenar Registros por'
              Columns = 4
              ItemIndex = 0
              Items.Strings = (
                'Clientes'
                'Cidades'
                'Localidades'
                'Num Venda')
              TabOrder = 5
            end
          end
        end
        object tsItens: TTabSheet
          Caption = 'tsItens'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnItens: TPanel
            Left = 0
            Top = 0
            Width = 789
            Height = 510
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            OnEnter = pnItensEnter
            object pgItens: TPageControl
              Left = 0
              Top = 0
              Width = 785
              Height = 506
              ActivePage = tsItens2
              Align = alClient
              Style = tsFlatButtons
              TabOrder = 0
              object tsItens2: TTabSheet
                Caption = 'tsItens2'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox5: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 777
                  Height = 475
                  Align = alClient
                  Caption = 'Mercadorias da Ordem de Carregamento'
                  TabOrder = 0
                  object Panel5: TPanel
                    Left = 2
                    Top = 15
                    Width = 773
                    Height = 458
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 4
                    TabOrder = 0
                    object Panel6: TPanel
                      Left = 4
                      Top = 413
                      Width = 765
                      Height = 41
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object BitBtn9: TBitBtn
                        Left = 11
                        Top = 6
                        Width = 254
                        Height = 25
                        Hint = 'Adicionar Mercadorias a partir de uma venda - [OCR036]'
                        Caption = 'Adicionar Mercadorias a partir de uma venda'
                        TabOrder = 0
                        OnClick = BitBtn9Click
                        Glyph.Data = {
                          42020000424D4202000000000000420000002800000010000000100000000100
                          10000300000000020000120B0000120B00000000000000000000007C0000E003
                          00001F0000001F7C1F7CC469A265A265A265A265A265A265A265A265A265A265
                          C4691F7C1F7C1F7C1F7CA2656D7B217201724D7B0172E1714D7BE171E1712C7B
                          A2651F7C1F7C1F7C1F7CC269400C607A607A400C407A207A400C207A207A400C
                          A2691F7C1F7C1F7C1F7CE2696176407620762076007600760076007600760076
                          C2691F7C1F7C1F7CA96D026E6D7B207200724D7BE071E0714D7BC071C0714D7B
                          A16DA96D1F7C1F7CA265016E400CE06DC06D200CA06DA06D200CA06DA06D200C
                          A16DA2651F7C8E6DA2654040203C203C203C203C203C203C203C203C203C203C
                          2040A2658E6DA265E67EE77EE87E097F097F097F097F097F097F097F097F097F
                          E77EA57EA265A265C17E407E407E407E407E407E8D3186106541407E407E407E
                          407E607EA265A2654A7F2A7F2A7F2A7F2A7F2A7F86108D310921C9412A7F2A7F
                          2A7F2A7FA265A6694D340000EE6584180000200CCD3909218D31092128416675
                          6675A265A6691F7C1F7C0410EE6584180000A234576FCE3D09218D31E81C073D
                          66751F7C1F7C1F7C1F7C955400000410EB2C035D576F576F0735E81C8D31C718
                          EA441F7C1F7C1F7C1F7C1F7CE948CE501F7C035D035D035D035DCE4C903C8D31
                          6F381F7C1F7C1F7C1F7C1F7CE948CE501F7C1F7C1F7C1F7C1F7C1F7C1F7C6F38
                          144D1F7C1F7C1F7C1F7C1F7C04100B2C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                          1F7C1F7C1F7C}
                      end
                      object BitBtn10: TBitBtn
                        Left = 682
                        Top = 6
                        Width = 75
                        Height = 25
                        Hint = 'Voltar'
                        Caption = 'Voltar'
                        TabOrder = 1
                        OnClick = BitBtn10Click
                        Glyph.Data = {
                          42020000424D4202000000000000420000002800000010000000100000000100
                          10000300000000020000120B0000120B00000000000000000000007C0000E003
                          00001F0000007467813A813A813661366136613241324132422E422E222E222A
                          222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232412E212E
                          212A222A0226A13EE146C142C142A23EA23EA23A823A61366236212EAC4AF056
                          8842012A222AA13EE146C146C142C142A23EA23E613641328236212EFF7FFF7F
                          776B212E222AC142E14AE146C146C142C142413644364132823A212EFF7FFF7F
                          776B212E222AC142014BE14AE146C1464136AC4A776B4136823A212EFF7FFF7F
                          776B212E222EC142014B014BE1464132CE52FF7F776B41326136012EFF7FFF7F
                          776B212E422EC146014FE14A2132345FFF7FFF7FDD7BF056F0565667FF7FFF7F
                          345F4132422EE146E14A43365667FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                          884261364232E146A242CE52FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF056
                          413282364132E14A4657833E8842996FFF7FFF7FDD7BAA468842884244364236
                          A33E823A6132E14A675B465BE54E4236CE52DD7B776B823AE44AE346C342C342
                          A33EA23A6132014B675F665B465B4657A3422336CE52823EE44AE346C346C342
                          A33EA23E6136014F675F665B665B465745572553623A823E044BE34AE346C346
                          C242A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
                          C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                          813A813A7467}
                      end
                      object BitBtn11: TBitBtn
                        Left = 424
                        Top = 6
                        Width = 164
                        Height = 25
                        Hint = 'Ver Histor'#237'co de Entrega'
                        Caption = 'Ver Histor'#237'co de Entrega'
                        TabOrder = 2
                        OnClick = BitBtn11Click
                        Glyph.Data = {
                          42020000424D4202000000000000420000002800000010000000100000000100
                          10000300000000020000120B0000120B00000000000000000000007C0000E003
                          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C7362C648D6661F7C1F7C
                          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C3669A64CC15CA158735E39671F7C
                          1F7C1F7C1F7C1F7C1F7C1F7C1F7C12618250C164207D207DC15C945E39673967
                          1F7C1F7C1F7C1F7C1F7CC950A158E070207D207D207D207DC15C945E5A6B5A6B
                          5A6B1F7C1F7C1F7C824C0075207D207D207D207D207D207DC15C94625A6B5A6B
                          5A6B62441F7C1F7C8250207D207D207D207D207D207D207DC15CB5627B6F7B6F
                          7B6F82501F7C1F7C8250207D207D207D207D207D207D207DC15CB5627B6F7B6F
                          7B6F82501F7C1F7C8250207D207D207D207D207D207D207DC15CD5669C739C73
                          9C7382501F7C1F7C8250207D207D207D207D207D207D207DC15CD6669C739C73
                          9C7382501F7C1F7C8250207D207D207D207D207D207D207DC15CD66ABD77BD77
                          BD7782501F7C1F7C8250207D207D207D207D207D207D207DC15CF66ABD77BD77
                          BD7782501F7C1F7C8250207D207D207D207D207D207D207DC15CF76ADE7BDE7B
                          DE7B82501F7C1F7C8250207D207D207D207D207D207DE16C8254F76EDE7BDE7B
                          DE7B82501F7C1F7C82500079E16CC15C825462484951EF599466BD7BFF7FFF7F
                          FF7F82501F7C1F7C84444951315ED66A7B77FF7FFF7FFF7FFF7FFF7FFF7FDD7F
                          377F82501F7C1F7C1F7C084D4951495149514951085182508250825082508250
                          825062441F7C}
                      end
                      object BitBtn17: TBitBtn
                        Left = 271
                        Top = 6
                        Width = 147
                        Height = 25
                        Hint = 'Remover Mercadorias - [OCR035]'
                        Caption = 'Remover Mercadorias'
                        TabOrder = 4
                        OnClick = BitBtn17Click
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
                      object BitBtn32: TBitBtn
                        Left = 593
                        Top = 6
                        Width = 83
                        Height = 25
                        Hint = 'Imprimir Itens'
                        Caption = 'Imprimir'
                        TabOrder = 3
                        OnClick = BitBtn32Click
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000F30E0000F30E00000001000000000000000000000000
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
                          FDFDFDFDFDFDFDFDFDFDFDFDFDFDF708F6F6F6F608EDF7FDFDFDFDFDFDFD52F6
                          F6070708FFA452FDFDFDFDFD9B5252F6F6070808FFA452529BFDFD9B525252F6
                          08A4A4F7F6A4525252FDFD9BA49B9B525252525252529B075352FDA4F7ADADF7
                          F7A4A4ADADADA5BCAD52FDF7089C9CE4E4E5E5E4E4E4DCAC0852FD070893E4E4
                          E4E4A4E4E4E4E4E5F69BFD070749529B9B9B9B9B9B5252F707F7FD07074952FF
                          FFFFFFFFFFED52ED07FDFDFDF6F6F6F6F6F6FFFFF608F6F6F6FDFDFDFDFDFD08
                          F6FF07070708FDFDFDFDFDFDFDFDFD07F60807FFFF07FDFDFDFDFDFDFDFDFD07
                          F60707FFF6FDFDFDFDFDFDFDFDFDFDF707070707FDFDFDFDFDFD}
                      end
                    end
                    object DBGrid2: TDBGrid
                      Left = 290
                      Top = 4
                      Width = 479
                      Height = 409
                      Align = alClient
                      DataSource = dtmOrdemCarregamento.dsCargaIt
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      PopupMenu = PopupMenu3
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnColumnMoved = DBGrid2ColumnMoved
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NITEM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUM_FAB_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCRICAO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANTIDADE_VENDA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PESO_TOTAL'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUM_VENDA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'GRUPO_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_PROD'
                          Visible = True
                        end>
                    end
                    object GroupBox12: TGroupBox
                      Left = 4
                      Top = 4
                      Width = 286
                      Height = 409
                      Align = alLeft
                      Caption = 'Configura'#231#227'o das Colunas'
                      TabOrder = 2
                      Visible = False
                      object ScrollBox4: TScrollBox
                        Left = 2
                        Top = 15
                        Width = 282
                        Height = 392
                        Align = alClient
                        BevelInner = bvNone
                        BevelOuter = bvNone
                        TabOrder = 0
                        OnEnter = ScrollBox4Enter
                      end
                    end
                  end
                end
              end
              object tsHistorico: TTabSheet
                Caption = 'tsHistorico'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox6: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 777
                  Height = 475
                  Align = alClient
                  Caption = 'Hist'#243'rico de Mercadorias da Ordem de Carregamento'
                  TabOrder = 0
                  object Panel7: TPanel
                    Left = 2
                    Top = 15
                    Width = 773
                    Height = 458
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 4
                    TabOrder = 0
                    object Panel8: TPanel
                      Left = 4
                      Top = 413
                      Width = 765
                      Height = 41
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object BitBtn13: TBitBtn
                        Left = 682
                        Top = 6
                        Width = 75
                        Height = 25
                        Caption = 'Voltar'
                        TabOrder = 0
                        OnClick = BitBtn13Click
                        Glyph.Data = {
                          42020000424D4202000000000000420000002800000010000000100000000100
                          10000300000000020000120B0000120B00000000000000000000007C0000E003
                          00001F0000007467813A813A813661366136613241324132422E422E222E222A
                          222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232412E212E
                          212A222A0226A13EE146C142C142A23EA23EA23A823A61366236212EAC4AF056
                          8842012A222AA13EE146C146C142C142A23EA23E613641328236212EFF7FFF7F
                          776B212E222AC142E14AE146C146C142C142413644364132823A212EFF7FFF7F
                          776B212E222AC142014BE14AE146C1464136AC4A776B4136823A212EFF7FFF7F
                          776B212E222EC142014B014BE1464132CE52FF7F776B41326136012EFF7FFF7F
                          776B212E422EC146014FE14A2132345FFF7FFF7FDD7BF056F0565667FF7FFF7F
                          345F4132422EE146E14A43365667FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                          884261364232E146A242CE52FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF056
                          413282364132E14A4657833E8842996FFF7FFF7FDD7BAA468842884244364236
                          A33E823A6132E14A675B465BE54E4236CE52DD7B776B823AE44AE346C342C342
                          A33EA23A6132014B675F665B465B4657A3422336CE52823EE44AE346C346C342
                          A33EA23E6136014F675F665B665B465745572553623A823E044BE34AE346C346
                          C242A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
                          C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                          813A813A7467}
                      end
                      object CheckBox2: TCheckBox
                        Left = 11
                        Top = 10
                        Width = 249
                        Height = 17
                        Caption = 'Mostrar apenas do Item Selecionado'
                        Checked = True
                        State = cbChecked
                        TabOrder = 1
                        OnClick = CheckBox2Click
                      end
                    end
                    object DBGrid3: TDBGrid
                      Left = 4
                      Top = 45
                      Width = 765
                      Height = 368
                      Align = alClient
                      DataSource = dtmOrdemCarregamento.dsCargaItH
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NITEM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NITEM_H'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANTIDADE_ENTREGUE'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_ENTREGA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_CARREGAMENTO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_HORA_CARREGAMENTO'
                          Visible = True
                        end>
                    end
                    object Panel9: TPanel
                      Left = 4
                      Top = 4
                      Width = 765
                      Height = 41
                      Align = alTop
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 2
                      object Label16: TLabel
                        Left = 11
                        Top = 12
                        Width = 48
                        Height = 13
                        Caption = 'Produto:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label17: TLabel
                        Left = 529
                        Top = 12
                        Width = 68
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Quantidade:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBText2: TDBText
                        Left = 65
                        Top = 12
                        Width = 100
                        Height = 17
                        DataField = 'NUM_FAB_PROD'
                        DataSource = dtmOrdemCarregamento.dsCargaIt
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBText3: TDBText
                        Left = 171
                        Top = 12
                        Width = 352
                        Height = 17
                        DataField = 'DESCRICAO'
                        DataSource = dtmOrdemCarregamento.dsCargaIt
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBText4: TDBText
                        Left = 603
                        Top = 12
                        Width = 150
                        Height = 17
                        DataField = 'QUANTIDADE_VENDA'
                        DataSource = dtmOrdemCarregamento.dsCargaIt
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                    end
                  end
                end
              end
            end
          end
        end
        object tsMontagem: TTabSheet
          Caption = 'tsMontagem'
          ImageIndex = 7
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object z: TPageControl
            Left = 0
            Top = 0
            Width = 786
            Height = 510
            ActivePage = TabSheet6
            Align = alClient
            TabOrder = 0
            object TabSheet4: TTabSheet
              Caption = 'Selecao'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnEscolherMontagem: TPanel
                Left = 176
                Top = 64
                Width = 393
                Height = 145
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object BitBtn33: TBitBtn
                  Left = 16
                  Top = 16
                  Width = 353
                  Height = 49
                  Caption = 'Montar carga por data base e cidades'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnClick = BitBtn33Click
                end
                object BitBtn35: TBitBtn
                  Left = 16
                  Top = 71
                  Width = 353
                  Height = 49
                  Caption = 'Montar carga usando rotas'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnClick = BitBtn35Click
                end
              end
            end
            object TabSheet5: TTabSheet
              Caption = 'Data Base'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnMontagem: TPanel
                Left = 3
                Top = 3
                Width = 783
                Height = 504
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                OnEnter = pnMontagemEnter
                object Panel27: TPanel
                  Left = 6
                  Top = 53
                  Width = 771
                  Height = 404
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Splitter6: TSplitter
                    Left = 319
                    Top = 0
                    Height = 404
                    ExplicitLeft = 384
                    ExplicitTop = 64
                    ExplicitHeight = 100
                  end
                  object GroupBox9: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 319
                    Height = 404
                    Align = alLeft
                    Caption = 'Cidades'
                    TabOrder = 0
                    object gridCidades: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 315
                      Height = 370
                      Align = alClient
                      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnCellClick = gridCidadesCellClick
                      OnDrawColumnCell = gridCidadesDrawColumnCell
                      OnDblClick = gridCidadesDblClick
                      OnKeyDown = gridCidadesKeyDown
                      OnMouseUp = gridCidadesMouseUp
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'SEL'
                          Title.Caption = '...'
                          Width = 18
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CIDADE'
                          Title.Caption = 'Cidade'
                          Width = 140
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PESO_BRUTO'
                          Title.Caption = 'Peso'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QTDE_VENDAS'
                          Title.Caption = 'Qtde Pedidos'
                          Width = 67
                          Visible = True
                        end>
                    end
                    object ProgressBar1: TProgressBar
                      Left = 2
                      Top = 385
                      Width = 315
                      Height = 17
                      Align = alBottom
                      TabOrder = 1
                      Visible = False
                    end
                  end
                  object GroupBox11: TGroupBox
                    Left = 322
                    Top = 0
                    Width = 449
                    Height = 404
                    Align = alClient
                    Caption = 'Clientes'
                    TabOrder = 1
                    object gridClientes: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 445
                      Height = 360
                      Align = alClient
                      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnCellClick = gridClientesCellClick
                      OnDrawColumnCell = gridClientesDrawColumnCell
                      OnDblClick = gridClientesDblClick
                      OnKeyDown = gridClientesKeyDown
                      OnMouseUp = gridClientesMouseUp
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'SEL'
                          Title.Caption = '...'
                          Width = 18
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'RAZAO'
                          Title.Caption = 'Cliente'
                          Width = 269
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PESO_BRUTO'
                          Title.Caption = 'Peso'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QTDE_VENDAS'
                          Title.Caption = 'Qtde Pedidos'
                          Width = 67
                          Visible = True
                        end>
                    end
                    object Panel30: TPanel
                      Left = 2
                      Top = 375
                      Width = 445
                      Height = 27
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      BorderWidth = 4
                      TabOrder = 1
                      object Panel26: TPanel
                        Left = 4
                        Top = 4
                        Width = 215
                        Height = 15
                        Align = alLeft
                        BevelOuter = bvNone
                        Caption = 'Peso Total: 5999 KG'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                      end
                      object Panel28: TPanel
                        Left = 222
                        Top = 4
                        Width = 215
                        Height = 15
                        Align = alRight
                        BevelOuter = bvNone
                        Caption = 'Qtde total de Pedidos: 1999'
                        TabOrder = 1
                      end
                    end
                  end
                end
                object Panel29: TPanel
                  Left = 6
                  Top = 457
                  Width = 771
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object btConcluirMontagem: TBitBtn
                    Left = 679
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Concluir'
                    TabOrder = 0
                    OnClick = btConcluirMontagemClick
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F0000007467813A813A813661366136613241324132422E422E222E222A
                      222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232422E422E
                      222A222A0226A13EC142C142C142A23EA23EA23A61366136623662324232422E
                      422E222A222AA13EC146C146C142C142A23EA23E6136A7426136623662324232
                      422E422E222AC142E146E146C146C142C142A23E6136DD7BED4E613662366232
                      4232422E222AC142E146E14AC142A13EA13EA13E6136FF7FFF7FED4E61366236
                      62324232222EC142E14AC142CB4A305B305B305B305BFF7FFF7FFF7F525F6136
                      62364232422EC146014BA142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5463
                      61366232422EE146014FC142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FED4E
                      613662364232E1462453E44ACB4A305B305B305B305BFF7FFF7FFF7FED4E6236
                      823A82364132E14A45574657054F044BE44AE44A823AFF7FFF7FED4E823EA33E
                      A33E823A6132E14A4557465B4657265725532553823ADD7BA742A33EC342C342
                      A33EA23A6132014B455B665B465B465725532553823AA742C342E44AC346C342
                      A342A23E6136014F455B665B665B465745572553A23EE44A044BE44AE346C346
                      C342A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
                      C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                      813A813A7467}
                  end
                  object BitBtn34: TBitBtn
                    Left = 598
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = 'C&ancelar'
                    TabOrder = 1
                    OnClick = BitBtn34Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
                      83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
                      835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
                      835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
                      835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
                      A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
                      A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
                      A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
                      A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
                      A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
                      E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
                      0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
                      0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
                      C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
                      8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
                      E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
                      C160C260D472}
                  end
                  object Panel31: TPanel
                    Left = 0
                    Top = 0
                    Width = 318
                    Height = 37
                    Align = alLeft
                    BevelOuter = bvNone
                    BorderWidth = 8
                    TabOrder = 2
                    object DBLookupComboBox5: TDBLookupComboBox
                      Left = 49
                      Top = 8
                      Width = 261
                      Height = 21
                      Align = alClient
                      DropDownWidth = 700
                      KeyField = 'COD_VEIC'
                      ListField = 'MODELO;PLACA'
                      ListSource = dtmOrdemCarregamento.dsVeicTrCons2
                      TabOrder = 0
                    end
                    object Panel32: TPanel
                      Left = 8
                      Top = 8
                      Width = 41
                      Height = 21
                      Align = alLeft
                      BevelOuter = bvNone
                      Caption = 'Ve'#237'culo'
                      TabOrder = 1
                    end
                  end
                  object Panel33: TPanel
                    Left = 318
                    Top = 0
                    Width = 274
                    Height = 37
                    Align = alLeft
                    BevelOuter = bvNone
                    BorderWidth = 11
                    TabOrder = 3
                    object Label27: TLabel
                      Left = 11
                      Top = 11
                      Width = 111
                      Height = 15
                      Align = alLeft
                      Alignment = taRightJustify
                      AutoSize = False
                      Caption = 'Peso M'#225'ximo Ve'#237'culo   '
                      FocusControl = DBEdit8
                      ExplicitLeft = 10
                      ExplicitTop = 10
                      ExplicitHeight = 17
                    end
                    object DBText8: TDBText
                      Left = 122
                      Top = 11
                      Width = 141
                      Height = 15
                      Align = alClient
                      DataField = 'PESO_MAXIMO'
                      DataSource = dtmOrdemCarregamento.dsVeicTrCons2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      ExplicitLeft = 154
                      ExplicitTop = 10
                      ExplicitWidth = 120
                      ExplicitHeight = 17
                    end
                  end
                end
                object GroupBox10: TGroupBox
                  Left = 6
                  Top = 6
                  Width = 771
                  Height = 47
                  Align = alTop
                  Caption = 'Pesquisa'
                  TabOrder = 0
                  object Label29: TLabel
                    Left = 53
                    Top = 20
                    Width = 49
                    Height = 13
                    Caption = 'Data Base'
                  end
                  object imgMontagem: TImage
                    Left = 529
                    Top = 11
                    Width = 24
                    Height = 30
                    Cursor = crHelp
                    ParentShowHint = False
                    Picture.Data = {
                      055449636F6E0000010001001818000001002000880900001600000028000000
                      1800000030000000010020000000000060090000000000000000000000000000
                      00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                      FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                      FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                      FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000021
                      0000002700000000000000000000000000000000000000000000000000000000
                      FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000000000000023170B0088
                      27150286060400080E0700000F0800000F0800000F0800000F0800000F080000
                      FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                      000000000000000000000000000000000000000604000050492A0CC3BE9263FF
                      B4895BEE5D2F0033492702004122010041220100412201004222010042220100
                      FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                      0000000400000022000000450200005F1F0C0097774F26EBE0B98EFFFFECCBFF
                      C29667E0502700210A0600000000000000000000000000000000000000000000
                      FFFFFF00FFFFFF0003010000010000000000000000000000000000000000002A
                      150800844B2B0ACB805931ED9B754DF7BF986DFFEFCEA7FFFFE9CBFFFFE5C2FF
                      996F44E20000003A000000000000000000000000020100000301000003010000
                      FFFFFF00FFFFFF00030100000100000000000000000000040700005A573715CF
                      BC9468FFF5D8B7FFFFE7C8FFFFE8C8FFFFECCEFFFFEED2FFFFECCEFFFFE5C5FF
                      C8A176FF5E3D1BD70E0300730000000F00000000020100000301000003010000
                      FFFFFF00FFFFFF0003010000000000000000000D1A0A007F8A6337EFEFD1AFFF
                      FFF1DAFFFFEAD0FFFFE8CDFFFFE9CFFFF2D2B6FFBF7855FFE0B293FFFFEACEFF
                      FFEDD1FFF7D8B4FFAB8255FA2D17019F0000001B010000000301000003010000
                      FFFFFF00FFFFFF00010000000000000425100086A07446FCFBE2C6FFFFF4DFFF
                      FFEAD3FFFFEAD2FFFFEAD1FFFFEED6FFDDB296FF962300FF9A3109FFDDAF91FF
                      FFEDD2FFFFEBD0FFFFEED0FFCEA67AFF3B2004A5000000110201000003010000
                      FFFFFF00FFFFFF00000000031508004F956636F9ECD3B5FFFFF5E3FFFFEDD9FF
                      FFECD8FFFFECD7FFFFEBD6FFFFEFD9FFE8C7AEFF992B00FFA64C26FFA6502CFF
                      E9C5AAFFFFECD3FFFFEAD1FFFFF2D8FFCBA479FF291302800000000003010000
                      FFFFFF00FFFFFF0017090031623B11BBCEAB84FFF6E5D2FFFFF2E2FFFFEFDEFF
                      FFEFDCFFFFEEDCFFFFEEDBFFFFEFDCFFF7E1CDFF9F370AFFC5805AFFD6AB92FF
                      E6C5ACFFFFEED7FFFFEAD2FFFFEBD4FFFFEED5FFA0784DF00D05003600000000
                      FFFFFF00FFFFFF0046270772936A3FE9D7B998FFFEF1E3FFFFF3E4FFFFF2E3FF
                      FFF1E2FFFFF1E0FFFFF1E0FFFFF1E0FFFDEDDCFFC06F3FFFC97B49FFF9E5D2FF
                      FFF8E5FFFFECD9FFFFEDD7FFFFECD6FFFFF0DBFFF2D7B9FF4E2D0B9C0A00001A
                      FFFFFF00FFFFFF00673C0E98A88157F6D8BD9EFFFFF6EBFFFFF5E9FFFFF4E7FF
                      FFF3E6FFFFF3E5FFFFF2E4FFFFF5E6FFFCF1E5FFD9A079FFD88543FFF4DAC4FF
                      FFF5E6FFFFEFDFFFFFEFDDFFFFEEDCFFFFEEDCFFFFF3DDFF99754EDA321B0454
                      FFFFFF00FFFFFF007946109EB1895EF8D9BD9EFFFCF3E8FFFFF7EEFFFFF6ECFF
                      FFF6ECFFFFF5EAFFFFF8EDFFF6E7D9FFC58C72FFD5A587FFD47B32FFEFD0B5FF
                      FFF6EBFFFFF2E3FFFFF1E2FFFFF1E1FFFFF1E1FFFFF7E6FFC4A98CF1613C148C
                      FFFFFF00FFFFFF007D480E87AE8456EFD6B997FFF4E8DBFFFFFCF6FFFFF8F0FF
                      FFF8EFFFFFF8EFFFFFF9F0FFFAF5ECFFBD7D62FFA84E22FFC15F1EFFDAA889FF
                      FEF5ECFFFFF5E9FFFFF4E7FFFFF4E6FFFFF3E6FFFFFBEFFFDCC5ACFA855422A2
                      FFFFFF00FFFFFF00743E05479A6934D5D5B38EFFEAD8C3FFFFFEFAFFFFFAF5FF
                      FFFAF3FFFFF9F4FFFFF9F2FFFFFCF5FFFAF3ECFFBC7B5EFFA73D08FFC07D5CFF
                      FEF7EEFFFFF7EEFFFFF6ECFFFFF6ECFFFFF5EBFFFFFDF4FFDAC4ACF78554229B
                      FFFFFF00FFFFFF006B34000E82490C89CDA87FFFE2C6A7FFFAF2EAFFFFFEFBFF
                      FFFCF8FFFFFBF7FFFFFBF7FFFFFAF6FFFFFFFAFFFDF9F3FFDAB6A8FFE6CCC1FF
                      FFFAF5FFFFFAF3FFFFF8F0FFFFF8F1FFFFF8F0FFFFFCF5FFC7A98CEA82501B79
                      FFFFFF00FFFFFF007C4203007D410017A26F39E2E3C4A1FFEFDAC0FFFEFCF9FF
                      FFFEFDFFFFFDFAFFFFFDFAFFFFFCF9FFFFFBF8FFFFFFFFFFF1E1DBFFD6AFA0FF
                      FCF6F0FFFFFCF7FFFFFBF5FFFFFAF4FFFFFBF6FFFEF9F3FF9E6F3EC47D430731
                      FFFFFF00FFFFFF0083470500814503008345054AB78A59F6F0D3B1FFF7E5CFFF
                      FEFDFBFFFFFFFFFFFFFEFCFFFFFEFCFFFFFDFCFFFFFFFFFFCA9680FFB44B0AFF
                      E0C0AFFFFFFFFFFFFFFCF9FFFFFDFAFFFFFFFFFFD0B89DFF84480A527E430404
                      FFFFFF00FFFFFF00824605008246050084470700874B0C5DB98C5BF3F4D7B4FF
                      FDE9D0FFFFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D5CDFFD0936EFF
                      EAD5CAFFFFFFFFFFFFFFFFFFFFFFFFFFDBC9B4FF8D551B8B83480900874D0E00
                      FFFFFF00FFFFFF008246050082460500854909008549090083460543A47139D1
                      E2BE95FFFDE5C7FFFFF3E2FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF
                      FFFFFFFFFFFEFEFFF4EFE9FFBF9F7EF48A51157A85490C04864D0F00864C0E00
                      FFFFFF00FFFFFF00824605008246050085490900864B0B00864A09008042010D
                      894E0F77A9763ECFCFA679EEDFBC96FFE1C4A5FFE1CBB3FFE0CCB7FFDAC6B1F7
                      C7AB8FE5AD855BD08D571C958347082D84490A00894F1400864C0E00864C0E00
                      FFFFFF00FFFFFF00824605008246050085490900864B0B00874B0B0083460600
                      8346060C864A0A3E8E531486996126B7A57139D0A3713BCF99652DBA915A209A
                      8C551971864B0D3E7F42001484480900874D0F00894F1300864C0E00864C0E00
                      FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                      FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                      FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                      FFFFFF00FFFFFF00FFFCFF00FFF87F00FFE07F00FE007F00FC007F00F0001F00
                      E0000F00C0000700800007008000030080000100800001008000010080000100
                      8000010080000100C0000100E0000100F0000700F8000700FC001F00FE003F00
                      FFFFFF00}
                    ShowHint = True
                  end
                  object edDataBase: TMaskEdit
                    Left = 108
                    Top = 15
                    Width = 81
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 0
                    Text = '  /  /    '
                    OnKeyDown = edDataBaseKeyDown
                  end
                  object btPesquisarPedidos: TBitBtn
                    Left = 319
                    Top = 13
                    Width = 132
                    Height = 25
                    Caption = 'Pesquisar pedidos'
                    TabOrder = 1
                    OnClick = btPesquisarPedidosClick
                  end
                  object ckNomeFantasia: TCheckBox
                    Left = 623
                    Top = 19
                    Width = 130
                    Height = 17
                    Caption = 'Mostrar Nome Fantasia'
                    TabOrder = 2
                    OnClick = ckNomeFantasiaClick
                  end
                end
              end
            end
            object TabSheet6: TTabSheet
              Caption = 'Rotas'
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnMontagemRota: TPanel
                Left = 3
                Top = 6
                Width = 766
                Height = 473
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                object GroupBox13: TGroupBox
                  Left = 6
                  Top = 6
                  Width = 750
                  Height = 65
                  Align = alTop
                  Caption = 'Processar'
                  TabOrder = 0
                  object Label30: TLabel
                    Left = 88
                    Top = 14
                    Width = 53
                    Height = 13
                    Caption = 'Data Inicial'
                  end
                  object Label31: TLabel
                    Left = 231
                    Top = 14
                    Width = 48
                    Height = 13
                    Caption = 'Data Final'
                  end
                  object Label32: TLabel
                    Left = 119
                    Top = 41
                    Width = 23
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Rota'
                  end
                  object SpeedButton9: TSpeedButton
                    Left = 594
                    Top = 10
                    Width = 23
                    Height = 22
                    Flat = True
                    Glyph.Data = {
                      7A010000424D7A010000000000007A0000002800000010000000100000000100
                      08000000000000010000120B0000120B0000110000001100000000000000FFFF
                      FF00FF00FF000969100093EFFF0096F0FF0088E3FF0078D7FF0066C7FF0055B6
                      FF0044A6FF003598FF00288BFF000C4898001F81FF002082FF002284FF000202
                      02020202020202020202020202020202020D0202020202020202020202020202
                      0D0E0D0202020202020202020202020D100F0E0D020203030202020202020D0D
                      0D0C0D0D0D02030302020202020202020D0B0D02020202020202020202020202
                      0D0A0D020202030303030202020202020D090D02020203030303020202020202
                      0D080D020202020202020202020202020D070D02020203030303030302020202
                      0D060D020202030303030303020202020D040D02020202020202020202020202
                      0D050D020202030303030303030302020D050D02020203030303030303030202
                      0D0D0D020202020202020202020202020202020202020202020202020202}
                    OnClick = SpeedButton9Click
                  end
                  object btSelectAll: TSpeedButton
                    Left = 6
                    Top = 38
                    Width = 23
                    Height = 21
                    Hint = '[ F2 ] - Selecionar todos'
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
                    Left = 35
                    Top = 38
                    Width = 23
                    Height = 21
                    Hint = '[ F4 ] - Desfazer sele'#231#227'o'
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
                  object bt_ped_aberto_sel: TSpeedButton
                    Left = 64
                    Top = 38
                    Width = 23
                    Height = 21
                    Hint = 'Selecionar apenas os pedidos abertos'
                    Flat = True
                    Glyph.Data = {
                      32020000424D3202000000000000320100002800000010000000100000000100
                      08000000000000010000120B0000120B00003F0000003F00000000000000FFFF
                      FF00FF00FF00F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EEEEEE00EDED
                      ED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5
                      E500E4E4E400E3E3E300E2E2E200E1E1E100E0E0E000DFDFDF00DEDEDE00DDDD
                      DD00DCDCDC00DBDBDB00DADADA00D9D9D900D8D8D800D7D7D700D5D5D500D4D4
                      D400D3D3D300D2D2D200D1D1D100D0D0D000CFCFCF00CECECE00CDCDCD00CCCC
                      CC00CBCBCB00CACACA00C9C9C900C8C8C800C5C5C500BABABA00ADADAD00A8A8
                      A800A7A7A700A5A5A500A4A4A400A2A2A200A0A0A0009D9D9D009C9C9C009A9A
                      9A00989898009696960095959500939393008C8C8C0002023E3E3E3E3E3E3E3E
                      3E3E3E3E3E0202023D1B1D1F20222426282A2C2D3E0202023C181A1C1F3C2224
                      26282A2B3E0202023B15171A3C3C3C21232627293E0202023A13153C302E3C2F
                      212325273E0202023910123C1B19103C3C2323253E020202380E101314171822
                      3C3C20223E020202370B0D0F111416181A1C1E203E020202360A3A3A3A3A3A3A
                      3A3A3A1E3E0202023508090B0D0F11131517191C3E020202340607090B0C0F11
                      131517193E02020233053A3A3A3A3A3A3A3A3A173E0202023203040607080A0B
                      0E1012133E020202310303040507080A0B0D0F123E0202023131313131313131
                      31313131310202020202020202020202020202020202}
                    ParentShowHint = False
                    ShowHint = True
                    Visible = False
                    OnClick = bt_ped_aberto_selClick
                  end
                  object bt_ped_aberto_enviar: TSpeedButton
                    Left = 90
                    Top = 38
                    Width = 23
                    Height = 21
                    Hint = 'Enviar pedidos abertos para o modulo de faturamento'
                    Flat = True
                    Glyph.Data = {
                      4E020000424D4E020000000000004E0100002800000010000000100000000100
                      08000000000000010000340B0000340B00004600000046000000005803000060
                      030003600300036A0300036A060003730600037B0600038F0B00067311000684
                      11000B981600EA8F31001CB63100B66A50002ACA5000AB735800C07B5800EAA1
                      5800FFB65800AB6A6000B67B6000C084600038CA6000A16A6A00A1736A00C084
                      6A00A17B730040E07300B68F7B00F4C07B00B68F8400F4C08400F4CA8400B698
                      8F00C0988F00F4CA8F00C0A19800CAA19800B6AB9800F4CA9800F4D49800CAAB
                      A100D4ABA100D4B6A100E0B6A100EAB6A100EAC0A100F4CAA100F4D4A100FFD4
                      A100EAC0AB00F4D4AB00E0D4B600F4D4B600F4E0B600E0C0C000E0CAC000F4E0
                      C000E0CACA00F4E0CA00FFE0CA00FFEACA00FFEAD400FFEAE000FFF4E000FFF4
                      EA00FFF4F400FFFFF400FF00FF00FFFFFF004444171717171717171717171717
                      174444441E3D36333027231F1D001D20174444441E3D3935332F2308090C001F
                      17444444213F3B393504070A0C0E1B001744444421403B39020705040816001D
                      1744444424433F3B050535332F001F1F174444442545413F0539363533272323
                      1744444429454241023B393635332F2717444444294545423F3F3B3935333030
                      174444442A454545423F3E3B3935352F174444442B45454545423F3E3E3D3426
                      174444442C454545454541413B1C1A18174444442C45454545454543370F110B
                      0D444444324545454545454538141210444444442C4241414141414137141944
                      444444442C2E2E2E2E2C2C2E291344444444}
                    ParentShowHint = False
                    ShowHint = True
                    Visible = False
                    OnClick = bt_ped_aberto_enviarClick
                  end
                  object edcod_rota: TMaskEdit
                    Left = 148
                    Top = 38
                    Width = 77
                    Height = 21
                    Enabled = False
                    ReadOnly = True
                    TabOrder = 0
                    Text = 'edcod_rota'
                  end
                  object edrota: TMaskEdit
                    Left = 231
                    Top = 38
                    Width = 48
                    Height = 21
                    Enabled = False
                    ReadOnly = True
                    TabOrder = 1
                    Text = 'edrota'
                  end
                  object eddescricao: TMaskEdit
                    Left = 285
                    Top = 38
                    Width = 332
                    Height = 21
                    Enabled = False
                    ReadOnly = True
                    TabOrder = 2
                    Text = 'eddescricao'
                  end
                  object ed_monta_rota_dataini: TMaskEdit
                    Left = 147
                    Top = 11
                    Width = 78
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 3
                    Text = '  /  /    '
                  end
                  object ed_monta_rota_datafim: TMaskEdit
                    Left = 285
                    Top = 11
                    Width = 78
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 4
                    Text = '  /  /    '
                  end
                  object BitBtn36: TBitBtn
                    Left = 637
                    Top = 26
                    Width = 75
                    Height = 25
                    Caption = '&Iniciar'
                    TabOrder = 5
                    OnClick = BitBtn36Click
                    Glyph.Data = {
                      3E030000424D3E030000000000003E0200002800000010000000100000000100
                      08000000000000010000120B0000120B0000820000008200000000000000FFFF
                      FF00FF00FF00FEFDFD008E472200A0502700944A24008F4823007F3F1F00954B
                      250083422100804020007F402000944D2900E4E2E1007F401F0085452300AE5C
                      2700B95D1900AD5F2000AD5F2100AE612200AC602400AF622500AA612800FEF4
                      EB00FEF6EF00CC731800CC731A00CC741A00CB731A00CA721A00CD751B00C872
                      1E00F6BB8000FEF7F000FEF8F200FEF9F400E4E0DC00FEFCFA00FEFDFC00FEE1
                      C100FEE2C400FEE4C700FEE5C900FEE6CC00FEE7CD00FEE9D200FEEAD400FEEB
                      D600FEEDDA00FEEEDC00FEF2E500FEF3E700E4DACF00FEF4E900FEF5EB00EE97
                      3300754E1F00FEE8CF00FEEAD300FEECD700FEEFDE00FEF0E000FEF1E200FEF2
                      E400FEF4E800FEF9F300FEF6EC00FEF7EE00E4DED600FEFAF500FEFBF700FEFC
                      F900FEFDFB00C3DEB200B7D9A7000556090000B00B0007811000077F1000077E
                      0F00077C0F0000AC110002B2120003AD130009BC1A0009B91A0008A0170009AF
                      190007801100077D110039C146004DC6590062CD6B000EBC22000D9E1F000B85
                      180015A42600228630009BE1A40041A851000EB52B0011BD320015B1300039B8
                      52003EBB57001A9A360012B83E001EBB450061CF7C0022C04C002BBB52001DBD
                      510090DBA9009CE0B2001CBD55002CC5630044C975001CBD5A006BD59600A5E5
                      BE003CC876005BD28C0068D494006DD79A0091E0B2004E6ED400FEFEFE00E4E4
                      E400020202020202020202514D4D4D52020202020202020202024F605553585B
                      4D0205090606060606636D67645C4E575A500A373F3D3B2B2962756C01015E54
                      594F0C241940322F2C627A740101015D564F0B494344413330627D7701016E66
                      5F4F0B8027471A353E69727C7976716F68610F8080284823424C62737E787B70
                      6B020F808080034924384B6A626262653A020B808080808049254434333C2D2A
                      0702088080808080804A4745353E312E0402108181818181818181810E264636
                      0D0211151313131313131417151716180702113939393939393939392222397F
                      1202021E1C1C1C1C1C1C1D201B201F2102020202020202020202020202020202
                      0202}
                  end
                end
                object Panel34: TPanel
                  Left = 6
                  Top = 71
                  Width = 750
                  Height = 351
                  Align = alClient
                  BevelOuter = bvNone
                  Padding.Bottom = 3
                  TabOrder = 1
                  object GroupBox14: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 750
                    Height = 348
                    Align = alClient
                    Caption = 'Pedidos'
                    TabOrder = 0
                    object Panel39: TPanel
                      Left = 2
                      Top = 15
                      Width = 746
                      Height = 331
                      Align = alClient
                      BevelOuter = bvNone
                      Caption = 'Sem pedidos para apresentar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      Padding.Left = 4
                      Padding.Right = 4
                      Padding.Bottom = 4
                      ParentFont = False
                      TabOrder = 0
                      object grid_monta_por_rota: TDBGrid
                        Left = 4
                        Top = 0
                        Width = 738
                        Height = 310
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -13
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        Visible = False
                        OnCellClick = grid_monta_por_rotaCellClick
                        OnDrawColumnCell = grid_monta_por_rotaDrawColumnCell
                        OnDblClick = grid_monta_por_rotaDblClick
                        OnKeyDown = grid_monta_por_rotaKeyDown
                        OnMouseUp = grid_monta_por_rotaMouseUp
                      end
                      object progress_por_rota: TProgressBar
                        Left = 4
                        Top = 310
                        Width = 738
                        Height = 17
                        Align = alBottom
                        TabOrder = 1
                        Visible = False
                      end
                    end
                  end
                end
                object Panel35: TPanel
                  Left = 6
                  Top = 422
                  Width = 750
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Panel36: TPanel
                    Left = 318
                    Top = 0
                    Width = 251
                    Height = 37
                    Align = alLeft
                    BevelOuter = bvNone
                    BorderWidth = 4
                    TabOrder = 0
                    object Panel40: TPanel
                      Left = 4
                      Top = 4
                      Width = 122
                      Height = 29
                      Align = alLeft
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label33: TLabel
                        Left = 15
                        Top = 0
                        Width = 107
                        Height = 13
                        Align = alTop
                        Alignment = taRightJustify
                        Caption = 'Peso M'#225'ximo Ve'#237'culo   '
                        FocusControl = DBEdit8
                      end
                      object Label34: TLabel
                        Left = 27
                        Top = 16
                        Width = 95
                        Height = 13
                        Align = alBottom
                        Alignment = taRightJustify
                        Caption = 'Peso total da rota   '
                        FocusControl = DBEdit8
                      end
                    end
                    object Panel41: TPanel
                      Left = 126
                      Top = 4
                      Width = 121
                      Height = 29
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 1
                      object DBText10: TDBText
                        Left = 0
                        Top = 0
                        Width = 47
                        Height = 13
                        Align = alTop
                        AutoSize = True
                        DataField = 'PESO_MAXIMO'
                        DataSource = dtmOrdemCarregamento.dsVeicTrCons2
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object lb_peso: TLabel
                        Left = 0
                        Top = 16
                        Width = 22
                        Height = 13
                        Align = alBottom
                        Caption = '0,00'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                    end
                  end
                  object Panel37: TPanel
                    Left = 0
                    Top = 0
                    Width = 318
                    Height = 37
                    Align = alLeft
                    BevelOuter = bvNone
                    BorderWidth = 8
                    TabOrder = 1
                    object DBLookupComboBox6: TDBLookupComboBox
                      Left = 49
                      Top = 8
                      Width = 261
                      Height = 21
                      Align = alClient
                      DropDownWidth = 700
                      KeyField = 'COD_VEIC'
                      ListField = 'MODELO;PLACA'
                      ListSource = dtmOrdemCarregamento.dsVeicTrCons2
                      TabOrder = 0
                      OnExit = DBLookupComboBox6Exit
                    end
                    object Panel38: TPanel
                      Left = 8
                      Top = 8
                      Width = 41
                      Height = 21
                      Align = alLeft
                      BevelOuter = bvNone
                      Caption = 'Ve'#237'culo'
                      TabOrder = 1
                    end
                  end
                  object BitBtn37: TBitBtn
                    Left = 572
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = 'C&ancelar'
                    ModalResult = 2
                    TabOrder = 2
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
                      83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
                      835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
                      835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
                      835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
                      A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
                      A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
                      A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
                      A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
                      A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
                      E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
                      0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
                      0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
                      C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
                      8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
                      E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
                      C160C260D472}
                  end
                  object BitBtn38: TBitBtn
                    Left = 653
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Concluir'
                    TabOrder = 3
                    OnClick = BitBtn38Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F0000007467813A813A813661366136613241324132422E422E222E222A
                      222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232422E422E
                      222A222A0226A13EC142C142C142A23EA23EA23A61366136623662324232422E
                      422E222A222AA13EC146C146C142C142A23EA23E6136A7426136623662324232
                      422E422E222AC142E146E146C146C142C142A23E6136DD7BED4E613662366232
                      4232422E222AC142E146E14AC142A13EA13EA13E6136FF7FFF7FED4E61366236
                      62324232222EC142E14AC142CB4A305B305B305B305BFF7FFF7FFF7F525F6136
                      62364232422EC146014BA142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5463
                      61366232422EE146014FC142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FED4E
                      613662364232E1462453E44ACB4A305B305B305B305BFF7FFF7FFF7FED4E6236
                      823A82364132E14A45574657054F044BE44AE44A823AFF7FFF7FED4E823EA33E
                      A33E823A6132E14A4557465B4657265725532553823ADD7BA742A33EC342C342
                      A33EA23A6132014B455B665B465B465725532553823AA742C342E44AC346C342
                      A342A23E6136014F455B665B665B465745572553A23EE44A044BE44AE346C346
                      C342A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
                      C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                      813A813A7467}
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = -1000
      Top = -447
      Width = 2
      ExplicitLeft = -1000
      ExplicitTop = -447
      ExplicitWidth = 2
      inherited bMarketingHW: TBitBtn
        Width = 0
        ExplicitWidth = 0
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 801
    ExplicitWidth = 801
  end
  inherited pnStatusProcessamento: TPanel
    Left = -9999
    Top = 511
    ExplicitLeft = -9999
    ExplicitTop = 511
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 660
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 766
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 726
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 694
    Top = 3
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer2Timer
    Left = 632
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer3Timer
    Left = 768
    Top = 32
  end
  object PopupMenu3: TPopupMenu
    Left = 708
    Top = 1
    object MenuItem1: TMenuItem
      Caption = 'Configurar colunas - [PRO197]'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas - [PRO198]'
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem3Click
    end
    object MenuItem4: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem4Click
    end
    object MenuItem5: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem5Click
    end
    object MenuItem6: TMenuItem
      Caption = 'Somar valores da coluna'
      OnClick = Somarvaloresdacoluna1Click
    end
  end
end
