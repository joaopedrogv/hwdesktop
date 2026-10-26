inherited FrmCadEstados: TFrmCadEstados
  Caption = 'Estados'
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
                Caption = 'Cadastro de Estados'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 257
                    Caption = ''
                    ExplicitHeight = 257
                    object Label6: TLabel
                      Left = 111
                      Top = 28
                      Width = 44
                      Height = 13
                      Caption = 'Codigo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 57
                      Top = 54
                      Width = 98
                      Height = 13
                      Caption = 'Nome do Estado:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 134
                      Top = 79
                      Width = 21
                      Height = 13
                      Caption = 'UF:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 65
                      Top = 127
                      Width = 90
                      Height = 13
                      Caption = 'Nome UF IBGE:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 71
                      Top = 152
                      Width = 84
                      Height = 13
                      Caption = 'C'#243'd. UF IBGE:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object Label11: TLabel
                      Left = 6
                      Top = 102
                      Width = 149
                      Height = 13
                      Caption = 'Al'#237'quota Interna de ICMS:'
                      FocusControl = DBEdit5
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label453: TLabel
                      Left = 48
                      Top = 177
                      Width = 107
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'M'#225'scara Telefone:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 205
                      Top = 212
                      Width = 336
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Percentual relativo ao Fundo de Combate a Pobreza (FCP):'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 160
                      Top = 24
                      Width = 54
                      Height = 21
                      DataField = 'CODIGO_UF'
                      DataSource = DtmCadBasicos.dsEstados
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 160
                      Top = 49
                      Width = 291
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NOME_UF'
                      DataSource = DtmCadBasicos.dsEstados
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 160
                      Top = 74
                      Width = 75
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'SIGLA_UF'
                      DataSource = DtmCadBasicos.dsEstados
                      TabOrder = 2
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 160
                      Top = 124
                      Width = 508
                      Height = 21
                      DataField = 'IBGE_CODIGO_UF'
                      DataSource = DtmCadBasicos.dsEstados
                      KeyField = 'CODIGO_UF_IBGE'
                      ListField = 'NOME_UF;CODIGO_UF_IBGE'
                      ListSource = DtmCadBasicos.dsAbreEstadoIBGE
                      TabOrder = 4
                      OnExit = DBLookupComboBox1Exit
                    end
                    object DBEdit4: TDBEdit
                      Left = 160
                      Top = 149
                      Width = 121
                      Height = 21
                      DataField = 'CODIGO_UF_IBGE'
                      DataSource = DtmCadBasicos.dsAbreEstadoIBGE
                      Enabled = False
                      TabOrder = 5
                      Visible = False
                    end
                    object DBEdit5: TDBEdit
                      Left = 160
                      Top = 99
                      Width = 121
                      Height = 21
                      DataField = 'ALIQ_INTRA'
                      DataSource = DtmCadBasicos.dsEstados
                      TabOrder = 3
                    end
                    object DBEdit242: TDBEdit
                      Left = 160
                      Top = 174
                      Width = 121
                      Height = 21
                      DataField = 'MASCARA_FONE'
                      DataSource = DtmCadBasicos.dsEstados
                      Enabled = False
                      TabOrder = 6
                    end
                    object RadioGroupMascaraTelefone: TRadioGroup
                      Left = 287
                      Top = 168
                      Width = 185
                      Height = 32
                      Columns = 2
                      ItemIndex = 0
                      Items.Strings = (
                        '8 d'#237'gitos'
                        '9 d'#237'gitos')
                      TabOrder = 7
                      OnClick = RadioGroupMascaraTelefoneClick
                    end
                    object DBEdit6: TDBEdit
                      Left = 547
                      Top = 209
                      Width = 121
                      Height = 21
                      DataField = 'PFCP'
                      DataSource = DtmCadBasicos.dsEstados
                      TabOrder = 8
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS043]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS044]'
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
              Hint = 'Clique para pesquisar - [BAS036]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS037]'
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
            inherited Splitter1: TSplitter
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO_UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SIGLA_UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IBGE_CODIGO_UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_INTRA'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS038]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS040]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS041]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'CFOP Interestaduais'
                Glyph.Data = {
                  5E030000424D5E030000000000001E0100002800000018000000180000000100
                  08000000000040020000120B0000120B00003A0000003A00000000000000FFFF
                  FF00FF00FF0082220300BB490000C14D0000C14F0000BF4D0000BF4E0000BD4C
                  0000CF640C00CF671400D76D1600D76E1600D56D1600D76F1700CF6B1A00D774
                  2400DC7A2800D77A3000E0833700D8762200DD7D2800DC7B2800E58B3B00E68C
                  3C00E78E3D00E68C3D00E18E4600EA984E00EDA16000F0A66500F6AC6A00F4AB
                  6900F4AC6900F6AD6B00F4B17400F2A35500F3A45600F3A55600F2A35600F3A5
                  5700F4A65900FCB875001C600C001B69100019731500187E1B00187F1C001882
                  1F001789220017862000168C240016932800169027001695290014A0300013A6
                  3500020202090202020202020303030303030302020202020202020202090202
                  02020202031E1D14110B0302020202020202020202090909090907050323291A
                  160F030202020202020202020209020202020202030303030303030202020202
                  0202020202090202020202020202020202020202020202020202020202090202
                  0202020203030303030303020202020202020202020902020202020203222819
                  170C0302020202020202020202090909090908050320261B170D030202020202
                  0202020202090202020202020303030303030302020202020202020202090202
                  0202020202020202020202020202020202020202020902020202020203030303
                  030303020202020202020202020902020202020203212519120E030202020202
                  0202020202090909090906040323271A160D0302020202020202020202090202
                  0202020203030303030303020202020202020202020902020202020202020202
                  020202020202020202020303030303030302020202020202020202022C2C2C02
                  0202032B2A18150A0302020202020202020202022C2D2C02020203241F1C1310
                  0302020202020202020202022C2E2C0202020303030303030302020202020202
                  022C2C2C2C2F2C2C2C2C0202020202020202020202020202022C353634323331
                  302C0202020202020202020202020202022C2C2C2C372C2C2C2C020202020202
                  0202020202020202020202022C382C0202020202020202020202020202020202
                  020202022C392C0202020202020202020202020202020202020202022C2C2C02
                  0202}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'CST Interestaduais'
                Glyph.Data = {
                  6A030000424D6A030000000000002A0100002800000018000000180000000100
                  08000000000040020000120B0000120B00003D0000003D00000000000000FFFF
                  FF00FF00FF00025C0400035D0500025C0500035C0700058F0D00058E0D00058C
                  0D0006900F00068E0E0007921100089212000A9716000A9616000B9817000C97
                  18000D9C1B000F9C1D000E9D1D000F9D1E00109E200011A0220013A1240014A3
                  260015A4280016A72B0018A72C0018AA2F001AAC31001CAF35001CAC33001EB0
                  370020B63B0021B53C0022B53E0024BA410025BD440025BA430028BD480029C1
                  4B002AC24D002AC04B002DC752002DC653002DC5520030C9560033CC5A0033CA
                  5A0034CC5C0036D0600038D3640037CF62003AD367003CD76B003DD86B003FD9
                  6F0040DA700041DD730043E17700020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202060606060202020202020202020202020202020202020203
                  0108070706020202020202020202020202020202020202030108070706020202
                  0202020202020202020202020202020301080707060202020202020202020202
                  0202020202020205010807070602020202020202020202020202020202020204
                  010A07070602020202020202020202020202020202020204010F0C0C06020202
                  0202020202020202020606060606060401141010040606060606060202020202
                  060134302C2926221B181511120E0C070707070602020202060134302C292622
                  201C1916120E0C07070707060202020206013735312E2B27231F1D1A1713110D
                  0B0908060202020206010101010101010124211E010101010101010602020202
                  0206060606060604012825250406060606060602020202020202020202020206
                  012D2A2A060202020202020202020202020202020202020601322F2F06020202
                  0202020202020202020202020202020601363333060202020202020202020202
                  02020202020202060139383C0602020202020202020202020202020202020206
                  013A3B3C06020202020202020202020202020202020202060101010106020202
                  0202020202020202020202020202020206060606020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202}
                OnClick = SpeedButton8Click
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
                Hint = 'Ver registros da lixeira - [BAS042]'
                OnClick = SpeedButton25Click
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
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 65532
    Top = 57
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 304
    Top = 176
  end
end
