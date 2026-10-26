inherited frmCadNFC_Emissor: TfrmCadNFC_Emissor
  Caption = 'Emissores Nota Fiscal de Consumidor '
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        ActivePage = TabSheet1
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
                object scrollCadastro: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 775
                    Height = 297
                    Align = alTop
                    Caption = 'Cadastro'
                    TabOrder = 0
                    OnEnter = GroupBox4Enter
                    OnExit = GroupBox4Exit
                    object Label6: TLabel
                      Left = 144
                      Top = 32
                      Width = 33
                      Height = 13
                      Caption = 'Codigo'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 111
                      Top = 59
                      Width = 66
                      Height = 13
                      Caption = 'Nome Emissor'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 120
                      Top = 88
                      Width = 57
                      Height = 13
                      Caption = 'Serie NFC-e'
                      FocusControl = DBEdit3
                    end
                    object Label10: TLabel
                      Left = 462
                      Top = 113
                      Width = 61
                      Height = 13
                      Caption = 'Identificador'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 148
                      Top = 115
                      Width = 29
                      Height = 13
                      Caption = 'Token'
                      FocusControl = DBEdit6
                    end
                    object SpeedButton10: TSpeedButton
                      Left = 338
                      Top = 110
                      Width = 113
                      Height = 22
                      Caption = 'Definir Identificador'
                      OnClick = SpeedButton10Click
                    end
                    object Label9: TLabel
                      Left = 118
                      Top = 142
                      Width = 59
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo Emissor'
                    end
                    object Label13: TLabel
                      Left = 112
                      Top = 238
                      Width = 65
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Biblioteca SSL'
                    end
                    object Label14: TLabel
                      Left = 476
                      Top = 238
                      Width = 47
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'SSL Crypt'
                    end
                    object Label15: TLabel
                      Left = 136
                      Top = 265
                      Width = 41
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'SSL Http'
                    end
                    object Label16: TLabel
                      Left = 461
                      Top = 265
                      Width = 62
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'SSL XML Sign'
                    end
                    object ed_set_lib_ssl: TSpeedButton
                      Left = 323
                      Top = 235
                      Width = 23
                      Height = 22
                      Hint = 'Alterar biblioteca de comunica'#231#227'o NFC-e'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B00000001000000010000004A00000052
                        000000630000089C2100109C210010A5290010AD390039AD390010B5390018B5
                        4A004ABD520052BD52005ABD52005AC65A0063C663006BC663006BC66B007BD6
                        7B008CD68C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00131313131313
                        1313131313131313131313131313131313131313131313131313131313131300
                        0200131313131313131313131313130203020013131313131313131313131302
                        0403020013131313131313131313130205050302001313131313131313131302
                        0805030302001313131313131313130209060606050201131313131313131302
                        0B0C0A0A0A02011313131313131313020D100F0A020013131313131313131302
                        101111020013131313131313131313020E120200131313131313131313131302
                        0702001313131313131313131313130002001313131313131313131313131313
                        1313131313131313131313131313131313131313131313131313}
                      OnClick = ed_set_lib_sslClick
                    end
                    object Label12: TLabel
                      Left = 431
                      Top = 86
                      Width = 92
                      Height = 13
                      Hint = 
                        'S'#233'rie da NFCe para funcionamento offline com a Api de sincroniza' +
                        #231#227'o'
                      Alignment = taRightJustify
                      Caption = 'Serie NFC-e Offline'
                      FocusControl = DBEdit4
                    end
                    object DBEdit1: TDBEdit
                      Left = 183
                      Top = 29
                      Width = 134
                      Height = 21
                      DataField = 'COD_EMISSOR'
                      DataSource = dtmNFConsumidor.dsEmissor
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 183
                      Top = 56
                      Width = 480
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NOME_EMISSOR'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 183
                      Top = 85
                      Width = 134
                      Height = 21
                      DataField = 'SERIE_NFCE'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 2
                    end
                    object DBEdit5: TDBEdit
                      Left = 529
                      Top = 110
                      Width = 134
                      Height = 21
                      DataField = 'IDENTIFICADOR'
                      DataSource = dtmNFConsumidor.dsEmissor
                      Enabled = False
                      TabOrder = 4
                    end
                    object DBEdit6: TDBEdit
                      Left = 183
                      Top = 112
                      Width = 134
                      Height = 21
                      DataField = 'TOKEN'
                      DataSource = dtmNFConsumidor.dsEmissor
                      Enabled = False
                      TabOrder = 5
                    end
                    object ckServerProc: TCheckBox
                      Left = 690
                      Top = 303
                      Width = 169
                      Height = 17
                      Caption = 'Servidor de processamento'
                      Enabled = False
                      TabOrder = 7
                      Visible = False
                      OnClick = ckServerProcClick
                    end
                    object ckServerImp: TCheckBox
                      Left = 690
                      Top = 326
                      Width = 145
                      Height = 17
                      Caption = 'Servidor de impress'#227'o'
                      Enabled = False
                      TabOrder = 8
                      Visible = False
                      OnClick = ckServerProcClick
                    end
                    object radioTpEmiss: TRadioGroup
                      Left = 751
                      Top = 192
                      Width = 305
                      Height = 105
                      Caption = 'Tipo de Cliente Emissor'
                      Enabled = False
                      Items.Strings = (
                        'Emissor Stand Alone - Usa Threads'
                        'Emissor Stand Alone - Sem Threads'
                        'Emissor Dependente - Windows service'
                        'Emissor Mobile - Windows Service')
                      TabOrder = 6
                      Visible = False
                      OnClick = ckServerProcClick
                      OnExit = ckServerProcClick
                    end
                    object lkClientOrServer: TDBLookupComboBox
                      Left = 183
                      Top = 139
                      Width = 134
                      Height = 21
                      DataField = 'CLIENT_OR_SERVER'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 9
                    end
                    object ck_ServerAutorizacao_client: TDBCheckBox
                      Left = 183
                      Top = 166
                      Width = 161
                      Height = 17
                      BiDiMode = bdLeftToRight
                      Caption = 'Usar Servidor de Autoriza'#231#227'o'
                      DataField = 'SERVER_AUTORIZACAO'
                      DataSource = dtmNFConsumidor.dsEmissor
                      ParentBiDiMode = False
                      TabOrder = 10
                      ValueChecked = 'Sim'
                      ValueUnchecked = 'N'#227'o'
                      Visible = False
                    end
                    object ck_ServerImpressao_client: TDBCheckBox
                      Left = 183
                      Top = 189
                      Width = 161
                      Height = 17
                      Caption = 'Usar Servidor de Impress'#227'o'
                      DataField = 'SERVER_IMPRESSAO'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 11
                      ValueChecked = 'Sim'
                      ValueUnchecked = 'N'#227'o'
                      Visible = False
                    end
                    object ck_ServerAutorizacao_server: TDBCheckBox
                      Left = 323
                      Top = 141
                      Width = 137
                      Height = 17
                      BiDiMode = bdLeftToRight
                      Caption = 'Servidor de Autoriza'#231#227'o'
                      DataField = 'SERVER_AUTORIZACAO'
                      DataSource = dtmNFConsumidor.dsEmissor
                      ParentBiDiMode = False
                      TabOrder = 12
                      ValueChecked = 'Sim'
                      ValueUnchecked = 'N'#227'o'
                      Visible = False
                    end
                    object ck_ServerImpressao_server: TDBCheckBox
                      Left = 466
                      Top = 141
                      Width = 128
                      Height = 17
                      Caption = 'Servidor de Impress'#227'o'
                      DataField = 'SERVER_IMPRESSAO'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 13
                      ValueChecked = 'Sim'
                      ValueUnchecked = 'N'#227'o'
                      Visible = False
                    end
                    object ck_ServerEmail_server: TDBCheckBox
                      Left = 600
                      Top = 141
                      Width = 102
                      Height = 17
                      Caption = 'Servidor de email'
                      DataField = 'SERVER_EMAIL'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 14
                      ValueChecked = 'Sim'
                      ValueUnchecked = 'N'#227'o'
                      Visible = False
                    end
                    object ck_ServerEmail_client: TDBCheckBox
                      Left = 183
                      Top = 212
                      Width = 134
                      Height = 17
                      Caption = 'Usar Servidor de email'
                      DataField = 'SERVER_EMAIL'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 15
                      ValueChecked = 'Sim'
                      ValueUnchecked = 'N'#227'o'
                      Visible = False
                    end
                    object ed_lib_ssl: TDBLookupComboBox
                      Left = 183
                      Top = 235
                      Width = 134
                      Height = 21
                      DataField = 'LIB_SSL'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 16
                      OnExit = ed_lib_sslExit
                    end
                    object ed_lib_sslcryptlib: TDBLookupComboBox
                      Left = 529
                      Top = 235
                      Width = 134
                      Height = 21
                      DataField = 'LIB_SSLCRYPTLIB'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 17
                    end
                    object ed_lib_sslhttplib: TDBLookupComboBox
                      Left = 183
                      Top = 262
                      Width = 134
                      Height = 21
                      DataField = 'LIB_SSLHTTPLIB'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 18
                    end
                    object ed_lib_sslxmlsignlib: TDBLookupComboBox
                      Left = 529
                      Top = 262
                      Width = 134
                      Height = 21
                      DataField = 'LIB_SSLXMLSIGNLIB'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 19
                    end
                    object DBEdit4: TDBEdit
                      Left = 529
                      Top = 83
                      Width = 134
                      Height = 21
                      Hint = 
                        'S'#233'rie da NFCe para funcionamento offline com a Api de sincroniza' +
                        #231#227'o'
                      DataField = 'SERIE_NFCE_OFF'
                      DataSource = dtmNFConsumidor.dsEmissor
                      TabOrder = 3
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Top = 10
                Hint = 'Salvar registro - [NFC005]'
                ExplicitTop = 10
              end
              inherited BitBtn5: TBitBtn
                Top = 10
                ExplicitTop = 10
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
            object SpeedButton59: TSpeedButton [6]
              Left = 627
              Top = 44
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
            object bt_mais: TSpeedButton [7]
              Left = 656
              Top = 44
              Width = 23
              Height = 22
              Hint = 'Mais a'#231#245'es'
              Flat = True
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
              OnClick = bt_maisClick
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [NFC002]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [NFC003]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [NFC004]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [NFC006]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Enabled = False
                Visible = False
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
                Enabled = False
                Visible = False
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
    Left = 672
    ExplicitLeft = 672
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 750
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 710
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 678
    Top = 11
  end
  object popEmissor: TPopupMenu
    Left = 704
    Top = 48
    object ConfiguraesSincronizaoNFCeOffline1: TMenuItem
      Caption = 'Configura'#231#245'es Sincroniza'#231#227'o NFCe Offline'
      OnClick = ConfiguraesSincronizaoNFCeOffline1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object LogSincronizaoNFCeoffline1: TMenuItem
      Caption = 'Log Sincroniza'#231#227'o NFCe offline'
      OnClick = LogSincronizaoNFCeoffline1Click
    end
  end
end
