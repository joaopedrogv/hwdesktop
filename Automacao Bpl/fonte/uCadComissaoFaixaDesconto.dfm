inherited frmCadComissaoFaixaDesconto: TfrmCadComissaoFaixaDesconto
  Caption = 'Comiss'#227'o por Faixa de Desconto'
  Scaled = False
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              ActivePage = tsCadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
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
                  Width = 775
                  Height = 431
                  Align = alTop
                  Caption = 'Cadastro Comiss'#227'o por Faixa de Desconto'
                  TabOrder = 0
                  object Panel4: TPanel
                    Left = 2
                    Top = 15
                    Width = 771
                    Height = 82
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 72
                      Top = 13
                      Width = 37
                      Height = 13
                      Caption = 'C'#243'digo:'
                    end
                    object Label7: TLabel
                      Left = 59
                      Top = 38
                      Width = 50
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                    end
                    object Label8: TLabel
                      Left = 85
                      Top = 62
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo:'
                    end
                    object DBEdit1: TDBEdit
                      Left = 115
                      Top = 10
                      Width = 60
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CODIGO'
                      DataSource = DtmCadBasicos.dsComissaoFaixaDesc
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 115
                      Top = 35
                      Width = 542
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsComissaoFaixaDesc
                      TabOrder = 1
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 115
                      Top = 59
                      Width = 145
                      Height = 21
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'TIPO'
                      DataSource = DtmCadBasicos.dsComissaoFaixaDesc
                      ItemHeight = 0
                      Items.Strings = (
                        'GERAL'
                        'ESPECIFICA')
                      TabOrder = 2
                      OnExit = DBComboBox1Exit
                    end
                  end
                  object GroupBox5: TGroupBox
                    Left = 2
                    Top = 97
                    Width = 771
                    Height = 167
                    Align = alTop
                    Caption = 'Data de vig'#234'ncia'
                    TabOrder = 1
                    object PageControl2: TPageControl
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 150
                      ActivePage = TabSheet5
                      Align = alClient
                      Style = tsFlatButtons
                      TabOrder = 0
                      object TabSheet5: TTabSheet
                        Caption = 'TabSheet5'
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object Panel6: TPanel
                          Left = 0
                          Top = 78
                          Width = 759
                          Height = 41
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 0
                          object BitBtn_Novo_Vigencia: TBitBtn
                            Left = 261
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Novo - [BAS468]'
                            Caption = 'Novo'
                            TabOrder = 0
                            OnClick = BitBtn_Novo_VigenciaClick
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
                          object BitBtn_Alterar_Vigencia: TBitBtn
                            Left = 340
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Alterar - [BAS469]'
                            Caption = 'Alterar'
                            TabOrder = 1
                            OnClick = BitBtn_Alterar_VigenciaClick
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
                          object BitBtn_Excluir_Vigencia: TBitBtn
                            Left = 419
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Excluir - [BAS470]'
                            Caption = 'Excluir'
                            TabOrder = 2
                            OnClick = BitBtn_Excluir_VigenciaClick
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
                        object DBGrid2: TDBGrid
                          Left = 0
                          Top = 0
                          Width = 759
                          Height = 78
                          Align = alClient
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
                              FieldName = 'DTINI_VIG'
                              Title.Caption = 'Data inicial vig'#234'ncia'
                              Width = 102
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'DTFIM_VIG'
                              Title.Caption = 'Data final vig'#234'ncia'
                              Width = 102
                              Visible = True
                            end>
                        end
                      end
                      object TabSheet6: TTabSheet
                        Caption = 'TabSheet6'
                        ImageIndex = 1
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object Label9: TLabel
                          Left = 40
                          Top = 18
                          Width = 53
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Data in'#237'cio:'
                        end
                        object Label11: TLabel
                          Left = 506
                          Top = 18
                          Width = 50
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Data final:'
                        end
                        object DBEdit3: TDBEdit
                          Left = 99
                          Top = 15
                          Width = 78
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'DTINI_VIG'
                          DataSource = DtmCadBasicos.dsComissaoFaixaDescVig
                          TabOrder = 0
                        end
                        object DBEdit4: TDBEdit
                          Left = 562
                          Top = 14
                          Width = 78
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'DTFIM_VIG'
                          DataSource = DtmCadBasicos.dsComissaoFaixaDescVig
                          TabOrder = 1
                        end
                        object Panel5: TPanel
                          Left = 0
                          Top = 78
                          Width = 759
                          Height = 41
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 2
                          object BitBtn_Salvar_Vigencia: TBitBtn
                            Left = 300
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'OK - [BAS471]'
                            Caption = '&OK'
                            TabOrder = 0
                            OnClick = BitBtn_Salvar_VigenciaClick
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
                          object BitBtn_Cancelar_Vigencia: TBitBtn
                            Left = 381
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Cancelar'
                            Caption = '&Cancela'
                            TabOrder = 1
                            OnClick = BitBtn_Cancelar_VigenciaClick
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
                  object GroupBox6: TGroupBox
                    Left = 2
                    Top = 264
                    Width = 771
                    Height = 167
                    Align = alTop
                    Caption = 'Intervalo de desconto'
                    TabOrder = 2
                    object PageControl4: TPageControl
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 150
                      ActivePage = TabSheet7
                      Align = alClient
                      Style = tsFlatButtons
                      TabOrder = 0
                      object TabSheet7: TTabSheet
                        Caption = 'TabSheet7'
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object Panel8: TPanel
                          Left = 0
                          Top = 78
                          Width = 759
                          Height = 41
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 0
                          object BitBtn_Novo_Desconto: TBitBtn
                            Left = 261
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Novo - [BAS472]'
                            Caption = 'Novo'
                            TabOrder = 0
                            OnClick = BitBtn_Novo_DescontoClick
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
                          object BitBtn_Alterar_Desconto: TBitBtn
                            Left = 340
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Alterar - [BAS473]'
                            Caption = 'Alterar'
                            TabOrder = 1
                            OnClick = BitBtn_Alterar_DescontoClick
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
                          object BitBtn_Excluir_Desconto: TBitBtn
                            Left = 419
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Excluir - [BAS474]'
                            Caption = 'Excluir'
                            TabOrder = 2
                            OnClick = BitBtn_Excluir_DescontoClick
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
                        object DBGrid3: TDBGrid
                          Left = 0
                          Top = 0
                          Width = 759
                          Height = 78
                          Align = alClient
                          DataSource = DtmCadBasicos.dsComissaoFaixaDescPerc
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
                              FieldName = 'PERC_DESC_INI'
                              Title.Caption = 'Faixa desconto inicial (%)'
                              Width = 140
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'PERC_DESC_FIM'
                              Title.Caption = 'Faixa de desconto final (%)'
                              Width = 140
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'PERC_COMISSAO'
                              Width = 99
                              Visible = True
                            end>
                        end
                      end
                      object TabSheet8: TTabSheet
                        Caption = 'TabSheet8'
                        ImageIndex = 1
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object Panel7: TPanel
                          Left = 0
                          Top = 78
                          Width = 759
                          Height = 41
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 2
                          object BitBtn_Salvar_Desconto: TBitBtn
                            Left = 300
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'OK - [BAS475]'
                            Caption = '&OK'
                            TabOrder = 0
                            OnClick = BitBtn_Salvar_DescontoClick
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
                          object BitBtn_Cancelar_Desconto: TBitBtn
                            Left = 381
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Cancelar'
                            Caption = '&Cancela'
                            TabOrder = 1
                            OnClick = BitBtn_Cancelar_DescontoClick
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
                        object GroupBox7: TGroupBox
                          Left = 0
                          Top = 0
                          Width = 759
                          Height = 43
                          Align = alTop
                          Caption = 'Desconto entre'
                          TabOrder = 0
                          object Label12: TLabel
                            Left = 76
                            Top = 19
                            Width = 17
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'De:'
                          end
                          object Label14: TLabel
                            Left = 180
                            Top = 19
                            Width = 19
                            Height = 13
                            Alignment = taRightJustify
                            Caption = '(%)'
                          end
                          object Label13: TLabel
                            Left = 535
                            Top = 19
                            Width = 21
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'At'#233':'
                          end
                          object Label15: TLabel
                            Left = 645
                            Top = 19
                            Width = 19
                            Height = 13
                            Alignment = taRightJustify
                            Caption = '(%)'
                          end
                          object DBEdit6: TDBEdit
                            Left = 99
                            Top = 15
                            Width = 78
                            Height = 21
                            CharCase = ecUpperCase
                            DataField = 'PERC_DESC_INI'
                            DataSource = DtmCadBasicos.dsComissaoFaixaDescPerc
                            TabOrder = 0
                          end
                          object DBEdit7: TDBEdit
                            Left = 562
                            Top = 15
                            Width = 78
                            Height = 21
                            CharCase = ecUpperCase
                            DataField = 'PERC_DESC_FIM'
                            DataSource = DtmCadBasicos.dsComissaoFaixaDescPerc
                            TabOrder = 1
                          end
                        end
                        object Panel9: TPanel
                          Left = 0
                          Top = 43
                          Width = 759
                          Height = 35
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 1
                          object Label16: TLabel
                            Left = 44
                            Top = 9
                            Width = 49
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Comiss'#227'o:'
                          end
                          object Label17: TLabel
                            Left = 183
                            Top = 10
                            Width = 19
                            Height = 13
                            Alignment = taRightJustify
                            Caption = '(%)'
                          end
                          object DBEdit8: TDBEdit
                            Left = 99
                            Top = 6
                            Width = 78
                            Height = 21
                            CharCase = ecUpperCase
                            DataField = 'PERC_COMISSAO'
                            DataSource = DtmCadBasicos.dsComissaoFaixaDescPerc
                            TabOrder = 0
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [BAS465]'
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
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS459]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS460]'
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
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS461]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS462]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS464]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
                Visible = False
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
                Hint = 'Ver registros da lixeira - [BAS466]'
                OnClick = SpeedButton25Click
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
          ExplicitWidth = 783
          ExplicitHeight = 510
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object qrpComissao: TQuickRep
            Left = 1
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = DtmCadBasicos.cdsComissaoFaixaDesc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE')
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
              100.000000000000000000
              100.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = Auto
            PrinterSettings.Duplex = False
            PrinterSettings.FirstPage = 0
            PrinterSettings.LastPage = 0
            PrinterSettings.UseStandardprinter = False
            PrinterSettings.UseCustomBinCode = False
            PrinterSettings.CustomBinCode = 0
            PrinterSettings.ExtendedDuplex = 0
            PrinterSettings.UseCustomPaperCode = False
            PrinterSettings.CustomPaperCode = 0
            PrinterSettings.PrintMetaFile = False
            PrinterSettings.PrintQuality = 0
            PrinterSettings.Collate = 0
            PrinterSettings.ColorOption = 0
            PrintIfEmpty = True
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsStayOnTop
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object TitleBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 83
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                219.604166666666700000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel1: TQRLabel
                Left = 2
                Top = 36
                Width = 376
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  95.250000000000000000
                  994.833333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cadastro Comiss'#227'o por Faixa de Desconto'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel2: TQRLabel
                Left = 2
                Top = 61
                Width = 65
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  5.291666666666667000
                  161.395833333333300000
                  171.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData1: TQRSysData
                Left = 73
                Top = 61
                Width = 69
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  193.145833333333300000
                  161.395833333333300000
                  182.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel3: TQRLabel
                Left = 607
                Top = 61
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1606.020833333333000000
                  161.395833333333300000
                  124.354166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData2: TQRSysData
                Left = 658
                Top = 61
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1740.958333333333000000
                  161.395833333333300000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object lbEmpresa: TQRLabel
                Left = 2
                Top = 10
                Width = 103
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  26.458333333333330000
                  272.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'lbEmpresa'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                OnPrint = lbEmpresaPrint
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
            end
            object ColumnHeaderBand1: TQRBand
              Left = 38
              Top = 121
              Width = 718
              Height = 33
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                87.312500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 3
                Top = 1
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  2.645833333333333000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape2: TQRShape
                Left = 3
                Top = 27
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  71.437500000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel4: TQRLabel
                Left = 152
                Top = 7
                Width = 57
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  402.166666666666700000
                  18.520833333333330000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel5: TQRLabel
                Left = 264
                Top = 7
                Width = 78
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  698.500000000000000000
                  18.520833333333330000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel6: TQRLabel
                Left = 560
                Top = 6
                Width = 35
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1481.666666666667000000
                  15.875000000000000000
                  92.604166666666680000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Tipo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object DetailBand1: TQRBand
              Left = 38
              Top = 154
              Width = 718
              Height = 19
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                50.270833333333330000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText2: TQRDBText
                Left = 160
                Top = 1
                Width = 49
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  423.333333333333300000
                  2.645833333333333000
                  129.645833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsComissaoFaixaDesc
                DataField = 'CODIGO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText3: TQRDBText
                Left = 264
                Top = 1
                Width = 72
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  698.500000000000000000
                  2.645833333333333000
                  190.500000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsComissaoFaixaDesc
                DataField = 'DESCRICAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText1: TQRDBText
                Left = 560
                Top = 3
                Width = 28
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1481.666666666667000000
                  7.937500000000000000
                  74.083333333333340000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsComissaoFaixaDesc
                DataField = 'TIPO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
            end
            object PageFooterBand1: TQRBand
              Left = 38
              Top = 173
              Width = 718
              Height = 36
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                95.250000000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRLabel15: TQRLabel
                Left = 8
                Top = 10
                Width = 210
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  26.458333333333330000
                  555.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas e Computadores Ltda'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape3: TQRShape
                Left = 3
                Top = 4
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  10.583333333333330000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
        end
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 582
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 550
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 518
    Top = 3
  end
end
