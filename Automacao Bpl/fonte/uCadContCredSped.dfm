inherited frmCadContSped: TfrmCadContSped
  Caption = 'Controle de Cr'#233'ditos Fiscais - ICMS [ Sped Fiscal]'
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
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 427
                    Align = alClient
                    Caption = 'Cadastro do Controle de Cr'#233'ditos Fiscais - ICMS'
                    ExplicitHeight = 427
                    object Label6: TLabel
                      Left = 190
                      Top = 29
                      Width = 23
                      Height = 13
                      Caption = 'Data'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 146
                      Top = 56
                      Width = 67
                      Height = 13
                      Caption = 'Codigo Ajuste'
                    end
                    object Label8: TLabel
                      Left = 25
                      Top = 78
                      Width = 181
                      Height = 13
                      Caption = 'Saldo de Creditos Periodos Anteriores'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 462
                      Top = 78
                      Width = 127
                      Height = 13
                      Caption = 'Cr'#233'dito apropriado no m'#234's'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 38
                      Top = 105
                      Width = 175
                      Height = 13
                      Caption = 'Cr'#233'ditos recebidos por transfer'#234'ncia'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 448
                      Top = 110
                      Width = 141
                      Height = 13
                      Caption = 'Cr'#233'ditos utilizados no per'#237'odo'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 247
                      Top = 137
                      Width = 342
                      Height = 13
                      Caption = 
                        'Saldo de cr'#233'dito fiscal acumulado a transportar para o per'#237'odo s' +
                        'eguinte'
                      FocusControl = DBEdit7
                    end
                    object DBEdit1: TDBEdit
                      Left = 219
                      Top = 21
                      Width = 134
                      Height = 21
                      DataField = 'DATA_MOVIMENTO'
                      DataSource = dtmCIAP.dsContCF
                      TabOrder = 0
                    end
                    object DBEdit3: TDBEdit
                      Left = 219
                      Top = 75
                      Width = 134
                      Height = 21
                      DataField = 'SLD_CRED'
                      DataSource = dtmCIAP.dsContCF
                      TabOrder = 2
                    end
                    object DBEdit4: TDBEdit
                      Left = 595
                      Top = 75
                      Width = 134
                      Height = 21
                      DataField = 'CRED_APR'
                      DataSource = dtmCIAP.dsContCF
                      TabOrder = 3
                    end
                    object DBEdit5: TDBEdit
                      Left = 219
                      Top = 102
                      Width = 134
                      Height = 21
                      DataField = 'CRED_RECEB'
                      DataSource = dtmCIAP.dsContCF
                      TabOrder = 4
                    end
                    object DBEdit6: TDBEdit
                      Left = 595
                      Top = 102
                      Width = 134
                      Height = 21
                      DataField = 'CRED_UTIL'
                      DataSource = dtmCIAP.dsContCF
                      TabOrder = 5
                    end
                    object DBEdit7: TDBEdit
                      Left = 595
                      Top = 129
                      Width = 134
                      Height = 21
                      DataField = 'SLD_CRED_FIM'
                      DataSource = dtmCIAP.dsContCF
                      TabOrder = 6
                    end
                    object GroupBox4: TGroupBox
                      Left = 14
                      Top = 156
                      Width = 750
                      Height = 266
                      Caption = 'UTILIZA'#199#195'O DE CR'#201'DITOS FISCAIS '#8211' ICMS'
                      TabOrder = 7
                      object Panel4: TPanel
                        Left = 24
                        Top = 75
                        Width = 705
                        Height = 41
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 0
                        object BitBtn7: TBitBtn
                          Left = 187
                          Top = 6
                          Width = 105
                          Height = 25
                          Hint = 'Incluir Item'
                          Caption = 'Incluir Item'
                          TabOrder = 0
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
                        object BitBtn8: TBitBtn
                          Left = 298
                          Top = 6
                          Width = 105
                          Height = 25
                          Hint = 'Alterar Item'
                          Caption = 'Alterar Item'
                          TabOrder = 1
                          OnClick = BitBtn8Click
                          Glyph.Data = {
                            6E030000424D6E030000000000006E0200002800000010000000100000000100
                            08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                            FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
                            5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
                            5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
                            8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
                            2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
                            C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
                            3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
                            EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
                            E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
                            CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
                            8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
                            BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
                            6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
                            F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
                            F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
                            A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
                            DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
                            B400010B9900010A95002732D000000081000202020202020202020202020202
                            020207070707070707070707070707020202076D594A585662515D5C5B6B0702
                            02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
                            02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
                            020234013E416705261B151130640D02020234016E484142241E1A1310310A02
                            02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
                            02023C010101016E4F6835181D06787676023C01010101017071322A27797581
                            878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
                            848B403A3A3A3A3A3A3A3A2C0202028C8902}
                        end
                        object BitBtn9: TBitBtn
                          Left = 409
                          Top = 6
                          Width = 105
                          Height = 25
                          Hint = 'Remover Item'
                          Caption = 'Remover Item'
                          TabOrder = 2
                          OnClick = BitBtn9Click
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
                        object BitBtn10: TBitBtn
                          Left = 354
                          Top = 6
                          Width = 75
                          Height = 25
                          Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                          Caption = 'Cancelar'
                          TabOrder = 4
                          Visible = False
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
                        object BitBtn11: TBitBtn
                          Left = 273
                          Top = 5
                          Width = 75
                          Height = 25
                          Hint = 'Clique neste bot'#227'o para salvar o item'
                          Caption = 'Salvar'
                          TabOrder = 3
                          Visible = False
                          OnClick = BitBtn11Click
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
                      object DBGrid2: TDBGrid
                        Left = 24
                        Top = 122
                        Width = 705
                        Height = 127
                        DataSource = dtmCIAP.dsItContCf
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'TIPO_UTIL'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NR_DOC'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'VL_CRED_UTIL'
                            Visible = True
                          end>
                      end
                      object Panel5: TPanel
                        Left = 2
                        Top = 15
                        Width = 746
                        Height = 59
                        Align = alTop
                        BevelOuter = bvNone
                        Enabled = False
                        TabOrder = 2
                        object Label13: TLabel
                          Left = 66
                          Top = 10
                          Width = 133
                          Height = 13
                          Caption = 'Tipo de utiliza'#231#227'o do cr'#233'dito'
                        end
                        object Label14: TLabel
                          Left = 24
                          Top = 37
                          Width = 175
                          Height = 13
                          Caption = 'N'#186' Doc utilizado na baixa de cr'#233'ditos'
                          FocusControl = DBEdit9
                        end
                        object Label15: TLabel
                          Left = 458
                          Top = 37
                          Width = 117
                          Height = 13
                          Caption = 'Total de cr'#233'dito utilizado'
                          FocusControl = DBEdit10
                        end
                        object DBEdit9: TDBEdit
                          Left = 205
                          Top = 34
                          Width = 134
                          Height = 21
                          DataField = 'NR_DOC'
                          DataSource = dtmCIAP.dsItContCf
                          TabOrder = 1
                        end
                        object DBEdit10: TDBEdit
                          Left = 581
                          Top = 34
                          Width = 134
                          Height = 21
                          DataField = 'VL_CRED_UTIL'
                          DataSource = dtmCIAP.dsItContCf
                          TabOrder = 2
                        end
                        object DBComboBox2: TDBComboBox
                          Left = 205
                          Top = 7
                          Width = 510
                          Height = 21
                          DataField = 'TIPO_UTIL'
                          DataSource = dtmCIAP.dsItContCf
                          ItemHeight = 0
                          Items.Strings = (
                            'MG01 - Dedu'#231#227'o;'
                            'MG21 - Compensa'#231#227'o;'
                            'MG41 - Transfer'#234'ncia;'
                            'MG61 - Restitui'#231#227'o;'
                            'MG81 - Estorno;'
                            'MG99 - Outros.')
                          TabOrder = 0
                        end
                      end
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 219
                      Top = 48
                      Width = 510
                      Height = 21
                      DataField = 'COD_AJ_APUR'
                      DataSource = dtmCIAP.dsContCF
                      ItemHeight = 0
                      Items.Strings = (
                        
                          'MG009999|Apura'#231#227'o do ICMS; Outros d'#233'bitos para ajuste de apura'#231#227 +
                          'o ICMS;|01012009|'
                        
                          'MG010001|Apura'#231#227'o do ICMS; Estorno de cr'#233'ditos; determinados por' +
                          ' ato administrativo ou judicial.|01012009|'
                        
                          'MG019999|Apura'#231#227'o do ICMS; Estorno de cr'#233'ditos para ajuste de ap' +
                          'ura'#231#227'o ICMS.|01012009|'
                        
                          'MG020001|Apura'#231#227'o do ICMS; Outros cr'#233'ditos; determinados por ato' +
                          ' administrativo ou judicial.|01012009|'
                        
                          'MG020002|Apura'#231#227'o do ICMS; Outros cr'#233'ditos; referentes ao Valor ' +
                          'total do cr'#233'dito presumido.|01012009|'
                        
                          'MG029999|Apura'#231#227'o do ICMS; Outros cr'#233'ditos para ajuste de apura'#231 +
                          #227'o ICMS.|01012009|'
                        
                          'MG030001|Apura'#231#227'o do ICMS; Estorno de d'#233'bitos; determinados por ' +
                          'ato administrativo ou judicial.|01012009|'
                        
                          'MG030002|Apura'#231#227'o do ICMS; Estorno de d'#233'bitos; referente ao CTRC' +
                          ' emitido pelo transportador, com ICMS de responsabilidade do rem' +
                          'etente/alienante.|01012009|'
                        
                          'MG039999|Apura'#231#227'o do ICMS; Estorno de d'#233'bitos para ajuste de apu' +
                          'ra'#231#227'o ICMS.|01012009|'
                        
                          'MG040001|Apura'#231#227'o do ICMS; Dedu'#231#227'o do imposto apurado; Utiliza'#231#227 +
                          'o de cr'#233'dito transferido, limitado a 30% do d'#233'bito.|01012009|'
                        
                          'MG040002|Apura'#231#227'o do ICMS; Dedu'#231#227'o do imposto apurado; Transfer'#234 +
                          'ncia entre 2 estabelecimentos do mesmo titular.|01012009|'
                        
                          'MG049999|Apura'#231#227'o do ICMS; Dedu'#231#245'es do imposto apurado na apura'#231 +
                          #227'o ICMS.|01012009|'
                        
                          'MG050000|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS Diferen'#231'a de Al' +
                          #237'quota apurado em verifica'#231#227'o fiscal.|01012009|'
                        
                          'MG050001|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS Diferen'#231'a de Al' +
                          #237'quota apurado ap'#243's o vencimento.|01012009|'
                        
                          'MG050100|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS de importa'#231#227'o a' +
                          'purado por verifica'#231#227'o fiscal.|01012009|'
                        
                          'MG050101|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS de importa'#231#227'o p' +
                          'ago no per'#237'odo, com emiss'#227'o de Nota de entrada no per'#237'odo poster' +
                          'ior.|01012009|'
                        
                          'MG050200|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS referente ao di' +
                          'ferimento, apurado por verifica'#231#227'o fiscal.|01012009|'
                        
                          'MG050201|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS referente ao di' +
                          'ferimento, apurado ap'#243's o vencimento.|01012009|'
                        
                          'MG050300|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS referente '#224' Ant' +
                          'ecipa'#231#227'o tribut'#225'ria, apurado por verifica'#231#227'o fiscal.|01012009|'
                        
                          'MG050301|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS referente '#224' Ant' +
                          'ecipa'#231#227'o tribut'#225'ria, apurado ap'#243's o vencimento.|01012009|'
                        
                          'MG050400|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS destacado a men' +
                          'or, apurado em verifica'#231#227'o fiscal.|01012009|'
                        
                          'MG050401|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS destacado a men' +
                          'or, apurado ap'#243's o vencimento.|01012009|'
                        
                          'MG059998|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS - Outros.|01012' +
                          '009|'
                        
                          'MG109999|Apura'#231#227'o do ICMS ST; Outros d'#233'bitos para ajuste de apur' +
                          'a'#231#227'o ICMS ST.|01012009|'
                        
                          'MG119999|Apura'#231#227'o do ICMS ST; Estorno de cr'#233'ditos para ajuste de' +
                          ' apura'#231#227'o ICMS ST.|01012009|'
                        
                          'MG129999|Apura'#231#227'o do ICMS ST; Outros cr'#233'ditos para ajuste de apu' +
                          'ra'#231#227'o ICMS ST.|01012009|'
                        
                          'MG139999|Apura'#231#227'o do ICMS ST; Estorno de d'#233'bitos para ajuste de ' +
                          'apura'#231#227'o ICMS ST.|01012009|'
                        
                          'MG149999|Apura'#231#227'o do ICMS ST; Dedu'#231#245'es do imposto apurado na apu' +
                          'ra'#231#227'o ICMS ST.|01012009|'
                        
                          'MG150000|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS Diferen'#231'a de' +
                          ' Al'#237'quota apurado em verifica'#231#227'o fiscal.|01012009|'
                        
                          'MG150001|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST de Difere' +
                          'n'#231'a de Al'#237'quota apurado ap'#243's o vencimento.|01012009|'
                        
                          'MG150400|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST destacado' +
                          ' a menor, apurado em verifica'#231#227'o fiscal.|01012009|'
                        
                          'MG150401|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST destacado' +
                          ' a menor, apurado ap'#243's o vencimento.|01012009|'
                        
                          'MG150500|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST interna, ' +
                          'apurado por verifica'#231#227'o fiscal.|01012009|'
                        
                          'MG150501|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST interna, ' +
                          'apurado ap'#243's o vencimento.|01012009|'
                        
                          'MG150502|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST interna p' +
                          'ago no per'#237'odo com emiss'#227'o de Nota de entrada no per'#237'odo posteri' +
                          'or.|01012009|'
                        
                          'MG150600|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST de transp' +
                          'orte, apurado por verifica'#231#227'o fiscal.|01012009|'
                        
                          'MG150601|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST de transp' +
                          'orte, apurado ap'#243's o vencimento.|01012009|'
                        
                          'MG159999|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST - Outros.' +
                          '|01012009|'
                        
                          'MG020003|Apura'#231#227'o do ICMS; Outros cr'#233'ditos; Incentivo fiscal a c' +
                          'ultura - lei 12733|01012009|'
                        
                          'MG050099|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS Diferen'#231'a de Al' +
                          #237'quota - outros|01012009|'
                        
                          'MG050199|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS de importa'#231#227'o -' +
                          ' outros|01012009|'
                        
                          'MG050299|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS referente a dif' +
                          'erimento - outros|01012009|'
                        
                          'MG050399|Apura'#231#227'o do ICMS; D'#233'bito Especial; ICMS referente '#224' Ant' +
                          'ecipa'#231#227'o tribut'#225'ria - outros|01012009|'
                        
                          'MG150099|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST de Difere' +
                          'n'#231'a de Al'#237'quota - outros|01012009|'
                        
                          'MG150599|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST interna -' +
                          ' outros|01012009|'
                        
                          'MG150699|Apura'#231#227'o do ICMS ST; D'#233'bito Especial; ICMS ST de transp' +
                          'orte - outros|01012009|')
                      TabOrder = 1
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [SPED080]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
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
              Hint = 'Clique para pesquisar - [SPED076]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SPED077]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              DataSource = dtmCIAP.dsContCF
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CONT_CRED_F'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_MOVIMENTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_AJ_APUR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SLD_CRED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CRED_APR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CRED_RECEB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CRED_UTIL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SLD_CRED_FIM'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [SPED078]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SPED079]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Top = 5
                Visible = False
                ExplicitTop = 5
              end
              inherited SpeedButton4: TSpeedButton
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Visible = False
              end
              inherited SpeedButton6: TSpeedButton
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Visible = False
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
                Visible = False
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
  inherited PopupMenu2: TPopupMenu
    Left = 662
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 622
    Top = 11
  end
end
