inherited frmMovimentacaoBem: TfrmMovimentacaoBem
  Caption = 'Movimenta'#231#227'o do Bem ou Componente'
  ClientWidth = 705
  ExplicitWidth = 713
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 705
    ExplicitWidth = 705
    inherited Splitter2: TSplitter
      ExplicitLeft = 705
    end
    inherited PanelLeft: TPanel
      Width = 700
      ExplicitWidth = 700
      inherited PageControl1: TPageControl
        Width = 698
        ExplicitWidth = 698
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 690
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 690
            ExplicitWidth = 690
            inherited PageControl3: TPageControl
              Width = 690
              ExplicitWidth = 690
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 682
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 682
                  ExplicitWidth = 682
                  inherited GroupBox1: TGroupBox
                    Width = 661
                    Height = 587
                    Caption = 'Movimenta'#231#227'o do Bem ou Componente'
                    ExplicitWidth = 661
                    ExplicitHeight = 587
                    object Label6: TLabel
                      Left = 110
                      Top = 35
                      Width = 101
                      Height = 13
                      Caption = 'Bem Ou Componente'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 255
                      Top = 89
                      Width = 196
                      Height = 13
                      Caption = 'Data da movimenta'#231#227'o ou do saldo inicial'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 104
                      Top = 62
                      Width = 107
                      Height = 13
                      Caption = 'Tipo de Movimenta'#231#227'o'
                    end
                    object Label10: TLabel
                      Left = 111
                      Top = 116
                      Width = 340
                      Height = 13
                      Caption = 
                        'Valor do ICMS da Opera'#231#227'o Pr'#243'pria na entrada do bem ou component' +
                        'e'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 74
                      Top = 143
                      Width = 377
                      Height = 13
                      Caption = 
                        'Valor do ICMS da Oper. por Sub. Tribut'#225'ria na entrada do bem ou ' +
                        'componente'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 17
                      Top = 170
                      Width = 434
                      Height = 13
                      Caption = 
                        'Valor do ICMS sobre Frete do Conhecimento de Transp na entrada d' +
                        'o bem ou componente'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 82
                      Top = 197
                      Width = 369
                      Height = 13
                      Caption = 
                        'Valor ICMS. Dif Aliq conforme Doc. Arrec, na entrada do bem ou c' +
                        'omponente'
                      FocusControl = DBEdit8
                    end
                    object Label14: TLabel
                      Left = 313
                      Top = 224
                      Width = 138
                      Height = 13
                      Caption = 'N'#250'mero da Parcelas de ICMS'
                      FocusControl = DBEdit9
                    end
                    object Label15: TLabel
                      Left = 215
                      Top = 251
                      Width = 236
                      Height = 13
                      Caption = 'Valor da parcela de ICMS pass'#237'vel de apropria'#231#227'o'
                      FocusControl = DBEdit10
                    end
                    object Label48: TLabel
                      Left = 221
                      Top = 278
                      Width = 230
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#250'mero do documento de arrecada'#231#227'o estadual'
                      FocusControl = DBEdit16
                    end
                    object DBEdit1: TDBEdit
                      Left = 217
                      Top = 32
                      Width = 54
                      Height = 21
                      DataField = 'COD_IND_BEM'
                      DataSource = dtmCIAP.dsMovCiap
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 457
                      Top = 86
                      Width = 134
                      Height = 21
                      DataField = 'DT_MOV'
                      DataSource = dtmCIAP.dsMovCiap
                      TabOrder = 3
                    end
                    object DBEdit5: TDBEdit
                      Left = 457
                      Top = 113
                      Width = 134
                      Height = 21
                      DataField = 'VL_IMOB_ICMS_OP'
                      DataSource = dtmCIAP.dsMovCiap
                      TabOrder = 4
                    end
                    object DBEdit6: TDBEdit
                      Left = 457
                      Top = 140
                      Width = 134
                      Height = 21
                      DataField = 'VL_IMOB_ICMS_ST'
                      DataSource = dtmCIAP.dsMovCiap
                      TabOrder = 5
                    end
                    object DBEdit7: TDBEdit
                      Left = 457
                      Top = 167
                      Width = 134
                      Height = 21
                      DataField = 'VL_IMOB_ICMS_FRT'
                      DataSource = dtmCIAP.dsMovCiap
                      TabOrder = 6
                    end
                    object DBEdit8: TDBEdit
                      Left = 457
                      Top = 194
                      Width = 134
                      Height = 21
                      DataField = 'VL_IMOB_ICMS_DIF'
                      DataSource = dtmCIAP.dsMovCiap
                      TabOrder = 7
                    end
                    object DBEdit9: TDBEdit
                      Left = 457
                      Top = 221
                      Width = 134
                      Height = 21
                      DataField = 'NUM_PARC'
                      DataSource = dtmCIAP.dsMovCiap
                      TabOrder = 8
                    end
                    object DBEdit10: TDBEdit
                      Left = 457
                      Top = 248
                      Width = 134
                      Height = 21
                      DataField = 'VL_PARC_PASS'
                      DataSource = dtmCIAP.dsMovCiap
                      TabOrder = 9
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 277
                      Top = 32
                      Width = 314
                      Height = 21
                      DataField = 'COD_IND_BEM'
                      DataSource = dtmCIAP.dsMovCiap
                      KeyField = 'COD_EQUIP'
                      ListField = 'NOM_EQUIP;COD_EQUIP'
                      ListSource = dtmCIAP.dsEquipamentos
                      TabOrder = 1
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 217
                      Top = 59
                      Width = 374
                      Height = 21
                      DataField = 'TIPO_MOV'
                      DataSource = dtmCIAP.dsMovCiap
                      ItemHeight = 0
                      Items.Strings = (
                        'SI = Saldo inicial de bens imobilizados;'
                        'IM = Imobiliza'#231#227'o de bem individual;'
                        'IA = Imobiliza'#231#227'o em Andamento - Componente;'
                        'CI = Conclus'#227'o de Imobiliza'#231#227'o em Andamento '#8211' Bem Resultante;'
                        'MC = Imobiliza'#231#227'o oriunda do Ativo Circulante;'
                        'BA = Baixa do bem - Fim do per'#237'odo de apropria'#231#227'o;'
                        'AT = Aliena'#231#227'o ou Transfer'#234'ncia;'
                        'PE = Perecimento, Extravio ou Deteriora'#231#227'o;'
                        'OT = Outras Sa'#237'das do Imobilizado')
                      TabOrder = 2
                      OnExit = DBComboBox1Exit
                    end
                    object GroupBox7: TGroupBox
                      Left = 17
                      Top = 302
                      Width = 632
                      Height = 275
                      Caption = 
                        'Dados da Nota Fiscal de Entrada ( Com o Cursor em um dos campos ' +
                        'abaixo aperte a tecla F3 para fazer uma pesquisa )'
                      TabOrder = 11
                      object Label35: TLabel
                        Left = 40
                        Top = 24
                        Width = 75
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Emissao Propria'
                        FocusControl = DBEdit20
                      end
                      object Label36: TLabel
                        Left = 79
                        Top = 51
                        Width = 115
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Destinat'#225'rio/Remetente'
                        FocusControl = DBEdit21
                      end
                      object Label37: TLabel
                        Left = 160
                        Top = 24
                        Width = 34
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Modelo'
                        FocusControl = DBEdit22
                      end
                      object Label38: TLabel
                        Left = 296
                        Top = 24
                        Width = 24
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'S'#233'rie'
                        FocusControl = DBEdit23
                      end
                      object Label39: TLabel
                        Left = 399
                        Top = 24
                        Width = 35
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Num Nf'
                        FocusControl = DBEdit24
                      end
                      object Label40: TLabel
                        Left = 137
                        Top = 78
                        Width = 57
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Chave NF-e'
                        FocusControl = DBEdit25
                      end
                      object Label41: TLabel
                        Left = 370
                        Top = 51
                        Width = 64
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data Emiss'#227'o'
                        FocusControl = DBEdit26
                      end
                      object Label42: TLabel
                        Left = 84
                        Top = 105
                        Width = 108
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Numero do Item na NF'
                        FocusControl = DBEdit27
                      end
                      object Label43: TLabel
                        Left = 291
                        Top = 105
                        Width = 29
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Grupo'
                        FocusControl = DBEdit28
                      end
                      object Label26: TLabel
                        Left = 401
                        Top = 105
                        Width = 33
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Codigo'
                        FocusControl = DBEdit28
                      end
                      object Label32: TLabel
                        Left = 155
                        Top = 132
                        Width = 39
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Unidade'
                        FocusControl = DBEdit4
                      end
                      object Label33: TLabel
                        Left = 91
                        Top = 159
                        Width = 343
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Valor do ICMS da Opera'#231#227'o pr'#243'pria, proporcional '#224' quantidade apl' +
                          'icada'
                        FocusControl = DBEdit11
                      end
                      object Label34: TLabel
                        Left = 298
                        Top = 132
                        Width = 136
                        Height = 13
                        Hint = 
                          'Quantidade, deste item da nota fiscal, que foi aplicada neste be' +
                          'm, expressa na mesma unidade constante no documento fiscal de en' +
                          'trada'
                        Alignment = taRightJustify
                        Caption = 'Quantidade aplicada no bem'
                        FocusControl = DBEdit4
                      end
                      object Label44: TLabel
                        Left = 178
                        Top = 186
                        Width = 256
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor do ICMS ST, proporcional '#224' quantidade aplicada'
                        FocusControl = DBEdit11
                      end
                      object Label45: TLabel
                        Left = 94
                        Top = 213
                        Width = 340
                        Height = 13
                        Hint = 
                          'Valor do ICMS sobre o Frete do Conhecimento de Transporte, propo' +
                          'rcional '#224' quantidade aplicada'
                        Alignment = taRightJustify
                        Caption = 
                          'Valor do ICMS sobre o Frete do CT, proporcional '#224' quantidade apl' +
                          'icada'
                        FocusControl = DBEdit11
                      end
                      object Label46: TLabel
                        Left = 83
                        Top = 240
                        Width = 351
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Valor do ICMS Diferencial de Al'#237'quota, proporcional '#224' quantidade' +
                          ' aplicada'
                        FocusControl = DBEdit11
                      end
                      object DBEdit20: TDBEdit
                        Left = 121
                        Top = 21
                        Width = 27
                        Height = 21
                        DataField = 'EMISSAO_PROPRIA'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 0
                        OnChange = DBEdit20Change
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit21: TDBEdit
                        Left = 200
                        Top = 48
                        Width = 54
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 4
                        OnKeyDown = DBEdit21KeyDown
                      end
                      object DBEdit22: TDBEdit
                        Left = 200
                        Top = 21
                        Width = 54
                        Height = 21
                        DataField = 'MODELO_NF'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 1
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit23: TDBEdit
                        Left = 326
                        Top = 21
                        Width = 56
                        Height = 21
                        DataField = 'SERIE'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 2
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit24: TDBEdit
                        Left = 440
                        Top = 21
                        Width = 134
                        Height = 21
                        DataField = 'NUM_NF'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 3
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit25: TDBEdit
                        Left = 200
                        Top = 75
                        Width = 374
                        Height = 21
                        DataField = 'CHV_NFE_CTE'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 6
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit26: TDBEdit
                        Left = 440
                        Top = 48
                        Width = 134
                        Height = 21
                        DataField = 'DATA_DOC'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 5
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit27: TDBEdit
                        Left = 200
                        Top = 102
                        Width = 54
                        Height = 21
                        DataField = 'NUM_ITEM'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 7
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit28: TDBEdit
                        Left = 326
                        Top = 102
                        Width = 56
                        Height = 21
                        Hint = 'F3: Pesquisar Produto  ou Informar o Grupo e Codigo'
                        DataField = 'GRUPO_PROD'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 8
                        OnKeyDown = DBEdit28KeyDown
                      end
                      object DBEdit3: TDBEdit
                        Left = 440
                        Top = 102
                        Width = 134
                        Height = 21
                        Hint = 'F3: Pesquisar Produto  ou Informar o Grupo e Codigo'
                        DataField = 'COD_PROD'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 9
                        OnKeyDown = DBEdit28KeyDown
                      end
                      object DBEdit4: TDBEdit
                        Left = 200
                        Top = 129
                        Width = 54
                        Height = 21
                        DataField = 'UNID'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 10
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit11: TDBEdit
                        Left = 440
                        Top = 129
                        Width = 134
                        Height = 21
                        Hint = 
                          'Quantidade, deste item da nota fiscal, que foi aplicada neste be' +
                          'm, expressa na mesma unidade constante no documento fiscal de en' +
                          'trada'
                        DataField = 'QTDE'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 11
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit12: TDBEdit
                        Left = 440
                        Top = 156
                        Width = 134
                        Height = 21
                        DataField = 'VL_ICMS_OP_APLICADO'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 12
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit13: TDBEdit
                        Left = 440
                        Top = 183
                        Width = 134
                        Height = 21
                        DataField = 'VL_ICMS_ST_APLICADO'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 13
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit14: TDBEdit
                        Left = 440
                        Top = 210
                        Width = 134
                        Height = 21
                        Hint = 
                          'Valor do ICMS sobre o Frete do Conhecimento de Transporte, propo' +
                          'rcional '#224' quantidade aplicada'
                        DataField = 'VL_ICMS_FRT_APLICADO'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 14
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object DBEdit15: TDBEdit
                        Left = 440
                        Top = 237
                        Width = 134
                        Height = 21
                        DataField = 'VL_ICMS_DIF_APLICADO'
                        DataSource = dtmCIAP.dsMovCiap
                        TabOrder = 15
                        OnKeyDown = DBEdit20KeyDown
                      end
                    end
                    object DBEdit16: TDBEdit
                      Left = 457
                      Top = 275
                      Width = 134
                      Height = 21
                      DataField = 'NUM_DA'
                      DataSource = dtmCIAP.dsMovCiap
                      TabOrder = 10
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 690
              ExplicitWidth = 690
              inherited BitBtn4: TBitBtn
                Left = 267
                Top = 10
                Hint = 'Salvar Registro - [SPED074]'
                ExplicitLeft = 267
                ExplicitTop = 10
              end
              inherited BitBtn5: TBitBtn
                Left = 348
                Top = 10
                Hint = 'Cancelar Registro'
                ExplicitLeft = 348
                ExplicitTop = 10
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 690
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 690
            ExplicitWidth = 690
            inherited imgInformation: TImage
              Left = 664
              ExplicitLeft = 668
            end
            inherited BitBtn1: TBitBtn
              Top = 11
              Hint = 'Clique para pesquisar - [SPED070]'
              ExplicitTop = 11
            end
            inherited BitBtn2: TBitBtn
              Left = 610
              Top = 11
              ExplicitLeft = 610
              ExplicitTop = 11
            end
            inherited BitBtn3: TBitBtn
              Top = 11
              Hint = 'Novo cadastro - [SPED071]'
              Caption = 'Novo'
              ExplicitTop = 11
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
            object BitBtn7: TBitBtn
              Left = 498
              Top = 42
              Width = 151
              Height = 25
              Caption = 'Movimentar Bem'
              Enabled = False
              TabOrder = 11
              Visible = False
              OnClick = BitBtn7Click
            end
          end
          inherited Panel1: TPanel
            Width = 690
            ExplicitWidth = 690
            inherited DBGrid1: TDBGrid
              Width = 397
              DataSource = dtmCIAP.dsMovCiap
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_IND_BEM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_MOV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_MOV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'VL_IMOB_ICMS_OP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_IMOB_ICMS_ST'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_IMOB_ICMS_FRT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_IMOB_ICMS_DIF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_PARC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_PARC_PASS'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 686
              ExplicitWidth = 686
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [SPED072]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SPED073]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton4: TSpeedButton
                Left = 691
                Top = -29
                Visible = False
                ExplicitLeft = 691
                ExplicitTop = -29
              end
              inherited SpeedButton5: TSpeedButton
                Left = 748
                Top = -29
                Visible = False
                ExplicitLeft = 748
                ExplicitTop = -29
              end
              inherited SpeedButton6: TSpeedButton
                Left = 178
                Top = 6
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B00000001000000010000E79C42008C5A
                  5A00EFAD5A00F7B55A009C6B6300A57B7300B5847300E7AD7300E7B57B00F7C6
                  7B00BD848400BD8C8400CE9C8400DEAD8400E7B58C00EFBD9400FFD6A500FFD6
                  AD00FFD6B500BDBDBD00F7DEBD00FFDEBD00F7DEC600FFDEC600FFE7C600DED6
                  CE00EFDECE00FFE7CE00D6D6D600EFDED600EFE7D600F7E7D600FFE7D600F7EF
                  D600FFEFD600EFE7DE00F7E7DE00F7EFDE00FFEFDE00EFE7E700F7E7E700EFEF
                  E700F7EFE700FFEFE700FFF7E700F7E7EF00F7EFEF00FFF7EF00FFF7F700FFFF
                  F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00323232323232
                  3232050505050505050505050505050501323232323232323232051A251F1F1F
                  1F1F1F1F1F1F211A01323232323232323232051A251E1E1E1E1A1A1A1A1A1E1A
                  01323232323232323232051D2A23231E1E1E1E1A1A1A1E1A0132323232323232
                  3232061D2A1611111111111111141E1A01323232323232323232061D2A1B1414
                  1414141414161E1A0132320505050505050506232F2524241F1F1F1F1E1E1F1A
                  043232051A251F1F1F1F0B232F141010101010101014241A043232051A251E1E
                  1E1E0B23302A2524241F1F1F1F1F241A043232051D2A23231E1E0C2731251F1F
                  1F1F1F1B161F251D053232061D2A161111110C2A331710101010101010162A1E
                  053232061D2A1B1414140D2E33302F2F2E2A2A2A2A2A2A1905323206232F2524
                  241F0D2E333333303030302F30271C130632320B232F141010100E2E33333331
                  3030302A060606060632320B23302A2524240E2E333333333331332306070200
                  0A32320C2731251F1F1F0F2F33333333333333270609020A3232320C2A331710
                  10100F2F333333333333332706080A323232320D2E33302F2F2E0F0D0D0D0D0D
                  0D0D0D0D060A32323232320D2E333333303030302F30271C1306323232323232
                  3232320E2E333333313030302A06060606063232323232323232320E2E333333
                  3333313323060702000A3232323232323232320F2F3333333333333327060902
                  0A323232323232323232320F2F333333333333332706080A3232323232323232
                  3232320F0D0D0D0D0D0D0D0D0D060A3232323232323232323232}
                OnClick = SpeedButton6Click
                ExplicitLeft = 178
                ExplicitTop = 6
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
                Left = 699
                Top = -27
                Visible = False
                ExplicitLeft = 699
                ExplicitTop = -27
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
          ExplicitWidth = 690
          ExplicitHeight = 510
        end
        object tsMovimentacao: TTabSheet
          Caption = 'tsMovimentacao'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMovimentacao: TPanel
            Left = 3
            Top = 3
            Width = 638
            Height = 358
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox4: TGroupBox
              Left = 12
              Top = 8
              Width = 610
              Height = 289
              Caption = 'Movimenta'#231#227'o do Bem ou Componente'
              TabOrder = 0
              object Label9: TLabel
                Left = 111
                Top = 22
                Width = 101
                Height = 13
                Caption = 'Bem Ou Componente'
              end
              object Label16: TLabel
                Left = 256
                Top = 76
                Width = 196
                Height = 13
                Caption = 'Data da movimenta'#231#227'o ou do saldo inicial'
              end
              object Label17: TLabel
                Left = 105
                Top = 49
                Width = 107
                Height = 13
                Caption = 'Tipo de Movimenta'#231#227'o'
              end
              object Label18: TLabel
                Left = 112
                Top = 103
                Width = 340
                Height = 13
                Caption = 
                  'Valor do ICMS da Opera'#231#227'o Pr'#243'pria na entrada do bem ou component' +
                  'e'
              end
              object Label19: TLabel
                Left = 75
                Top = 130
                Width = 377
                Height = 13
                Caption = 
                  'Valor do ICMS da Oper. por Sub. Tribut'#225'ria na entrada do bem ou ' +
                  'componente'
              end
              object Label20: TLabel
                Left = 18
                Top = 157
                Width = 434
                Height = 13
                Caption = 
                  'Valor do ICMS sobre Frete do Conhecimento de Transp na entrada d' +
                  'o bem ou componente'
              end
              object Label21: TLabel
                Left = 83
                Top = 184
                Width = 369
                Height = 13
                Caption = 
                  'Valor ICMS. Dif Aliq conforme Doc. Arrec, na entrada do bem ou c' +
                  'omponente'
              end
              object Label22: TLabel
                Left = 147
                Top = 211
                Width = 65
                Height = 13
                Caption = 'Parcela Inicial'
              end
              object Label23: TLabel
                Left = 190
                Top = 238
                Width = 262
                Height = 13
                Alignment = taRightJustify
                Caption = 'Valor de cada parcela de ICMS pass'#237'vel de apropria'#231#227'o'
              end
              object Label24: TLabel
                Left = 392
                Top = 211
                Width = 60
                Height = 13
                Caption = 'Parcela Final'
              end
              object Label25: TLabel
                Left = 28
                Top = 211
                Width = 55
                Height = 13
                Caption = 'N'#186' Parcelas'
              end
              object DBLookupComboBox2: TDBLookupComboBox
                Left = 278
                Top = 19
                Width = 314
                Height = 21
                KeyField = 'COD_EQUIP'
                ListField = 'NOM_EQUIP;COD_EQUIP'
                ListSource = dtmCIAP.dsEquipamentos
                TabOrder = 1
                OnExit = DBLookupComboBox2Exit
              end
              object ComboBox4: TComboBox
                Left = 218
                Top = 46
                Width = 374
                Height = 21
                Style = csDropDownList
                ItemHeight = 0
                TabOrder = 2
                Items.Strings = (
                  'IM = Imobiliza'#231#227'o de bem individual;'
                  'IA = Imobiliza'#231#227'o em Andamento - Componente;')
              end
              object EditHw1: TEditHw
                Left = 218
                Top = 19
                Width = 54
                Height = 21
                TabOrder = 0
                Text = '                                   0'
                OnExit = EditHw1Exit
                Formato = fInteger
                FormatSize = '0.2'
              end
              object EditHw2: TEditHw
                Left = 458
                Top = 100
                Width = 134
                Height = 21
                TabOrder = 4
                Text = '                                  0,00'
                OnExit = EditHw2Exit
                Formato = fNumber
                FormatSize = '0.2'
              end
              object EditHw3: TEditHw
                Left = 458
                Top = 127
                Width = 134
                Height = 21
                TabOrder = 5
                Text = '                                  0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object EditHw4: TEditHw
                Left = 458
                Top = 154
                Width = 134
                Height = 21
                TabOrder = 6
                Text = '                                  0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object EditHw5: TEditHw
                Left = 458
                Top = 181
                Width = 134
                Height = 21
                TabOrder = 7
                Text = '                                  0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object EditHw6: TEditHw
                Left = 218
                Top = 208
                Width = 134
                Height = 21
                TabOrder = 9
                Text = '                                        1'
                Formato = fInteger
                FormatSize = '0.2'
                AsValue = 1.000000000000000000
              end
              object EditHw7: TEditHw
                Left = 458
                Top = 235
                Width = 134
                Height = 21
                TabOrder = 11
                Text = '                                  0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object MaskEdit4: TMaskEdit
                Left = 458
                Top = 73
                Width = 134
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
              end
              object CheckBox2: TCheckBox
                Left = 16
                Top = 264
                Width = 436
                Height = 17
                Caption = 
                  'Lan'#231'ar Baixa do Bem ou Componente no final da Apropria'#231#227'o ( Ulti' +
                  'ma parcela ).'
                Checked = True
                State = cbChecked
                TabOrder = 12
              end
              object EditHw8: TEditHw
                Left = 458
                Top = 208
                Width = 134
                Height = 21
                TabOrder = 10
                Text = '                                      48'
                Formato = fInteger
                FormatSize = '0.2'
                AsValue = 48.000000000000000000
              end
              object EditHw9: TEditHw
                Left = 89
                Top = 208
                Width = 52
                Height = 21
                Enabled = False
                TabOrder = 8
                Text = '            0'
                Formato = fInteger
                FormatSize = '0.2'
              end
            end
            object Panel6: TPanel
              Left = 12
              Top = 303
              Width = 610
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn8: TBitBtn
                Left = 306
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancela'
                TabOrder = 0
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
              object BitBtn9: TBitBtn
                Left = 225
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Salvar'
                TabOrder = 1
                OnClick = BitBtn9Click
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
          end
        end
        object tsConsultaNf: TTabSheet
          Caption = 'tsConsultaNf'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnConsultaNF: TPanel
            Left = 3
            Top = 3
            Width = 686
            Height = 494
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox9: TGroupBox
              Left = 8
              Top = 0
              Width = 665
              Height = 49
              Caption = 'Pesquisa'
              TabOrder = 0
              object Label53: TLabel
                Left = 20
                Top = 20
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Per'#237'odo de:'
              end
              object Label54: TLabel
                Left = 160
                Top = 20
                Width = 16
                Height = 13
                Alignment = taRightJustify
                Caption = 'at'#233
              end
              object Label55: TLabel
                Left = 272
                Top = 20
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Num NF'
              end
              object Label56: TLabel
                Left = 394
                Top = 20
                Width = 70
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cliente/Fornec'
              end
              object MaskEdit5: TMaskEdit
                Left = 81
                Top = 17
                Width = 73
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
              object MaskEdit6: TMaskEdit
                Left = 182
                Top = 17
                Width = 73
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object EditHw10: TEditHw
                Left = 315
                Top = 17
                Width = 73
                Height = 21
                TabOrder = 2
                Text = '                                   0'
                Formato = fInteger
                FormatSize = '0.2'
              end
              object EditHw11: TEditHw
                Left = 470
                Top = 17
                Width = 73
                Height = 21
                TabOrder = 3
                Text = '                                   0'
                Formato = fInteger
                FormatSize = '0.2'
              end
              object BitBtn10: TBitBtn
                Left = 560
                Top = 14
                Width = 75
                Height = 25
                Caption = 'Pesquisar'
                TabOrder = 4
                OnClick = BitBtn10Click
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
            end
            object GroupBox10: TGroupBox
              Left = 8
              Top = 55
              Width = 665
              Height = 330
              Caption = 'Nota Fiscal'
              TabOrder = 1
              object GroupBox11: TGroupBox
                Left = 8
                Top = 151
                Width = 647
                Height = 170
                Caption = 'Itens da Nota'
                TabOrder = 0
                object DBGrid13: TDBGrid
                  Left = 2
                  Top = 15
                  Width = 643
                  Height = 153
                  Align = alClient
                  DataSource = dtmCIAP.dsINf
                  DragCursor = crDefault
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = DBGrid13KeyDown
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
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'REFERENCIA'
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
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PERMITIR_DESCONTO'
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
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NCM'
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
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_ICMSUB'
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
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_ICMANT_SUB'
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
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESC_NATOP'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'BASE_ICMSUB_ANT'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_ICMSUB_ANT'
                      Visible = True
                    end>
                end
              end
              object DBGrid3: TDBGrid
                Left = 8
                Top = 18
                Width = 645
                Height = 127
                DataSource = dtmCIAP.dsNf
                ParentShowHint = False
                PopupMenu = PopupMenu1
                ReadOnly = True
                ShowHint = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid3KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_NF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_EMPRESA'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'NATUREZA_NF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_NF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_NF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO_NOP'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESC_NATOP'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_CLIENTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_COND_PAG'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_VENDEDOR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_EMISSAO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_ENT_SAIDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_LANC'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_TOTAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_SERV'
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
                    FieldName = 'VALOR_DESC'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_DESC_P'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_DESC_S'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALIQ_IRRF'
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
                    FieldName = 'BASE_ICMSUB'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_ICMSUB'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_FRETE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_SEGURO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_OUT_DESP'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_DESP_PF'
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
                    FieldName = 'VALOR_ACRES_FIN'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO_TR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MODELO_NF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'STATUS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CRT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FRETE_BASE_IPI'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FRETE_F_NFE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FRETE_BASE_ICM'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FRETECONTA_TR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PLACA_TR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UF_PLACA_TR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QTDE_VOLUMES_TR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESPECIE_TR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MARCA_TR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMERO_TR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PESO_B'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PESO_L'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RESULTADO_ENVIO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_AUTORIZACAO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATAHORA_ENVIO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'HORA_ENVIO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SITUACAO_NFE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DIGEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PROTOCOLO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGOERRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAOERRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TEMPORESPOSTA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPONFE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DANFEIMPRESSO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CHAVE_NFE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SEL_NFE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'N_FORM_SEGURANCA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_NF_VNDANT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SUB_SERIEANT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'JUST_CANCELAMENTO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COM_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COM_SERV'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'INUTILNFANT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'EMISSAO_PROPRIA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_PED'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ANTEC_TRIB'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DEVOLUCAO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'BENEF_FISCAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CONF_ENT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TP_NF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MNF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_NFEM'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ATIVO'
                    Visible = True
                  end>
              end
            end
            object Panel7: TPanel
              Left = 8
              Top = 438
              Width = 665
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 3
              object BitBtn11: TBitBtn
                Left = 334
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancela'
                TabOrder = 0
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
                Left = 253
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Assumir'
                TabOrder = 1
                OnClick = BitBtn12Click
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
            object Panel4: TPanel
              Left = 8
              Top = 391
              Width = 665
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object Label47: TLabel
                Left = 166
                Top = 11
                Width = 98
                Height = 13
                Alignment = taRightJustify
                Caption = 'Quantidade aplicada'
              end
              object ed_qtde_aplic: TEditHw
                Left = 270
                Top = 8
                Width = 121
                Height = 21
                TabOrder = 0
                Text = '0,0000'
                Formato = fNumber
                FormatSize = '0.5'
              end
            end
          end
        end
        object tsRepli: TTabSheet
          Caption = 'tsRepli'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnReplic: TPanel
            Left = 16
            Top = 32
            Width = 401
            Height = 177
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object Panel5: TPanel
              Left = 6
              Top = 6
              Width = 385
              Height = 120
              Align = alClient
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 0
              object Label27: TLabel
                Left = 124
                Top = 15
                Width = 84
                Height = 13
                Caption = 'Valor da Parcela: '
              end
              object Label28: TLabel
                Left = 64
                Top = 34
                Width = 144
                Height = 13
                Caption = 'Parcela base para replica'#231#227'o: '
              end
              object Label29: TLabel
                Left = 214
                Top = 15
                Width = 42
                Height = 13
                Caption = 'R$ 0,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label30: TLabel
                Left = 214
                Top = 34
                Width = 7
                Height = 13
                Caption = '1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label31: TLabel
                Left = 46
                Top = 56
                Width = 162
                Height = 13
                Alignment = taRightJustify
                Caption = 'Replicar at'#233' a parcela de n'#250'mero:'
              end
              object SpinEdit1: TSpinEdit
                Left = 214
                Top = 53
                Width = 75
                Height = 22
                MaxValue = 128
                MinValue = 0
                TabOrder = 0
                Value = 0
              end
            end
            object Panel8: TPanel
              Left = 6
              Top = 126
              Width = 385
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 6
              Padding.Top = 6
              TabOrder = 1
              object BitBtn13: TBitBtn
                Left = 112
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Replicar'
                ModalResult = 1
                TabOrder = 0
                OnClick = BitBtn12Click
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
              object BitBtn14: TBitBtn
                Left = 193
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancela'
                ModalResult = 2
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
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 708
      Width = 1
      ExplicitLeft = 708
      ExplicitWidth = 1
      inherited bMarketingHW: TBitBtn
        Width = 1
        ExplicitWidth = 1
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 705
    ExplicitWidth = 705
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 612
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 670
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 638
    Top = 3
  end
end
