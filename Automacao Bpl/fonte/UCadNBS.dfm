inherited FrmCadNBS: TFrmCadNBS
  Caption = 'NBS'
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
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'Cadastro de NBS'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 156
                    Top = 27
                    Width = 59
                    Height = 13
                    Hint = 'C'#243'digo NBS'
                    Alignment = taRightJustify
                    Caption = 'C'#243'digo NBS:'
                    FocusControl = DBEdit1
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label7: TLabel
                    Left = 143
                    Top = 54
                    Width = 72
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Descri'#231#227'o NBS:'
                    FocusControl = DBEdit2
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label35: TLabel
                    Left = 47
                    Top = 81
                    Width = 167
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Aliq Produtos e Servi'#231'os Nacionais:'
                  end
                  object Label36: TLabel
                    Left = 38
                    Top = 105
                    Width = 177
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Aliq Produtos e Servi'#231'os Importados:'
                  end
                  object DBEdit1: TDBEdit
                    Left = 221
                    Top = 24
                    Width = 64
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'COD_NBS'
                    DataSource = dtmProdutos.dsNBS
                    TabOrder = 0
                    OnKeyPress = DBEdit1KeyPress
                  end
                  object DBEdit2: TDBEdit
                    Left = 221
                    Top = 51
                    Width = 364
                    Height = 21
                    Hint = 'Descri'#231#227'o NBS'
                    CharCase = ecUpperCase
                    DataField = 'DESCRICAO_NBS'
                    DataSource = dtmProdutos.dsNBS
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 221
                    Top = 78
                    Width = 65
                    Height = 21
                    Hint = 'Al'#237'quotas para os produtos e servi'#231'os nacionais'
                    CharCase = ecUpperCase
                    DataField = 'ALIQNAC'
                    DataSource = dtmProdutos.dsNBS
                    TabOrder = 2
                  end
                  object DBEdit4: TDBEdit
                    Left = 221
                    Top = 105
                    Width = 65
                    Height = 21
                    Hint = 'Al'#237'quota m'#233'dia para os produtos e servi'#231'os importados'
                    CharCase = ecUpperCase
                    DataField = 'ALIQIMP'
                    DataSource = dtmProdutos.dsNBS
                    TabOrder = 3
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS329]'
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair'
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
              Hint = 'Clique para pesquisar - [BAS325]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS326]'
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
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS327]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS328]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Visible = False
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 
                  'Atualizar al'#237'quotas de tributa'#231#227'o m'#233'dia dos produtos e servi'#231'os ' +
                  '-[PRO265]'
                Glyph.Data = {
                  66060000424D660600000000000036000000280000002C0000000C0000000100
                  1800000000003006000000000000000000000000000000000000A28A8AA6A6A6
                  9798986A6D6D828687B3B6B6636565818383AAACAC7F8181868888515B5E3E5E
                  623A5B6139575D3742463C535637484B394A503B59603C5D653C585D323A3935
                  393A353B3D37484B3A61683D717B38606738494B384B4F3B636A3B6A743B4F55
                  3A3E423A50543B555A3A40443540443959613C6D763A6970375156333D3D1C73
                  749595958385854D51516C7070A6A9A94548476A6D6D9C9E9E6567686F717231
                  576029A6BA2094AB208B9E14414B20899B1762701B60702395AC23A2B92592A4
                  0E181D12191B11282E186A7B20A2BC22ABC51DA1BA196D7D1A62722393A725AB
                  C51B869B1338411D707D1F8495143038144B581C9DB422ACC521ABC21C879C0E
                  363B1C73749494968384854D50516B6F70A6A8A94547476A6C6D9B9D9E656768
                  6F7271305B6524AFC81A90A91C98AE166B7B1BB6D31B97B11B8398209BB41CA6
                  BF1DADC71C57671746531658651E9FB8177C9213525F197F951CA1B7186A7A18
                  62721C8CA31BB2CD17515E1976891B8DA31338421F94AD199FB5135967156C7B
                  1CA9C3166E7D1C73749494968384854D50516B6F70A6A8A94547486A6C6E9B9D
                  9F6567676E73712F5B6424ACC619859B1C9DB61CA6C11BACC81CADC91CAAC41E
                  93A81C9DB51FB4D01D89A12099B11D8DA51BA1BA124A560F1A1C144D5B1BA4BB
                  1A83971A889D1E9EB817879B153E461978881B8DA214414D1EB0CC16798A0D1A
                  1E1032391694AC1F92A61C73749494968384854D50516B6F70A6A8A94547486A
                  6C6E9B9D9F6567676F72712E5B6422ABC417798E1798B31CC4E51771851793AB
                  18BEDB1A879A1B98AF1EA6C0146C7F21B4CE1F97B01CA9C3186F811238411871
                  851DABC51C99B21CAFC916748815484F13343B1C84971B97AE164F5C1FA6BF19
                  94AA14404D1657651CA8C21A7B8D1C73749494968384864D50516B6F70A6A8A9
                  4547486A6C6D9B9D9E6567686F7271305D6228ADC41A6F801A8B9F27BCD81238
                  451862731FB3CF1976891E94A824C0DE23B3CD20A3BA195E681A87971EB5D021
                  AECC20B3CF1B82961869791EAFC71DACC82E92A1257A8E26BFDE21C3E22CA5B8
                  19677B22B9D41EB3CF1FB6D321A5BF1C4E5A1C73749494968384864D50516B6F
                  70A6A8A94547486A6C6D9C9E9E6668686F7171313C3F2141491E333815303718
                  39421F282818292C10313A122B30203C4527515B164149192A332024271D292D
                  224B551B5A691B444D1722251A23262B50572D697713383E102E3415424A1341
                  4A1339411B282A19373F265F6C2D606C1F383D1722241C73749494968384854D
                  50516B6F70A6A8A94547486A6C6D9B9D9E6566676E71714B4C4D7E8282757979
                  4E51526364647D7E7C4E50501A1D1D3D3F407A7A7A8C8F8D6A6C6C535454777B
                  7A70747473747326282A4A4E4E5A5D5C626363888988888C893C3D3E181F1D48
                  4D4B464A4B3A3C407C7F8053555565696A898C8B7C7E7E36393B1C7374949496
                  8384854D50516C6F70A6A8A9444748696C6D9B9D9E6566676F7171606262C1C3
                  C49E9FA0949596B6B7B7B9BBBB60636327292A797B7D8F9192686B6BB6B8B9A5
                  A7A8A4A6A6848787B5B8B7676668959898ADADAE9E9FA07C7C7E8F9090969898
                  282D2D767A7A898B8C8E9091D3D4D49FA0A0A1A2A27B7C7CA3A4A47F81801C73
                  749494968383854D50516C6F70A6A8A9444748696C6D9B9D9E6567677071715F
                  6161B4B6B68486869C9E9DC0C2C2B0B1B1525656292D2D848788767979353737
                  B8B9B9B7B9B98789895A5C5BB0B2B2868788ABADADBABBBB9EA0A05052526567
                  67B5B9B82E32317D8180BCBFBE949796B9BBBBACADAD9C9E9E4B4D4D8F909097
                  9998DC73739494958384854D51516C7070A6A8A9444747696C6D9B9D9E646666
                  6F71715E6060C4C6C6AFB1B1818383A0A3A2BBBDBD686C6C202424626566A1A3
                  A4A2A4A4A8A9A98587878082825658589EA0A04648487F8181959898919493A4
                  A6A6B0B2B26E72712429287D807FAAAEAD4B4F4E9A9D9D888A8A989A9AA7A9A9
                  ADAFAF5F6161A08382A0A0A09091916063637B7E7DAFB1B1585B5A787B7BA5A7
                  A87577787E80805052525E5F5F595B5B4245454C504F5E5F5F494C4B2C303138
                  3C3D5A5D5D6E6F6F4C4E4E434545484A4A3D3E3E4F5151333636434646484C4C
                  494E4D696B6B636464383B3B2D3231474A494C50503136354D50504547474F51
                  51686A6A5B5D5D383A3A}
                OnClick = SpeedButton6Click
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
                Top = 6
                Visible = False
                ExplicitTop = 6
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
end
