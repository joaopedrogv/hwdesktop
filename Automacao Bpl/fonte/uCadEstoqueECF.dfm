inherited frmCadEstoqueECF: TfrmCadEstoqueECF
  Left = 236
  Top = 97
  Caption = 'Estoque de Equipamentos com N'#186' de S'#233'rie'
  ClientHeight = 502
  ClientWidth = 799
  Scaled = False
  ExplicitWidth = 807
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 799
    Height = 483
    ExplicitWidth = 799
    ExplicitHeight = 483
    inherited Splitter2: TSplitter
      Height = 481
      ExplicitHeight = 481
    end
    inherited PanelLeft: TPanel
      Width = 794
      Height = 481
      ExplicitWidth = 794
      ExplicitHeight = 481
      inherited PageControl1: TPageControl
        Width = 792
        Height = 479
        ExplicitWidth = 792
        ExplicitHeight = 479
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 784
          ExplicitHeight = 448
          inherited ScrollBox1: TScrollBox
            Width = 784
            Height = 448
            ExplicitWidth = 784
            ExplicitHeight = 448
            inherited PageControl3: TPageControl
              Width = 784
              Height = 400
              ExplicitWidth = 784
              ExplicitHeight = 400
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 776
                ExplicitHeight = 369
                inherited ScrollBox3: TScrollBox
                  Width = 776
                  Height = 369
                  ExplicitWidth = 776
                  ExplicitHeight = 369
                  inherited GroupBox1: TGroupBox
                    Width = 772
                    Height = 365
                    Align = alClient
                    Caption = 'Equipamento Emissor de Cupom Fiscal'
                    OnEnter = DBRadioGroup4Exit
                    ExplicitWidth = 772
                    ExplicitHeight = 365
                    object Label6: TLabel
                      Left = 130
                      Top = 120
                      Width = 103
                      Height = 13
                      Caption = 'Num Serie Fabrica'#231#227'o'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 203
                      Top = 147
                      Width = 30
                      Height = 13
                      Caption = 'CNIEE'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 213
                      Top = 174
                      Width = 20
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Tipo'
                      FocusControl = DBEdit3
                      ParentBiDiMode = False
                    end
                    object Label9: TLabel
                      Left = 452
                      Top = 174
                      Width = 29
                      Height = 13
                      Caption = 'Marca'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 447
                      Top = 201
                      Width = 34
                      Height = 13
                      Caption = 'Modelo'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 185
                      Top = 201
                      Width = 48
                      Height = 13
                      Caption = 'Vers'#227'o SB'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 140
                      Top = 228
                      Width = 93
                      Height = 13
                      Caption = 'Num Memoria Fiscal'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 157
                      Top = 255
                      Width = 76
                      Height = 13
                      Caption = 'Lacre Externo 1'
                      FocusControl = DBEdit8
                    end
                    object Label14: TLabel
                      Left = 405
                      Top = 255
                      Width = 76
                      Height = 13
                      Caption = 'Lacre Externo 2'
                      FocusControl = DBEdit9
                    end
                    object Label15: TLabel
                      Left = 157
                      Top = 282
                      Width = 76
                      Height = 13
                      Caption = 'Lacre Externo 3'
                      FocusControl = DBEdit10
                    end
                    object Label16: TLabel
                      Left = 405
                      Top = 282
                      Width = 76
                      Height = 13
                      Caption = 'Lacre Externo 4'
                      FocusControl = DBEdit11
                    end
                    object Label17: TLabel
                      Left = 155
                      Top = 309
                      Width = 78
                      Height = 13
                      Caption = 'Num NF Entrada'
                      FocusControl = DBEdit12
                    end
                    object Label18: TLabel
                      Left = 402
                      Top = 309
                      Width = 79
                      Height = 13
                      Caption = 'Serie Nf Entrada'
                      FocusControl = DBEdit13
                    end
                    object DBEdit1: TDBEdit
                      Left = 239
                      Top = 117
                      Width = 408
                      Height = 21
                      DataField = 'N_SERIE_FAB'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 239
                      Top = 144
                      Width = 66
                      Height = 21
                      DataField = 'IDENTIFICACAO'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 1
                      OnExit = DBEdit2Exit
                    end
                    object DBEdit3: TDBEdit
                      Left = 239
                      Top = 171
                      Width = 160
                      Height = 21
                      DataField = 'TIPO_ECF'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 3
                    end
                    object DBEdit4: TDBEdit
                      Left = 487
                      Top = 171
                      Width = 160
                      Height = 21
                      DataField = 'MARCA_ECF'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 4
                    end
                    object DBEdit5: TDBEdit
                      Left = 487
                      Top = 198
                      Width = 160
                      Height = 21
                      DataField = 'MODELO_ECF'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 6
                    end
                    object DBEdit6: TDBEdit
                      Left = 239
                      Top = 198
                      Width = 160
                      Height = 21
                      DataField = 'VERSAOSB'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 5
                    end
                    object DBEdit7: TDBEdit
                      Left = 239
                      Top = 225
                      Width = 408
                      Height = 21
                      DataField = 'N_MEMORIA_FISCAL'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 7
                    end
                    object DBEdit8: TDBEdit
                      Left = 239
                      Top = 252
                      Width = 160
                      Height = 21
                      DataField = 'LACRE_EXTERNO1'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 8
                    end
                    object DBEdit9: TDBEdit
                      Left = 487
                      Top = 252
                      Width = 160
                      Height = 21
                      DataField = 'LACRE_EXTERNO2'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 9
                    end
                    object DBEdit10: TDBEdit
                      Left = 239
                      Top = 279
                      Width = 160
                      Height = 21
                      DataField = 'LACRE_EXTERNO3'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 10
                    end
                    object DBEdit11: TDBEdit
                      Left = 487
                      Top = 279
                      Width = 160
                      Height = 21
                      DataField = 'LACRE_EXTERNO4'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 11
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 311
                      Top = 144
                      Width = 336
                      Height = 21
                      DataField = 'IDENTIFICACAO'
                      DataSource = dtmEstoqueECF.dsEstECF
                      KeyField = 'IDENTIFICACAO'
                      ListField = 'MODELO_ECF;VERSAOSB;MARCA_ECF'
                      ListSource = dtmEstoqueECF.dsCNIEE
                      TabOrder = 2
                      OnExit = DBLookupComboBox1Exit
                    end
                    object DBEdit12: TDBEdit
                      Left = 239
                      Top = 306
                      Width = 160
                      Height = 21
                      DataField = 'NNF_ENTRADA'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 12
                    end
                    object DBEdit13: TDBEdit
                      Left = 487
                      Top = 306
                      Width = 160
                      Height = 21
                      DataField = 'SERIE_ENTRADA'
                      DataSource = dtmEstoqueECF.dsEstECF
                      TabOrder = 13
                    end
                    object DBRadioGroup4: TDBRadioGroup
                      Left = 239
                      Top = 39
                      Width = 408
                      Height = 72
                      Caption = 
                        'Tipo de Controle de Equipamento ( Definido pelo produto associad' +
                        'o )'
                      DataField = 'TIPO'
                      DataSource = dtmEstoqueECF.dsEstECF
                      Items.Strings = (
                        'ECF (Emissor de Cupom Fiscal)'
                        'Outros (No Break, Equipamentos Agr'#237'colas, etc)')
                      ParentBackground = True
                      TabOrder = 14
                      Values.Strings = (
                        'E'
                        'O')
                      OnExit = DBRadioGroup4Exit
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 400
              Width = 784
              ExplicitTop = 400
              ExplicitWidth = 784
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 784
          ExplicitHeight = 448
          inherited GroupBox3: TGroupBox
            Width = 784
            ExplicitWidth = 784
            inherited imgInformation: TImage
              Left = 758
              ExplicitLeft = 758
            end
            object SpeedButton59: TSpeedButton [6]
              Left = 656
              Top = 42
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
              Hint = 'Clique para pesquisar - [ECF001]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [ECF002]'
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
            object BitBtn11: TBitBtn
              Left = 498
              Top = 42
              Width = 75
              Height = 25
              Hint = 'Montar Arquivo - [ECF011]'
              Caption = '&Arquivo'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = BitBtn11Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000320B0000320B00000001000000010000CE6300009C39
                0800EFA54A00C6846B0073737300BD8C7300CE947300EFB57300FFC67300BD84
                7B00C6947B00B5848400B58C84009C948400CE9C8400B5948C00C6A59400EFCE
                9400C6A59C00EFCE9C00F7D69C00C6ADA500F7D6A500CEB5AD00D6B5AD00C6BD
                AD00F7D6AD00D6BDB500DEBDB500DEC6B500E7C6B500EFCEB500F7D6B500F7DE
                B500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7C600E7CECE00E7D6CE00F7E7
                CE00F7E7D600FFEFD600FFEFDE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFF
                F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0032320B0B0B0B
                0B0B0B0B0B0B0B0B0B323232122B2623211A1613111111140B323232122B2925
                23201613011111130B323232152D0D0D0D042000010101130B323232152E2A29
                26252120001301110B32323217312D2A2A292523201A01130B32323218332F2D
                2A292625011A16160B3232321B330D0D0D0429000101011A0B3232321B333330
                2F2D2A29002301210B3232321C333333302D2C2A292501200B3232321D330D0D
                0D042D2C2C2B24190B3232321E33333333332F2F2A100F0C0B3232321E333333
                3333333127050702033232322233333333333333280A0806323232321E302F2F
                2F2F2F2F270A0E32323232321E1F1F1F1F1E1E1F1B0932323232}
            end
          end
          inherited Panel1: TPanel
            Width = 784
            Height = 375
            ExplicitWidth = 784
            ExplicitHeight = 375
            inherited Splitter1: TSplitter
              Height = 314
              ExplicitHeight = 317
            end
            inherited DBGrid1: TDBGrid
              Width = 491
              Height = 314
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 780
              ExplicitWidth = 780
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [ECF003]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [ECF004]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Left = 677
                Top = -12
                Visible = False
                ExplicitLeft = 677
                ExplicitTop = -12
              end
              inherited SpeedButton5: TSpeedButton
                Left = 734
                Top = -3
                Visible = False
                ExplicitLeft = 734
                ExplicitTop = -3
              end
              inherited SpeedButton6: TSpeedButton
                Left = 178
                Hint = 'Informar dados de Sa'#237'da - [ECF006]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B00000001000000010000080808001810
                  1000181818002929210029292900393939004239390042423900EFA539004242
                  4200524A42005A52420042424A004A424A00313952004A4A5200EFA55200FFB5
                  52005A5A5A00E7AD6B00F7BD6B00AD7B7300AD847300B5847300BD8C73005A63
                  7B00AD7B7B009C847B00A5847B00AD847B00B58C7B00C68C7B00C6947B00CE94
                  7B00CE9C7B00D69C7B0084848400B5848400BD848400B58C8400BD8C8400BD94
                  8400C6948400C69C8400D6A58400DEA58400DEAD8400E7B584008C8C8C00CE9C
                  8C00CEA58C00D6A58C00DEAD8C00EFC68C00F7C68C00B5AD9400EFCE9400B5AD
                  9C00EFCE9C00F7CE9C00F7D69C00CEADA500BDB5A500DEC6A500EFCEA500F7CE
                  A500F7D6A500394AAD00848CAD00CEBDAD00D6C6AD00F7D6AD009494B500ADB5
                  B500F7D6B500F7DEB500526BBD00DEC6BD00E7CEBD00EFD6BD00F7DEBD00314A
                  C6009CA5C600E7CEC600EFCEC600EFD6C600EFDEC600F7DEC600F7E7C600FFE7
                  C6004A63CE00C6C6CE00DECECE00DED6CE00E7D6CE00E7DECE00F7DECE00F7E7
                  CE00FFE7CE001842D600214AD6007384D600DED6D600E7D6D600EFDED600F7E7
                  D600FFE7D600FFEFD6007B94DE009CA5DE00EFDEDE00F7E7DE00F7EFDE00FFEF
                  DE000839E7001039E7004A6BE700A5ADE700F7EFE700FFEFE700FFF7E7004A6B
                  EF00637BEF00738CEF008494EF0094A5EF00CED6EF00D6D6EF00EFEFEF00F7EF
                  EF00F7F7EF00FFF7EF004263F700426BF700CED6F700F7F7F700FFF7F700FFFF
                  F700FF00FF000842FF00295AFF00315AFF003163FF00426BFF006B8CFF00849C
                  FF009CB5FF00C6CEFF00EFEFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008A8A8A1A2525
                  252525252525252525252525252525258A8A8A8A8A1A5658504B4A47423A3A38
                  383838383838381E8A8A8A8A8A1A566157504A4747403A3A383838383838381E
                  8A8A8A8A8A1A60615757504A4747403A3A3838383838381E8A8A8A8A8A1A6169
                  615750504A4747403A3A38383838381E8A8A8A8A8A1A697069615757504A4747
                  403A3A383838381E8A8A8A8A8A1D6F706961615757504A4747403A3A3838381E
                  8A8A8A8A8A1D7676030B0B0B0B0B504A4747403A3A38381E8A8A8A8A8A1E7683
                  025C7C8B430A50504A4747403A3A381E8A8A8A8A8A27818304658475730D5750
                  504A4747403A381E8A8A8A8A8A28878902485B5C5A64605757504A4747403A1E
                  8A8A8A8A8A298795090909070C637B245750504A4747401E8A8A8A8A8A2A8795
                  878176766F6685796D5750504A47401E8A8A8A8A8A2B87959595888376766F7D
                  7A615750504A471E8A8A8A8A8A2B879524242424242476706961615750503F1B
                  8A8A8A8A8A3188950030494419097676706961614F45371B8A8A8A8A8A328895
                  0280868C4C1282767670705F453E391B8A8A8A8A8A338895046C8E91730F8883
                  78681716151515168A8A8A8A8A34889502527E95745189888353172F13100825
                  8A8A8A8A8A348895040909090E739295895317351411258A8A8A8A8A8A348895
                  80808080807E8E90935E173514258A8A8A8A8A8A8A3495959595959595959490
                  8F671735258A8A8A8A8A8A8A8A344E4F4F544E4E4E4E4D4D4D3D17258A8A8A8A
                  8A8A8A8A8A2D2C2C2C2C23222120201F1817258A8A8A8A8A8A8A}
                OnClick = SpeedButton6Click
                ExplicitLeft = 178
              end
              inherited SpeedButton7: TSpeedButton
                Left = 292
                Hint = 'Associar ao Produto - [ECF012]'
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000230B0000230B00000001000000010000313131001839
                  52000031630021526B0000639C00009CCE00FF00FF0031CEFF0063CEFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  0606060606060606060603010101010101010101010106060606030705050505
                  0505050505050106060603070505050505050505050504010606030705050505
                  0505050505050404010603070505050505050505050504040401030705050505
                  0505050505050404040103070505050505050505050504040401030705050505
                  0505050505050404040100040202020202020202020204040401020505050505
                  0505050505050304040103070707070707070707070703040401060308080808
                  0808080808080803040106060308080808080808080808080301060606030303
                  0303030303030303030106060606060606060606060606060606}
                OnClick = SpeedButton7Click
                ExplicitLeft = 292
              end
              inherited SpeedButton8: TSpeedButton
                Left = 235
                Hint = 'Alterar Status do Equipamento - [ECF010]'
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
                OnClick = SpeedButton8Click
                ExplicitLeft = 235
              end
              inherited SpeedButton11: TSpeedButton
                Left = 349
                Hint = 'Inicializa'#231#227'o de ECF - [ECF013]'
                Glyph.Data = {
                  EA030000424DEA03000000000000AA0100002800000018000000180000000100
                  08000000000040020000120B0000120B00005D0000005D00000000000000FFFF
                  FF00FF00FF0001560300047E0A00058A0C0005810C0007910F00079110000786
                  0F0009951300087E1100196E1E000A951500098413000B9817000D9C1B000F9C
                  1D000E9E1D0011A3210011A0210010911F0013A4240013A1230015AA280014A4
                  270015A728001290220016AA290016A62A0015A1280024712F0017A12C00169A
                  2A0019AB2F001CB235001BAC32001BAC3300199D2E001CAD34001FB538001DA1
                  340022B73E0022B63E0023BB410023B7410025BA430026BB440026BB450029C4
                  4A0025AC420024A442002CC54E002ABC4C002DC652002DC4510028AC46002EC5
                  530030C9560031C9580030C655002EBD520033CA5A0030BB540038D0630035C3
                  5B0038D0640036CA620039D1660038CC64003BD368003ACE670036BF5E003FDC
                  6E003ED96E003ED76D0040DA70003FD76E0043E2770042E0760041DC7300FCFE
                  FF00ABBBFE00E6EBFF003658FB005473FC007B93FC001033FA002042FB00011F
                  FA000222FA000728FA0000008200020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020203030303030302025C5C
                  5C5C5C5C5C5C5C5C5C5C5C5C5C5C03372D24170302025C595A5B575854555652
                  53515151515C0342392E270302025C595A5B57585455565253515151515C034B
                  443C300302025C595A5B57585455565253515151515C034B4B463B0302025C59
                  5A5B57585455565253515151515C03030303030302025C5C5C5C5C5C5C5C5C5C
                  5C5C5C5C5C5C0202020202020202020202020202020202020202020202020202
                  0202030302020202020202020202020202020202020202020203454703030202
                  020202020202020202020202020202020203494C4D3F03030202020202020202
                  020203030202020203293A3E404A4F0303020202020202020203330302020202
                  03282B2F36320303020202020202020203481F03020202030B161D252A260302
                  020202020202020345380302020202030303031419231B030202020202030350
                  4103020202020202020203030F111C1503030303033D4E430302020202020202
                  0202020303080D12181E202C3134350302020202020202020202020203030507
                  0A10131A222103020202020202020202020202020203030C0406090E03030202
                  0202020202020202020202020202020303030303020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202}
                OnClick = SpeedButton11Click
                ExplicitLeft = 349
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
                Left = 677
                Top = -3
                Visible = False
                ExplicitLeft = 677
                ExplicitTop = -3
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 314
              ExplicitHeight = 314
              inherited ScrollBox2: TScrollBox
                Height = 297
                ExplicitHeight = 297
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 784
          ExplicitHeight = 448
        end
        object tsIntervencao: TTabSheet
          Caption = 'tsIntervencao'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnIntevencao: TPanel
            Left = 32
            Top = 16
            Width = 585
            Height = 297
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            OnEnter = pnIntevencaoEnter
            object Panel5: TPanel
              Left = 8
              Top = 9
              Width = 566
              Height = 232
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label19: TLabel
                Left = 54
                Top = 70
                Width = 121
                Height = 13
                Alignment = taRightJustify
                Caption = 'Numero Disp Protecao SB'
                FocusControl = DBEdit14
              end
              object Label20: TLabel
                Left = 109
                Top = 97
                Width = 66
                Height = 13
                Alignment = taRightJustify
                Caption = 'Numero Lacre'
                FocusControl = DBEdit15
              end
              object Label21: TLabel
                Left = 370
                Top = 70
                Width = 84
                Height = 13
                Alignment = taRightJustify
                Caption = 'Numero Nf Venda'
                FocusControl = DBEdit16
              end
              object Label22: TLabel
                Left = 383
                Top = 97
                Width = 71
                Height = 13
                Caption = 'Serie Nf Venda'
                FocusControl = DBEdit17
              end
              object Label23: TLabel
                Left = 20
                Top = 124
                Width = 76
                Height = 13
                Caption = 'Lacre Externo 1'
                FocusControl = DBEdit18
              end
              object Label24: TLabel
                Left = 300
                Top = 124
                Width = 76
                Height = 13
                Caption = 'Lacre Externo 2'
                FocusControl = DBEdit19
              end
              object Label25: TLabel
                Left = 20
                Top = 151
                Width = 76
                Height = 13
                Caption = 'Lacre Externo 3'
                FocusControl = DBEdit20
              end
              object Label26: TLabel
                Left = 300
                Top = 151
                Width = 76
                Height = 13
                Caption = 'Lacre Externo 4'
                FocusControl = DBEdit21
              end
              object Label38: TLabel
                Left = 6
                Top = 178
                Width = 90
                Height = 13
                Caption = 'Num Cupom Venda'
                FocusControl = DBEdit24
              end
              object Label40: TLabel
                Left = 292
                Top = 178
                Width = 84
                Height = 13
                Caption = 'Num Caixa Venda'
                FocusControl = DBEdit25
              end
              object Label41: TLabel
                Left = 273
                Top = 205
                Width = 103
                Height = 13
                Caption = 'Num Serie ECF Venda'
                FocusControl = DBEdit26
              end
              object Label42: TLabel
                Left = 39
                Top = 202
                Width = 57
                Height = 13
                Caption = 'Tipo Venda:'
              end
              object Label43: TLabel
                Left = 151
                Top = 202
                Width = 41
                Height = 13
                Caption = 'N'#250'mero:'
              end
              object DBText1: TDBText
                Left = 103
                Top = 202
                Width = 42
                Height = 17
                DataField = 'TIPO_PED'
                DataSource = dtmEstoqueECF.dsEstECF
              end
              object DBText2: TDBText
                Left = 204
                Top = 202
                Width = 65
                Height = 17
                DataField = 'NPED'
                DataSource = dtmEstoqueECF.dsEstECF
              end
              object DBRadioGroup1: TDBRadioGroup
                Left = 20
                Top = 12
                Width = 170
                Height = 41
                Caption = 'Houve Interven'#231#227'o T'#233'cnica'
                Columns = 2
                DataField = 'HOUVE_INTERVENCAO'
                DataSource = dtmEstoqueECF.dsEstECF
                Items.Strings = (
                  'Sim'
                  'N'#227'o')
                ParentBackground = True
                TabOrder = 0
                Values.Strings = (
                  'S'
                  'N')
              end
              object DBRadioGroup2: TDBRadioGroup
                Left = 196
                Top = 12
                Width = 170
                Height = 41
                Caption = 'Finalidade Movimenta'#231#227'o'
                Columns = 2
                DataField = 'USO_PROPRIO'
                DataSource = dtmEstoqueECF.dsEstECF
                Items.Strings = (
                  'Uso Pr'#243'prio'
                  'Revenda')
                ParentBackground = True
                TabOrder = 1
                Values.Strings = (
                  'S'
                  'N')
              end
              object DBRadioGroup3: TDBRadioGroup
                Left = 372
                Top = 12
                Width = 170
                Height = 41
                Caption = 'Tipo de Dispositivo'
                Columns = 2
                DataField = 'TIPO_DISPOSITIVO'
                DataSource = dtmEstoqueECF.dsEstECF
                Items.Strings = (
                  'Lacre'
                  'Etiqueta')
                ParentBackground = True
                TabOrder = 2
                Values.Strings = (
                  'L'
                  'E')
              end
              object DBEdit14: TDBEdit
                Left = 181
                Top = 67
                Width = 82
                Height = 21
                DataField = 'NUM_DISP_PROT_SB'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 3
              end
              object DBEdit15: TDBEdit
                Left = 181
                Top = 94
                Width = 82
                Height = 21
                DataField = 'LACRE_MFD'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 4
              end
              object DBEdit16: TDBEdit
                Left = 460
                Top = 67
                Width = 82
                Height = 21
                DataField = 'NNF'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 5
              end
              object DBEdit17: TDBEdit
                Left = 460
                Top = 94
                Width = 82
                Height = 21
                DataField = 'SERIE'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 6
              end
              object DBEdit18: TDBEdit
                Left = 102
                Top = 121
                Width = 160
                Height = 21
                DataField = 'LACRE_EXTERNO1'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 7
              end
              object DBEdit19: TDBEdit
                Left = 382
                Top = 121
                Width = 160
                Height = 21
                DataField = 'LACRE_EXTERNO2'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 8
              end
              object DBEdit20: TDBEdit
                Left = 102
                Top = 148
                Width = 160
                Height = 21
                DataField = 'LACRE_EXTERNO3'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 9
              end
              object DBEdit21: TDBEdit
                Left = 382
                Top = 148
                Width = 160
                Height = 21
                DataField = 'LACRE_EXTERNO4'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 10
              end
              object DBEdit24: TDBEdit
                Left = 102
                Top = 175
                Width = 160
                Height = 21
                DataField = 'NCUPOM'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 11
              end
              object DBEdit25: TDBEdit
                Left = 382
                Top = 175
                Width = 160
                Height = 21
                DataField = 'COD_TERMINAL'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 12
              end
              object DBEdit26: TDBEdit
                Left = 382
                Top = 202
                Width = 160
                Height = 21
                DataField = 'NSERIETERMINAL'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 13
              end
            end
            object Panel7: TPanel
              Left = 8
              Top = 247
              Width = 566
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn9: TBitBtn
                Left = 203
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Salvar Registro'
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = BitBtn9Click
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
              object BitBtn10: TBitBtn
                Left = 284
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn10Click
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
        object tsImpressao: TTabSheet
          Caption = 'tsImpressao'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object QuickRep1: TQuickRep
            Left = -8
            Top = 3
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmEstoqueECF.cdsEstECF
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
            OnPreview = QuickRep1Preview
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
            ReportTitle = 'Relat'#243'rio de Estoque de Equipamentos'
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsNormal
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object PageHeaderBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 75
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
                198.437500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRLabel2: TQRLabel
                Left = 0
                Top = 59
                Width = 83
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  0.000000000000000000
                  156.104166666666700000
                  219.604166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Num S'#233'rie Fab'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel3: TQRLabel
                Left = 101
                Top = 58
                Width = 67
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  267.229166666666700000
                  153.458333333333300000
                  177.270833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Num Mem F'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel4: TQRLabel
                Left = 178
                Top = 59
                Width = 139
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  470.958333333333400000
                  156.104166666666700000
                  367.770833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Lacre Externo 1 / 2 / 3 / 4'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel5: TQRLabel
                Left = 336
                Top = 58
                Width = 38
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  889.000000000000000000
                  153.458333333333300000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Status'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel6: TQRLabel
                Left = 402
                Top = 58
                Width = 90
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1063.625000000000000000
                  153.458333333333300000
                  238.125000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Interven'#231#227'o S/N'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel7: TQRLabel
                Left = 505
                Top = 58
                Width = 58
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1336.145833333333000000
                  153.458333333333300000
                  153.458333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Lacre/Etiq'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel8: TQRLabel
                Left = 578
                Top = 58
                Width = 55
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1529.291666666667000000
                  153.458333333333300000
                  145.520833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Num Disp'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel9: TQRLabel
                Left = 647
                Top = 58
                Width = 61
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1711.854166666667000000
                  153.458333333333300000
                  161.395833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Lacre MFD'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRSysData2: TQRSysData
                Left = 8
                Top = 40
                Width = 68
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  105.833333333333300000
                  179.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData1: TQRSysData
                Left = 271
                Top = 6
                Width = 113
                Height = 23
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  60.854166666666680000
                  717.020833333333400000
                  15.875000000000000000
                  298.979166666666700000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsReportTitle
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 14
              end
            end
            object DetailBand1: TQRBand
              Left = 38
              Top = 113
              Width = 718
              Height = 43
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
                113.770833333333300000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 8
                Top = 7
                Width = 69
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  18.520833333333330000
                  182.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'N_SERIE_FAB'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText2: TQRDBText
                Left = 101
                Top = 6
                Width = 103
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  267.229166666666700000
                  15.875000000000000000
                  272.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'N_MEMORIA_FISCAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText3: TQRDBText
                Left = 178
                Top = 6
                Width = 94
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  470.958333333333400000
                  15.875000000000000000
                  248.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'LACRE_EXTERNO1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText4: TQRDBText
                Left = 336
                Top = 6
                Width = 42
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  889.000000000000000000
                  15.875000000000000000
                  111.125000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'STATUS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText5: TQRDBText
                Left = 395
                Top = 6
                Width = 115
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1045.104166666667000000
                  15.875000000000000000
                  304.270833333333400000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'HOUVE_INTERVENCAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText6: TQRDBText
                Left = 489
                Top = 6
                Width = 92
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1293.812500000000000000
                  15.875000000000000000
                  243.416666666666700000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'TIPO_DISPOSITIVO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText7: TQRDBText
                Left = 578
                Top = 6
                Width = 104
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1529.291666666667000000
                  15.875000000000000000
                  275.166666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'NUM_DISP_PROT_SB'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText8: TQRDBText
                Left = 647
                Top = 6
                Width = 62
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1711.854166666667000000
                  15.875000000000000000
                  164.041666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'LACRE_MFD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText9: TQRDBText
                Left = 260
                Top = 6
                Width = 94
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  687.916666666666800000
                  15.875000000000000000
                  248.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'LACRE_EXTERNO2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText10: TQRDBText
                Left = 178
                Top = 24
                Width = 94
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  470.958333333333400000
                  63.500000000000000000
                  248.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'LACRE_EXTERNO3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText11: TQRDBText
                Left = 260
                Top = 24
                Width = 94
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  687.916666666666800000
                  63.500000000000000000
                  248.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmEstoqueECF.cdsEstECF
                DataField = 'LACRE_EXTERNO4'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
          end
        end
        object tsModificarStatusECF: TTabSheet
          Caption = 'tsModificarStatusECF'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnAlterarStatusECF: TPanel
            Left = 32
            Top = 16
            Width = 585
            Height = 140
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel6: TPanel
              Left = 8
              Top = 9
              Width = 566
              Height = 72
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label27: TLabel
                Left = 91
                Top = 27
                Width = 111
                Height = 13
                Alignment = taRightJustify
                Caption = 'Status do Equipamento'
              end
              object DBComboBox1: TDBComboBox
                Left = 208
                Top = 24
                Width = 145
                Height = 21
                Style = csDropDownList
                DataField = 'STATUS'
                DataSource = dtmEstoqueECF.dsEstECF
                ItemHeight = 0
                Items.Strings = (
                  'Estoque'
                  'Vendido'
                  'Demostra'#231#227'o'
                  'Outros')
                TabOrder = 0
              end
            end
            object Panel8: TPanel
              Left = 8
              Top = 87
              Width = 566
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn7: TBitBtn
                Left = 203
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Salvar Registro'
                Caption = 'Salvar'
                TabOrder = 0
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
              object BitBtn8: TBitBtn
                Left = 284
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn8Click
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
        object tsArquivoEletronico: TTabSheet
          Caption = 'tsArquivoEletronico'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMontarArquivoEletronico: TPanel
            Left = 32
            Top = 16
            Width = 585
            Height = 257
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel10: TPanel
              Left = 8
              Top = 204
              Width = 566
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn12: TBitBtn
                Left = 203
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Iniciar'
                TabOrder = 0
                OnClick = BitBtn12Click
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
              end
              object BitBtn13: TBitBtn
                Left = 284
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn13Click
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
            object Panel9: TPanel
              Left = 8
              Top = 8
              Width = 566
              Height = 196
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label28: TLabel
                Left = 61
                Top = 24
                Width = 109
                Height = 13
                Alignment = taRightJustify
                Caption = 'Informante do Arquivo'
              end
              object Label29: TLabel
                Left = 70
                Top = 51
                Width = 100
                Height = 13
                Alignment = taRightJustify
                Caption = 'Estrutura do Arquivo'
              end
              object Label30: TLabel
                Left = 73
                Top = 78
                Width = 97
                Height = 13
                Alignment = taRightJustify
                Caption = 'M'#234's/Ano Movimento'
              end
              object Label32: TLabel
                Left = 24
                Top = 105
                Width = 146
                Height = 13
                Alignment = taRightJustify
                Caption = 'Arquivo Anexo I - Salvar como'
              end
              object Label36: TLabel
                Left = 22
                Top = 132
                Width = 148
                Height = 13
                Alignment = taRightJustify
                Caption = 'Arquivo Anexo V - Salvar como'
              end
              object ComboBox4: TComboBox
                Left = 176
                Top = 21
                Width = 225
                Height = 21
                ItemHeight = 0
                ItemIndex = 3
                TabOrder = 0
                Text = '4 - Revendedor de ECF n'#227'o Credenciado'
                Items.Strings = (
                  '1 - Fabricante ou Importador'
                  '2 - Interventora Credenciada'
                  '3 - Usu'#225'rio ou Propriet'#225'rio de ECF'
                  '4 - Revendedor de ECF n'#227'o Credenciado')
              end
              object ComboBox5: TComboBox
                Left = 176
                Top = 48
                Width = 225
                Height = 21
                Enabled = False
                ItemHeight = 0
                ItemIndex = 1
                TabOrder = 1
                Text = 
                  '2 - Anexo I do Conv'#234'nio ICMS XX/08 ou Anexo II do Ato COTEPE/ICM' +
                  'S 25/04'
                Items.Strings = (
                  '1 - Anexo II do Ato COTEPE/ICMS 25/04'
                  
                    '2 - Anexo I do Conv'#234'nio ICMS XX/08 ou Anexo II do Ato COTEPE/ICM' +
                    'S 25/04')
              end
              object ProgressBar1: TProgressBar
                Left = 20
                Top = 161
                Width = 521
                Height = 17
                TabOrder = 2
              end
              object MaskEdit4: TMaskEdit
                Left = 176
                Top = 75
                Width = 57
                Height = 21
                EditMask = '99/0000;1;_'
                MaxLength = 7
                TabOrder = 3
                Text = '  /    '
                OnExit = MaskEdit4Exit
              end
              object Edit3: TEdit
                Left = 176
                Top = 102
                Width = 365
                Height = 21
                TabOrder = 4
                Text = 'Edit3'
              end
              object Edit6: TEdit
                Left = 176
                Top = 129
                Width = 365
                Height = 21
                TabOrder = 5
                Text = 'Edit3'
              end
              object CheckBox2: TCheckBox
                Left = 544
                Top = 106
                Width = 97
                Height = 17
                Checked = True
                State = cbChecked
                TabOrder = 6
              end
              object CheckBox4: TCheckBox
                Left = 544
                Top = 133
                Width = 97
                Height = 17
                TabOrder = 7
              end
            end
          end
        end
        object tsDadosProduto: TTabSheet
          Caption = 'tsDadosProduto'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnModificarProduto: TPanel
            Left = 32
            Top = 16
            Width = 585
            Height = 140
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel11: TPanel
              Left = 8
              Top = 9
              Width = 566
              Height = 72
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label31: TLabel
                Left = 64
                Top = 26
                Width = 38
                Height = 13
                Alignment = taRightJustify
                Caption = 'Produto'
              end
              object Edit1: TEdit
                Left = 108
                Top = 23
                Width = 78
                Height = 21
                TabOrder = 0
                Text = 'Edit1'
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object Edit2: TEdit
                Left = 192
                Top = 23
                Width = 306
                Height = 21
                ReadOnly = True
                TabOrder = 1
                Text = 'Edit2'
              end
            end
            object Panel12: TPanel
              Left = 8
              Top = 87
              Width = 566
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn14: TBitBtn
                Left = 203
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Salvar Registro'
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = BitBtn14Click
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
              object BitBtn15: TBitBtn
                Left = 284
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn15Click
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
        object tsInicializacao: TTabSheet
          Caption = 'tsInicializacao'
          ImageIndex = 7
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnInicializacao: TPanel
            Left = 32
            Top = 16
            Width = 585
            Height = 286
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel13: TPanel
              Left = 8
              Top = 9
              Width = 566
              Height = 216
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label33: TLabel
                Left = 24
                Top = 22
                Width = 94
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cliente Usu'#225'rio ECF'
                FocusControl = DBEdit22
              end
              object Label34: TLabel
                Left = 35
                Top = 49
                Width = 83
                Height = 13
                Alignment = taRightJustify
                Caption = 'Data Inicializa'#231#227'o'
                FocusControl = DBEdit23
              end
              object Label37: TLabel
                Left = 51
                Top = 76
                Width = 67
                Height = 13
                Alignment = taRightJustify
                Caption = 'Chave Publica'
              end
              object Label39: TLabel
                Left = 48
                Top = 144
                Width = 70
                Height = 13
                Alignment = taRightJustify
                Caption = 'Chave Privada'
              end
              object Label35: TLabel
                Left = 348
                Top = 49
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'CNPJ Usu'#225'rio ECF'
              end
              object SpeedButton9: TSpeedButton
                Left = 212
                Top = 45
                Width = 23
                Height = 22
                Hint = 'Limpar data'
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                  8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  0404040404040404040404040404040404040404040404040404040404040404
                  0404040404040404040404010000000000000104040404040404040002020202
                  0202000004040404040404000202020202020001000404040404040100020202
                  0202000101000404040404040003030303030300010100040404040404000303
                  0303030300010100040404040404000303030303030001010004040404040400
                  0303030303030001000404040404040400030303030303000004040404040404
                  0400030303030303000404040404040404040100000000010104040404040404
                  0404040404040404040404040404040404040404040404040404}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton9Click
              end
              object DBEdit22: TDBEdit
                Left = 124
                Top = 19
                Width = 82
                Height = 21
                DataField = 'COD_CLIENTE_INICIALIZACAO'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 0
                OnExit = DBEdit22Exit
                OnKeyDown = DBEdit22KeyDown
              end
              object DBEdit23: TDBEdit
                Left = 124
                Top = 46
                Width = 82
                Height = 21
                DataField = 'DATA_INICIALIZACAO'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 1
              end
              object DBMemo1: TDBMemo
                Left = 124
                Top = 73
                Width = 413
                Height = 62
                DataField = 'CHAVE_PUBLICA'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 2
              end
              object DBMemo2: TDBMemo
                Left = 124
                Top = 141
                Width = 413
                Height = 62
                DataField = 'CHAVE_PRIVADA'
                DataSource = dtmEstoqueECF.dsEstECF
                TabOrder = 3
              end
              object Edit4: TEdit
                Left = 212
                Top = 19
                Width = 325
                Height = 21
                Enabled = False
                TabOrder = 4
                Text = 'NOME USUARIO ECF'
              end
              object Edit5: TEdit
                Left = 440
                Top = 46
                Width = 97
                Height = 21
                Enabled = False
                TabOrder = 5
                Text = '03244999000123'
              end
            end
            object Panel14: TPanel
              Left = 8
              Top = 231
              Width = 566
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn16: TBitBtn
                Left = 203
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Salvar Registro'
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = BitBtn16Click
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
              object BitBtn17: TBitBtn
                Left = 284
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = '&Cancelar'
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
    inherited PanelFlash: TPanel
      Height = 481
      ExplicitHeight = 481
      inherited bMarketingHW: TBitBtn
        Top = 459
        ExplicitTop = 459
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 483
    Width = 799
    ExplicitTop = 483
    ExplicitWidth = 799
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 742
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 710
    Top = 11
  end
end
