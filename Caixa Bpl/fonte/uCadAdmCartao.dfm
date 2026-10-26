inherited frmCadAdmCartao: TfrmCadAdmCartao
  Caption = 'Administradora de Cart'#227'o'
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
                  Height = 520
                  Align = alTop
                  ExplicitHeight = 520
                  inherited GroupBox1: TGroupBox
                    Height = 516
                    Align = alClient
                    Caption = 'Cadastro de Administradora de Cart'#227'o'
                    ExplicitHeight = 516
                    object pnAdmCartaoCodDescr: TPanel
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 57
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label6: TLabel
                        Left = 143
                        Top = 6
                        Width = 37
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'C'#243'digo:'
                        FocusControl = DBEdit1
                      end
                      object Label7: TLabel
                        Left = 130
                        Top = 33
                        Width = 50
                        Height = 13
                        Caption = 'Descri'#231#227'o:'
                        FocusControl = DBEdit2
                      end
                      object DBEdit1: TDBEdit
                        Left = 184
                        Top = 3
                        Width = 75
                        Height = 21
                        DataField = 'COD_ADM'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        Enabled = False
                        TabOrder = 0
                      end
                      object DBEdit2: TDBEdit
                        Left = 184
                        Top = 30
                        Width = 401
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESCRICAO_ADM'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        TabOrder = 1
                      end
                    end
                    object pnAdmCartaoEstab: TPanel
                      Left = 2
                      Top = 72
                      Width = 767
                      Height = 25
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label8: TLabel
                        Left = 58
                        Top = 4
                        Width = 122
                        Height = 13
                        Caption = 'N'#250'mero estabelecimento:'
                        FocusControl = DBEdit3
                      end
                      object DBEdit3: TDBEdit
                        Left = 184
                        Top = 1
                        Width = 134
                        Height = 21
                        DataField = 'NUM_ESTAB_ADM'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        TabOrder = 0
                      end
                    end
                    object pnAdmCartaoTaxaRedes: TPanel
                      Left = 2
                      Top = 268
                      Width = 767
                      Height = 168
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 7
                      object groupRedes: TGroupBox
                        Left = 184
                        Top = 1
                        Width = 401
                        Height = 161
                        Caption = 'Redes utilizadas por esta administradora de Cart'#227'o'
                        TabOrder = 0
                        object spBtRedesAdicionar: TSpeedButton
                          Left = 2
                          Top = 137
                          Width = 397
                          Height = 22
                          Align = alBottom
                          Caption = 'Adicionar'
                          Flat = True
                          OnClick = spBtRedesAdicionarClick
                          ExplicitLeft = 1
                          ExplicitTop = 190
                          ExplicitWidth = 212
                        end
                        object spBtRedesRemover: TSpeedButton
                          Left = 2
                          Top = 115
                          Width = 397
                          Height = 22
                          Align = alBottom
                          Caption = 'Remover'
                          Flat = True
                          OnClick = spBtRedesRemoverClick
                          ExplicitLeft = 18
                          ExplicitTop = -13
                        end
                        object lbxRedes: TListBox
                          Left = 2
                          Top = 15
                          Width = 397
                          Height = 100
                          Align = alClient
                          ItemHeight = 13
                          TabOrder = 0
                        end
                      end
                    end
                    object pnAdmCartaoCodCliente: TPanel
                      Left = 2
                      Top = 156
                      Width = 767
                      Height = 29
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 4
                      object Label11: TLabel
                        Left = 109
                        Top = 5
                        Width = 71
                        Height = 13
                        Caption = 'C'#243'digo cliente:'
                        FocusControl = DBEdit8
                      end
                      object DBEdit8: TDBEdit
                        Left = 184
                        Top = 2
                        Width = 134
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        TabOrder = 0
                        OnKeyDown = DBEdit8KeyDown
                      end
                    end
                    object pnAdmCartaoAdquirente: TPanel
                      Left = 2
                      Top = 126
                      Width = 767
                      Height = 30
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 3
                      object Label25: TLabel
                        Left = 87
                        Top = 6
                        Width = 93
                        Height = 13
                        Caption = 'C'#243'digo Adquirente:'
                        FocusControl = DBEdit11
                      end
                      object DBEdit11: TDBEdit
                        Left = 184
                        Top = 3
                        Width = 57
                        Height = 21
                        DataField = 'COD_ADQUIRENTE'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        TabOrder = 0
                      end
                      object DBLookupComboBox6: TDBLookupComboBox
                        Left = 247
                        Top = 3
                        Width = 338
                        Height = 21
                        DataField = 'COD_ADQUIRENTE'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        KeyField = 'ID'
                        ListField = 'NOME'
                        ListSource = DtmCadBasicosCx.dsConciliacaoAdquirente
                        TabOrder = 1
                      end
                    end
                    object pnAdmCartaoDefinirTaxa: TPanel
                      Left = 2
                      Top = 185
                      Width = 767
                      Height = 27
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 5
                      object lbTaxaPorCtrlBandeira: TLabel
                        Left = 52
                        Top = 4
                        Width = 128
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Definir taxa do cart'#227'o por:'
                      end
                      object DBComboBoxTaxaPorCtrlBandeira: TDBComboBox
                        Left = 184
                        Top = 1
                        Width = 401
                        Height = 21
                        Style = csDropDownList
                        CharCase = ecUpperCase
                        DataField = 'TAXA_POR_CONTROLE_BANDEIRA'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        ItemHeight = 0
                        Items.Strings = (
                          'C - CONTROLE E CONCILIACAO CARTAO'
                          'B - BANDEIRA, ADMINISTRADORA E PARCELA')
                        TabOrder = 0
                        OnExit = DBComboBoxTaxaPorCtrlBandeiraExit
                      end
                    end
                    object pnCamposObrigatorio: TPanel
                      Left = 2
                      Top = 212
                      Width = 767
                      Height = 56
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 6
                      object lbNSUobrigatorio: TLabel
                        Left = 38
                        Top = 6
                        Width = 142
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Num Doc/NSU/CV obrigat'#243'rio:'
                      end
                      object Label27: TLabel
                        Left = 40
                        Top = 33
                        Width = 140
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Num Autoriza'#231#227'o obrigat'#243'rio:'
                      end
                      object DBComboBoxNSUobrig: TDBComboBox
                        Left = 184
                        Top = 3
                        Width = 134
                        Height = 21
                        Style = csDropDownList
                        DataField = 'CAMPO_NSU_OBRIG'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        ItemHeight = 0
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 0
                      end
                      object DBComboBoxNumAutObrig: TDBComboBox
                        Left = 184
                        Top = 30
                        Width = 134
                        Height = 21
                        Style = csDropDownList
                        DataField = 'CAMPO_NUM_AUT_OBRIG'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        ItemHeight = 0
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 1
                      end
                    end
                    object pnAdmCartaoEnd: TPanel
                      Left = 2
                      Top = 97
                      Width = 767
                      Height = 29
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 2
                      object Label9: TLabel
                        Left = 17
                        Top = 6
                        Width = 163
                        Height = 13
                        Caption = 'Endere'#231'o arquivo Administradora:'
                        FocusControl = DBEdit4
                      end
                      object DBEdit4: TDBEdit
                        Left = 184
                        Top = 3
                        Width = 401
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'END_ARQUIVO_ADM'
                        DataSource = DtmCadBasicosCx.dsAdmCartao
                        TabOrder = 0
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar dados - [CXG080]'
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
              Hint = 'Clique para pesquisar - [CXG074]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CXG075]'
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CXG076]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Enviar para Lixeira -  [CXG077]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [CXG079]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Terminal Cart'#227'o - [CXG082]'
                Glyph.Data = {
                  36080000424D360800000000000036040000280000001F000000200000000100
                  08000000000000040000C40E0000C40E00000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFF608F5F5F50708F6FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFF607ECECECF4F5ECECECECF508F6FFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFF6F5ECF507080808F6080808F5F5ECEC08FFFFFFFFFFFFFF00FFFFFFFFFFFF
                  F6F5F508F6FFF6F6F6F6F6F6F6F6F608F5ECF5FFFFFFFFFFFF00FFFFFFFFFF08
                  F508F6FF08F507080808F6F6080808F6F607ECF5FFFFFFFFFF00FFFFFFFF08F5
                  F6FF08F7A4A39A9BECECF507F6F6080808F608ECF5FFFFFFFF00FFFFFFF607FF
                  F6F7A4A4EDECE39B9BECECECF5F6F6080808F608ECF5FFFFFF00FFFFFF08F607
                  A4A4F7F7F5A3A3E39B9BECECECF5F608080808F608EC08FFFF00FFFFF608A49B
                  A4F7F70708EDA3A3E39BA3ECECEC07F608080808F607F5FFFF00FFFFF6A49BA4
                  A4F507AD0708A4A3A3A39AECECECEC08F608080808F6F508FF00FFFF079BA4F7
                  0707B574AC07F59BA3A39BA3F4ECECF508F6F60808F608F5FF00FFFF075BF7F7
                  AE76B6ACED0707F79BA3A39AACECECECECF508F60808F6F5FF00F6FF07F7AE1F
                  66ADF70708ED0707A39BA39B9BECECECECECEC08F608F607F600F6FF08EDB766
                  F707F6F5F707ED07ED9B9BA39B9BF4ECECECECF508F6F6080800F6F6FFF507F6
                  F607ED0707F5EDF507E49B9B9B9AA3F4ECECECECF5F6F6080800F6FFFFFFF7F6
                  07070707F50708F7F707A39B9B9B525AECECECECEC08F6080800F6FFFFFF08A4
                  FF07ED0708F7F70807F5ED9B9B9B9B9B9BECECECECEC0808F600F6FFFFFFFF07
                  ED08F607F7080807080707A49B9B9B9B9B9BECECECECF5F6FF00F6FFFFFFFFFF
                  F7080707F60808BF7FBF07F79B9B9B9B9B52A3F4ECECEC07FF00F6F6FFFFFFFF
                  08F7F6F608BF7F7F7E7EBEF5A49B9B9B9B9B9BECECECECF5FF00F6F6FFFFFFFF
                  FFF707B57D7E7E7D7D7D7DB4EDA49B9B9B9BA3ECECECECF5FF00FFF6FFFFFFFF
                  FF08F7082B7D7D7D74732B6BF7ED9B9B9B9B9BF4ECECEC07FF00FFF6F6FFFFFF
                  FFFFF707072B74732A6BF70807EDF79B9B9B9BECF4F507FFFF00FFFFF6FFFFFF
                  FFFFF6AC07B56A6C07F6F6F608EDF7A49B9BA308F6F6F6FFFF00FFFFF6F6FFFF
                  FFFFFFF6A4ED08FFFFF6F6F6F607F7EDA452F7FFF6F6FFFFFF00FFFFFFF6FFFF
                  FFFFFFFFF6F7EDFFF6F6F6F60808F7A4A4F7F6F6F6F6FFFFFF00FFFFFFFFF6FF
                  FFFFFFFFFFFFF707FFF6F6F60808A407FFFFF6F6F6FFFFFFFF00FFFFFFFFFFF6
                  FFFFFFFFFFFFFFF708FFF6F6F6F607A4F6F6F6F6FFFFFFFFFF00FFFFFFFFFFFF
                  F6F6FFFFFFFFFFF6A408F60807F7F7F7F6F6F6FFFFFFFFFFFF00FFFFFFFFFFFF
                  FFF6F6F6FFFFFFFFF6F7F7F70707F6FFF6FFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFF6F6F6FFFFFFFFFFFFFFFFF6F6FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFF6F6F6F6F6F6F6F6F6FFFFFFFFFFFFFFFFFFFFFF00}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Consulta de Taxas de Cart'#227'o de Cr'#233'dito e D'#233'bito - [CXG109]'
                Caption = '%'
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Left = 349
                Hint = 'Consulta Bandeiras de Cart'#227'o de Cr'#233'dito e D'#233'bito - [CXG100]'
                Glyph.Data = {
                  1E050000424D1E05000000000000DE0200002800000018000000180000000100
                  08000000000040020000120B0000120B0000AA000000AA00000000000000FFFF
                  FF002D2C9800FF00FF00AC430F00A5461000A74912009E674100A5673A00954A
                  0F00F7A05600FEAB6700DE7F2600E1822900E3842D00E68A3500EB903D00F097
                  4800EFA05700F2AA6900FFBB7F00D8842F00EA9E5000FAAB5C00EFA75F00FAB5
                  7200D9802100D8802100DE862300DE872600D5812700D9822800D8832800D782
                  2800D7832900D8832A00D8842B00DC882D00DC892D00D8842C00E18A2F00D986
                  2D00D8872D00EB913200D9872E00DA883000DA893000DE8C3300DA893200DC8A
                  3300DC8B3400DD8C3500E1913700DE8E3600DD8E3700E08F3900E2933B00E090
                  3A00E1913C00E2923F00E6984100E2934000DA903E00E79A4300E5964300E798
                  4500EA9E4800EA9F4B00E79A4A00E3984900EFA55200E38B2600DA882B00DD8C
                  2F00DE8F3400E0913600E5973E00E99C4000E99D4600E79C4600AD936900A390
                  650030641700035A0600169E350021BA490019B4450019B143001ABA49001AB5
                  48001CB84B001DBD4D001CB749001EBC4C001FC14F001FC04E001FBF4E001FBF
                  500020C2510020C04F001FBB4E0021C4520021C4530023C9550022C2510024CA
                  570024C9560023C6540023C5530022C1520024C5550026CB580027CE5A0027CC
                  580026C9560027C9580029D05D0029CF5C0028CC590028CB58002BD560002AD0
                  5C002BD15D002CD15D002DD560002DD45F0031DC660034E0690035DE680039E5
                  6D003CE9700023CC590027D45E002BD15F002DD963002DD8630035E36C0037EA
                  720039E9700038E76F003BEA72003BEA73003EEE750043F77D0042F47A0046FA
                  7F004AFF830053FF91002D7EC0003379B100377BB4002C78BB00347AB6003476
                  AF001C87FF001480FF001681FF001E87FF000A5FDE000B63E000485A7E00525A
                  7500001EF4000018FF00001CF4001524BF001A28B5001D27B0002329A500292A
                  9C00030303030303030303030303030303030303030303030303030303030303
                  0303030303030303030303030303030303030309090909090909090909090909
                  0909090903030303030309464F3C38344A4926484707A6A5A094975109030303
                  030309433D3935312C2723201BA9A3A29F9D9C9809030303030309423B37332E
                  292421201A02A3A49E9A9B96090303030303094E3A36312D2A22211E1C08A8A7
                  A1959950090303030303093F09090909090909091E1D1F152B3E451709030303
                  0303093F37322E2924221E1E1E23252F3A411613090303030303093C09090909
                  090909090909090909441219090303030303094C33302C2722211E1E222A3139
                  40161819090303030303094D4B4A280D0C0C0C0C0D0E0F10110A0B1409525252
                  5203030605040909090909090909090909090909588384878952030303030352
                  85736E6D61645A5C595656575383777B88520303030303528675716A6B625E5F
                  5B5B606053537A7E8B520303030303527C76736E686360605D5D606B54535353
                  8C520303030303527852525252525252525260626F5553538E52030303030352
                  7A726E6C6263605D5D6060686A7A7F8A90520303030303527952525252525252
                  52525252525252819152030303030352756A6C6263605D5D5D60686E767D8082
                  9252030303030352787069676B656262666B6F74877F8D8F9352030303030303
                  5252525252525252525252525252525252030303030303030303030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                OnClick = SpeedButton8Click
                ExplicitLeft = 349
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
                Hint = 'Ver registros da lixeira - [CXG081]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Left = 463
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBDBB91846B907F62907F62907F
                  62907F628E7D61BCBAB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA39988C99739
                  BD8F38BD8F38BD8F38C59439FEB83D907653FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFA49A87A98134957332957332957433997632BE8C35917550FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF9C9587EFB445EFB23DEFB23DEFB23EEFB23DF0AD398C
                  775BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDC99979298958FAC9364A983
                  3A989590999692DDDDDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF9D9992969087FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFDDDDDCDDDDDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C8C7C9C8C78483843846
                  A0858383C9C8C7C9C8C7C9C8C7C9C8C7C3C2C0454C7B444A78C3C2C0C9C8C7C9
                  C8C7C9C8C7C9C8C78483843846A0858383C9C8C7C9C8C7FFFFFFFFFFFFC9C9C8
                  C9C9C88584843947A0858384C9C9C8C9C9C8C9C9C8C9C9C8C3C2C0454C7B444A
                  78C3C2C1C9C9C8C9C9C8C9C9C8C9C9C88584843947A0858384C9C9C8C9C9C8FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C0BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFEEEEEEEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C0BDFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E656645EE7E7E6FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  E7E7E656645EE7E7E6FFFFFFFFFFFFFFFFFFFFFFFFACABA9959592777D782CCB
                  E2687470959592ABAAA8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFACABA9959592777D782CCBE2687470959592ABAAA8FFFFFFC6C5C44CACB8
                  05CFEE04CFEE04CFEE05CFEE01D8F910A6BDC7C7C5FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFC6C5C44CACB805CFEE04CFEE04CFEE05CFEE01D8F910A6BDC7
                  C7C5BBBBB950A8B11E828B1E828B1E828B1E828B11ABC00EB0CABCBBB9FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBB950A8B11E828B1E828B1E828B1E82
                  8B11ABC00EB0CABCBBB9BEBDBC4EACB713A4B712A4B712A4B713A4B712A4B711
                  A1B7BFBEBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBDBC4EACB713A4B7
                  12A4B712A4B713A4B712A4B711A1B7BFBEBCFFFFFF858F8C5E87875E87875E87
                  875E87875E8787798785FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF858F8C5E87875E87875E87875E87875E8787798785FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton26Click
                ExplicitLeft = 463
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
        object tsTerminalCartao: TTabSheet
          Caption = 'tsTerminalCartao'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnTerminalCartao: TPanel
            Left = 3
            Top = 19
            Width = 676
            Height = 220
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object DBGrid2: TDBGrid
              Left = 9
              Top = 10
              Width = 657
              Height = 151
              DataSource = DtmCadBasicosCx.dsTerminalCartao
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_TERM_ADM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_TERM_ADM'
                  Width = 433
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_TERMINALF'
                  Width = 118
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Visible = True
                end>
            end
            object Panel5: TPanel
              Left = 8
              Top = 167
              Width = 657
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn7: TBitBtn
                Left = 370
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Editar Registro - [CXG084]'
                Caption = 'Alterar'
                TabOrder = 0
                OnClick = BitBtn7Click
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
              object BitBtn8: TBitBtn
                Left = 208
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Novo Registro - [CXG083]'
                Caption = 'Novo'
                TabOrder = 1
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
              end
              object BitBtn9: TBitBtn
                Left = 289
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Enviar para a Lixeira - [CXG086]'
                Caption = 'Excluir'
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
                Left = 568
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Sair'
                TabOrder = 3
                OnClick = BitBtn10Click
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
              object BitBtn13: TBitBtn
                Left = 10
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Ver Lixeira - [CXG089]'
                Caption = 'Lixeira'
                TabOrder = 4
                OnClick = BitBtn13Click
                Glyph.Data = {
                  AE030000424DAE03000000000000AE0200002800000010000000100000000100
                  08000000000000010000120B0000120B00009E0000009E00000000000000FFFF
                  FF00FF00FF00FFF4EF00FFCCA600FFD9BC00FFDEC500FDC08D00FFC49500FCC5
                  9600FAC18E00FCC69600FACEA600FAD0A900FBD2AD00F1B87F00F6BC8500F4BE
                  8800F2BD8700F4BE8900F5C49200FBCB9B00FBCD9F00FBCEA000F9D0A800FDD6
                  AE00FDDBBB00FDDEBF00F0B16A00F0B37000F3BD8200F1BA8100F2BE8700F2C0
                  8800F2BF8900F3C18A00F4C28C00F3C18B00F3C38E00F4C39000F4C59000F5C7
                  9300F5C79600F9CB9B00FBCE9E00FBCE9F00F6CDA100FDDEBE00F0B06700F1B6
                  6F00F3BE8000F5CA9900F5CB9900F6CE9D00F6D0A100F8D4A800FCDBB300FFE1
                  BE00FFE2BF00F6CD9800F6D1A100F8D5A600FDDDB400FFE7C900FEE7C800F7CE
                  9500F7CF9700F6D5A600F6D5A700F7D8AB00F8DAAE00FEE2BA00FEE9C900FEEA
                  CB00F0D6A700F9E1B600FCE4BB00F9E1B900FBE5BD00FCE6BE00FAE3B600FAE5
                  BE00FAE6C000FFEFD100FDEBC500FDEECC00FFF5DC00FFF3D200FFF4D500FCF0
                  CC00FEF5DB00FDF3D100FFF6D600FEF5D200FDF4D100FEF6D500FFF7D700FFF7
                  D800FEF7D700FEF8D800FFFAE000FEF9D800FFFCDD00FFFCDE00FEFBDD00FFFC
                  DF00FFFDDE00FFFEE000CBCA9200E2E2BE00FFFFE100FFFFE200FFFFE300FFFF
                  E500FFFFE700FFFFE800FFFFED00FFFFF000C8CB9200B6C07900BBC88800EFF6
                  D400D0DFB8009CBD6F00C5DCAA009AC17600C5DFAD0093C47B0090C47800AFD7
                  9E0078BB610072BA5E0063B55200E2F2DF0043A7360047AD3A0044AB380057B6
                  4E0043AE3B0089CB8300E7F5E60042AB3B0010970B002BA129003EAD3B0071C2
                  6E0000920000008A000000880000089708000E9A0F00169A14005CB95C0066C0
                  660098D498000094020084CD8500F7FEFC000202020202020202020202020202
                  020202020202333C34252126020202020202020202595F4F430B08193A472802
                  020202020268654C4A787B8683795522020202020F365E5438889B968E895A24
                  02020202121F233D3987949C0384770702020202142A2713097F988B019D6C10
                  02020202180E0D0C2E7A01859199760A020202371B2F1A1A06829A8C90937D04
                  20020237534948403F6D978F959280052002024E69615C5857567E8D8A817C3F
                  2902025B6E666A66676A73757472646035020262716F6F706B635041424B5D71
                  4402024552514D463B321C301D112C3E1702020202020202020202311E2B1615
                  150202020202020202020202022D2D2D0202}
              end
              object BitBtn14: TBitBtn
                Left = 91
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Restaurar registro da lixeira - [CXG087]'
                Caption = 'Restaurar'
                TabOrder = 5
                Visible = False
                OnClick = BitBtn14Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FF0274AC
                  0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274
                  AC0274ACFF00FFFF00FF0274AC48BCF60274AC8CD8FA4BBFF74ABFF64ABFF74A
                  BFF74ABFF64ABFF74ABFF64BBFF62398CC97E0F20274ACFF00FF0274AC4FC4F7
                  0274AC92DDFB54C7F854C7F753C7F854C7F754C7F854C7F854C7F853C7F7279D
                  CE9DE3F20274ACFF00FF0274AC57CAF80274AC99E3FB5ED1FA5ED1FA5ED1FA5E
                  D1FA5ED1FA5FD1FA5ED1F85ED1F82CA1CEA3E9F30274ACFF00FF0274AC5ED3FA
                  0274ACA1E9FC69DCFA2C9D6703690804740A2C9C675ED0E269DCFA6ADDFB2FA6
                  CFA9EEF30274ACFF00FF0274AC67D9F70274ABA7EFFC74E5FB74E5FB39AC7E05
                  7F0B04800B157F2E70E2F674E5FB33A9CFACF0F40274ACFF00FF0274AC6FE3FA
                  0274ABFFFFFFBAF4FEB8F4FEBAF4FE58B27E05860D047E0A1E812DB8F4FE83C9
                  E0D4F7FA0274ACFF00FF0274AC7AEBFE0274AC0274AC0274AC0274AC0274AC02
                  6C7005830C06910D03681102709A0274AC0274AC0274ACFF00FF0274AC83F2FE
                  82F3FE82F3FE83F2FC83F3FE82F3FE5BC7B00A80140A9A14047B0B49B591036F
                  A7FF00FFFF00FFFF00FF0274ACFEFEFE89FAFF89FAFE89FAFE8AF8FE8AFAFE6C
                  D9C90F871F13A926098E122D9754036FA7FF00FFFF00FFFF00FFFF00FF0274AC
                  FEFEFE8FFEFF046B0B046B0B046B0B046B0B15932A1FB53812A123046B0B046B
                  0B046B0B046B0BFF00FFFF00FFFF00FF0274AC0274AC027399046B0B107D1D36
                  CE6032C95A27BC471DB03614A527098713046B0BFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF046B0B1D993541DE7535CC5D2BC24D1AA732046B
                  0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF04
                  6B0B27AC4546E37A35CA5C046B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF046B0B2DB851046B0BFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF046B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
            object Panel6: TPanel
              Left = 9
              Top = 10
              Width = 657
              Height = 151
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              Visible = False
              object Label16: TLabel
                Left = 89
                Top = 19
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'C'#243'digo'
                FocusControl = DBEdit5
              end
              object Label17: TLabel
                Left = 76
                Top = 46
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'Descri'#231#227'o'
                FocusControl = DBEdit6
              end
              object Label10: TLabel
                Left = 17
                Top = 73
                Width = 105
                Height = 13
                Alignment = taRightJustify
                Caption = 'C'#243'digo Terminal Fiscal'
                FocusControl = DBEdit7
              end
              object Label12: TLabel
                Left = 430
                Top = 73
                Width = 20
                Height = 13
                Caption = 'Tipo'
              end
              object DBEdit5: TDBEdit
                Left = 128
                Top = 16
                Width = 113
                Height = 21
                DataField = 'COD_TERM_ADM'
                DataSource = DtmCadBasicosCx.dsTerminalCartao
                TabOrder = 0
              end
              object Panel7: TPanel
                Left = 10
                Top = 96
                Width = 633
                Height = 41
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 3
                object BitBtn11: TBitBtn
                  Left = 320
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Cancelar Registro'
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = BitBtn11Click
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
                object BitBtn12: TBitBtn
                  Left = 234
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Salvar Registro - [CXG088]'
                  Caption = 'Salvar'
                  TabOrder = 0
                  OnClick = BitBtn12Click
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
              object DBEdit6: TDBEdit
                Left = 128
                Top = 43
                Width = 473
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DESC_TERM_ADM'
                DataSource = DtmCadBasicosCx.dsTerminalCartao
                TabOrder = 1
              end
              object DBEdit7: TDBEdit
                Left = 128
                Top = 69
                Width = 64
                Height = 21
                CharCase = ecUpperCase
                DataField = 'COD_TERMINALF'
                DataSource = DtmCadBasicosCx.dsTerminalCartao
                TabOrder = 2
              end
              object DBComboBox1: TDBComboBox
                Left = 456
                Top = 70
                Width = 145
                Height = 21
                CharCase = ecUpperCase
                DataField = 'TIPO'
                DataSource = DtmCadBasicosCx.dsTerminalCartao
                ItemHeight = 0
                Items.Strings = (
                  'D - TEF DEDICADO'
                  'P - POS')
                TabOrder = 4
              end
            end
          end
        end
        object tsBandeiraCartao: TTabSheet
          Caption = 'tsBandeiraCartao'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnBandConsulta: TPanel
            Left = 3
            Top = 19
            Width = 676
            Height = 220
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object DBGrid3: TDBGrid
              Left = 8
              Top = 10
              Width = 657
              Height = 151
              DataSource = DtmCadBasicosCx.dsBandCartao
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_BANDEIRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            object Panel8: TPanel
              Left = 8
              Top = 167
              Width = 657
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn15: TBitBtn
                Left = 370
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Editar Registro - [CXG102]'
                Caption = 'Alterar'
                TabOrder = 0
                OnClick = BitBtn15Click
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
              object BitBtn16: TBitBtn
                Left = 208
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Novo Registro - [CXG101]'
                Caption = 'Novo'
                TabOrder = 1
                OnClick = BitBtn16Click
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
              object BitBtn17: TBitBtn
                Left = 289
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Enviar para a Lixeira - [CXG103]'
                Caption = 'Excluir'
                TabOrder = 2
                OnClick = BitBtn17Click
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
              object BitBtn18: TBitBtn
                Left = 568
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Sair'
                ModalResult = 2
                TabOrder = 3
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
              object BitBtn19: TBitBtn
                Left = 10
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Lixeira - [CXG107]'
                Caption = 'Abrir'
                TabOrder = 4
                OnClick = BitBtn19Click
                Glyph.Data = {
                  AE030000424DAE03000000000000AE0200002800000010000000100000000100
                  08000000000000010000120B0000120B00009E0000009E00000000000000FFFF
                  FF00FF00FF00FFF4EF00FFCCA600FFD9BC00FFDEC500FDC08D00FFC49500FCC5
                  9600FAC18E00FCC69600FACEA600FAD0A900FBD2AD00F1B87F00F6BC8500F4BE
                  8800F2BD8700F4BE8900F5C49200FBCB9B00FBCD9F00FBCEA000F9D0A800FDD6
                  AE00FDDBBB00FDDEBF00F0B16A00F0B37000F3BD8200F1BA8100F2BE8700F2C0
                  8800F2BF8900F3C18A00F4C28C00F3C18B00F3C38E00F4C39000F4C59000F5C7
                  9300F5C79600F9CB9B00FBCE9E00FBCE9F00F6CDA100FDDEBE00F0B06700F1B6
                  6F00F3BE8000F5CA9900F5CB9900F6CE9D00F6D0A100F8D4A800FCDBB300FFE1
                  BE00FFE2BF00F6CD9800F6D1A100F8D5A600FDDDB400FFE7C900FEE7C800F7CE
                  9500F7CF9700F6D5A600F6D5A700F7D8AB00F8DAAE00FEE2BA00FEE9C900FEEA
                  CB00F0D6A700F9E1B600FCE4BB00F9E1B900FBE5BD00FCE6BE00FAE3B600FAE5
                  BE00FAE6C000FFEFD100FDEBC500FDEECC00FFF5DC00FFF3D200FFF4D500FCF0
                  CC00FEF5DB00FDF3D100FFF6D600FEF5D200FDF4D100FEF6D500FFF7D700FFF7
                  D800FEF7D700FEF8D800FFFAE000FEF9D800FFFCDD00FFFCDE00FEFBDD00FFFC
                  DF00FFFDDE00FFFEE000CBCA9200E2E2BE00FFFFE100FFFFE200FFFFE300FFFF
                  E500FFFFE700FFFFE800FFFFED00FFFFF000C8CB9200B6C07900BBC88800EFF6
                  D400D0DFB8009CBD6F00C5DCAA009AC17600C5DFAD0093C47B0090C47800AFD7
                  9E0078BB610072BA5E0063B55200E2F2DF0043A7360047AD3A0044AB380057B6
                  4E0043AE3B0089CB8300E7F5E60042AB3B0010970B002BA129003EAD3B0071C2
                  6E0000920000008A000000880000089708000E9A0F00169A14005CB95C0066C0
                  660098D498000094020084CD8500F7FEFC000202020202020202020202020202
                  020202020202333C34252126020202020202020202595F4F430B08193A472802
                  020202020268654C4A787B8683795522020202020F365E5438889B968E895A24
                  02020202121F233D3987949C0384770702020202142A2713097F988B019D6C10
                  02020202180E0D0C2E7A01859199760A020202371B2F1A1A06829A8C90937D04
                  20020237534948403F6D978F959280052002024E69615C5857567E8D8A817C3F
                  2902025B6E666A66676A73757472646035020262716F6F706B635041424B5D71
                  4402024552514D463B321C301D112C3E1702020202020202020202311E2B1615
                  150202020202020202020202022D2D2D0202}
              end
              object BitBtn20: TBitBtn
                Left = 91
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Restaurar registro da lixeira - [CXG108]'
                Caption = 'Restaurar'
                TabOrder = 5
                Visible = False
                OnClick = BitBtn20Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FF0274AC
                  0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274
                  AC0274ACFF00FFFF00FF0274AC48BCF60274AC8CD8FA4BBFF74ABFF64ABFF74A
                  BFF74ABFF64ABFF74ABFF64BBFF62398CC97E0F20274ACFF00FF0274AC4FC4F7
                  0274AC92DDFB54C7F854C7F753C7F854C7F754C7F854C7F854C7F853C7F7279D
                  CE9DE3F20274ACFF00FF0274AC57CAF80274AC99E3FB5ED1FA5ED1FA5ED1FA5E
                  D1FA5ED1FA5FD1FA5ED1F85ED1F82CA1CEA3E9F30274ACFF00FF0274AC5ED3FA
                  0274ACA1E9FC69DCFA2C9D6703690804740A2C9C675ED0E269DCFA6ADDFB2FA6
                  CFA9EEF30274ACFF00FF0274AC67D9F70274ABA7EFFC74E5FB74E5FB39AC7E05
                  7F0B04800B157F2E70E2F674E5FB33A9CFACF0F40274ACFF00FF0274AC6FE3FA
                  0274ABFFFFFFBAF4FEB8F4FEBAF4FE58B27E05860D047E0A1E812DB8F4FE83C9
                  E0D4F7FA0274ACFF00FF0274AC7AEBFE0274AC0274AC0274AC0274AC0274AC02
                  6C7005830C06910D03681102709A0274AC0274AC0274ACFF00FF0274AC83F2FE
                  82F3FE82F3FE83F2FC83F3FE82F3FE5BC7B00A80140A9A14047B0B49B591036F
                  A7FF00FFFF00FFFF00FF0274ACFEFEFE89FAFF89FAFE89FAFE8AF8FE8AFAFE6C
                  D9C90F871F13A926098E122D9754036FA7FF00FFFF00FFFF00FFFF00FF0274AC
                  FEFEFE8FFEFF046B0B046B0B046B0B046B0B15932A1FB53812A123046B0B046B
                  0B046B0B046B0BFF00FFFF00FFFF00FF0274AC0274AC027399046B0B107D1D36
                  CE6032C95A27BC471DB03614A527098713046B0BFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF046B0B1D993541DE7535CC5D2BC24D1AA732046B
                  0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF04
                  6B0B27AC4546E37A35CA5C046B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF046B0B2DB851046B0BFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF046B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object BitBtn27: TBitBtn
                Left = 451
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Consulta de Taxas de Cart'#227'o de Cr'#233'dito e D'#233'bito - [CXG109]'
                Caption = 'Taxas'
                TabOrder = 6
                OnClick = BitBtn27Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000130B0000130B00000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFD5C48A3FDFD5C000091FDFDFDFDFDFDFDFD13
                  91FDA40A9A6442A3FDFDFDFDFDFDFD64429AA40A9AA40A9AFDFDFDFDFDFDFDFD
                  5C49A30A9A64429AFDFDFDFDFDFDFDFDFD13505C000091FDFDFDFDFDFDA40A00
                  40A30A9AFDFDFDFDFDFDFDFDFD5C48A313915C41A3FDFDFDFDFDFDFDFD1350A4
                  5C50FD1350FDFDFDFDFDFDFDFD5C50A41391FDFD139AFDFDFDFDFDFDFDA40A00
                  40A3FDFD64429AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
              end
            end
          end
          object pnBandCadastro: TPanel
            Left = 3
            Top = 265
            Width = 657
            Height = 151
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            object Label13: TLabel
              Left = 89
              Top = 27
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'C'#243'digo'
              FocusControl = DBEdit9
            end
            object Label14: TLabel
              Left = 76
              Top = 54
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Descri'#231#227'o'
              FocusControl = DBEdit10
            end
            object DBEdit9: TDBEdit
              Left = 128
              Top = 23
              Width = 113
              Height = 21
              DataField = 'COD_BANDEIRA'
              DataSource = DtmCadBasicosCx.dsBandCartao
              Enabled = False
              TabOrder = 0
            end
            object Panel10: TPanel
              Left = 10
              Top = 96
              Width = 633
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn21: TBitBtn
                Left = 320
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = 'Cancelar'
                ModalResult = 2
                TabOrder = 1
                OnClick = BitBtn21Click
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
              object BitBtn22: TBitBtn
                Left = 234
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Salvar Registro - [CXG105]'
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = BitBtn22Click
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
            object DBEdit10: TDBEdit
              Left = 128
              Top = 50
              Width = 473
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DESCRICAO'
              DataSource = DtmCadBasicosCx.dsBandCartao
              TabOrder = 1
            end
          end
        end
        object tsTaxasCartao: TTabSheet
          Caption = 'tsTaxasCartao'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnTaxasConsulta: TPanel
            Left = 3
            Top = 19
            Width = 676
            Height = 436
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 8
            TabOrder = 0
            object DBGrid4: TDBGrid
              Left = 8
              Top = 81
              Width = 656
              Height = 302
              Align = alClient
              DataSource = DtmCadBasicosCx.dsTxBandeiras
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
                  FieldName = 'DESCRICAO_ADM'
                  Width = 131
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO_BAND'
                  Width = 136
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PARCELAS_ATE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PARCELAS_DE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TAXA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DEBITO_CREDITO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SEQID'
                  Width = 26
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_BANDEIRA'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_ADM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Width = 64
                  Visible = True
                end>
            end
            object Panel9: TPanel
              Left = 8
              Top = 383
              Width = 656
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn23: TBitBtn
                Left = 370
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Editar Registro - [CXG111]'
                Caption = 'Alterar'
                TabOrder = 0
                OnClick = BitBtn23Click
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
              object BitBtn24: TBitBtn
                Left = 208
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Novo Registro - [CXG110]'
                Caption = 'Novo'
                TabOrder = 1
                OnClick = BitBtn24Click
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
              object BitBtn25: TBitBtn
                Left = 289
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Enviar para a Lixeira - [CXG112]'
                Caption = 'Excluir'
                TabOrder = 2
                OnClick = BitBtn25Click
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
              object BitBtn26: TBitBtn
                Left = 568
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Sair'
                ModalResult = 2
                TabOrder = 3
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
            object GroupBox5: TGroupBox
              Left = 8
              Top = 8
              Width = 656
              Height = 73
              Align = alTop
              Caption = 'Filtro'
              TabOrder = 0
              object Label15: TLabel
                Left = 32
                Top = 16
                Width = 72
                Height = 13
                Caption = 'Administradora'
              end
              object Label24: TLabel
                Left = 319
                Top = 16
                Width = 42
                Height = 13
                Caption = 'Bandeira'
              end
              object DBLookupComboBox4: TDBLookupComboBox
                Left = 32
                Top = 35
                Width = 281
                Height = 21
                TabOrder = 0
              end
              object DBLookupComboBox5: TDBLookupComboBox
                Left = 319
                Top = 35
                Width = 281
                Height = 21
                TabOrder = 1
              end
            end
          end
          object pnTaxasCadastro: TPanel
            Left = 71
            Top = 150
            Width = 492
            Height = 226
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 8
            TabOrder = 1
            Visible = False
            object Label18: TLabel
              Left = 80
              Top = 12
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bandeira'
            end
            object Label19: TLabel
              Left = 50
              Top = 39
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Administradora'
            end
            object Label20: TLabel
              Left = 38
              Top = 66
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'D'#233'bito ou Cr'#233'dito'
            end
            object Label23: TLabel
              Left = 98
              Top = 146
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Taxa'
            end
            object Panel12: TPanel
              Left = 8
              Top = 173
              Width = 472
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 5
              object BitBtn29: TBitBtn
                Left = 235
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = 'Cancelar'
                ModalResult = 2
                TabOrder = 1
                OnClick = BitBtn29Click
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
              object BitBtn30: TBitBtn
                Left = 154
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Salvar Registro - [CXG113]'
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = BitBtn30Click
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
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 128
              Top = 9
              Width = 275
              Height = 21
              DataField = 'COD_BANDEIRA'
              DataSource = DtmCadBasicosCx.dsTxBandeiras
              TabOrder = 0
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 128
              Top = 36
              Width = 275
              Height = 21
              DataField = 'COD_ADM'
              DataSource = DtmCadBasicosCx.dsTxBandeiras
              TabOrder = 1
            end
            object DBLookupComboBox3: TDBLookupComboBox
              Left = 128
              Top = 63
              Width = 121
              Height = 21
              DataField = 'DEBITO_CREDITO'
              DataSource = DtmCadBasicosCx.dsTxBandeiras
              TabOrder = 2
              OnExit = DBLookupComboBox3Exit
            end
            object GroupBox4: TGroupBox
              Left = 38
              Top = 90
              Width = 411
              Height = 47
              Caption = 'Parcelas'
              TabOrder = 3
              object Label21: TLabel
                Left = 71
                Top = 19
                Width = 13
                Height = 13
                Alignment = taRightJustify
                Caption = 'De'
              end
              object Label22: TLabel
                Left = 289
                Top = 19
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'At'#233
              end
              object DBEdit12: TDBEdit
                Left = 90
                Top = 16
                Width = 53
                Height = 21
                DataField = 'PARCELAS_DE'
                DataSource = DtmCadBasicosCx.dsTxBandeiras
                TabOrder = 0
              end
              object DBEdit13: TDBEdit
                Left = 312
                Top = 16
                Width = 53
                Height = 21
                DataField = 'PARCELAS_ATE'
                DataSource = DtmCadBasicosCx.dsTxBandeiras
                TabOrder = 1
              end
            end
            object DBEdit14: TDBEdit
              Left = 128
              Top = 143
              Width = 73
              Height = 21
              DataField = 'TAXA'
              DataSource = DtmCadBasicosCx.dsTxBandeiras
              TabOrder = 4
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
end
