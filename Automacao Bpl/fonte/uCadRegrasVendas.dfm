inherited FrmCadRegrasVendas: TFrmCadRegrasVendas
  Caption = 'Regras Pol'#237'tica de Pagamento'
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
                  VertScrollBar.Position = 6
                  inherited GroupBox1: TGroupBox
                    Top = -6
                    Width = 754
                    Height = 450
                    Caption = ''
                    ExplicitTop = -6
                    ExplicitWidth = 754
                    ExplicitHeight = 450
                    object Label6: TLabel
                      Left = 104
                      Top = 24
                      Width = 59
                      Height = 13
                      Caption = 'Cod. Regra:'
                      FocusControl = DBEdit1
                    end
                    object Label9: TLabel
                      Left = 96
                      Top = 73
                      Width = 67
                      Height = 13
                      Caption = 'Pessoa F'#237'sica:'
                    end
                    object Label12: TLabel
                      Left = 28
                      Top = 148
                      Width = 135
                      Height = 13
                      Caption = 'Valor M'#237'nimo para a Parcela:'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 52
                      Top = 196
                      Width = 111
                      Height = 13
                      Caption = 'N'#250'mero M'#225'x. Parcelas:'
                      FocusControl = DBEdit8
                    end
                    object Label7: TLabel
                      Left = 130
                      Top = 49
                      Width = 33
                      Height = 13
                      Caption = 'Regra:'
                      FocusControl = DBEdit2
                    end
                    object Label14: TLabel
                      Left = 93
                      Top = 220
                      Width = 70
                      Height = 13
                      Caption = 'Prazo M'#225'ximo:'
                      FocusControl = DBEdit3
                    end
                    object Label15: TLabel
                      Left = 8
                      Top = 294
                      Width = 155
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Max. Desconto Documento (%):'
                      FocusControl = DBEdit4
                    end
                    object Label19: TLabel
                      Left = 24
                      Top = 246
                      Width = 139
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Max. Desconto Produto (%):'
                      FocusControl = DBEdit5
                    end
                    object Label20: TLabel
                      Left = 27
                      Top = 270
                      Width = 136
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Max. Desconto Servi'#231'o (%):'
                      FocusControl = DBEdit9
                    end
                    object Label29: TLabel
                      Left = 43
                      Top = 97
                      Width = 120
                      Height = 13
                      Caption = 'Valor M'#237'nimo Documento:'
                      FocusControl = DBEdit7
                    end
                    object Label8: TLabel
                      Left = 294
                      Top = 250
                      Width = 450
                      Height = 26
                      Caption = 
                        'Para n'#227'o permitir desconto informe zero, para permitir qualquer ' +
                        'percentual de desconto deixe em branco e para permitir percentua' +
                        'l de desconto espec'#237'fico informe o valor desejado.'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label11: TLabel
                      Left = 294
                      Top = 295
                      Width = 438
                      Height = 13
                      Caption = 
                        'Max. Desconto Produto (%) / Max. Desconto Servi'#231'o (%) / Max. Des' +
                        'conto Documento (%)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label10: TLabel
                      Left = 294
                      Top = 278
                      Width = 42
                      Height = 13
                      Caption = 'Campos:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label18: TLabel
                      Left = 39
                      Top = 123
                      Width = 124
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor M'#225'ximo Documento:'
                      FocusControl = DBEdit7
                    end
                    object Label21: TLabel
                      Left = 24
                      Top = 173
                      Width = 139
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor M'#225'ximo para a Parcela:'
                      FocusControl = DBEdit10
                    end
                    object DBEdit1: TDBEdit
                      Left = 169
                      Top = 21
                      Width = 73
                      Height = 21
                      DataField = 'COD_REGRAVND'
                      DataSource = DtmCadBasicos.dsRegraVND
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit7: TDBEdit
                      Left = 169
                      Top = 145
                      Width = 120
                      Height = 21
                      DataField = 'PARCELAMIN'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 5
                    end
                    object DBEdit8: TDBEdit
                      Left = 169
                      Top = 193
                      Width = 120
                      Height = 21
                      DataField = 'MAXPARCELAS'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 7
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 169
                      Top = 70
                      Width = 73
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'PESSOAFISICA'
                      DataSource = DtmCadBasicos.dsRegraVND
                      ItemHeight = 0
                      Items.Strings = (
                        'SIM'
                        'N'#195'O'
                        'AMBOS')
                      TabOrder = 2
                      OnKeyPress = DBComboBox2KeyPress
                    end
                    object DBEdit2: TDBEdit
                      Left = 169
                      Top = 46
                      Width = 420
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 169
                      Top = 217
                      Width = 120
                      Height = 21
                      DataField = 'PRAZOMAX'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 8
                    end
                    object DBEdit4: TDBEdit
                      Left = 169
                      Top = 291
                      Width = 120
                      Height = 21
                      DataField = 'MAX_DESC'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 11
                    end
                    object DBEdit5: TDBEdit
                      Left = 169
                      Top = 243
                      Width = 120
                      Height = 21
                      DataField = 'MAX_DESCPROD'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 9
                    end
                    object DBEdit9: TDBEdit
                      Left = 169
                      Top = 267
                      Width = 120
                      Height = 21
                      DataField = 'MAX_DESCSERV'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 10
                    end
                    object DBEdit11: TDBEdit
                      Left = 169
                      Top = 94
                      Width = 120
                      Height = 21
                      DataField = 'VALORMINDOC'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 3
                    end
                    object DBEdit6: TDBEdit
                      Left = 169
                      Top = 120
                      Width = 120
                      Height = 21
                      DataField = 'VALORMAXDOC'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 4
                    end
                    object DBEdit10: TDBEdit
                      Left = 169
                      Top = 170
                      Width = 120
                      Height = 21
                      DataField = 'PARCELAMAX'
                      DataSource = DtmCadBasicos.dsRegraVND
                      TabOrder = 6
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [BAS346]'
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
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS340]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS341]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS342/BAS343]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS345]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 
                  'Listar/Vincular tipo venda/controle/condi'#231#245'es de pagamento - [BA' +
                  'S511/BAS507/BAS509/BAS349]'
                Glyph.Data = {
                  C2030000424DC203000000000000820100002800000018000000180000000100
                  08000000000040020000120B0000120B0000530000005300000000000000FFFF
                  FF00FF00FF00A4262600B02D2D00B12F2F00B6393900B63A3A00B83F3F00BA42
                  4200BC484800BD4B4B00BF4D4D00BF4E4E00C0505000C0515100C1535300C154
                  5400C2565600C4595900C45A5A00C6606000C7636300C9666600CC6F6F00CC70
                  7000CE747400CF777700D17E7E00D3808000D4848400D5888800D78B8B00004B
                  0000035E06000464080007931000089611000896120009971300099714000996
                  12000996130007740E000A9915000B991600097411000C9A18000D9E1B000FA0
                  1D000FA11F000C77170010951F000E7D1A00119620000F811C00118C1F001398
                  23001197220014A727001399250013902400159A2700138F2300169D2900169C
                  2800159127001AAF31001BB033001B9F310021B83D001C9C340020AA3B0023AD
                  410028C1490028C048002FC954002EC1520035CF5E0036D060003BD768003FD9
                  6F0041DC70000202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020221
                  0202020202020202020202020202020202020202020221382102020202020202
                  02020202020202020202020202213F2441210202020202020202020202020202
                  020202022142312D253E21020202020202020202020202020202022137433B32
                  2F263C21020202020202020202020202020221354B46443D2140273921020202
                  02020202020202020221334E4C4A4521022130283A2102020202020202020202
                  022151504F4821030202212E2C36210202020202020202020221475249210A11
                  03020202212D342102020202020202020203214D21100C0A0F03020202212F29
                  210202020202020203091821150D03120A0F0302020221232A21020202020203
                  081C1B19140302030E0A0E0302020202212B2102020202031F1E1D1603020202
                  03070B0D03020202022122210202020313201703020202020202030B0D030202
                  0202022121020202031A030202020202020202030C0A03020202020202210202
                  02030202020202020202020203050A0302020202020202020202020202020202
                  0202020202020306030202020202020202020202020202020202020202020203
                  0403020202020202020202020202020202020202020202020203030202020202
                  0202020202020202020202020202020202020203020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  020202020202}
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
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
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
        object TabSheet5: TTabSheet
          Caption = 'TabSheet5'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 783
            Height = 510
            ActivePage = TabSheet8
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object TabSheet8: TTabSheet
              Caption = 'Tipos de Documento'
              ImageIndex = 3
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 775
                Height = 479
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Panel12: TPanel
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 73
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object DBText7: TDBText
                    Left = 437
                    Top = 13
                    Width = 48
                    Height = 13
                    AutoSize = True
                    DataField = 'COD_REGRAVND'
                    DataSource = DtmCadBasicos.dsRegraVND
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label30: TLabel
                    Left = 17
                    Top = 13
                    Width = 413
                    Height = 13
                    Caption = 
                      'Relacione os tipos de documento desejados com a pol'#237'tica de paga' +
                      'mento'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label31: TLabel
                    Left = 17
                    Top = 42
                    Width = 487
                    Height = 13
                    Caption = 
                      'D'#234' duplo clique ou utilize a barra de espa'#231'os para selecionar/re' +
                      'tirar sele'#231#227'o  [BAS512]'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText8: TDBText
                    Left = 463
                    Top = 13
                    Width = 48
                    Height = 13
                    AutoSize = True
                    DataField = 'DESCRICAO'
                    DataSource = DtmCadBasicos.dsRegraVND
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btSelectAllTipo: TSpeedButton
                    Left = 607
                    Top = 44
                    Width = 23
                    Height = 21
                    Hint = 'Adicionar todos tipos - [BAS512]'
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
                    OnClick = btSelectAllTipoClick
                  end
                  object btUnSelectAllTipo: TSpeedButton
                    Left = 636
                    Top = 44
                    Width = 23
                    Height = 21
                    Hint = 'Remover todos tipos de venda - [BAS512]'
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
                    OnClick = btUnSelectAllTipoClick
                  end
                  object BitBtn9: TBitBtn
                    Left = 689
                    Top = 42
                    Width = 75
                    Height = 25
                    Caption = '&Voltar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                    OnClick = BitBtn65Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
                      1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
                      BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
                      007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
                      4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
                      E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
                      00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
                      FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
                      F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
                      00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
                      5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
                      F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
                      00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
                      E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
                      F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
                      00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
                      6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
                      FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
                      00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
                      9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
                      CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
                      00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  end
                  object Panel14: TPanel
                    Left = 684
                    Top = 13
                    Width = 80
                    Height = 13
                    BevelOuter = bvNone
                    Caption = 'Regra Atual'
                    Color = 11323537
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBackground = False
                    ParentFont = False
                    TabOrder = 1
                  end
                end
                object DBGrid5: TDBGrid
                  Left = 0
                  Top = 73
                  Width = 775
                  Height = 406
                  Align = alClient
                  DataSource = DtmCadBasicos.dsRegraTipo
                  ReadOnly = True
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBGrid5DrawColumnCell
                  OnDblClick = DBGrid5DblClick
                  OnKeyDown = DBGrid5KeyDown
                  OnTitleClick = DBGrid5TitleClick
                end
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'Tipos de Venda'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object Panel7: TPanel
                Left = 0
                Top = 0
                Width = 775
                Height = 73
                Align = alTop
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object DBText5: TDBText
                  Left = 408
                  Top = 13
                  Width = 48
                  Height = 13
                  AutoSize = True
                  DataField = 'COD_REGRAVND'
                  DataSource = DtmCadBasicos.dsRegraVND
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label27: TLabel
                  Left = 17
                  Top = 13
                  Width = 384
                  Height = 13
                  Caption = 
                    'Relacione os tipos de venda desejados com a pol'#237'tica de pagament' +
                    'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label28: TLabel
                  Left = 17
                  Top = 42
                  Width = 487
                  Height = 13
                  Caption = 
                    'D'#234' duplo clique ou utilize a barra de espa'#231'os para selecionar/re' +
                    'tirar sele'#231#227'o  [BAS508]'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText6: TDBText
                  Left = 434
                  Top = 13
                  Width = 48
                  Height = 13
                  AutoSize = True
                  DataField = 'DESCRICAO'
                  DataSource = DtmCadBasicos.dsRegraVND
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btSelectAllTipoVenda: TSpeedButton
                  Left = 607
                  Top = 44
                  Width = 23
                  Height = 21
                  Hint = 'Adicionar todos tipos de venda  - [BAS508]'
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
                  OnClick = btSelectAllTipoVendaClick
                end
                object btUnSelectAllTipoVenda: TSpeedButton
                  Left = 636
                  Top = 44
                  Width = 23
                  Height = 21
                  Hint = 'Remover todos tipos de venda - [BAS508]'
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
                  OnClick = btUnSelectAllTipoVendaClick
                end
                object BitBtn8: TBitBtn
                  Left = 689
                  Top = 42
                  Width = 75
                  Height = 25
                  Caption = '&Voltar'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = BitBtn65Click
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
                    1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
                    BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
                    007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
                    4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
                    E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
                    00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
                    FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
                    F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
                    00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
                    5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
                    F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
                    00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
                    E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
                    F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
                    00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
                    6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
                    FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
                    00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
                    9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
                    CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
                    00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
                object Panel11: TPanel
                  Left = 684
                  Top = 13
                  Width = 80
                  Height = 13
                  BevelOuter = bvNone
                  Caption = 'Regra Atual'
                  Color = 11323537
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 73
                Width = 775
                Height = 406
                Align = alClient
                Caption = 'Panel5'
                TabOrder = 1
                object DBGrid4: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 773
                  Height = 404
                  Align = alClient
                  DataSource = DtmCadBasicos.dsRegraTipoVndOS
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBGrid4DrawColumnCell
                  OnDblClick = DBGrid4DblClick
                  OnKeyDown = DBGrid4KeyDown
                  OnTitleClick = DBGrid4TitleClick
                end
              end
            end
            object TabSheet6: TTabSheet
              Caption = 'Controles'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 775
                Height = 73
                Align = alTop
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Label25: TLabel
                  Left = 17
                  Top = 13
                  Width = 354
                  Height = 13
                  Caption = 'Relacione as controles desejados com a pol'#237'tica de pagamento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label26: TLabel
                  Left = 17
                  Top = 42
                  Width = 487
                  Height = 13
                  Caption = 
                    'D'#234' duplo clique ou utilize a barra de espa'#231'os para selecionar/re' +
                    'tirar sele'#231#227'o  [BAS510]'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText3: TDBText
                  Left = 379
                  Top = 13
                  Width = 48
                  Height = 13
                  AutoSize = True
                  DataField = 'COD_REGRAVND'
                  DataSource = DtmCadBasicos.dsRegraVND
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText4: TDBText
                  Left = 405
                  Top = 13
                  Width = 48
                  Height = 13
                  AutoSize = True
                  DataField = 'DESCRICAO'
                  DataSource = DtmCadBasicos.dsRegraVND
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btSelectAllControle: TSpeedButton
                  Left = 607
                  Top = 44
                  Width = 23
                  Height = 21
                  Hint = 'Adicionar todos controles - [BAS510]'
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
                  OnClick = btSelectAllControleClick
                end
                object btUnSelectAllControle: TSpeedButton
                  Left = 636
                  Top = 44
                  Width = 23
                  Height = 21
                  Hint = 'Remover todos controles - [BAS510]'
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
                  OnClick = btUnSelectAllControleClick
                end
                object BitBtn7: TBitBtn
                  Left = 689
                  Top = 42
                  Width = 75
                  Height = 25
                  Caption = '&Voltar'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = BitBtn65Click
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
                    1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
                    BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
                    007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
                    4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
                    E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
                    00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
                    FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
                    F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
                    00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
                    5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
                    F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
                    00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
                    E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
                    F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
                    00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
                    6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
                    FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
                    00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
                    9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
                    CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
                    00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
                object Panel28: TPanel
                  Left = 684
                  Top = 13
                  Width = 80
                  Height = 13
                  BevelOuter = bvNone
                  Caption = 'Regra Atual'
                  Color = 11323537
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object Panel8: TPanel
                Left = 0
                Top = 73
                Width = 775
                Height = 406
                Align = alClient
                Caption = 'Panel5'
                TabOrder = 1
                object DBGrid3: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 773
                  Height = 404
                  Align = alClient
                  DataSource = DtmCadBasicos.dsRegraControle
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBGrid3DrawColumnCell
                  OnDblClick = DBGrid3DblClick
                  OnKeyDown = DBGrid3KeyDown
                  OnTitleClick = DBGrid3TitleClick
                end
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'Condi'#231#245'es de Pagamento'
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object Panel5: TPanel
                Left = 0
                Top = 73
                Width = 775
                Height = 406
                Align = alClient
                Caption = 'Panel5'
                TabOrder = 0
                object DBGrid2: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 773
                  Height = 404
                  Align = alClient
                  DataSource = DtmCadBasicos.dsRegraCondPag
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBGrid2DrawColumnCell
                  OnDblClick = DBGrid2DblClick
                  OnKeyDown = DBGrid2KeyDown
                  OnTitleClick = DBGrid2TitleClick
                end
              end
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 775
                Height = 73
                Align = alTop
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object DBText1: TDBText
                  Left = 466
                  Top = 13
                  Width = 48
                  Height = 13
                  AutoSize = True
                  DataField = 'COD_REGRAVND'
                  DataSource = DtmCadBasicos.dsRegraVND
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label16: TLabel
                  Left = 17
                  Top = 13
                  Width = 442
                  Height = 13
                  Caption = 
                    'Relacione as condi'#231#245'es de pagamento desejadas com a pol'#237'tica de ' +
                    'pagamento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label17: TLabel
                  Left = 17
                  Top = 42
                  Width = 484
                  Height = 13
                  Caption = 
                    'D'#234' duplo clique ou utilize a barra de espa'#231'os para selecionar/re' +
                    'tirar sele'#231#227'o [BAS350]'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText2: TDBText
                  Left = 492
                  Top = 13
                  Width = 48
                  Height = 13
                  AutoSize = True
                  DataField = 'DESCRICAO'
                  DataSource = DtmCadBasicos.dsRegraVND
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btSelectAllCondPag: TSpeedButton
                  Left = 607
                  Top = 44
                  Width = 23
                  Height = 21
                  Hint = 'Adicionar todas condi'#231#245'es de pagamento -  [BAS350]'
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
                  OnClick = btSelectAllCondPagClick
                end
                object btUnSelectAllCondPag: TSpeedButton
                  Left = 636
                  Top = 44
                  Width = 23
                  Height = 21
                  Hint = 'Remover todas condi'#231#245'es de pagamento -  [BAS350]'
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
                  OnClick = btUnSelectAllCondPagClick
                end
                object BitBtn65: TBitBtn
                  Left = 689
                  Top = 42
                  Width = 75
                  Height = 25
                  Caption = '&Voltar'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = BitBtn65Click
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
                    1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
                    BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
                    007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
                    4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
                    E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
                    00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
                    FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
                    F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
                    00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
                    5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
                    F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
                    00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
                    E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
                    F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
                    00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
                    6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
                    FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
                    00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
                    9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
                    CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
                    00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
                object Panel13: TPanel
                  Left = 684
                  Top = 13
                  Width = 80
                  Height = 13
                  BevelOuter = bvNone
                  Caption = 'Regra Atual'
                  Color = 11323537
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Width = 562
      ExplicitWidth = 562
      inherited bMarketingHW: TBitBtn
        Width = 560
        ExplicitWidth = 560
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
