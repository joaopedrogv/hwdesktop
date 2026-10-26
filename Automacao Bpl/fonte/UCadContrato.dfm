inherited frmCadContrato: TfrmCadContrato
  Caption = 'Contratos'
  ClientHeight = 583
  ExplicitWidth = 806
  ExplicitHeight = 617
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 564
    ExplicitHeight = 564
    inherited Splitter2: TSplitter
      Height = 562
      ExplicitHeight = 562
    end
    inherited PanelLeft: TPanel
      Height = 562
      ExplicitHeight = 562
      inherited PageControl1: TPageControl
        Height = 560
        ExplicitHeight = 560
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 529
          inherited ScrollBox1: TScrollBox
            Height = 529
            ExplicitHeight = 529
            inherited PageControl3: TPageControl
              Height = 481
              ExplicitHeight = 481
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 450
                inherited ScrollBox3: TScrollBox
                  Height = 450
                  ExplicitHeight = 450
                  inherited GroupBox1: TGroupBox
                    Height = 441
                    Caption = ''
                    ExplicitHeight = 441
                    object GroupBox6: TGroupBox
                      Left = 3
                      Top = 11
                      Width = 771
                      Height = 126
                      TabOrder = 0
                      object Label6: TLabel
                        Left = 64
                        Top = 44
                        Width = 50
                        Height = 13
                        Caption = 'Descri'#231#227'o:'
                        FocusControl = DBEdit_Descricao
                      end
                      object Label_Codigo: TLabel
                        Left = 77
                        Top = 18
                        Width = 37
                        Height = 13
                        Caption = 'C'#243'digo:'
                        FocusControl = DBEdit_Codigo
                      end
                      object Label8: TLabel
                        Left = 58
                        Top = 70
                        Width = 56
                        Height = 13
                        Caption = 'Formul'#225'rios:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label10: TLabel
                        Left = 90
                        Top = 96
                        Width = 24
                        Height = 13
                        Caption = 'Tipo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit_Descricao: TDBEdit
                        Left = 120
                        Top = 41
                        Width = 285
                        Height = 21
                        Hint = 'Descri'#231#227'o dos contratos'
                        CharCase = ecUpperCase
                        DataField = 'DESCRICAO'
                        DataSource = DtmCadBasicos.dsContratos
                        MaxLength = 69
                        TabOrder = 1
                      end
                      object DBEdit_Codigo: TDBEdit
                        Left = 120
                        Top = 14
                        Width = 67
                        Height = 21
                        Hint = 'C'#243'digo sequencial dos contratos'
                        CharCase = ecUpperCase
                        DataField = 'CODIGO'
                        DataSource = DtmCadBasicos.dsContratos
                        Enabled = False
                        TabOrder = 0
                      end
                      object DBComboBox_Tabela: TDBComboBox
                        Left = 120
                        Top = 68
                        Width = 285
                        Height = 19
                        Hint = 'Formul'#225'rio dos contratos'
                        Style = csOwnerDrawFixed
                        DataField = 'FORMULARIO'
                        DataSource = DtmCadBasicos.dsContratos
                        ItemHeight = 13
                        Items.Strings = (
                          'CONTRATO DE COMPRA DE VE'#205'CULO'
                          'CONTRATO DE CONSIGNA'#199#195'O'
                          'CONTRATO DE RESERVA DE DOM'#205'NIO DE USADOS'
                          'CONTRATO DE RESERVA DE DOM'#205'NIO DE NOVOS'
                          'CONTRATO DE VENDA DE USADOS'
                          'CONTRATO DE VENDA DE NOVOS'
                          'INTERMEDIA'#199#195'O DE VENDA DE USADOS'
                          'INTERMEDIA'#199#195'O DE VENDA DE NOVOS')
                        TabOrder = 2
                      end
                      object DBComboBox_Campo: TDBComboBox
                        Left = 120
                        Top = 93
                        Width = 285
                        Height = 19
                        Hint = 'Tipos dos contratos'
                        Style = csOwnerDrawFixed
                        DataField = 'TIPO'
                        DataSource = DtmCadBasicos.dsContratos
                        ItemHeight = 13
                        Items.Strings = (
                          'RESERVA DE DOM'#205'NIO'
                          'VE'#205'CULO USADO NA TROCA'
                          'VE'#205'CULO RODANDO'
                          'VE'#205'CULO USADO NA TROCA E RODANDO'
                          'TERMO DE COMPROMISSO'
                          'CONTROLE INTERNO'
                          'CONTROLE INTERNO - INTERMEDIA'#199#195'O DE NOVOS')
                        TabOrder = 3
                      end
                    end
                    object TGroupBox
                      Left = 3
                      Top = 137
                      Width = 771
                      Height = 282
                      TabOrder = 1
                      object Label7: TLabel
                        Left = 84
                        Top = 20
                        Width = 30
                        Height = 13
                        Caption = 'Texto:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBRichEdit_Texto: TDBRichEdit
                        Left = 120
                        Top = 17
                        Width = 641
                        Height = 248
                        DataField = 'TEXTO'
                        DataSource = DtmCadBasicos.dsContratos
                        TabOrder = 0
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 481
              ExplicitTop = 481
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS177]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS184]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 529
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS176]'
            end
            inherited BitBtn2: TBitBtn
              Left = 691
              ExplicitLeft = 691
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS177]'
            end
            object BitBtn_Editor: TBitBtn
              Left = 579
              Top = 11
              Width = 55
              Height = 49
              Hint = 'Novo cadastro no editor de texto - [BAS203]'
              Caption = '&Editor'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = BitBtn_EditorClick
              Glyph.Data = {
                76060000424D7606000000000000360400002800000018000000180000000100
                08000000000040020000120B0000120B0000000100000000000000000000FFFF
                FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
                35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
                6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
                7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
                8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
                9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
                360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
                6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
                68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
                FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
                6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
                56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
                E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
                E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
                CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
                7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
                D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
                88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
                4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
                9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
                D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
                7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
                5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
                4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
                4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
                F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
                FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
                4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
                9D0004689A000459830005679800064F7500182A33001B506E00315065003547
                56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
                B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
                BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
                0404040404040404040404040404040404043506060606060606060606060606
                06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
                0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
                5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
                ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
                04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
                CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
                65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
                04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
                61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
                1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
                0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
                01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
                172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
                FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
                0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
                78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
                FA040404040404040404040404040404040404040404F8FC0404}
              Layout = blGlyphTop
            end
          end
          inherited Panel1: TPanel
            Height = 456
            ExplicitHeight = 456
            inherited Splitter1: TSplitter
              Height = 395
              ExplicitHeight = 398
            end
            inherited DBGrid1: TDBGrid
              Height = 395
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CONTRATO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FORMULARIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TEXTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_ARQUIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS178]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS180]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS181]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Realizar manuten'#231#227'o no editor - [BAS203]'
                Glyph.Data = {
                  AA050000424DAA050000000000006A0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000CD000000CD00000000000000FFFF
                  FF007F7EB0007B79AF00FF00FF00FBFAFB00E2D9DC00A3676B00A4676900A669
                  6B00A5686A00A6696A00A5696A00A66A6B00AA6F7000AA707000AF828200FFFE
                  FE00AB7572009F6B6500A36B6400B07F7600A56B5F00A7756B00AC695900AC7F
                  7500AF6A5600811E00008320010083210100B5837400A77D7000BD9082008E2F
                  0C00B67660008A2B0700983E19009A442000DCC2B80095380F0095391100963A
                  1300963B1300963C1500963D1600973D1700A4512C00BF7D6000BC826800AF8B
                  7B00B8755500CF9D8400B7928000D5B19F00CF906C00CE957500E6D5CC00EEE0
                  D800FAF3EF00B0643700C4866200D1926D00D59A7700DCA17D00C5A48F00E0BB
                  A500F6E9E100F3E7E000B4642F00DA9D7500DCA37E00E6C7B200FEF7F200D387
                  4900D4894A00D18A4F00E6A97800E7AB7900E9B08100E7B08200E7C6AC00CBAF
                  9800E1974E00FAF0E600FCF8F400E0AB6F00EBC59C00F4E3D100F8F0E700F0D0
                  A900E0C2A000F4D7B500F0D5B400F2D9BB00F3DABC00E9BC7F00EAC08800EDC6
                  9300EECB9E00F8E5CC00FFF4E500EEC28000F2C98C00F3CE9700F6D3A000F4DA
                  B500F8E3C500EFC48000EFC58100EFC58300F0C78800F8D39600F2CE9500F4D4
                  A000F3D3A000FBDCAD00F6D9AB00FEE9C700FCEACE00F4CB8200F3CA8200F4CC
                  8300EEC58000F4CC8600F6CE8900F6D19100F0CE9300F8D9A000FAE2B700FCD4
                  8400FFE0A400FBE0AD00EBD9B700FFFEFC00F8D48400FFF6D800FFFEF800FFFC
                  E600FFFED700FFFFF600FFFFFC00004F0000004C000000520100015503000154
                  0300025C040002580300025C0500025B050003720800036E070003690700035F
                  060005890C00068F0D0005620A0004800B0005840C000698100006920E00057E
                  0C00056F0C00067F0D00097811000EA51D000B7B16000A6E12000F821C0015A4
                  280018A92D00138423001BB733001CA035001A922F0023BC41002DC24F0030C6
                  560035C660003FDC6F003ED96F0042E0750045E67A00F4F6FA002E50FC00889E
                  FF00889DFC002D4EFA002D4DF4002D4BF2002D48E6002C46DE008692D700001E
                  FF000222FF000222FE000221FC000323FE000324FE000323FB002C46E6002B44
                  DE00828CDC008087CF007E84D50004040404040404040404040404080D090B0B
                  0C0C0C0B0B08040404040404040404040404040F8A80837F7D7B7886810C0404
                  04040404040404040404040E875DCBC8C7C90365770C04040404040404040404
                  0404041289CAC3C1C1C1C402770C04040404040404040404040404198BBDC1C1
                  C1C1C1BF7C0C040404040404040404040404041E01C5C1C1C1C1C1C76F0C0404
                  04040404040404040404043701BBC1C1C1C1C1BE820B04040404040404040404
                  0404043E01BAC2C1C1C1C3C05A0A040404040404040404040404043F0101B9B8
                  C6BCCC5131070404040404040404040404040446010101018558201413180808
                  08080808080808080808044F0101010101B7104B4A040875697471706E6C7A79
                  6B08044E053A3A3A54391522040408765E5C596261605F6C6B08044C363D3D3D
                  3D9CA704040408502D2C2B2A292827446B080404040404048FAEB59004041764
                  2E1B1B1B1B1B1C556D0804040404048DABB4B6B09004178C471D1B1B1B1B3B7E
                  66080404040490A8B2B3B1AAA990308C53321B1B1B2356726708040404049090
                  90ADAF9090903D8C4842211B1B3C5B7368080404040404048EA6AC9004043D8C
                  0111331B24636A84400804040404040491A4A5900404458C0101112541573534
                  1F0804040404040499A39F900404458C0101014388381616161A040404040404
                  98A09E9004044D8C010101010106165249040404040404979B9A900404044D3A
                  3A3A3A3A3A26162F0490909194A2A19D9690040404044D3D3D3D3D3D3D3D1604
                  0404909092959293910404040404}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [BAS182]'
                OnClick = SpeedButton25Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 395
              ExplicitHeight = 395
              inherited ScrollBox2: TScrollBox
                Height = 378
                ExplicitHeight = 378
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 529
        end
      end
    end
    inherited PanelFlash: TPanel
      Height = 562
      ExplicitHeight = 562
      inherited bMarketingHW: TBitBtn
        Top = 540
        ExplicitTop = 540
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 564
    ExplicitTop = 564
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
