inherited frmCadPlanoContasRel: TfrmCadPlanoContasRel
  Caption = 'Grupos do Resumo Financeiro'
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
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'Cadastro - Grupos do Resumo Financeiro'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 68
                    Top = 34
                    Width = 37
                    Height = 13
                    Caption = 'C'#243'digo:'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 55
                    Top = 65
                    Width = 50
                    Height = 13
                    Caption = 'Descri'#231#227'o:'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 57
                    Top = 96
                    Width = 48
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Natureza:'
                  end
                  object DBEdit1: TDBEdit
                    Left = 111
                    Top = 31
                    Width = 54
                    Height = 21
                    DataField = 'CODIGO'
                    DataSource = DtmCadBasicosCx.dsPlanoContasRel
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 111
                    Top = 62
                    Width = 394
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'DESCRICAO'
                    DataSource = DtmCadBasicosCx.dsPlanoContasRel
                    TabOrder = 1
                  end
                  object DBComboBox1: TDBComboBox
                    Left = 111
                    Top = 93
                    Width = 145
                    Height = 21
                    Style = csDropDownList
                    CharCase = ecUpperCase
                    DataField = 'NATUREZA'
                    DataSource = DtmCadBasicosCx.dsPlanoContasRel
                    ItemHeight = 13
                    Items.Strings = (
                      'E - ENTRADA'
                      'S - SA'#205'DA')
                    TabOrder = 2
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [CXG155]'
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
              Hint = 'Clique para pesquisar - [CXG149]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CXG150]'
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
                Hint = 'Editar Registro - [CXG151]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CXG152]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [CXG154]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Definir Plano de Contas - [CXG157]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD4C00BD4C00BD4C00BD4C00BD4C
                  00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD
                  4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00FF00FFBD4C00FFF6ED
                  FFF3E6FFEFDEFFEBD5FEE7CEFEE3C6FEE0BDFEDCB6FFD8AFFFD5A7FED1A1FECF
                  9DFECC98FECB96FECB96FECB96FECB96FECB96FECB96FECB96FECB96BD4C00FF
                  00FFBD4C00FFFBF4FFF7EEFEF4E7FFEFE0FEEBD7FFE9CFFEE5C6FEE0BFFEDCB7
                  FED8B0FED5A9FED1A3FECF9EFECC99FECB96FECB96FECB96FECB96FECB96FECB
                  96FECB96BD4C00FF00FFBD4C00FFFCFAFFFAF4FFF7EF817E7F817E7F817E7FFF
                  E9D0FEE5C9FEE1C0817E7F817E7F817E7FFED1A4FECF9EFECC99817E7F817E7F
                  817E7FFECB96FECB96FECB96BD4C00FF00FFBD4C00FFFFFFFFFEFBFFFBF6FFF7
                  EFFFF4E9FEF0E1FFEDD9FFE9D1FEE5CAFEE1C1FEDDBAFED9B1FED5ABFED1A4FE
                  D09FFECE99FECB97FECB96FECB96FECB96FECB96BD4C00FF00FFBD4C00FFFFFF
                  FFFFFFFFFCFC2D56F82D56F82D56F8FFF2E2FEEEDAFEEAD38B28038B28038B28
                  03FED9B2FED5ABFED3A50182BF0182BF0182BFFECB96FECB96FECB96BD4C00FF
                  00FFBD4C00FFFFFFFFFFFFFFFFFF2D56F82D56F82D56F8FFF6EBFFF2E3FEEFDC
                  8B28038B28038B2803FFDEBCFFDAB5FED7AD0182BF0182BF0182BFFECC97FECB
                  96FECB96BD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFF2D56F82D56F82D56F8FF
                  F8F2FEF6EDFEF3E58B28038B28038B2803FEE3C4FFE0BDFFDCB50182BF0182BF
                  0182BFFECE9CFECC98FECB96BD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFEFFFCF8FFFAF4FFF7EEFFF3E6FFEFDEFEEBD5FEE7CEFFE3C5FE
                  DEBDFEDAB6FED8AFFED5A9FED1A1FECF9DFECC98BD4C00FF00FFBD4C00FFFFFF
                  FFFFFFFFFFFFA19F9FA19F9FA19F9FFFFFFEFFFCFAFFFAF4A19F9FA19F9FA19F
                  9FFEEBD7FFE7CFFEE5C79A9A9A9A9A9A9A9A9AFFD5AAFED1A3FED09EBD4C00FF
                  00FFBD4C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFA
                  FFFAF6FFF7EFFEF4E7FEF0E0FEEDD9FFE9D0FEE5C7FEE0C0FEDDB8FED8B0FED5
                  A9FED1A3BD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFFBD8281BD8281BD8281FF
                  FFFFFFFFFFFFFFFFD96401D96401D96401FFF4EAFFF0E1FFEDD9008201008201
                  008201FEDEBAFFD9B2FED5ABBD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFFBD82
                  81BD8281BD8281FFFFFFFFFFFFFFFFFFD96401D96401D96401FFF7F0FFF4EAFF
                  F0E3008201008201008201FEE2C2FFDDBAFFD9B2BD4C00FF00FFBD4C00FFFFFF
                  FFFFFFFFFFFFBD8281BD8281BD8281FFFFFFFFFFFFFFFFFFD96401D96401D964
                  01FFFCF7FFF8F0FFF6EA008201008201008201FEE6CCFEE2C4FEDEBCBD4C00FF
                  00FFBD4C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFEFFFBF8FFF8F3FFF6EBFFF2E5FFEFDDFEEBD4FEE7
                  CCFFE2C4BD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFBF8FFFAF3FFF7ED
                  FFF3E6FFEFDEFFEBD7FFE7CEBD4C00FF00FFBD4C00D96401D96401D96401D964
                  01D96401D96401D96401D96401D96401D96401D96401D96401D96401D96401D9
                  6401D96401D96401D96401D96401D96401D96401BD4C00FF00FFBD4C00BD4C00
                  BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C
                  00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00FF
                  00FFFF00FFBD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00
                  BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C
                  00BD4C00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [CXG156]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Flat = False
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
        object tsTipoConta: TTabSheet
          Caption = 'tsTipoConta'
          ImageIndex = 3
          object pnTipoConta: TPanel
            Left = 3
            Top = 3
            Width = 755
            Height = 504
            TabOrder = 0
            object Panel4: TPanel
              Left = 1
              Top = 473
              Width = 753
              Height = 30
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtnTipoContaOK: TBitBtn
                Left = 298
                Top = 1
                Width = 75
                Height = 25
                Hint = 'OK - [CXG158]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtnTipoContaOKClick
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
              object BitBtnTipoContaCanc: TBitBtn
                Left = 376
                Top = 1
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtnTipoContaCancClick
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
            object GroupBox5: TGroupBox
              Left = 1
              Top = 1
              Width = 753
              Height = 49
              Align = alTop
              Caption = 'Grupos do Resumo Financeiro (ENTRADA / SA'#205'DAS DIVERSAS)'
              TabOrder = 0
              object DBText1: TDBText
                Left = 40
                Top = 24
                Width = 697
                Height = 17
                DataField = 'DESCRICAO'
                DataSource = DtmCadBasicosCx.dsPlanoContasRel
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
            object CheckListBox1: TCheckListBox
              Left = 1
              Top = 50
              Width = 753
              Height = 423
              Align = alClient
              ItemHeight = 13
              TabOrder = 1
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
