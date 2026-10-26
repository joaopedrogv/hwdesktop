inherited frmCadOperacoesInternas: TfrmCadOperacoesInternas
  Caption = 'Cadastro de Opera'#231#245'es Internas'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    BevelOuter = bvNone
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 545
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 545
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 545
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 545
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 545
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 545
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 514
            ExplicitWidth = 787
            ExplicitHeight = 514
            inherited PageControl3: TPageControl
              Width = 787
              Height = 466
              ActivePage = tabCadastro
              ExplicitWidth = 787
              ExplicitHeight = 466
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 435
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 435
                  ExplicitWidth = 779
                  ExplicitHeight = 435
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    ExplicitWidth = 775
                  end
                end
              end
              object tabCadastro: TTabSheet
                Caption = 'Cadastro'
                ImageIndex = 1
                object Label6: TLabel
                  Left = 55
                  Top = 16
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Codigo'
                end
                object Label7: TLabel
                  Left = 42
                  Top = 43
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Descri'#231#227'o'
                end
                object Label9: TLabel
                  Left = 42
                  Top = 72
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Empresas'
                end
                object lbOpNFCeDefault: TLabel
                  Left = 232
                  Top = 21
                  Width = 337
                  Height = 13
                  Caption = 
                    '**Esta opera'#231#227'o interna est'#225' configurada como padr'#227'o para NFC-e*' +
                    '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object edSeqId: TEdit
                  Left = 94
                  Top = 13
                  Width = 121
                  Height = 21
                  Enabled = False
                  TabOrder = 0
                  Text = 'edSeqId'
                end
                object edDescricao: TEdit
                  Left = 94
                  Top = 40
                  Width = 395
                  Height = 21
                  CharCase = ecUpperCase
                  Color = clWhite
                  TabOrder = 1
                  Text = 'EDDESCRICAO'
                end
                inline CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame
                  Left = 94
                  Top = 67
                  Width = 395
                  Height = 59
                  TabOrder = 2
                  TabStop = True
                  ExplicitLeft = 94
                  ExplicitTop = 67
                  ExplicitWidth = 395
                  ExplicitHeight = 59
                  inherited CheckListBoxEmpresas1: TCheckListBox
                    Width = 395
                    Height = 59
                    ExplicitWidth = 395
                    ExplicitHeight = 59
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 466
              Width = 787
              ExplicitTop = 466
              ExplicitWidth = 787
              inherited LabelSeq: TLabel
                Visible = False
              end
              inherited CheckCadSeq: TCheckBox
                Visible = False
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited GroupBox3: TGroupBox
            Width = 787
            ExplicitWidth = 787
            inherited imgInformation: TImage
              Left = 761
              ExplicitLeft = 761
            end
            inherited CheckBox3: TCheckBox
              Left = 409
              Visible = False
              ExplicitLeft = 409
            end
            inherited CheckBox1: TCheckBox
              Left = 504
              Visible = False
              ExplicitLeft = 504
            end
            object ckLixeira: TCheckBox
              Left = 257
              Top = 50
              Width = 112
              Height = 17
              Caption = 'Pesquisar na lixeira'
              TabOrder = 11
            end
          end
          inherited Panel1: TPanel
            Width = 787
            Height = 441
            ExplicitWidth = 787
            ExplicitHeight = 441
            inherited Splitter1: TSplitter
              Height = 380
              ExplicitHeight = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 380
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton2: TSpeedButton
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton4: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton5: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton6: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton7: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton8: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton11: TSpeedButton
                Left = 178
                Hint = 'Selecionar Opera'#231#227'o Interna padr'#227'o para NFCe'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFD6CB9
                  7343A54B43A54B43A54B43A54B43A54B43A54B43A54B43A54B43A54B43A54B43
                  A54B43A54B43A54B43A54B6DBA74FDFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF81C687078C13078C13078C13078C13078C13078C13078C13078C13078C
                  13078C13078C13078C13078C13078C13078C13078C1383C788FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF61B8690A90162C9C365FAE635FAE635FAE635FAE63
                  5FAE635FAE635FAE635FAE635FAE635FAE635FAE635FAE632C9C360A901661B9
                  69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63BB6C0C951A5CB061EAE0E0EA
                  E0E0EAE0E0EAE0E0EAE0E0EAE0E0EAE0E0EAE0E0EAE0E0EAE0E0EAE0E0EAE0E0
                  5CB1610C951A63BC6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65BF6F0F99
                  1D5FB666EDE5E5EDE5E5EDE5E5EDE5E5EDE5E5EDE5E5EDE5E5EDE5E5EDE5E5ED
                  E5E5EDE5E5EDE5E55FB6660F991D65BF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF67C271119D1F62BA69F0E9E9F0E9E9F0E9E9D8E0D238A43D40A745DFE3
                  D9F0E9E9F0E9E9F0E9E9F0E9E9F0E9E962BA69119D1F67C271FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF68C57313A02264BE6DF3EDEDF3EDEDE1E7DD42B049
                  1FA4291FA4294BB352EAEAE5F3EDEDF3EDEDF3EDEDF3EDED64BE6D13A02268C5
                  73FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6AC87514A32466C370F5F0F0E5
                  EBE14EBB592DB13B4EBB5943B84F2DB13B67C470F1EEECF5F0F0F5F0F0F5F0F0
                  66C37014A3246AC875FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6BCA7616A5
                  2668C572EAEFE75CC56838BA4858C364E6EEE3D7EAD746BE5538BA487ECF87F6
                  F3F2F7F3F3F7F3F368C57216A5266BCA76FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF6CCC7818A8286AC976C3E7C63FC0505BC96AE8F1E7F9F6F6F9F6F6D0EA
                  D247C3583FC05093D89BF9F6F6F9F6F66AC97618A8286CCC78FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF6ECE7A19AA2A6CCC78FAF8F8C0E7C4E7F3E8FAF8F8
                  FAF8F8FAF8F8FAF8F8C5E8C945C25541C152A6DFACFAF8F86CCC7819AA2A6ECE
                  7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF7B1AAC2B6ECE79FCFBFBFC
                  FBFBFCFBFBFCFBFBFCFBFBFCFBFBFCFBFBFCFBFBBAE6BF43C25443C254C8EBCB
                  6ECE791AAC2B6FCF7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FD17B1AAD
                  2B6FD07BFDFCFCFDFCFCFDFCFCFDFCFCFDFCFCFDFCFCFDFCFCFDFCFCFDFCFCAE
                  E3B469CD75E9F6EA6FD07B1AAD2B6FD17BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF70D17C1BAE2D6FD17BFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD6FD17B1BAE2D70D17CFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF70D27D1BAF2D70D27DFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE70D27D1BAF2D70D2
                  7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D27D1CAF2D3BBF4C69D07569
                  D07569D07569D07569D07569D07569D07569D07569D07569D07569D07569D075
                  3BBF4C1CAF2D70D27DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93DF9C1CAF
                  2D1CAF2D1CAF2D1CAF2D1CAF2D1CAF2D1CAF2D1CAF2D1CAF2D1CAF2D1CAF2D1C
                  AF2D1CAF2D1CAF2D1CAF2D1CAF2D94DE9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFDFFFD93E09C79D68579D68579D68579D68579D68579D68579D68579D6
                  8579D68579D68579D68579D68579D68579D68593E09CFDFFFDFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton11Click
                ExplicitLeft = 178
              end
              inherited SpeedButton12: TSpeedButton
                Left = 634
                Top = 6
                Visible = False
                ExplicitLeft = 634
                ExplicitTop = 6
              end
              inherited SpeedButton23: TSpeedButton
                Left = 657
                Top = 6
                Visible = False
                ExplicitLeft = 657
                ExplicitTop = 6
              end
              inherited SpeedButton24: TSpeedButton
                Left = 643
                Top = 6
                Visible = False
                ExplicitLeft = 643
                ExplicitTop = 6
              end
              inherited SpeedButton25: TSpeedButton
                Left = 657
                Top = 6
                Visible = False
                ExplicitLeft = 657
                ExplicitTop = 6
              end
              inherited SpeedButton26: TSpeedButton
                Left = 121
                Hint = 'Vincular com Tipos Vendas'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E3C0
                  F1CF97F6E0BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFEEC470E39E1CE19918DF9314E8B665FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFF9E9C5E8A924E5A420E39E1CE19918DF9314F6E0BEFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DDA0EAAF28E8A924E5A420E39E1CE199
                  18F1CF95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EBC5ECB52CEAAF28
                  E8AA24E6A420E39F1DF7E3C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD
                  B8B1C6A043ECB52CEAAF29E8AA25EFC470FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFD3D0CB7D72657E7366DFCEA5F7DEA2F9E9C4FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFEFDFAF0CA85E3A12EE19B2AECC17EFEFCF9FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFE4E1DF81776A7C7164C8C3BDFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D08AE4A11EE29B1AE09616DD9012EC
                  C17FFFFFFFFFFFFFFFFFFFFFFFFFEFEDEC887E727C7164B0A9A1FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBB43CE7A722E4A1
                  1EE29B1ADF9516D38C1A7C71647C71647C71647C71647C71647C7164A0998FFD
                  FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  EDBA3FE9AC26E6A622E4A01EE29A19D6921C7C71647C71647C71647C71647C71
                  647C7164A0998FFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFF5D990EBB12AE8AB26E6A621E4A01DEFC984FFFFFFFFFFFF
                  FFFFFFFFFFFFEFEDEC887E727C7164B0A9A1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAF5D88FEDB93EEAB43BF2CF89FE
                  FDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E1DF81776A7C7164C8C3BDFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D0CB7D
                  72657E7366DAC29DEFCB94F5DEBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFBDB8B1BE8D35E09617DD8F12DA890DE7B161FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E7C3E5A420E39D1BE09616DD8F11DA88
                  0CF5DEBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DC9FE8AB25E5A420
                  E39D1BE09616DD8F11EEC991FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
                  ECC6EBB12AE8AA25E5A320E29C1BE09616F6E1BFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFF3D179EBB12AE8AA25E5A320ECBF6CFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAECC6F6DCA0F9E8C3FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton26Click
                ExplicitLeft = 121
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 380
              ExplicitHeight = 380
              inherited ScrollBox2: TScrollBox
                Height = 363
                ExplicitHeight = 363
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
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
