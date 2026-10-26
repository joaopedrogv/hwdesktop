inherited frmCadMDFe: TfrmCadMDFe
  Caption = 'MDFe'
  ClientHeight = 612
  ExplicitWidth = 806
  ExplicitHeight = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 593
    BevelOuter = bvNone
    ExplicitHeight = 593
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 593
      ExplicitLeft = 799
      ExplicitTop = 0
      ExplicitHeight = 545
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 593
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 593
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 593
        ActivePage = tsUnidTr_Carga
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 593
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 562
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 562
            ExplicitWidth = 787
            ExplicitHeight = 562
            inherited PageControl3: TPageControl
              Width = 787
              Height = 514
              ActivePage = tsCadastro
              ExplicitWidth = 787
              ExplicitHeight = 514
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 483
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 483
                  ExplicitWidth = 779
                  ExplicitHeight = 483
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    ExplicitWidth = 775
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
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 779
                  Height = 483
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  OnEnter = ScrollBox4Enter
                  object gbMDFe: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 779
                    Height = 73
                    Align = alTop
                    Caption = 'MDFe'
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 25
                      Top = 18
                      Width = 33
                      Height = 13
                      Caption = 'Codigo'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 181
                      Top = 18
                      Width = 34
                      Height = 13
                      Caption = 'RNTRC'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 347
                      Top = 18
                      Width = 25
                      Height = 13
                      Caption = 'CIOT'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 459
                      Top = 18
                      Width = 70
                      Height = 13
                      Caption = 'Data Cadastro'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 622
                      Top = 18
                      Width = 64
                      Height = 13
                      Caption = 'Data Emissao'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 24
                      Top = 45
                      Width = 34
                      Height = 13
                      Caption = 'Modelo'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 191
                      Top = 45
                      Width = 24
                      Height = 13
                      Caption = 'Serie'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 321
                      Top = 45
                      Width = 51
                      Height = 13
                      Caption = 'Num MDFe'
                      FocusControl = DBEdit8
                    end
                    object Label14: TLabel
                      Left = 479
                      Top = 45
                      Width = 50
                      Height = 13
                      Caption = 'UF Partida'
                    end
                    object Label15: TLabel
                      Left = 634
                      Top = 45
                      Width = 52
                      Height = 13
                      Caption = 'UF Destino'
                    end
                    object DBEdit1: TDBEdit
                      Left = 64
                      Top = 15
                      Width = 75
                      Height = 21
                      DataField = 'COD_MDFE'
                      DataSource = dtmMDFe.dsMDFe
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 221
                      Top = 15
                      Width = 75
                      Height = 21
                      DataField = 'RNTRC'
                      DataSource = dtmMDFe.dsMDFe
                      Enabled = False
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 378
                      Top = 15
                      Width = 75
                      Height = 21
                      DataField = 'CIOT'
                      DataSource = dtmMDFe.dsMDFe
                      Enabled = False
                      TabOrder = 2
                    end
                    object DBEdit4: TDBEdit
                      Left = 535
                      Top = 15
                      Width = 75
                      Height = 21
                      DataField = 'DATA_CADASTRO'
                      DataSource = dtmMDFe.dsMDFe
                      Enabled = False
                      TabOrder = 3
                    end
                    object DBEdit5: TDBEdit
                      Left = 692
                      Top = 15
                      Width = 75
                      Height = 21
                      DataField = 'DHEMI'
                      DataSource = dtmMDFe.dsMDFe
                      Enabled = False
                      TabOrder = 4
                    end
                    object DBEdit6: TDBEdit
                      Left = 64
                      Top = 42
                      Width = 75
                      Height = 21
                      DataField = 'MODELO'
                      DataSource = dtmMDFe.dsMDFe
                      Enabled = False
                      TabOrder = 5
                    end
                    object DBEdit7: TDBEdit
                      Left = 221
                      Top = 42
                      Width = 75
                      Height = 21
                      DataField = 'SERIE'
                      DataSource = dtmMDFe.dsMDFe
                      Enabled = False
                      TabOrder = 6
                    end
                    object DBEdit8: TDBEdit
                      Left = 378
                      Top = 42
                      Width = 75
                      Height = 21
                      DataField = 'NMDF'
                      DataSource = dtmMDFe.dsMDFe
                      Enabled = False
                      TabOrder = 7
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 535
                      Top = 42
                      Width = 75
                      Height = 21
                      Style = csDropDownList
                      DataField = 'UFINI'
                      DataSource = dtmMDFe.dsMDFe
                      ItemHeight = 13
                      TabOrder = 8
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 692
                      Top = 42
                      Width = 75
                      Height = 21
                      Style = csDropDownList
                      DataField = 'UFFIM'
                      DataSource = dtmMDFe.dsMDFe
                      ItemHeight = 13
                      TabOrder = 9
                    end
                  end
                  object gbPercurso: TGroupBox
                    Left = 0
                    Top = 73
                    Width = 779
                    Height = 105
                    Align = alTop
                    Caption = 'Percurso'
                    TabOrder = 1
                    object Panel4: TPanel
                      Left = 2
                      Top = 15
                      Width = 775
                      Height = 88
                      Align = alClient
                      BevelOuter = bvNone
                      BorderWidth = 5
                      TabOrder = 0
                      object gbCidadesDescarregamento: TGroupBox
                        Left = 331
                        Top = 5
                        Width = 320
                        Height = 78
                        Caption = 'Cidades Descarregamento'
                        TabOrder = 0
                        object DBGrid2: TDBGrid
                          Left = 2
                          Top = 15
                          Width = 238
                          Height = 61
                          Align = alClient
                          DataSource = dtmMDFe.dsMDFeDes
                          Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'XMUNDESCARGA'
                              Visible = True
                            end>
                        end
                        object Panel5: TPanel
                          Left = 240
                          Top = 15
                          Width = 78
                          Height = 61
                          Align = alRight
                          BevelOuter = bvNone
                          BorderWidth = 3
                          TabOrder = 1
                          object SpeedButton9: TSpeedButton
                            Left = 3
                            Top = 3
                            Width = 72
                            Height = 27
                            Hint = 'Adicionar cidade de descarregamento - [MDFE018]'
                            Align = alTop
                            Caption = 'Adicionar'
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
                            OnClick = SpeedButton9Click
                            ExplicitLeft = 6
                            ExplicitTop = -2
                          end
                          object SpeedButton10: TSpeedButton
                            Left = 3
                            Top = 31
                            Width = 72
                            Height = 27
                            Hint = 'Remover cidade de descarregamento - [MDFE019]'
                            Align = alBottom
                            Caption = 'Remover'
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
                            OnClick = SpeedButton10Click
                            ExplicitLeft = 6
                            ExplicitTop = 36
                          end
                        end
                      end
                      object gbCidadesCarregamento: TGroupBox
                        Left = 5
                        Top = 5
                        Width = 320
                        Height = 78
                        Caption = 'Cidades Carregamento'
                        TabOrder = 1
                        object DBGrid3: TDBGrid
                          Left = 2
                          Top = 15
                          Width = 238
                          Height = 61
                          Align = alClient
                          DataSource = dtmMDFe.dsMDFeCar
                          Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'XMUNCARREGA'
                              Visible = True
                            end>
                        end
                        object Panel6: TPanel
                          Left = 240
                          Top = 15
                          Width = 78
                          Height = 61
                          Align = alRight
                          BevelOuter = bvNone
                          BorderWidth = 3
                          TabOrder = 1
                          object SpeedButton13: TSpeedButton
                            Left = 3
                            Top = 3
                            Width = 72
                            Height = 27
                            Hint = 'Adicionar cidade de carregamento - [MDFE016]'
                            Align = alTop
                            Caption = 'Adicionar'
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
                            OnClick = SpeedButton13Click
                            ExplicitLeft = 6
                            ExplicitTop = -2
                          end
                          object SpeedButton14: TSpeedButton
                            Left = 3
                            Top = 31
                            Width = 72
                            Height = 27
                            Hint = 'Remover cidade de carregamento - [MDFE017]'
                            Align = alBottom
                            Caption = 'Remover'
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
                            OnClick = SpeedButton14Click
                            ExplicitTop = 32
                            ExplicitWidth = 67
                          end
                        end
                      end
                      object GroupBox6: TGroupBox
                        Left = 657
                        Top = 5
                        Width = 112
                        Height = 76
                        Caption = 'UFs do Percurso'
                        Padding.Left = 3
                        Padding.Right = 3
                        Padding.Bottom = 3
                        TabOrder = 2
                        object Panel13: TPanel
                          Left = 72
                          Top = 15
                          Width = 35
                          Height = 56
                          Align = alRight
                          BevelOuter = bvNone
                          BorderWidth = 4
                          TabOrder = 0
                          object SpeedButton20: TSpeedButton
                            Left = 4
                            Top = 29
                            Width = 27
                            Height = 23
                            Align = alBottom
                            Flat = True
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000130B0000130B000000010000000100000021A5006B84
                              C6000029E700526BF700638CF7009494F700FF00FF009CB5FF009CBDFF00B5C6
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                              0606060606060606060606060606060606060606060606060606060606060606
                              0606060606060606060606060606060606060606060606060606060606060606
                              0606060606060606060606060606060606060606060606060606060100000000
                              0000000000000000010606000502020202020202020202020006060009080807
                              0707040404040303000606010000000000000000000000000106060606060606
                              0606060606060606060606060606060606060606060606060606060606060606
                              0606060606060606060606060606060606060606060606060606060606060606
                              0606060606060606060606060606060606060606060606060606}
                            OnClick = SpeedButton20Click
                            ExplicitLeft = 6
                            ExplicitTop = 0
                          end
                          object SpeedButton21: TSpeedButton
                            Left = 4
                            Top = 4
                            Width = 27
                            Height = 23
                            Align = alTop
                            Flat = True
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000130B0000130B000000010000000100002184290039B5
                              520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                              0505050505050505050505050505050503000003050505050505050505050505
                              0204010005050505050505050505050502040100050505050505050505050505
                              0204010005050505050505050505050502040100050505050505050300000000
                              0004010000000000030505020101010101010101010101010005050204040404
                              0404010404040404000505030202020202040100000000000305050505050505
                              0204010005050505050505050505050502040100050505050505050505050505
                              0204010005050505050505050505050502040100050505050505050505050505
                              0302020305050505050505050505050505050505050505050505}
                            OnClick = SpeedButton21Click
                            ExplicitLeft = 6
                            ExplicitTop = 0
                          end
                        end
                        object lbxUFPerc: TListBox
                          Left = 5
                          Top = 15
                          Width = 67
                          Height = 56
                          Align = alClient
                          ItemHeight = 13
                          TabOrder = 1
                        end
                      end
                    end
                  end
                  object gbCondutor: TGroupBox
                    Left = 0
                    Top = 178
                    Width = 779
                    Height = 154
                    Align = alTop
                    Caption = 'Condu'#231#227'o / Ve'#237'culos'
                    TabOrder = 2
                    OnExit = gbCondutorExit
                    object Label16: TLabel
                      Left = 13
                      Top = 25
                      Width = 45
                      Height = 13
                      Caption = 'Condutor'
                      FocusControl = DBEdit9
                    end
                    object Label17: TLabel
                      Left = 39
                      Top = 52
                      Width = 19
                      Height = 13
                      Caption = 'CPF'
                      FocusControl = DBEdit10
                    end
                    object Label18: TLabel
                      Left = 13
                      Top = 80
                      Width = 510
                      Height = 13
                      Caption = 
                        '*F3 para pesquisar o condutor no cadastro de colaboradores ou ma' +
                        'que a op'#231#227'o Terceiro e digite os dados'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label19: TLabel
                      Left = 176
                      Top = 52
                      Width = 39
                      Height = 13
                      Caption = 'Terceiro'
                    end
                    object Label20: TLabel
                      Left = 25
                      Top = 102
                      Width = 33
                      Height = 13
                      Caption = 'Veiculo'
                      FocusControl = DBEdit11
                    end
                    object Label21: TLabel
                      Left = 390
                      Top = 102
                      Width = 52
                      Height = 13
                      Caption = 'Reboque 1'
                      FocusControl = DBEdit12
                    end
                    object Label22: TLabel
                      Left = 6
                      Top = 129
                      Width = 52
                      Height = 13
                      Caption = 'Reboque 2'
                      FocusControl = DBEdit13
                    end
                    object Label23: TLabel
                      Left = 390
                      Top = 129
                      Width = 52
                      Height = 13
                      Caption = 'Reboque 3'
                      FocusControl = DBEdit14
                    end
                    object DBEdit9: TDBEdit
                      Left = 64
                      Top = 22
                      Width = 232
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'XNOME_CONDUTOR'
                      DataSource = dtmMDFe.dsMDFe
                      TabOrder = 0
                      OnEnter = DBEdit9Enter
                      OnExit = DBEdit9Exit
                      OnKeyDown = DBEdit9KeyDown
                    end
                    object DBEdit10: TDBEdit
                      Left = 64
                      Top = 49
                      Width = 75
                      Height = 21
                      DataField = 'CPF_CONDUTOR'
                      DataSource = dtmMDFe.dsMDFe
                      TabOrder = 1
                      OnExit = DBEdit9Exit
                      OnKeyDown = DBEdit9KeyDown
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 221
                      Top = 49
                      Width = 75
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TERCEIRO_CONDUTOR'
                      DataSource = dtmMDFe.dsMDFe
                      ItemHeight = 13
                      Items.Strings = (
                        'S'
                        'N')
                      TabOrder = 2
                      OnExit = DBEdit9Exit
                    end
                    object DBEdit11: TDBEdit
                      Left = 64
                      Top = 99
                      Width = 75
                      Height = 21
                      DataField = 'COD_VEIC'
                      DataSource = dtmMDFe.dsMDFe
                      TabOrder = 5
                      OnEnter = DBEdit11Enter
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 145
                      Top = 99
                      Width = 239
                      Height = 21
                      DataField = 'COD_VEIC'
                      DataSource = dtmMDFe.dsMDFe
                      DropDownWidth = 400
                      KeyField = 'COD_VEIC'
                      ListField = 'PLACA;MODELO'
                      ListSource = dtmMDFe.dsVeic
                      TabOrder = 6
                      OnEnter = DBEdit11Enter
                    end
                    object DBEdit12: TDBEdit
                      Left = 448
                      Top = 99
                      Width = 75
                      Height = 21
                      DataField = 'COD_VEIC_REBOQUE_1'
                      DataSource = dtmMDFe.dsMDFe
                      TabOrder = 7
                      OnEnter = DBEdit12Enter
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 529
                      Top = 99
                      Width = 239
                      Height = 21
                      DataField = 'COD_VEIC_REBOQUE_1'
                      DataSource = dtmMDFe.dsMDFe
                      DropDownWidth = 400
                      KeyField = 'COD_VEIC'
                      ListField = 'PLACA;MODELO'
                      ListSource = dtmMDFe.dsVeic
                      TabOrder = 8
                      OnEnter = DBEdit12Enter
                    end
                    object DBEdit13: TDBEdit
                      Left = 64
                      Top = 126
                      Width = 75
                      Height = 21
                      DataField = 'COD_VEIC_REBOQUE_2'
                      DataSource = dtmMDFe.dsMDFe
                      TabOrder = 9
                      OnEnter = DBEdit12Enter
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 145
                      Top = 126
                      Width = 239
                      Height = 21
                      DataField = 'COD_VEIC_REBOQUE_2'
                      DataSource = dtmMDFe.dsMDFe
                      DropDownWidth = 400
                      KeyField = 'COD_VEIC'
                      ListField = 'PLACA;MODELO'
                      ListSource = dtmMDFe.dsVeic
                      TabOrder = 10
                      OnEnter = DBEdit12Enter
                    end
                    object DBEdit14: TDBEdit
                      Left = 448
                      Top = 126
                      Width = 75
                      Height = 21
                      DataField = 'COD_VEIC_REBOQUE_3'
                      DataSource = dtmMDFe.dsMDFe
                      TabOrder = 11
                      OnEnter = DBEdit12Enter
                    end
                    object DBLookupComboBox4: TDBLookupComboBox
                      Left = 529
                      Top = 126
                      Width = 239
                      Height = 21
                      DataField = 'COD_VEIC_REBOQUE_3'
                      DataSource = dtmMDFe.dsMDFe
                      DropDownWidth = 400
                      KeyField = 'COD_VEIC'
                      ListField = 'PLACA;MODELO'
                      ListSource = dtmMDFe.dsVeic
                      TabOrder = 12
                      OnEnter = DBEdit12Enter
                    end
                    object BitBtn8: TBitBtn
                      Left = 309
                      Top = 18
                      Width = 72
                      Height = 55
                      Hint = 'Adicionar condutor - [MDFE020]'
                      Caption = 'Adicionar'
                      TabOrder = 3
                      OnClick = BitBtn8Click
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
                      Layout = blGlyphTop
                    end
                    object Panel8: TPanel
                      Left = 395
                      Top = 12
                      Width = 379
                      Height = 65
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 4
                      object Panel9: TPanel
                        Left = 297
                        Top = 0
                        Width = 78
                        Height = 61
                        Align = alRight
                        BevelOuter = bvNone
                        BorderWidth = 3
                        TabOrder = 0
                        object SpeedButton19: TSpeedButton
                          Left = 3
                          Top = 3
                          Width = 72
                          Height = 55
                          Hint = 'Remover condutor - [MDFE021]'
                          Align = alClient
                          Caption = 'Remover'
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
                          Layout = blGlyphTop
                          OnClick = SpeedButton19Click
                          ExplicitLeft = 6
                          ExplicitTop = -6
                        end
                      end
                      object DBGrid5: TDBGrid
                        Left = 0
                        Top = 0
                        Width = 297
                        Height = 61
                        Align = alClient
                        DataSource = dtmMDFe.dsMDFeCond
                        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'XNOME'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'CPF'
                            Width = 64
                            Visible = True
                          end>
                      end
                    end
                  end
                  object GroupBox10: TGroupBox
                    Left = 0
                    Top = 441
                    Width = 779
                    Height = 42
                    Align = alBottom
                    Caption = 'Totais'
                    Enabled = False
                    TabOrder = 3
                    object Label24: TLabel
                      Left = 8
                      Top = 18
                      Width = 46
                      Height = 13
                      Caption = 'Qtde NFe'
                      FocusControl = DBEdit15
                    end
                    object Label25: TLabel
                      Left = 168
                      Top = 18
                      Width = 83
                      Height = 13
                      Caption = 'Valor Total Carga'
                      FocusControl = DBEdit16
                    end
                    object Label26: TLabel
                      Left = 419
                      Top = 18
                      Width = 39
                      Height = 13
                      Caption = 'Unidade'
                    end
                    object Label27: TLabel
                      Left = 582
                      Top = 18
                      Width = 79
                      Height = 13
                      Caption = 'Peso Bruto Total'
                      FocusControl = DBEdit17
                    end
                    object DBEdit15: TDBEdit
                      Left = 60
                      Top = 15
                      Width = 79
                      Height = 21
                      DataField = 'QNFE'
                      DataSource = dtmMDFe.dsMDFe
                      TabOrder = 0
                    end
                    object DBEdit16: TDBEdit
                      Left = 262
                      Top = 15
                      Width = 100
                      Height = 21
                      DataField = 'VCARGA'
                      DataSource = dtmMDFe.dsMDFe
                      TabOrder = 1
                    end
                    object DBEdit17: TDBEdit
                      Left = 667
                      Top = 15
                      Width = 100
                      Height = 21
                      DataField = 'QCARGA'
                      DataSource = dtmMDFe.dsMDFe
                      TabOrder = 2
                    end
                    object Edit1: TEdit
                      Left = 464
                      Top = 15
                      Width = 100
                      Height = 21
                      TabOrder = 3
                      Text = 'KG'
                    end
                  end
                  object GroupBox11: TGroupBox
                    Left = 0
                    Top = 332
                    Width = 779
                    Height = 109
                    Align = alClient
                    Caption = 'Notas Fiscais'
                    TabOrder = 4
                    object Panel7: TPanel
                      Left = 634
                      Top = 15
                      Width = 143
                      Height = 92
                      Align = alRight
                      BevelOuter = bvNone
                      BorderWidth = 3
                      TabOrder = 0
                      object SpeedButton17: TSpeedButton
                        AlignWithMargins = True
                        Left = 6
                        Top = 56
                        Width = 131
                        Height = 30
                        Hint = 'Remover NF-e - [MDFE024]'
                        Align = alBottom
                        Caption = 'Remover NFe'
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
                        OnClick = SpeedButton17Click
                        ExplicitLeft = 3
                        ExplicitTop = 58
                        ExplicitWidth = 179
                      end
                      object SpeedButton16: TSpeedButton
                        AlignWithMargins = True
                        Left = 6
                        Top = 39
                        Width = 131
                        Height = 14
                        Hint = 'Pesquisar NF-e - [MDFE023]'
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alClient
                        Caption = 'Pesquisar NFe'
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
                        OnClick = SpeedButton16Click
                        ExplicitTop = 19
                        ExplicitWidth = 179
                        ExplicitHeight = 36
                      end
                      object Panel21: TPanel
                        AlignWithMargins = True
                        Left = 6
                        Top = 6
                        Width = 131
                        Height = 30
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 0
                        object SpeedButton15: TSpeedButton
                          Left = 0
                          Top = 0
                          Width = 99
                          Height = 30
                          Hint = 'Adicionar NF-e - [MDFE022]'
                          Align = alClient
                          Caption = 'Adicionar NFe'
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
                          OnClick = SpeedButton15Click
                          ExplicitLeft = 1
                          ExplicitWidth = 103
                        end
                        object SpeedButton37: TSpeedButton
                          AlignWithMargins = True
                          Left = 102
                          Top = 0
                          Width = 29
                          Height = 30
                          Margins.Top = 0
                          Margins.Right = 0
                          Margins.Bottom = 0
                          Align = alRight
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                            0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                            0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                            0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                          OnClick = SpeedButton37Click
                          ExplicitLeft = 105
                        end
                      end
                    end
                    object DBGrid4: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 600
                      Height = 92
                      Align = alClient
                      DataSource = dtmMDFe.dsMDFeDesNFe
                      ReadOnly = True
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'CHNFE'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_LANC'
                          Width = 87
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUM_NF'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'RAZAO'
                          Width = 263
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NOME_MUNICIPIO'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CPFCGC'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_CLIENTE'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_TOTAL_NF'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PESO_BRUTO_NF'
                          Width = 64
                          Visible = True
                        end>
                    end
                    object Panel14: TPanel
                      Left = 602
                      Top = 15
                      Width = 32
                      Height = 92
                      Align = alRight
                      BevelOuter = bvNone
                      BorderWidth = 3
                      TabOrder = 2
                      object SpeedButton22: TSpeedButton
                        Left = 3
                        Top = 3
                        Width = 26
                        Height = 86
                        Hint = 'Mais dados'
                        Align = alClient
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000320B0000320B00000001000000010000CE630000FFC6
                          8400FFD6A500FFD6AD00FFDEB500FFE7C600FFEFD600FFF7E700FFFFF700FF00
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                          090909090909090909090900000000000000000000000000000009000A0A0807
                          0605040303030303030009000A0101080101010101010101030009000A0A0A0A
                          0807060504030303030009000A01010A0101010101010101030009000A0A0A0A
                          0A0A080706050403030009000A01010A0101010101010101030009000A0A0A0A
                          0A0A0A0A08070602040009000A01010A0101010101010101050009000A0A0A0A
                          0A0A0A0A0A0A0807060009000A0A0A0A0A0A0A0A0A0A0A080700090000000000
                          0000000000000000000009090000000000000000000000000009090909090909
                          0909090909090909090909090909090909090909090909090909}
                        OnClick = SpeedButton22Click
                        ExplicitTop = 2
                        ExplicitWidth = 55
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 514
              Width = 787
              ExplicitTop = 514
              ExplicitWidth = 787
              inherited BitBtn4: TBitBtn
                Left = 356
                Top = 10
                Hint = 'Confirmar NF-e - [MDFE025]'
                Caption = 'Con&firmar'
                ExplicitLeft = 356
                ExplicitTop = 10
              end
              inherited BitBtn5: TBitBtn
                Left = 437
                Top = 10
                ExplicitLeft = 437
                ExplicitTop = 10
              end
              inherited BitBtn6: TBitBtn
                Top = 11
                ExplicitTop = 11
              end
              object BitBtn7: TBitBtn
                Left = 275
                Top = 10
                Width = 75
                Height = 25
                Hint = 'Savar MDFe - [MDFE006]'
                Caption = 'S&alvar'
                TabOrder = 4
                OnClick = BitBtn7Click
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
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 562
          inherited GroupBox3: TGroupBox
            Width = 787
            Height = 281
            ExplicitWidth = 787
            ExplicitHeight = 281
            inherited imgInformation: TImage
              Left = 761
              Height = 264
              ExplicitLeft = 765
              ExplicitHeight = 264
            end
            object btSelectAll: TSpeedButton [6]
              Left = 704
              Top = 44
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
            object btUnSelectAll: TSpeedButton [7]
              Left = 733
              Top = 44
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
            object SpeedButton18: TSpeedButton [8]
              Left = 605
              Top = 44
              Width = 23
              Height = 22
              Hint = 'Ativar / Desativar Conting'#234'ncia - [MDFE029]'
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                20000000000000040000C30E0000C30E00000000000000000000000000000000
                000000000000000000000000000000000000000000000000000067991F146799
                1FA467991FF867991FFF67991FF467991F9467991F3D67991FFF000000000000
                0000000000000000000000000000000000000000000067991F0C67991FD76799
                1FFD67991F5267991F2967991F5C67991FE067991FE367991FFF0000000083AB
                49FF64B5E9FF64B5E9FF83AB49FF64B5E9FF64B5E95267991F7C67991FFE6799
                1F11000000000000000067991F5867991FBC67991FFF67991FFF0000000083AB
                49FF64B5E9FF64B5E9FF83AB49FF64B5E9FE64B5E91900000000000000000000
                0000000000000000000067991FFF67991FFF67991FFF67991FFF83AB49FF83AB
                49FF83AB49FF84AC4AFF83AB49FF83AB49D20000000067991FFF67991FFF6799
                1FFF67991FFF000000000000000000000000000000000000000083AB49FF83AB
                49FF83AB49FF84AC4AFF83AB49FF83AB49C90000000067991FFF67991FFF6799
                1FBC67991F58000000000000000067991F1167991FFE67991F7C83AB49FF83AB
                49FFFFFFFFFFFFFFFFFF84AC4AFFFFFFFFCA0000000067991FFF67991FE36799
                1FE067991F5C67991F2967991F5267991FFD67991FD767991F0C83AB49FF83AB
                49FFFFFFFFFFFFFFFFFF84AC4AFFFFFFFFEAFFFFFF0967991FFF67991F3D6799
                1F9467991FF467991FFF67991FF867991FA467991F140000000083AB49FF83AB
                49FF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AB781AA460C79A43A0B83AB
                492C67991F0667991F1E67991F0983AB492383AB49A60000000084AC4AFF84AC
                4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF83AB49E683AB49DEFEFE
                FEFFFEFEFEE383AB49C3FEFEFEDDFEFEFEFF83AB49FF0000000083AB49FF83AB
                49FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFF83AB49FF83AB49FFFEFE
                FEFFFEFEFEFF83AB49FFFEFEFEFFFEFEFEFF84AC4AFF0000000083AB49FF83AB
                49FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFF83AB49FF83AB49FF83AB
                49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB49FF0000000083AB49FF83AB
                49FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFF83AB49FF83AB49FFFEFE
                FEFFFEFEFEFF83AB49FFFEFEFEFFFEFEFEFF83AB49FF0000000083AB49FF83AB
                49FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFF83AB49FF83AB49FFFEFE
                FEFFFEFEFEFF83AB49FFFEFEFEFFFEFEFEFF83AB49FF0000000083AB49FF83AB
                49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB
                49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB49FF0000000083AB49FF83AB
                49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB
                49FF83AB49FF83AB49FF83AB49FF83AB49FF83AB49FF00000000}
              OnClick = SpeedButton18Click
            end
            object Label28: TLabel [9]
              Left = 694
              Top = 13
              Width = 62
              Height = 30
              AutoSize = False
              Caption = 'Contingencia Ativada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [MDFE002]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [MDFE003]'
            end
            inherited CheckBox1: TCheckBox
              Left = 353
              OnClick = CheckBox3Click
              ExplicitLeft = 353
            end
            object BitBtn9: TBitBtn
              Left = 463
              Top = 44
              Width = 110
              Height = 25
              Hint = 'Novo cadastro pela carga - [MDFE004]'
              Caption = 'Novo &Carga'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = BitBtn9Click
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
            object GroupBox4: TGroupBox
              Left = 5
              Top = 68
              Width = 399
              Height = 127
              Caption = 'Op'#231#245'es Avan'#231'adas'
              TabOrder = 12
              Visible = False
              object RadioGroup1: TRadioGroup
                Left = 7
                Top = 16
                Width = 180
                Height = 104
                Caption = 'Situacao'
                ItemIndex = 0
                Items.Strings = (
                  'Todas'
                  'Autorizados'
                  'Em Processamento'
                  'N'#227'o Autorizados'
                  'Rejeitados')
                TabOrder = 0
              end
              object RadioGroup2: TRadioGroup
                Left = 193
                Top = 16
                Width = 184
                Height = 104
                Caption = 'Situa'#231#227'o do Evento'
                ItemIndex = 0
                Items.Strings = (
                  'Todos'
                  'Encerrados'
                  'Cancelados'
                  'Sem Evento')
                TabOrder = 1
              end
            end
            object GroupBox5: TGroupBox
              Left = 408
              Top = 68
              Width = 277
              Height = 127
              Caption = 'Pesquisa Adicional'
              TabOrder = 13
              Visible = False
              object Label109: TLabel
                Left = 7
                Top = 54
                Width = 51
                Height = 13
                Caption = 'Conte'#250'do:'
              end
              object Label110: TLabel
                Left = 21
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label111: TLabel
                Left = 157
                Top = 54
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label112: TLabel
                Left = 10
                Top = 78
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 64
                Top = 20
                Width = 203
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 0
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
            Top = 281
            Width = 787
            Height = 281
            ExplicitTop = 281
            ExplicitWidth = 787
            ExplicitHeight = 281
            inherited Splitter1: TSplitter
              Height = 220
              ExplicitHeight = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 220
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OnCellClick = DBGrid1CellClick
              OnColEnter = DBGrid1ColEnter
              OnColExit = DBGrid1ColExit
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnDblClick = DBGrid1DblClick
              OnKeyDown = DBGrid1KeyDown
              OnMouseUp = DBGrid1MouseUp
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [MDFE005]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [MDFE007]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [MDFE008] - [MDFE009]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton5: TSpeedButton
                Left = 738
                Visible = False
                ExplicitLeft = 738
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Consulta Lote MDFe - [MDFE011]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFCBAF94CBAF94D5C6B8FF00FFFF00FFFF00FFFF
                  00FFFF00FF8A8A8A676767676767676767676767676767676767676767676767
                  676767676767676767B9B9B9FF00FFB3783EB3783EA96624A86624B3783EB378
                  3EFF00FFFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FF00FFB3783EB3783EA96624FFFFFF
                  FFFFFFA86624B3783EB3783EFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00FFB3783EB3783EB3
                  783EA76421FFFFFFFFFFFFA76321B3783EB3783EB3783EFF00FFFF00FF676767
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9DB0B0B0FF00
                  FFB3783EB3783EB3783EA76421FFFFFFFFFFFFA76321B3783EB3783EB3783EFF
                  00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFF1F1F1D3B496B3783EB3783EB3783EA76421FFFFFFFFFFFFA76321B378
                  3EB3783EB3783ECCB39AFF00FF676767FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9DBBBBBBD4B598B3783EB3783EB3783EA76421FFFFFF
                  FFFFFFA76321B3783EB3783EB3783ECDB39AFF00FF676767FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FF00FFB3783EB3783EB3
                  783EB3783E9F550C9F550CB3783EB3783EB3783EB3783EFF00FFFF00FF676767
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9E9E9EFF00
                  FFB3783EB3783EB3783EAA6929F2E9E1F4EBE2AA6928B3783EB3783EB3783EFF
                  00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFF2F2F2FF00FFB3783EB3783EA96624FFFFFFFFFFFFA86624B378
                  3EB3783EFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9D9D9D9D999999C5C5C5FF00FFB3783EB3783EA96624
                  A86624B3783EB3783EFF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F2F2FF
                  00FFFF00FFD2B598D2B597FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9D9999
                  999999999999999A9A9AACACACF1F1F1F1F1F1F6F6F66A6A6AFF00FFFF00FFFF
                  00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6767
                  67FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9D9D9D9D999999999999999999999999999999FFFFFF
                  FFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9D9999
                  99999999999999999999999999FFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF
                  00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6767
                  67FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9D9D9D9D999999999999999999999999999999FFFFFF
                  FFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF
                  00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFBC8C5DB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB47A42FF00FFFF00FFFF00FF}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Left = 405
                Hint = 'Enviar evento de Cancelamento do MDFe - [MDFE013]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF8F9AD78F9AD7B5BBDBFF00FFFF00FFFF00FFFF
                  00FFFF00FF8A8A8A676767676767676767676767676767676767676767676767
                  676767676767676767B9B9B9FF00FF314ACB334CCC334CCC334CCC324CCC314A
                  CBFF00FFFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FF00FF3049CB2741C81E39C6334CCC
                  324CCC1E38C62741C83049CBFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00FF314ACB2741C8FF
                  FFFFB7C0ED0C2AC20C28C2C1C9EEFFFFFF2540C8314ACBFF00FFFF00FF676767
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9DB0B0B0FF00
                  FF334CCC1E39C6B9C2EDFFFFFF9CA8E6A6B1E8FFFFFFB2BBEB1E3AC7334CCCFF
                  00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFF1F1F1909EE1334CCC334CCC0B29C29DAAE6FFFFFFFFFFFF98A4E40D2B
                  C2334CCC334CCC95A0D7FF00FF676767FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9DBBBBBB929FE1334CCC324CCC0C28C2A6B1E8FFFFFF
                  FFFFFF9DA9E60C2AC2334CCC334CCC95A0D7FF00FF676767FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FF00FF324CCC1E38C6BE
                  C6EEFFFFFF97A4E49FABE6FFFFFFB6C0ED1E39C6334CCCFF00FFFF00FF676767
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9E9E9EFF00
                  FF314ACB2944C8FFFFFFB1BAEB0D2BC20C29C2B8C1EDFFFFFF2841C8314ACBFF
                  00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFF2F2F2FF00FF2F48CB2742C81E3AC7334CCC334CCC1D39C62842
                  C82F49CBFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9D9D9D9D999999C5C5C5FF00FF314ACB334CCC334CCC
                  334CCC334CCC314ACBFF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F2F2FF
                  00FFFF00FF939FDF929EDFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9D9999
                  999999999999999A9A9AACACACF1F1F1F1F1F1F6F6F66A6A6AFF00FFFF00FFFF
                  00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6767
                  67FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9D9D9D9D999999999999999999999999999999FFFFFF
                  FFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9D9999
                  99999999999999999999999999FFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF
                  00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6767
                  67FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9D9D9D9D999999999999999999999999999999FFFFFF
                  FFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF
                  00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFBC8C5DB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB47A42FF00FFFF00FFFF00FF}
                OnClick = SpeedButton7Click
                ExplicitLeft = 405
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Enviar evento de encerramento do MDFe - [MDFE012]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB4C69BB4C69BC9D2BCFF00FFFF00FFFF00FFFF
                  00FFFF00FF8A8A8A676767676767676767676767676767676767676767676767
                  676767676767676767B9B9B9FF00FF83A94E83A94E83A94E83A94E83A94E83A9
                  4EFF00FFFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FF00FF83A94E83A94E6E9A306E9A2F
                  83A94E83A94E83A94E83A94EFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00FF83A94E83A94E74
                  9D3FFFFFFFFFFFFF749C3E83A94E83A94E83A94E83A94EFF00FFFF00FF676767
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9DB0B0B0FF00
                  FF83A94E749D3FFFFFFFFCFEFDF8FAF5FFFFFF749C3E83A94E83A94E83A94EFF
                  00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFF1F1F1AABF8C6E9A30FFFFFFFCFDFCFFFFFFFFFFFFF6F8F2FFFFFF749C
                  3E83A94E83A94EB8C8A1FF00FF676767FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9DBBBBBBABC08E83A94E749C3FFFFFFF749C3E749C3E
                  FFFFFFF5F8F0FFFFFF749C3E83A94EB8C8A1FF00FF676767FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FF00FF83A94E83A94E6E
                  9A2F83A94E83A94E749C3EFFFFFFF5F8F0FFFFFF6E9A2FFF00FFFF00FF676767
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9E9E9EFF00
                  FF83A94E83A94E83A94E83A94E83A94E83A94E749C3EFFFFFF749C3E83A94DFF
                  00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFF2F2F2FF00FF83A94E83A94E83A94E83A94E83A94E83A94E6E9A
                  2F83A94EFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9D9D9D9D999999C5C5C5FF00FF83A94E83A94E83A94E
                  83A94E83A94E83A94EFF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F2F2FF
                  00FFFF00FFACC08FABC08EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9D9999
                  999999999999999A9A9AACACACF1F1F1F1F1F1F6F6F66A6A6AFF00FFFF00FFFF
                  00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6767
                  67FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9D9D9D9D999999999999999999999999999999FFFFFF
                  FFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868
                  FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9D9999
                  99999999999999999999999999FFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF
                  00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6767
                  67FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFF
                  FFFF9D9D9D9D9D9D9D9D9D9D9D9D999999999999999999999999999999FFFFFF
                  FFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF
                  00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFBC8C5DB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB47A42FF00FFFF00FFFF00FF}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Enviar email - [MDFE014] - [MDFE015]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000C40E0000C40E00000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDA49B9B9B
                  9B9B9B9B9B9B9B9B9B9B9B9B9B9B9BA4FDFDFDFD9BFFFFFFFFFFFFFFFF089B00
                  000000F7FFFFFF9BFDFDFDFD9BFFFFFFFFFFFFFFF700A4F6FFFFFFFFFFFFFF9B
                  FDFDFDFD9BFFFFFFFFFFFF070007FFFFFFFFFFFFFFFFFF9BFDFDFDFD9BFFFFFF
                  5B5BFF4952F75B00005200000052FF9BFDFDFDFD9BFFFFFFFFFF0800080700F7
                  FFF700F7FF49079BFDFDFDFD9BFFFFFF5B5BF700F75B00F7F7A4009BFF5BA49B
                  FDFDFDFD9BFFFFFFFFFFF752FFA452FFFFF600F7FF9BA49BFDFDFDFD9BFFFFFF
                  5B5B0700F75B00F7F7A4009BFF9BA49BFDFDFDFD9BFFFFFFFFFF080008F600A4
                  FF0700F7FF52F79BFDFDFDFD9BFFFFFF5B5BFF5252F7A4000000009B0700089B
                  FDFDFDFD9BFFFFFFFFFFFF0800F7FFFFFFFFFFFF529BFF9BFDFDFDFD9BFFFFFF
                  5B5BFFF7A40052A4F7F79B4952FFFF9BFDFDFDFD9BFFFFFFFFFFFFFFFFF6A400
                  000052A4FFFFFF9BFDFDFDFD9BFFFFFF5B5BFFF7F7F7F7F7F7F7F7F7FFFFFF9B
                  FDFDFDFD9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BFDFDFDFD9BFFFFFF
                  5B5BFFF7F7F7F7F7F7F7F7F7FFFFFF9BFDFDFDFD9BFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFF9BFDFDFDFD9BFFFFFF5B5BFFF7F7F7F7F7F7F7F7F7FFFFFF9B
                  FDFDFDFD9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BFDFDFDFD9BFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BFDFDFDFDE2E2E2E2E2E2E2E2E2E2E2E2
                  E2E2E2E2E2E2E2E2FDFDFDFDE2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
                  FDFDFDFDE3E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2FDFD}
                OnClick = SpeedButton11Click
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
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Left = 235
                Hint = 'Enviar Lote de MDFe - [MDFE010]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8A8A8A676767676767676767676767676767676767676767676767676767
                  6767676767676767676767676767676767676767676767676767677A7A7AFF00
                  FFFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF676767FF00FFFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF676767FFFFFF
                  FFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9D9999999999
                  99999999999999999999FFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF
                  00FF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00
                  FFFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D
                  9D9D9D9D9D9D9D9D9D9D9D999999999999999999999999999999FFFFFFFFFFFF
                  FFFFFF676767FF00FFFF00FFFF00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9
                  F9F9EBEBEBEAEAEAEAEAEAB9B9B9FF00FFFF00FFFF00FFFF00FF676767FFFFFF
                  FFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9D9999999999
                  99999999999999CACACAFF00FFAB528DAB528DAB528DFF00FFFF00FFFF00FFFF
                  00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5FF00FFFF00FFAB528DAB528DAB52
                  8DFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D
                  9D9D9D9D9D9D9D9D9D9D9D999999C0C0C0CECECECECECECECECEFF00FFFF00FF
                  FF00FFAC558EAB528DAB528DFF00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF00FFAB528DAB528DAB
                  528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DFF00FF686868FFFFFF
                  FFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9DACACACFF00
                  FFAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DB0
                  6095686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFF7F7F7FF00FFAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB52
                  8DAB528DAB528DFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D
                  9D9D9D9D9D9D9D9D9D9D9DA1A1A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFAC558EAB528DAB528DFF00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF6F6F6F6F6F6F6
                  F6F6FF00FFFF00FFAB528DAB528DAB528DFF00FFFF00FFFF00FF686868FFFFFF
                  FFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D9D9D9D9D9D9D9D9D9999999999
                  99999999999999BBBBBBFF00FFAB528DAB528DAB528DFF00FFFF00FFFF00FFFF
                  00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFF9D
                  9D9D9D9D9D9D9D9D9D9D9D999999999999999999999999999999FAFAFAF8F8F8
                  F7F7F7818181FF00FFFF00FFFF00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF00FF686868FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFFF00FFFF00FFFF
                  00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00
                  FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EFF00FFFF00FFFF00FFFF00FFBC8C5DB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB47A42FF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton26Click
                ExplicitLeft = 235
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 220
              ExplicitHeight = 220
              inherited ScrollBox2: TScrollBox
                Height = 203
                ExplicitHeight = 203
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 562
        end
        object tsImpressaoEmail: TTabSheet
          Caption = 'tsImpressaoEmail'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnImpressaoEmail: TPanel
            Left = 64
            Top = 58
            Width = 321
            Height = 246
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object btImpMDFe: TBitBtn
              Left = 17
              Top = 17
              Width = 282
              Height = 25
              Hint = 'Imprimir MDF-e - [MDFE008]'
              Caption = 'Im&primir MDF-e'
              TabOrder = 0
              OnClick = btImpMDFeClick
              OnKeyDown = BitBtn81KeyDown
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000220B0000220B00000001000000010000181818002118
                21001821210031313100393939004242420052525200636363006B6B6B007373
                7300848484008C8C8C00948C8C00949494009C949400F7AD94009C9C9C00CE9C
                9C00F7AD9C00FFAD9C00FFB59C009C9CA500A5A5A500ADA5A500C6A5A500A5AD
                A500FFBDA500A5D6A500ADADAD00B5ADAD00FFC6AD00B5B5B500FFC6B500BDBD
                BD00C6BDBD00BDC6BD00E7C6BD00EFCEBD00FFCEBD00BDBDC600C6C6C600CEC6
                C600E7CEC600CECECE00D6CECE00DED6CE00FFDECE00D6D6D600FFE7D600D6DE
                DE00DEDEDE00EFE7DE00E7E7E700EFE7E700FFE7E700EFEFEF00F7EFEF00F7EF
                F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B3B
                103B3B3B0A0A0B3B3B3B3B3B3B3B10102C0D04060E282F0A3B3B3B3B10103A3C
                2F1005010103070A0B3B0C10373C3528100B0D0A07040201093B10343421161D
                22160D0C0D0E0B080A3B0D1C161C282F373732281C100C0D0B3B0C1C282B2832
                2B19212B2F2F281F0D3B3B102B2B32281F1B231817161F22163B3B3B10211C1C
                343837332F2B1F0D3B3B3B3B3B102F2B10212F2F2F281C3B3B3B3B3B3B3B362E
                24242A2D2B0D3B3B3B3B3B3B3B3B112E261E1A133B3B3B3B3B3B3B3B3B3B112E
                261E1A0F3B3B3B3B3B3B3B3B3B3B112E261E1A123B3B3B3B3B3B3B3B3B11302E
                261E1A123B3B3B3B3B3B3B3B3B1111111112123B3B3B3B3B3B3B}
            end
            object btImpMDFeEvento: TBitBtn
              Left = 17
              Top = 48
              Width = 282
              Height = 25
              Hint = 'Imprimir Envento do MDF-e - [MDFE009]'
              Caption = '&Imprimir Envento do MDF-e'
              TabOrder = 1
              OnClick = btImpMDFeEventoClick
              OnKeyDown = BitBtn81KeyDown
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000220B0000220B00000001000000010000181818002118
                21001821210031313100393939004242420052525200636363006B6B6B007373
                7300848484008C8C8C00948C8C00949494009C949400F7AD94009C9C9C00CE9C
                9C00F7AD9C00FFAD9C00FFB59C009C9CA500A5A5A500ADA5A500C6A5A500A5AD
                A500FFBDA500A5D6A500ADADAD00B5ADAD00FFC6AD00B5B5B500FFC6B500BDBD
                BD00C6BDBD00BDC6BD00E7C6BD00EFCEBD00FFCEBD00BDBDC600C6C6C600CEC6
                C600E7CEC600CECECE00D6CECE00DED6CE00FFDECE00D6D6D600FFE7D600D6DE
                DE00DEDEDE00EFE7DE00E7E7E700EFE7E700FFE7E700EFEFEF00F7EFEF00F7EF
                F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B3B
                103B3B3B0A0A0B3B3B3B3B3B3B3B10102C0D04060E282F0A3B3B3B3B10103A3C
                2F1005010103070A0B3B0C10373C3528100B0D0A07040201093B10343421161D
                22160D0C0D0E0B080A3B0D1C161C282F373732281C100C0D0B3B0C1C282B2832
                2B19212B2F2F281F0D3B3B102B2B32281F1B231817161F22163B3B3B10211C1C
                343837332F2B1F0D3B3B3B3B3B102F2B10212F2F2F281C3B3B3B3B3B3B3B362E
                24242A2D2B0D3B3B3B3B3B3B3B3B112E261E1A133B3B3B3B3B3B3B3B3B3B112E
                261E1A0F3B3B3B3B3B3B3B3B3B3B112E261E1A123B3B3B3B3B3B3B3B3B11302E
                261E1A123B3B3B3B3B3B3B3B3B1111111112123B3B3B3B3B3B3B}
            end
            object BitBtn81: TBitBtn
              Left = 17
              Top = 199
              Width = 282
              Height = 25
              Caption = '&Voltar (Esc)'
              ModalResult = 2
              TabOrder = 4
              OnClick = BitBtn81Click
              OnKeyDown = BitBtn81KeyDown
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                2828281F05002828282828282828282828282817050713282828282828282828
                2828282817060715282828282828282828282828281507062328280004040404
                040404232828000701282802090807070707061B28282706062328040B090711
                2727272828282800071328060D070A07232828282828281C070128070E13020B
                082028282828281C0701280F101D28020D0818282828280107132816191E2828
                140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                282827140808041B282828282828282828282828282828282828282828282828
                2828282828282828282828282828282828282828282828282828}
            end
            object btEmailMDFe: TBitBtn
              Left = 17
              Top = 79
              Width = 282
              Height = 25
              Hint = 'Enviar email do MDF-e - [MDFE014]'
              Caption = '&Enviar email do MDF-e'
              TabOrder = 2
              OnClick = btEmailMDFeClick
              OnKeyDown = BitBtn81KeyDown
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000C30E0000C30E000000010000000100005A423900634A
                3900634A420063524A006B524A0073524A006B5A4A006B5A5200735A52007B5A
                5200845A52007B6B6300846B6B009C736B00A5737300A57B730094847B00AD84
                84009C8C8400BD8C8C00B5948C00C6949400AD9C9400BD9C940042739C004A7B
                9C0073849C009C8C9C00B59C9C00CE9C9C00D69C9C00D6A59C00DEAD9C00EFB5
                9C00EFC69C00F7C69C00297BA500317BA500B5A5A500C6A5A500CEA5A500C6AD
                A500D6ADA500DEB5A500FFD6A500FFDEA500CEADAD00D6ADAD00DEBDAD00EFCE
                AD00F7D6AD00FFDEAD00398CB500428CB500BDA5B500BDADB500D6B5B500DEB5
                B500C6BDB500DEBDB500E7CEB500F7D6B500FFE7B500FFEFB5005294BD00529C
                BD00B5A5BD00BDB5BD00DEBDBD00F7E7BD00F7EFBD00FFEFBD00FFF7BD00CEC6
                C600F7E7C600FFF7C600FFFFC60084B5CE00EFDECE00F7E7CE00FFFFCE008CBD
                D600ADC6D600DED6D600F7E7D600FFFFD6005ABDDE00ADD6DE00F7E7DE00F7EF
                DE00FFFFDE0073C6E700A5DEE700BDDEE700FFFFE700A5E7EF00FFFFEF009CCE
                F700D6EFF700DEEFF700DEF7F700FF00FF008CC6FF008CCEFF0094CEFF0094DE
                FF0094E7FF0094EFFF00DEFFFF00E7FFFF00EFFFFF00F7FFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00652E11090002
                070C122665656565656565281D1F1D130D090200040B1016656565281D202C22
                211F1D150E0A050006106528221D313E332C2C2321201D1D0F07652832311D45
                4B473E3E332C231D1D036528454B3C2A5555504C4B471F201D0265284A55502B
                3B5E5A5A552A2B2C1D0265284F5A4A2A1D4458592A304B471D0265284E301D53
                6349371D273050501D0265281D4370706F6E6D6C642E30551D0365381B407070
                706F6E6E6D621C3B1D0865653735635D514D353424181A1D1D12656565251941
                565B67686866421D1765656565653A1D5F6B696961361529656565656565653A
                1D575C521D143A6565656565656565653A2F2F383A6565656565}
            end
            object btEmailMDFeEvento: TBitBtn
              Left = 17
              Top = 110
              Width = 282
              Height = 25
              Hint = 'Enviar email de Envento do MDF-e - [MDFE015]'
              Caption = 'E&nviar email de Envento do MDF-e'
              TabOrder = 3
              OnClick = btEmailMDFeEventoClick
              OnKeyDown = BitBtn81KeyDown
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000C30E0000C30E000000010000000100005A423900634A
                3900634A420063524A006B524A0073524A006B5A4A006B5A5200735A52007B5A
                5200845A52007B6B6300846B6B009C736B00A5737300A57B730094847B00AD84
                84009C8C8400BD8C8C00B5948C00C6949400AD9C9400BD9C940042739C004A7B
                9C0073849C009C8C9C00B59C9C00CE9C9C00D69C9C00D6A59C00DEAD9C00EFB5
                9C00EFC69C00F7C69C00297BA500317BA500B5A5A500C6A5A500CEA5A500C6AD
                A500D6ADA500DEB5A500FFD6A500FFDEA500CEADAD00D6ADAD00DEBDAD00EFCE
                AD00F7D6AD00FFDEAD00398CB500428CB500BDA5B500BDADB500D6B5B500DEB5
                B500C6BDB500DEBDB500E7CEB500F7D6B500FFE7B500FFEFB5005294BD00529C
                BD00B5A5BD00BDB5BD00DEBDBD00F7E7BD00F7EFBD00FFEFBD00FFF7BD00CEC6
                C600F7E7C600FFF7C600FFFFC60084B5CE00EFDECE00F7E7CE00FFFFCE008CBD
                D600ADC6D600DED6D600F7E7D600FFFFD6005ABDDE00ADD6DE00F7E7DE00F7EF
                DE00FFFFDE0073C6E700A5DEE700BDDEE700FFFFE700A5E7EF00FFFFEF009CCE
                F700D6EFF700DEEFF700DEF7F700FF00FF008CC6FF008CCEFF0094CEFF0094DE
                FF0094E7FF0094EFFF00DEFFFF00E7FFFF00EFFFFF00F7FFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00652E11090002
                070C122665656565656565281D1F1D130D090200040B1016656565281D202C22
                211F1D150E0A050006106528221D313E332C2C2321201D1D0F07652832311D45
                4B473E3E332C231D1D036528454B3C2A5555504C4B471F201D0265284A55502B
                3B5E5A5A552A2B2C1D0265284F5A4A2A1D4458592A304B471D0265284E301D53
                6349371D273050501D0265281D4370706F6E6D6C642E30551D0365381B407070
                706F6E6E6D621C3B1D0865653735635D514D353424181A1D1D12656565251941
                565B67686866421D1765656565653A1D5F6B696961361529656565656565653A
                1D575C521D143A6565656565656565653A2F2F383A6565656565}
            end
            object CheckBox2: TCheckBox
              Left = 17
              Top = 141
              Width = 280
              Height = 17
              Caption = 'Envio  de email em lote'
              TabOrder = 5
              OnClick = CheckBox2Click
              OnKeyDown = BitBtn81KeyDown
            end
          end
        end
        object tsSelecionaEstado: TTabSheet
          Caption = 'tsSelecionaEstado'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnSelecionaEstado: TPanel
            Left = 32
            Top = 32
            Width = 569
            Height = 177
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            OnEnter = pnSelecionaEstadoEnter
            object Panel10: TPanel
              Left = 6
              Top = 6
              Width = 553
              Height = 120
              Align = alClient
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object ListBox1: TListBox
                Left = 0
                Top = 0
                Width = 549
                Height = 96
                Align = alClient
                ItemHeight = 13
                Items.Strings = (
                  'MG - '
                  'SP')
                TabOrder = 0
                OnDblClick = ListBox1DblClick
              end
              object Panel12: TPanel
                Left = 0
                Top = 96
                Width = 549
                Height = 20
                Align = alBottom
                Alignment = taLeftJustify
                BevelOuter = bvNone
                BorderWidth = 4
                Caption = 'Duplo clique acima para selecionar ou pressione o bot'#227'o abaixo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
            object Panel11: TPanel
              Left = 6
              Top = 126
              Width = 553
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn10: TBitBtn
                Left = 197
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Selecionar'
                TabOrder = 0
                OnClick = BitBtn10Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                  B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                  DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                  4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                  E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                  6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                  4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
              end
              object BitBtn11: TBitBtn
                Left = 278
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn11Click
                Glyph.Data = {
                  E6010000424DE60100000000000036000000280000000C0000000C0000000100
                  180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
                  9696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
                  ED0000C50000B69191BAFFFFFFFFFFFFFFFFFFFFFFFF7F7FC500009100008FA2
                  A2C64848EC0000DD0000D50000BC9292BBFFFFFFFFFFFF7A7AC80000A30000A7
                  0000938F8FC9FFFFFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
                  B40000A67D7DCBFFFFFFFFFFFFFFFFFF3838EF0000E60101E40000D40000C401
                  01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
                  0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DE10F0F
                  ED0C0CEC0303EC0000E28E8EC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484DD39
                  39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFFFFFFFFFFFFFFF8787DD
                  4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFF8A8A
                  DD4D4DDE7373E46868E48E8EE4FFFFFFFFFFFF7B7BEB6C6CF06F6FF73D3DEAA6
                  A6CE8787E36262DD6767E09191E3FFFFFFFFFFFFFFFFFFFFFFFF8080E96D6DEF
                  5555F2A4A4E9FFFFFF8F8FE49393E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF7D7DE9A4A4EDFFFFFF}
              end
            end
          end
        end
        object tsUnidTr_Carga: TTabSheet
          Caption = 'tsUnidTr_Carga'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnDadosAdicionaisNFe: TPanel
            Left = 2
            Top = 16
            Width = 737
            Height = 474
            BevelOuter = bvLowered
            TabOrder = 0
            OnEnter = pnDadosAdicionaisNFeEnter
            object Label29: TLabel
              Left = 16
              Top = 24
              Width = 69
              Height = 13
              Caption = 'Seg Cod Barra'
              FocusControl = DBEdit18
            end
            object Label36: TLabel
              Left = 328
              Top = 24
              Width = 51
              Height = 13
              Caption = 'Reentrega'
              FocusControl = DBEdit18
            end
            object DBEdit18: TDBEdit
              Left = 91
              Top = 21
              Width = 150
              Height = 21
              DataField = 'SEGCODBARRA'
              DataSource = dtmMDFe.dsMDFeDesNFe
              Enabled = False
              MaxLength = 36
              TabOrder = 0
              OnKeyPress = DBEdit18KeyPress
            end
            object GroupBox7: TGroupBox
              Left = 16
              Top = 48
              Width = 705
              Height = 409
              Caption = 'Unidades de Transporte (Carreta/Reboque/Vag'#227'o)'
              TabOrder = 2
              object Panel15: TPanel
                Left = 2
                Top = 15
                Width = 701
                Height = 392
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                object GroupBox8: TGroupBox
                  Left = 6
                  Top = 186
                  Width = 689
                  Height = 200
                  Align = alClient
                  Caption = 'Unidades de Carga (Containeres/ULD/Outros)'
                  TabOrder = 1
                  object Panel18: TPanel
                    Left = 2
                    Top = 15
                    Width = 685
                    Height = 180
                    Align = alTop
                    BevelOuter = bvNone
                    BorderWidth = 4
                    TabOrder = 0
                    object DBGrid7: TDBGrid
                      Left = 4
                      Top = 4
                      Width = 590
                      Height = 172
                      Align = alClient
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                    end
                    object Panel20: TPanel
                      Left = 594
                      Top = 4
                      Width = 87
                      Height = 172
                      Align = alRight
                      BevelOuter = bvNone
                      Padding.Left = 8
                      Padding.Right = 4
                      TabOrder = 1
                      object SpeedButton32: TSpeedButton
                        Left = 8
                        Top = 0
                        Width = 75
                        Height = 25
                        Align = alTop
                        Caption = 'Adicionar'
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
                        OnClick = SpeedButton32Click
                        ExplicitLeft = 6
                        ExplicitTop = -21
                        ExplicitWidth = 73
                      end
                      object SpeedButton33: TSpeedButton
                        Left = 8
                        Top = 25
                        Width = 75
                        Height = 25
                        Align = alTop
                        Caption = 'Alterar'
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000320B0000320B0000000100000001000000000000CE63
                          00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
                          A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
                          C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
                          1818181818181818181818010101010101010101010101010101180119191716
                          1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
                          17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
                          1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
                          191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
                          19191919091505020C0118011919191919191919190700140001180101010101
                          0101010101041414030118180101010101010101010108080618181818181818
                          1818181818181818181818181818181818181818181818181818}
                        OnClick = SpeedButton33Click
                        ExplicitLeft = 4
                        ExplicitTop = 4
                        ExplicitWidth = 73
                      end
                      object SpeedButton34: TSpeedButton
                        Left = 8
                        Top = 50
                        Width = 75
                        Height = 25
                        Align = alTop
                        Caption = 'Remover'
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
                        OnClick = SpeedButton34Click
                        ExplicitLeft = 6
                        ExplicitTop = 100
                        ExplicitWidth = 73
                      end
                    end
                  end
                end
                object Panel16: TPanel
                  Left = 6
                  Top = 6
                  Width = 689
                  Height = 180
                  Align = alTop
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object DBGrid6: TDBGrid
                    Left = 6
                    Top = 6
                    Width = 590
                    Height = 168
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                  object Panel17: TPanel
                    Left = 596
                    Top = 6
                    Width = 87
                    Height = 168
                    Align = alRight
                    BevelOuter = bvNone
                    Padding.Left = 8
                    Padding.Right = 4
                    TabOrder = 1
                    object SpeedButton27: TSpeedButton
                      Left = 8
                      Top = 0
                      Width = 75
                      Height = 25
                      Align = alTop
                      Caption = 'Adicionar'
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
                      OnClick = SpeedButton27Click
                      ExplicitLeft = 6
                      ExplicitTop = -6
                    end
                    object SpeedButton28: TSpeedButton
                      Left = 8
                      Top = 25
                      Width = 75
                      Height = 25
                      Align = alTop
                      Caption = 'Alterar'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000320B0000320B0000000100000001000000000000CE63
                        00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
                        A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
                        C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
                        1818181818181818181818010101010101010101010101010101180119191716
                        1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
                        17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
                        1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
                        191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
                        19191919091505020C0118011919191919191919190700140001180101010101
                        0101010101041414030118180101010101010101010108080618181818181818
                        1818181818181818181818181818181818181818181818181818}
                      OnClick = SpeedButton28Click
                      ExplicitLeft = 4
                      ExplicitTop = 4
                      ExplicitWidth = 73
                    end
                    object SpeedButton29: TSpeedButton
                      Left = 8
                      Top = 50
                      Width = 75
                      Height = 25
                      Align = alTop
                      Caption = 'Remover'
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
                      OnClick = SpeedButton29Click
                      ExplicitLeft = 6
                      ExplicitTop = 100
                      ExplicitWidth = 73
                    end
                  end
                end
              end
            end
            object DBLookupComboBox7: TDBLookupComboBox
              Left = 385
              Top = 21
              Width = 145
              Height = 21
              DataField = 'INDREENTREGA'
              DataSource = dtmMDFe.dsMDFeDesNFe
              TabOrder = 1
            end
            object BitBtn16: TBitBtn
              Left = 628
              Top = 17
              Width = 75
              Height = 25
              Caption = 'Voltar'
              ModalResult = 2
              TabOrder = 3
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                2828281F05002828282828282828282828282817050713282828282828282828
                2828282817060715282828282828282828282828281507062328280004040404
                040404232828000701282802090807070707061B28282706062328040B090711
                2727272828282800071328060D070A07232828282828281C070128070E13020B
                082028282828281C0701280F101D28020D0818282828280107132816191E2828
                140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                282827140808041B282828282828282828282828282828282828282828282828
                2828282828282828282828282828282828282828282828282828}
            end
          end
          object pnUnidTr_Carga: TPanel
            Left = 729
            Top = 23
            Width = 579
            Height = 448
            TabOrder = 1
            object pnUnidTransp: TPanel
              Left = 8
              Top = 7
              Width = 529
              Height = 207
              BevelOuter = bvLowered
              BorderWidth = 6
              TabOrder = 0
              OnEnter = pnUnidTranspEnter
              object Label30: TLabel
                Left = 54
                Top = 23
                Width = 148
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo da Unidade de Transporte'
              end
              object Label31: TLabel
                Left = 12
                Top = 50
                Width = 190
                Height = 13
                Alignment = taRightJustify
                Caption = 'Identifica'#231#227'o da Unidade de Transporte'
              end
              object SpeedButton30: TSpeedButton
                Left = 367
                Top = 103
                Width = 27
                Height = 23
                Flat = True
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000130B0000130B000000010000000100000021A5006B84
                  C6000029E700526BF700638CF7009494F700FF00FF009CB5FF009CBDFF00B5C6
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606060100000000
                  0000000000000000010606000502020202020202020202020006060009080807
                  0707040404040303000606010000000000000000000000000106060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606}
                OnClick = SpeedButton30Click
              end
              object SpeedButton31: TSpeedButton
                Left = 367
                Top = 74
                Width = 27
                Height = 23
                Flat = True
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000130B0000130B000000010000000100002184290039B5
                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                  0505050505050505050505050505050503000003050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050300000000
                  0004010000000000030505020101010101010101010101010005050204040404
                  0404010404040404000505030202020202040100000000000305050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0302020305050505050505050505050505050505050505050505}
                OnClick = SpeedButton31Click
              end
              object Label32: TLabel
                Left = 30
                Top = 135
                Width = 172
                Height = 13
                Alignment = taRightJustify
                Caption = 'Quantidade rateada (Peso,Volume) '
              end
              object DBLookupComboBox5: TDBLookupComboBox
                Left = 208
                Top = 20
                Width = 186
                Height = 21
                TabOrder = 0
              end
              object DBEdit19: TDBEdit
                Left = 208
                Top = 47
                Width = 153
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
                OnKeyPress = DBEdit19KeyPress
              end
              object ListBox2: TListBox
                Left = 208
                Top = 74
                Width = 153
                Height = 52
                ItemHeight = 13
                TabOrder = 2
                OnDblClick = ListBox2DblClick
              end
              object DBEdit20: TDBEdit
                Left = 208
                Top = 132
                Width = 153
                Height = 21
                TabOrder = 3
              end
              object Panel19: TPanel
                Left = 7
                Top = 159
                Width = 515
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 4
                object BitBtn12: TBitBtn
                  Left = 259
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Cancela'
                  ModalResult = 2
                  TabOrder = 1
                  OnClick = BitBtn12Click
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
                object BitBtn13: TBitBtn
                  Left = 178
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = 'S&alvar'
                  TabOrder = 0
                  OnClick = BitBtn13Click
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
              end
            end
            object pnUnidCarga: TPanel
              Left = 20
              Top = 225
              Width = 529
              Height = 207
              BevelOuter = bvLowered
              BorderWidth = 6
              TabOrder = 1
              OnEnter = pnUnidCargaEnter
              object Label33: TLabel
                Left = 54
                Top = 23
                Width = 148
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo da Unidade de Transporte'
              end
              object Label34: TLabel
                Left = 12
                Top = 50
                Width = 190
                Height = 13
                Alignment = taRightJustify
                Caption = 'Identifica'#231#227'o da Unidade de Transporte'
              end
              object SpeedButton35: TSpeedButton
                Left = 367
                Top = 103
                Width = 27
                Height = 23
                Flat = True
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000130B0000130B000000010000000100000021A5006B84
                  C6000029E700526BF700638CF7009494F700FF00FF009CB5FF009CBDFF00B5C6
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606060100000000
                  0000000000000000010606000502020202020202020202020006060009080807
                  0707040404040303000606010000000000000000000000000106060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606}
                OnClick = SpeedButton35Click
              end
              object SpeedButton36: TSpeedButton
                Left = 367
                Top = 74
                Width = 27
                Height = 23
                Flat = True
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000130B0000130B000000010000000100002184290039B5
                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                  0505050505050505050505050505050503000003050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050300000000
                  0004010000000000030505020101010101010101010101010005050204040404
                  0404010404040404000505030202020202040100000000000305050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0302020305050505050505050505050505050505050505050505}
                OnClick = SpeedButton36Click
              end
              object Label35: TLabel
                Left = 30
                Top = 135
                Width = 172
                Height = 13
                Alignment = taRightJustify
                Caption = 'Quantidade rateada (Peso,Volume) '
              end
              object DBLookupComboBox6: TDBLookupComboBox
                Left = 208
                Top = 20
                Width = 186
                Height = 21
                TabOrder = 0
              end
              object DBEdit21: TDBEdit
                Left = 208
                Top = 47
                Width = 153
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
                OnKeyPress = DBEdit19KeyPress
              end
              object ListBox3: TListBox
                Left = 208
                Top = 74
                Width = 153
                Height = 52
                ItemHeight = 13
                TabOrder = 2
                OnDblClick = ListBox3DblClick
              end
              object DBEdit22: TDBEdit
                Left = 208
                Top = 132
                Width = 153
                Height = 21
                TabOrder = 3
              end
              object Panel22: TPanel
                Left = 7
                Top = 159
                Width = 515
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 4
                object BitBtn14: TBitBtn
                  Left = 259
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Cancela'
                  ModalResult = 2
                  TabOrder = 1
                  OnClick = BitBtn12Click
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
                object BitBtn15: TBitBtn
                  Left = 178
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = 'S&alvar'
                  TabOrder = 0
                  OnClick = BitBtn15Click
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
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 802
      Top = 0
      Height = 593
      ExplicitLeft = 802
      ExplicitTop = 0
      ExplicitHeight = 593
      inherited bMarketingHW: TBitBtn
        Top = 571
        ExplicitTop = 571
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 593
    ExplicitTop = 593
  end
  inherited pnStatusProcessamento: TPanel
    Top = 504
    ExplicitTop = 504
  end
  inherited PopupMenu1: TPopupMenu
    Left = 636
    Top = 17
  end
end
