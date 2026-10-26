inherited frmCadConferenciaCega: TfrmCadConferenciaCega
  Caption = 'Confer'#234'ncia Cega'
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
              ActivePage = tsEscolhaProduto
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tsPanels: TTabSheet
                Caption = 'tsPanels'
                ImageIndex = 1
                object pnCarga: TPanel
                  Left = 1
                  Top = 44
                  Width = 777
                  Height = 385
                  BevelOuter = bvNone
                  TabOrder = 1
                  object gbPedidosCarga: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 777
                    Height = 385
                    Align = alClient
                    Caption = 'Pedidos'
                    TabOrder = 0
                    object pnDbGridPedidos: TPanel
                      Left = 2
                      Top = 15
                      Width = 773
                      Height = 368
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object pnPedidoBotoes: TPanel
                        Left = 0
                        Top = 323
                        Width = 769
                        Height = 41
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 0
                        object sbSelAll: TSpeedButton
                          Left = 5
                          Top = 9
                          Width = 23
                          Height = 22
                          Hint = 'Selecionar Todos'
                          Flat = True
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF699A22FF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF77BBE75EB3E95EB3E95EB3E95EB3E95FB3E8B2D0E3FF
                            00FF67991F67991F67991FFF00FFFF00FFFF00FFFF00FFFF00FF60B3E85EB3E9
                            5EB3E95EB3E95FB3E8B0D0E3FF00FF67991F67991F67991F67991F67991FFF00
                            FFFF00FFFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFFF2F2F2FF00FF67991F67
                            991F67991FFF00FF729F3067991F67991FFF00FFFF00FFFF00FF5EB3E95EB3E9
                            FFFFFFFFFFFFF3F3F3FF00FF67991F67991FFF00FFFF00FFFF00FF6C9C286799
                            1F67991FFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFFFEFEFE959ED6FF00FFFF
                            00FFE8E8E8FEFEFEEDEDEDFF00FF699A2367991F67991FFF00FF5EB3E95EB3E9
                            FFFFFFFFFFFF253DC6253DC67785D1848FD3FEFEFEFFFFFFFEFEFEAECFE4FF00
                            FF67992067991F699A225EB3E95EB3E9FFFFFFFFFFFF253DC6FFFFFFFFFFFF25
                            3DC6253DC6FFFFFFFFFFFF5FB3E8B0CFE3FF00FF67991FFF00FF5EB3E95EB3E9
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EB3E960B3
                            E8FF00FFFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFFFFFFFF253DC6253DC6FD
                            FDFDFCFCFCFFFFFFFFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF5EB3E95EB3E9
                            FFFFFFFFFFFF253DC6253DC6253DC6253DC6FFFFFFFFFFFFFFFFFF5EB3E95FB3
                            E8FF00FFFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFF253DC6FFFFFFFFFFFF25
                            3DC6253DC6FFFFFFFFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF5EB3E95EB3E9
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EB3E95FB3
                            E8FF00FFFF00FFFF00FF60B3E85EB3E9FFFFFF8D8D8D71717171717171717171
                            7171717171898989FFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF77BBE75EB3E9
                            62B4E797BED79EABB37A7B7B717171797A7AA2ABB19DBED363B4E75EB3E976BB
                            E7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5A7A9717171A2
                            A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                          OnClick = sbSelAllClick
                        end
                        object sbDesSelAll: TSpeedButton
                          Left = 34
                          Top = 9
                          Width = 23
                          Height = 22
                          Hint = 'Desselecionar Todos'
                          Flat = True
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB6B6B6FF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDFDFDFFF
                            00FFB6B6B6B6B6B6B6B6B6FF00FFFF00FFFF00FFFF00FFFF00FFDCDCDCDCDCDC
                            DCDCDCDCDCDCDCDCDCDFDFDFFF00FFB6B6B6B6B6B6B6B6B6B6B6B6B6B6B6FF00
                            FFFF00FFFF00FFFF00FFDCDCDCDCDCDCFFFFFFFFFFFFF2F2F2FF00FFB6B6B6B6
                            B6B6B6B6B6FF00FFB9B9B9B6B6B6B6B6B6FF00FFFF00FFFF00FFDCDCDCDCDCDC
                            FFFFFFFFFFFFF3F3F3FF00FFB6B6B6B6B6B6FF00FFFF00FFFF00FFB8B8B8B6B6
                            B6B6B6B6FF00FFFF00FFDCDCDCDCDCDCFFFFFFFFFFFFFEFEFECDCDCDFF00FFFF
                            00FFE8E8E8FEFEFEEDEDEDFF00FFB7B7B7B6B6B6B6B6B6FF00FFDCDCDCDCDCDC
                            FFFFFFFFFFFFB1B1B1B1B1B1C6C6C6C9C9C9FEFEFEFFFFFFFEFEFEDFDFDFFF00
                            FFB6B6B6B6B6B6B6B6B6DCDCDCDCDCDCFFFFFFFFFFFFB1B1B1FFFFFFFFFFFFB1
                            B1B1B1B1B1FFFFFFFFFFFFDCDCDCDFDFDFFF00FFB6B6B6FF00FFDCDCDCDCDCDC
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDC
                            DCFF00FFFF00FFFF00FFDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFB1B1B1B1B1B1FE
                            FEFEFDFDFDFFFFFFFFFFFFDCDCDCDCDCDCFF00FFFF00FFFF00FFDCDCDCDCDCDC
                            FFFFFFFFFFFFB1B1B1B1B1B1B1B1B1B1B1B1FFFFFFFFFFFFFFFFFFDCDCDCDCDC
                            DCFF00FFFF00FFFF00FFDCDCDCDCDCDCFFFFFFFFFFFFB1B1B1FFFFFFFFFFFFB1
                            B1B1B1B1B1FFFFFFFFFFFFDCDCDCDCDCDCFF00FFFF00FFFF00FFDCDCDCDCDCDC
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDC
                            DCFF00FFFF00FFFF00FFDCDCDCDCDCDCFFFFFFC6C6C6B8B8B8B8B8B8B8B8B8B8
                            B8B8B8B8B8C4C4C4FFFFFFDCDCDCDCDCDCFF00FFFF00FFFF00FFDCDCDCDCDCDC
                            DCDCDCDADADACECECEBABABAB8B8B8BABABACECECED9D9D9DCDCDCDCDCDCDCDC
                            DCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCBB8B8B8CA
                            CACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                          OnClick = sbDesSelAllClick
                        end
                        object BitBtnOK: TBitBtn
                          Left = 672
                          Top = 6
                          Width = 91
                          Height = 25
                          Caption = 'Ok'
                          ModalResult = 1
                          TabOrder = 0
                          OnClick = BitBtnOKClick
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1C3968DAC5D759E388DAC
                            5DB1C396FF00FFFF00FF959595696969696969696969696969696969818181FF
                            00FF99B470759E38759E38759E38759E38759E3899B470FF00FF696969FEFEFE
                            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFB1C396759E38759E38FFFFFFB2C98F759E
                            38759E38759E38B1C396696969FEFEFEFFFFFF5A5A5A5A5A5AFFFFFFFF00FF8D
                            AC5D759E38FFFFFFFFFFFFFFFFFFB2C98F759E38759E388DAC5D696969FEFEFE
                            FFFFFFFFFFFFFFFFFFFFFFFFFF00FF759E38FFFFFFFFFFFFB2C98FFFFFFFFFFF
                            FFB2C98F759E38759E38696969FEFEFEFFFFFF5A5A5A5A5A5AFFFFFFFF00FF8D
                            AC5D759E38B2C98F759E38759E38FFFFFFFFFFFFB2C98F8DAC5D696969FEFEFE
                            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFB1C396759E38759E38759E38759E38759E
                            38FFFFFF759E38B1C396696969FEFEFEFFFFFF5A5A5A5A5A5AFFFFFFABABABFF
                            00FF99B470759E38759E38759E38759E38759E3899B470FF00FF696969FEFEFE
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEFF00FFB1C3968DAC5D759E388DAC
                            5DB1C396FF00FFFF00FF696969FEFEFEFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D
                            9D9DABABABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF696969FEFEFE
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FF696969FF00FFFF00FF696969FDFDFDFFFFFF5A5A5A5A5A5AFFFFFF9D9D9D9D
                            9D9D9D9D9D9D9D9D999999FFFFFFFFFFFF696969FF00FFFF00FF696969FDFDFD
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FF696969FF00FFFF00FFB2783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                            783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFB3783EB3783E
                            B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                            3EB3783EFF00FFFF00FFB57D46B3783EB3783EB3783EB3783EB3783EB3783EB3
                            783EB3783EB3783EB3783EB3783EB3783EB47C45FF00FFFF00FF}
                        end
                      end
                      object dbgridPedidos: TDBGrid
                        Left = 0
                        Top = 0
                        Width = 769
                        Height = 323
                        Align = alClient
                        DataSource = dtmConferenciaCega.dsCargaVenda
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnDblClick = dbgridPedidosDblClick
                        OnKeyPress = dbgridPedidosKeyPress
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'SEL'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NPED'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'TIPO'
                            Width = 64
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_EMPRESA'
                            Visible = False
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_CLIENTE'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NOME_CLIENTE'
                            Width = 64
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_VENDEDOR'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_COND_PAG'
                            Visible = False
                          end
                          item
                            Expanded = False
                            FieldName = 'DATA_FECH'
                            Width = 75
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'VALOR_TOTAL'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'OBS_PED'
                            Visible = False
                          end
                          item
                            Expanded = False
                            FieldName = 'STATUS_PED'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'TIPV'
                            Width = 64
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NCUPOM'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NUM_NF'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'SERIE_NF'
                            Width = 64
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'ATIVO'
                            Visible = False
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_CARGA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'IDMOBILE'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_CONTROLE'
                            Width = 64
                            Visible = True
                          end>
                      end
                    end
                  end
                end
                object pnEntrada: TPanel
                  Left = 3
                  Top = 44
                  Width = 321
                  Height = 254
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnEnter = pnEntradaEnter
                  object pcEntrada: TPageControl
                    Left = 0
                    Top = 0
                    Width = 317
                    Height = 250
                    ActivePage = tsPrincipal
                    Align = alClient
                    TabOrder = 0
                    object tsPrincipal: TTabSheet
                      Caption = 'tsPrincipal'
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object BitBtnVolta: TBitBtn
                        Left = 13
                        Top = 191
                        Width = 282
                        Height = 25
                        Caption = '&Voltar (Esc)'
                        ModalResult = 2
                        TabOrder = 2
                        OnKeyDown = BitBtnVoltaKeyDown
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B7
                          6311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          B46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311B76311B76311B7
                          6311B76311B76311B76311B76311B76311B76311B76311B76312B46211B76311
                          B76311B76311B76311B76311B76311B76311B76311B76311B76311B76311B763
                          11B76311B76311B76311FF00FFB46211B76311B76311B76311B76311B76311B7
                          6311B76311B76311B76311B76311B76311B76311B76311B76312FF00FFFF00FF
                          B46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B7
                          6311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                      object GroupBox7: TGroupBox
                        Left = 0
                        Top = 65
                        Width = 309
                        Height = 120
                        Align = alTop
                        Caption = 'Entrada de Mercadorias'
                        TabOrder = 1
                        object BitBtnApartirNF: TBitBtn
                          Left = 13
                          Top = 32
                          Width = 282
                          Height = 25
                          Hint = 'Apartir da nota fiscal - [RM020]'
                          Caption = 'A&partir da nota fiscal'
                          TabOrder = 0
                          OnClick = BitBtnApartirXMLClick
                          OnKeyDown = BitBtnVoltaKeyDown
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FF757575
                            3030303030303030303030303030303030303030303030303030303030303030
                            30737373FF00FFFF00FFFF00FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030FF00FFFF00FFFF00FF303030
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FF303030FF00FFFF00FFFF00FF303030FFFFFFC99167C99167C99167C99167C9
                            9167C99167C99167C99167C99167FFFFFF303030FF00FFFF00FFFF00FF303030
                            FFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFFC99167FFFF
                            FF303030FF00FFFF00FFFF00FF303030FFFFFFC99167C99167C99167C99167C9
                            9167C99167C99167C99167C99167FFFFFF303030FF00FFFF00FFFF00FF303030
                            FFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFFC99167FFFF
                            FF303030FF00FFFF00FFFF00FF303030FFFFFFC99167C99167C99167C99167C9
                            9167C99167C99167C99167C99167FFFFFF303030FF00FFFF00FFFF00FF303030
                            FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                            FF303030FF00FFFF00FFFF00FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030FF00FFFF00FFFF00FF303030
                            FFFFFFA4A4A4A4A4A4A4A4A4A4A4A4A4A4A4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FF303030FF00FFFF00FFFF00FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFF878787303030303030303030303030FF00FFFF00FFFF00FF303030
                            FFFFFF8181814E4E4E8B8B8B8B8B8B8B8B8BFFFFFF303030FFFFFFFFFFFFBEBE
                            BE646464FF00FFFF00FFFF00FF303030FFFFFFD2D2D24E4E4E8B8B8B808080B0
                            B0B0FFFFFF303030FFFFFFBFBFBF606060FF00FFFF00FFFF00FFFF00FF303030
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030BFBFBF5F5F5FFF00
                            FFFF00FFFF00FFFF00FFFF00FF75757530303030303030303030303030303030
                            3030303030303030636363FF00FFFF00FFFF00FFFF00FFFF00FF}
                        end
                        object BitBtnApartirPedC: TBitBtn
                          Left = 13
                          Top = 63
                          Width = 282
                          Height = 25
                          Hint = 'Apartir do Pedido de Compra - [RM014]'
                          Caption = 'Apartir do Pedido de &Compra'
                          TabOrder = 1
                          OnClick = BitBtnApartirPedCClick
                          OnKeyDown = BitBtnVoltaKeyDown
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FF96B6677EA94075A23373A13273A13277A33677A33673A13273A1
                            3274A1337DA9409BB970FF00FFFF00FFFF00FFFF00FF7DA9406D9C28FFFFFFFF
                            FFFFFFFFFFE0EBD3E0E9D2FFFFFFFFFFFFFFFFFF6E9C297DA840898989545454
                            545454FF00FF77A236EFF3E7FFFFFFFFFFFFC0D4A2719F2E72A02EBDD39FFFFF
                            FFFFFFFFEFF3E878A338545454FDFDFDFFFFFFFF00FF75A234FFFFFFFFFFFFFF
                            FFFF83AC497CA83F7CA83F81AB46FFFFFFFFFFFFFFFFFF77A337545454FDFDFD
                            C0987BFF00FF75A234FFFFFFFFFFFFFFFFFF83AC497CA83F7CA83F82AB46FFFF
                            FFFFFFFFFFFFFF77A337545454FDFDFDC0987BFF00FF77A236EBF1E1FFFFFFFF
                            FFFFC0D4A2719F2D719F2EBFD39FFFFFFFFFFFFFBBD19B7AA43A545454FDFDFD
                            C0987BFF00FF7DA9406D9C28FFFFFFFFFFFFFFFFFFE3EBD5E0EBD3FFFFFFFFFF
                            FFD9E6C972A02E7DA940545454FDFDFDC0987BFF00FF8FB35D7EA94075A23373
                            A13273A13277A33677A33673A13273A13277A3377EA94194B566545454FDFDFD
                            C0987BD1BFB2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF545454FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFEFEFE545454FF00FFFF00FFFF00FF545454FDFDFD
                            A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6FFFFFFFFFFFFFEFEFEFEFEFEFDFDFD5454
                            54FF00FFFF00FFFF00FF545454FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFF919191545454545454545454545454FF00FFFF00FFFF00FF545454FDFDFD
                            8D8D8D696969949494949494949494FFFFFF545454FEFEFEFFFFFFB8B8B87B7B
                            7BFF00FFFF00FFFF00FF545454FDFDFDC6C6C66969699494948C8C8CAEAEAEFF
                            FFFF545454FEFEFEB9B9B9787878FF00FFFF00FFFF00FFFF00FF545454FDFDFD
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF545454B9B9B9777777FF00FFFF00
                            FFFF00FFFF00FFFF00FF89898954545454545454545454545454545454545454
                            54545454547A7A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                        end
                      end
                      object GroupBox8: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 309
                        Height = 65
                        Align = alTop
                        Caption = 'Sa'#237'da de Mercadorias'
                        TabOrder = 0
                        object BitBtnApartirPedido: TBitBtn
                          Left = 13
                          Top = 24
                          Width = 282
                          Height = 25
                          Hint = 'Apartir do Pedido - [RM015]'
                          Caption = '&Apartir do Pedido'
                          Default = True
                          TabOrder = 0
                          OnClick = BitBtnApartirPedidoClick
                          OnKeyDown = BitBtnVoltaKeyDown
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE5400AE5400AE54
                            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFAE5400AE5400AE5400FF00FFFF00FF757575303030
                            303030303030303030303030FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE54
                            00AE5400AE5400FF00FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFAE
                            5400AE5400AE5400AE5400AE5400AE5400AE5400AE5400AF5705303030FFFFFF
                            C99167C99167C99167C99167FF00FFAE5400AE5400AE5400AE5400AE5400AE54
                            00AE5400AE5400AE5400303030FFFFFFC99167FFFFFFFFFFFFFFFFFFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFAE5400AE5400AE5400FF00FF303030FFFFFF
                            C99167FFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFF8F8F8FF00FFAE5400AE54
                            00AE5400FF00FFFF00FF303030FFFFFFC99167C99167C99167C99167C99167C9
                            9167CDA180FF00FFAE5400AE5400AE5400FF00FFFF00FFFF00FF303030FFFFFF
                            C99167C99167C99167C99167C99167C99167FF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFF303030FF00FFFF00FFFF00FF303030FFFFFF
                            A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3030
                            30FF00FFFF00FFFF00FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFF878787303030303030303030303030FF00FFFF00FFFF00FF303030FFFFFF
                            8181814E4E4E8B8B8B8B8B8B8B8B8BFFFFFF303030FFFFFFFFFFFFBEBEBE6464
                            64FF00FFFF00FFFF00FF303030FFFFFFD2D2D24E4E4E8B8B8B808080B0B0B0FF
                            FFFF303030FFFFFFBFBFBF606060FF00FFFF00FFFF00FFFF00FF303030FFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030BFBFBF5F5F5FFF00FFFF00
                            FFFF00FFFF00FFFF00FF75757530303030303030303030303030303030303030
                            3030303030636363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                        end
                      end
                    end
                    object tsPedido: TTabSheet
                      Caption = 'tsPedido'
                      ImageIndex = 1
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object Label6: TLabel
                        Left = 70
                        Top = 56
                        Width = 172
                        Height = 13
                        Caption = 'Numero do Pedido de Compra: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object edtPedido: TEdit
                        Left = 94
                        Top = 79
                        Width = 121
                        Height = 21
                        TabOrder = 0
                        OnKeyDown = BitBtnVoltaPedidoKeyDown
                      end
                      object BitBtnOkPedido: TBitBtn
                        Left = 13
                        Top = 106
                        Width = 282
                        Height = 25
                        Caption = '&Ok'
                        ModalResult = 1
                        TabOrder = 1
                        OnClick = BitBtnOkPedidoClick
                        OnKeyDown = BitBtnVoltaPedidoKeyDown
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFB0C49597B56E8BAE5B8BAE5C98B670B1C597FF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0C49583A94E81A84B81A84B81
                          A84B81A84B81A84B81A84B84A94FB3C599FF00FFFF00FFFF00FFFF00FFFF00FF
                          A0BA7B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A8
                          4BA3BC81FF00FFFF00FFFF00FFAFC39381A84B81A84B81A84B81A84BA6C180AE
                          C68B81A84B81A84B81A84B81A84B81A84B81A84BB3C599FF00FFFF00FF83A94E
                          81A84B81A84B81A84BA6C181FCFCFAFDFDFCACC58881A84B81A84B81A84B81A8
                          4B81A84B84AA50FF00FFAEC39281A84B81A84B81A84BA8C281FCFDFAFFFFFFFF
                          FFFFFDFDFCACC58981A84B81A84B81A84B81A84B81A84BB2C59895B46A81A84B
                          81A84BA8C282FCFDFBFFFFFFEDF2E5EFF3E8FFFFFFFDFDFCADC58981A84B81A8
                          4B81A84B81A84B99B67088AC5781A84B8BAE59F9FBF6FFFFFFEDF2E58FB15E90
                          B260EEF3E8FFFFFFFDFDFCADC58A81A84B81A84B81A84B8CAE5D88AC5681A84B
                          81A84BA6C181EAF0E18FB15F81A84B81A84B90B160EEF3E8FFFFFFFDFDFCAEC6
                          8B81A84B81A84B8CAE5C94B36981A84B81A84B81A84B82A94D81A84B81A84B81
                          A84B81A84B90B160EEF3E6FFFFFFFDFEFDADC58981A84B97B56EACC18F81A84B
                          81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B8FB160EEF3E6F6F9
                          F39AB96E81A84BB0C394FF00FF82A84C81A84B81A84B81A84B81A84B81A84B81
                          A84B81A84B81A84B81A84B8FB15F9BB96F81A84B83A94EFF00FFFF00FFABC18D
                          81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A8
                          4B81A84BAFC393FF00FFFF00FFFF00FF9AB77381A84B81A84B81A84B81A84B81
                          A84B81A84B81A84B81A84B81A84B81A84B9EB978FF00FFFF00FFFF00FFFF00FF
                          FF00FFA9C08A81A84C81A84B81A84B81A84B81A84B81A84B81A84B82A84CACC1
                          8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAAC08B90B16385
                          AA5185AA5291B164ABC18DFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                      object BitBtnVoltaPedido: TBitBtn
                        Left = 13
                        Top = 137
                        Width = 282
                        Height = 25
                        Caption = '&Voltar (Esc)'
                        Default = True
                        TabOrder = 2
                        OnClick = BitBtnVoltaPedidoClick
                        OnKeyDown = BitBtnVoltaPedidoKeyDown
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B7
                          6311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          B46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311B76311B76311B7
                          6311B76311B76311B76311B76311B76311B76311B76311B76312B46211B76311
                          B76311B76311B76311B76311B76311B76311B76311B76311B76311B76311B763
                          11B76311B76311B76311FF00FFB46211B76311B76311B76311B76311B76311B7
                          6311B76311B76311B76311B76311B76311B76311B76311B76312FF00FFFF00FF
                          B46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B7
                          6311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                    end
                    object tsCarga: TTabSheet
                      Caption = 'tsCarga'
                      ImageIndex = 2
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object lbEntrada: TLabel
                        Left = 94
                        Top = 60
                        Width = 80
                        Height = 13
                        Caption = 'Numero Carga'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object edtCargaPedido: TEdit
                        Left = 94
                        Top = 79
                        Width = 121
                        Height = 21
                        TabOrder = 0
                        OnKeyDown = BitBtnVoltaPedidoKeyDown
                      end
                      object BitBtnOkCargaPedido: TBitBtn
                        Left = 13
                        Top = 106
                        Width = 282
                        Height = 25
                        Caption = '&Ok'
                        Default = True
                        TabOrder = 1
                        OnClick = BitBtnOkCargaPedidoClick
                        OnKeyDown = BitBtnVoltaPedidoKeyDown
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFB0C49597B56E8BAE5B8BAE5C98B670B1C597FF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB0C49583A94E81A84B81A84B81
                          A84B81A84B81A84B81A84B84A94FB3C599FF00FFFF00FFFF00FFFF00FFFF00FF
                          A0BA7B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A8
                          4BA3BC81FF00FFFF00FFFF00FFAFC39381A84B81A84B81A84B81A84BA6C180AE
                          C68B81A84B81A84B81A84B81A84B81A84B81A84BB3C599FF00FFFF00FF83A94E
                          81A84B81A84B81A84BA6C181FCFCFAFDFDFCACC58881A84B81A84B81A84B81A8
                          4B81A84B84AA50FF00FFAEC39281A84B81A84B81A84BA8C281FCFDFAFFFFFFFF
                          FFFFFDFDFCACC58981A84B81A84B81A84B81A84B81A84BB2C59895B46A81A84B
                          81A84BA8C282FCFDFBFFFFFFEDF2E5EFF3E8FFFFFFFDFDFCADC58981A84B81A8
                          4B81A84B81A84B99B67088AC5781A84B8BAE59F9FBF6FFFFFFEDF2E58FB15E90
                          B260EEF3E8FFFFFFFDFDFCADC58A81A84B81A84B81A84B8CAE5D88AC5681A84B
                          81A84BA6C181EAF0E18FB15F81A84B81A84B90B160EEF3E8FFFFFFFDFDFCAEC6
                          8B81A84B81A84B8CAE5C94B36981A84B81A84B81A84B82A94D81A84B81A84B81
                          A84B81A84B90B160EEF3E6FFFFFFFDFEFDADC58981A84B97B56EACC18F81A84B
                          81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B8FB160EEF3E6F6F9
                          F39AB96E81A84BB0C394FF00FF82A84C81A84B81A84B81A84B81A84B81A84B81
                          A84B81A84B81A84B81A84B8FB15F9BB96F81A84B83A94EFF00FFFF00FFABC18D
                          81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A84B81A8
                          4B81A84BAFC393FF00FFFF00FFFF00FF9AB77381A84B81A84B81A84B81A84B81
                          A84B81A84B81A84B81A84B81A84B81A84B9EB978FF00FFFF00FFFF00FFFF00FF
                          FF00FFA9C08A81A84C81A84B81A84B81A84B81A84B81A84B81A84B82A84CACC1
                          8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAAC08B90B16385
                          AA5185AA5291B164ABC18DFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                      object BitBtnVoltaCargaPedido: TBitBtn
                        Left = 13
                        Top = 137
                        Width = 282
                        Height = 25
                        Caption = '&Voltar (Esc)'
                        TabOrder = 2
                        OnClick = BitBtnVoltaPedidoClick
                        OnKeyDown = BitBtnVoltaPedidoKeyDown
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B7
                          6311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          B46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311B76311B76311B7
                          6311B76311B76311B76311B76311B76311B76311B76311B76312B46211B76311
                          B76311B76311B76311B76311B76311B76311B76311B76311B76311B76311B763
                          11B76311B76311B76311FF00FFB46211B76311B76311B76311B76311B76311B7
                          6311B76311B76311B76311B76311B76311B76311B76311B76312FF00FFFF00FF
                          B46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB46211B76311B7
                          6311B76311FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFB46211B76311B76311B76311FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                      object rgEntrada: TRadioGroup
                        Left = 3
                        Top = 3
                        Width = 303
                        Height = 51
                        Columns = 2
                        Enabled = False
                        ItemIndex = 0
                        Items.Strings = (
                          'Carga'
                          'Pedido em lote pela Carga'
                          'Pedido'
                          'Pedidos em Sera'#231#227'o')
                        TabOrder = 3
                        OnClick = rgEntradaClick
                      end
                    end
                  end
                end
                object pnImpressao: TPanel
                  Left = 554
                  Top = -10
                  Width = 230
                  Height = 201
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 2
                  object rgTipo: TRadioGroup
                    Left = 6
                    Top = 6
                    Width = 214
                    Height = 109
                    Align = alClient
                    Caption = 'Tipo de Impress'#227'o'
                    ItemIndex = 0
                    Items.Strings = (
                      '01 - Guia Cega'
                      '02 - Diverg'#234'ncias de Contagem')
                    TabOrder = 0
                  end
                  object Panel23: TPanel
                    Left = 6
                    Top = 150
                    Width = 214
                    Height = 41
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object BitBtn29: TBitBtn
                      Left = 24
                      Top = 6
                      Width = 75
                      Height = 25
                      Hint = 'Imprimir'
                      Caption = 'Imprimir'
                      ModalResult = 1
                      TabOrder = 0
                      OnClick = BitBtn29Click
                      Glyph.Data = {
                        42020000424D4202000000000000420000002800000010000000100000000100
                        10000300000000020000120B0000120B00000000000000000000007C0000E003
                        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                        4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                        92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                        EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                        734EF75E104210429452AE358610861086108610861086108610861086108610
                        AE35945210423146F75EAE358610861086108610861086108610861086108610
                        AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                        9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                        F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                        B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                        1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                        1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C}
                    end
                    object BitBtn30: TBitBtn
                      Left = 105
                      Top = 6
                      Width = 75
                      Height = 25
                      Hint = 'Cancelar'
                      Caption = 'Cancelar'
                      ModalResult = 2
                      TabOrder = 1
                      Glyph.Data = {
                        42020000424D4202000000000000420000002800000010000000100000000100
                        10000300000000020000120B0000120B00000000000000000000007C0000E003
                        00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
                        83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
                        835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
                        835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
                        835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
                        A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
                        A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
                        A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
                        A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
                        A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
                        E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
                        0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
                        0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
                        C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
                        8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
                        E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
                        C160C260D472}
                    end
                  end
                  object rgOrdenar: TRadioGroup
                    Left = 6
                    Top = 115
                    Width = 214
                    Height = 35
                    Align = alBottom
                    Caption = 'Ordenar Mercadorias Por'
                    Columns = 3
                    ItemIndex = 0
                    Items.Strings = (
                      'N'#186' Item'
                      'Grupo'
                      'Descri'#231#227'o')
                    TabOrder = 2
                  end
                end
                object pnConfirma: TPanel
                  Left = 323
                  Top = 129
                  Width = 321
                  Height = 254
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 3
                  object gbConfirma: TGroupBox
                    Left = 8
                    Top = 0
                    Width = 301
                    Height = 241
                    Caption = 'Fechamento'
                    TabOrder = 0
                    object btnImprimeRelatorio: TBitBtn
                      Left = 10
                      Top = 24
                      Width = 282
                      Height = 30
                      Caption = '&Imprimir Relat'#243'rio de Diverg'#234'ncias'
                      TabOrder = 0
                      OnClick = btnImprimeRelatorioClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FF959595787878787878787878787878787878787878939393FF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878FEFEFEFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFF797979FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FF787878FFFFFFD9BB9ED9BB9ED9BB9ED9BB9EFFFFFF797979FF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878FFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFF797979FF00FFFF00FFFF00FFFF00FF868686787878
                        787878787878787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7979797878
                        787878787878788C8C8C787878FF00FFFF00FF78787878787878787878787878
                        7878787878787878787878787878787878787878787878787878787878787878
                        7878787878787878787878787878787878787878787878787878787878787878
                        7878787878787878787878787878787878787878787878787878787878787878
                        7878787878787878787878787878787878787878787878787878787878787878
                        D7D7D7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
                        FED9D9D9787878787878787878787878FCFCFCBC8956B3783EB3783EB3783EB3
                        783EB3783EB3783EB3783EB3783EBD8957FEFEFE787878787878787878787878
                        FBFBFAB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                        3EFDFDFC787878787878848484787878FBFBFAB3783EB3783EB3783EB3783EB3
                        783EB3783EB3783EB3783EB3783EB3783EFDFDFC787878898989FF00FFFF00FF
                        FF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                        3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7AFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFEFEFE787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FF7A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE787878FF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93939378787878787878
                        7878787878787878787878959595FF00FFFF00FFFF00FFFF00FF}
                    end
                    object btnRecontarDivergentes: TBitBtn
                      Left = 10
                      Top = 60
                      Width = 282
                      Height = 30
                      Caption = '&Segunda Contagem - Apenas Itens Diverg'#234'ntes'
                      Enabled = False
                      ModalResult = 1
                      TabOrder = 1
                      OnClick = btnRecontarDivergentesClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF699A22FF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FF77BBE75EB3E95EB3E95EB3E95EB3E95FB3E8B2D0E3FF
                        00FF67991F67991F67991FFF00FFFF00FFFF00FFFF00FFFF00FF60B3E85EB3E9
                        5EB3E95EB3E95FB3E8B0D0E3FF00FF67991F67991F67991F67991F67991FFF00
                        FFFF00FFFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFFF2F2F2FF00FF67991F67
                        991F67991FFF00FF729F3067991F67991FFF00FFFF00FFFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFFF3F3F3FF00FF67991F67991FFF00FFFF00FFFF00FF6C9C286799
                        1F67991FFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFFFEFEFE959ED6FF00FFFF
                        00FFE8E8E8FEFEFEEDEDEDFF00FF699A2367991F67991FFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFF253DC6253DC67785D1848FD3FEFEFEFFFFFFFEFEFEAECFE4FF00
                        FF67992067991F699A225EB3E95EB3E9FFFFFFFFFFFF253DC6FFFFFFFFFFFF25
                        3DC6253DC6FFFFFFFFFFFF5FB3E8B0CFE3FF00FF67991FFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EB3E960B3
                        E8FF00FFFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFFFFFFFF253DC6253DC6FD
                        FDFDFCFCFCFFFFFFFFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFF253DC6253DC6253DC6253DC6FFFFFFFFFFFFFFFFFF5EB3E95FB3
                        E8FF00FFFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFF253DC6FFFFFFFFFFFF25
                        3DC6253DC6FFFFFFFFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EB3E95FB3
                        E8FF00FFFF00FFFF00FF60B3E85EB3E9FFFFFF8D8D8D71717171717171717171
                        7171717171898989FFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF77BBE75EB3E9
                        62B4E797BED79EABB37A7B7B717171797A7AA2ABB19DBED363B4E75EB3E976BB
                        E7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5A7A9717171A2
                        A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                    object btnRecontarTodos: TBitBtn
                      Left = 10
                      Top = 96
                      Width = 282
                      Height = 30
                      Caption = 'S&egunda Contagem - Todos Itens'
                      Enabled = False
                      ModalResult = 1
                      TabOrder = 2
                      OnClick = btnRecontarTodosClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FF8BC2DD51ABD751ABD751ABD751ABD751ABD751AB
                        D7FFFFFFB9E9FCFF00FF77BBE75EB3E95EB3E95EB3E95EB3E9FF00FF51ABD751
                        ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF51ABD790C4DE60B3E85EB3E9
                        5EB3E95EB3E95EB3E9FF00FF51ABD751ABD751ABD751ABD751ABD751ABD751AB
                        D7FFFFFF51ABD751ABD75EB3E95EB3E9FFFFFFFFFFFFFFFFFFFF00FF51ABD751
                        ABD751ABD7FFFFFFFFFFFF51ABD751ABD7FFFFFF51ABD751ABD75EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFF00FF51ABD751ABD751ABD7FFFFFFFFFFFF51ABD751AB
                        D7FFFFFF51ABD751ABD75EB3E95EB3E9FFFFFFFFFFFFFFFFFFFF00FF51ABD751
                        ABD751ABD7FFFFFFFFFFFF51ABD751ABD7FFFFFF51ABD751ABD75EB3E95EB3E9
                        FFFFFFFFFFFF253DC6FF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFB2E7FF51ABD75EB3E95EB3E9FFFFFFFFFFFF253DC6FF00FF53AEDB53
                        AEDB53AEDBC1F0FFFFFFFFD7FFFF51ABD751ABD7E2FFFF51ABD75EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFF00FFFF00FFA6CCDE53AEDB53AEDBBCEEFFFFFFFF90D3
                        F451ABD751ABD7DCFFFF5EB3E95EB3E9FFFFFFFFFFFFFFFFFF273EC67785D1FF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFF253DC6253DC6253DC6253DC6FFFFFFFFFFFFFFFFFF5EB3E95FB3
                        E8FF00FFFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFF253DC6FFFFFFFFFFFF25
                        3DC6253DC6FFFFFFFFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EB3E95FB3
                        E8FF00FFFF00FFFF00FF60B3E85EB3E9FFFFFF8D8D8D71717171717171717171
                        7171717171898989FFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF77BBE75EB3E9
                        62B4E797BED79EABB37A7B7B717171797A7AA2ABB19DBED363B4E75EB3E976BB
                        E7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5A7A9717171A2
                        A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                    object btnTerceiraContagemDivergentes: TBitBtn
                      Left = 10
                      Top = 132
                      Width = 282
                      Height = 30
                      Hint = 'Destravar Terceira Contagem - [RM007]'
                      Caption = '&Terceira Contagem - Apenas Itens Diverg'#234'ntes'
                      Enabled = False
                      ModalResult = 1
                      TabOrder = 3
                      OnClick = btnTerceiraContagemDivergentesClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FF50ADE7FF00FFFF00FF77BBE75EB3E95EB3E95EB3E95EB3E95EB3E95EB3E95E
                        B3E95EB3E95EB3E9A8CDE4FF00FF42A7E550ADE742A7E5FF00FF60B3E85EB3E9
                        5EB3E95EB3E95EB3E95EB3E95EB3E95EB3E95EB3E95EB3E9A8CDE442A7E542A7
                        E550ADE7FF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFEDEDED42A7E542A7E550ADE750ADE7FF00FF5EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FF00FF42A7E542A7
                        E550ADE7FF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFFFFFFFF253DC6253DC6FD
                        FDFDFAFAFAFF00FF82BEE250ADE750ADE750ADE750ADE782BEE25EB3E95EB3E9
                        FFFFFFFFFFFF253DC6253DC6253DC6253DC6F8F8F8FF00FF42A7E550ADE750AD
                        E750ADE750ADE750ADE75EB3E95EB3E9FFFFFFFFFFFF253DC6FFFFFFFFFFFF25
                        3DC65062CCFF00FF42A7E550ADE7FF00FFFF00FF50ADE750ADE75EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF00FF42A7E550ADE7FF00
                        FFFF00FF50ADE750ADE75EB3E95EB3E9FFFFFFFFFFFFFFFFFF253DC6253DC6FD
                        FDFDFAFAFAFF00FF82BEE250ADE750ADE750ADE750ADE782BEE25EB3E95EB3E9
                        FFFFFFFFFFFF253DC6253DC6253DC6253DC6FFFFFFF2F2F2FF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFF253DC6FFFFFFFFFFFF25
                        3DC6253DC6FFFFFFFEFEFE73BAE778BCE7FF00FFFF00FFFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EB3E95FB3
                        E8FF00FFFF00FFFF00FF60B3E85EB3E9FFFFFF8D8D8D71717171717171717171
                        7171717171898989FFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF77BBE75EB3E9
                        62B4E797BED79EABB37A7B7B717171797A7AA2ABB19DBED363B4E75EB3E976BB
                        E7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5A7A9717171A2
                        A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                    object btnFecharComDivergencias: TBitBtn
                      Left = 10
                      Top = 205
                      Width = 282
                      Height = 30
                      Hint = 'Fechar Confer'#234'ncia Cega - [RM008]'
                      Caption = '&Fechar Conf'#234'rencia Cega'
                      ModalResult = 1
                      TabOrder = 4
                      OnClick = btnFecharComDivergenciasClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFA1C9E465B6E965B6E965B6E965B6E965B6E965B6
                        E965B6E965B6E9A1C9E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6AB5E765
                        B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E96AB5E7FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FF65B6E965B6E965B6E965B6E965B6E965B6E965B6
                        E965B6E966B7EA65B6E9A1C9E465B6E965B6E965B6E965B6E9FF00FF65B6E965
                        B6E965B6E965B6E965B6E965B6E965B6E965B6E966B7EA65B6E96AB5E765B6E9
                        65B6E965B6E965B6E9FF00FF65B6E965B6E965B6E965B6E965B6E965B6E965B6
                        E965B6E966B7EA65B6E965B6E965B6E965B6E965B6E965B6E9FF00FF65B6E965
                        B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E9
                        65B6E965B6E965B6E9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FF65B6E965B6E965B6E965B6E965B6E9FF00FF78787878
                        78787878787878787878787878787878787878787878787C7C7C65B6E965B6E9
                        65B6E965B6E965B6E9FF00FF8F8F8F7878787878787777778F8F8FFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878787878
                        7878787878787878787878787878787878787878787C7C7CFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FF8F8F8F7878787878787878788F8F8FFF00FFFF00FFFF
                        00FFFF00FFFF00FFA55F1AA55F1AFF00FFFF00FFFF00FFA25E1AFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA55F1AA55F1AFF00FFFF00
                        FFFF00FFA25E1AC6A98CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFA55F1AA55F1AA55F1AA55F1AA55F1AA55F1AC6A98CFF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA55F1AA55F1AFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFA55F1AA55F1AFF00FFFF00FFFF00FFFF00FF}
                    end
                    object btnTerceiraContagemTodos: TBitBtn
                      Left = 10
                      Top = 168
                      Width = 282
                      Height = 30
                      Hint = 'Destravar Terceira Contagem - [RM007]'
                      Caption = 'Te&rceira Contagem - Todos Itens'
                      Enabled = False
                      ModalResult = 1
                      TabOrder = 5
                      OnClick = btnTerceiraContagemTodosClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FF8BC2DD51ABD751ABD751ABD751ABD751ABD751AB
                        D7FFFFFFB9E9FCFF00FF77BBE75EB3E95EB3E95EB3E95EB3E9FF00FF51ABD751
                        ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF51ABD790C4DE60B3E85EB3E9
                        5EB3E95EB3E95EB3E9FF00FF51ABD751ABD751ABD751ABD751ABD751ABD751AB
                        D7FFFFFF51ABD751ABD75EB3E95EB3E9FFFFFFFFFFFFFFFFFFFF00FF51ABD751
                        ABD751ABD7FFFFFFFFFFFF51ABD751ABD7FFFFFF51ABD751ABD75EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFF00FF51ABD751ABD751ABD7FFFFFFFFFFFF51ABD751AB
                        D7FFFFFF51ABD751ABD75EB3E95EB3E9FFFFFFFFFFFFFFFFFFFF00FF51ABD751
                        ABD751ABD7FFFFFFFFFFFF51ABD751ABD7FFFFFF51ABD751ABD75EB3E95EB3E9
                        FFFFFFFFFFFF253DC6FF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFB2E7FF51ABD75EB3E95EB3E9FFFFFFFFFFFF253DC6FF00FF53AEDB53
                        AEDB53AEDBC1F0FFFFFFFFD7FFFF51ABD751ABD7E2FFFF51ABD75EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFF00FFFF00FFA6CCDE53AEDB53AEDBBCEEFFFFFFFF90D3
                        F451ABD751ABD7DCFFFF5EB3E95EB3E9FFFFFFFFFFFFFFFFFF273EC67785D1FF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFF253DC6253DC6253DC6253DC6FFFFFFFFFFFFFFFFFF5EB3E95FB3
                        E8FF00FFFF00FFFF00FF5EB3E95EB3E9FFFFFFFFFFFF253DC6FFFFFFFFFFFF25
                        3DC6253DC6FFFFFFFFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF5EB3E95EB3E9
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EB3E95FB3
                        E8FF00FFFF00FFFF00FF60B3E85EB3E9FFFFFF8D8D8D71717171717171717171
                        7171717171898989FFFFFF5EB3E95FB3E8FF00FFFF00FFFF00FF77BBE75EB3E9
                        62B4E797BED79EABB37A7B7B717171797A7AA2ABB19DBED363B4E75EB3E976BB
                        E7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5A7A9717171A2
                        A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 2
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object gbCabecalho: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 97
                    Align = alTop
                    Caption = 'Cabe'#231'alho'
                    TabOrder = 0
                    object lbCodigo: TLabel
                      Left = 37
                      Top = 29
                      Width = 38
                      Height = 13
                      Caption = 'C'#243'digo'
                      FocusControl = dbedtCodigo
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object lbCodCliente: TLabel
                      Left = 9
                      Top = 56
                      Width = 66
                      Height = 13
                      Caption = 'Cod. Cliente'
                      FocusControl = dbedtCodCliente
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object lbTipoConf: TLabel
                      Left = 158
                      Top = 29
                      Width = 94
                      Height = 13
                      Caption = 'Tipo Conferencia'
                      FocusControl = dbedtTipoConf
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object lbStatus: TLabel
                      Left = 320
                      Top = 29
                      Width = 37
                      Height = 13
                      Caption = 'Status'
                      FocusControl = dbedtStatus
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object lbNumDoc: TLabel
                      Left = 464
                      Top = 56
                      Width = 49
                      Height = 13
                      Caption = 'Num Doc'
                      FocusControl = dbedtNumDoc
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object lbDataDoc: TLabel
                      Left = 596
                      Top = 56
                      Width = 51
                      Height = 13
                      Caption = 'Data Doc'
                      FocusControl = dbedtDataDoc
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object Label8: TLabel
                      Left = 464
                      Top = 29
                      Width = 67
                      Height = 13
                      Caption = 'Conferencia'
                      FocusControl = dbedtContagem
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object dbedtCodigo: TDBEdit
                      Left = 81
                      Top = 26
                      Width = 71
                      Height = 21
                      DataField = 'COD_CONFERENCIA'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      Enabled = False
                      TabOrder = 0
                    end
                    object dbedtCodCliente: TDBEdit
                      Left = 81
                      Top = 53
                      Width = 71
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      ReadOnly = True
                      TabOrder = 1
                      Visible = False
                    end
                    object dbedtTipoConf: TDBEdit
                      Left = 258
                      Top = 26
                      Width = 56
                      Height = 21
                      DataField = 'TIPO_CONFERENCIA'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      Enabled = False
                      TabOrder = 2
                    end
                    object dbedtStatus: TDBEdit
                      Left = 363
                      Top = 26
                      Width = 95
                      Height = 21
                      DataField = 'STATUS'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 3
                    end
                    object dbedtNumDoc: TDBEdit
                      Left = 519
                      Top = 53
                      Width = 71
                      Height = 21
                      DataField = 'NUM_DOC'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      Enabled = False
                      ReadOnly = True
                      TabOrder = 4
                      Visible = False
                    end
                    object dbedtDataDoc: TDBEdit
                      Left = 655
                      Top = 53
                      Width = 107
                      Height = 21
                      DataField = 'DATA_DOC'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      ReadOnly = True
                      TabOrder = 5
                      Visible = False
                    end
                    object dbedtNomeCliente: TDBEdit
                      Left = 158
                      Top = 53
                      Width = 300
                      Height = 21
                      DataField = 'NOME_CLIENTE'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      ReadOnly = True
                      TabOrder = 6
                      Visible = False
                    end
                    object dbedtContagem: TDBEdit
                      Left = 537
                      Top = 26
                      Width = 107
                      Height = 21
                      DataField = 'CONTAGEM'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 7
                    end
                  end
                  object gbItens: TGroupBox
                    Left = 0
                    Top = 97
                    Width = 771
                    Height = 330
                    Align = alClient
                    Caption = 'Itens'
                    TabOrder = 1
                    object pnItensConferencia: TPanel
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 313
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object pnDbgrid: TPanel
                        Left = 0
                        Top = 0
                        Width = 763
                        Height = 213
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object DBGridItens: TDBGrid
                          Left = 0
                          Top = 0
                          Width = 763
                          Height = 185
                          Align = alClient
                          DataSource = dsConfCegaItens
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          OnDrawColumnCell = DBGridItensDrawColumnCell
                        end
                        object pnNavegacao: TPanel
                          Left = 0
                          Top = 185
                          Width = 763
                          Height = 28
                          Align = alBottom
                          BevelOuter = bvNone
                          TabOrder = 1
                          object sbFirst: TSpeedButton
                            Left = 667
                            Top = 0
                            Width = 24
                            Height = 28
                            Align = alRight
                            Flat = True
                            Glyph.Data = {
                              F6060000424DF606000000000000360000002800000018000000180000000100
                              180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                              00FFFF00FFFF00FF557D69347A58327A58317857317857317857317857317857
                              317857317857317857317857317857317857317857317857317857337857517A
                              66FF00FFFF00FFFF00FFFF00FF23835A59D4AF6AEBC86AEBC86AEBC86AEBC86A
                              EBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC8
                              6AEBC86AEBC857D1AD237F57FF00FFFF00FF58967A5CD8B360E3C150D7B44FD6
                              B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44F
                              D6B44FD6B44FD6B44FD6B450D7B561E4C158D3AE527C68FF00FF31866162E4C1
                              4AD2B047D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0
                              AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE4BD3B162E4C2327E5CFF
                              00FF2E87625EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                              47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2
                              B05EE1BF2F805EFF00FF2E89645EE1BF48D1AF47D0AE47D0AE47D0AE2C806B2B
                              7D6946CDAB47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE3CAF9247D0AE
                              47D0AE47D0AE49D2B05EE1BF2F8260FF00FF2E8B655EE1BF48D1AF47D0AE47D0
                              AE47D0AE05090803030344C7A747D0AE47D0AE47D0AE47D0AE47D0AE41BD9E1F
                              564805090847D0AE47D0AE47D0AE49D2B05EE1BF2F8461FF00FF2D8C675EE1BF
                              49D1AF47D0AE47D0AE47D0AE0A0E0C08080744C7A747D0AE47D0AE47D0AE45C8
                              A7296E5C0B110F080807090B0A47D0AE47D0AE47D0AE49D2B05EE1BF2F8563FF
                              00FF2D8E6A5EE2C04BD3B249D2B149D2B149D2B11014120E0E0D46CAAA49D2B1
                              48D0AF34877214221E0E0E0D0E0E0D0E0E0D0F111049D2B149D2B149D2B14CD3
                              B35FE2C02F8865FF00FF2C916C5FE3C14ED5B64CD4B54CD4B54CD4B5181A1816
                              14134ACCAE3D9E882037301614131614131614131614131614131717164CD4B5
                              4CD4B54CD4B54ED6B760E3C12E8A67FF00FF2C936E61E4C351D8BB50D7BA50D7
                              BA50D7BA20221F1E1C1A2A4A421E1C1A1E1C1A1E1C1A1E1C1A1E1C1A1E1C1A1E
                              1C1A1F1F1D50D7BA50D7BA50D7BA52D8BB61E4C32E8B6AFF00FF2C947162E5C5
                              55DBC054DAC054DAC054DAC02629272523222523222523222523222523222523
                              2225232225232225232226262454DAC054DAC054DAC056DCC062E5C52E8D6CFF
                              00FF2C977364E6C75ADEC659DEC659DEC659DEC62E312E2D2B2933433E2D2B29
                              2D2B292D2B292D2B292D2B292D2B292D2B292E2E2B59DEC659DEC659DEC65ADF
                              C664E6C72D906FFF00FF2C997665E7C95EE1CB5DE1CB5DE1CB5DE1CB36373535
                              32305AD6C14B968938413D3532303532303532303532303532303635325DE1CB
                              5DE1CB5DE1CB5EE2CB65E7C92D9170FF00FF2C9B7866E8CA61E4D061E4D061E4
                              D061E4D03D3E3B3C39365FDCC961E4D05FDBC84C8A7F3D403C3C39363C39363C
                              39363D3C3861E4D061E4D061E4D061E4CF66E8CA2E9373FF00FF2B9D7A67E9CC
                              64E6D364E6D464E6D464E6D4444441433F3C62DFCD64E6D464E6D464E6D460D4
                              C34E7E7543413E433F3C44423E64E6D464E6D464E6D464E6D367E9CC2D9575FF
                              00FF2B9F7C68EACD66E8D666E8D666E8D666E8D649494648444165E1CF66E8D6
                              66E8D666E8D666E8D666E8D660CBBC50726B48474366E8D666E8D666E8D666E8
                              D568EACD2D9776FF00FF2BA07E68EACD66E8D666E8D766E8D766E8D759A19659
                              9F9465E5D466E8D766E8D766E8D766E8D766E8D766E8D766E8D75EBEB166E8D7
                              66E8D766E8D766E8D568EACD2C9979FF00FF2BA27F68EACD66E8D666E8D766E8
                              D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766
                              E8D766E8D766E8D766E8D766E8D766E8D568EACD2D9B7BFF00FF2DA38268E9CE
                              66E8D666E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8
                              D766E8D766E8D766E8D766E8D766E8D766E8D766E8D767E8D668E9CE2F9C7DFF
                              00FF53B1975BDDC77BECDE76EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC
                              75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC76EBDC7AEC
                              DE56DAC3539785FF00FFFF00FF23A8877CE4D59EF4EB9FF4EB9FF4EB9FF4EB9F
                              F4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB
                              9FF4EB9EF4EB7AE3D322A684FF00FFFF00FFFF00FFFF00FF57B49C32A88931A9
                              8931A98931A98931A98931A98931A98931A98931A98931A98931A98931A98931
                              A98931A98931A98931A98932A88859B49CFF00FFFF00FFFF00FF}
                            OnClick = sbFirstClick
                            ExplicitLeft = 642
                            ExplicitTop = 39
                            ExplicitHeight = 24
                          end
                          object sbPrevious: TSpeedButton
                            Left = 691
                            Top = 0
                            Width = 24
                            Height = 28
                            Align = alRight
                            Flat = True
                            Glyph.Data = {
                              F6060000424DF606000000000000360000002800000018000000180000000100
                              180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                              00FFFF00FFFF00FF557D69347A58327A58317857317857317857317857317857
                              317857317857317857317857317857317857317857317857317857337857517A
                              66FF00FFFF00FFFF00FFFF00FF23835A59D4AF6AEBC86AEBC86AEBC86AEBC86A
                              EBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC8
                              6AEBC86AEBC857D1AD237F57FF00FFFF00FF58967A5CD8B360E3C150D7B44FD6
                              B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44F
                              D6B44FD6B44FD6B44FD6B450D7B561E4C158D3AE527C68FF00FF31866162E4C1
                              4AD2B047D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0
                              AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE4BD3B162E4C2327E5CFF
                              00FF2E87625EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                              47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2
                              B05EE1BF2F805EFF00FF2E89645EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47
                              D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE39A78C46CCAB47D0AE
                              47D0AE47D0AE49D2B05EE1BF2F8260FF00FF2E8B655EE1BF48D1AF47D0AE47D0
                              AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE3FB89A1D4E4205
                              060544C7A747D0AE47D0AE47D0AE49D2B05EE1BF2F8461FF00FF2D8C675EE1BF
                              49D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE44C5A52768
                              580B100E09090809090844C7A747D0AE47D0AE47D0AE49D2B05EE1BF2F8563FF
                              00FF2D8E6A5EE2C04BD3B249D2B149D2B149D2B149D2B149D2B149D2B148D0AF
                              32836F15201C100F0E100F0E100F0E100F0E46CAAA49D2B149D2B149D2B14CD3
                              B35FE2C02F8865FF00FF2C916C5FE3C14ED5B64CD4B54CD4B54CD4B54CD4B54C
                              D4B53D9C8620352F1715141715141715141715141715141715144ACCAE4CD4B5
                              4CD4B54CD4B54ED6B760E3C12E8A67FF00FF2C936E61E4C351D8BB50D7BA50D7
                              BA50D7BA47B49C2C4D451F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F
                              1D1B4ECFB350D7BA50D7BA50D7BA52D8BB61E4C32E8B6AFF00FF2C947162E5C5
                              55DBC054DAC054DAC04292822625232624222624222624222624222624222624
                              2226242226242226242252D2B954DAC054DAC054DAC056DCC062E5C52E8D6CFF
                              00FF2C977364E6C75ADEC659DEC659DEC659DEC64AA6943446412E2B292E2B29
                              2E2B292E2B292E2B292E2B292E2B292E2B2957D6BF59DEC659DEC659DEC65ADF
                              C664E6C72D906FFF00FF2C997665E7C95EE1CB5DE1CB5DE1CB5DE1CB5DE1CB5C
                              DEC84B978939413D3632303632303632303632303632303632305BD9C45DE1CB
                              5DE1CB5DE1CB5EE2CB65E7C92D9170FF00FF2C9B7866E8CA61E4D061E4D061E4
                              D061E4D061E4D061E4D061E4D05FDAC74D8A7F3D3F3C3C39373C39373C39373C
                              39375FDDC961E4D061E4D061E4D061E4CF66E8CA2E9373FF00FF2B9D7A67E9CC
                              64E6D364E6D464E6D464E6D464E6D464E6D464E6D464E6D464E6D460D3C34E7C
                              7443403D433F3C433F3C62DFCD64E6D464E6D464E6D464E6D367E9CC2D9575FF
                              00FF2B9F7C68EACD66E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8D6
                              66E8D666E8D666E8D660C8B94F6F6848444165E1CF66E8D666E8D666E8D666E8
                              D568EACD2D9776FF00FF2BA07E68EACD66E8D666E8D766E8D766E8D766E8D766
                              E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D75EB9AC65E4D366E8D7
                              66E8D766E8D766E8D568EACD2C9979FF00FF2BA27F68EACD66E8D666E8D766E8
                              D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766
                              E8D766E8D766E8D766E8D766E8D766E8D568EACD2D9B7BFF00FF2DA38268E9CE
                              66E8D666E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8
                              D766E8D766E8D766E8D766E8D766E8D766E8D766E8D767E8D668E9CE2F9C7DFF
                              00FF53B1975BDDC77BECDE76EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC
                              75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC76EBDC7AEC
                              DE56DAC3539785FF00FFFF00FF23A8877CE4D59EF4EB9FF4EB9FF4EB9FF4EB9F
                              F4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB
                              9FF4EB9EF4EB7AE3D322A684FF00FFFF00FFFF00FFFF00FF57B49C32A88931A9
                              8931A98931A98931A98931A98931A98931A98931A98931A98931A98931A98931
                              A98931A98931A98931A98932A88859B49CFF00FFFF00FFFF00FF}
                            OnClick = sbPreviousClick
                            ExplicitLeft = 672
                            ExplicitTop = 39
                            ExplicitHeight = 24
                          end
                          object sbNext: TSpeedButton
                            Left = 715
                            Top = 0
                            Width = 24
                            Height = 28
                            Align = alRight
                            Flat = True
                            Glyph.Data = {
                              F6060000424DF606000000000000360000002800000018000000180000000100
                              180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                              00FFFF00FFFF00FF557D69347A58327A58317857317857317857317857317857
                              317857317857317857317857317857317857317857317857317857337857517A
                              66FF00FFFF00FFFF00FFFF00FF23835A59D4AF6AEBC86AEBC86AEBC86AEBC86A
                              EBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC8
                              6AEBC86AEBC857D1AD237F57FF00FFFF00FF58967A5CD8B360E3C150D7B44FD6
                              B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44F
                              D6B44FD6B44FD6B44FD6B450D7B561E4C158D3AE527C68FF00FF31866162E4C1
                              4AD2B047D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0
                              AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE4BD3B162E4C2327E5CFF
                              00FF2E87625EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                              47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2
                              B05EE1BF2F805EFF00FF2E89645EE1BF48D1AF47D0AE47D0AE47D0AE46CCAB39
                              A78C47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                              47D0AE47D0AE49D2B05EE1BF2F8260FF00FF2E8B655EE1BF48D1AF47D0AE47D0
                              AE47D0AE44C7A70506051D4E423FB89A47D0AE47D0AE47D0AE47D0AE47D0AE47
                              D0AE47D0AE47D0AE47D0AE47D0AE49D2B05EE1BF2F8461FF00FF2D8C675EE1BF
                              49D1AF47D0AE47D0AE47D0AE44C7A70909080909080B100E27685844C5A547D0
                              AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2B05EE1BF2F8563FF
                              00FF2D8E6A5EE2C04BD3B249D2B149D2B149D2B146CAAA100F0E100F0E100F0E
                              100F0E15201C32836F48D0AF49D2B149D2B149D2B149D2B149D2B149D2B14CD3
                              B35FE2C02F8865FF00FF2C916C5FE3C14ED5B64CD4B54CD4B54CD4B54ACCAE17
                              151417151417151417151417151417151420352F3D9C864CD4B54CD4B54CD4B5
                              4CD4B54CD4B54ED6B760E3C12E8A67FF00FF2C936E61E4C351D8BB50D7BA50D7
                              BA50D7BA4ECFB31F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B2C
                              4D4547B49C50D7BA50D7BA50D7BA52D8BB61E4C32E8B6AFF00FF2C947162E5C5
                              55DBC054DAC054DAC054DAC052D2B92624222624222624222624222624222624
                              2226242226242226242226252342928254DAC054DAC056DCC062E5C52E8D6CFF
                              00FF2C977364E6C75ADEC659DEC659DEC659DEC657D6BF2E2B292E2B292E2B29
                              2E2B292E2B292E2B292E2B292E2B293446414AA69459DEC659DEC659DEC65ADF
                              C664E6C72D906FFF00FF2C997665E7C95EE1CB5DE1CB5DE1CB5DE1CB5BD9C436
                              323036323036323036323036323036323039413D4B97895CDEC85DE1CB5DE1CB
                              5DE1CB5DE1CB5EE2CB65E7C92D9170FF00FF2C9B7866E8CA61E4D061E4D061E4
                              D061E4D05FDDC93C39373C39373C39373C39373D3F3C4D8A7F5FDAC761E4D061
                              E4D061E4D061E4D061E4D061E4D061E4CF66E8CA2E9373FF00FF2B9D7A67E9CC
                              64E6D364E6D464E6D464E6D462DFCD433F3C433F3C43403D4E7C7460D3C364E6
                              D464E6D464E6D464E6D464E6D464E6D464E6D464E6D464E6D367E9CC2D9575FF
                              00FF2B9F7C68EACD66E8D666E8D666E8D666E8D665E1CF4844414F6F6860C8B9
                              66E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8
                              D568EACD2D9776FF00FF2BA07E68EACD66E8D666E8D766E8D766E8D765E4D35E
                              B9AC66E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D7
                              66E8D766E8D766E8D568EACD2C9979FF00FF2BA27F68EACD66E8D666E8D766E8
                              D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766
                              E8D766E8D766E8D766E8D766E8D766E8D568EACD2D9B7BFF00FF2DA38268E9CE
                              66E8D666E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8
                              D766E8D766E8D766E8D766E8D766E8D766E8D766E8D767E8D668E9CE2F9C7DFF
                              00FF53B1975BDDC77BECDE76EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC
                              75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC76EBDC7AEC
                              DE56DAC3539785FF00FFFF00FF23A8877CE4D59EF4EB9FF4EB9FF4EB9FF4EB9F
                              F4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB
                              9FF4EB9EF4EB7AE3D322A684FF00FFFF00FFFF00FFFF00FF57B49C32A88931A9
                              8931A98931A98931A98931A98931A98931A98931A98931A98931A98931A98931
                              A98931A98931A98931A98932A88859B49CFF00FFFF00FFFF00FF}
                            OnClick = sbNextClick
                            ExplicitLeft = 707
                            ExplicitTop = -6
                          end
                          object sbLast: TSpeedButton
                            Left = 739
                            Top = 0
                            Width = 24
                            Height = 28
                            Align = alRight
                            Flat = True
                            Glyph.Data = {
                              F6060000424DF606000000000000360000002800000018000000180000000100
                              180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                              00FFFF00FFFF00FF557D69347A58327A58317857317857317857317857317857
                              317857317857317857317857317857317857317857317857317857337857517A
                              66FF00FFFF00FFFF00FFFF00FF23835A59D4AF6AEBC86AEBC86AEBC86AEBC86A
                              EBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC8
                              6AEBC86AEBC857D1AD237F57FF00FFFF00FF58967A5CD8B360E3C150D7B44FD6
                              B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44F
                              D6B44FD6B44FD6B44FD6B450D7B561E4C158D3AE527C68FF00FF31866162E4C1
                              4AD2B047D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0
                              AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE4BD3B162E4C2327E5CFF
                              00FF2E87625EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                              47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2
                              B05EE1BF2F805EFF00FF2E89645EE1BF48D1AF47D0AE47D0AE47D0AE3CAF9247
                              D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE46CDAB2B7D692C806B47D0AE
                              47D0AE47D0AE49D2B05EE1BF2F8260FF00FF2E8B655EE1BF48D1AF47D0AE47D0
                              AE47D0AE0509081F564841BD9E47D0AE47D0AE47D0AE47D0AE47D0AE44C7A703
                              030305090847D0AE47D0AE47D0AE49D2B05EE1BF2F8461FF00FF2D8C675EE1BF
                              49D1AF47D0AE47D0AE47D0AE090B0A0808070B110F296E5C44C8A747D0AE47D0
                              AE47D0AE44C7A70808070A0E0C47D0AE47D0AE47D0AE49D2B05EE1BF2F8563FF
                              00FF2D8E6A5EE2C04BD3B249D2B149D2B149D2B10F11100E0E0D0E0E0D0E0E0D
                              14221E33877248D0AF49D2B147CAAA0E0E0D10141249D2B149D2B149D2B14CD3
                              B35FE2C02F8865FF00FF2C916C5FE3C14ED5B64CD4B54CD4B54CD4B517171616
                              14131614131614131614131614132037303D9E884ACCAE161413181A184CD4B5
                              4CD4B54CD4B54ED6B760E3C12E8A67FF00FF2C936E61E4C351D8BB50D7BA50D7
                              BA50D7BA1F1F1D1E1C1A1E1C1A1E1C1A1E1C1A1E1C1A1E1C1A1E1C1A2A4A421E
                              1C1A20221F50D7BA50D7BA50D7BA52D8BB61E4C32E8B6AFF00FF2C947162E5C5
                              55DBC054DAC054DAC054DAC02626242523222523222523222523222523222523
                              2225232225232225232226292754DAC054DAC054DAC056DCC062E5C52E8D6CFF
                              00FF2C977364E6C75ADEC659DEC659DEC659DEC62E2E2B2D2B292D2B292D2B29
                              2D2B292D2B292D2B292D2B2933433E2D2B292E312E59DEC659DEC659DEC65ADF
                              C664E6C72D906FFF00FF2C997665E7C95EE1CB5DE1CB5DE1CB5DE1CB36353235
                              323035323035323035323035323038413D4B96895AD6C13532303637355DE1CB
                              5DE1CB5DE1CB5EE2CB65E7C92D9170FF00FF2C9B7866E8CA61E4D061E4D061E4
                              D061E4D03D3C383C39363C39363C39363D403C4C8A7F5FDBC861E4D05FDCC93C
                              39363D3E3B61E4D061E4D061E4D061E4CF66E8CA2E9373FF00FF2B9D7A67E9CC
                              64E6D364E6D464E6D464E6D444423E433F3C43413E4E7E7560D4C364E6D464E6
                              D464E6D462DFCD433F3C44444164E6D464E6D464E6D464E6D367E9CC2D9575FF
                              00FF2B9F7C68EACD66E8D666E8D666E8D666E8D648474350726B60CBBC66E8D6
                              66E8D666E8D666E8D666E8D665E1CF48444149494666E8D666E8D666E8D666E8
                              D568EACD2D9776FF00FF2BA07E68EACD66E8D666E8D766E8D766E8D75EBEB166
                              E8D766E8D766E8D766E8D766E8D766E8D766E8D765E5D4599F9459A19666E8D7
                              66E8D766E8D766E8D568EACD2C9979FF00FF2BA27F68EACD66E8D666E8D766E8
                              D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766
                              E8D766E8D766E8D766E8D766E8D766E8D568EACD2D9B7BFF00FF2DA38268E9CE
                              66E8D666E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8
                              D766E8D766E8D766E8D766E8D766E8D766E8D766E8D767E8D668E9CE2F9C7DFF
                              00FF53B1975BDDC77BECDE76EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC
                              75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC76EBDC7AEC
                              DE56DAC3539785FF00FFFF00FF23A8877CE4D59EF4EB9FF4EB9FF4EB9FF4EB9F
                              F4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB
                              9FF4EB9EF4EB7AE3D322A684FF00FFFF00FFFF00FFFF00FF57B49C32A88931A9
                              8931A98931A98931A98931A98931A98931A98931A98931A98931A98931A98931
                              A98931A98931A98931A98932A88859B49CFF00FFFF00FFFF00FF}
                            OnClick = sbLastClick
                            ExplicitLeft = 706
                            ExplicitTop = 3
                            ExplicitHeight = 24
                          end
                        end
                      end
                      object gbConferencia: TGroupBox
                        Left = 0
                        Top = 213
                        Width = 763
                        Height = 96
                        Align = alBottom
                        Caption = 'Confer'#234'ncia'
                        TabOrder = 1
                        Visible = False
                        DesignSize = (
                          763
                          96)
                        object Label11: TLabel
                          Left = 11
                          Top = 31
                          Width = 61
                          Height = 13
                          Caption = 'Descri'#231#227'o: '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label12: TLabel
                          Left = 451
                          Top = 31
                          Width = 93
                          Height = 13
                          Anchors = [akTop, akRight]
                          Caption = 'Quant. Contada: '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ExplicitLeft = 457
                        end
                        object Label15: TLabel
                          Left = 11
                          Top = 68
                          Width = 101
                          Height = 13
                          Caption = 'C'#243'digo de Barras: '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object sbConfirmaItem: TSpeedButton
                          Left = 620
                          Top = 22
                          Width = 138
                          Height = 59
                          Hint = 'Confirmar quantidade contada'
                          Anchors = [akTop, akRight]
                          Caption = 'Confirmar'
                          Glyph.Data = {
                            F6060000424DF606000000000000360000002800000018000000180000000100
                            180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FF73A13173A131FF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF8BC1DC51ABD751ABD751ABD751ABD751ABD751ABD751
                            ABD751ABD751ABD753ACD7B4D0DDFF00FF73A13173A13173A13173A131FF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF51ABD751ABD751ABD751ABD751AB
                            D751ABD751ABD751ABD751ABD752ABD7AECDDDFF00FF73A13173A13173A13173
                            A13173A13173A131FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF51ABD751ABD7
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECECFF00FF73A13173A1
                            3173A13183AA4B8DB05B73A13173A13173A131FF00FFFF00FFFF00FFFF00FFFF
                            00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD776B9D9FF00FF
                            73A13173A13173A13175A235FF00FFFF00FF7DA74173A13173A13173A131FF00
                            FFFF00FFFF00FFFF00FF51ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751
                            ABD7FCFCFCFF00FFBCCBA573A13173A131FF00FFA9CCDD9CC7DCFF00FF7AA53D
                            73A13173A13173A131FF00FFFF00FFFF00FF51ABD751ABD751ABD751ABD7FFFF
                            FF51ABD751ABD751ABD7FFFFFF6DB5D8FF00FFB8CB9EFF00FFABCCDD52ABD751
                            ABD7A1C9DCFF00FF79A43A73A13173A13173A131FF00FFFF00FF51ABD751ABD7
                            51ABD751ABD7FFFFFF51ABD751ABD751ABD7FFFFFF51ABD76EB6D9FF00FFA4CA
                            DC52ABD751ABD751ABD751ABD7EDEDEDFF00FF76A33673A13173A13173A131FF
                            00FF51ABD751ABD751ABD7FFFFFFFFFFFFFFFFFF51ABD7FFFFFFFFFFFFFFFFFF
                            51ABD751ABD751ABD751ABD751ABD751ABD751ABD7FEFEFEA9CCDDFF00FF73A1
                            3273A13173A131FF00FF51ABD751ABD751ABD795D6F4FFFFFF95D6F451ABD7C9
                            F7FFFFFFFFC9F7FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF
                            52ABD7AACCDDFF00FF73A131FF00FFFF00FF51ABD751ABD751ABD751ABD7FFFF
                            FF51ABD751ABD751ABD7FFFFFF51ABD751ABD751ABD751ABD751ABD751ABD751
                            ABD751ABD7FFFFFF51ABD752ABD7ABCDDDFF00FFFF00FFFF00FF51ABD751ABD7
                            51ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751AB
                            D751ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751ABD770B6D9FF00FFFF
                            00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD7
                            51ABD751ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751AB
                            D751ABD7FF00FFFF00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD751
                            ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF
                            51ABD751ABD751ABD751ABD7FF00FFFF00FF51ABD751ABD751ABD751ABD751AB
                            D751ABD751ABD7FFFFFFFFFFFFFFFFFFFFFFFF51ABD751ABD751ABD751ABD751
                            ABD751ABD7FFFFFF51ABD751ABD751ABD751ABD7FF00FFFF00FF51ABD751ABD7
                            51ABD751ABD751ABD751ABD751ABD7FFFFFFFFFFFFFFFFFFFFFFFF51ABD751AB
                            D751ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751ABD751ABD7FF00FFFF
                            00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD7FFFFFFFFFFFFFFFFFF
                            FFFFFF51ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF51ABD751ABD751AB
                            D751ABD7FF00FFFF00FF51ABD751ABD751ABD751ABD751ABD751ABD751ABD7FF
                            FFFFFFFFFFFFFFFFFFFFFF51ABD751ABD751ABD751ABD751ABD751ABD7FFFFFF
                            51ABD751ABD751ABD751ABD7FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFF95D6F451ABD751ABD751ABD7FF00FFFF00FFCBE8F251ABD7
                            51ABD751ABD751ABD751ABD751ABD751ABD7CBF8FFFEFEFEFFFFFFFCFEFE51AB
                            D751ABD751ABD751ABD751ABD795D6F4FFFFFF92D4F551ABD751ABD7FF00FFFF
                            00FFFF00FFFF00FF74B9DC51ABD751ABD751ABD751ABD751ABD751ABD77DC8EC
                            FFFFFFFFFFFFC9F7FF51ABD751ABD751ABD751ABD751ABD795D6F4FFFFFF95D6
                            F451ABD7FF00FFFF00FFFF00FFFF00FFFF00FFA8CCDE51ABD751ABD751ABD751
                            ABD751ABD751ABD751ABD7D1FBFEFEFEFEE5FEFE51ABD751ABD751ABD751ABD7
                            51ABD795D6F4FFFFFF95D6F3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FF8CC2DC51ABD751ABD751ABD751ABD751ABD751ABD78FCFEFFEFEFEF4FEFE51
                            ABD751ABD751ABD751ABD751ABD795D6F4FFFFFFFF00FFFF00FF}
                          OnClick = sbConfirmaItemClick
                          ExplicitLeft = 626
                        end
                        object DBEdtDescricao: TDBEdit
                          Left = 78
                          Top = 28
                          Width = 373
                          Height = 21
                          DataField = 'DESCR_PROD'
                          DataSource = dsConfCegaItens
                          ReadOnly = True
                          TabOrder = 0
                        end
                        object edtQuantContada: TEditFiscal
                          Left = 550
                          Top = 28
                          Width = 64
                          Height = 21
                          Anchors = [akTop, akRight]
                          TabOrder = 1
                          OnKeyPress = edtQuantContadaKeyPress
                        end
                        object edtCodBarra: TEditFiscal
                          Left = 118
                          Top = 55
                          Width = 333
                          Height = 33
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clNavy
                          Font.Height = -21
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 2
                          OnKeyPress = edtCodBarraKeyPress
                        end
                      end
                    end
                  end
                end
              end
              object tsObservacao: TTabSheet
                Caption = 'tsObservacao'
                ImageIndex = 3
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object pnObservacao: TPanel
                  Left = 55
                  Top = 1
                  Width = 678
                  Height = 274
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox61: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 674
                    Height = 229
                    Align = alClient
                    Caption = 'Observa'#231#227'o'
                    TabOrder = 1
                    object DBMemo4: TDBMemo
                      Left = 2
                      Top = 15
                      Width = 670
                      Height = 212
                      Align = alClient
                      DataField = 'OBSERVACAO'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      ScrollBars = ssVertical
                      TabOrder = 0
                    end
                  end
                  object Panel74: TPanel
                    Left = 0
                    Top = 229
                    Width = 674
                    Height = 41
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object BitBtn63: TBitBtn
                      Left = 298
                      Top = 6
                      Width = 75
                      Height = 25
                      Caption = 'OK'
                      ModalResult = 1
                      TabOrder = 0
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
                  end
                end
                object pnIdentificacao: TPanel
                  Left = 53
                  Top = 258
                  Width = 388
                  Height = 127
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 384
                    Height = 82
                    Align = alClient
                    Caption = 'Identifica'#231#227'o para uso no Mobile'
                    TabOrder = 0
                    object DBEditIdentificacao: TDBEdit
                      Left = 5
                      Top = 30
                      Width = 373
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'IDENTIFICACAO'
                      DataSource = dtmConferenciaCega.dsConfCegaCabecalho
                      TabOrder = 0
                    end
                  end
                  object Panel5: TPanel
                    Left = 0
                    Top = 82
                    Width = 384
                    Height = 41
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object BitBtn7: TBitBtn
                      Left = 151
                      Top = 6
                      Width = 78
                      Height = 25
                      Caption = 'OK'
                      ModalResult = 1
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
                  end
                end
              end
              object tsItensNF: TTabSheet
                Caption = 'tsItensNF'
                ImageIndex = 4
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object pnItensNF: TPanel
                  Left = 17
                  Top = 24
                  Width = 752
                  Height = 353
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object pnItensNFCampos: TPanel
                    Left = 0
                    Top = 267
                    Width = 748
                    Height = 45
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    Enabled = False
                    TabOrder = 0
                    object Label246: TLabel
                      Left = 4
                      Top = 12
                      Width = 87
                      Height = 13
                      Caption = 'C'#243'digo/Descri'#231#227'o:'
                    end
                    object DBEdtDescricaoItemNF: TDBEdit
                      Left = 353
                      Top = 9
                      Width = 377
                      Height = 21
                      DataField = 'DESCRICAO_ITEM'
                      DataSource = dsItensNF
                      ReadOnly = True
                      TabOrder = 2
                    end
                    object DBEdtNumFabFornecedor: TDBEdit
                      Left = 97
                      Top = 9
                      Width = 109
                      Height = 21
                      DataField = 'NUM_FAB_FORNECEDOR'
                      DataSource = dsItensNF
                      Enabled = False
                      TabOrder = 0
                    end
                    object edtCodigo: TEditFiscal
                      Left = 212
                      Top = 9
                      Width = 135
                      Height = 21
                      Hint = 'Digite o C'#243'digo ou parte da descri'#231#227'o'
                      CharCase = ecUpperCase
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 1
                      OnKeyDown = edtCodigoKeyDown
                    end
                  end
                  object pnItensNFBotoes: TPanel
                    Left = 0
                    Top = 312
                    Width = 748
                    Height = 37
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    DesignSize = (
                      744
                      33)
                    object btnSalvar: TBitBtn
                      Left = 240
                      Top = 3
                      Width = 75
                      Height = 27
                      Anchors = [akTop, akRight]
                      Caption = '&Salvar'
                      Enabled = False
                      TabOrder = 0
                      OnClick = btnSalvarClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        B56E9DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB52
                        8DAB528DAB528DAB528DFF00FFB46A9BAB528DAC548EFFFFFFFFFFFFAB538DAE
                        5992FFFFFFFFFFFFFFFFFFFFFFFFFEFDFEAB528DAB528DAB528DFF00FFAB538D
                        AB528DAC548EFFFFFFFFFFFFAB538DAE5992FFFFFFFFFFFFFFFFFFFFFFFFFEFD
                        FEAB528DAB528DAB528DFF00FFAB538DAB528DAC548EFFFFFFFFFFFFAB538DAE
                        5992FFFFFFFFFFFFFFFFFFFFFFFFFEFDFEAB528DAB528DAB528DFF00FFAB538D
                        AB528DAC548EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
                        FEAB528DAB528DAB528DFF00FFAB538DAB528DAB528DAB528DAB528DAB528DAB
                        528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DFF00FFAB538D
                        AB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB52
                        8DAB528DAB528DAB528DFF00FFAB538DAB528DE5CADCFEFDFEFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEE7CDDEAB528DAB528DFF00FFAB538D
                        AB528DFDFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFEFEFEAB528DAB528DFF00FFAB538DAB528DFDFCFDFFFFFFB8B8B8B8B8B8B8
                        B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFFAB538DAB528DFF00FFAB538D
                        AB528DFDFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFAB538DAB528DFF00FFAB538DAB528DFDFCFDFFFFFFB8B8B8B8B8B8B8
                        B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFFAB538DAB528DFF00FFAB538D
                        AB528DFDFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFEFEFEAB528DAB528DFF00FFAB538DAB528DE5CADCFEFDFEFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE7CEDEAB528DAB528DFF00FFAB538D
                        AB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB52
                        8DAB528DAB528DAB528DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      ExplicitLeft = 252
                    end
                    object btnCancelar: TBitBtn
                      Left = 402
                      Top = 3
                      Width = 75
                      Height = 27
                      Anchors = [akTop, akRight]
                      Caption = '&Cancelar'
                      Enabled = False
                      TabOrder = 2
                      OnClick = btnCancelarClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D8BD3FF00FFFF00FFFF00
                        FFFF00FF7C89D2FF00FF8E8E8E5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5CB2
                        B2B27C89D41733C51733C5FF00FFFF00FF1733C51733C57D8AD25C5C5CFDFDFD
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF00FF1733C51733C52741C72E47
                        C81733C51733C5FF00FF5C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
                        FEFEECECECFF00FF3048C81733C51733C53149C8FF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFBE9062BE9062BE9062BE9062BE9063D4C3B2FF00FF2D46C81733C51733
                        C52741C7FF00FFFF00FF5C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
                        EFEFFF00FF1733C51733C53048C82E47C81733C51733C5FF00FF5C5C5CFDFDFD
                        FFFFFFBE9062BE9062BE9062BE9062D5C5B57886D41733C51733C5FF00FFFF00
                        FF1733C51733C57F8CD35C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
                        FCFCFF00FF7987D4FF00FFEBEBEBAFAFAFFF00FF7C89D4FF00FF5C5C5CFDFDFD
                        FFFFFFBE9062BE9062BE9062BE9062BE9062C1966CD4C5B5EFEFEFFDFDFD5D5D
                        5DFF00FFFF00FFFF00FF5C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFEFEFE5C5C5CFF00FFFF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFBE9062BE9062BE9062FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFDFD5C5C
                        5CFF00FFFF00FFFF00FF5C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFF9696965C5C5C5C5C5C5C5C5C5C5C5CFF00FFFF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFBE9062BE9062BE9062FFFFFFFFFFFF5C5C5CFEFEFEFFFFFFBCBCBC8181
                        81FF00FFFF00FFFF00FF5C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFF5C5C5CFEFEFEBDBDBD7E7E7EFF00FFFF00FFFF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5CBDBDBD7D7D7DFF00FFFF00
                        FFFF00FFFF00FFFF00FF8E8E8E5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C
                        5C5C5C5C5C808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      ExplicitLeft = 414
                    end
                    object btnAlterar: TBitBtn
                      Left = 321
                      Top = 3
                      Width = 75
                      Height = 27
                      Anchors = [akTop, akRight]
                      Caption = '&Alterar'
                      TabOrder = 1
                      OnClick = btnAlterarClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFA96A2BCDB59EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FF8E8E8E5C5C5C5C5C5C626262FF00FFCFBAA5AB6B2BA9
                        6A2BFF00FFFF00FFABABAB5C5C5C8C8C8CFF00FFFF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFFFFFFFEEEEEEFF00FFA96A2BFF00FFFF00FFA96A2BFF00FFEDEDED5C5C
                        5CFF00FFFF00FFFF00FF5C5C5CFDFDFDFFFFFFFFFFFFFBFBFBFF00FFFF00FFFF
                        00FFAB6B2BAC6F31A96A2BFF00FFABABABFF00FFFF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFBE9062BE9062C5A07BFF00FFA96A2BAD7134AB6B2BAC6F31A96A2BFF00
                        FFFF00FFFF00FFFF00FF5C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF
                        00FFA96A2BAD7134AB6B2BAC6F31A96A2BFF00FFFF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFBE9062BE9062BE9062BE9062C5A17CFF00FFA96A2BAD7134AB6B2BAC6F
                        31A96A2BFF00FFFF00FF5C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFF8F8F8FF00FFA96A2BAD7134AB6B2BAC6F31FF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFBE9062BE9062BE9062BE9062BE9062BE9062C5A17CFF00FFA96A2BAD71
                        34FF00FFFF00FFA96A2B5C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFF8F8F8FF00FFFF00FFFF00FFA96A2BA96A2B5C5C5CFDFDFD
                        FFFFFFBE9062BE9062BE9062FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEF6F6F6FF00
                        FFA96A2BA96A2BD3C2B25C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFF9696965C5C5C5C5C5C5C5C5C717171FF00FFFF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFBE9062BE9062BE9062FFFFFFFFFFFF5C5C5CFEFEFEFFFFFFBCBCBC8181
                        81FF00FFFF00FFFF00FF5C5C5CFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFF5C5C5CFEFEFEBDBDBD7E7E7EFF00FFFF00FFFF00FFFF00FF5C5C5CFDFDFD
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5CBDBDBD7D7D7DFF00FFFF00
                        FFFF00FFFF00FFFF00FF8E8E8E5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C
                        5C5C5C5C5C808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      ExplicitLeft = 333
                    end
                    object btnFechar: TBitBtn
                      Left = 483
                      Top = 3
                      Width = 75
                      Height = 27
                      Anchors = [akTop, akRight]
                      Cancel = True
                      Caption = '&Fechar'
                      ModalResult = 2
                      TabOrder = 3
                      OnClick = btnFecharClick
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
                      ExplicitLeft = 495
                    end
                    object cbCodigoFornecedor: TCheckBox
                      Left = 4
                      Top = 8
                      Width = 237
                      Height = 17
                      Caption = 'Salvar C'#243'digo do Fornecedor em NF-e'
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      State = cbChecked
                      TabOrder = 4
                    end
                  end
                  object pnItensNFNavegacao: TPanel
                    Left = 0
                    Top = 239
                    Width = 748
                    Height = 28
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 2
                    object sbFirstItensNF: TSpeedButton
                      Left = 652
                      Top = 0
                      Width = 24
                      Height = 28
                      Align = alRight
                      Flat = True
                      Glyph.Data = {
                        F6060000424DF606000000000000360000002800000018000000180000000100
                        180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FF557D69347A58327A58317857317857317857317857317857
                        317857317857317857317857317857317857317857317857317857337857517A
                        66FF00FFFF00FFFF00FFFF00FF23835A59D4AF6AEBC86AEBC86AEBC86AEBC86A
                        EBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC8
                        6AEBC86AEBC857D1AD237F57FF00FFFF00FF58967A5CD8B360E3C150D7B44FD6
                        B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44F
                        D6B44FD6B44FD6B44FD6B450D7B561E4C158D3AE527C68FF00FF31866162E4C1
                        4AD2B047D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0
                        AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE4BD3B162E4C2327E5CFF
                        00FF2E87625EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                        47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2
                        B05EE1BF2F805EFF00FF2E89645EE1BF48D1AF47D0AE47D0AE47D0AE2C806B2B
                        7D6946CDAB47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE3CAF9247D0AE
                        47D0AE47D0AE49D2B05EE1BF2F8260FF00FF2E8B655EE1BF48D1AF47D0AE47D0
                        AE47D0AE05090803030344C7A747D0AE47D0AE47D0AE47D0AE47D0AE41BD9E1F
                        564805090847D0AE47D0AE47D0AE49D2B05EE1BF2F8461FF00FF2D8C675EE1BF
                        49D1AF47D0AE47D0AE47D0AE0A0E0C08080744C7A747D0AE47D0AE47D0AE45C8
                        A7296E5C0B110F080807090B0A47D0AE47D0AE47D0AE49D2B05EE1BF2F8563FF
                        00FF2D8E6A5EE2C04BD3B249D2B149D2B149D2B11014120E0E0D46CAAA49D2B1
                        48D0AF34877214221E0E0E0D0E0E0D0E0E0D0F111049D2B149D2B149D2B14CD3
                        B35FE2C02F8865FF00FF2C916C5FE3C14ED5B64CD4B54CD4B54CD4B5181A1816
                        14134ACCAE3D9E882037301614131614131614131614131614131717164CD4B5
                        4CD4B54CD4B54ED6B760E3C12E8A67FF00FF2C936E61E4C351D8BB50D7BA50D7
                        BA50D7BA20221F1E1C1A2A4A421E1C1A1E1C1A1E1C1A1E1C1A1E1C1A1E1C1A1E
                        1C1A1F1F1D50D7BA50D7BA50D7BA52D8BB61E4C32E8B6AFF00FF2C947162E5C5
                        55DBC054DAC054DAC054DAC02629272523222523222523222523222523222523
                        2225232225232225232226262454DAC054DAC054DAC056DCC062E5C52E8D6CFF
                        00FF2C977364E6C75ADEC659DEC659DEC659DEC62E312E2D2B2933433E2D2B29
                        2D2B292D2B292D2B292D2B292D2B292D2B292E2E2B59DEC659DEC659DEC65ADF
                        C664E6C72D906FFF00FF2C997665E7C95EE1CB5DE1CB5DE1CB5DE1CB36373535
                        32305AD6C14B968938413D3532303532303532303532303532303635325DE1CB
                        5DE1CB5DE1CB5EE2CB65E7C92D9170FF00FF2C9B7866E8CA61E4D061E4D061E4
                        D061E4D03D3E3B3C39365FDCC961E4D05FDBC84C8A7F3D403C3C39363C39363C
                        39363D3C3861E4D061E4D061E4D061E4CF66E8CA2E9373FF00FF2B9D7A67E9CC
                        64E6D364E6D464E6D464E6D4444441433F3C62DFCD64E6D464E6D464E6D460D4
                        C34E7E7543413E433F3C44423E64E6D464E6D464E6D464E6D367E9CC2D9575FF
                        00FF2B9F7C68EACD66E8D666E8D666E8D666E8D649494648444165E1CF66E8D6
                        66E8D666E8D666E8D666E8D660CBBC50726B48474366E8D666E8D666E8D666E8
                        D568EACD2D9776FF00FF2BA07E68EACD66E8D666E8D766E8D766E8D759A19659
                        9F9465E5D466E8D766E8D766E8D766E8D766E8D766E8D766E8D75EBEB166E8D7
                        66E8D766E8D766E8D568EACD2C9979FF00FF2BA27F68EACD66E8D666E8D766E8
                        D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766
                        E8D766E8D766E8D766E8D766E8D766E8D568EACD2D9B7BFF00FF2DA38268E9CE
                        66E8D666E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8
                        D766E8D766E8D766E8D766E8D766E8D766E8D766E8D767E8D668E9CE2F9C7DFF
                        00FF53B1975BDDC77BECDE76EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC
                        75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC76EBDC7AEC
                        DE56DAC3539785FF00FFFF00FF23A8877CE4D59EF4EB9FF4EB9FF4EB9FF4EB9F
                        F4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB
                        9FF4EB9EF4EB7AE3D322A684FF00FFFF00FFFF00FFFF00FF57B49C32A88931A9
                        8931A98931A98931A98931A98931A98931A98931A98931A98931A98931A98931
                        A98931A98931A98931A98932A88859B49CFF00FFFF00FFFF00FF}
                      OnClick = sbFirstItensNFClick
                      ExplicitLeft = 642
                      ExplicitTop = 39
                      ExplicitHeight = 24
                    end
                    object sbPriorItensNF: TSpeedButton
                      Left = 676
                      Top = 0
                      Width = 24
                      Height = 28
                      Align = alRight
                      Flat = True
                      Glyph.Data = {
                        F6060000424DF606000000000000360000002800000018000000180000000100
                        180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FF557D69347A58327A58317857317857317857317857317857
                        317857317857317857317857317857317857317857317857317857337857517A
                        66FF00FFFF00FFFF00FFFF00FF23835A59D4AF6AEBC86AEBC86AEBC86AEBC86A
                        EBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC8
                        6AEBC86AEBC857D1AD237F57FF00FFFF00FF58967A5CD8B360E3C150D7B44FD6
                        B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44F
                        D6B44FD6B44FD6B44FD6B450D7B561E4C158D3AE527C68FF00FF31866162E4C1
                        4AD2B047D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0
                        AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE4BD3B162E4C2327E5CFF
                        00FF2E87625EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                        47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2
                        B05EE1BF2F805EFF00FF2E89645EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47
                        D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE39A78C46CCAB47D0AE
                        47D0AE47D0AE49D2B05EE1BF2F8260FF00FF2E8B655EE1BF48D1AF47D0AE47D0
                        AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE3FB89A1D4E4205
                        060544C7A747D0AE47D0AE47D0AE49D2B05EE1BF2F8461FF00FF2D8C675EE1BF
                        49D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE44C5A52768
                        580B100E09090809090844C7A747D0AE47D0AE47D0AE49D2B05EE1BF2F8563FF
                        00FF2D8E6A5EE2C04BD3B249D2B149D2B149D2B149D2B149D2B149D2B148D0AF
                        32836F15201C100F0E100F0E100F0E100F0E46CAAA49D2B149D2B149D2B14CD3
                        B35FE2C02F8865FF00FF2C916C5FE3C14ED5B64CD4B54CD4B54CD4B54CD4B54C
                        D4B53D9C8620352F1715141715141715141715141715141715144ACCAE4CD4B5
                        4CD4B54CD4B54ED6B760E3C12E8A67FF00FF2C936E61E4C351D8BB50D7BA50D7
                        BA50D7BA47B49C2C4D451F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F
                        1D1B4ECFB350D7BA50D7BA50D7BA52D8BB61E4C32E8B6AFF00FF2C947162E5C5
                        55DBC054DAC054DAC04292822625232624222624222624222624222624222624
                        2226242226242226242252D2B954DAC054DAC054DAC056DCC062E5C52E8D6CFF
                        00FF2C977364E6C75ADEC659DEC659DEC659DEC64AA6943446412E2B292E2B29
                        2E2B292E2B292E2B292E2B292E2B292E2B2957D6BF59DEC659DEC659DEC65ADF
                        C664E6C72D906FFF00FF2C997665E7C95EE1CB5DE1CB5DE1CB5DE1CB5DE1CB5C
                        DEC84B978939413D3632303632303632303632303632303632305BD9C45DE1CB
                        5DE1CB5DE1CB5EE2CB65E7C92D9170FF00FF2C9B7866E8CA61E4D061E4D061E4
                        D061E4D061E4D061E4D061E4D05FDAC74D8A7F3D3F3C3C39373C39373C39373C
                        39375FDDC961E4D061E4D061E4D061E4CF66E8CA2E9373FF00FF2B9D7A67E9CC
                        64E6D364E6D464E6D464E6D464E6D464E6D464E6D464E6D464E6D460D3C34E7C
                        7443403D433F3C433F3C62DFCD64E6D464E6D464E6D464E6D367E9CC2D9575FF
                        00FF2B9F7C68EACD66E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8D6
                        66E8D666E8D666E8D660C8B94F6F6848444165E1CF66E8D666E8D666E8D666E8
                        D568EACD2D9776FF00FF2BA07E68EACD66E8D666E8D766E8D766E8D766E8D766
                        E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D75EB9AC65E4D366E8D7
                        66E8D766E8D766E8D568EACD2C9979FF00FF2BA27F68EACD66E8D666E8D766E8
                        D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766
                        E8D766E8D766E8D766E8D766E8D766E8D568EACD2D9B7BFF00FF2DA38268E9CE
                        66E8D666E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8
                        D766E8D766E8D766E8D766E8D766E8D766E8D766E8D767E8D668E9CE2F9C7DFF
                        00FF53B1975BDDC77BECDE76EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC
                        75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC76EBDC7AEC
                        DE56DAC3539785FF00FFFF00FF23A8877CE4D59EF4EB9FF4EB9FF4EB9FF4EB9F
                        F4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB
                        9FF4EB9EF4EB7AE3D322A684FF00FFFF00FFFF00FFFF00FF57B49C32A88931A9
                        8931A98931A98931A98931A98931A98931A98931A98931A98931A98931A98931
                        A98931A98931A98931A98932A88859B49CFF00FFFF00FFFF00FF}
                      OnClick = sbPriorItensNFClick
                      ExplicitLeft = 672
                      ExplicitTop = 39
                      ExplicitHeight = 24
                    end
                    object sbNextItensNF: TSpeedButton
                      Left = 700
                      Top = 0
                      Width = 24
                      Height = 28
                      Align = alRight
                      Flat = True
                      Glyph.Data = {
                        F6060000424DF606000000000000360000002800000018000000180000000100
                        180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FF557D69347A58327A58317857317857317857317857317857
                        317857317857317857317857317857317857317857317857317857337857517A
                        66FF00FFFF00FFFF00FFFF00FF23835A59D4AF6AEBC86AEBC86AEBC86AEBC86A
                        EBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC8
                        6AEBC86AEBC857D1AD237F57FF00FFFF00FF58967A5CD8B360E3C150D7B44FD6
                        B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44F
                        D6B44FD6B44FD6B44FD6B450D7B561E4C158D3AE527C68FF00FF31866162E4C1
                        4AD2B047D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0
                        AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE4BD3B162E4C2327E5CFF
                        00FF2E87625EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                        47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2
                        B05EE1BF2F805EFF00FF2E89645EE1BF48D1AF47D0AE47D0AE47D0AE46CCAB39
                        A78C47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                        47D0AE47D0AE49D2B05EE1BF2F8260FF00FF2E8B655EE1BF48D1AF47D0AE47D0
                        AE47D0AE44C7A70506051D4E423FB89A47D0AE47D0AE47D0AE47D0AE47D0AE47
                        D0AE47D0AE47D0AE47D0AE47D0AE49D2B05EE1BF2F8461FF00FF2D8C675EE1BF
                        49D1AF47D0AE47D0AE47D0AE44C7A70909080909080B100E27685844C5A547D0
                        AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2B05EE1BF2F8563FF
                        00FF2D8E6A5EE2C04BD3B249D2B149D2B149D2B146CAAA100F0E100F0E100F0E
                        100F0E15201C32836F48D0AF49D2B149D2B149D2B149D2B149D2B149D2B14CD3
                        B35FE2C02F8865FF00FF2C916C5FE3C14ED5B64CD4B54CD4B54CD4B54ACCAE17
                        151417151417151417151417151417151420352F3D9C864CD4B54CD4B54CD4B5
                        4CD4B54CD4B54ED6B760E3C12E8A67FF00FF2C936E61E4C351D8BB50D7BA50D7
                        BA50D7BA4ECFB31F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B1F1D1B2C
                        4D4547B49C50D7BA50D7BA50D7BA52D8BB61E4C32E8B6AFF00FF2C947162E5C5
                        55DBC054DAC054DAC054DAC052D2B92624222624222624222624222624222624
                        2226242226242226242226252342928254DAC054DAC056DCC062E5C52E8D6CFF
                        00FF2C977364E6C75ADEC659DEC659DEC659DEC657D6BF2E2B292E2B292E2B29
                        2E2B292E2B292E2B292E2B292E2B293446414AA69459DEC659DEC659DEC65ADF
                        C664E6C72D906FFF00FF2C997665E7C95EE1CB5DE1CB5DE1CB5DE1CB5BD9C436
                        323036323036323036323036323036323039413D4B97895CDEC85DE1CB5DE1CB
                        5DE1CB5DE1CB5EE2CB65E7C92D9170FF00FF2C9B7866E8CA61E4D061E4D061E4
                        D061E4D05FDDC93C39373C39373C39373C39373D3F3C4D8A7F5FDAC761E4D061
                        E4D061E4D061E4D061E4D061E4D061E4CF66E8CA2E9373FF00FF2B9D7A67E9CC
                        64E6D364E6D464E6D464E6D462DFCD433F3C433F3C43403D4E7C7460D3C364E6
                        D464E6D464E6D464E6D464E6D464E6D464E6D464E6D464E6D367E9CC2D9575FF
                        00FF2B9F7C68EACD66E8D666E8D666E8D666E8D665E1CF4844414F6F6860C8B9
                        66E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8D666E8
                        D568EACD2D9776FF00FF2BA07E68EACD66E8D666E8D766E8D766E8D765E4D35E
                        B9AC66E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D7
                        66E8D766E8D766E8D568EACD2C9979FF00FF2BA27F68EACD66E8D666E8D766E8
                        D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766
                        E8D766E8D766E8D766E8D766E8D766E8D568EACD2D9B7BFF00FF2DA38268E9CE
                        66E8D666E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8
                        D766E8D766E8D766E8D766E8D766E8D766E8D766E8D767E8D668E9CE2F9C7DFF
                        00FF53B1975BDDC77BECDE76EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC
                        75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC76EBDC7AEC
                        DE56DAC3539785FF00FFFF00FF23A8877CE4D59EF4EB9FF4EB9FF4EB9FF4EB9F
                        F4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB
                        9FF4EB9EF4EB7AE3D322A684FF00FFFF00FFFF00FFFF00FF57B49C32A88931A9
                        8931A98931A98931A98931A98931A98931A98931A98931A98931A98931A98931
                        A98931A98931A98931A98932A88859B49CFF00FFFF00FFFF00FF}
                      OnClick = sbNextItensNFClick
                      ExplicitLeft = 707
                      ExplicitTop = -6
                    end
                    object sbLastItensNF: TSpeedButton
                      Left = 724
                      Top = 0
                      Width = 24
                      Height = 28
                      Align = alRight
                      Flat = True
                      Glyph.Data = {
                        F6060000424DF606000000000000360000002800000018000000180000000100
                        180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FF557D69347A58327A58317857317857317857317857317857
                        317857317857317857317857317857317857317857317857317857337857517A
                        66FF00FFFF00FFFF00FFFF00FF23835A59D4AF6AEBC86AEBC86AEBC86AEBC86A
                        EBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC86AEBC8
                        6AEBC86AEBC857D1AD237F57FF00FFFF00FF58967A5CD8B360E3C150D7B44FD6
                        B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44FD6B44F
                        D6B44FD6B44FD6B44FD6B450D7B561E4C158D3AE527C68FF00FF31866162E4C1
                        4AD2B047D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0
                        AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE4BD3B162E4C2327E5CFF
                        00FF2E87625EE1BF48D1AF47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE
                        47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE49D2
                        B05EE1BF2F805EFF00FF2E89645EE1BF48D1AF47D0AE47D0AE47D0AE3CAF9247
                        D0AE47D0AE47D0AE47D0AE47D0AE47D0AE47D0AE46CDAB2B7D692C806B47D0AE
                        47D0AE47D0AE49D2B05EE1BF2F8260FF00FF2E8B655EE1BF48D1AF47D0AE47D0
                        AE47D0AE0509081F564841BD9E47D0AE47D0AE47D0AE47D0AE47D0AE44C7A703
                        030305090847D0AE47D0AE47D0AE49D2B05EE1BF2F8461FF00FF2D8C675EE1BF
                        49D1AF47D0AE47D0AE47D0AE090B0A0808070B110F296E5C44C8A747D0AE47D0
                        AE47D0AE44C7A70808070A0E0C47D0AE47D0AE47D0AE49D2B05EE1BF2F8563FF
                        00FF2D8E6A5EE2C04BD3B249D2B149D2B149D2B10F11100E0E0D0E0E0D0E0E0D
                        14221E33877248D0AF49D2B147CAAA0E0E0D10141249D2B149D2B149D2B14CD3
                        B35FE2C02F8865FF00FF2C916C5FE3C14ED5B64CD4B54CD4B54CD4B517171616
                        14131614131614131614131614132037303D9E884ACCAE161413181A184CD4B5
                        4CD4B54CD4B54ED6B760E3C12E8A67FF00FF2C936E61E4C351D8BB50D7BA50D7
                        BA50D7BA1F1F1D1E1C1A1E1C1A1E1C1A1E1C1A1E1C1A1E1C1A1E1C1A2A4A421E
                        1C1A20221F50D7BA50D7BA50D7BA52D8BB61E4C32E8B6AFF00FF2C947162E5C5
                        55DBC054DAC054DAC054DAC02626242523222523222523222523222523222523
                        2225232225232225232226292754DAC054DAC054DAC056DCC062E5C52E8D6CFF
                        00FF2C977364E6C75ADEC659DEC659DEC659DEC62E2E2B2D2B292D2B292D2B29
                        2D2B292D2B292D2B292D2B2933433E2D2B292E312E59DEC659DEC659DEC65ADF
                        C664E6C72D906FFF00FF2C997665E7C95EE1CB5DE1CB5DE1CB5DE1CB36353235
                        323035323035323035323035323038413D4B96895AD6C13532303637355DE1CB
                        5DE1CB5DE1CB5EE2CB65E7C92D9170FF00FF2C9B7866E8CA61E4D061E4D061E4
                        D061E4D03D3C383C39363C39363C39363D403C4C8A7F5FDBC861E4D05FDCC93C
                        39363D3E3B61E4D061E4D061E4D061E4CF66E8CA2E9373FF00FF2B9D7A67E9CC
                        64E6D364E6D464E6D464E6D444423E433F3C43413E4E7E7560D4C364E6D464E6
                        D464E6D462DFCD433F3C44444164E6D464E6D464E6D464E6D367E9CC2D9575FF
                        00FF2B9F7C68EACD66E8D666E8D666E8D666E8D648474350726B60CBBC66E8D6
                        66E8D666E8D666E8D666E8D665E1CF48444149494666E8D666E8D666E8D666E8
                        D568EACD2D9776FF00FF2BA07E68EACD66E8D666E8D766E8D766E8D75EBEB166
                        E8D766E8D766E8D766E8D766E8D766E8D766E8D765E5D4599F9459A19666E8D7
                        66E8D766E8D766E8D568EACD2C9979FF00FF2BA27F68EACD66E8D666E8D766E8
                        D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766
                        E8D766E8D766E8D766E8D766E8D766E8D568EACD2D9B7BFF00FF2DA38268E9CE
                        66E8D666E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8D766E8
                        D766E8D766E8D766E8D766E8D766E8D766E8D766E8D767E8D668E9CE2F9C7DFF
                        00FF53B1975BDDC77BECDE76EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC
                        75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC75EBDC76EBDC7AEC
                        DE56DAC3539785FF00FFFF00FF23A8877CE4D59EF4EB9FF4EB9FF4EB9FF4EB9F
                        F4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB9FF4EB
                        9FF4EB9EF4EB7AE3D322A684FF00FFFF00FFFF00FFFF00FF57B49C32A88931A9
                        8931A98931A98931A98931A98931A98931A98931A98931A98931A98931A98931
                        A98931A98931A98931A98932A88859B49CFF00FFFF00FFFF00FF}
                      OnClick = sbLastItensNFClick
                      ExplicitLeft = 706
                      ExplicitTop = 3
                      ExplicitHeight = 24
                    end
                  end
                  object gbItensNF: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 748
                    Height = 239
                    Align = alClient
                    Caption = 'Itens NF-e'
                    TabOrder = 3
                    object DBGrdItensNF: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 744
                      Height = 222
                      Align = alClient
                      DataSource = dsItensNF
                      DragCursor = crDefault
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnDrawColumnCell = DBGrdItensNFDrawColumnCell
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NITEM'
                          Width = 39
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCRICAO_ITEM'
                          Width = 318
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANTIDADE'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_UNITARIO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_TOTAL'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUM_FAB_PROD'
                          Title.Caption = 'C'#243'digo'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CODIGO_NOP'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CST'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'REFERENCIA'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NPED'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'TIPO_PED'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PERMITIR_DESCONTO'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PERC_DESCONTO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_DESCONTO_PERC'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'RATEIO_DESCONTO'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NCM'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALIQ_ICM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'BASE_ICM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_ICM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PERC_RED_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'MVA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALIQ_ICMSUB'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'BASE_ICMSUB'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_ICMSUB'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALIQ_IPI'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'BASE_IPI'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_IPI'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PERC_RED_IPI'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'BASE_ICMANT_SUB'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_ICMANT_SUB'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'RATEIO_SEGURO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'RATEIO_OUTDESP'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'RATEIO_FRETE'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VLISENTO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VLOUTRAS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VLN_TRIB'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALIQ_ISS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'BASE_ISS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_ISS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'TIPO_ITEM'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESC_NATOP'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'BASE_ICMSUB_ANT'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_ICMSUB_ANT'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'IMPORT_XML'
                          Title.Caption = 'N Calc ST'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ANTEC_TRIB'
                          Title.Caption = 'Ant Trib'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALIQ_PIS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_PIS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CST_PIS'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'BASE_PIS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANT_BC_PIS'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALIQ_PIS_QUANT'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALIQ_COFINS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_COFINS'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CST_COFINS'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'BASE_COFINS'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANT_BC_COFINS'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALIQ_COFINS_QUANT'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALTERA_ESTOQUE_CFOP'
                          Title.Caption = 'Alt Est'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VTOTTRIB'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'XPED_COMPRA'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NITEMPED_COMPRA'
                          Width = 64
                          Visible = True
                        end>
                    end
                  end
                end
              end
              object tsEscolhaProduto: TTabSheet
                Caption = 'tsEscolhaProduto'
                ImageIndex = 5
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object pnEscolhaProdutos: TPanel
                  Left = 4
                  Top = 19
                  Width = 764
                  Height = 319
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 6
                    Top = 6
                    Width = 748
                    Height = 256
                    Align = alTop
                    Caption = 'Produtos'
                    TabOrder = 0
                    object DBGridItensBusca: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 744
                      Height = 239
                      Align = alClient
                      DataSource = dtmConferenciaCega.dsProd
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnTitleClick = DBGridItensBuscaTitleClick
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NUM_FAB_PROD'
                          Title.Caption = 'C'#243'digo do Produto'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCR_PROD'
                          Title.Caption = 'Descri'#231#227'o'
                          Visible = True
                        end
                        item
                          Alignment = taCenter
                          Expanded = False
                          FieldName = 'UNIDADE'
                          Title.Caption = 'Unidade'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'MARCA_P'
                          Title.Caption = 'Marca'
                          Visible = True
                        end
                        item
                          Alignment = taCenter
                          Expanded = False
                          FieldName = 'NBM'
                          Title.Alignment = taCenter
                          Title.Caption = 'NCM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_PROD'
                          Title.Caption = 'Cod Prod'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'GRUPO_PROD'
                          Title.Caption = 'Grupo'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCR_PROD_RED'
                          Title.Caption = 'Descri'#231#227'o Reduzida'
                          Width = 120
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'EST_F'
                          Title.Caption = 'Estoque'
                          Visible = True
                        end>
                    end
                  end
                  object Panel7: TPanel
                    Left = 6
                    Top = 268
                    Width = 748
                    Height = 41
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object BitBtn15: TBitBtn
                      Left = 294
                      Top = 5
                      Width = 75
                      Height = 25
                      Caption = '&Assume'
                      Default = True
                      ModalResult = 1
                      TabOrder = 0
                      OnClick = BitBtn15Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFB78183A47874A47874A47874A47874A47874A4
                        7874A47874A47874A47874A47874A47874986B66FF00FFFF00FFFF00FFB78183
                        FDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D1
                        99986B66FF00FFFF00FFFF00FFB48176FEF3E399330099330099330099330099
                        3300993300993300993300EECC97F3D199986B66FF00FFFF00FFFF00FFB48176
                        FFF7EB993300FEFEFEFEFEFEFEFEFE8EA4FDB8C6FDFEFEFE993300EFCD99F3D1
                        98986B66FF00FFFF00FFFF00FFBA8E85FFFCF4993300FEFEFEFAFBFE7E98FC03
                        35FB597AFCFEFEFE993300F0D0A1F3D29B986B66FF00FFFF00FFFF00FFBA8E85
                        FFFFFD993300D6DEFE4368FC0335FB4066FC0436FBD9E0FE993300F0D4A9F5D5
                        A3986B66FF00FFFF00FFFF00FFCB9A82FFFFFF9933005274FC1442FBBCC9FDEF
                        F2FE1A47FB4F72FC973304F2D8B2F6D9AC986B66FF00FFFF00FFFF00FFCB9A82
                        FFFFFF993300E4EAFED9E0FEFEFEFEFEFEFE98ACFD0335FB643459F4DBB9F8DD
                        B4986B66FF00FFFF00FFFF00FFDCA887FFFFFF993300FEFEFEFEFEFEFEFEFEFE
                        FEFEFEFEFE5677FC0335FBF7E1C2F0DAB7986B66FF00FFFF00FFFF00FFDCA887
                        FFFFFF9933009933009933009933009933009933008F33112235C80335FBC6BC
                        A9986B66FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD
                        F8F3FDF6ECF1E1D5B481760335FB0335FB0335FBFF00FFFF00FFFF00FFE3B18E
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA5
                        4A0335FBFF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFE4D4D2B48176FAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
                        FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B86FF00
                        FFFF00FFFF00FFFF00FFFF00FFEDBD92DAA482DAA482DAA482DAA482DAA482DA
                        A482DAA482DAA482B48176FF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                    object BitBtn18: TBitBtn
                      Left = 375
                      Top = 5
                      Width = 75
                      Height = 25
                      Caption = '&Cancelar'
                      ModalResult = 2
                      TabOrder = 1
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
              object tsNotasFiscais: TTabSheet
                Caption = 'tsNotasFiscais'
                ImageIndex = 6
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object pnNotasFiscais: TPanel
                  Left = 17
                  Top = 20
                  Width = 744
                  Height = 293
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object gbNotasFiscais: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 740
                    Height = 232
                    Align = alClient
                    Caption = 'Notas Fiscais'
                    TabOrder = 0
                    object DBGridNotasFiscais: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 736
                      Height = 215
                      Align = alClient
                      DataSource = dtmConferenciaCega.dsLoteNF
                      PopupMenu = PopupMenu3
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                    end
                  end
                  object pnBotoes: TPanel
                    Left = 0
                    Top = 232
                    Width = 740
                    Height = 57
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object btnSair: TBitBtn
                      Left = 653
                      Top = 14
                      Width = 75
                      Height = 25
                      Caption = '&Sair'
                      Default = True
                      ModalResult = 1
                      TabOrder = 0
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FF5367CF334CCC334CCC334CCC334CCC33
                        4CCC334CCC334CCC334CCC334CCC334CCC5367CFFF00FFFF00FFFF00FF5367CF
                        334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334C
                        CC334CCC5367CFFF00FFFF00FF334CCC334CCC334CCC334CCC334CCC334CCC33
                        4CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCCFF00FFFF00FF334CCC
                        334CCC334CCC334CCC7E8DDE3850CD334CCC334CCC3850CD7E8EDE334CCC334C
                        CC334CCC334CCCFF00FFFF00FF334CCC334CCC334CCC7A8BDDFFFFFFC2C9EF38
                        50CD3850CDC1C8EFFFFFFF7C8CDE334CCC334CCC334CCCFF00FFFF00FF334CCC
                        334CCC334CCC364FCCBCC4EEFFFFFFC2C9EFC1C8EFFFFFFFBDC5EE374FCD334C
                        CC334CCC334CCCFF00FFFF00FF334CCC334CCC334CCC334CCC364FCCBCC4EEFF
                        FFFFFFFFFFBDC5EE374FCD334CCC334CCC334CCC334CCCFF00FFFF00FF334CCC
                        334CCC334CCC334CCC3850CDC1C8EFFFFFFFFFFFFFC2C9EF3850CD334CCC334C
                        CC334CCC334CCCFF00FFFF00FF334CCC334CCC334CCC3850CDC1C8EFFFFFFFBD
                        C5EEBCC4EEFFFFFFC2C9EF3850CD334CCC334CCC334CCCFF00FFFF00FF334CCC
                        334CCC334CCC798ADDFFFFFFBDC5EE374FCD364FCCBCC4EEFFFFFF7B8BDE334C
                        CC334CCC334CCCFF00FFFF00FF334CCC334CCC334CCC334CCC7788DD374FCD33
                        4CCC334CCC364FCC7888DD334CCC334CCC334CCC334CCCFF00FFFF00FF334CCC
                        334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334C
                        CC334CCC334CCCFF00FFFF00FF5266CF334CCC334CCC334CCC334CCC334CCC33
                        4CCC334CCC334CCC334CCC334CCC334CCC334CCC5266CFFF00FFFF00FFFF00FF
                        5368CF334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334C
                        CC5368CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                    object btnApartirXML: TBitBtn
                      Left = 8
                      Top = 14
                      Width = 129
                      Height = 25
                      Caption = '&Incluir apartir do XML'
                      TabOrder = 1
                      OnClick = btnApartirXMLClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FF334CCC334CCC334CCC334CCC334CCC334CCC334CCC334C
                        CC334CCC334CCC334CCCB8B8B84D4D4D4D4D4D4D4D4DB8B8B8334CCCFEFEFEFE
                        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE334CCC4D4D4DFEFEFE
                        FEFEFEFEFEFEFF00FF334CCCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                        FEFEFEFEFEFEFE334CCC4D4D4DFEFEFEFEFEFEFEFEFEFF00FF334CCCFEFEFEFE
                        FEFEFEFEFE334CCC334CCCFEFEFEFEFEFEFEFEFE334CCC334CCC4D4D4DFEFEFE
                        FEFEFEFEFEFEFF00FF334CCCFEFEFE334CCC334CCCFEFEFEFEFEFE334CCCFEFE
                        FE334CCCFEFEFE334CCC4D4D4DFEFEFEFEFEFEFEFEFEFF00FF334CCC334CCCFE
                        FEFEFEFEFEFEFEFEFEFEFEFEFEFE334CCCFEFEFEFEFEFE334CCC4D4D4DFEFEFE
                        FEFEFEFEFEFEFF00FF334CCCFEFEFE334CCC334CCCFEFEFEFEFEFE334CCCFEFE
                        FE334CCCFEFEFE334CCC4D4D4DFEFEFEFEFEFEFEFEFEFF00FF334CCCFEFEFEFE
                        FEFEFEFEFE334CCC334CCCFEFEFEFEFEFEFEFEFE334CCC334CCC4D4D4DFEFEFE
                        FEFEFEFEFEFEFF00FF334CCCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                        FEFEFEFEFEFEFE334CCC4D4D4DFEFEFEFEFEFEFEFEFEFF00FF334CCCFEFEFEFE
                        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE334CCC4D4D4DFEFEFE
                        FEFEFEFEFEFEFF00FF334CCC334CCC334CCC334CCC334CCC334CCC334CCC334C
                        CC334CCC334CCC334CCC4D4D4DFEFEFEFEFEFEFEFEFEFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFB8B8B8FF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFE
                        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4D4D4D4D4D4D4D4D4D4DFF00
                        FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                        FEFE4D4D4DFEFEFEFEFEFE616161FF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFE
                        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFEFEFE616161FF00FFFF00
                        FFFF00FFFF00FFFF00FFB8B8B84D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
                        4D4D4D4D4D616161FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                    object btnNFExistente: TBitBtn
                      Left = 143
                      Top = 14
                      Width = 199
                      Height = 25
                      Caption = 'I&ncluir apartir de uma NF existente'
                      TabOrder = 2
                      OnClick = btnNFExistenteClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FF757575
                        3030303030303030303030303030303030303030303030303030303030303030
                        30737373FF00FFFF00FFFF00FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030FF00FFFF00FFFF00FF303030
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FF303030FF00FFFF00FFFF00FF303030FFFFFFC99167C99167C99167C99167C9
                        9167C99167C99167C99167C99167FFFFFF303030FF00FFFF00FFFF00FF303030
                        FFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFFC99167FFFF
                        FF303030FF00FFFF00FFFF00FF303030FFFFFFC99167C99167C99167C99167C9
                        9167C99167C99167C99167C99167FFFFFF303030FF00FFFF00FFFF00FF303030
                        FFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFFC99167FFFF
                        FF303030FF00FFFF00FFFF00FF303030FFFFFFC99167C99167C99167C99167C9
                        9167C99167C99167C99167C99167FFFFFF303030FF00FFFF00FFFF00FF303030
                        FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                        FF303030FF00FFFF00FFFF00FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030FF00FFFF00FFFF00FF303030
                        FFFFFFA4A4A4A4A4A4A4A4A4A4A4A4A4A4A4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FF303030FF00FFFF00FFFF00FF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFF878787303030303030303030303030FF00FFFF00FFFF00FF303030
                        FFFFFF8181814E4E4E8B8B8B8B8B8B8B8B8BFFFFFF303030FFFFFFFFFFFFBEBE
                        BE646464FF00FFFF00FFFF00FF303030FFFFFFD2D2D24E4E4E8B8B8B808080B0
                        B0B0FFFFFF303030FFFFFFBFBFBF606060FF00FFFF00FFFF00FFFF00FF303030
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030BFBFBF5F5F5FFF00
                        FFFF00FFFF00FFFF00FFFF00FF75757530303030303030303030303030303030
                        3030303030303030636363FF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                    object btnMontarConferencia: TBitBtn
                      Left = 448
                      Top = 14
                      Width = 199
                      Height = 25
                      Caption = '&Montar confer'#234'ncia cega'
                      TabOrder = 3
                      OnClick = btnMontarConferenciaClick
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FF71AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271
                        AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FF71AA2271AA2271AA2271AA2271AA22FF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271AA2271AA2271
                        AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        71AA2271AA2271AA2271AA2271AA2271AA2271AA2271AA2271AA22FF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271AA2271AA2271AA22FF00FF71
                        AA2271AA2271AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        71AA2271AA2271AA22FF00FFFF00FFFF00FF71AA2271AA2271AA2271AA2271AA
                        22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA22FF00FFFF00FFFF00FFFF
                        00FFFF00FF71AA2271AA2271AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271AA
                        2271AA2271AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FF71AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA
                        22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
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
                Caption = 'C&onfirmar'
              end
              inherited CheckCadSeq: TCheckBox
                Visible = False
              end
              object BitBtn13: TBitBtn
                Left = 231
                Top = 13
                Width = 75
                Height = 25
                Caption = 'S&alvar'
                TabOrder = 4
                OnClick = BitBtn13Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  B56E9DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB52
                  8DAB528DAB528DAB528DFF00FFB46A9BAB528DAC548EFFFFFFFFFFFFAB538DAE
                  5992FFFFFFFFFFFFFFFFFFFFFFFFFEFDFEAB528DAB528DAB528DFF00FFAB538D
                  AB528DAC548EFFFFFFFFFFFFAB538DAE5992FFFFFFFFFFFFFFFFFFFFFFFFFEFD
                  FEAB528DAB528DAB528DFF00FFAB538DAB528DAC548EFFFFFFFFFFFFAB538DAE
                  5992FFFFFFFFFFFFFFFFFFFFFFFFFEFDFEAB528DAB528DAB528DFF00FFAB538D
                  AB528DAC548EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
                  FEAB528DAB528DAB528DFF00FFAB538DAB528DAB528DAB528DAB528DAB528DAB
                  528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DFF00FFAB538D
                  AB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB52
                  8DAB528DAB528DAB528DFF00FFAB538DAB528DE5CADCFEFDFEFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEE7CDDEAB528DAB528DFF00FFAB538D
                  AB528DFDFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFEFEFEAB528DAB528DFF00FFAB538DAB528DFDFCFDFFFFFFB8B8B8B8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFFAB538DAB528DFF00FFAB538D
                  AB528DFDFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFAB538DAB528DFF00FFAB538DAB528DFDFCFDFFFFFFB8B8B8B8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFFAB538DAB528DFF00FFAB538D
                  AB528DFDFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFEFEFEAB528DAB528DFF00FFAB538DAB528DE5CADCFEFDFEFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE7CEDEAB528DAB528DFF00FFAB538D
                  AB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB52
                  8DAB528DAB528DAB528DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
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
            Height = 185
            ExplicitHeight = 185
            inherited imgInformation: TImage
              Height = 168
              ExplicitHeight = 168
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Pesquisar Confer'#234'ncia Cega - [RM006]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Nova Confer'#234'ncia Cega - [RM002]'
            end
            object GroupBox5: TGroupBox
              Left = 7
              Top = 70
              Width = 183
              Height = 109
              Align = alCustom
              Caption = 'Tipo Confer'#234'ncia'
              TabOrder = 11
              Visible = False
              object cbNFE: TCheckBox
                Left = 14
                Top = 25
                Width = 85
                Height = 17
                Caption = 'NFENT'
                TabOrder = 0
              end
              object cbCARGA: TCheckBox
                Left = 95
                Top = 25
                Width = 85
                Height = 17
                Caption = 'CARGA'
                TabOrder = 1
              end
              object cbPEDC: TCheckBox
                Left = 14
                Top = 79
                Width = 85
                Height = 17
                Caption = 'PEDC'
                TabOrder = 2
              end
              object cbPEDV: TCheckBox
                Left = 95
                Top = 79
                Width = 85
                Height = 17
                Caption = 'PEDV'
                TabOrder = 3
              end
            end
          end
          inherited Panel1: TPanel
            Top = 185
            Height = 325
            ExplicitTop = 185
            ExplicitHeight = 325
            inherited Splitter1: TSplitter
              Height = 264
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Height = 264
              OnKeyPress = DBGrid1KeyPress
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Visualizar Registro - [RM003]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3B3B35B5B5B999999FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAFAFAF4F4F
                  4F4D4D4D4B4B4B969696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  AFAFAF4F4F4F4B4B4B4D4D4D4B4B4B4C4C4CFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFADADAD4F4F4F4D4D4D4D4D4D4D4D4D4D4D4D878787FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFAAAAAA4E4E4E4D4D4D4B4B4B4B4B4B4D4D4D878787FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B18585856B6B6B646464
                  696969818181A8A8A8FF00FFFF00FFA9A9A94D4D4D4B4B4B4D4D4D4B4B4B4B4B
                  4B898989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADADAD5E5E5E4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D5656568585854E4E4E4D4D4D4D4D4D
                  4D4D4D4D4D4D8B8B8BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8888884B4B
                  4B4B4B4B4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4B4B4B4B4B4B4D
                  4D4D4B4B4B4B4B4B4D4D4D8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  8888884D4D4D4B4B4B4B4B4B4E4E4E898989C4C4C4D9D9D9C8C8C89A9A9A5454
                  544D4D4D4B4B4B4D4D4D4B4B4B4B4B4B8F8F8FFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFAEAEAE4D4D4D4D4D4D4D4D4D6F6F6FF8F8F8FEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFE8B8B8B4E4E4E4D4D4D4D4D4D767676FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF5F5F5F4B4B4B4D4D4D6C6C6CFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8F8F8F4D4D4D4B4B4B515151
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3B3B34D4D4D4D4D4D4F4F4FF0F0
                  F0FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFFFFFF5C
                  5C5C4D4D4D4D4D4D9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF8989894B4B4B
                  4B4B4B7B7B7BFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEADADAD4D4D4D4B4B4B757575FF00FFFF00FFFF00FFFF00FFFF
                  00FF7171714B4B4B4B4B4BAFAFAFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE2E2E24D4D4D4B4B4B5C5C5CFF00FFFF00
                  FFFF00FFFF00FFFF00FF6868684B4B4B4B4B4BBEBEBEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF4F4F44D4D4D4B4B4B
                  555555FF00FFFF00FFFF00FFFF00FFFF00FF6F6F6F4D4D4D4D4D4DAAAAAAFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE2
                  E2E24D4D4D4D4D4D5C5C5CFF00FFFF00FFFF00FFFF00FFFF00FF8787874B4B4B
                  4B4B4B787878FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFE
                  FEFEFEFEFFFFFFAEAEAE4D4D4D4B4B4B747474FF00FFFF00FFFF00FFFF00FFFF
                  00FFAFAFAF4B4B4B4B4B4B4E4E4EE9E9E9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE5E5E5E4B4B4B4B4B4B9D9D9DFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF5C5C5C4D4D4D4D4D4D6A6A6AFAFAFAFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE9292924D4D4D4D4D4D525252
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA4A4A44B4B4B4D4D4D4B4B
                  4B6C6C6CF4F4F4FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFE8E8E8E4B4B4B4D
                  4D4D4B4B4B939393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  7C7C7C4D4D4D4B4B4B4B4B4B515151878787C0C0C0D7D7D7C8C8C89C9C9C5757
                  574B4B4B4B4B4B4D4D4D6E6E6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF7C7C7C4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D717171FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9F5555554D4D4D4B
                  4B4B4B4B4B4D4D4D4B4B4B4D4D4D4B4B4B525252959595FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFA4A4A47878786060605959595F5F5F7777779F9F9FFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Remover Permanentemente - [RM004]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF334CCC334CCC334CCCFF00FFFF00FFFF00FF334CCC334CCC334C
                  CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FF
                  334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF00FFFF00FFFF
                  00FFFF00FFFF00FF334CCC334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCC33
                  4CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC
                  334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334C
                  CC334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00FF334CCC33
                  4CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF00FFFF00FF334C
                  CC334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC
                  334CCC334CCC334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF334CCC334CCC334CCC334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCC334CCCFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCC334C
                  CC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC
                  334CCC334CCC334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC33
                  4CCC334CCC334CCC334CCCFF00FFFF00FF334CCC334CCC334CCC334CCCFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF334CCC334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FF334CCC33
                  4CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF334CCC334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCC334CCCFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCCFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCC334CCCFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF334CCCFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334C
                  CC334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC
                  334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF334CCC334CCC334CCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFAFAFAF7D7D7D7878787878787878787878787878
                  787878787878787878787C7C7CADADADFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D7D7DFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7BFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878FF
                  FFFFFFFFFFFFFFFFFDFDFDFFFFFFFDFDFDFDFDFDFDFDFDFFFFFFFFFFFF777777
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF787878FFFFFFFFFFFFD9BB9FD9BB9ED9BB9ED9BB9ED9BB9ED9BB9FFF
                  FFFFFFFFFF787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF777777FF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878FFFFFFFFFFFFD9BB9F
                  D9BB9ED9BB9ED9BB9ED9BB9ED9BB9FFFFFFFFFFFFF777777FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF979797787878787878787878787878787878787878FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878
                  787878787878787878787878797979A2A2A27878787878787878787878787878
                  78777777787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF777777787878777777777777787878777777787878787878787878
                  FF00FFFF00FF7878787777777878787777777777777878787777777878787777
                  7777777777777778787877777777777778787877777777777778787877777777
                  7777787878787878787878787878787878787878787878787878787878787878
                  7878787878787878787878787878787878787878787878787878787878787878
                  7878787878787878787878787877777777777778787877777777777778787877
                  7777777777787878777777787878777777777777777777787878777777777777
                  7878787777777777777878787777777777777878787878787878787878787878
                  7878787878787878787878787878787878787878787878787878787878787878
                  7878787878787878787878787878787878787878787878787878787878777777
                  777777B2B2B2F7F7F7FDFDFDFFFFFFFDFDFDFDFDFDFFFFFFFDFDFDFFFFFFFDFD
                  FDFDFDFDFDFDFDFFFFFFFDFDFDFDFDFDFFFFFFF7F7F7B4B4B478787877777777
                  7777787878777777777777F7F7F7CEAD8AB2773DB3783EB2773DB2773DB3783E
                  B2773DB3783EB2773DB2773DB2773DB3783EB2773DB2773DB3783ECEAD8AF9F9
                  F9787878777777777777787878777777777777FCFCFCB2773DB2773DB3783EB2
                  773DB2773DB3783EB2773DB3783EB2773DB2773DB2773DB3783EB2773DB2773D
                  B3783EB3783EFDFDFD787878777777777777787878787878787878FCFCFCB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EFFFFFF787878787878787878787878777777
                  777777FCFCFCB2773DB2773DB3783EB2773DB2773DB3783EB2773DB3783EB277
                  3DB2773DB2773DB3783EB2773DB2773DB3783EB3783EFDFDFD78787877777778
                  7878939393777777777777FCFCFCB2773DB2773DB3783EB2773DB2773DB3783E
                  B2773DB3783EB2773DB2773DB2773DB3783EB2773DB2773DB3783EB3783EFDFD
                  FD7878787878789C9C9CFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF777777FEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFE
                  FEFEFFFFFF787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF787878FF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF777777FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF777777FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF77777777777777777778787877777778787877777777777777777778
                  7878787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Top = 6
                Hint = 'Fechar Confer'#234'ncia Cega - [RM008]'
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
                  FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E9
                  66B7EA66B7EAFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF66B7EA66B7EA66B7EAFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  324BCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7
                  EA65B6E966B7EAFF00FFFF00FF65B6E966B7EA66B7EAFDFEFEFFFFFFFFFFFFFF
                  FFFFFFFFFF324BCC324BCC324BCCFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFE
                  FEFFFFFFFFFFFFFFFFFF324BCC324BCC324BCC324BCC324BCCFDFDFEFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFFFFFFFFFFFF324BCC324BCC324BCC324BCC324BCC324B
                  CC324BCCFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF66B7EA66B7EA66B7EAFDFEFEFFFFFF324BCC324BCC324BCC324BCC
                  FFFFFF324BCC324BCC324BCC324BCCFDFDFEFFFFFFFFFFFFFFFFFFFFFFFF66B7
                  EA65B6E966B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFEFE324BCC324BCC32
                  4BCC324BCCFFFFFFFFFFFFFFFFFF324BCC324BCC324BCC324BCCFDFDFEFFFFFF
                  FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFDFE
                  FEF8F8FC324BCC324BCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF324BCC324BCC32
                  4BCC324BCCFCFCFDFFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFFFFFFF8F8FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF324BCC324BCC324BCC324BCCFCFCFDFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF65B6E866B7EA66B7EAFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF324BCC324BCC324BCC324BCCFFFFFF66B7
                  EA65B6E966B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFEFEFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF324BCC324BCC
                  F9F9FCFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFDFE
                  FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF8F8FCFFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EA65B6E966B7EAFF
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
                OnClick = SpeedButton5Click
                ExplicitTop = 6
              end
              inherited SpeedButton6: TSpeedButton
                Top = 6
                Hint = 'Reabrir Confer'#234'ncia Cega - [RM010]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FF88AC55FF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FF88AC5588AC55FF00FF4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4DB8B8B8FF00FF88AC5588AC5588AC5588AC5588AC
                  55FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88AC5588AC55
                  88AC5588AC5588AC5588AC55FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF88AC5588AC5588AC5588AC5588AC55FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF88AC5588AC55FF00FF4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4DB8B8B8FF00FFFF00FFFF00FF88AC55FF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FF}
                OnClick = SpeedButton6Click
                ExplicitTop = 6
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Anexar notas fiscais'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFB98A5CA76320A76320FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFA76320CC9762FF00FFC7AA8CA76320FF00
                  FFFF00FFFF00FFFF00FFFF00FF7F7F7F5B5B5B56565656565656565656565656
                  56565656565656565656565656566C6C6CFF00FFD0A77EC6823EBBBBBBFF00FF
                  FF00FFA76320D3B08EFF00FFFF00FFFF00FFFF00FF5A5A5AFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFF00FFE0C6ABA7
                  6320FF00FFFF00FFAA692AFF00FFA76320FF00FFFF00FFFF00FFFF00FF565656
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
                  FBFF00FFFF00FFC3772DB78758FF00FFA76320D1BFADB68452AB6A2AFF00FFFF
                  00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8DBCBCBCFF00FFC27325FF00FFA76320FF00FFFF00FFA76320FF00
                  FFA76320FF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FF00FFAB6A2AC3A180BF9770AB6A2A
                  FF00FFAB6A2AC19C78C7AA8DAB6A2AFF00FFFF00FF565656FFFFFFFFFFFF8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8E8E8EFF00FFFF00FFA7
                  6320FF00FFA76320FF00FFFF00FFA76320FF00FFA76320FF00FFFF00FF565656
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFF6F6F6FF00FFAB6A2AB27B45D0BDABA76320FF00FFA76320C6A789FF00FFA7
                  6320FF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8DC8C8C8FF00FFA76320FF00FFA96829A76320C275
                  28FF00FFFF00FFA76320FF00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFF00FFD5B79AA76320
                  FF00FFFF00FFFF00FFFF00FFB0763EB68554FF00FF565656FFFFFFFFFFFF8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DBC
                  BCBCFF00FFA76320C29D7AFF00FFFF00FFAC6F33A76320FF00FFFF00FF565656
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFDFDFDFF00FFFF00FFA76320A76320AB6A2ACD9B6BFF00FFFF
                  00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DAEAEAEFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEEEEEE
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFF8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8DFFFFFFFBFBFB767676FF00FFFF00FFFF00FFFF00FFFF00FF565656
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFCFCFC5B5B5BFF00FFFF00FFFF00FFFF
                  00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8DFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFCFCFC5B5B5BFF00
                  FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656565656565656565656
                  5656565B5B5BFF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFF8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFFFFFFFF565656FD
                  FDFDFFFFFFFFFFFFBEBEBE696969FF00FFFF00FFFF00FFFF00FFFF00FF565656
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF565656FDFDFDFFFFFFBFBFBF696969FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFF565656FDFDFDC2C2C2696969FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BC1C1C1696969FF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F5B5B5B5656565656
                  565656565656565656565656565656565656565656565656565656565B5B5B6E
                  6E6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
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
                Top = 6
                Hint = 'Contagem Confer'#234'ncia Cega - [RM009]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FF71BAE9
                  71BAE971BAE971BAE971BAE971BAE971BAE971BAE971BAE971BAE971BAE971BA
                  E971BAE971BAE971BAE971BAE971BAE971BAE971BAE971BAE971BAE971BAE9FF
                  00FFFF00FF71BAE967B7E966B7EA66B7EA66B7EA66B7EA66B7EA66B7EA65B6E9
                  65B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E966B7
                  EA65B6E965B6E9FF00FFFF00FF65B6E965B6E965B6E965B6E965B6E965B6E965
                  B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E965B6E9
                  65B6E965B6E965B6E965B6E965B6E9FF00FFFF00FF65B6E965B6E965B6E9FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF65B6E965B6E966B7EAFF00FFFF00FF65B6E9
                  65B6E965B6E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A6A6A6A6A6A6A6A6A6A6A
                  6A6A6A6A6A6A6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65B6E965B6E965B6E9FF
                  00FFFF00FF65B6E965B6E966B7EAFFFFFFFDFEFEFEFEFEFEFEFEFFFFFF6A6A6A
                  CACACAFEFEFE3047C9FEFEFE6A6A6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65B6
                  E965B6E965B6E9FF00FFFF00FF65B6E865B6E966B7EAFFFFFFFDFEFEFEFEFEFE
                  FEFEFFFFFF6A6A6AFEFEFE3047C93047C93047C93047C9FEFEFEFFFFFFFFFFFF
                  FFFFFFFFFFFF65B6E965B6E965B6E9FF00FFFF00FF65B6E865B6E966B7EAFFFF
                  FFFDFEFEFEFEFEFEFEFEFFFFFF6A6A6AFEFEFE3047C9FEFEFE3047C93047C930
                  47C9FEFEFEFFFFFFFFFFFFFFFFFF65B6E965B6E965B6E9FF00FFFF00FF65B6E9
                  65B6E966B7EAFFFFFFFDFEFEFEFEFEFEFEFEFFFFFF6A6A6AFEFEFEFEFEFEEAEA
                  EAE0E0E03047C93047C93047C9FFFFFFFFFFFFFFFFFF65B6E965B6E965B6E9FF
                  00FFFF00FF65B6E865B6E966B7EAFFFFFFFDFEFEFEFEFEFEFEFEFFFFFF6A6A6A
                  6A6A6A6A6A6A6A6A6A6A6A6AFEFEFE3047C93047C9FEFEFEFFFFFFFFFFFF65B6
                  E965B6E965B6E9FF00FFFF00FF65B6E965B6E966B7EAFFFFFFFDFEFEFEFEFEFE
                  FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFE
                  FEFEFEFFFFFF65B6E965B6E965B6E9FF00FFFF00FF65B6E865B6E966B7EAFFFF
                  FFFDFEFEFEFEFEFEFEFEFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFEFEFEFEFEFEFFFFFF65B6E965B6E965B6E9FF00FFFF00FF65B6E8
                  65B6E966B7EAFFFFFFFDFEFEFEFEFEFEFEFEFFFFFF6A6A6A6A6A6A6A6A6A6A6A
                  6A6A6A6A6A6A6AFDFDFDFCFCFCFDFDFDFEFEFEFFFFFF65B6E965B6E965B6E9FF
                  00FFFF00FF65B6E865B6E966B7EAFFFFFFFDFEFEFEFEFEFEFEFEFFFFFF6A6A6A
                  E0E0E0FDFDFD3047C9FDFDFD6A6A6AFDFDFDFCFCFCFDFDFDFEFEFEFFFFFF65B6
                  E965B6E965B6E9FF00FFFF00FF65B6E865B6E966B7EAFFFFFFFDFEFEFEFEFEFE
                  FEFEFFFFFF6A6A6AFDFDFD374DCA3047C9374DCA3047C9FDFDFDFDFDFDFDFDFD
                  FEFEFEFFFFFF65B6E965B6E965B6E9FF00FFFF00FF65B6E965B6E966B7EAFFFF
                  FFFDFEFEFEFEFEFEFEFEFFFFFF6A6A6AFDFDFD3047C9FDFDFD3047C93047C930
                  47C9FDFDFDFDFDFDFEFEFEFFFFFF65B6E965B6E966B7EAFF00FFFF00FF65B6E8
                  65B6E966B7EAFFFFFFFDFEFEFEFEFEFEFEFEFFFFFF6A6A6AFDFDFDFDFDFDE0E0
                  E0E0E0E03047C93047C93047C9FDFDFDFEFEFEFFFFFF65B6E965B6E966B7EAFF
                  00FFFF00FF65B6E865B6E966B7EAFFFFFFFDFEFEFEFEFEFEFEFEFFFFFF6A6A6A
                  6A6A6A6A6A6A6A6A6A6A6A6AFDFDFD3047C93047C9FDFDFDFEFEFEFFFFFF65B6
                  E965B6E966B7EAFF00FFFF00FF65B6E965B6E966B7EAFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
                  FFFFFFFFFFFF65B6E965B6E966B7EAFF00FFFF00FF65B6E865B6E966B7EAFFFF
                  FFFFFFFFC4C4C4ACACACACACACACACACACACACACACACACACACACACACACACACAC
                  ACACACACACC1C1C1FFFFFFFFFFFF65B6E965B6E966B7EAFF00FFFF00FF65B6E8
                  65B6E966B7EAFFFFFFFFFFFFA3A3A37777777777777878787777777878787777
                  777777777777777878787777779D9D9DFFFFFFFFFFFF65B6E965B6E966B7EAFF
                  00FFFF00FF6FBAE866B7E966B7EA66B7E96CB5E3B0CBDCB4BDC3909394797979
                  7878787878787878787878787878788F9191B5BCC1B9CCD965B6E965B6E966B7
                  EA67B7E96FBAE9FF00FFFF00FFAECFE466B7EA66B7EA66B7EA66B7EA6AB8E8A7
                  CAE0FF00FFADAEAF777777FF00FFFF00FF777777A9AAAAFF00FFAECBDE6BB8E8
                  65B6E965B6E965B6E965B6E9AECFE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFC5C7C9777777787878777777777777C2C4C5FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton25Click
                ExplicitTop = 6
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 264
              ExplicitHeight = 264
              inherited ScrollBox2: TScrollBox
                Height = 247
                ExplicitHeight = 247
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
  inherited PopupMenu1: TPopupMenu
    Left = 740
    Top = 441
    object Removerstatusconferindo: TMenuItem
      Caption = 'Remover status conferindo'
      OnClick = RemoverstatusconferindoClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 614
    Top = 443
  end
  inherited Timer1: TTimer
    Left = 662
    Top = 443
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 702
    Top = 443
  end
  object dsConfCegaItens: TDataSource
    AutoEdit = False
    DataSet = dtmConferenciaCega.cdsConfCegaItens
    Left = 128
    Top = 449
  end
  object OpenDialogXML: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 184
    Top = 456
  end
  object dsItensNF: TDataSource
    AutoEdit = False
    DataSet = dtmConferenciaCega.cdsINf
    Left = 272
    Top = 441
  end
  object PopupMenu3: TPopupMenu
    Left = 606
    Top = 203
    object MenuItem1: TMenuItem
      Caption = 'Remover Nota Fiscal'
      OnClick = NoExibirPropaganda1Click
    end
  end
end
