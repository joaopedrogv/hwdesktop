inherited frmCadProducao: TfrmCadProducao
  Caption = 'Pedido de Produ'#231#227'o'
  ClientHeight = 612
  ClientWidth = 834
  ExplicitWidth = 842
  ExplicitHeight = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 834
    Height = 593
    ExplicitWidth = 834
    ExplicitHeight = 593
    inherited Splitter2: TSplitter
      Height = 591
      ExplicitLeft = 831
      ExplicitHeight = 591
    end
    inherited PanelLeft: TPanel
      Width = 829
      Height = 591
      ExplicitWidth = 829
      ExplicitHeight = 591
      inherited PageControl1: TPageControl
        Width = 827
        Height = 589
        ExplicitWidth = 827
        ExplicitHeight = 589
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 819
          ExplicitHeight = 558
          inherited ScrollBox1: TScrollBox
            Width = 819
            Height = 558
            ExplicitWidth = 819
            ExplicitHeight = 558
            inherited PageControl3: TPageControl
              Width = 819
              Height = 510
              ActivePage = tsCadastro
              ExplicitWidth = 819
              ExplicitHeight = 510
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 811
                ExplicitHeight = 479
                inherited ScrollBox3: TScrollBox
                  Width = 811
                  Height = 479
                  ExplicitWidth = 811
                  ExplicitHeight = 479
                  inherited GroupBox1: TGroupBox
                    Width = 807
                    Height = 474
                    Caption = ''
                    ExplicitWidth = 807
                    ExplicitHeight = 474
                  end
                end
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
                  Width = 811
                  Height = 479
                  Align = alClient
                  Caption = 'Dados do Pedido de Produ'#231#227'o'
                  TabOrder = 0
                  OnEnter = GroupBox4Enter
                  object Panel8: TPanel
                    Left = 2
                    Top = 15
                    Width = 807
                    Height = 117
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Panel15: TPanel
                      Left = 0
                      Top = 0
                      Width = 807
                      Height = 32
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label16: TLabel
                        Left = 53
                        Top = 19
                        Width = 33
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cliente'
                        FocusControl = DBEdit3
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit3: TDBEdit
                        Left = 92
                        Top = 11
                        Width = 88
                        Height = 21
                        Hint = '[F3: Pesquisar]   [F4: Novo]  - C'#243'digo do Cliente'
                        DataField = 'COD_CLIENTE'
                        DataSource = dtmProducao.dsProducao
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 0
                        OnExit = DBEdit3Exit
                        OnKeyDown = DBEdit3KeyDown
                      end
                      object DBLookupComboBox1: TDBLookupComboBox
                        Left = 186
                        Top = 11
                        Width = 320
                        Height = 21
                        Hint = '[F3: Pesquisar]   [F4: Novo]  - Cliente selecionado'
                        DataField = 'COD_CLIENTE'
                        DataSource = dtmProducao.dsProducao
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE;RAZAO'
                        ListSource = dtmProducao.dsClientes
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 1
                      end
                    end
                    object Panel16: TPanel
                      Left = 0
                      Top = 32
                      Width = 807
                      Height = 84
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label15: TLabel
                        Left = 570
                        Top = 8
                        Width = 69
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data Abertura'
                        FocusControl = DBEdit2
                      end
                      object Label18: TLabel
                        Left = 41
                        Top = 8
                        Width = 45
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Produ'#231#227'o'
                      end
                      object Label6: TLabel
                        Left = 234
                        Top = 35
                        Width = 146
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Quantidade Produ'#231#227'o Prevista'
                        FocusControl = DBEdit1
                      end
                      object Label7: TLabel
                        Left = 25
                        Top = 35
                        Width = 61
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'N'#250'mero Lote'
                      end
                      object Label8: TLabel
                        Left = 600
                        Top = 35
                        Width = 39
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Unidade'
                        FocusControl = DBEdit17
                      end
                      object Label9: TLabel
                        Left = 41
                        Top = 62
                        Width = 45
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Produ'#231#227'o'
                        FocusControl = DBEdit18
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object SpeedButton9: TSpeedButton
                        Left = 511
                        Top = 58
                        Width = 23
                        Height = 22
                        Hint = 'Alterar Produ'#231#227'o'
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
                        OnClick = SpeedButton9Click
                      end
                      object SpeedButton10: TSpeedButton
                        Left = 512
                        Top = 31
                        Width = 23
                        Height = 22
                        Hint = 'Alterar quantidade da Produ'#231#227'o'
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
                        OnClick = SpeedButton10Click
                      end
                      object SpeedButton13: TSpeedButton
                        Left = 540
                        Top = 58
                        Width = 23
                        Height = 22
                        Hint = 'Ver Mat'#233'rias Primas da Produ'#231#227'o'
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000D30E0000D30E00000001000000010000181810001818
                          18002929290031313100313931004A39310039393900423939004A423900524A
                          3900424242004A4A42004A4A4A00524A4A0052524A00735A4A00525252005A5A
                          5A007B6B5A00846B5A00636363006B6363006B6B6B0094846B00737373009484
                          73009C8C7300737B7B007B7B7B0094947B00A5947B00848484009C948400A594
                          8400AD94840084848C008C8C8C0094948C00A59C8C00AD9C8C00ADA58C00EFBD
                          8C0094949400A59C9400B5A59400BDB59400C6B59400DEBD9400EFBD9400F7BD
                          9400EFC6940094949C009C9C9C00A5A59C00B5AD9C00EFBD9C00E7C69C00EFC6
                          9C00E7CE9C009CA5A500A5A5A500A5ADA500B5ADA500B5B5A500C6BDA500CEBD
                          A500D6BDA500E7C6A500F7CEA500EFD6A500FFD6A500ADADAD00B5ADAD00B5B5
                          AD00DEC6AD00EFC6AD00DECEAD00EFCEAD00F7CEAD00F7D6AD00FFD6AD00F7DE
                          AD00B5B5B500CEC6B500E7CEB500F7D6B500FFD6B500FFDEB500BDBDBD00EFD6
                          BD00F7D6BD00FFD6BD00F7DEBD00FFDEBD00FFE7BD00BDBDC600BDC6C600C6C6
                          C600F7D6C600F7DEC600FFDEC600FFF7C600C6C6CE00CECECE00D6D6CE00EFDE
                          CE00FFDECE00F7E7CE00FFE7CE00FFEFCE00D6D6D600DEDED600FFDED600FFE7
                          D600FFEFD600DEDEDE00FFF7DE00FFFFDE00E7E7E700EFE7E700FFEFE700FFF7
                          E700FFFFE700EFEFEF00FFF7EF00FFFFEF00F7F7F700FFFFF700FF00FF00F7FF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080808080
                          8080808080808080808080808080808080808080808052068080808080808080
                          8080808080470C2A1C80808080808080808080803C0A2A6E2480808080808080
                          808080471134612A80808080808080808080581634522A808080808080343434
                          34801601161F808080808080580C0D0C103C06165880808080808033176B7974
                          7121166F808080808080580779744A4A6C7F15618080808080803C2E714B3030
                          386B1A18808080808080344271634444646C271F808080808080494056647474
                          5A561E2380808080808067265071817F70561D3C80808080808080672D4F7A74
                          4541588080808080808080803C3F453A53358080808080808080}
                        OnClick = SpeedButton13Click
                      end
                      object Label43: TLabel
                        Left = 572
                        Top = 62
                        Width = 67
                        Height = 13
                        Hint = 'Tipo de Convers'#227'o'
                        Alignment = taRightJustify
                        Caption = 'Tp Convers'#227'o'
                      end
                      object DBEdit2: TDBEdit
                        Left = 645
                        Top = 5
                        Width = 120
                        Height = 21
                        DataField = 'DATA'
                        DataSource = dtmProducao.dsProducao
                        Enabled = False
                        TabOrder = 0
                      end
                      object DBEdit4: TDBEdit
                        Left = 92
                        Top = 5
                        Width = 414
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESCRICAO'
                        DataSource = dtmProducao.dsProducao
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 1
                      end
                      object DBEdit1: TDBEdit
                        Left = 386
                        Top = 32
                        Width = 120
                        Height = 21
                        DataField = 'QUANTIDADEPREVISTA'
                        DataSource = dtmProducao.dsProducao
                        Enabled = False
                        TabOrder = 2
                        OnExit = DBLookupComboBox2Exit
                      end
                      object DBEdit16: TDBEdit
                        Left = 92
                        Top = 32
                        Width = 88
                        Height = 21
                        Hint = '[F3: Pesquisar]   [F4: Novo]  - C'#243'digo do Cliente'
                        CharCase = ecUpperCase
                        DataField = 'NLOTE'
                        DataSource = dtmProducao.dsProducao
                        Enabled = False
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 3
                      end
                      object DBEdit17: TDBEdit
                        Left = 645
                        Top = 32
                        Width = 120
                        Height = 21
                        DataField = 'UNIDADE'
                        DataSource = dtmProducao.dsProducao
                        TabOrder = 4
                      end
                      object DBEdit18: TDBEdit
                        Left = 92
                        Top = 59
                        Width = 88
                        Height = 21
                        Hint = '[F3: Pesquisar]   [F4: Novo]  - C'#243'digo do Cliente'
                        DataField = 'COD_FORMULA'
                        DataSource = dtmProducao.dsProducao
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 5
                        OnExit = DBLookupComboBox2Exit
                      end
                      object DBLookupComboBox2: TDBLookupComboBox
                        Left = 186
                        Top = 59
                        Width = 320
                        Height = 21
                        Hint = '[F3: Pesquisar]   [F4: Novo]  - Cliente selecionado'
                        DataField = 'COD_FORMULA'
                        DataSource = dtmProducao.dsProducao
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        KeyField = 'COD_FORMULA'
                        ListField = 'PRODUTO'
                        ListSource = dtmProducao.dsFormCons
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 6
                        OnEnter = DBLookupComboBox2Enter
                        OnExit = DBLookupComboBox2Exit
                      end
                      object DBEdit21: TDBEdit
                        Left = 186
                        Top = 59
                        Width = 320
                        Height = 21
                        DataField = 'PRODUTO'
                        DataSource = dtmProducao.dsFormCons
                        Enabled = False
                        TabOrder = 7
                      end
                      object DBLookupComboBox3: TDBLookupComboBox
                        Left = 645
                        Top = 59
                        Width = 120
                        Height = 21
                        DataField = 'TIPO_CONVERSAO'
                        DataSource = dtmProducao.dsProducao
                        Enabled = False
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 8
                      end
                    end
                  end
                  object Panel9: TPanel
                    Left = 2
                    Top = 132
                    Width = 807
                    Height = 345
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 6
                    TabOrder = 1
                    object pnConsultaItensAcabados: TGroupBox
                      Left = 6
                      Top = 6
                      Width = 795
                      Height = 333
                      Align = alClient
                      Caption = 'Resultado da Produ'#231#227'o'
                      TabOrder = 0
                      object pnConsultaResultadoFinal: TPanel
                        Left = 2
                        Top = 15
                        Width = 791
                        Height = 316
                        Align = alClient
                        BevelOuter = bvNone
                        BorderWidth = 6
                        TabOrder = 0
                        object DBGrid3: TDBGrid
                          Left = 6
                          Top = 6
                          Width = 779
                          Height = 241
                          Align = alClient
                          DataSource = dtmProducao.dsItemAcab
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'SEQ'
                              Width = 41
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'NUM_FAB_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'QUANTIDADE'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'PESO_UN'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'PESO_UTIL'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'DESCR_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'GRUPO_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'COD_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'COD_GRADE'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'NITEM'
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
                              Visible = True
                            end>
                        end
                        object Panel5: TPanel
                          Left = 6
                          Top = 269
                          Width = 779
                          Height = 41
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 1
                          object BitBtn9: TBitBtn
                            Left = 100
                            Top = 6
                            Width = 157
                            Height = 25
                            Hint = 'Novo Item - [PPR007]'
                            Caption = 'Adicionar Item a Produzir'
                            TabOrder = 0
                            OnClick = BitBtn9Click
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
                          object BitBtn10: TBitBtn
                            Left = 263
                            Top = 6
                            Width = 95
                            Height = 25
                            Hint = 'Alterar Quantidade - [PPR008]'
                            Caption = 'Alterar Qtde'
                            TabOrder = 1
                            OnClick = BitBtn10Click
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
                          object BitBtn11: TBitBtn
                            Left = 465
                            Top = 6
                            Width = 114
                            Height = 25
                            Hint = 'Remover Item - [PPR012]'
                            Caption = 'Remover Item'
                            TabOrder = 2
                            OnClick = BitBtn11Click
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
                          object BitBtn12: TBitBtn
                            Left = 585
                            Top = 6
                            Width = 89
                            Height = 25
                            Caption = 'MP/Insumos'
                            TabOrder = 3
                            OnClick = BitBtn12Click
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                              73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                              8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                              9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                              A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                              AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                              BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                              D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                              E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                              F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                              424242424242424242422B39180B42424242424242424242424243443C180B42
                              4242424242424242424242444438180B42424242424242424242424244433918
                              0A424242424242424242424242444335004201101A114242424242424242453D
                              05072F343434291942424242424242221A2D34343437403E0442424242424206
                              231C303437404146284242424242421B210F30373A414140310D42424242421F
                              20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                              2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                              4227312D21252314424242424242424242420E141B1B42424242}
                          end
                          object BitBtn33: TBitBtn
                            Left = 680
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Fotos'
                            Caption = 'Fotos'
                            TabOrder = 4
                            OnClick = BitBtn106Click
                            Glyph.Data = {
                              EA020000424DEA02000000000000EA0100002800000010000000100000000100
                              08000000000000010000120B0000120B00006D0000006D00000000000000FFFF
                              FF008E8CA900FF00FF00A6869C0072535F007E596300C0737C00B15A5B00D961
                              5D00D65F5C00E8880000FF9A0000FF9B0000F79A0800BD7B1000927F350086A1
                              7200759E79002FBF5A002A9653003CAA7E0041C99A0049C9B7004CC8B6003768
                              620039928B005AA5A30000FFFF0002FAFB000AB2BF0008A8B90019DCF70016CE
                              EF0002B8DE00158FA9002A9CB2004BA3B8001EA6CD0026C3EC00197C980042AA
                              C70005789E0016B5E400058AB8000090C800057AA8000C7BA90063CCF6000075
                              A800158FC3001E9ED50023A4DD00259CD2002AABE6002DAEE60034B0E90047A1
                              C8000081C000007DB90000669A00086EA3000A73A8000D81B90027A9EB002291
                              C600288CBD002982AE003EB3ED0040B5EF003588B100157BB1001D82B9001F84
                              BB002086BD00258AC200298DC6002F93CC00369ED6003CAEEA003BABE60043B4
                              F00047BCFA00317FA80049B8F4004DC0FF003F9CCE0054B9F1004EABDE0056B9
                              F00058B7E90046A9E30049B0EC0055C0FF005CBEF90072B9EC005B92BD00769C
                              BC004796E40050AAFF004096FA004296FF001F59BC002154B3002A6AF7008695
                              B7000E3CE0000235FF000023FB00030303030303030303030303030303030303
                              03030303030303030303030303030303030303033E4B4B3E0303030303030303
                              033D43413433322F2E3C0303030303033D0208064636231E1F2C2D3C0303033D
                              5F07090A05261D1C1C22282A3C03475A58610469602720212B120B0F19314D68
                              6A66565552514F40250E0C0D103B4B646B6C675E5D54453837291B1124310349
                              6365621A395C5044353F3C3A3C03034957301513145303420303030303030303
                              3E4C171618595B4E3E0303030303030303033E484D4D4A3E0303030303030303
                              0303030303030303030303030303030303030303030303030303030303030303
                              0303030303030303030303030303}
                          end
                          object bt_variacao: TBitBtn
                            Left = 19
                            Top = 6
                            Width = 75
                            Height = 25
                            Caption = 'Varia'#231#227'o'
                            TabOrder = 5
                            OnClick = bt_variacaoClick
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000E30E0000E30E0000000100000001000000000000C600
                              0000FF00000000C60000C6C6000000FF0000FFFF0000AD5A5A00CE636300BD7B
                              7300848484009CADAD000000C600C600C60000C6C600C6C6C6000000FF00FF00
                              FF00FF42FF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                              1111111111111111111111110908080808080808080808080711111109050303
                              0806040408120D0D0711111109050503080606040812120D0711111109050505
                              08060606081212120711111109080808080808080808080807111111090B0A0A
                              08140F0F0800000007111111090B0B0A0814140F0800000007111111090B0B0B
                              0814141408000000071111110908080808080808080808080711111109100C0C
                              08130E0E08020101071111110910100C0813130E080202010711111109101010
                              0813131308020202071111110808080808080808080808080811111111111111
                              1111111111111111111111111111111111111111111111111111}
                          end
                          object BitBtn35: TBitBtn
                            Left = 364
                            Top = 6
                            Width = 95
                            Height = 25
                            Hint = 'Alterar Quantidade - [PPR008]'
                            Caption = 'Qtde Final'
                            TabOrder = 6
                            OnClick = BitBtn35Click
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
                        end
                        object Panel10: TPanel
                          Left = 6
                          Top = 247
                          Width = 779
                          Height = 22
                          Align = alBottom
                          BevelOuter = bvNone
                          TabOrder = 2
                          object Label35: TLabel
                            Left = 1
                            Top = 3
                            Width = 157
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Total do Resultado da Produ'#231#227'o:'
                          end
                          object DBText10: TDBText
                            Left = 164
                            Top = 5
                            Width = 138
                            Height = 17
                            DataField = 'QUANTIDADEPRODUZIDA'
                            DataSource = dtmProducao.dsProducao
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label36: TLabel
                            Left = 569
                            Top = 3
                            Width = 83
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Status Produ'#231#227'o:'
                          end
                          object DBText11: TDBText
                            Left = 658
                            Top = 3
                            Width = 120
                            Height = 17
                            DataField = 'STATUS'
                            DataSource = dtmProducao.dsProducao
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlue
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label40: TLabel
                            Left = 306
                            Top = 3
                            Width = 108
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Quantidade Produ'#231#227'o:'
                          end
                          object DBText14: TDBText
                            Left = 420
                            Top = 3
                            Width = 120
                            Height = 17
                            DataField = 'QUANTIDADEPRODUCAO'
                            DataSource = dtmProducao.dsProducao
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlue
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 510
              Width = 819
              ExplicitTop = 510
              ExplicitWidth = 819
              inherited LabelSeq: TLabel
                Enabled = False
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Left = 330
                Top = 9
                Hint = 'Salvar Pedido de Produ'#231#227'o - [PPR005]'
                ExplicitLeft = 330
                ExplicitTop = 9
              end
              inherited BitBtn5: TBitBtn
                Left = 411
                Top = 9
                Hint = 'Cancelar Registro - [PPR006]'
                ExplicitLeft = 411
                ExplicitTop = 9
              end
              inherited BitBtn6: TBitBtn
                Left = 692
                Top = 9
                ExplicitLeft = 692
                ExplicitTop = 9
              end
              inherited CheckCadSeq: TCheckBox
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 819
          ExplicitHeight = 558
          inherited GroupBox3: TGroupBox
            Width = 819
            ExplicitWidth = 819
            inherited imgInformation: TImage
              Left = 793
              ExplicitLeft = 794
            end
            object SpeedButton59: TSpeedButton [6]
              Left = 708
              Top = 44
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000007B00000084
                0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
              OnClick = SpeedButton59Click
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PPR001]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo Pedido de Produ'#231#227'o - [PPR002]'
            end
          end
          inherited Panel1: TPanel
            Width = 819
            Height = 485
            ExplicitWidth = 819
            ExplicitHeight = 485
            inherited Splitter1: TSplitter
              Height = 424
              ExplicitHeight = 424
            end
            inherited DBGrid1: TDBGrid
              Width = 526
              Height = 424
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 815
              ExplicitWidth = 815
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Pedido de Produ'#231#227'o - [PPR003]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Excluir Pedido de Produ'#231#227'o - [PPR004]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir Ficha do Pedido de Produ'#231#227'o - [PPR036]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Left = 768
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 768
                ExplicitTop = 6
              end
              inherited SpeedButton5: TSpeedButton
                Left = 768
                Top = -12
                Enabled = False
                Visible = False
                ExplicitLeft = 768
                ExplicitTop = -12
              end
              inherited SpeedButton6: TSpeedButton
                Left = 178
                Hint = 'Iniciar Processo de Produ'#231#227'o - [PPR016]'
                Glyph.Data = {
                  CE050000424DCE050000000000008E0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000D6000000D600000000000000FFFF
                  FF00FF00FF00014303000138020001340200024E040002480400014E04000141
                  0300039E0B0003970B0002640600026306000252060002500500024D05000358
                  070003A40C0003A10D0003A00C00039E0F00039E0C0004A10D0004A10F00049F
                  0F0005A11100036C0B0003690900059F1100035F0900035C080004680A000578
                  0D0006810F00056F0C00056B0C000789110005A4130005A3130005A0130006A3
                  130006A1130006A0150004700D0007A5170007A3150005750F0007A11600067A
                  11000892150007A5180007A3180007A3170008A51A0008A319000678120009A7
                  1C0009A31B000995180009881700088016000A8F1A0009A41E0009A41D000AA9
                  20000AA721000AA71F000AA521000AA51F000CA923000B961E000A8B1D000A87
                  1A000C981F000D9820000BA623000CAA26000CA624000CA623000DA727000C93
                  220014AB2C000DA928000DA728000EAC2B000EAB2B000DA028000EA929000FAC
                  2D000FAA2C000FA92C000FA92B000E9826002CB6440055C76B000FA92E0011AF
                  330010AA300011AB320012AA330075D3880012AD350013AD370013AB350014AC
                  370095DDA50013AF390013AC390014AD3B0016AD3E0016AD3D0016AC3B0018AD
                  3E0096DEA90015AF3E0016B0410016AF400017B0430017AF420017AB400019B1
                  430019AF42001CB1460018B1460018AD44001AB047001EB24A001FB44D006CD0
                  8B0019B149001AB049001BB24B001CB44E001CB14E001CB14D001DB24F001EB5
                  4E001FB2500020B5520020B4510024B755001CB451001DB553001DB250001FB6
                  55001FB5530023B5550024B7560025B8590025B7580028B75A0029B85A002BBA
                  5D002DBA5E002DBA5D002EBA5F0030BB600032BC620033BC640034BC640037BD
                  660038BF68003ABF68003BC06A003CC06B003EC06C0041C26D0041C16E0046C4
                  730047C574004DC6780057CA7F0078D599002FBB630035BD660036BF68003FC1
                  6E0042C2700048C5760048C575004BC577004FC77B0052C77D0056C9800058CB
                  820059CB84005ECC870060CE890063CE8A0064CE8B0066D08E006BD090006DD1
                  92006FD395006ED1920073D4980072D3950073D3960074D3970075D4980076D4
                  990079D59C0080D8A10080D7A00087DAA50086D9A50090DDAD0093DEAF006DD3
                  95007AD79F0087DAA70089DCA9008CDCAB000202020202020202020202020202
                  0202020202020202020202021F1F110E10070309090909090909090909090404
                  0202022F24382F2C1B1C0C0D0D0D0D0D0D0D0D0D0C0C08050402022F57554643
                  362E1A13141414141414141414120B060402023C6661564D41392D2618141414
                  141414141412120C0902023E6F6B635A504F40342A191616161616161614140C
                  090202477E76706862584F453A301A19161616161614140D0902024A8B8C7B71
                  69645C015240342A18160A161614140D0902024A98998D7F796D6801015E4537
                  301D16161614140D0902024AAFB09A8D807A6F0101015F44403528151614140D
                  0902024AAAB3AF9696897C01010101654F3F372B1D13140D0902024AB9BAA898
                  98938601010101016A4E443A2E27170C0302024ABEBFAA9A9B948A0101010101
                  725B504C4033291C0702024AC0D1AB9D9C968A01010101816C6460544C433623
                  0F02024AC2C4B79FA0988B010101AC7C746D6662584D422F1102024AC6CAB9A2
                  A59E970101A78A8884766E6C635953311E02024AC9CBBDA6B4A8AF01A096938B
                  8A877E756D66623D2002024ACAD3C5A8B4B2A4AF9D9B9B96938A888377736749
                  2302024AADD5CDB9B7B5B2A6A19EA19A968B8A90847C75482102024AC2D4D0D5
                  CDCCC8C0BBB7A9A199938A90868582512202024ABDD2D4CFCFD5CED2C2BCB6B1
                  AE95918F8E8F8E5D2502024A78BCC3ADCACAC7C1BDB8B4A39B948B90868E7D3B
                  250202024A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4B4A4A32320202020202020202
                  020202020202020202020202020202020202}
                OnClick = SpeedButton6Click
                ExplicitLeft = 178
              end
              inherited SpeedButton7: TSpeedButton
                Left = 292
                Hint = 'Reabrir Pedido de Produ'#231#227'o - [PPR035]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000130B0000130B00000000000000000000FF00FFFF00FF
                  FF00FFB89F8EFEFEFCFBF8F7F7F3F0F3EEEAEFE9E3EDE3DEE9DED8E5D9D3E2D4
                  CCDECEC6DAC9C0D7C4BAD3BFB4D0BAADD0BAADD0BAADA48B7A4E2E1CFF00FFFF
                  00FFFF00FFFF00FFFF00FFB89F8EFFFFFFFFFFFFFCFBFAF8F6F3F4F0EDF2EBE7
                  EEE6E1EAE1DAE7DCD5E3D7CFE0D0C9DCCBC2D9C6BCD5C1B6D1BCB0D0BAADA48B
                  7A4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FFB89F8EFFFFFFFFFFFFFFFFFFFC
                  FBFAF8F6F3F4F0EDF2EBE7EEE6E1EAE1DAE7DCD5E3D7CFE0D0C9DCCBC2D9C6BC
                  D5C1B6D1BCB0A48B7A4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FFB89F8EFFFF
                  FFFFFFFFFFFFFFFFFFFFFCFBFAF8F6F3F4F0EDF2EBE7EEE6E1EAE1DAE7DCD5E3
                  D7CFE0D0C9DCCBC2D9C6BCD5C1B6A48B7A4E2E1CFF00FFFF00FFFF00FFFF00FF
                  FF00FFB89F8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAF8F6F3F4F0EDF2EB
                  E7EEE6E1EAE1DAE7DCD5E3D7CFE0D0C9DCCBC2D9C6BCA48B7A4E2E1CFF00FFFF
                  00FFFF00FFFF00FFFF00FFB89F8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FCFBFAF8F6F3F4F0EDF2EBE7EEE6E1EAE1DAE7DCD5E3D7CFE0D0C9DCCBC2A48B
                  7A4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FFB89F8EFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFCFBFAF8F6F3F4F0EDF2EBE7EEE6E1EAE1DAE7DCD5
                  E3D7CFE0D0C9A48B7A4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FF801C00FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAF8F6F3F4F0EDF2
                  EBE7EEE6E1EAE1DAE7DCD5E3D7CFA48B7A4E2E1CFF00FFFF00FFFF00FFFF00FF
                  FF00FF801C00801C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFEFEFCFBF8F7F7F3F0F3EEEAEFE9E3EDE3DEE9DED8E5D9D34E2E1CFF00FFFF
                  00FFCB4C1E801C00801C00801C00B05323801C00B89F8EB89F8EB89F8EB89F8E
                  B89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F
                  8EB89F8EFF00FFFF00FFCB4C1EFAB48AD58445CF7733CF7733B05323801C00FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCB4C1EFAB48AE1935CD58445CF77
                  33CF7733B05323801C00FF00FFFF00FF801C00801C00FF00FF801C00801C00FF
                  00FF801C00801C00FF00FF801C00801C00FF00FFFF00FFFF00FFCB4C1EFAB48A
                  FAB48AFAB48AFAB48AB05323801C00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFCB4C1ECB4C1ECB4C1ECB4C1EE1935C801C004E2E1C4E2E1C4E2E1C4E2E1C
                  4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E
                  1C4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FFCB4C1E801C00A48B7AA48B7AA4
                  8B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7A
                  A48B7AA48B7AA48B7A4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FF801C00EAE1
                  DAE7DDD7E6D9D4E5D7D0E2D3CBE0CFC7DDCBC4DCCAC1D9C6BDD7C4B8D4C0B5D1
                  BCB1D0BAADD0BAADD0BAADD0BAADA48B7A4E2E1CFF00FFFF00FFFF00FFFF00FF
                  FF00FFB89F8EEEE6E1EBE2DDE9DED9E7DCD5E5D8D1E3D4CEE1D0CADECEC5DCCA
                  C1D9C6BDD7C4B8D4C0B5D1BCB1D0BAADD0BAADD0BAADA48B7A4E2E1CFF00FFFF
                  00FFFF00FFFF00FFFF00FFB89F8EF0E9E6EEE6E1EBE2DDE9DED9E7DCD5E5D8D1
                  E3D4CEE1D0CADECEC5DCCAC1D9C6BDD7C4B8D4C0B5D1BCB1D0BAADD0BAADA48B
                  7A4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FFB89F8EF3EDEAF0E9E6EEE6E1EB
                  E2DDE9DED9E7DCD5E5D8D1E3D4CEE1D0CADECEC5DCCAC1D9C6BDD7C4B8D4C0B5
                  D1BCB1D0BAADA48B7A4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FFB89F8EF6F0
                  EEF3EDEAF0E9E6EEE6E1EBE2DDE9DED9E7DCD5E5D8D1E3D4CEE1D0CADECEC5DC
                  CAC1D9C6BDD7C4B8D4C0B5D1BCB1A48B7A4E2E1CFF00FFFF00FFFF00FFFF00FF
                  FF00FFB89F8EF8F3F3F6F0EEF3EDEAF0E9E6EEE6E1EBE2DDE9DED9E7DCD5E5D8
                  D1E3D4CEE1D0CADECEC5DCCAC1D9C6BDD7C4B8D4C0B5A48B7A4E2E1CFF00FFFF
                  00FFFF00FFFF00FFFF00FFB89F8EFBF7F7F8F3F3F6F0EEF3EDEAF0E9E6EEE6E1
                  EBE2DDE9DED9E7DCD5E5D8D1E3D4CEE1D0CADECEC5DCCAC1D9C6BDD7C4B8A48B
                  7A4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FFB89F8EFCFBFBFBF7F7F8F3F3F6
                  F0EEF3EDEAF0E9E6EEE6E1EBE2DDE9DED9E7DCD5E5D8D1E3D4CEE1D0CAE0CFC7
                  DDCBC4DAC9BFA48B7A4E2E1CFF00FFFF00FFFF00FFFF00FFFF00FFB89F8EFFFF
                  FFFCFBFBFBF7F7F8F3F3F7F2F0F4EEEDF2EBE7EFE7E3EDE3E0EAE1DAE7DDD7E6
                  D9D4E5D7D0E2D3CBE0CFC7DDCBC4A48B7A4E2E1CFF00FFFF00FF}
                OnClick = SpeedButton7Click
                ExplicitLeft = 292
              end
              inherited SpeedButton8: TSpeedButton
                Left = 234
                Hint = 'Efetuar o fechamento da Produ'#231#227'o - [PPR034]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000260C0000260C00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF004580004580004580004580004580004580004580
                  004580004580004580004580004580004580004580004580004580004580FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF0077B851C1E50077BA0077BA0077BA00
                  77BA0077BA0077BA0077BA0077BA0077BA0077BA0077BA0077BA0077BA0077BA
                  0077BA0077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF0077B858C6E753C2
                  E64EBFE34ABCE245B8E041B5DE3CB1DC38ADDA34AAD92FA6D72CA3D5289FD323
                  9CD12099D02099D02099D00077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF
                  0077B85DCAEABBA1904E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E
                  1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C0077BA004580FF00FFFF00FFFF
                  00FFFF00FFFF00FF0077B863CEEBBBA190EFE7E2A48B7AA48B7AA48B7AA48B7A
                  A48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7A4E2E1C0077BA0045
                  80FF00FFFF00FFFF00FFFF00FFFF00FF0077B867D1EEBBA190F2EBE9EFE7E2EB
                  E2DDE9DDD8E6DAD3E3D5CE8180B66869AFD8C6BBD5C1B6D1BCB0D0BAADA48B7A
                  4E2E1C0077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF0077B86CD5EFBBA1
                  90F6F0EED0BAADD0BAADD0BAADD0BAADE6DAD3232DA4010A979791B6D8C6BBD5
                  C1B6D1BCB0A48B7A4E2E1C0077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF
                  0077B872D9F2BBA190F8F6F3DC996EDC996EDC996EDC996E9392C4010A974047
                  AB1C27A0D8C9C1D8C6BBD5C1B6A48B7A4E2E1C0077BA004580FF00FFFF00FFFF
                  00FFFF00FFFF00FF0077B877DDF3BBA190FEFCFCFBF8F7F7F3F0F4EEEBF0EAE6
                  3F47B0303AAAE2D8D11D28A16D6EB2DCCBC1D8C6BBA48B7A4E2E1C0077BA0045
                  80FF00FFFF00FFFF00FFFF00FFFF00FF0077B87DE1F6BBA190FFFFFFFEFCFCFB
                  F8F7F7F3F0F4EEEBF0EAE6EEE5E0EAE0DAC4BCCE0D189DB0A7BFDCCBC1A48B7A
                  4E2E1C0077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF0077B87DE1F6BBA1
                  90FFFFFFFFFFFFFEFCFCFBF8F7F7F3F0F4EEEBF0EAE6EEE5E0EAE0DAA4A0C620
                  2BA3D4C7C7A48B7A4E2E1C0077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF
                  0077B87DE1F6BBA190FFFFFFFFFFFFFFFFFFFEFCFCFBF8F7F7F3F08E91CE7278
                  C2EEE5E0EAE0DAA4A0C63941AAA1897A4E2E1C0077BA004580FF00FFFF00FFFF
                  00FFFF00FFFF00FF0077B87DE1F6BBA190FFFFFFD0BAADD0BAADD0BAADD0BAAD
                  FBF8F72632AB010A97A5A6D1EEE5E0EAE0DAE7DCD5A48B7A4E2E1C0077BA0045
                  80FF00FFFF00FFFF00FFFF00FFFF00FF0077B87DE1F6BBA190FFFFFFDC996EDC
                  996EDC996EDC996EA0A6DD010A97454FB71F2BA7EDE6E5EEE5E0EAE0DAA48B7A
                  4E2E1C0077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF0077B87DE1F6BBA1
                  90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF434FBB3541B5F7F4F61F2CA9787EC6F0
                  EAE6EEE5E0A48B7A4E2E1C0077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF
                  0077B87DE1F6BBA190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFD5D5ED0F1BA0C1C1DEF2EBE9A48B7A4E2E1C0077BA004580FF00FFFF00FFFF
                  00FFFF00FFFF00FF0077B87DE1F6BBA190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFB2B6E2232FAAE7E3EAA48B7A4E2E1C0077BA0045
                  80FF00FFFF00FFFF00FFFF00FFFF00FF0077B87DE1F6BBA190FFFFFFFFFFFFA4
                  8B7AA48B7AA48B7AA48B7AA58C7BA68E7EA99080AA9181796D883E49B6A1897A
                  4E2E1C0077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF0077B87DE1F6BBA1
                  90FFFFFFA48B7A00457700457700457700457700457700457700457700457700
                  4577AB9383F8F6F34E2E1C0077BA004580FF00FFFF00FFFF00FFFF00FFFF00FF
                  0077B87DE1F6BBA190BBA1900045777DE1F635ABDA35ABDA35ABDA35ABDA35AB
                  DA35ABDA35ABDA0077BA002B53BBA190BBA1900077BA004580FF00FFFF00FFFF
                  00FFFF00FFFF00FF0077B87DE1F67DE1F67DE1F67DE1F60045777DE1F653C2E6
                  002B53002B53002B5353C2E60077BA002B5377DDF372D9F26CD5EF67D1EE0045
                  80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0077B80077B80077B80077B800
                  77B80045777DE1F67DE1F67DE1F67DE1F60077BA002B530077BA0077BA0077BA
                  0077BA0077BAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF004580004580004580004580004580FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton8Click
                ExplicitLeft = 234
              end
              inherited SpeedButton11: TSpeedButton
                Left = 349
                Hint = 'Importar Pedido de Compra'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000130B0000130B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BB
                  AD69473169473169473169473169473169473169473169473169473169473169
                  4731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFD1BBADF5F0EEB7A293B7A293B7A293B7A293B7A293B7A293B7A2
                  93B7A293B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFD1BBADCDF0FF0086C10086C10086C10086C1
                  0086C10086C10086C10086C1B7A293694731FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BBADFCFAFA3BC8FF00
                  D6FF00D6FF00D6FF00D6FF00D6FF00D6FF0086C1B7A293694731FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BB
                  ADFFFFFFCDF0FF3BC8FF00D6FF00D6FF00D6FF00D6FF0086C1E4D6CFB7A29369
                  4731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFD1BBADFFFFFFFFFFFF3BC8FF00D6FF00D6FF00D6FF00D6FF0093
                  D8E8DCD6B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFD1BBADFFFFFFFFFFFFCDF0FF3BC8FF00D6FF
                  00D6FF0086C1EEE6E2EBE1DCB7A293694731FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BBADFFFFFFFFFFFFFF
                  FFFF3BC8FF00D6FF00D6FF0093D8F2EBE8EEE6E2B7A293694731FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BB
                  ADFFFFFFFFFFFFFFFFFFCDF0FF3BC8FF0086C1FBF8F7F7F3F1F4EEEBF0E9E569
                  4731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFD1BBADFFFFFFFFFFFFFFFFFFFFFFFFCDF0FFFFFFFFFEFDFDD1BB
                  AD69473169473169473184000084000084000084000084000084000084000084
                  0000840000840000840000840000840000840000FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFD1BBADF3EBE6694731FF00FF840000FFFAF6FFF8F2FFF6EFFFF4
                  ECFFF3E9FFF1E6FFEFE3FFEDE0FFEBDDFFE9DAFFE9DAFFE9DA840000FFFFFFFF
                  FFFFFFFFFF983000983000FFFFFFD1BBAD694731FF00FFFF00FF840000FFFCF9
                  FFFAF6FFF8F2FFF6EFFFF4ECFFF3E9FFF1E6FFEFE3FFEDE0FFEBDDFFE9DAFFE9
                  DA840000D1BBADD1BBAD983000E4A582B45E2F983000D1BBADFF00FFFF00FFFF
                  00FF840000FFFEFCFFFCF9FFFAF6FFF8F2FFF6EFFFF4ECFFF3E9FFF1E6FFEFE3
                  FFEDE0FFEBDDFFE9DA840000FF00FF983000E4A582C17045BF6E42B45E2F9830
                  00FF00FFFF00FFFF00FF840000FFFFFFFFFEFC84000084000084000084000084
                  0000840000840000840000FFEDE0FFEBDD840000983000E4A582CA7E55C7794F
                  C37348BF6E42B45E2F983000FF00FFFF00FF840000FFFFFFFFFFFFFFFEFCFFFC
                  F9FFFAF6FFF8F2FFF6EFFFF4ECFFF3E9FFF1E6FFEFE3FFEDE098300098300098
                  3000983000CA7E55C7794F983000983000983000983000FF00FF840000FFFFFF
                  FFFFFFFFFFFFFFFFFEFFFDFBFFFBF7FFF9F4FFF6EFFFF4ECFFF3E9FFF1E6FFEF
                  E3840000FF00FFFF00FF983000CD835ACA7E55983000FF00FFFF00FFFF00FFFF
                  00FF840000FFFFFFFFFFFF840000840000840000840000840000840000840000
                  840000FFF4EBFFF2E8840000FF00FFFF00FF983000D0875FB45E2FB45E2FFF00
                  FFFF00FFFF00FFFF00FF840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
                  FDFBFFFBF7FFF9F4FFF7F1FFF5EDFFF4EB840000FF00FF983000D69069B45E2F
                  983000FF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFEFFFDFBFFFBF7FFF9F4FFF7F1FFF5ED840000983000DB
                  9873B45E2F983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFF
                  FFFFFF8400008400008400008400008400008400008400008400009830009830
                  00983000E1A17DB45E2F983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
                  FFFDFBFFFBF7B45E2FB45E2FB45E2FB45E2FFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFEFFFDFBFFFBF7840000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8400008400008400008400008400
                  00840000840000840000840000840000840000840000840000840000FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton11Click
                ExplicitLeft = 349
              end
              inherited SpeedButton12: TSpeedButton
                Left = 406
                Hint = 'Custo da Produ'#231#227'o - [PPR039]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000630F0000630F000000010000000100002C6930003283
                  3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
                  ED00A7C8E900B7D2ED00C7DCF100E7F0F900F7FFFF0000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060705050505050505050505050505050505050505
                  06060606070D0D0D0D0D0C0C0C0C0B0B0B0B0B0A0A0A0A0506060606070E0000
                  00000000000000000000000000000A0506060606070E000E0E080E0E080E0E0E
                  0E0E080E0E000A0506060606070E000404080404080404040404080404000B05
                  06060606090E000E0E080E0E080E0E0E0E0E080E0E000B0506060606090E0004
                  04080404080404040404080404000B0506060606090E000E0E080E0E080E0E0E
                  0E0E080E0E000C0506060606090E000404080404080404040404080404000C05
                  06060606090E000E0E080E0E080E0E0E0E0E080E0E000C0506060606090E0004
                  04080404080404040404080404000C0506060606090E000E0E080E0E080E0E0E
                  0E0E080E0E000C0506060606090E000000000000000000000000000000000D05
                  06060606090E0E0E0E0E0E0E0E0E0E0E0E0E0E0D0D0D0D0506060606090E0E0E
                  0E000000000000000000000E0D0D0D0506060606090E0E0E0E0E0E0E0E0E0E0E
                  0E0E0E0E0E0D0D0506060606090E0E00000000000000000000000000000D0D05
                  06060606090E0E04040404040403030303020202010E0D0506060606090E0E0E
                  0E0E0E0E0E0E0E0E0E0E0E0E0E0E0D0506060606090909090909090909090909
                  0909090907070707060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606}
                OnClick = SpeedButton12Click
                ExplicitLeft = 406
              end
              inherited SpeedButton23: TSpeedButton
                Left = 463
                ExplicitLeft = 463
              end
              inherited SpeedButton24: TSpeedButton
                Left = 520
                ExplicitLeft = 520
              end
              inherited SpeedButton25: TSpeedButton
                Left = 762
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 762
                ExplicitTop = 6
              end
              inherited SpeedButton26: TSpeedButton
                Left = 577
                ExplicitLeft = 577
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 424
              ExplicitHeight = 424
              inherited ScrollBox2: TScrollBox
                Height = 407
                ExplicitHeight = 407
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 819
          ExplicitHeight = 558
        end
        object tsEscolhaProdutos: TTabSheet
          Caption = 'tsEscolhaProdutos'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnEscolhaProdutos: TPanel
            Left = 0
            Top = 19
            Width = 821
            Height = 318
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox7: TGroupBox
              Left = 5
              Top = 4
              Width = 806
              Height = 257
              Caption = 'Produtos'
              TabOrder = 0
              object DBGrid2: TDBGrid
                Left = 2
                Top = 15
                Width = 802
                Height = 240
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid2KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'GRUPO_PROD'
                    Title.Caption = 'Grupo'
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
                    FieldName = 'NUM_FAB_PROD'
                    Title.Caption = 'Num Fab Prod'
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
                    FieldName = 'DESCR_PROD_RED'
                    Title.Caption = 'Descri'#231#227'o Reduzida'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_GRADE'
                    Title.Caption = 'Cod Grade'
                    Visible = True
                  end>
              end
            end
            object Panel4: TPanel
              Left = 5
              Top = 267
              Width = 806
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn7: TBitBtn
                Left = 323
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Assume'
                TabOrder = 0
                OnClick = BitBtn7Click
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
              object BitBtn8: TBitBtn
                Left = 404
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancelar'
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
            end
          end
        end
        object tsCadastroMateriasPrimasInsumos: TTabSheet
          Caption = 'tsCadastroMateriasPrimasInsumos'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnConsultaMateriasPrimasInsumos: TGroupBox
            Left = 3
            Top = 3
            Width = 814
            Height = 391
            Caption = 'Mat'#233'rias Primas / Insumos - [F2: Validar estoque]'
            TabOrder = 0
            object Panel7: TPanel
              Left = 2
              Top = 15
              Width = 810
              Height = 374
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 0
              object Panel6: TPanel
                Left = 6
                Top = 6
                Width = 798
                Height = 362
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object DBGrid4: TDBGrid
                  Left = 0
                  Top = 29
                  Width = 798
                  Height = 236
                  Align = alClient
                  DataSource = dtmProducao.dsItemInd
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBGrid4DrawColumnCell
                  OnKeyDown = DBGrid4KeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SEQ'
                      Title.Caption = 'N'#176' Acab'
                      Width = 44
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SEQN'
                      Width = 43
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NUM_FAB_PROD'
                      Width = 117
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_UTILIZADA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_UN'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_UTIL'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCR_PROD'
                      Width = 418
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TIPO_ITEM_DESC'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_RECEITA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_PERDA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_TEORICA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GRUPO_PROD'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_PROD'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TIPO_ITEM'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_FORMULA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_PERDA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_TEORICO'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NITEM'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NITEM_IND'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_GRADE'
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
                      Visible = True
                    end>
                end
                object Panel12: TPanel
                  Left = 0
                  Top = 293
                  Width = 798
                  Height = 28
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label24: TLabel
                    Left = 71
                    Top = 8
                    Width = 54
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Peso Total:'
                  end
                  object Label25: TLabel
                    Left = 344
                    Top = 8
                    Width = 58
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Peso Perda:'
                  end
                  object Label26: TLabel
                    Left = 619
                    Top = 8
                    Width = 66
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Peso Receita:'
                  end
                  object DBText5: TDBText
                    Left = 131
                    Top = 8
                    Width = 106
                    Height = 17
                    DataField = 'PESO_UTIL'
                    DataSource = dtmProducao.dsItemInd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText6: TDBText
                    Left = 408
                    Top = 8
                    Width = 145
                    Height = 17
                    DataField = 'PESO_PERDA'
                    DataSource = dtmProducao.dsItemInd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText7: TDBText
                    Left = 691
                    Top = 8
                    Width = 106
                    Height = 17
                    DataField = 'PESO_FORMULA'
                    DataSource = dtmProducao.dsItemInd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object Panel11: TPanel
                  Left = 0
                  Top = 0
                  Width = 798
                  Height = 29
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                  object DBText2: TDBText
                    Left = 189
                    Top = 4
                    Width = 32
                    Height = 17
                    Alignment = taRightJustify
                    DataField = 'SEQ'
                    DataSource = dtmProducao.dsItemAcab
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText3: TDBText
                    Left = 227
                    Top = 4
                    Width = 134
                    Height = 17
                    Alignment = taRightJustify
                    DataField = 'NUM_FAB_PROD'
                    DataSource = dtmProducao.dsItemAcab
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText4: TDBText
                    Left = 367
                    Top = 4
                    Width = 454
                    Height = 17
                    DataField = 'DESCR_PROD'
                    DataSource = dtmProducao.dsItemAcab
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object CheckBox2: TCheckBox
                    Left = 0
                    Top = 3
                    Width = 177
                    Height = 17
                    Caption = 'Apenas Produto Selecionado [F3]'
                    TabOrder = 0
                    OnClick = CheckBox2Click
                    OnKeyDown = DBGrid4KeyDown
                  end
                end
                object bit: TPanel
                  Left = 0
                  Top = 321
                  Width = 798
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 3
                  object BitBtn13: TBitBtn
                    Left = 16
                    Top = 6
                    Width = 193
                    Height = 25
                    Hint = 'Alterar Item - [PPR010]'
                    Caption = 'Adicionar Mat'#233'ria Prima / Insumo'
                    TabOrder = 0
                    OnClick = BitBtn13Click
                    OnKeyDown = DBGrid4KeyDown
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
                  object BitBtn14: TBitBtn
                    Left = 212
                    Top = 6
                    Width = 142
                    Height = 25
                    Hint = 'Alterar Quantidade - [PPR011]'
                    Caption = 'Alterar Quantidade'
                    TabOrder = 1
                    OnClick = BitBtn14Click
                    OnKeyDown = DBGrid4KeyDown
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
                  object BitBtn15: TBitBtn
                    Left = 486
                    Top = 6
                    Width = 121
                    Height = 25
                    Hint = 'Remover Item - [PPR009]'
                    Caption = 'Remover Item'
                    TabOrder = 3
                    OnClick = BitBtn15Click
                    OnKeyDown = DBGrid4KeyDown
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
                    Left = 704
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Voltar a tela anterior'
                    Caption = 'Voltar'
                    TabOrder = 4
                    OnClick = BitBtn18Click
                    OnKeyDown = DBGrid4KeyDown
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                      0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                      0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                      1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                      3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                      5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                      2828281F05002828282828282828282828282817050713282828282828282828
                      2828282817060715282828282828282828282828281507062328280004040404
                      040404232828000701282802090807070707061B28282706062328040B090711
                      2727272828282800071328060D070A07232828282828281C070128070E13020B
                      082028282828281C0701280F101D28020D0818282828280107132816191E2828
                      140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                      282827140808041B282828282828282828282828282828282828282828282828
                      2828282828282828282828282828282828282828282828282828}
                  end
                  object BitBtn21: TBitBtn
                    Left = 360
                    Top = 6
                    Width = 121
                    Height = 25
                    Hint = 'Informar Perda - [PPR013]'
                    Caption = 'Informar Perda'
                    TabOrder = 2
                    OnClick = BitBtn21Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000C30E0000C30E00000001000000010000009C000021A5
                      210042B5420052BD5200EFB56B00EFB57300F7B5730073C67300F7BD7B0084CE
                      7B00AD9C8400F7BD8400FFC6840084CE8400F7C68C00FFC68C008CD68C00BDAD
                      9400FFC69400FFCE9400ADAD9C00E7C69C00FFCE9C00B5B5A500EFCEA500F7CE
                      A500CED6A500F7D6A500FFD6A500BDBDAD00D6CEAD00FFD6AD00FFDEAD00FFD6
                      B500FFDEB500BDE7B500FFE7B500F7DEBD00FFDEBD00DEE7BD00FFE7BD00FFEF
                      BD00DEDEC600EFDEC600FFE7C600CEEFC600DEEFC600FFEFC600FFE7CE00FFEF
                      CE00FFF7CE00DEEFD600FFEFD600FFF7D600EFE7DE00EFEFDE00EFFFDE00FFFF
                      DE00FFF7E700FFFFE700EFFFEF00FFFFEF00FF00FF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003E3E3E3E3E3E
                      3E3E3E3E3E3E3E3E3E3E3E3E3E3E1D1414140A0A113E3E3E3E3E3E3E3E36312C
                      282C31352C0A3E3E3E3E3E3E363928201C023A3A3B390A3E3E3E3E3E15243522
                      1C020000012D390A3E3E3E3E0E0B1628320200033C022C113E3E3E3612121212
                      2202020133101A113E3E3E2B1C1C1C1C30093A070202271E3E3E3E2522222222
                      2803090D00022C1E3E3E3E282F2F2F2F2F2E01000002341E3E3E3E2839393939
                      393938232D023B2A3E3E3E1F39393939352F22243139392A3E3E3E301F1F1F18
                      05040508080E282A3E3E3E3E3E3E3E3E3E1F180B0B0E0E203E3E3E3E3E3E3E3E
                      3E3E3E3E1F1212193E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E}
                  end
                  object BitBtn34: TBitBtn
                    Left = 613
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Fotos'
                    Caption = 'Fotos'
                    TabOrder = 5
                    OnClick = BitBtn32Click
                    Glyph.Data = {
                      EA020000424DEA02000000000000EA0100002800000010000000100000000100
                      08000000000000010000120B0000120B00006D0000006D00000000000000FFFF
                      FF008E8CA900FF00FF00A6869C0072535F007E596300C0737C00B15A5B00D961
                      5D00D65F5C00E8880000FF9A0000FF9B0000F79A0800BD7B1000927F350086A1
                      7200759E79002FBF5A002A9653003CAA7E0041C99A0049C9B7004CC8B6003768
                      620039928B005AA5A30000FFFF0002FAFB000AB2BF0008A8B90019DCF70016CE
                      EF0002B8DE00158FA9002A9CB2004BA3B8001EA6CD0026C3EC00197C980042AA
                      C70005789E0016B5E400058AB8000090C800057AA8000C7BA90063CCF6000075
                      A800158FC3001E9ED50023A4DD00259CD2002AABE6002DAEE60034B0E90047A1
                      C8000081C000007DB90000669A00086EA3000A73A8000D81B90027A9EB002291
                      C600288CBD002982AE003EB3ED0040B5EF003588B100157BB1001D82B9001F84
                      BB002086BD00258AC200298DC6002F93CC00369ED6003CAEEA003BABE60043B4
                      F00047BCFA00317FA80049B8F4004DC0FF003F9CCE0054B9F1004EABDE0056B9
                      F00058B7E90046A9E30049B0EC0055C0FF005CBEF90072B9EC005B92BD00769C
                      BC004796E40050AAFF004096FA004296FF001F59BC002154B3002A6AF7008695
                      B7000E3CE0000235FF000023FB00030303030303030303030303030303030303
                      03030303030303030303030303030303030303033E4B4B3E0303030303030303
                      033D43413433322F2E3C0303030303033D0208064636231E1F2C2D3C0303033D
                      5F07090A05261D1C1C22282A3C03475A58610469602720212B120B0F19314D68
                      6A66565552514F40250E0C0D103B4B646B6C675E5D54453837291B1124310349
                      6365621A395C5044353F3C3A3C03034957301513145303420303030303030303
                      3E4C171618595B4E3E0303030303030303033E484D4D4A3E0303030303030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      0303030303030303030303030303}
                  end
                end
                object Panel17: TPanel
                  Left = 0
                  Top = 265
                  Width = 798
                  Height = 28
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 4
                  object Label37: TLabel
                    Left = 29
                    Top = 8
                    Width = 96
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Quantidade Pratica:'
                  end
                  object Label38: TLabel
                    Left = 296
                    Top = 8
                    Width = 106
                    Height = 13
                    Caption = 'Quantidade de Perda:'
                  end
                  object Label39: TLabel
                    Left = 571
                    Top = 8
                    Width = 114
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Quantidade da Receita:'
                  end
                  object DBText1: TDBText
                    Left = 131
                    Top = 8
                    Width = 106
                    Height = 17
                    DataField = 'QUANTIDADE_UTILIZADA'
                    DataSource = dtmProducao.dsItemInd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText12: TDBText
                    Left = 408
                    Top = 8
                    Width = 145
                    Height = 17
                    DataField = 'QUANTIDADE_PERDA'
                    DataSource = dtmProducao.dsItemInd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText13: TDBText
                    Left = 691
                    Top = 8
                    Width = 106
                    Height = 17
                    DataField = 'QUANTIDADE_RECEITA'
                    DataSource = dtmProducao.dsItemInd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
              end
            end
          end
          object pn_mp_insumo: TPanel
            Left = 1
            Top = 400
            Width = 185
            Height = 41
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
        object tsEstoque: TTabSheet
          Caption = 'tsEstoque'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnEstoque: TGroupBox
            Left = 3
            Top = 3
            Width = 814
            Height = 391
            Caption = 'Mat'#233'rias Primas / Insumos'
            TabOrder = 0
            OnEnter = pnEstoqueEnter
            object Panel18: TPanel
              Left = 2
              Top = 15
              Width = 810
              Height = 374
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 0
              object Panel19: TPanel
                Left = 6
                Top = 6
                Width = 798
                Height = 362
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object DBGrid5: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 798
                  Height = 321
                  Align = alClient
                  DataSource = dtmProducao.dsItemInd
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBGrid5DrawColumnCell
                  OnKeyDown = DBGrid5KeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SEQ'
                      Title.Caption = 'N'#176' Acab'
                      Width = 44
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SEQN'
                      Width = 43
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NUM_FAB_PROD'
                      Width = 117
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_UTILIZADA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_UN'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_UTIL'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCR_PROD'
                      Width = 418
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TIPO_ITEM_DESC'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_RECEITA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_PERDA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE_TEORICA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GRUPO_PROD'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_PROD'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TIPO_ITEM'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_FORMULA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_PERDA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PESO_TEORICO'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NITEM'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NITEM_IND'
                      Visible = True
                    end>
                end
                object Panel22: TPanel
                  Left = 0
                  Top = 321
                  Width = 798
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label41: TLabel
                    Left = 14
                    Top = 13
                    Width = 242
                    Height = 13
                    Caption = 'Itens em vermelho sem estoque suficiente'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object BitBtn25: TBitBtn
                    Left = 704
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Voltar a tela anterior'
                    Caption = 'Voltar'
                    TabOrder = 1
                    OnClick = BitBtn25Click
                    OnKeyDown = DBGrid5KeyDown
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                      0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                      0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                      1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                      3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                      5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                      2828281F05002828282828282828282828282817050713282828282828282828
                      2828282817060715282828282828282828282828281507062328280004040404
                      040404232828000701282802090807070707061B28282706062328040B090711
                      2727272828282800071328060D070A07232828282828281C070128070E13020B
                      082028282828281C0701280F101D28020D0818282828280107132816191E2828
                      140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                      282827140808041B282828282828282828282828282828282828282828282828
                      2828282828282828282828282828282828282828282828282828}
                  end
                  object BitBtn22: TBitBtn
                    Left = 353
                    Top = 6
                    Width = 89
                    Height = 25
                    Hint = 'Confirmar - [PPR037]'
                    Caption = 'Continuar'
                    TabOrder = 0
                    OnClick = BitBtn22Click
                    OnKeyDown = DBGrid5KeyDown
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
          end
        end
        object tsImportarPedido: TTabSheet
          Caption = 'tsImportarPedido'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnImportarPedido: TPanel
            Left = 3
            Top = 3
            Width = 798
            Height = 486
            BorderWidth = 6
            TabOrder = 0
            OnEnter = pnImportarPedidoEnter
            object pnArquivoEletronico: TGroupBox
              Left = 7
              Top = 49
              Width = 784
              Height = 51
              Align = alTop
              Caption = 'Arquivo Eletr'#244'nico'
              TabOrder = 0
              object Edit1: TEdit
                Left = 16
                Top = 20
                Width = 513
                Height = 21
                TabOrder = 0
              end
              object BitBtn23: TBitBtn
                Left = 535
                Top = 16
                Width = 75
                Height = 25
                Caption = 'Procurar'
                TabOrder = 1
                OnClick = BitBtn23Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                  73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                  8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                  9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                  A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                  AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                  BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                  D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                  E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                  F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                  424242424242424242422B39180B42424242424242424242424243443C180B42
                  4242424242424242424242444438180B42424242424242424242424244433918
                  0A424242424242424242424242444335004201101A114242424242424242453D
                  05072F343434291942424242424242221A2D34343437403E0442424242424206
                  231C303437404146284242424242421B210F30373A414140310D42424242421F
                  20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                  2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                  4227312D21252314424242424242424242420E141B1B42424242}
              end
              object BitBtn24: TBitBtn
                Left = 616
                Top = 16
                Width = 75
                Height = 25
                Caption = 'Avan'#231'ar'
                TabOrder = 2
                OnClick = BitBtn24Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000E30E0000E30E0000000100000001000010630000006B
                  0000086B00000073000008730000007B0000107B000000840000088400001084
                  0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
                  000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
                  000008630800087B0800107B080010840800008C0800088C0800009408001094
                  0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
                  1000187B10001084100018841000088C1000188C1000109410001894100010D6
                  100018D61000107B1800187B18001884180029841800108C1800188C1800218C
                  18001094180018941800189C1800219C180010C6180018C6180018D61800187B
                  210018842100189421002194210029A521001873290029AD290031DE290029E7
                  290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
                  420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
                  63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
                  7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
                  C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
                  DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
                  772F4F777777777777777777777777777712394F777777777777777777777777
                  770E3D354F7777777777777777777777770E0B082D4F77777777125C55523F25
                  131F0A4457294F777777225840161413100A1E073957344F7777215817151413
                  120E1E07054157344F77105D17161413120C1E0707054B57414F0F5E17161413
                  12201E0705034C57464F0E5817161413100C0C071B3657414F77205940161413
                  240D0A073757334F7777126256523F25120C0C4357294F777777777777777777
                  770E0A082D4F7777777777777777777777213B384F7777777777777777777777
                  770E3B4F77777777777777777777777777444F77777777777777}
              end
              object BitBtn26: TBitBtn
                Left = 697
                Top = 16
                Width = 75
                Height = 25
                Caption = 'Voltar'
                TabOrder = 3
                OnClick = BitBtn26Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                  0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                  0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                  1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                  3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                  5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                  2828281F05002828282828282828282828282817050713282828282828282828
                  2828282817060715282828282828282828282828281507062328280004040404
                  040404232828000701282802090807070707061B28282706062328040B090711
                  2727272828282800071328060D070A07232828282828281C070128070E13020B
                  082028282828281C0701280F101D28020D0818282828280107132816191E2828
                  140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                  282827140808041B282828282828282828282828282828282828282828282828
                  2828282828282828282828282828282828282828282828282828}
              end
            end
            object RadioGroup1: TRadioGroup
              Left = 7
              Top = 7
              Width = 784
              Height = 42
              Align = alTop
              Caption = 'Localizar Pedido de Compra'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Arquivo eletr'#244'nico'
                'Banco de Dados')
              TabOrder = 1
              OnClick = RadioGroup1Click
              OnExit = RadioGroup1Exit
            end
            object pnBancoDeDados: TGroupBox
              Left = 7
              Top = 100
              Width = 784
              Height = 379
              Align = alClient
              Caption = 'Banco de Dados'
              TabOrder = 2
              object Panel20: TPanel
                Left = 2
                Top = 15
                Width = 780
                Height = 63
                Align = alTop
                BevelOuter = bvNone
                BorderWidth = 4
                TabOrder = 0
                object GroupBox5: TGroupBox
                  Left = 4
                  Top = 4
                  Width = 772
                  Height = 55
                  Align = alClient
                  Caption = 'Filtro'
                  TabOrder = 0
                  object Label126: TLabel
                    Left = 154
                    Top = 23
                    Width = 53
                    Height = 13
                    Caption = 'Data Inicial'
                  end
                  object Label127: TLabel
                    Left = 307
                    Top = 23
                    Width = 48
                    Height = 13
                    Caption = 'Data Final'
                  end
                  object Label128: TLabel
                    Left = 10
                    Top = 23
                    Width = 47
                    Height = 13
                    Caption = 'N'#186' Pedido'
                  end
                  object SpeedButton14: TSpeedButton
                    Left = 439
                    Top = 20
                    Width = 22
                    Height = 21
                    Hint = 'Apagar Datas'
                    Flat = True
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                      8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                      0404040404040404040404040404040404040404040404040404040404040404
                      0404040404040404040404010000000000000104040404040404040002020202
                      0202000004040404040404000202020202020001000404040404040100020202
                      0202000101000404040404040003030303030300010100040404040404000303
                      0303030300010100040404040404000303030303030001010004040404040400
                      0303030303030001000404040404040400030303030303000004040404040404
                      0400030303030303000404040404040404040100000000010104040404040404
                      0404040404040404040404040404040404040404040404040404}
                    OnClick = SpeedButton14Click
                  end
                  object edDataIniPC: TMaskEdit
                    Left = 213
                    Top = 20
                    Width = 72
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 1
                    Text = '  /  /    '
                  end
                  object edDataFimPC: TMaskEdit
                    Left = 361
                    Top = 20
                    Width = 72
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 2
                    Text = '  /  /    '
                  end
                  object edNpedPC: TEditHw
                    Left = 63
                    Top = 20
                    Width = 74
                    Height = 21
                    TabOrder = 0
                    Text = '                    0'
                    Formato = fInteger
                    FormatSize = '0.2'
                  end
                  object BitBtn27: TBitBtn
                    Left = 529
                    Top = 16
                    Width = 75
                    Height = 25
                    Caption = 'Procurar'
                    TabOrder = 3
                    OnClick = BitBtn27Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                      73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                      8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                      9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                      A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                      AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                      BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                      D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                      E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                      F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                      424242424242424242422B39180B42424242424242424242424243443C180B42
                      4242424242424242424242444438180B42424242424242424242424244433918
                      0A424242424242424242424242444335004201101A114242424242424242453D
                      05072F343434291942424242424242221A2D34343437403E0442424242424206
                      231C303437404146284242424242421B210F30373A414140310D42424242421F
                      20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                      2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                      4227312D21252314424242424242424242420E141B1B42424242}
                  end
                  object BitBtn28: TBitBtn
                    Left = 610
                    Top = 16
                    Width = 75
                    Height = 25
                    Caption = 'Avan'#231'ar'
                    TabOrder = 4
                    OnClick = BitBtn28Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000E30E0000E30E0000000100000001000010630000006B
                      0000086B00000073000008730000007B0000107B000000840000088400001084
                      0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
                      000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
                      000008630800087B0800107B080010840800008C0800088C0800009408001094
                      0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
                      1000187B10001084100018841000088C1000188C1000109410001894100010D6
                      100018D61000107B1800187B18001884180029841800108C1800188C1800218C
                      18001094180018941800189C1800219C180010C6180018C6180018D61800187B
                      210018842100189421002194210029A521001873290029AD290031DE290029E7
                      290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
                      420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
                      63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
                      7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
                      C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
                      DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
                      772F4F777777777777777777777777777712394F777777777777777777777777
                      770E3D354F7777777777777777777777770E0B082D4F77777777125C55523F25
                      131F0A4457294F777777225840161413100A1E073957344F7777215817151413
                      120E1E07054157344F77105D17161413120C1E0707054B57414F0F5E17161413
                      12201E0705034C57464F0E5817161413100C0C071B3657414F77205940161413
                      240D0A073757334F7777126256523F25120C0C4357294F777777777777777777
                      770E0A082D4F7777777777777777777777213B384F7777777777777777777777
                      770E3B4F77777777777777777777777777444F77777777777777}
                  end
                  object BitBtn29: TBitBtn
                    Left = 691
                    Top = 16
                    Width = 75
                    Height = 25
                    Caption = 'Voltar'
                    TabOrder = 5
                    OnClick = BitBtn26Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                      0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                      0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                      1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                      3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                      5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                      2828281F05002828282828282828282828282817050713282828282828282828
                      2828282817060715282828282828282828282828281507062328280004040404
                      040404232828000701282802090807070707061B28282706062328040B090711
                      2727272828282800071328060D070A07232828282828281C070128070E13020B
                      082028282828281C0701280F101D28020D0818282828280107132816191E2828
                      140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                      282827140808041B282828282828282828282828282828282828282828282828
                      2828282828282828282828282828282828282828282828282828}
                  end
                end
              end
              object Panel21: TPanel
                Left = 2
                Top = 78
                Width = 780
                Height = 299
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 4
                TabOrder = 1
                object GroupBox6: TGroupBox
                  Left = 4
                  Top = 4
                  Width = 772
                  Height = 291
                  Align = alClient
                  Caption = 'Resultado'
                  TabOrder = 0
                  object Panel23: TPanel
                    Left = 2
                    Top = 15
                    Width = 768
                    Height = 233
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 4
                    TabOrder = 0
                    object DBGrid6: TDBGrid
                      Left = 4
                      Top = 4
                      Width = 760
                      Height = 225
                      Align = alClient
                      DataSource = dtmProducao.dsPC
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnCellClick = DBGrid6CellClick
                      OnDrawColumnCell = DBGrid6DrawColumnCell
                      OnDblClick = DBGrid6DblClick
                      OnKeyDown = DBGrid6KeyDown
                      OnMouseUp = DBGrid6MouseUp
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'SEL'
                          Title.Caption = '...'
                          Width = 20
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUM_PED'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NITEM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUM_FAB_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANT_IT_PROD'
                          Width = 81
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESCR_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VAL_UNT_IT'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VAL_TOT_IT'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CODIGO_F'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'RAZAO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CPFCGC'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_ENV_PED'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VAL_TOT_PED'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'GRUPO_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NOME_EMP'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CGC_EMP'
                          Visible = True
                        end>
                    end
                  end
                  object Panel24: TPanel
                    Left = 2
                    Top = 248
                    Width = 768
                    Height = 41
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label42: TLabel
                      Left = 8
                      Top = 6
                      Width = 126
                      Height = 13
                      Caption = 'Pedido de Outra Empresa:'
                    end
                    object Panel29: TPanel
                      Left = 140
                      Top = 6
                      Width = 60
                      Height = 13
                      BevelOuter = bvNone
                      Color = clSkyBlue
                      ParentBackground = False
                      TabOrder = 0
                    end
                  end
                end
              end
            end
          end
          object pnImportarPedido2: TPanel
            Left = 377
            Top = 183
            Width = 798
            Height = 486
            BorderWidth = 6
            TabOrder = 1
            object GroupBox8: TGroupBox
              Left = 7
              Top = 7
              Width = 784
              Height = 431
              Align = alClient
              Caption = 'Resumo de Itens importados'
              TabOrder = 0
              object Panel26: TPanel
                Left = 2
                Top = 15
                Width = 780
                Height = 373
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 4
                TabOrder = 0
                object DBGrid7: TDBGrid
                  Left = 4
                  Top = 4
                  Width = 772
                  Height = 324
                  Align = alClient
                  DataSource = dtmProducao.dsTemp
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBGrid7DrawColumnCell
                  OnKeyDown = DBGrid7KeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'NUM_FAB_FORNECEDOR'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NUM_FAB_PROD'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCR_PROD'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_EMPRESA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOME_EMP'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CGC_EMP'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GRUPO_PROD'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_PROD'
                      Visible = True
                    end>
                end
                object Panel27: TPanel
                  Left = 4
                  Top = 328
                  Width = 772
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label44: TLabel
                    Left = 266
                    Top = 11
                    Width = 56
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Quantidade'
                  end
                  object DBEdit25: TDBEdit
                    Left = 328
                    Top = 8
                    Width = 121
                    Height = 21
                    DataField = 'QUANTIDADE'
                    DataSource = dtmProducao.dsTemp
                    TabOrder = 0
                    OnExit = DBEdit25Exit
                  end
                end
              end
              object Panel28: TPanel
                Left = 2
                Top = 388
                Width = 780
                Height = 41
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 1
                object Label45: TLabel
                  Left = 4
                  Top = 5
                  Width = 209
                  Height = 13
                  Caption = 'Pressione "Enter" para alterar a quantidade'
                end
                object Label47: TLabel
                  Left = 513
                  Top = 5
                  Width = 252
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Pressione "F3" para alterar ou informar a Mercadoria'
                end
                object Label48: TLabel
                  Left = 462
                  Top = 24
                  Width = 303
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Pressione "F4" para buscar a Mercadoria pelo C'#243'digo no Pedido'
                end
              end
            end
            object Panel25: TPanel
              Left = 7
              Top = 438
              Width = 784
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn30: TBitBtn
                Left = 697
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Voltar'
                TabOrder = 0
                OnClick = BitBtn30Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                  0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                  0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                  1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                  3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                  5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                  2828281F05002828282828282828282828282817050713282828282828282828
                  2828282817060715282828282828282828282828281507062328280004040404
                  040404232828000701282802090807070707061B28282706062328040B090711
                  2727272828282800071328060D070A07232828282828281C070128070E13020B
                  082028282828281C0701280F101D28020D0818282828280107132816191E2828
                  140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                  282827140808041B282828282828282828282828282828282828282828282828
                  2828282828282828282828282828282828282828282828282828}
              end
              object BitBtn31: TBitBtn
                Left = 352
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Concluir'
                TabOrder = 1
                OnClick = BitBtn31Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                  B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                  DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                  4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                  E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                  6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                  4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
              end
            end
          end
        end
        object ts_modais: TTabSheet
          Caption = 'ts_modais'
          ImageIndex = 7
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 819
            Height = 558
            ActivePage = ts_qtde_final
            Align = alClient
            TabOrder = 0
            object ts_acab: TTabSheet
              Caption = 'ts_acab'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnCadastroResultadoFinal: TPanel
                Left = 0
                Top = 21
                Width = 781
                Height = 215
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                Visible = False
                OnExit = pnCadastroResultadoFinalExit
                object Label19: TLabel
                  Left = 544
                  Top = 35
                  Width = 72
                  Height = 13
                  Caption = 'C'#243'digo Interno'
                  FocusControl = DBEdit5
                end
                object Label20: TLabel
                  Left = 405
                  Top = 35
                  Width = 29
                  Height = 13
                  Caption = 'Grupo'
                  FocusControl = DBEdit6
                end
                object Label21: TLabel
                  Left = 78
                  Top = 35
                  Width = 74
                  Height = 13
                  Caption = 'C'#243'digo Produto'
                  FocusControl = DBEdit7
                end
                object Label22: TLabel
                  Left = 66
                  Top = 62
                  Width = 87
                  Height = 13
                  Caption = 'Descri'#231#227'o Produto'
                  FocusControl = DBEdit8
                end
                object Label23: TLabel
                  Left = 88
                  Top = 89
                  Width = 65
                  Height = 13
                  Caption = 'Quantidade'
                  FocusControl = DBEdit9
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label10: TLabel
                  Left = 577
                  Top = 62
                  Width = 39
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Unidade'
                  FocusControl = DBEdit19
                end
                object Label12: TLabel
                  Left = 386
                  Top = 89
                  Width = 48
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Peso UN:'
                  FocusControl = DBEdit22
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText8: TDBText
                  Left = 440
                  Top = 89
                  Width = 111
                  Height = 17
                  DataField = 'PESO_UN'
                  DataSource = dtmProducao.dsItemAcab
                end
                object Label13: TLabel
                  Left = 557
                  Top = 89
                  Width = 59
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Peso Total'
                  FocusControl = DBEdit22
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_grade_it: TLabel
                  Left = 119
                  Top = 116
                  Width = 34
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Grade'
                  FocusControl = DBEdit9
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Panel60: TPanel
                  Left = 6
                  Top = 168
                  Width = 769
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 6
                  object BitBtn16: TBitBtn
                    Left = 306
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Salvar o item - [PPR014]'
                    Caption = 'Salvar'
                    TabOrder = 0
                    OnClick = BitBtn16Click
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
                  object BitBtn17: TBitBtn
                    Left = 387
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                    Caption = 'Cancelar'
                    ModalResult = 2
                    TabOrder = 1
                    OnClick = BitBtn17Click
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
                  object BitBtn106: TBitBtn
                    Left = 13
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Fotos'
                    Caption = 'Fotos'
                    TabOrder = 2
                    OnClick = BitBtn106Click
                    Glyph.Data = {
                      EA020000424DEA02000000000000EA0100002800000010000000100000000100
                      08000000000000010000120B0000120B00006D0000006D00000000000000FFFF
                      FF008E8CA900FF00FF00A6869C0072535F007E596300C0737C00B15A5B00D961
                      5D00D65F5C00E8880000FF9A0000FF9B0000F79A0800BD7B1000927F350086A1
                      7200759E79002FBF5A002A9653003CAA7E0041C99A0049C9B7004CC8B6003768
                      620039928B005AA5A30000FFFF0002FAFB000AB2BF0008A8B90019DCF70016CE
                      EF0002B8DE00158FA9002A9CB2004BA3B8001EA6CD0026C3EC00197C980042AA
                      C70005789E0016B5E400058AB8000090C800057AA8000C7BA90063CCF6000075
                      A800158FC3001E9ED50023A4DD00259CD2002AABE6002DAEE60034B0E90047A1
                      C8000081C000007DB90000669A00086EA3000A73A8000D81B90027A9EB002291
                      C600288CBD002982AE003EB3ED0040B5EF003588B100157BB1001D82B9001F84
                      BB002086BD00258AC200298DC6002F93CC00369ED6003CAEEA003BABE60043B4
                      F00047BCFA00317FA80049B8F4004DC0FF003F9CCE0054B9F1004EABDE0056B9
                      F00058B7E90046A9E30049B0EC0055C0FF005CBEF90072B9EC005B92BD00769C
                      BC004796E40050AAFF004096FA004296FF001F59BC002154B3002A6AF7008695
                      B7000E3CE0000235FF000023FB00030303030303030303030303030303030303
                      03030303030303030303030303030303030303033E4B4B3E0303030303030303
                      033D43413433322F2E3C0303030303033D0208064636231E1F2C2D3C0303033D
                      5F07090A05261D1C1C22282A3C03475A58610469602720212B120B0F19314D68
                      6A66565552514F40250E0C0D103B4B646B6C675E5D54453837291B1124310349
                      6365621A395C5044353F3C3A3C03034957301513145303420303030303030303
                      3E4C171618595B4E3E0303030303030303033E484D4D4A3E0303030303030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      0303030303030303030303030303}
                  end
                end
                object DBEdit5: TDBEdit
                  Left = 622
                  Top = 32
                  Width = 82
                  Height = 21
                  DataField = 'COD_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  Enabled = False
                  TabOrder = 2
                end
                object DBEdit6: TDBEdit
                  Left = 440
                  Top = 32
                  Width = 92
                  Height = 21
                  DataField = 'GRUPO_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  Enabled = False
                  TabOrder = 1
                end
                object DBEdit7: TDBEdit
                  Left = 158
                  Top = 32
                  Width = 219
                  Height = 21
                  Hint = '[F3: Pesquisar]  - C'#243'digo de Barras ou N'#186' de fabrica'#231#227'o'
                  CharCase = ecUpperCase
                  DataField = 'NUM_FAB_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  TabOrder = 0
                  OnExit = DBEdit7Exit
                  OnKeyDown = DBEdit7KeyDown
                end
                object DBEdit8: TDBEdit
                  Left = 159
                  Top = 59
                  Width = 373
                  Height = 21
                  DataField = 'DESCR_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  Enabled = False
                  TabOrder = 3
                end
                object DBEdit9: TDBEdit
                  Left = 159
                  Top = 86
                  Width = 218
                  Height = 21
                  DataField = 'QUANTIDADE'
                  DataSource = dtmProducao.dsItemAcab
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = DBEdit9Exit
                  OnKeyDown = DBEdit9KeyDown
                end
                object DBEdit19: TDBEdit
                  Left = 622
                  Top = 59
                  Width = 82
                  Height = 21
                  DataField = 'UNIDADE'
                  DataSource = dtmProducao.dsItemAcab
                  Enabled = False
                  TabOrder = 7
                end
                object DBEdit22: TDBEdit
                  Left = 622
                  Top = 86
                  Width = 82
                  Height = 21
                  DataField = 'PESO_UTIL'
                  DataSource = dtmProducao.dsItemAcab
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  OnExit = DBEdit22Exit
                  OnKeyDown = DBEdit22KeyDown
                end
                object lk_grade_it: TDBLookupComboBox
                  Left = 159
                  Top = 113
                  Width = 373
                  Height = 21
                  DataField = 'COD_GRADE'
                  DataSource = dtmProducao.dsItemAcab
                  TabOrder = 8
                end
              end
            end
            object ts_mp: TTabSheet
              Caption = 'ts_mp'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pn_it_mp: TPanel
                Left = 19
                Top = 24
                Width = 766
                Height = 241
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pn_it_mpEnter
                object Label27: TLabel
                  Left = 560
                  Top = 35
                  Width = 72
                  Height = 13
                  Caption = 'C'#243'digo Interno'
                  FocusControl = DBEdit10
                end
                object Label28: TLabel
                  Left = 421
                  Top = 35
                  Width = 29
                  Height = 13
                  Caption = 'Grupo'
                  FocusControl = DBEdit11
                end
                object Label29: TLabel
                  Left = 94
                  Top = 35
                  Width = 74
                  Height = 13
                  Caption = 'C'#243'digo Produto'
                  FocusControl = DBEdit12
                end
                object Label30: TLabel
                  Left = 82
                  Top = 62
                  Width = 87
                  Height = 13
                  Caption = 'Descri'#231#227'o Produto'
                  FocusControl = DBEdit13
                end
                object Label31: TLabel
                  Left = 61
                  Top = 89
                  Width = 108
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Quantidade Pratica'
                  FocusControl = DBEdit14
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label32: TLabel
                  Left = 51
                  Top = 143
                  Width = 118
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Quantidade de Perda'
                  FocusControl = DBEdit15
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Visible = False
                end
                object Label33: TLabel
                  Left = 52
                  Top = 175
                  Width = 341
                  Height = 13
                  Caption = 
                    'A quantidade de perda deve ser informada separadamente da utiliz' +
                    'ada'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object Label11: TLabel
                  Left = 593
                  Top = 62
                  Width = 39
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Unidade'
                  FocusControl = DBEdit20
                end
                object Label14: TLabel
                  Left = 402
                  Top = 89
                  Width = 48
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Peso UN:'
                  FocusControl = DBEdit14
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText9: TDBText
                  Left = 456
                  Top = 89
                  Width = 92
                  Height = 17
                  DataField = 'PESO_UN'
                  DataSource = dtmProducao.dsItemInd
                end
                object Label34: TLabel
                  Left = 573
                  Top = 89
                  Width = 59
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Peso Total'
                  FocusControl = DBEdit14
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label17: TLabel
                  Left = 569
                  Top = 143
                  Width = 63
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Peso Perda'
                  FocusControl = DBEdit24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Visible = False
                end
                object lb_grade_mp: TLabel
                  Left = 134
                  Top = 116
                  Width = 34
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Grade'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText15: TDBText
                  Left = 117
                  Top = 4
                  Width = 32
                  Height = 17
                  Alignment = taRightJustify
                  DataField = 'SEQ'
                  DataSource = dtmProducao.dsItemAcab
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText16: TDBText
                  Left = 293
                  Top = 4
                  Width = 454
                  Height = 17
                  DataField = 'DESCR_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText17: TDBText
                  Left = 153
                  Top = 4
                  Width = 134
                  Height = 17
                  Alignment = taRightJustify
                  DataField = 'NUM_FAB_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Panel14: TPanel
                  Left = 0
                  Top = 200
                  Width = 766
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 8
                  object BitBtn19: TBitBtn
                    Left = 318
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Salvar Item - [PPR015]'
                    Caption = 'Salvar'
                    TabOrder = 0
                    OnClick = BitBtn19Click
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
                  object BitBtn20: TBitBtn
                    Left = 399
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                    Caption = 'Cancelar'
                    ModalResult = 2
                    TabOrder = 1
                    OnClick = BitBtn20Click
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
                  object BitBtn32: TBitBtn
                    Left = 13
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Fotos'
                    Caption = 'Fotos'
                    TabOrder = 2
                    OnClick = BitBtn32Click
                    Glyph.Data = {
                      EA020000424DEA02000000000000EA0100002800000010000000100000000100
                      08000000000000010000120B0000120B00006D0000006D00000000000000FFFF
                      FF008E8CA900FF00FF00A6869C0072535F007E596300C0737C00B15A5B00D961
                      5D00D65F5C00E8880000FF9A0000FF9B0000F79A0800BD7B1000927F350086A1
                      7200759E79002FBF5A002A9653003CAA7E0041C99A0049C9B7004CC8B6003768
                      620039928B005AA5A30000FFFF0002FAFB000AB2BF0008A8B90019DCF70016CE
                      EF0002B8DE00158FA9002A9CB2004BA3B8001EA6CD0026C3EC00197C980042AA
                      C70005789E0016B5E400058AB8000090C800057AA8000C7BA90063CCF6000075
                      A800158FC3001E9ED50023A4DD00259CD2002AABE6002DAEE60034B0E90047A1
                      C8000081C000007DB90000669A00086EA3000A73A8000D81B90027A9EB002291
                      C600288CBD002982AE003EB3ED0040B5EF003588B100157BB1001D82B9001F84
                      BB002086BD00258AC200298DC6002F93CC00369ED6003CAEEA003BABE60043B4
                      F00047BCFA00317FA80049B8F4004DC0FF003F9CCE0054B9F1004EABDE0056B9
                      F00058B7E90046A9E30049B0EC0055C0FF005CBEF90072B9EC005B92BD00769C
                      BC004796E40050AAFF004096FA004296FF001F59BC002154B3002A6AF7008695
                      B7000E3CE0000235FF000023FB00030303030303030303030303030303030303
                      03030303030303030303030303030303030303033E4B4B3E0303030303030303
                      033D43413433322F2E3C0303030303033D0208064636231E1F2C2D3C0303033D
                      5F07090A05261D1C1C22282A3C03475A58610469602720212B120B0F19314D68
                      6A66565552514F40250E0C0D103B4B646B6C675E5D54453837291B1124310349
                      6365621A395C5044353F3C3A3C03034957301513145303420303030303030303
                      3E4C171618595B4E3E0303030303030303033E484D4D4A3E0303030303030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      0303030303030303030303030303}
                  end
                end
                object DBEdit10: TDBEdit
                  Left = 638
                  Top = 32
                  Width = 82
                  Height = 21
                  DataField = 'COD_PROD'
                  DataSource = dtmProducao.dsItemInd
                  Enabled = False
                  TabOrder = 2
                end
                object DBEdit11: TDBEdit
                  Left = 456
                  Top = 32
                  Width = 92
                  Height = 21
                  DataField = 'GRUPO_PROD'
                  DataSource = dtmProducao.dsItemInd
                  Enabled = False
                  TabOrder = 1
                end
                object DBEdit12: TDBEdit
                  Left = 174
                  Top = 32
                  Width = 218
                  Height = 21
                  Hint = '[F3: Pesquisar]  - C'#243'digo de Barras ou N'#186' de fabrica'#231#227'o'
                  CharCase = ecUpperCase
                  DataField = 'NUM_FAB_PROD'
                  DataSource = dtmProducao.dsItemInd
                  TabOrder = 0
                  OnExit = DBEdit12Exit
                  OnKeyDown = DBEdit12KeyDown
                end
                object DBEdit13: TDBEdit
                  Left = 175
                  Top = 59
                  Width = 373
                  Height = 21
                  DataField = 'DESCR_PROD'
                  DataSource = dtmProducao.dsItemInd
                  Enabled = False
                  TabOrder = 3
                end
                object DBEdit14: TDBEdit
                  Left = 175
                  Top = 86
                  Width = 218
                  Height = 21
                  DataField = 'QUANTIDADE_UTILIZADA'
                  DataSource = dtmProducao.dsItemInd
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = DBEdit14Exit
                  OnKeyDown = DBEdit14KeyDown
                end
                object DBEdit15: TDBEdit
                  Left = 175
                  Top = 140
                  Width = 218
                  Height = 21
                  DataField = 'QUANTIDADE_PERDA'
                  DataSource = dtmProducao.dsItemInd
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                  Visible = False
                  OnExit = DBEdit15Exit
                end
                object DBEdit20: TDBEdit
                  Left = 638
                  Top = 59
                  Width = 82
                  Height = 21
                  DataField = 'UNIDADE'
                  DataSource = dtmProducao.dsItemInd
                  Enabled = False
                  TabOrder = 9
                end
                object DBEdit23: TDBEdit
                  Left = 638
                  Top = 86
                  Width = 82
                  Height = 21
                  DataField = 'PESO_UTIL'
                  DataSource = dtmProducao.dsItemInd
                  Enabled = False
                  TabOrder = 5
                  OnExit = DBEdit23Exit
                end
                object DBEdit24: TDBEdit
                  Left = 638
                  Top = 140
                  Width = 82
                  Height = 21
                  DataField = 'QUANTIDADE_PERDA'
                  DataSource = dtmProducao.dsItemInd
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 10
                  Visible = False
                  OnExit = DBEdit24Exit
                end
                object lk_grade_mp: TDBLookupComboBox
                  Left = 174
                  Top = 113
                  Width = 374
                  Height = 21
                  DataField = 'COD_GRADE'
                  DataSource = dtmProducao.dsItemInd
                  TabOrder = 6
                end
              end
            end
            object ts_variacao: TTabSheet
              Caption = 'ts_variacao'
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pn_variacao: TPanel
                Left = 3
                Top = 3
                Width = 790
                Height = 502
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                object pn_var_top: TPanel
                  Left = 6
                  Top = 6
                  Width = 778
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = '[32-00005] - PRODUTO DE TESTE DAPRODUCAO - PRETO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
                object pn_var_client: TPanel
                  Left = 6
                  Top = 47
                  Width = 778
                  Height = 408
                  Align = alClient
                  BevelOuter = bvNone
                  Padding.Top = 6
                  Padding.Bottom = 6
                  TabOrder = 1
                  object tv_var: TTreeView
                    Left = 0
                    Top = 6
                    Width = 778
                    Height = 396
                    Align = alClient
                    Indent = 19
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object pn_var_bottom: TPanel
                  Left = 6
                  Top = 455
                  Width = 778
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object bt_variacao_voltar: TBitBtn
                    Left = 688
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Voltar'
                    ModalResult = 2
                    TabOrder = 0
                    OnClick = bt_variacao_voltarClick
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                      0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                      0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                      1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                      3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                      5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                      2828281F05002828282828282828282828282817050713282828282828282828
                      2828282817060715282828282828282828282828281507062328280004040404
                      040404232828000701282802090807070707061B28282706062328040B090711
                      2727272828282800071328060D070A07232828282828281C070128070E13020B
                      082028282828281C0701280F101D28020D0818282828280107132816191E2828
                      140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                      282827140808041B282828282828282828282828282828282828282828282828
                      2828282828282828282828282828282828282828282828282828}
                  end
                  object bt_variacao_save: TBitBtn
                    Left = 350
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Salvar'
                    TabOrder = 1
                    OnClick = bt_variacao_saveClick
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
                  object bt_variacao_todos: TBitBtn
                    Left = 8
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = 'Todos'
                    TabOrder = 2
                    OnClick = bt_variacao_todosClick
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000330B0000330B00000001000000010000CE630000C868
                      0000DC720000FF810500FFC07D00FF00FF00FFD6AD0000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000050505050505
                      0505050505050505050505030005050505050505050505050505030303000503
                      0202000000000000000504060300050302020000000000000005050404050505
                      0505050505050505050505050505050505050505050505050505050300050505
                      0505050505050505050503030300050302020000000000000005040603000503
                      0202000000000000000505040405050505050505050505050505050505050505
                      0505050505050505050505030005050505050505050505050505030303000503
                      0202010100000000000504060300050302020101000000000005050404050505
                      0505050505050505050505050505050505050505050505050505}
                  end
                end
              end
            end
            object ts_qtde_final: TTabSheet
              Caption = 'ts_qtde_final'
              ImageIndex = 3
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnQtdeFinalAcabado: TPanel
                Left = 0
                Top = 0
                Width = 673
                Height = 140
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                Visible = False
                OnExit = pnCadastroResultadoFinalExit
                object Label46: TLabel
                  Left = 496
                  Top = 11
                  Width = 72
                  Height = 13
                  Caption = 'C'#243'digo Interno'
                  FocusControl = DBEdit26
                end
                object Label49: TLabel
                  Left = 357
                  Top = 11
                  Width = 29
                  Height = 13
                  Caption = 'Grupo'
                  FocusControl = DBEdit27
                end
                object Label50: TLabel
                  Left = 30
                  Top = 11
                  Width = 74
                  Height = 13
                  Caption = 'C'#243'digo Produto'
                  FocusControl = DBEdit28
                end
                object Label51: TLabel
                  Left = 18
                  Top = 38
                  Width = 87
                  Height = 13
                  Caption = 'Descri'#231#227'o Produto'
                  FocusControl = DBEdit29
                end
                object Label52: TLabel
                  Left = 40
                  Top = 65
                  Width = 65
                  Height = 13
                  Caption = 'Quantidade'
                  FocusControl = DBEdit30
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clPurple
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label53: TLabel
                  Left = 529
                  Top = 38
                  Width = 39
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Unidade'
                  FocusControl = DBEdit31
                end
                object Label54: TLabel
                  Left = 338
                  Top = 65
                  Width = 48
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Peso UN:'
                  FocusControl = DBEdit32
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clPurple
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBText18: TDBText
                  Left = 392
                  Top = 65
                  Width = 111
                  Height = 17
                  DataField = 'PESO_UN'
                  DataSource = dtmProducao.dsItemAcab
                end
                object Label55: TLabel
                  Left = 509
                  Top = 65
                  Width = 59
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Peso Total'
                  FocusControl = DBEdit32
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clPurple
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Panel30: TPanel
                  Left = 6
                  Top = 93
                  Width = 661
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 6
                  object BitBtn36: TBitBtn
                    Left = 251
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Salvar o item - [PPR014]'
                    Caption = 'Salvar'
                    TabOrder = 0
                    OnClick = BitBtn36Click
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
                  object BitBtn37: TBitBtn
                    Left = 332
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                    Caption = 'Cancelar'
                    ModalResult = 2
                    TabOrder = 1
                    OnClick = BitBtn17Click
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
                object DBEdit26: TDBEdit
                  Left = 574
                  Top = 8
                  Width = 82
                  Height = 21
                  DataField = 'COD_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  Enabled = False
                  TabOrder = 2
                end
                object DBEdit27: TDBEdit
                  Left = 392
                  Top = 8
                  Width = 92
                  Height = 21
                  DataField = 'GRUPO_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  Enabled = False
                  TabOrder = 1
                end
                object DBEdit28: TDBEdit
                  Left = 110
                  Top = 8
                  Width = 219
                  Height = 21
                  Hint = '[F3: Pesquisar]  - C'#243'digo de Barras ou N'#186' de fabrica'#231#227'o'
                  CharCase = ecUpperCase
                  DataField = 'NUM_FAB_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  Enabled = False
                  TabOrder = 0
                  OnExit = DBEdit7Exit
                  OnKeyDown = DBEdit7KeyDown
                end
                object DBEdit29: TDBEdit
                  Left = 111
                  Top = 35
                  Width = 373
                  Height = 21
                  DataField = 'DESCR_PROD'
                  DataSource = dtmProducao.dsItemAcab
                  Enabled = False
                  TabOrder = 3
                end
                object DBEdit30: TDBEdit
                  Left = 111
                  Top = 62
                  Width = 218
                  Height = 21
                  DataField = 'QUANTIDADE'
                  DataSource = dtmProducao.dsItemAcab
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = DBEdit9Exit
                end
                object DBEdit31: TDBEdit
                  Left = 574
                  Top = 35
                  Width = 82
                  Height = 21
                  DataField = 'UNIDADE'
                  DataSource = dtmProducao.dsItemAcab
                  Enabled = False
                  TabOrder = 7
                end
                object DBEdit32: TDBEdit
                  Left = 574
                  Top = 62
                  Width = 82
                  Height = 21
                  DataField = 'PESO_UTIL'
                  DataSource = dtmProducao.dsItemAcab
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  OnExit = DBEdit22Exit
                  OnKeyDown = DBEdit22KeyDown
                end
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 834
      Width = 30
      Height = 591
      ExplicitLeft = 834
      ExplicitWidth = 30
      ExplicitHeight = 591
      inherited bMarketingHW: TBitBtn
        Top = 569
        Width = 28
        ExplicitTop = 569
        ExplicitWidth = 28
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 593
    Width = 834
    ExplicitTop = 593
    ExplicitWidth = 834
  end
  inherited pnStatusProcessamento: TPanel
    Left = 0
    Top = 3000
    ExplicitLeft = 0
    ExplicitTop = 3000
  end
  inherited PopupMenu1: TPopupMenu
    Left = 660
    Top = 9
  end
  inherited PopupMenu2: TPopupMenu
    Left = 766
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 734
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 702
    Top = 11
  end
  object PopupMenu3: TPopupMenu
    Left = 799
    Top = 11
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivo de Texto (*.txt)|*.txt|Todos os arquivos (*.*)|*.*'
    Title = 'Importar arquivo de Pedido de Compra'
    Left = 798
    Top = 42
  end
end
