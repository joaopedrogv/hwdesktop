inherited frmArquivosBoleto: TfrmArquivosBoleto
  Caption = 'Arquivos Remessa / Retorno'
  ExplicitWidth = 814
  ExplicitHeight = 603
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
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'Dados Remessa / Retorno'
                  TabOrder = 0
                  object Panel4: TPanel
                    Left = 2
                    Top = 15
                    Width = 771
                    Height = 121
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 56
                      Top = 10
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo:'
                    end
                    object Label7: TLabel
                      Left = 342
                      Top = 10
                      Width = 27
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data:'
                    end
                    object Label8: TLabel
                      Left = 31
                      Top = 39
                      Width = 49
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Conv'#234'nio:'
                    end
                    object Label9: TLabel
                      Left = 39
                      Top = 96
                      Width = 41
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Arquivo:'
                    end
                    object Label11: TLabel
                      Left = 47
                      Top = 67
                      Width = 33
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Banco:'
                    end
                    object Label12: TLabel
                      Left = 159
                      Top = 67
                      Width = 63
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cod agencia:'
                    end
                    object Label13: TLabel
                      Left = 306
                      Top = 67
                      Width = 63
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cod agencia:'
                    end
                    object DBEdit1: TDBEdit
                      Left = 86
                      Top = 7
                      Width = 121
                      Height = 21
                      DataField = 'TIPO'
                      DataSource = DtmBoletos.dsArquivosBoleto
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 375
                      Top = 7
                      Width = 121
                      Height = 21
                      DataField = 'DATA_HORA'
                      DataSource = DtmBoletos.dsArquivosBoleto
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 86
                      Top = 36
                      Width = 51
                      Height = 21
                      DataField = 'COD_COBREBEM'
                      DataSource = DtmBoletos.dsArquivosBoleto
                      TabOrder = 2
                    end
                    object DBEdit4: TDBEdit
                      Left = 143
                      Top = 36
                      Width = 353
                      Height = 21
                      DataField = 'DESCRICAO'
                      DataSource = DtmBoletos.dsArquivosBoleto
                      TabOrder = 3
                    end
                    object DBEdit5: TDBEdit
                      Left = 86
                      Top = 92
                      Width = 410
                      Height = 21
                      DataField = 'DESCRICAO_ARQ'
                      DataSource = DtmBoletos.dsArquivosBoleto
                      TabOrder = 7
                    end
                    object DBEdit6: TDBEdit
                      Left = 86
                      Top = 64
                      Width = 51
                      Height = 21
                      DataField = 'BANCO'
                      DataSource = DtmBoletos.dsArquivosBoleto
                      TabOrder = 4
                    end
                    object DBEdit7: TDBEdit
                      Left = 228
                      Top = 64
                      Width = 51
                      Height = 21
                      DataField = 'CODIGOAGENCIA'
                      DataSource = DtmBoletos.dsArquivosBoleto
                      TabOrder = 5
                    end
                    object DBEdit8: TDBEdit
                      Left = 375
                      Top = 64
                      Width = 121
                      Height = 21
                      DataField = 'CODIGOCEDENTE'
                      DataSource = DtmBoletos.dsArquivosBoleto
                      TabOrder = 6
                    end
                  end
                  object Panel5: TPanel
                    Left = 2
                    Top = 136
                    Width = 771
                    Height = 293
                    Align = alClient
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Panel6: TPanel
                      Left = 86
                      Top = 0
                      Width = 685
                      Height = 293
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      object DBMemo1: TDBMemo
                        Left = 0
                        Top = 0
                        Width = 656
                        Height = 293
                        Align = alClient
                        DataField = 'DOC'
                        DataSource = DtmBoletos.dsArquivosBoleto
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Lucida Console'
                        Font.Style = []
                        ParentFont = False
                        ScrollBars = ssBoth
                        TabOrder = 0
                      end
                      object Panel7: TPanel
                        Left = 656
                        Top = 0
                        Width = 29
                        Height = 293
                        Align = alRight
                        BevelOuter = bvNone
                        TabOrder = 1
                        object bnExportarArquivo: TSpeedButton
                          Left = 3
                          Top = 4
                          Width = 23
                          Height = 22
                          Hint = 'Exportar arquivo'
                          Flat = True
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
                          OnClick = bnExportarArquivoClick
                        end
                      end
                    end
                    object Panel8: TPanel
                      Left = 0
                      Top = 0
                      Width = 86
                      Height = 293
                      Align = alLeft
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label10: TLabel
                        Left = 48
                        Top = 6
                        Width = 32
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Texto:'
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited LabelSeq: TLabel
                Enabled = False
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Enabled = False
                Visible = False
              end
              inherited BitBtn5: TBitBtn
                Enabled = False
                Visible = False
              end
              inherited CheckCadSeq: TCheckBox
                Enabled = False
                Visible = False
              end
              object btVoltar: TBitBtn
                Left = 488
                Top = 13
                Width = 75
                Height = 25
                Hint = 'Voltar a tela anterior'
                Caption = '&Voltar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = btVoltarClick
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
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [COB012]'
            end
            inherited BitBtn3: TBitBtn
              Visible = False
            end
            inherited CheckBox3: TCheckBox
              Left = 470
              Top = 47
              Enabled = False
              Visible = False
              ExplicitLeft = 470
              ExplicitTop = 47
            end
            inherited CheckBox1: TCheckBox
              Left = 565
              Top = 47
              Enabled = False
              Visible = False
              ExplicitLeft = 565
              ExplicitTop = 47
            end
            object ckbRetorno: TCheckBox
              Left = 368
              Top = 48
              Width = 88
              Height = 17
              Hint = 'Retorno'
              Caption = 'Retorno [ F7 ]'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
            end
            object ckbRemessa: TCheckBox
              Left = 257
              Top = 48
              Width = 111
              Height = 17
              Hint = 'Remessa'
              Caption = 'Remessa [ F6 ]'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 12
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Left = 236
                Enabled = False
                Visible = False
                ExplicitLeft = 236
              end
              inherited SpeedButton2: TSpeedButton
                Left = 292
                Visible = False
                ExplicitLeft = 292
              end
              inherited SpeedButton3: TSpeedButton
                Left = 349
                Visible = False
                ExplicitLeft = 349
              end
              inherited SpeedButton4: TSpeedButton
                Left = 407
                Visible = False
                ExplicitLeft = 407
              end
              inherited SpeedButton5: TSpeedButton
                Left = 464
                Visible = False
                ExplicitLeft = 464
              end
              inherited SpeedButton6: TSpeedButton
                Left = 64
                Enabled = False
                Visible = False
                ExplicitLeft = 64
              end
              inherited SpeedButton7: TSpeedButton
                Left = 179
                Enabled = False
                Visible = False
                ExplicitLeft = 179
              end
              inherited SpeedButton8: TSpeedButton
                Left = 122
                Enabled = False
                Visible = False
                ExplicitLeft = 122
              end
              inherited SpeedButton11: TSpeedButton
                Left = 7
                Hint = 'Visualizar arquivo'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FF71BAE9
                  66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7
                  EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA70BAE9FF
                  00FFFF00FF65B6E966B7EA65B6E965B6E965B6E966B7EA65B6E965B6E966B7EA
                  65B6E966B7EA65B6E965B6E965B6E966B7EA65B6E965B6E966B7EA66B7EA65B6
                  E965B6E966B7EAFF00FFFF00FF65B6E966B7EA65B6E965B6E965B6E966B7EA65
                  B6E965B6E966B7EA65B6E966B7EA65B6E965B6E965B6E966B7EA65B6E965B6E9
                  66B7EA66B7EA65B6E965B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFDFE
                  FEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFF
                  FFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA66B7EA66B7EAFF00FFFF00FF65B6E9
                  66B7EA66B7EAFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFE
                  FEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF66B7EA66B7EA66B7EAFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF
                  FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7
                  EA66B7EA66B7EAFF00FFFF00FF65B6E966B7EA66B7EAFDFEFEFEFEFEB8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFE
                  FEFDFDFDFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFF
                  FFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFDFDFDB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF66B7EA66B7EA66B7EAFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF
                  FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7
                  EA66B7EA66B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFEFEFDFDFDB8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFFFF
                  FFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFF
                  FFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA66B7EA66B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFDFDFDB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF65B6E866B7EA66B7EAFDFEFEFDFDFDFFFFFFFEFEFEFEFEFEFFFFFF
                  FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7
                  EA65B6E966B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFEFEFDFDFDB8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFFFF
                  FFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFF
                  FFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA66B7EA66B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFDFDFDB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF65B6E866B7EA66B7EAFDFEFEFDFDFDFFFFFFFEFEFEFEFEFEFFFFFF
                  FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7
                  EA65B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF66B7EA66B7EA66B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFE
                  FEFDFDFDC4C4C4ACACACACACACACACACACACACACACACACACACACACACACACACAC
                  ACACACACACC1C1C1FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFDFDFDA3A3A37777777777777878787777777878787777
                  777777777777777878787777779D9D9DFFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF66B7E966B7EA66B7EA67B7E96FB9E8B0CBDCB4BDC3909394797979
                  7878787878787878787878787878788F9191B5BCC1B9CCD971BAE867B7E966B7
                  EA66B7EA66B7EAFF00FFFF00FFADCFE466B7EA66B7EA66B7EA66B7EA6AB8E8A7
                  CAE0FF00FFADAEAF777777FF00FFFF00FF777777A9AAAAFF00FFAECBDE6BB8E8
                  66B7EA66B7EA66B7EA66B7EAAECFE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFC5C7C9777777787878777777777777C2C4C5FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton11Click
                ExplicitLeft = 7
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
                Left = 406
                Visible = False
                ExplicitLeft = 406
              end
              inherited SpeedButton26: TSpeedButton
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
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
