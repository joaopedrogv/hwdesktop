inherited frmCadGrade: TfrmCadGrade
  Caption = 'Grades de Estoque'
  ClientHeight = 641
  ClientWidth = 910
  ExplicitWidth = 926
  ExplicitHeight = 680
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 910
    Height = 622
    ExplicitWidth = 910
    ExplicitHeight = 622
    inherited Splitter2: TSplitter
      Height = 620
      ExplicitHeight = 620
    end
    inherited PanelLeft: TPanel
      Width = 905
      Height = 620
      ExplicitWidth = 905
      ExplicitHeight = 620
      inherited PageControl1: TPageControl
        Width = 903
        Height = 618
        ExplicitWidth = 903
        ExplicitHeight = 618
        inherited TabSheet1: TTabSheet
          ExplicitWidth = 895
          ExplicitHeight = 587
          inherited ScrollBox1: TScrollBox
            Width = 895
            Height = 587
            ExplicitWidth = 895
            ExplicitHeight = 587
            inherited PageControl3: TPageControl
              Width = 895
              Height = 539
              ExplicitWidth = 895
              ExplicitHeight = 539
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 887
                ExplicitHeight = 508
                inherited ScrollBox3: TScrollBox
                  Width = 887
                  Height = 508
                  ExplicitWidth = 887
                  ExplicitHeight = 508
                  inherited GroupBox1: TGroupBox
                    Width = 883
                    Height = 504
                    Align = alClient
                    Caption = 'Grade'
                    ExplicitWidth = 883
                    ExplicitHeight = 504
                    object pnGradeEC: TPanel
                      Left = 2
                      Top = 15
                      Width = 879
                      Height = 487
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      OnEnter = pnGradeECEnter
                      object GroupBoxEC: TGroupBox
                        Left = 0
                        Top = 88
                        Width = 879
                        Height = 113
                        Align = alTop
                        Caption = 'E-Commerce (Varia'#231#227'o)'
                        TabOrder = 1
                        object Label9: TLabel
                          Left = 32
                          Top = 60
                          Width = 33
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Tipo 1:'
                        end
                        object Label10: TLabel
                          Left = 307
                          Top = 60
                          Width = 59
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Descri'#231#227'o 1:'
                        end
                        object btEditarGrade: TSpeedButton
                          Left = 277
                          Top = 57
                          Width = 23
                          Height = 48
                          Hint = 'Editar - [PRO313]'
                          Glyph.Data = {
                            6E030000424D6E030000000000006E0200002800000010000000100000000100
                            08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                            FF00FF00FF007C7078008D787F0085787C00A3878C00B7818300B47F8100A877
                            79008F676900956D6F007D555600996E6F009D6C6C00A47272009D6D6D009E6E
                            6E00C68E8E00C8929200C48F8F00C38E8E00C18D8D00A1767600AC808000D6A2
                            A200DAA6A600D9A5A500D8A4A400E9B5B500E8B5B500ECB9B900965F5D009E74
                            7300A3797800EEB7B500F3BCBB00E5A6A300B2787300E1D0CE00E4D4D200B481
                            7600B8857A00AA7A71007959530076575100BA8E850073564F0077595200E3CF
                            C90049464500CF9B8600FAF5F300DAC5BC00CB9A8200F9F5F300DCA88700E0CF
                            C500FCF7F400FBF6F300E3B18E00E8D9CE00FEF9F500FDF8F400FCF7F300EDBD
                            9200F0E4D900FBF3EC00FAEFE400FBF3EB00FEF9F400FDF8F300FFFEFD00FAEF
                            E300DCA76A00F8E7D300B0A59800F9EBDA00F2E5D600FBF4EC00BFA889009D8B
                            7300D1BCA000E4CFB400F4E1C900F4EBDF00FDF9F400E4C39300E4C59900D0B4
                            8D00AF997800DAC09A00A794790093836B00CDB79800AE9C8200FEF3E300FFF7
                            EB00FDF6EC00F3D19900EECC9700EDCB9600E9C89600DCBD8D00D9BC8C00C5AC
                            8600BAA3800095856C00FDEFD900EECD950066625B00FFFEFC00FFFCF400FFFE
                            F900FFFFFD00A5B3B1005160610019ADCC000FCAF40010A5CF003392B300469C
                            BA003872860000A4E60004A8E600097CA8001B617D0029799A00373C3E001855
                            6F00077DCD00585C60000936C900204ADD00092CC300021EAA004860F1000318
                            AE000416AA00192DC4003E4BDB00000099000202020202020202020202020202
                            020207070707070707070707070707020202076C5453525E5B58666564630702
                            020229604B3280745F50595765630702020229614D4C7E7D816E5C69676D0702
                            02022E70444E7A7F040B2C516A68080202022E724F49730325130F2D6B5A0902
                            020236013E435505231A15112F5D0D0202023601483F4342221D1B1410300A02
                            02023801014846453D211E1C160E0C0202023801010148564539171F19122083
                            02023C0101010148476235182406787575023C01010101016F71312B2679767B
                            878D4101010101010101282A4A777C848689413A403B3B343737272A33028288
                            858A4138383838383838382A0202028C8B02}
                          OnClick = btEditarGradeClick
                        end
                        object Label11: TLabel
                          Left = 32
                          Top = 87
                          Width = 33
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Tipo 2:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object Label12: TLabel
                          Left = 307
                          Top = 87
                          Width = 59
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Descri'#231#227'o 2:'
                        end
                        object lbVariacaoSimples: TLabel
                          Left = 70
                          Top = 18
                          Width = 423
                          Height = 13
                          Caption = 
                            'Para utilizar varia'#231#227'o simples no E-Commerce deve informar os ca' +
                            'mpos Tipo e Descri'#231#227'o.'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object lbVariacaoComposta: TLabel
                          Left = 70
                          Top = 37
                          Width = 513
                          Height = 13
                          Caption = 
                            'Para utilizar varia'#231#227'o dupla no E-Commerce deve informar os camp' +
                            'os Tipo, Descri'#231#227'o, Tipo 2 e Descri'#231#227'o 2.'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object lbGradeDupla: TLabel
                          Left = 772
                          Top = 88
                          Width = 24
                          Height = 13
                          Hint = 'Habilitar cadastro grade dupla'
                          Caption = 'Hab'
                          FocusControl = ckGradeDupla
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clBlack
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          OnClick = LabelSeqECClick
                        end
                        object DBComboBox1: TDBComboBox
                          Left = 71
                          Top = 57
                          Width = 203
                          Height = 21
                          Hint = 'Tipo da Grade'
                          Style = csDropDownList
                          DataField = 'TIPO_EC'
                          DataSource = dtmProdutos.dsGrade
                          ItemHeight = 13
                          TabOrder = 0
                          OnExit = DBComboBox1Exit
                        end
                        object DBEdit4: TDBEdit
                          Left = 372
                          Top = 57
                          Width = 381
                          Height = 21
                          Hint = 'Descri'#231#227'o exibida no e-commerce'
                          DataField = 'DESCRICAO_EC'
                          DataSource = dtmProdutos.dsGrade
                          TabOrder = 1
                        end
                        object DBComboBox2: TDBComboBox
                          Left = 71
                          Top = 84
                          Width = 203
                          Height = 21
                          Hint = 'Tipo da Grade 2'
                          Style = csDropDownList
                          DataField = 'TIPO_EC1'
                          DataSource = dtmProdutos.dsGrade
                          ItemHeight = 13
                          TabOrder = 2
                          OnExit = DBComboBox2Exit
                        end
                        object DBEdit5: TDBEdit
                          Left = 372
                          Top = 84
                          Width = 381
                          Height = 21
                          Hint = 'Descri'#231#227'o exibida no e-commerce'
                          DataField = 'DESCRICAO_EC1'
                          DataSource = dtmProdutos.dsGrade
                          TabOrder = 3
                        end
                        object ckGradeDupla: TCheckBox
                          Left = 756
                          Top = 87
                          Width = 17
                          Height = 15
                          Hint = 'Habilitar grade/varia'#231#227'o dupla E-Commerce - [PRO425]'
                          BiDiMode = bdLeftToRight
                          Color = clBtnFace
                          Ctl3D = True
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentBiDiMode = False
                          ParentColor = False
                          ParentCtl3D = False
                          ParentFont = False
                          TabOrder = 4
                          OnClick = ckGradeDuplaClick
                        end
                      end
                      object pnBotoesEC: TPanel
                        Left = 0
                        Top = 438
                        Width = 879
                        Height = 49
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 2
                        object LabelSeqEC: TLabel
                          Left = 21
                          Top = 23
                          Width = 148
                          Height = 13
                          Caption = 'Cadastro Sequ'#234'ncial  (F2)'
                          FocusControl = CheckCadSeqEC
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clTeal
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          OnClick = LabelSeqECClick
                        end
                        object btOpcoes: TSpeedButton
                          Left = 480
                          Top = 10
                          Width = 23
                          Height = 25
                          Caption = '...'
                          OnClick = btOpcoesClick
                        end
                        object BitBtn7: TBitBtn
                          Left = 304
                          Top = 10
                          Width = 75
                          Height = 25
                          Hint = 'OK - [PRO102]'
                          Caption = '&OK'
                          TabOrder = 0
                          OnClick = BitBtn7Click
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
                        object BitBtn8: TBitBtn
                          Left = 385
                          Top = 10
                          Width = 75
                          Height = 25
                          Hint = 'Cancelar'
                          Caption = '&Cancela'
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
                        object CheckCadSeqEC: TCheckBox
                          Left = 5
                          Top = 22
                          Width = 17
                          Height = 15
                          BiDiMode = bdLeftToRight
                          Color = clBtnFace
                          Ctl3D = True
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clTeal
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentBiDiMode = False
                          ParentColor = False
                          ParentCtl3D = False
                          ParentFont = False
                          TabOrder = 2
                          OnClick = CheckCadSeqECClick
                        end
                      end
                      object Panel4: TPanel
                        Left = 0
                        Top = 0
                        Width = 879
                        Height = 88
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label6: TLabel
                          Left = 28
                          Top = 12
                          Width = 37
                          Height = 13
                          Caption = 'C'#243'digo:'
                          FocusControl = DBEdit1
                        end
                        object Label7: TLabel
                          Left = 6
                          Top = 39
                          Width = 59
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Descri'#231#227'o 1:'
                          FocusControl = DBEdit2
                        end
                        object Label8: TLabel
                          Left = 6
                          Top = 66
                          Width = 59
                          Height = 13
                          Caption = 'Descri'#231#227'o 2:'
                          FocusControl = DBEdit3
                        end
                        object DBEdit1: TDBEdit
                          Left = 71
                          Top = 9
                          Width = 134
                          Height = 21
                          Hint = 'C'#243'digo da grade'
                          DataField = 'COD_GRADE'
                          DataSource = dtmProdutos.dsGrade
                          Enabled = False
                          TabOrder = 0
                        end
                        object DBEdit2: TDBEdit
                          Left = 71
                          Top = 36
                          Width = 393
                          Height = 21
                          Hint = 'Primeira descri'#231#227'o da grade'
                          CharCase = ecUpperCase
                          DataField = 'DESCRICAO'
                          DataSource = dtmProdutos.dsGrade
                          TabOrder = 1
                          OnExit = DBEdit2Exit
                        end
                        object DBEdit3: TDBEdit
                          Left = 71
                          Top = 63
                          Width = 393
                          Height = 21
                          Hint = 'Segunda descri'#231#227'o da grade'
                          CharCase = ecUpperCase
                          DataField = 'DESCRICAO1'
                          DataSource = dtmProdutos.dsGrade
                          TabOrder = 2
                          OnExit = DBEdit3Exit
                        end
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 539
              Width = 895
              ExplicitTop = 539
              ExplicitWidth = 895
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [PRO102]'
                TabOrder = 0
              end
              inherited BitBtn5: TBitBtn
                TabOrder = 1
              end
              inherited BitBtn6: TBitBtn
                TabOrder = 2
              end
              inherited CheckCadSeq: TCheckBox
                TabOrder = 3
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitWidth = 895
          ExplicitHeight = 587
          inherited GroupBox3: TGroupBox
            Width = 895
            ExplicitWidth = 895
            inherited imgInformation: TImage
              Left = 869
              ExplicitLeft = 803
            end
            object btSelectAll: TSpeedButton [6]
              Left = 604
              Top = 46
              Width = 23
              Height = 21
              Hint = 'Selecionar todos'
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
              Left = 631
              Top = 46
              Width = 23
              Height = 21
              Hint = 'Desfazer sele'#231#227'o'
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PRO095]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRO096]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
            object ckLixeira: TCheckBox
              Left = 692
              Top = 9
              Width = 76
              Height = 17
              Hint = 'Lixeira'
              Caption = 'Lixeira (F6)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = ckLixeiraClick
            end
          end
          inherited Panel1: TPanel
            Width = 895
            Height = 514
            ExplicitWidth = 895
            ExplicitHeight = 514
            inherited Splitter1: TSplitter
              Height = 453
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Width = 602
              Height = 453
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_GRADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 891
              ExplicitWidth = 891
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRO097]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO098]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PRO101]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Atualizar informa'#231#245'es das grades - [PRO453]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000000000392918003131
                  3100EFA5390021214A007B5A4A0073635200EFA55200FFB5520018425A00846B
                  5A000842630021526B0052636B00E7AD6B00F7BD6B00AD7B7300AD847300B584
                  730029637B00AD7B7B0084847B008C847B00AD738400AD7B8400B57B8400B584
                  8400BD848400E7B58400BD848C00C68C8C009C948C00CE948C00DEA58C00EFC6
                  8C00D69C9400DEA59400EFCE94004A6B9C009C9C9C00EFCE9C00CEADA500EFCE
                  A500F7D6A500CEBDAD00F7D6AD00E7CEB500F7D6B500F7DEB5003139BD00DEC6
                  BD00E7CEBD00EFD6BD00F7DEBD008CB5C600E7CEC600EFCEC600EFDEC600F7DE
                  C600F7E7C600E7D6CE00E7DECE00F7DECE00F7E7CE0010A5D600D6D6D600E7D6
                  D600EFDED600F7E7D60042A5DE00DEDEDE00F7E7DE00F7EFDE000010E700F7EF
                  E700299CEF00F7EFEF00FFF7EF002973F70042E7F700FFF7F700FFFFF700FF00
                  FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151131919
                  191919191919191919191919191919195151515151093838382F2E2C2A272724
                  24242424242424195151515151093838434343434343434343434343423E4219
                  5151515151094238212121212121212121212121424242195151515151094242
                  4239343434343434343434344242421951515151510942424343434343434343
                  4343434342424219515151515109423C2121212121010C26262621213E424219
                  51515151510F313E3E3E3E3E400400120C2C3E3E3E423419515151515109261E
                  1E262626264035534D0B26262626241951510404040404040404040404265253
                  4D4D0B040404040404040451510F413B3B494947433E3E3F4E4D4D082C292719
                  51040451510F313102020202020202263F4E4D4D0B2629195104045151092626
                  2727272727272727273F4E4D4D0A291951040404040404040404040404040404
                  04043F4E4D30010404045151510F545454545454545454545454263F44151401
                  5151515151115054545454545454545454543E3E095449050351515151115454
                  21212121212121212121213C2B1E2D124D305151511154545454545454545454
                  54545454540F254A4D305151511F5454545454545454504F5454545454540F48
                  48515151511F545443434343434343434343434349490F5151515151511F5454
                  2121212121212121212121214B490F5151515151511F54545454545454545454
                  504F4F4C4C4B0F5151515151511F545454545454545454545454504F4F4C0F51
                  51515151511F1111111111111111111111111111111109515151}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [PRO100]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 453
              ExplicitHeight = 453
              inherited ScrollBox2: TScrollBox
                Height = 436
                ExplicitHeight = 436
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitWidth = 895
          ExplicitHeight = 587
        end
        object tsAlterDadosProc: TTabSheet
          Caption = 'tsAlterDadosProc'
          ImageIndex = 3
          object Panel52: TPanel
            Left = 0
            Top = 0
            Width = 895
            Height = 110
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object btVoltarDadosProc: TBitBtn
              Left = 604
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btVoltarDadosProcClick
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
          object GroupBox79: TGroupBox
            Left = 0
            Top = 110
            Width = 895
            Height = 79
            Align = alTop
            Caption = 'Grade'
            TabOrder = 1
            Visible = False
            object DBText57: TDBText
              Left = 152
              Top = 14
              Width = 75
              Height = 17
              DataField = 'COD_GRADE'
              DataSource = dtmProdutos.dsGrade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText58: TDBText
              Left = 152
              Top = 33
              Width = 444
              Height = 17
              DataField = 'DESCRICAO'
              DataSource = dtmProdutos.dsGrade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label450: TLabel
              Left = 102
              Top = 14
              Width = 44
              Height = 13
              Caption = 'Codigo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label456: TLabel
              Left = 602
              Top = 33
              Width = 37
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Tipo 1:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object DBText60: TDBText
              Left = 645
              Top = 33
              Width = 106
              Height = 17
              DataField = 'TIPO_EC'
              DataSource = dtmProdutos.dsGrade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 78
              Top = 33
              Width = 68
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Descri'#231#227'o 1:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object Label14: TLabel
              Left = 602
              Top = 52
              Width = 37
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Tipo 2:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object DBText61: TDBText
              Left = 645
              Top = 52
              Width = 106
              Height = 17
              DataField = 'TIPO_EC1'
              DataSource = dtmProdutos.dsGrade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 78
              Top = 52
              Width = 68
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Descri'#231#227'o 2:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object DBText59: TDBText
              Left = 152
              Top = 52
              Width = 444
              Height = 17
              DataField = 'DESCRICAO1'
              DataSource = dtmProdutos.dsGrade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Panel128: TPanel
            Left = 0
            Top = 189
            Width = 895
            Height = 398
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object pnCenterAlterDadosProd: TPanel
              Left = 0
              Top = 0
              Width = 891
              Height = 54
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButtonAlterarProduto: TSpeedButton
                Left = 55
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro - [PRO097]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000010000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330000000000000000000000000000000000000000
                  333333330036322F2D2C2825252221211F1D1D1A1A1717003333333300363636
                  3232322F2F252221211F1D1D1A1A17003333333300363636363632322F2F2525
                  21211F1D1D1A1A00333333330036271616161616160710161616161616161A00
                  3333333300363636363636363609051110252525251D1D003333333300362716
                  1616161616242035300F16161616250033333333003636363636363636363435
                  30300D2525252500333333330036271616161616161616233130300F16162500
                  33333333003636363636363636363232233130300B2525003333333300362716
                  161616161616161616233130300F250033333333003636363636363636363232
                  2F2F233130300D003333333300362A1B1B1B1B1B1B1B1B1B1919182331301E07
                  333333330036363636363636363636363632322F232613120733333300363636
                  36363636363636363632322F2F0C362B0A083333003636363636363636363636
                  3632322F2D2D141C113033330102020202020202020202020202020202020215
                  2E3033330E0000000000000000000000000000000000000E2929333333040404
                  0404040404040404040404040403063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarProdutoClick
              end
              object SpeedButtonAlterarProduto2: TSpeedButton
                Left = 2
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro Selecionados  - [PRO453]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000000000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                  333333330D3636363636363636363636363636363636360D333333330D363636
                  3636363636363636363636363636360D333333330D3636363636363636363636
                  363636363636360D333333330D3636363636363636071036363636363636360D
                  333333330D3636363636363636090511103636363636360D333333330D363636
                  3636363636242035300F36363636360D333333330D3636363636363636363435
                  30300D363636360D333333330D36363636363636363636233130300F3636360D
                  333333330D3636363636363636363632233130300B36360D333333330D363636
                  363636363636363636233130300F360D333333330D3636363636363636363632
                  2F2F233130300D0D333333330D36363636363636363636363636362331301E07
                  333333330D36363636363636363636363632322F23261312073333330D363636
                  36363636363636363632322F2F0C362B0A0833330D3636363636363636363636
                  3632322F2D2D141C113033331111111111111111111111111111111111111115
                  2E303333110D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D112929333333111111
                  1111111111111111111111111111063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarProduto2Click
              end
              object btExcluirRegistro: TSpeedButton
                Left = 108
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Apagar Registro - [PRO098]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B000000010000000100000031DE00FF00
                  FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010100000101010101010101010101010101010101010101010000
                  0001010100000001010101010101010101010101010000000101010100000000
                  0101010101010101010101000000000101010101000000000001010101010101
                  0101000000000101010101010100000000000101010101010100000000010101
                  0101010101010200000000010101010100000000010101010101010101010101
                  0000000001010000000000010101010101010101010101010100000000000000
                  0000010101010101010101010101010101010000020002000001010101010101
                  0101010101010101010101000000020001010101010101010101010101010101
                  0101000002000002020101010101010101010101010101010100000200020202
                  0002010101010101010101010101010102020200020101020202020101010101
                  0101010101010102020002020101010102020202010101010101010101010202
                  0202020101010101010102020201010101010101010202020202010101010101
                  0101010202020101010101010202020202010101010101010101010101020101
                  0101010202020202010101010101010101010101010101010101010202020201
                  0101010101010101010101010101010101010102020201010101010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010101010101010101010101010101010101010101}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton2Click
              end
              object btLixeiraCheia: TSpeedButton
                Left = 162
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Ver registros da lixeira - [BAS018]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFEFFFFFFFFFFFFFFFFFEFFE8E8E0D1D1C9DDDCDFDEDFE1B7BEC2CCCDCEE3D9
                  DDF6EBEEFFF8FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFBC3C0B6CBC8B8D7CFB8EAE3B3E3E1B0
                  D0D1A4BFBF9FB2AE9D95928B98A097BDCDC1FCFAFDFFFEFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E2D0F8EFD9F7E7CDFB
                  E4C6FBE6B4FDE3B4EDD1AADBBEA1EAD2BAF8EED5DFE1C2B0B899948883B8AEAD
                  FEFAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFCFCF5F8F5
                  D5FCEFCCFDE6C5FDE0C3E6CBBADBB4AEE8B5B7FAD2D0DFB5A7FCDDC3FDE4C3FD
                  E8C8F7EBDCC2B8AE8E867ED1D0CEFCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFDE1D7B6FEF6CDFDEAC3FDE3C4EACDB6D4C5B4D4BBB6DFC0C0D6C7BBE5EA
                  CAEBF6D3F4FBD9F7F9DFE9F5D4F4F4D9ECE3D18F897FCBD0CCFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFEF7D4BC93E9CFA2FFF1CDEAD2BCE4CFC5DCC9C6D5C1C1
                  D6D5C566975E5AC45D28AA2D2BA3344EAC54B2E4ADE9FCD0FCF9DBF1EADA9691
                  8BFDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D7DCB588D9B082F4D3B5F5E1D8DE
                  D1D7F1CEDFE4C5D0D3DDC552A44D05990700A200019202178B191F8527B3DFA0
                  FBFCD3FEEFD8A99B92E5E7E4FFFFFFFFFFFFFFFFFFFFFFFFF8DEBBE7B78AF2C5
                  9CFFF0D8ECE0DFE2DCE7F7D9D8EECDC4C9D4A7369B040995000498046CC96AAA
                  D8A649AF57478D39EFF7C3DDC6A4B5A293DBD9D8FDF2FDFFFFFFFFFFFFFFFFFD
                  F7C8ACE9B99AFCEFD9F0F3EAEDEBEEFAE8EFF6D4CBCFAEA1BBCE963499011391
                  03009E0555B75DEAF8EADDF6DD8CBB79AEC789D6D190BEAE89CDCACCECE5ECFF
                  FFFFFFFFFFFFF8ECF1C1A8F4D3B7FFFFEFF7FEFAF9F4F8FDE2F1DE9CBAD3C2B6
                  D7E7C1B7CAA585B77B55B74F50A846C6E5B8E6F7DFDCFAC6B0BF8CEFDBA4D7BA
                  9BBBB1B5E8DDE8FDFDFDFFFFFFF6EADBE8C5ADFDF0D7FBFEEEFAFEFCFFF9FDE2
                  B4C1E09DBACEBBB0B3CA9EE3EFD1F1E9E0F6F1E59CC38EA1E497BCE3B5CAF3B5
                  E4E9C2FEDDB6F3C7B3AD9DA1F2FFF0FFFFFFFFFFFFEFDDD0E8D1B9FFFEE7F7FC
                  EEFBFEFBFAE9EBCB9C9FD5ACA1DFB4AFC8CCA788C479DDF9D2FBEAF6A5BDA509
                  85141E841D2C841CCFEDB4F4D6AEFECFBFA99398F3FCEDFFFFFFFFFFFFE7D7C8
                  F6EAD0FEFFE7F8FFEFF9FCF5D5C3C1D0A9A5D2B2A6E6B3BDE4E0C841973966CA
                  68D4FAD4D1FFD621A92B0198020F9608BDFBAEE7DCA9FFD8C0AC9697EDF3E4FF
                  FEFFFFFFFFE8DCC9FEF9DEFFFEE5FCFEEDF9F8ECE5D8CDF8E8E0FDE2F3E2CBD9
                  CBD2C5A9DCA71C841C139D131FA319198B0E069A05049304B3FAADEEEDB8FEE0
                  C1AD9B97EFF2E5FFFEFFFFFFFFF2E6CEFFFFE0FFFDDFFEFDEAFCFBEBFDFCE9FE
                  FEECFCF5FDE3EDE9DEE7E1DFE0DE9FCA9C1B8F1911900929851824921D208B1E
                  C2F2C0F4EFC6FFEBCAB2AA9DE2EBDAFFFFFFFFFFFFFFFADFFDFAD6FEFCDCFDF8
                  DDFAF9E5F8FBE4F1FCE0E5FFE4EAFFEAF7FAF6F1DEEDF0E9ECD8F9D5A2DCA199
                  D898CEFFC795CC92D3E9D1FFF8DDFFF5D5BABAA7D3E0CCFFFFFFFFFFFFFFFFF0
                  F6FDDDF3FDD9F7FEDBFAFDE2F4FCE7EEFEEEDEFFF3E7FFFAF5FFFCFCFAF8F2EE
                  E8F5F8EBF9FFF3F5FFF1F3FDF9F3FBF2F5F8E8FFFEE5FDFADDCBC9B4CFCEC0FF
                  FCFFFFFFFFFFFCE3FDFDDBFDFEDAFFFED9FAF8D8F2FCE3ECFEECE7FDF8E7F8F4
                  EFF3EFFAF3EFEDE1DBEEE2DAF9EFE7FEFCF4F9F8F4FFFEF7FEFDE7FFFEE2FEFC
                  E0D5D3C1B8B8B1FFFFFFFFFFFFF6EDD4FDF8DBFFFCDAFFFADBFCF8E0EDF5E0D9
                  F3E0DDF0EBEAF6F4FAFBFAFFFCFBECE1E0DACBC8F9EFECFFFDF7F1E5D3D9C8AF
                  F8EBCAFFFBD7FFFEDEE7E4D1ADB0AEFFFFFFFFFFFFFCFAF2EDE0CEF4DFCCF8E5
                  D3F0E8D8D5E7D8D8FBF0E5FFFEEAFFFFF1FFFFF5FDFCEBF0EFD8DBDBF9FCFCFA
                  FCF8EBCEAADEBA8DE2C18EF0D6A2FFF8CFF7F0D9A7A59FFFFEFFFFFFFFFFFFFF
                  FFFEFFFFFFFFFFFEFFFFFCFFD8EEEDCFFAF8D4FEFCD7FFFDDCFEFEDDFEFDD9FB
                  FBCDF0EFDAFCFCDFFAF4E8C494F2C184F7C685F3C587F1CD99FCEBCCADA296FF
                  FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3F4FAD0F5F8C8EEEFC9F2F2
                  CDF8F7CCFAFACDFEFFCAFEFFC2F9FABDE8E3DDBE90F3C289FDCA8AFAC98BF8CE
                  9AE0C4A2C5B7A8FFFDFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF5FFFFDBF5F7CEF0F2C7F3F7C2F4F9C2F8FD98C5C7DCC8A9E9C59C
                  EDC394F4C898E8C29ADEC6ACF2EAE1FFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFDCF8FDCFF4FCBFEBF6B0
                  D6DDFDFBEDFDF3DBF6E4C3F4DDBAF8E8C9FDF4E4FFF4FFFFFFFF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton25Click
              end
              object btRestaurarRegistro: TSpeedButton
                Left = 215
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Recuperar registro -  [PRO115]'
                Flat = True
                Glyph.Data = {
                  72040000424D7204000000000000320200002800000018000000180000000100
                  08000000000040020000120B0000120B00007F0000007F00000000000000FFFF
                  FF00FF00FF0000520200005101000051020000500100004F0100015703000156
                  03000155030001540300015302000153030001520200025A0400025904000258
                  040002570300025704000159040001580400025C0500025B0500037909000372
                  080003630700047D0A00047A0A0003600600035F070006910D00056209000562
                  0A00058F0D00058E0D00058C0D0006900E00068F0F00068E0E00079111000790
                  1000056A0B000896120007790E0009931300076A0E000A961400086A0F000A96
                  15000B9617000C9717000A7D13000A7B14000D991B00096D11000A7413000E9A
                  1C000A6E13000F9D1F00109F1F000C741700119F22000E841B000D7919000D78
                  180012A022000D761800108B1D000F831B000F7E1C001398230013A3270014A4
                  260015A7280016A72B0016A62A001181200018AA2D0018A92D00169528001383
                  23001689270019AB2F00169229001AAA31001CAF35001CAD33001BA531001A9F
                  2F0018952C00178C2A001FB439001FB43B001C9932001C99340022B63E001C98
                  33001F9C37001FA1390025BD440025BB430023AA400021A13B0022A03C0027B1
                  440027BC48002CC64F002CC44F0027AF45002CC14E0028B0470028AD470028AC
                  46002DBF4F002DC452002FBD540035D05E0036D05F0035CC5F0038D3640035CA
                  5F003CD86A003CD76A003BD1680042E2760041DC720002020202020202020202
                  0202020202020202020202020202020202020902020202020202020202020202
                  0202020202020202020909020202020202020202020202020202020202020202
                  02091102020202020202020202020202020202020202020202112A1302020202
                  02020202020202020202020202020202020F4010020202020202020202020202
                  0202020202020202020F5E1A0202020202020202060602020202020202020202
                  02146F410D020202020202020920060202020202020202020215746313020202
                  020202020A1820060202020202020202020A7079430D02020202020204681820
                  0602020202020202020D527D6D210A0202020202066226182004020202020202
                  02023A7C7B69371D090E0504075F2B23193006020202020202020B617E78725A
                  38343545502C2F2523183D06020202020202020A717A76736A60564F483B3229
                  24221B5B0A020202020202020B6777756C655D574C42362D27241F1C0A020202
                  02020202020B4D666E6B645C53493B332822510C02020202020202020202090D
                  46545958554E3E3931410602020202020202020202020202090B0D0A16474A3C
                  2E0602020202020202020202020202020202020212444B1E0302020202020202
                  020202020202020202020202103F170D02020202020202020202020202020202
                  0202020208090902020202020202020202020202020202020202020209090202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02020202020202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton5Click
              end
              object btSincronizarServicos: TSpeedButton
                Left = 269
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Sincronizar servi'#231'os - [PRO463]'
                Flat = True
                Glyph.Data = {
                  36150000424D361500000000000036000000280000002A0000002A0000000100
                  18000000000000150000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAA7A1A45D555C443A
                  4140363C40363C40363C40363C40363C40363C40363C40363C40363C40363C40
                  363C40363C40363C40363C40363C40363C443A415D555DA7A2A5FAFAFAFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E4E44D454C6554868971D5977D
                  F1987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3977DF18871D462538550464CE6E5E5
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F94D444B7E68BE987EF3856DCD6955
                  966B589B6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C
                  599E6C599E6C599E6C599E6C599E6B589B695596856ECD987EF37D67BD50464C
                  FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A1A3635487987EF3715EA8715CA5987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3705CA4735EAA987EF3625385
                  A7A2A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C53598972D6836CCB715CA5987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3705CA4856DCD8871D4
                  5D555DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF483C43977DF1695596987EF3987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3947BEC816AC47A69AC7969A9816CC195
                  7CED987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3695596977DF1
                  483C43FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF3987EF38F76DE756A929291A1C4CCCFD0D9DACFD8D9C8D1D394
                  91A2786D958C75DA987EF3987EF3987EF3987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF38C75
                  D9786D939178E67F6DB49290A0C4CBCE857F99776A9A7A69AB7B6AAE76699A82
                  7B96C2CACE9897A67F6EB4987EF3987EF3987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF37668
                  A0CFD8D960537CB2B6C09795A57E6DB6987EF3987EF3987EF3987EF3987EF398
                  7EF37E6DB6908E9FB3B6C17F6DB4987EF3987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF37667
                  9FD7E2E393929C9795A58A73D4987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF38B75D59290A19796A58D76DB987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF37667
                  9FEAF8F9E8F4F576717F787090937AE9987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3806DB8C1C8CD786E96987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF37B6A
                  AE8E8AA08F8CA28F8CA27E78919077E3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3827C979492A3947AEA987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3776A9BC6CED0826DC3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF38671CC7D798A8671CC987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF38672
                  CD7D798B8671CC987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3816D
                  C2C7D0D1776A9C987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF38870D3987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3937A
                  EA9594A3827C98987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF39077E47E78918F8CA28F8CA28E8AA17B6BAE987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3796E95C0C5CB816EBA987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3937AE978709076717FE8F4F5EBF9FA76689F987EF3987EF37863B6987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F38C75DA999AA88F8E9F8C74D8987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF38A73D49694A494949ED7E2E376689F987EF3987EF37863B5987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF37E6DB3B4B9C28F8E9F806DBA987EF3987EF3987EF3987EF3987EF398
                  7EF37E6DB69492A3B3B7C160537CCFD8D97668A0987EF3987EF38770D4987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF37E6DB39A99A7C0C6CB817B9776689A7B6AB07B6AAC776A9A84
                  7E98C2CACE9491A27E6CB39178E6786E938C75D9987EF3987EF3987EF3987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF3987EF38C73D8786D949493A3C8D1D3D0D9DAD0D9DAC5CECF93
                  90A2766B938F76DE987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF483C43977DF1695596987EF3987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3947BEC7F6BC07A6AA97A69AC816BC394
                  7BEC987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3977DF1
                  483C43FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C535A8A71D7836CCA715DA6987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF38971D5
                  5D545CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A0A265558A987EF3715DA6715DA6987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3655486
                  A7A1A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F84D444A7D68BF987EF3836CCA6956
                  976B589B6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C
                  599E6C599E6C599E6C599E6D599F967DEF987EF3987EF3987EF37E68BE4D444B
                  F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E3E34D434A65558A8972D6977E
                  F2987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3977EF28971D56354874D454CE5E4E4
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8A39FA15A5159443A
                  4140363C40363C40363C40363C40363C40363C40363C40363C40363C40363C40
                  363C40363C40363C40363C40363C40363C443A415C5359A6A1A3F9F9F9FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
                ParentShowHint = False
                ShowHint = True
                OnClick = btSincronizarServicosClick
              end
              object SpeedBSelTodos: TSpeedButton
                Left = 834
                Top = 8
                Width = 23
                Height = 21
                Hint = 'Selecionar todos'
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
                OnClick = SpeedBSelTodosClick
              end
              object SpeedBDesmarcarTodos: TSpeedButton
                Left = 860
                Top = 8
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
                OnClick = SpeedBDesmarcarTodosClick
              end
              object ckPermOpcaoMarcadas: TCheckBox
                Left = 534
                Top = 0
                Width = 296
                Height = 17
                Hint = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Caption = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = ckPermOpcaoMarcadasClick
              end
            end
          end
        end
        object tsAlterDadosLote: TTabSheet
          Caption = 'tsAlterDadosLote'
          ImageIndex = 4
          object pnAlteracaoEmLote: TPanel
            Left = 88
            Top = 48
            Width = 721
            Height = 130
            TabOrder = 0
            object GroupBoxAlteracaoEmLote: TGroupBox
              Left = 1
              Top = 1
              Width = 719
              Height = 128
              Align = alClient
              Caption = 'Altera'#231#227'o em lote de grades'
              TabOrder = 0
              object pnTipo1: TPanel
                Left = 2
                Top = 15
                Width = 715
                Height = 31
                Align = alTop
                TabOrder = 0
                object lbTipo1: TLabel
                  Left = 141
                  Top = 7
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo 1:'
                end
                object cbTipo1: TComboBox
                  Left = 177
                  Top = 4
                  Width = 467
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 1
                end
                object ckTipo1: TCheckBox
                  Left = 23
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckTipo1Click
                end
              end
              object Panel21: TPanel
                Left = 2
                Top = 46
                Width = 715
                Height = 83
                Align = alTop
                TabOrder = 1
                object Panel22: TPanel
                  Left = 1
                  Top = 1
                  Width = 713
                  Height = 27
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object pnTipo2: TPanel
                    Left = 0
                    Top = 0
                    Width = 713
                    Height = 31
                    Align = alTop
                    TabOrder = 0
                    object lbTipo2: TLabel
                      Left = 140
                      Top = 7
                      Width = 33
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo 2:'
                    end
                    object cbTipo2: TComboBox
                      Left = 176
                      Top = 4
                      Width = 467
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 13
                      TabOrder = 1
                    end
                    object ckTipo2: TCheckBox
                      Left = 22
                      Top = 6
                      Width = 30
                      Height = 17
                      TabOrder = 0
                      OnClick = ckTipo2Click
                    end
                  end
                end
                object Panel23: TPanel
                  Left = 1
                  Top = 28
                  Width = 713
                  Height = 54
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Panel7: TPanel
                    Left = 0
                    Top = 7
                    Width = 713
                    Height = 47
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object btnOKAlteracaoEmLote: TBitBtn
                      Left = 280
                      Top = 6
                      Width = 75
                      Height = 25
                      Hint = 'OK - [PRO454]'
                      Caption = 'OK'
                      TabOrder = 0
                      OnClick = btnOKAlteracaoEmLoteClick
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
                    object btnCancelarAlteracaoEmLote: TBitBtn
                      Left = 361
                      Top = 6
                      Width = 75
                      Height = 25
                      Hint = 'Cancelar'
                      Caption = 'Cancela'
                      TabOrder = 1
                      OnClick = btnCancelarAlteracaoEmLoteClick
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
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 622
    Width = 910
    ExplicitTop = 622
    ExplicitWidth = 910
  end
  inherited PopupMenu1: TPopupMenu
    object MarcarTodasGradesClick: TMenuItem
      Caption = 'Marcar Todas Grades'
      OnClick = MarcarTodasGradesClickClick
    end
    object DesmarcarTodasGradesClick: TMenuItem
      Caption = 'Desmarcar Todas Grades'
      OnClick = DesmarcarTodasGradesClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 654
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 614
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 582
    Top = 3
  end
end
