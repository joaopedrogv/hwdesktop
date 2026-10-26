inherited frmCadRegrasSugestao: TfrmCadRegrasSugestao
  Caption = 'Regras Sugest'#227'o Servi'#231'o'
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
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 429
                  Align = alTop
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 425
                    Align = alClient
                    Caption = 'Regras Sugest'#227'o Servi'#231'o:'
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 79
                      Top = 62
                      Width = 50
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                    end
                    object Label7: TLabel
                      Left = 105
                      Top = 93
                      Width = 24
                      Height = 13
                      Caption = 'Tipo:'
                    end
                    object Label8: TLabel
                      Left = 42
                      Top = 117
                      Width = 87
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'Interv mes'#234's entre as revis'#245'es:'
                      WordWrap = True
                    end
                    object Label9: TLabel
                      Left = 260
                      Top = 117
                      Width = 63
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'M'#234's primeira revis'#227'o:'
                      WordWrap = True
                    end
                    object Label10: TLabel
                      Left = 494
                      Top = 117
                      Width = 66
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'M'#234's segunda revis'#227'o:'
                      WordWrap = True
                    end
                    object Label11: TLabel
                      Left = 51
                      Top = 149
                      Width = 78
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'Interv km entre as revis'#245'es:'
                      WordWrap = True
                    end
                    object Label12: TLabel
                      Left = 265
                      Top = 149
                      Width = 58
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'Km primeira revis'#227'o:'
                      WordWrap = True
                    end
                    object Label13: TLabel
                      Left = 499
                      Top = 149
                      Width = 61
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'Km segunda revis'#227'o:'
                      WordWrap = True
                    end
                    object Label211: TLabel
                      Left = 544
                      Top = 179
                      Width = 89
                      Height = 13
                      Caption = 'F2 - Marca linha'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label212: TLabel
                      Left = 656
                      Top = 179
                      Width = 108
                      Height = 13
                      Caption = 'F3 - Demarca Linha'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit4: TDBEdit
                      Left = 565
                      Top = 121
                      Width = 68
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MES_RET_SERV2'
                      DataSource = DtmCadBasicos.dsRegrasSugServ
                      TabOrder = 4
                    end
                    object DBEdit5: TDBEdit
                      Left = 565
                      Top = 154
                      Width = 68
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'KM_RET_SERV2'
                      DataSource = DtmCadBasicos.dsRegrasSugServ
                      TabOrder = 7
                    end
                    object DBEdit6: TDBEdit
                      Left = 135
                      Top = 154
                      Width = 68
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'INTERV_KM_SERV'
                      DataSource = DtmCadBasicos.dsRegrasSugServ
                      TabOrder = 5
                    end
                    object DBEdit7: TDBEdit
                      Left = 329
                      Top = 154
                      Width = 68
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'KM_RET_SERV1'
                      DataSource = DtmCadBasicos.dsRegrasSugServ
                      TabOrder = 6
                    end
                    object DBEdit1: TDBEdit
                      Left = 135
                      Top = 59
                      Width = 498
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsRegrasSugServ
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 135
                      Top = 121
                      Width = 68
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'INTERV_MES_SERV'
                      DataSource = DtmCadBasicos.dsRegrasSugServ
                      TabOrder = 2
                    end
                    object DBEdit3: TDBEdit
                      Left = 329
                      Top = 121
                      Width = 68
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MES_RET_SERV1'
                      DataSource = DtmCadBasicos.dsRegrasSugServ
                      TabOrder = 3
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 135
                      Top = 90
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIPO'
                      DataSource = DtmCadBasicos.dsRegrasSugServ
                      Enabled = False
                      ItemHeight = 0
                      Items.Strings = (
                        'V - VE'#205'CULOS'
                        'E - EQUIPAMENTOS')
                      TabOrder = 1
                      OnExit = DBComboBox2Exit
                    end
                    object GroupBox5: TGroupBox
                      Left = 2
                      Top = 192
                      Width = 767
                      Height = 231
                      Align = alBottom
                      Caption = 'Modelo de Ve'#237'culos/Equipamentos'
                      TabOrder = 8
                      object PageControl2: TPageControl
                        Left = 2
                        Top = 15
                        Width = 763
                        Height = 214
                        ActivePage = TabSheet5
                        Align = alClient
                        TabOrder = 0
                        object TabSheet4: TTabSheet
                          Caption = 'TabSheet4'
                          ExplicitLeft = 0
                          ExplicitTop = 0
                          ExplicitWidth = 0
                          ExplicitHeight = 0
                          object DBGrid2: TDBGrid
                            Left = 0
                            Top = 0
                            Width = 755
                            Height = 186
                            Align = alClient
                            DataSource = DtmCadBasicos.dsModVeiculosServ
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            PopupMenu = PopupMenu3
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            OnCellClick = DBGrid2CellClick
                            OnDrawColumnCell = DBGrid2DrawColumnCell
                            OnDblClick = DBGrid2DblClick
                            OnKeyDown = DBGrid2KeyDown
                            Columns = <
                              item
                                Expanded = False
                                FieldName = 'SEL'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'CODIGO'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'DESCRICAO'
                                Width = 400
                                Visible = True
                              end>
                          end
                        end
                        object TabSheet5: TTabSheet
                          Caption = 'TabSheet5'
                          ImageIndex = 1
                          ExplicitLeft = 0
                          ExplicitTop = 0
                          ExplicitWidth = 0
                          ExplicitHeight = 0
                          object DBGrid3: TDBGrid
                            Left = 0
                            Top = 0
                            Width = 755
                            Height = 186
                            Align = alClient
                            DataSource = DtmCadBasicos.dsEquipamentosServ
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            PopupMenu = PopupMenu4
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            OnCellClick = DBGrid3CellClick
                            OnDrawColumnCell = DBGrid3DrawColumnCell
                            OnDblClick = DBGrid3DblClick
                            OnKeyDown = DBGrid3KeyDown
                            Columns = <
                              item
                                Expanded = False
                                FieldName = 'SEL'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COD_EQUIP'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'NOM_EQUIP'
                                Width = 400
                                Visible = True
                              end>
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited LabelSeq: TLabel
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [BAS370]'
              end
              inherited CheckCadSeq: TCheckBox
                Visible = False
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
            object SpeedButton55: TSpeedButton [6]
              Left = 706
              Top = 16
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
              Hint = 'Clique para pesquisar - [BAS364]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS365]'
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
                Top = 5
                Hint = 'Editar Registro - [BAS366]'
                ExplicitTop = 5
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS367]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS369]'
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
                Left = 177
                Hint = 'Ver registros da lixeira - [BAS371]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 177
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
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    Top = 515
    ExplicitTop = 515
    inherited lbStatusProcessamento: TLabel
      ExplicitTop = 3
    end
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Top = 259
  end
  inherited Timer1: TTimer
    Top = 259
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Top = 259
  end
  object PopupMenu3: TPopupMenu
    Left = 216
    Top = 280
    object SelecionartodosMod: TMenuItem
      Caption = 'Selecionar Todos - [BAS374]'
      OnClick = SelecionartodosModClick
    end
    object DesmarcarTodosMod: TMenuItem
      Caption = 'Desmarcar Todos - [BAS375]'
      OnClick = DesmarcarTodosModClick
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 248
    Top = 280
    object SelecionarTodosEq: TMenuItem
      Caption = 'Selecionar Todos - [BAS374]'
      OnClick = SelecionarTodosEqClick
    end
    object DesmarcarTodosEq: TMenuItem
      Caption = 'Desmarcar Todos - [BAS375]'
      OnClick = DesmarcarTodosEqClick
    end
  end
end
