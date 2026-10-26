inherited frmCadMensMob: TfrmCadMensMob
  Caption = 'Mensagens'
  Scaled = False
  ExplicitWidth = 806
  ExplicitHeight = 595
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
                  Caption = 'Mensagens'
                  TabOrder = 0
                  OnEnter = GroupBox4Enter
                  object pnCodigo: TPanel
                    Left = 2
                    Top = 15
                    Width = 771
                    Height = 98
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 135
                      Top = 19
                      Width = 37
                      Height = 13
                      Caption = 'Codigo:'
                      FocusControl = DBEdit1
                    end
                    object Label9: TLabel
                      Left = 89
                      Top = 73
                      Width = 83
                      Height = 13
                      Caption = 'Data/Hora Envio:'
                      FocusControl = DBEdit2
                    end
                    object Label11: TLabel
                      Left = 102
                      Top = 46
                      Width = 70
                      Height = 13
                      Caption = 'Usu'#225'rio/Envio:'
                      FocusControl = DBEdit7
                    end
                    object DBEdit1: TDBEdit
                      Left = 178
                      Top = 16
                      Width = 54
                      Height = 21
                      DataField = 'IDSEQM'
                      DataSource = DataSource1
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 178
                      Top = 70
                      Width = 75
                      Height = 21
                      DataField = 'DATA_ENVIO'
                      DataSource = DataSource1
                      Enabled = False
                      TabOrder = 1
                    end
                    object DBEdit4: TDBEdit
                      Left = 259
                      Top = 70
                      Width = 75
                      Height = 21
                      DataField = 'HORA_ENVIO'
                      DataSource = DataSource1
                      Enabled = False
                      TabOrder = 2
                    end
                    object DBEdit7: TDBEdit
                      Left = 178
                      Top = 43
                      Width = 54
                      Height = 21
                      DataField = 'US_ENVIO'
                      DataSource = dtmMobile.dsMensMobile
                      Enabled = False
                      TabOrder = 3
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 239
                      Top = 43
                      Width = 363
                      Height = 21
                      DataField = 'US_ENVIO'
                      DataSource = dtmMobile.dsMensMobile
                      Enabled = False
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = dtmMobile.dsUsuarioMensMobile
                      TabOrder = 4
                    end
                  end
                  object pnMensagem: TPanel
                    Left = 2
                    Top = 113
                    Width = 771
                    Height = 120
                    Align = alClient
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Panel5: TPanel
                      Left = 0
                      Top = 0
                      Width = 179
                      Height = 120
                      Align = alLeft
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label10: TLabel
                        Left = 117
                        Top = 6
                        Width = 55
                        Height = 13
                        Caption = 'Mensagem:'
                      end
                    end
                    object Panel7: TPanel
                      Left = 179
                      Top = 0
                      Width = 592
                      Height = 120
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 1
                      object DBMemo1: TDBMemo
                        Left = 0
                        Top = 0
                        Width = 592
                        Height = 120
                        Align = alClient
                        DataField = 'HTML'
                        DataSource = dtmMobile.dsMensMobile
                        TabOrder = 0
                      end
                    end
                  end
                  object pnMobileUsuario: TPanel
                    Left = 2
                    Top = 233
                    Width = 771
                    Height = 196
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 2
                    object Panel6: TPanel
                      Left = 0
                      Top = 0
                      Width = 179
                      Height = 196
                      Align = alLeft
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label7: TLabel
                        Left = 113
                        Top = 14
                        Width = 59
                        Height = 13
                        Caption = 'Enviar para:'
                      end
                    end
                    object Panel8: TPanel
                      Left = 179
                      Top = 0
                      Width = 592
                      Height = 196
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Panel9: TPanel
                        Left = 532
                        Top = 0
                        Width = 60
                        Height = 196
                        Align = alRight
                        BevelOuter = bvNone
                        TabOrder = 0
                        object btSelectAll: TSpeedButton
                          Left = 5
                          Top = 24
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
                          Left = 34
                          Top = 24
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
                      end
                      object PageControl2: TPageControl
                        Left = 0
                        Top = 0
                        Width = 532
                        Height = 196
                        ActivePage = TabSheetSenhas
                        Align = alClient
                        TabOrder = 1
                        object TabSheetMobile: TTabSheet
                          Caption = '<< Mobile >>'
                          object DBGrid2: TDBGrid
                            Left = 0
                            Top = 0
                            Width = 524
                            Height = 168
                            Align = alClient
                            DataSource = dtmMobile.dsMobileCons
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            OnCellClick = DBGrid2CellClick
                            OnColEnter = DBGrid2ColEnter
                            OnDrawColumnCell = DBGrid2DrawColumnCell
                            OnKeyDown = DBGrid2KeyDown
                            Columns = <
                              item
                                Expanded = False
                                FieldName = 'SEL'
                                Width = 24
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'IDMOBILE'
                                Title.Caption = 'Codigo'
                                Width = 40
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'DESCRICAO_MOB'
                                Title.Caption = 'Mobile'
                                Width = 343
                                Visible = True
                              end>
                          end
                        end
                        object TabSheetSenhas: TTabSheet
                          Caption = '<<  Usu'#225'rios >>'
                          ImageIndex = 1
                          object DBGrid3: TDBGrid
                            Left = 0
                            Top = 0
                            Width = 524
                            Height = 168
                            Align = alClient
                            DataSource = dtmMobile.dsSenhasCons
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            OnCellClick = DBGrid3CellClick
                            OnColEnter = DBGrid3ColEnter
                            OnDrawColumnCell = DBGrid3DrawColumnCell
                            OnKeyDown = DBGrid3KeyDown
                            Columns = <
                              item
                                Expanded = False
                                FieldName = 'SEL'
                                Width = 24
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'CODIGO'
                                Width = 40
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'USUARIO'
                                Width = 200
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
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [MOB018]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
              object BitBtn7: TBitBtn
                Left = 474
                Top = 13
                Width = 75
                Height = 25
                Hint = 'Responder - [MOB018]'
                Caption = '&Responder'
                TabOrder = 4
                OnClick = BitBtn7Click
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  20000000000000040000C40E0000C40E00000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000273724FF324333FF425641FF1A2415FF202F1EFF2835
                  24FF384C38FF344935FF000100FF000000000000000000000000000000000000
                  0000121E10FF192617FF243522FF334535FF49604BFF58775EFF66856CFF6F91
                  75FF71947AFF8BB393FF2D3F2EFF000000000000000000000000000000001621
                  16FF5C795EFF84A68AFF87AA8DFF86A78DFF7D9F86FF72977EFF6E8C71FF6889
                  6DFF628166FF779A7CFF95C19BFF1A271CFF0000000000000000000000000F1B
                  10FF68926FFF91B696FF82A388FF79967DFF709178FF6B8C77FF6D8E73FF6C8E
                  71FF66886DFF6C8C73FF9ECBA6FF5F7F63FF0000000000000000000000000C17
                  10FF5B8361FF84A889FF789980FF6B8A70FF607E63FF567258FF506A51FF4D66
                  4DFF4C644BFF4F664EFF8EB693FF6F9175FF0000000000000000000000000C0D
                  00FF48684BFF5E795CFF5C7559FF5F755DFF657D64FF6F8970FF7E987FFF88A5
                  8BFF90B094FF8DAE95FF708A6DFF7A9A7FFF000500FF000000004E543AFF8895
                  84FFCCDDD0FFCBDDCFFFC9DECCFFC5DEC8FFC5E2CCFFBDDCC3FFABCAADFFA0C2
                  A5FFA3C5A9FFA4C6ADFF9BB89FFF617D61FF091208FF0000000040422AFFA3B3
                  A1FFEEFFFEFFB7C9BCFFB0C9BAFF9DBCAAFF87A192FF97A99CFFB3CCC3FF9FBA
                  B9FF3E5546FF5B7B5AFF9BBAA1FF8AA88EFF050900FF00000000000000002D2E
                  12FF52725BFF55785CFF859B9EFFBFDAE4FF91AFB8FF75848CFFCBD2DBFFFFFF
                  FFFF7A8D97FF2D4630FF648468FFA9CBB3FF46543EFF1A1B09FF000000000000
                  0000475C42FF64785AFF65866FFFC6D3DEFFDBEFF3FF9ABBC1FFA7ACADFFFFFF
                  FFFFFFFFFFFF4F6461FF4D6F4DFF84A98AFF628368FF223021FF000000000000
                  000000000000000000005C8662FF607A6BFFF9FBFFFFE1EEF2FFA6ADB1FFF5F4
                  F2FFFFFFFFFFE2E6EDFF24372DFF719575FF4A644EFF0D180EFF000000000000
                  000000000000273117FF415B40FF2D492DFF7D8B86FFFFFFFFFFBBC1C1FFCED3
                  D5FFFEFFFFFFFFFFFFFF8C979EFF82A184FF304232FF020903FF000000000000
                  000000000000465F43FFC7DAD1FFE0EFE4FFA1BAACFFCED5DAFFFFFFFEFFFFFC
                  F9FFFFFFFFFFB2C1C3FF638777FF6B9570FF0F1A10FF030803FF000000000000
                  00000000000000000000A0AD9CFFA0AD9CFFA0AD9CFF4B5E55FFC2C6D2FF99A1
                  ACFF303F44FF1B331DFF0D130BFF010101FF0000000000000000000000000000
                  0000000000000000000052684DFF5C6D56FF596F50FF495B4FFF526472FF3946
                  53FF000000000000000000000000000000000000000000000000}
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
            Height = 195
            ExplicitHeight = 195
            inherited imgInformation: TImage
              Height = 178
              ExplicitHeight = 178
            end
            object SpeedButton9: TSpeedButton [6]
              Left = 604
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
              OnClick = SpeedButton9Click
            end
            object SpeedButton10: TSpeedButton [7]
              Left = 633
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
              OnClick = SpeedButton10Click
            end
            inherited MaskEdit3: TMaskEdit
              TabOrder = 4
            end
            inherited MaskEdit1: TMaskEdit
              TabOrder = 5
            end
            inherited MaskEdit2: TMaskEdit
              TabOrder = 6
            end
            inherited ComboBox1: TComboBox
              TabOrder = 2
            end
            inherited ComboBox2: TComboBox
              TabOrder = 3
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [MOB012]'
              TabOrder = 8
            end
            inherited BitBtn2: TBitBtn
              TabOrder = 12
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Enviar Mensagem - [MOB013]'
              TabOrder = 11
            end
            inherited CheckBox3: TCheckBox
              Left = 398
              Top = 47
              TabOrder = 9
              ExplicitLeft = 398
              ExplicitTop = 47
            end
            inherited CheckBox1: TCheckBox
              Left = 505
              Top = 47
              TabOrder = 13
              ExplicitLeft = 505
              ExplicitTop = 47
            end
            inherited ComboBox3: TComboBox
              TabOrder = 7
            end
            object pnMensagemNaoLidas: TPanel
              Left = 263
              Top = 49
              Width = 122
              Height = 13
              BevelOuter = bvNone
              Caption = 'Mensagens n'#227'o lidas'
              Color = 12320767
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 14
            end
            object CheckBox2: TCheckBox
              Left = 666
              Top = 47
              Width = 90
              Height = 17
              Hint = 'N'#227'o Lidas'
              Caption = 'N'#227'o Lidas (F9)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
            end
            object GroupBoxAvancado: TGroupBox
              Left = 3
              Top = 69
              Width = 343
              Height = 124
              Caption = 'Op'#231#245'es Avan'#231'adas'
              TabOrder = 0
              Visible = False
              object GroupBox5: TGroupBox
                Left = 2
                Top = 15
                Width = 88
                Height = 107
                Align = alClient
                Caption = 'Natureza'
                TabOrder = 0
                object ckMobile: TCheckBox
                  Left = 7
                  Top = 35
                  Width = 97
                  Height = 17
                  Caption = 'Mobile'
                  TabOrder = 0
                end
                object ckEcommerce: TCheckBox
                  Left = 7
                  Top = 53
                  Width = 97
                  Height = 17
                  Caption = 'E-Commerce'
                  TabOrder = 1
                end
                object ckFinanceiro: TCheckBox
                  Left = 7
                  Top = 71
                  Width = 97
                  Height = 17
                  Caption = 'Financeiro'
                  TabOrder = 2
                end
                object ckPagOnline: TCheckBox
                  Left = 7
                  Top = 89
                  Width = 97
                  Height = 17
                  Caption = 'Pag Online'
                  TabOrder = 3
                end
                object ckAplicativo: TCheckBox
                  Left = 7
                  Top = 17
                  Width = 97
                  Height = 17
                  Caption = 'Aplicativo'
                  TabOrder = 4
                end
              end
              object GroupBox6: TGroupBox
                Left = 90
                Top = 15
                Width = 145
                Height = 107
                Align = alRight
                Caption = 'Status Envio'
                TabOrder = 1
                object ckStatusNO: TCheckBox
                  Left = 6
                  Top = 17
                  Width = 107
                  Height = 17
                  Caption = 'NO - Cadastrada'
                  TabOrder = 0
                end
                object ckStatusEP: TCheckBox
                  Left = 7
                  Top = 35
                  Width = 130
                  Height = 17
                  Caption = 'EP - Em processamento'
                  TabOrder = 1
                end
                object ckStatusAC: TCheckBox
                  Left = 7
                  Top = 53
                  Width = 114
                  Height = 17
                  Caption = 'AC - Aceita envio'
                  TabOrder = 2
                end
                object ckStatusER: TCheckBox
                  Left = 7
                  Top = 71
                  Width = 97
                  Height = 17
                  Caption = 'ER - Erro'
                  TabOrder = 3
                end
                object ckStatusPP: TCheckBox
                  Left = 7
                  Top = 89
                  Width = 97
                  Height = 17
                  Caption = 'PP - Enviada'
                  TabOrder = 4
                end
              end
              object GroupBox7: TGroupBox
                Left = 235
                Top = 15
                Width = 106
                Height = 107
                Align = alRight
                TabOrder = 2
                object Label8: TLabel
                  Left = 3
                  Top = 7
                  Width = 34
                  Height = 13
                  Alignment = taCenter
                  Caption = 'Origem'
                end
                object Label12: TLabel
                  Left = 3
                  Top = 63
                  Width = 36
                  Height = 13
                  Alignment = taCenter
                  Caption = 'Destino'
                end
                object ckOrigemErp: TCheckBox
                  Left = 3
                  Top = 26
                  Width = 42
                  Height = 17
                  Caption = 'erp'
                  TabOrder = 0
                end
                object ckOrigemBot: TCheckBox
                  Left = 61
                  Top = 26
                  Width = 42
                  Height = 17
                  Caption = 'bot'
                  TabOrder = 1
                end
                object ckDestinoErp: TCheckBox
                  Left = 3
                  Top = 82
                  Width = 42
                  Height = 17
                  Caption = 'erp'
                  TabOrder = 2
                end
                object ckDestinoBot: TCheckBox
                  Left = 61
                  Top = 82
                  Width = 42
                  Height = 17
                  Caption = 'bot'
                  TabOrder = 3
                end
              end
            end
            object groupAdicional: TGroupBox
              Left = 348
              Top = 69
              Width = 403
              Height = 124
              Caption = 'Pesquisa Adicional'
              TabOrder = 1
              Visible = False
              object Label13: TLabel
                Left = 4
                Top = 66
                Width = 51
                Height = 13
                Caption = 'Conte'#250'do:'
              end
              object Label14: TLabel
                Left = 18
                Top = 40
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label19: TLabel
                Left = 154
                Top = 66
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label21: TLabel
                Left = 212
                Top = 40
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 61
                Top = 31
                Width = 145
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 61
                Top = 58
                Width = 187
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object MaskEdit8: TMaskEdit
                Left = 173
                Top = 58
                Width = 75
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 61
                Top = 58
                Width = 72
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 266
                Top = 31
                Width = 133
                Height = 21
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 4
                Text = 'Come'#231'a'
                OnEnter = ComboBox12Enter
                OnExit = ComboBox12Exit
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
            Top = 195
            Height = 315
            ExplicitTop = 195
            ExplicitHeight = 315
            inherited Splitter1: TSplitter
              Height = 254
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Height = 254
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Ler Mensagem - [MOB014]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [MOB015]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir- [ MOB020]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro- [MOB017]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Ler v'#225'rias mensagens - [MOB014]'
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
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Dados API Mensageria'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FCFCFCADA9A6
                  7C746F756F69756F69756F69756F69756F69756F69756F69756F69756F69756F
                  69756F69756F69756F69756F69756F69756F69756F69756F697C746FAEAAA6FC
                  FCFCADA8A56E6761C1BDBBC6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1
                  C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3
                  C1C1BDBB6D6761AEAAA67A746FC3BFBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFC2BFBC7A746F746D67C9C7C4FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C474
                  6D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFAF4FFD8A3FF
                  FFFFFFFFFFFFEDD4FFE3BFFFF2E0FFE0B7FFFFFFFFFFFFFFFFFFFFFFFFFFD8A4
                  FFF9F2FFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFF
                  FFFFFDF9FFC374FFE7C7FFEBD0FFD296FFE0B6FFE8CAFFD195FFFFFFFFFFFFFF
                  FFFFFFFFFFFFC67AFFF4E4FFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4
                  FFFFFFFFFFFFFFFFFFFFFFFFFFD092FFC87FFFCE8DFFC272FFEFD9FFE8CAFFC6
                  7AFFD399FFDFB5FFFCF8FFFFFFFFC67AFFF4E4FFFFFFFFFFFFFFFFFFC9C7C474
                  6D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFDFB5FFD8A5FFF7ECFFC374
                  FFFDF9FFE8CAFFCB86FFE6C5FFD194FFD49BFFFFFFFFC67AFFF4E4FFFFFFFFFF
                  FFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFEED9FF
                  C981FFE7C7FFD092FFFFFFFFE8CAFFD195FFFFFFFFFAF3FFC272FFFBF7FFC67A
                  FFF4E4FFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFDF9FFC374FFCF90FFDFB5FFFFFFFFE8CAFFD195FFFFFFFFEED7FF
                  C578FFFEFDFFC67AFFF4E4FFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD398FFC271FFF1DFFFFFFFFFE9CBFFC5
                  78FFCD8BFFC476FFE8CAFFFFFFFFC77CFFF4E6FFFFFFFFFFFFFFFFFFC9C7C474
                  6D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFF3E2FFFFFF
                  FFFFFFFFFCF8FFEBD1FFECD3FFF9F0FFFFFFFFFFFFFFF4E4FFFFFEFFFFFFFFFF
                  FFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C4746D67B1ADAAE8E6E5
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C474
                  6D67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFC9C7C4746D679E9894766F69766F69766F69766F69766F69766F6976
                  6F69766F69766F69766F69766F69766F69766F69766F69766F69766F69766F69
                  766F69766F6977706ADBDAD8C9C7C4746D67746D67A29E9AC6C3C1C6C3C1C6C3
                  C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6
                  C3C1C6C3C1C6C3C1C6C3C1C6C3C1C8C5C3F8F7F7C9C7C4746D67746D67C9C7C4
                  BBB8B4D9D7D5CDCBC9E4E3E2C3C0BEEFEEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C474
                  6D677A746FC3BFBDBBB8B4D9D7D5CDCBC9E4E3E2C3C0BEEFEEEDFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFC3BFBD7A746FADA8A56E6862C1BEBCC6C3C1C6C3C1C6C3C1C6C3C1C6
                  C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1
                  C6C3C1C6C3C1C6C3C1C1BEBC6E6761AEAAA6FCFCFCADA8A57C746F756F69756F
                  69756F69756F69756F69756F69756F69756F69756F69756F69756F69756F6975
                  6F69756F69756F69756F69756F69756F697C746FADA8A5FCFCFC}
                OnClick = SpeedButton8Click
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
                Left = 177
                Hint = 'Ver registros da lixeira- [MOB019]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 177
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 254
              ExplicitHeight = 254
              inherited ScrollBox2: TScrollBox
                Height = 237
                ExplicitHeight = 237
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
          object qrpMensMobile: TQuickRep
            Left = -2
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmMobile.cdsMensMobile
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
            OnPreview = qrpMensMobilePreview
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
                Width = 274
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
                  724.958333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cadastro de Mensagem Mobile'
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
                Left = 73
                Top = 6
                Width = 57
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  193.145833333333300000
                  15.875000000000000000
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
                Left = 160
                Top = 7
                Width = 51
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  423.333333333333300000
                  18.520833333333330000
                  134.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Mobile'
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
                Left = 320
                Top = 7
                Width = 84
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  846.666666666666600000
                  18.520833333333330000
                  222.250000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Mensagem'
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
                Left = 83
                Top = 0
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  219.604166666666700000
                  0.000000000000000000
                  124.354166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmMobile.cdsMensMobile
                DataField = 'IDSEQM'
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
                Left = 160
                Top = 0
                Width = 105
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  423.333333333333300000
                  0.000000000000000000
                  277.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmMobile.cdsMensMobile
                DataField = 'DESCRICAO_MOB'
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
                Left = 320
                Top = 3
                Width = 68
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  846.666666666666600000
                  7.937500000000000000
                  179.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmMobile.cdsMensMobile
                DataField = 'MENSAGEM'
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
        object TabSheet5: TTabSheet
          Caption = 'TabSheet5'
          ImageIndex = 4
          object pnDadosAPI: TPanel
            Left = 3
            Top = 3
            Width = 782
            Height = 504
            TabOrder = 0
            object Panel10: TPanel
              Left = 1
              Top = 462
              Width = 780
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object btnDadosAPI: TBitBtn
                Left = 657
                Top = 7
                Width = 75
                Height = 25
                Hint = 'Sair'
                Caption = '&Sair'
                TabOrder = 0
                OnClick = btnDadosAPIClick
                Glyph.Data = {
                  2E020000424D2E020000000000002E0100002800000010000000100000000100
                  08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                  FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                  EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                  E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                  BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                  AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                  D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                  FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                  FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                  0202020202020202020202020202020202020204040404040404040404040402
                  020202040132302E28272125242F04020202020401050F221B1614130B260402
                  0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                  02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                  020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                  0202020203040404040404043D383D0202020202020202020202023D353D393D
                  020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                  020202020202020202020202020202020202}
              end
            end
            object PageControl4: TPageControl
              Left = 1
              Top = 1
              Width = 780
              Height = 461
              ActivePage = TabSheet_Cad_Mensageria
              Align = alClient
              Style = tsFlatButtons
              TabOrder = 1
              OnChange = PageControl4Change
              object TabSheet_Cad_Mensageria: TTabSheet
                Caption = 'POST - Cad mensageria'
                object SplitterMensageriaPost: TSplitter
                  Left = 120
                  Top = 0
                  Height = 430
                  OnMoved = SplitterMensageriaPostMoved
                  ExplicitLeft = 89
                  ExplicitHeight = 1
                end
                object DBGridMensageriaPost: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 120
                  Height = 430
                  Align = alLeft
                  DataSource = dtmMobile.dsDocEletronicoMensMobile
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
                      FieldName = 'SEQID'
                      Visible = True
                    end>
                end
                object DBMemoMensageriaPost: TDBMemo
                  Left = 123
                  Top = 0
                  Width = 649
                  Height = 430
                  Align = alClient
                  DataField = 'DOC'
                  DataSource = dtmMobile.dsDocEletronicoMensMobile
                  ReadOnly = True
                  ScrollBars = ssBoth
                  TabOrder = 1
                end
              end
              object TabSheet_Ler_Mensageria: TTabSheet
                Caption = 'POST - Ler mensageria'
                ImageIndex = 1
                object SplitterMensageriaGet: TSplitter
                  Left = 120
                  Top = 0
                  Height = 430
                  OnMoved = SplitterMensageriaGetMoved
                  ExplicitLeft = 89
                  ExplicitHeight = 1
                end
                object DBGridMensageriaGet: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 120
                  Height = 430
                  Align = alLeft
                  DataSource = dtmMobile.dsDocEletronicoMensMobile
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
                      FieldName = 'SEQID'
                      Visible = True
                    end>
                end
                object DBMemoMensageriaGet: TDBMemo
                  Left = 123
                  Top = 0
                  Width = 649
                  Height = 430
                  Align = alClient
                  DataField = 'DOC'
                  DataSource = dtmMobile.dsDocEletronicoMensMobile
                  ReadOnly = True
                  ScrollBars = ssBoth
                  TabOrder = 1
                end
              end
              object TabSheet_Update_Mensageria: TTabSheet
                Caption = 'POST -  Update mensageria'
                ImageIndex = 2
                object SplitterMensageriaUpdate: TSplitter
                  Left = 120
                  Top = 0
                  Height = 430
                  OnMoved = SplitterMensageriaUpdateMoved
                  ExplicitLeft = 89
                  ExplicitHeight = 1
                end
                object DBGridMensageriaUpdate: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 120
                  Height = 430
                  Align = alLeft
                  DataSource = dtmMobile.dsDocEletronicoMensMobile
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
                      FieldName = 'SEQID'
                      Visible = True
                    end>
                end
                object DBMemoMensageriaUpdate: TDBMemo
                  Left = 123
                  Top = 0
                  Width = 649
                  Height = 430
                  Align = alClient
                  DataField = 'DOC'
                  DataSource = dtmMobile.dsDocEletronicoMensMobile
                  ReadOnly = True
                  ScrollBars = ssBoth
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 512
      Top = 439
      ExplicitLeft = 512
      ExplicitTop = 439
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 65532
    Top = 41
  end
  inherited PopupMenu2: TPopupMenu
    Left = 742
    Top = 19
  end
  inherited Timer1: TTimer
    Left = 702
    Top = 19
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 670
    Top = 19
  end
  object DataSource1: TDataSource
    DataSet = dtmMobile.cdsMensMobile
    Left = 632
    Top = 16
  end
end
