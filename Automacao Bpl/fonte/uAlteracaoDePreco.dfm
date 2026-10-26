inherited frmAlteracaoDePreco: TfrmAlteracaoDePreco
  BorderIcons = [biSystemMenu]
  Caption = 'Altera'#231#227'o de Pre'#231'os'
  ClientHeight = 419
  ClientWidth = 702
  ParentBiDiMode = False
  Position = poMainFormCenter
  Scaled = False
  OnClose = FormClose
  ExplicitWidth = 710
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 13
  object page: TPageControl
    Left = 0
    Top = 0
    Width = 702
    Height = 419
    ActivePage = tabApply2
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tabInicio: TTabSheet
      Caption = 'tabInicio'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnInicial: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 8
        TabOrder = 0
        object Panel5: TPanel
          Left = 8
          Top = 339
          Width = 678
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object BitBtn1: TBitBtn
            Left = 455
            Top = 6
            Width = 75
            Height = 25
            Hint = 'Avan'#231'ar - [PRO188]'
            Caption = 'Avan'#231'ar'
            TabOrder = 0
            OnClick = BitBtn1Click
          end
          object BitBtn2: TBitBtn
            Left = 536
            Top = 6
            Width = 75
            Height = 25
            Hint = 'Cancelar'
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = BitBtn2Click
          end
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 8
          Width = 678
          Height = 100
          Align = alTop
          Caption = 'Modalidade'
          TabOrder = 1
          object rbProdutoConsulta: TRadioButton
            Left = 40
            Top = 16
            Width = 433
            Height = 17
            Caption = 'Alterar pre'#231'o dos produtos consultados'
            TabOrder = 0
            OnClick = Memo1Click
          end
          object rbProdutoSelecionado: TRadioButton
            Left = 40
            Top = 35
            Width = 433
            Height = 17
            Caption = 'Alterar pre'#231'o dos produtos selecionados'
            TabOrder = 1
            OnClick = Memo1Click
          end
          object rbAlteracao: TRadioButton
            Left = 40
            Top = 55
            Width = 491
            Height = 17
            Caption = 
              'Alterar pre'#231'o por Item/Grupo/Sub-grupo/Localidade/Setor/Cidade/P' +
              'romo'#231#227'o/Porcentagem'
            TabOrder = 2
            OnClick = Memo1Click
          end
          object rbAjustePreco: TRadioButton
            Left = 40
            Top = 75
            Width = 433
            Height = 17
            Caption = 'Alterar Percentual de ajuste de pre'#231'os'
            TabOrder = 3
            OnClick = Memo1Click
          end
        end
        object Memo1: TMemo
          Left = 8
          Top = 108
          Width = 678
          Height = 87
          Align = alTop
          BorderStyle = bsNone
          Enabled = False
          ParentColor = True
          TabOrder = 2
          OnClick = Memo1Click
        end
        object Memo2: TMemo
          Left = 8
          Top = 195
          Width = 678
          Height = 78
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            'Processos n'#227'o permitidos para o usu'#225'rio:')
          ParentColor = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          OnClick = Memo1Click
        end
      end
    end
    object tabMeio: TTabSheet
      Caption = 'tabMeio'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnMeio: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 8
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 335
          Top = 8
          Width = 354
          Height = 92
          Caption = 'Pesquisa Adicional'
          TabOrder = 1
          OnClick = RadioGroup1Click
          OnExit = GroupBox1Exit
          object Label1: TLabel
            Left = 18
            Top = 42
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo do Produto:'
          end
          object Label2: TLabel
            Left = 14
            Top = 68
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo do Produto:'
          end
          object SpeedButton1: TSpeedButton
            Left = 240
            Top = 37
            Width = 23
            Height = 22
            Hint = 'Pesquisa'
            Flat = True
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
          end
          object SpeedButton2: TSpeedButton
            Left = 240
            Top = 65
            Width = 23
            Height = 22
            Hint = 'Pesquisa'
            Flat = True
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
          end
          object Label10: TLabel
            Left = 83
            Top = 18
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo:'
          end
          object Edit1: TEdit
            Left = 113
            Top = 40
            Width = 121
            Height = 21
            TabOrder = 1
            Text = 'Edit1'
            OnKeyDown = Edit1KeyDown
            OnKeyPress = Edit1KeyPress
          end
          object Edit2: TEdit
            Left = 113
            Top = 65
            Width = 121
            Height = 21
            TabOrder = 2
            Text = 'Edit2'
            OnKeyDown = Edit1KeyDown
            OnKeyPress = Edit2KeyPress
          end
          object DBLookupComboBox10: TDBLookupComboBox
            Left = 113
            Top = 13
            Width = 138
            Height = 21
            KeyField = 'COD_TPPRECO'
            ListField = 'DESCR_TIPO'
            ListSource = dtmProdutos.dsTipoPrecoT
            TabOrder = 0
            OnClick = RadioGroup1Click
            OnExit = RadioGroup1Click
          end
        end
        object RadioGroup1: TRadioGroup
          Left = 7
          Top = 7
          Width = 313
          Height = 129
          Caption = 'Modalidade'
          Items.Strings = (
            'Item ( Pre'#231'o )'
            'Item ( Percentual )'
            'Grupo ( Percentual )'
            'SubGrupo ( Percentual )'
            'Pre'#231'o Diferenciado ( Percentual )'
            'Promocao ( Percentual )'
            'Todos Produtos ( Percentual )')
          TabOrder = 0
          OnClick = RadioGroup1Click
        end
        object rbAumento: TRadioButton
          Left = 334
          Top = 101
          Width = 64
          Height = 17
          Hint = 'Aumentar pre'#231'os de venda em valor ou percentual'
          Caption = 'Aumento'
          Checked = True
          TabOrder = 6
          TabStop = True
          OnClick = rbAumentoClick
        end
        object rbReducao: TRadioButton
          Left = 446
          Top = 101
          Width = 69
          Height = 17
          Hint = 'Diminuir pre'#231'os de venda em valor ou percentual'
          Caption = 'Redu'#231#227'o'
          TabOrder = 7
          OnClick = rbReducaoClick
        end
        object Panel1: TPanel
          Left = 8
          Top = 339
          Width = 678
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 5
          object BitBtn3: TBitBtn
            Left = 455
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Iniciar'
            TabOrder = 0
            OnClick = BitBtn3Click
          end
          object BitBtn4: TBitBtn
            Left = 536
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Voltar'
            TabOrder = 1
            OnClick = BitBtn4Click
          end
        end
        object Panel6: TPanel
          Left = 7
          Top = 142
          Width = 682
          Height = 41
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Grupo/C'#243'digo: 6/00002 - OLEO MOBIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object ckbEfetuarAlteracaoPreco: TCheckBox
          Left = 335
          Top = 118
          Width = 279
          Height = 17
          Caption = 'Efetuar altera'#231#227'o de Pre'#231'o logo apos fazer os ajustes'
          TabOrder = 9
        end
        object Panel2: TPanel
          Left = 7
          Top = 187
          Width = 682
          Height = 64
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 3
          OnExit = Panel2Exit
          object ckbAvista: TCheckBox
            Left = 17
            Top = 10
            Width = 60
            Height = 17
            Caption = 'A Vista'
            TabOrder = 0
            OnClick = ckbAvistaClick
          end
          object ckb60Dias: TCheckBox
            Left = 252
            Top = 10
            Width = 82
            Height = 17
            Caption = '30 / 60 Dias'
            TabOrder = 1
            OnClick = Panel2Exit
          end
          object ckb30Dias: TCheckBox
            Left = 136
            Top = 10
            Width = 60
            Height = 17
            Caption = '30 Dias'
            TabOrder = 2
            OnClick = Panel2Exit
          end
          object ckb90Dias: TCheckBox
            Left = 382
            Top = 10
            Width = 100
            Height = 17
            Caption = '30 / 60 /90 Dias'
            TabOrder = 3
            OnClick = Panel2Exit
          end
          object ckbDiferenciado: TCheckBox
            Left = 136
            Top = 36
            Width = 112
            Height = 17
            Caption = 'Pre'#231'o Diferenciado'
            TabOrder = 5
            OnClick = ckbDiferenciadoClick
          end
          object ckbPromocao: TCheckBox
            Left = 252
            Top = 36
            Width = 112
            Height = 17
            Caption = 'Promo'#231#227'o'
            TabOrder = 6
            OnClick = ckbDiferenciadoClick
          end
          object ckbAtacado: TCheckBox
            Left = 17
            Top = 36
            Width = 112
            Height = 17
            Caption = 'Atacado'
            TabOrder = 4
            OnClick = Panel2Exit
          end
          object ckbDiferenciadoProporcional: TCheckBox
            Left = 382
            Top = 38
            Width = 227
            Height = 17
            Caption = 'Pre'#231'o diferenciado proporcional ao '#224' vista'
            TabOrder = 7
            OnClick = ckbDiferenciadoClick
          end
        end
        object GroupBox3: TGroupBox
          Left = 7
          Top = 250
          Width = 682
          Height = 78
          Caption = 'Valor  / Percentual'
          TabOrder = 4
          OnEnter = Panel2Exit
          object Label5: TLabel
            Left = 42
            Top = 27
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'A Vista:'
          end
          object Label6: TLabel
            Left = 177
            Top = 27
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = '30 dias:'
          end
          object Label7: TLabel
            Left = 313
            Top = 27
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = '60 dias:'
          end
          object Label8: TLabel
            Left = 449
            Top = 27
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = '90 dias:'
          end
          object Label4: TLabel
            Left = 257
            Top = 56
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pre'#231'o Diferenciado:'
          end
          object Label9: TLabel
            Left = 436
            Top = 56
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Promo'#231#227'o:'
          end
          object Label11: TLabel
            Left = 35
            Top = 56
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Atacado:'
          end
          object edAvista: TEditHw
            Left = 85
            Top = 24
            Width = 75
            Height = 21
            TabOrder = 0
            Text = '           0,0000'
            Formato = fFixed
            FormatSize = '0.4'
          end
          object ed30Dias: TEditHw
            Left = 221
            Top = 24
            Width = 75
            Height = 21
            TabOrder = 1
            Text = '           0,0000'
            Formato = fFixed
            FormatSize = '0.4'
          end
          object ed60Dias: TEditHw
            Left = 357
            Top = 24
            Width = 75
            Height = 21
            TabOrder = 2
            Text = '           0,0000'
            Formato = fFixed
            FormatSize = '0.4'
          end
          object ed90Dias: TEditHw
            Left = 493
            Top = 24
            Width = 75
            Height = 21
            TabOrder = 3
            Text = '           0,0000'
            Formato = fFixed
            FormatSize = '0.4'
          end
          object edDiferenciado: TEditHw
            Left = 357
            Top = 53
            Width = 75
            Height = 21
            TabOrder = 5
            Text = '           0,0000'
            Formato = fFixed
            FormatSize = '0.4'
          end
          object edPromocao: TEditHw
            Left = 493
            Top = 53
            Width = 75
            Height = 21
            TabOrder = 6
            Text = '           0,0000'
            Formato = fFixed
            FormatSize = '0.4'
          end
          object edAtacado: TEditHw
            Left = 85
            Top = 53
            Width = 75
            Height = 21
            TabOrder = 4
            Text = '           0,0000'
            Formato = fFixed
            FormatSize = '0.4'
          end
        end
        object rbValorFixo: TRadioButton
          Left = 544
          Top = 101
          Width = 145
          Height = 17
          Hint = 'Alterar pre'#231'os de venda para o valor informado'
          Caption = 'Alterar pre'#231'o em valor fixo'
          TabOrder = 8
          OnClick = rbValorFixoClick
        end
      end
    end
    object tabPrintOptions: TTabSheet
      Caption = 'tabPrintOptions'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnFinal: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel9: TPanel
          Left = 6
          Top = 341
          Width = 682
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object BitBtn5: TBitBtn
            Left = 455
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Concluir'
            TabOrder = 0
            OnClick = BitBtn5Click
          end
          object BitBtn6: TBitBtn
            Left = 536
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = BitBtn6Click
          end
        end
        object GroupBox45: TGroupBox
          Left = 6
          Top = 6
          Width = 682
          Height = 75
          Hint = 'Imprimir Etiqueta Comum'
          Align = alTop
          Caption = 'Imprimir Relat'#243'rio de altera'#231#245'es'
          TabOrder = 1
          Visible = False
          object BitBtn71: TBitBtn
            Left = 13
            Top = 24
            Width = 50
            Height = 40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtn71Click
            Glyph.Data = {
              76060000424D7606000000000000360400002800000018000000180000000100
              08000000000040020000F30E0000F30E00000001000000010000421821004221
              21004A2121004A29290031313100523131005A31310039393100313939003939
              390042D642004A4A4A007B4A5200844A52004A525200525252005A525200524A
              5A008C4A5A0052525A0063636300736363007B6363006B6B6300736B63007B6B
              63006B5A6B00845A6B007B636B0084636B006B6B6B00846B6B008C6B6B008C63
              7300846B73008C6B73009C6B7300737373007B737300847373007B947300A56B
              7B00A5737B00737B7B007B7B7B00847B7B009C7B7B00A57B7B00AD7B7B007B84
              7B00A5847B0084CE7B008CFF7B00847B84008C7B8400947B8400BD7B84007384
              840084848400A5848400AD848400B58484009C848C00848C8C008C8C8C00948C
              8C009C8C8C00BD8C8C00C68C8C0084948C00BD8C9400C68C9400849494008C94
              9400949494009C9494008C9C940094DE9400AD7B9C008C849C008C949C009494
              9C00AD949C008C9C9C00949C9C009C9C9C00A59C9C00B5A59C009CEF9C00A57B
              A500A5A5A500ADA5A500B5A5A500AD9CAD009CA5AD00BDA5AD00A5ADAD00ADAD
              AD00B5ADAD00ADB5B500B5B5B500B5B5BD00BDB5BD00B5BDBD00BDBDBD00BDD6
              BD00C6C6C600CEC6C600C6C6CE00C6CECE00CECECE00D6CECE00CED6CE00D6CE
              D600CED6D600D6D6D600DED6D600D6DEDE00DEDEDE00DEE7DE00E7D6E700DEE7
              E700E7E7E700EFE7E700E7EFE700E7EFEF00EFEFEF00F7EFEF00EFF7F700F7F7
              F700FF00FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00828282828282
              82828282828282828282828282828282828282828282828282825A5555555555
              55555A828282828282828282828282825564737A7D7E7E7E7C76686256828282
              82828282828282820B2B7E816D676A6470846A260B658282828282828282820F
              0B1E7E81736B6F6A73846C170B0F648282828282821E140B0B3A81807671746F
              768472310B0B0B1E828282821E0B0B0B0B3F7972543F40645E7E6D3A0B0B0B0B
              1782822C0B102D0F0B1E556163636464605A51170B13390E0B1E820F142D3A14
              140B0B0B0B0B0B0B0B0B0B0B14116411110B820F355448534C49544A54403145
              4C4954504F6434531A09820F55686661412D221F1F1D1B1C1920213759536464
              5D0B821461755B23243B2F434447464643442A3C29162869640B82256472360D
              383C2F2F30302E2E302F323C3D124E7861148240646E370C0D060B0B0B0B0B0B
              0B0B0B060D0C3E6C613A8268646E52000B03151616151516161618050902566E
              64618282646F5F010B578484848484848484845C0B025C6E648282826863644B
              2741848484848484848483411C42676368828282827D7A7E7B737A8383838484
              848075737A7F7B7C82828282828282828277768184846E646464647282828282
              8282828282828282826F7683847E64646B6A6E73828282828282828282828282
              826A6E818176646484847E6E828282828282828282828282826A6E81816E6476
              847A6E82828282828282828282828282826864737364647E7A6E828282828282
              8282828282828282826A61646464686E6E828282828282828282}
          end
        end
        object Panel7: TPanel
          Left = 4
          Top = 81
          Width = 611
          Height = 194
          BevelOuter = bvNone
          TabOrder = 2
          object Label3: TLabel
            Left = 17
            Top = 69
            Width = 47
            Height = 13
            Caption = 'Produto X'
          end
          object ProgressBar1: TProgressBar
            Left = 17
            Top = 88
            Width = 577
            Height = 33
            TabOrder = 0
          end
          object QRDBText14: TQRDBText
            Left = 622
            Top = 3
            Width = 53
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333300000
              1645.708333333330000000
              7.937500000000000000
              140.229166666667000000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = dtmProdutos.cdsAltPreco
            DataField = 'PREC_60_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Mask = 'R$.00'
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText15: TQRDBText
            Left = 680
            Top = 3
            Width = 53
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333300000
              1799.166666666670000000
              7.937500000000000000
              140.229166666667000000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = dtmProdutos.cdsAltPreco
            DataField = 'PREC_90_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Mask = 'R$.00'
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object BitBtn7: TBitBtn
            Left = 225
            Top = 136
            Width = 160
            Height = 41
            Caption = 'Parar processamento'
            TabOrder = 3
            Visible = False
            OnClick = BitBtn7Click
            Glyph.Data = {
              76060000424D7606000000000000360400002800000018000000180000000100
              08000000000040020000130B0000130B000000010000000100008C5A5A00FFBD
              5A00E7A56B00A57B7300AD7B7300B5847300AD847B00B5847B00B58C7B00BD8C
              7B00C6948400CE9C8400D69C8400CEA58400D6A58400DEAD8400E7AD8400E79C
              8C00D6A58C00DEAD8C00E7B58C00E79C9400E7B59400EFBD9400E7A59C00FFA5
              A500FFD6A500FFADAD00E7C6AD00FFD6AD00E7B5B500EFB5B500EFBDB500FFBD
              B500FFDEB500E7BDBD00F7BDBD00FFBDBD00FFDEBD00FFC6C600FFCEC600FFD6
              C600FFE7C600CEC6CE00FFCECE00DED6CE00FFD6CE00FFE7CE00DED6D600DEDE
              D600EFDED600FFE7D600FFEFD6009C9CDE009CA5DE00E7DEDE00E7E7DE00FFEF
              DE006373E7008C9CE700ADB5E700DEDEE700E7E7E700EFEFE700FFEFE700FFF7
              E7006373EF00637BEF009CA5EF009CADEF00BDC6EF00CECEEF00EFEFEF00F7EF
              EF00FFF7EF003152F700637BF7009CADF700F7F7F700FFFFF700FF00FF000031
              FF001042FF00637BFF009CB5FF00CED6FF00DEE7FF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00505050030303
              03030303030303030303030303030300505050505003232020202020201F1F1E
              1E1E1E1E1E1E16005050505050032D332F2F2A2A26262622221D1D1A1A1A2800
              5050505050032D34332F2F2A2A26262622221D1D1A1A28005050505050063039
              34332F2F2A2A26262622221D1D1A280050505050500630393934332F2F2A2A26
              262622221D1D280050505050500731393939343C322F2A2A2B262622221D2800
              5050505050073740393944514B322F36513A2626222228005050505050083841
              403D5151514B3B5151513526262228005050505050093E4A4140445151515151
              513A2A262626280050505050500A3E4A4A41404652515151432F2A2A26262800
              50505050500A3E4F4A4A4145515151514B322F2A2A26280050505050500A484F
              4F4A4D5151515151514B322F2A2A280050505050500B48574F565151514C4752
              51513B2F2F2F280050505050500B4857574F4D514C414047524334332F2F2700
              50505050500E485757574F554A4A41403D393934332F21005050505050124E57
              5757574F4F4A4A4140393933251B19005050505050134E57575757574F4F4A4A
              4140401C181511005050505050134E5757575757574F4F4A4A41410505050500
              5050505050134E575757575757574F4F4A4A4A0501020B505050505050145757
              575757575757574F4F4A4A05100B50505050505050145757574E4E4E4E4E4848
              483F3F050E5050505050505050140F0F0F0F0F0F0F0F0F0F0F0F0F0550505050
              5050505050505050505050505050505050505050505050505050}
          end
        end
      end
    end
    object tabQuickReport: TTabSheet
      Caption = 'tabQuickReport'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 905
        Height = 712
        Caption = 'Panel3'
        TabOrder = 0
        Visible = False
        object QuickRep1: TQuickRep
          Left = 13
          Top = 10
          Width = 816
          Height = 1056
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          DataSet = dtmProdutos.cdsAltPreco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Functions.Strings = (
            'PAGENUMBER'
            'COLUMNNUMBER'
            'REPORTTITLE')
          Functions.DATA = (
            '0'
            '0'
            #39#39)
          OnPreview = QuickRep1Preview
          Options = [FirstPageHeader, LastPageFooter]
          Page.Columns = 1
          Page.Orientation = poPortrait
          Page.PaperSize = Letter
          Page.Values = (
            100.000000000000000000
            2794.000000000000000000
            100.000000000000000000
            2159.000000000000000000
            100.000000000000000000
            100.000000000000000000
            0.000000000000000000)
          PrinterSettings.Copies = 1
          PrinterSettings.OutputBin = Auto
          PrinterSettings.Duplex = False
          PrinterSettings.FirstPage = 0
          PrinterSettings.LastPage = 0
          PrinterSettings.UseStandardprinter = False
          PrinterSettings.UseCustomBinCode = False
          PrinterSettings.CustomBinCode = 0
          PrinterSettings.ExtendedDuplex = 0
          PrinterSettings.UseCustomPaperCode = False
          PrinterSettings.CustomPaperCode = 0
          PrinterSettings.PrintMetaFile = False
          PrinterSettings.PrintQuality = 0
          PrinterSettings.Collate = 0
          PrinterSettings.ColorOption = 0
          PrintIfEmpty = True
          SnapToGrid = True
          Units = MM
          Zoom = 100
          PrevFormStyle = fsNormal
          PreviewInitialState = wsNormal
          PrevInitialZoom = qrZoomToFit
          PreviewDefaultSaveType = stQRP
          object QRBand1: TQRBand
            Left = 38
            Top = 38
            Width = 740
            Height = 135
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            Color = clWhite
            TransparentBand = False
            ForceNewColumn = False
            ForceNewPage = False
            Size.Values = (
              357.187500000000000000
              1957.916666666667000000)
            PreCaluculateBandHeight = False
            KeepOnOnePage = False
            BandType = rbPageHeader
            object QRLabel1: TQRLabel
              Left = 2
              Top = 36
              Width = 399
              Height = 24
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                63.500000000000000000
                5.291666666666670000
                95.250000000000000000
                1055.687500000000000000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'Relat'#243'rio Produtos/Pre'#231'os/Ajustes'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = [fsItalic]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 14
            end
            object QRLabel2: TQRLabel
              Left = 2
              Top = 61
              Width = 65
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                5.291666666666667000
                161.395833333333300000
                171.979166666666700000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Data/Hora:'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRSysData1: TQRSysData
              Left = 73
              Top = 61
              Width = 69
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                193.145833333333300000
                161.395833333333300000
                182.562500000000000000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              Color = clWhite
              Data = qrsDateTime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsItalic]
              ParentFont = False
              Transparent = False
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel3: TQRLabel
              Left = 636
              Top = 61
              Width = 47
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1682.750000000000000000
                161.395833333333300000
                124.354166666666700000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'P'#225'gina:'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRSysData2: TQRSysData
              Left = 689
              Top = 61
              Width = 46
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1822.979166666667000000
                161.395833333333300000
                121.708333333333300000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              Color = clWhite
              Data = qrsPageNumber
              Transparent = False
              ExportAs = exptText
              FontSize = 10
            end
            object QRShape1: TQRShape
              Left = 2
              Top = 79
              Width = 735
              Height = 3
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                7.937500000000000000
                5.291666666666667000
                209.020833333333300000
                1944.687500000000000000)
              Brush.Color = clBlack
              Shape = qrsRectangle
              VertAdjust = 0
            end
            object QRShape2: TQRShape
              Left = 2
              Top = 130
              Width = 735
              Height = 3
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                7.937500000000000000
                5.291666666666667000
                343.958333333333300000
                1944.687500000000000000)
              Brush.Color = clBlack
              Shape = qrsRectangle
              VertAdjust = 0
            end
            object QRLabel4: TQRLabel
              Left = 62
              Top = 87
              Width = 60
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                164.041666666666700000
                230.187500000000000000
                158.750000000000000000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Cod.Prod'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel6: TQRLabel
              Left = 128
              Top = 88
              Width = 51
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                338.666666666666700000
                232.833333333333400000
                134.937500000000000000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Produto'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel5: TQRLabel
              Left = 413
              Top = 87
              Width = 70
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1092.729166666667000000
                230.187500000000000000
                185.208333333333300000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Pre'#231'o Tab.'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel7: TQRLabel
              Left = 14
              Top = 87
              Width = 40
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                37.041666666666670000
                230.187500000000000000
                105.833333333333300000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Grupo'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel9: TQRLabel
              Left = 617
              Top = 87
              Width = 46
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1632.479166666667000000
                230.187500000000000000
                121.708333333333300000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = '90 Dias'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel13: TQRLabel
              Left = 502
              Top = 87
              Width = 46
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1328.208333333333000000
                230.187500000000000000
                121.708333333333300000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = '30 Dias'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel14: TQRLabel
              Left = 560
              Top = 87
              Width = 46
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1481.666666666667000000
                230.187500000000000000
                121.708333333333300000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = '60 Dias'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel10: TQRLabel
              Left = 2
              Top = 4
              Width = 727
              Height = 25
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                66.145833333333320000
                5.291666666666667000
                10.583333333333330000
                1923.520833333333000000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'NOME DA EMPRESA'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 16
            end
            object QRLabel11: TQRLabel
              Left = 44
              Top = 107
              Width = 29
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                116.416666666666700000
                283.104166666666700000
                76.729166666666680000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Tipo'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel12: TQRLabel
              Left = 142
              Top = 108
              Width = 95
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                375.708333333333400000
                285.750000000000000000
                251.354166666666700000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Descri'#231#227'o Tipo'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel16: TQRLabel
              Left = 400
              Top = 107
              Width = 91
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1058.333333333333000000
                283.104166666666700000
                240.770833333333300000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Pre'#231'o Dif (Liq)'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel17: TQRLabel
              Left = 504
              Top = 107
              Width = 53
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1333.500000000000000000
                283.104166666666700000
                140.229166666666700000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Desc (%)'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel18: TQRLabel
              Left = 572
              Top = 107
              Width = 50
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1513.416666666667000000
                283.104166666666700000
                132.291666666666700000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Max (%)'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRLabel19: TQRLabel
              Left = 680
              Top = 87
              Width = 53
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1799.166666666667000000
                230.187500000000000000
                140.229166666666700000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Atacado'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
          end
          object QRBand2: TQRBand
            Left = 38
            Top = 195
            Width = 740
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            BeforePrint = QRBand2BeforePrint
            Color = clWhite
            TransparentBand = False
            ForceNewColumn = False
            ForceNewPage = False
            Size.Values = (
              47.625000000000000000
              1957.916666666667000000)
            PreCaluculateBandHeight = False
            KeepOnOnePage = False
            BandType = rbDetail
            object QRDBText8: TQRDBText
              Left = 563
              Top = 21
              Width = 53
              Height = 16
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                42.333333333333330000
                1489.604166666667000000
                55.562500000000000000
                140.229166666666700000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'PERC_AD_30'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Mask = '0.0000'
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRDBText10: TQRDBText
              Left = 621
              Top = 21
              Width = 53
              Height = 16
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                42.333333333333330000
                1643.062500000000000000
                55.562500000000000000
                140.229166666666700000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'PERC_AD_60'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Mask = '0.0000'
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRDBText11: TQRDBText
              Left = 679
              Top = 21
              Width = 53
              Height = 16
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                42.333333333333330000
                1796.520833333333000000
                55.562500000000000000
                140.229166666666700000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'PERC_AD_90'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Mask = '0.0000'
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRLabel8: TQRLabel
              Left = 420
              Top = 21
              Width = 137
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                1111.250000000000000000
                55.562500000000000000
                362.479166666666700000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Percentual de Ajuste:'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 10
            end
            object QRShape4: TQRShape
              Left = 288
              Top = 20
              Width = 449
              Height = 18
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                47.625000000000000000
                762.000000000000000000
                52.916666666666670000
                1187.979166666667000000)
              Pen.Style = psClear
              Shape = qrsRectangle
              VertAdjust = 0
            end
            object QRExpr27: TQRExpr
              Left = 44
              Top = -1
              Width = 92
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                116.416666666666700000
                -2.645833333333333000
                243.416666666666700000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Color = clWhite
              OnPrint = QRExpr27Print
              ParentFont = False
              ResetAfterPrint = False
              Transparent = False
              WordWrap = True
              Mask = 'R$###,###,##0.00 '
              ExportAs = exptNumeric
              FontSize = 8
            end
            object QRExpr33: TQRExpr
              Left = 142
              Top = -1
              Width = 259
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                375.708333333333300000
                -2.645833333333333000
                685.270833333333200000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Color = clWhite
              OnPrint = QRExpr33Print
              ParentFont = False
              ResetAfterPrint = False
              Transparent = False
              WordWrap = True
              Mask = 'R$###,###,##0.00 '
              ExportAs = exptNumeric
              FontSize = 8
            end
            object QRExpr28: TQRExpr
              Left = 397
              Top = 0
              Width = 94
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                1050.395833333333000000
                0.000000000000000000
                248.708333333333300000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Color = clWhite
              OnPrint = QRExpr28Print
              ParentFont = False
              ResetAfterPrint = False
              Transparent = False
              WordWrap = True
              Mask = '0.00'
              ExportAs = exptNumeric
              FontSize = 8
            end
            object QRExpr32: TQRExpr
              Left = 501
              Top = -1
              Width = 55
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                1325.562500000000000000
                -2.645833333333333000
                145.520833333333300000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Color = clWhite
              OnPrint = QRExpr32Print
              ParentFont = False
              ResetAfterPrint = False
              Transparent = False
              WordWrap = True
              Mask = '0.00'
              ExportAs = exptNumeric
              FontSize = 8
            end
            object QRExpr13: TQRExpr
              Left = 564
              Top = 0
              Width = 50
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                1492.250000000000000000
                0.000000000000000000
                132.291666666666700000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Color = clWhite
              OnPrint = QRExpr13Print
              ParentFont = False
              ResetAfterPrint = False
              Transparent = False
              WordWrap = True
              Mask = '0.00'
              ExportAs = exptNumeric
              FontSize = 8
            end
          end
          object QRBand3: TQRBand
            Left = 38
            Top = 213
            Width = 740
            Height = 32
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            Color = clWhite
            TransparentBand = False
            ForceNewColumn = False
            ForceNewPage = False
            Size.Values = (
              84.666666666666680000
              1957.916666666667000000)
            PreCaluculateBandHeight = False
            KeepOnOnePage = False
            BandType = rbPageFooter
            object QRLabel15: TQRLabel
              Left = 5
              Top = 13
              Width = 78
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.979166666666670000
                13.229166666666670000
                34.395833333333340000
                206.375000000000000000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'HW Sistemas'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 9
            end
            object QRShape3: TQRShape
              Left = 2
              Top = 8
              Width = 735
              Height = 3
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                7.937500000000000000
                5.291666666666667000
                21.166666666666670000
                1944.687500000000000000)
              Brush.Color = clBlack
              Shape = qrsRectangle
              VertAdjust = 0
            end
          end
          object QRGroup1: TQRGroup
            Left = 38
            Top = 173
            Width = 740
            Height = 22
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            BeforePrint = QRGroup1BeforePrint
            Color = clWhite
            TransparentBand = False
            ForceNewColumn = False
            ForceNewPage = False
            Size.Values = (
              58.208333333333340000
              1957.916666666667000000)
            PreCaluculateBandHeight = False
            KeepOnOnePage = False
            Expression = 'cdsAltPreco.DESCR_PROD'
            Master = QuickRep1
            ReprintOnNewPage = False
            object QRDBText2: TQRDBText
              Left = 20
              Top = 5
              Width = 34
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                52.916666666666670000
                13.229166666666670000
                89.958333333333320000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'GRUPO_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRDBText7: TQRDBText
              Left = 62
              Top = 5
              Width = 38
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                164.041666666666700000
                13.229166666666670000
                100.541666666666700000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'COD_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRDBText4: TQRDBText
              Left = 397
              Top = 5
              Width = 94
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                1050.395833333333000000
                13.229166666666670000
                248.708333333333300000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'PREC_TAB_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Mask = '0.00'
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRDBText1: TQRDBText
              Left = 503
              Top = 5
              Width = 53
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                1330.854166666667000000
                13.229166666666670000
                140.229166666666700000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'PREC_30_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Mask = '0.00'
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRDBText5: TQRDBText
              Left = 561
              Top = 5
              Width = 53
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                1484.312500000000000000
                13.229166666666670000
                140.229166666666700000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'PREC_60_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Mask = '0.00'
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRDBText6: TQRDBText
              Left = 619
              Top = 5
              Width = 53
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                1637.770833333333000000
                13.229166666666670000
                140.229166666666700000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'PREC_90_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Mask = '0.00'
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRDBText3: TQRDBText
              Left = 128
              Top = 5
              Width = 273
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                338.666666666666700000
                13.229166666666670000
                722.312500000000000000)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'DESCR_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
            object QRDBText9: TQRDBText
              Left = 678
              Top = 4
              Width = 53
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.687500000000000000
                1793.875000000000000000
                10.583333333333330000
                140.229166666666700000)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = dtmProdutos.cdsAltPreco
              DataField = 'PREC_PUBLICO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Mask = '0.00'
              ParentFont = False
              Transparent = False
              WordWrap = True
              ExportAs = exptText
              FontSize = 8
            end
          end
        end
      end
    end
    object tabStart: TTabSheet
      Caption = 'tabStart'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel8: TPanel
          Left = 6
          Top = 6
          Width = 682
          Height = 41
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Como deseja selecionar os produtos?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel10: TPanel
          Left = 6
          Top = 47
          Width = 682
          Height = 294
          Align = alClient
          BevelEdges = [beLeft, beRight]
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object radioConsulta: TRadioButton
            Left = 32
            Top = 32
            Width = 313
            Height = 17
            Caption = 'Utilizando todos produtos da consulta atual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = memoProcessosClick
          end
          object radioSelecao: TRadioButton
            Left = 32
            Top = 55
            Width = 313
            Height = 17
            Caption = 'Apenas os produtos selecionados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = memoProcessosClick
          end
          object radioFaixa: TRadioButton
            Left = 32
            Top = 78
            Width = 313
            Height = 17
            Caption = 'Por uma faixa, marca, grupo, subgrupo, etc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = memoProcessosClick
          end
          object pnMemoProcessos: TPanel
            Left = 0
            Top = 200
            Width = 678
            Height = 94
            Align = alBottom
            BevelEdges = [beTop]
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 8
            Enabled = False
            TabOrder = 3
            object memoProcessos: TMemo
              Left = 8
              Top = 8
              Width = 662
              Height = 76
              Align = alClient
              Ctl3D = False
              Lines.Strings = (
                'memoProcessos')
              ParentColor = True
              ParentCtl3D = False
              TabOrder = 0
              OnClick = memoProcessosClick
            end
          end
        end
        object Panel11: TPanel
          Left = 6
          Top = 341
          Width = 682
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 2
          object btStartNext: TBitBtn
            Left = 577
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Avan'#231'ar'
            TabOrder = 0
            OnClick = btStartNextClick
          end
          object btReport: TBitBtn
            Left = 8
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Relat'#243'rio'
            TabOrder = 1
            OnClick = btReportClick
          end
        end
      end
    end
    object tabFaixa: TTabSheet
      Caption = 'tabFaixa'
      ImageIndex = 5
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel13: TPanel
          Left = 6
          Top = 6
          Width = 682
          Height = 41
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Que faixa deseja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel14: TPanel
          Left = 6
          Top = 47
          Width = 682
          Height = 294
          Align = alClient
          BevelEdges = [beLeft, beRight]
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object PageControl2: TPageControl
            Left = 0
            Top = 48
            Width = 678
            Height = 246
            ActivePage = tabGrupo
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tabGrupo: TTabSheet
              Caption = 'tabGrupo'
              TabVisible = False
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object Label12: TLabel
                Left = 20
                Top = 3
                Width = 138
                Height = 13
                Hint = 
                  'Separando por v'#237'rgulas o n'#250'meros ser'#227'o considerados individuais,' +
                  ' separando por h'#237'fen ser'#225' considerado um intervalo'
                Caption = 'Faixa ( Ex: 1,3,5,8. Ou  3-8)'
              end
              object SpeedButton3: TSpeedButton
                Left = 301
                Top = 21
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000130B0000130B000000010000000100002184290039B5
                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                  0505050505050505050505050505050503000003050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050300000000
                  0004010000000000030505020101010101010101010101010005050204040404
                  0404010404040404000505030202020202040100000000000305050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0302020305050505050505050505050505050505050505050505}
                OnClick = SpeedButton3Click
              end
              object Label13: TLabel
                Left = 20
                Top = 49
                Width = 24
                Height = 13
                Hint = 
                  'Digite um texto para consultar e pressione F3 para adicionar o r' +
                  'egistro ou remover'
                Caption = 'Filtro'
              end
              object SpeedButton4: TSpeedButton
                Left = 301
                Top = 95
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000130B0000130B000000010000000100002184290039B5
                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                  0505050505050505050505050505050503000003050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050300000000
                  0004010000000000030505020101010101010101010101010005050204040404
                  0404010404040404000505030202020202040100000000000305050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0204010005050505050505050505050502040100050505050505050505050505
                  0302020305050505050505050505050505050505050505050505}
                OnClick = SpeedButton4Click
              end
              object Label14: TLabel
                Left = 374
                Top = 3
                Width = 64
                Height = 13
                Hint = 
                  'Digite um texto para consultar e pressione F3 para adicionar o r' +
                  'egistro ou remover'
                Caption = 'Sele'#231#227'o atual'
              end
              object btUnSelectAll: TSpeedButton
                Left = 301
                Top = 150
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
              object btSelectAll: TSpeedButton
                Left = 301
                Top = 123
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
              object SpeedButton5: TSpeedButton
                Left = 625
                Top = 76
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
                OnClick = SpeedButton5Click
              end
              object SpeedButton6: TSpeedButton
                Left = 625
                Top = 49
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
                OnClick = SpeedButton6Click
              end
              object SpeedButton7: TSpeedButton
                Left = 625
                Top = 21
                Width = 23
                Height = 22
                Flat = True
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
                OnClick = SpeedButton7Click
              end
              object edFaixa: TEdit
                Left = 20
                Top = 22
                Width = 275
                Height = 21
                TabOrder = 0
                Text = 'edFaixa'
              end
              object edFiltro: TEdit
                Left = 20
                Top = 68
                Width = 275
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
                Text = 'EDFILTRO'
                OnChange = edFiltroChange
              end
              object gridFiltro: TDBGrid
                Left = 20
                Top = 95
                Width = 275
                Height = 133
                Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SEL'
                    Width = 19
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID'
                    Width = 44
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NAME'
                    Width = 172
                    Visible = True
                  end>
              end
              object gridSelecao: TDBGrid
                Left = 344
                Top = 22
                Width = 275
                Height = 206
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Tahoma'
                Font.Style = []
                Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 3
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NAME'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SEL'
                    Width = 19
                    Visible = True
                  end>
              end
            end
          end
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 678
            Height = 48
            Align = alTop
            BevelEdges = [beBottom]
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object radioGrupo: TRadioButton
              Left = 24
              Top = 16
              Width = 73
              Height = 17
              Caption = 'Grupos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = radioGrupoClick
            end
            object radioSubGrupo: TRadioButton
              Left = 103
              Top = 16
              Width = 98
              Height = 17
              Caption = 'SubGrupos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = radioGrupoClick
            end
            object radioMarcas: TRadioButton
              Left = 207
              Top = 16
              Width = 74
              Height = 17
              Caption = 'Marcas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = radioGrupoClick
            end
            object radioCidades: TRadioButton
              Left = 287
              Top = 16
              Width = 74
              Height = 17
              Caption = 'Cidades'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnClick = radioGrupoClick
            end
            object radioLocalidades: TRadioButton
              Left = 367
              Top = 16
              Width = 98
              Height = 17
              Caption = 'Localidades'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnClick = radioGrupoClick
            end
            object radioSetores: TRadioButton
              Left = 471
              Top = 16
              Width = 68
              Height = 17
              Caption = 'Setores'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnClick = radioGrupoClick
            end
            object radioTabelasEPromos: TRadioButton
              Left = 549
              Top = 16
              Width = 106
              Height = 17
              Caption = 'Tabela/Promo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnClick = radioGrupoClick
            end
          end
        end
        object Panel15: TPanel
          Left = 6
          Top = 341
          Width = 682
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 2
          object btFaixaNext: TBitBtn
            Left = 577
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Avan'#231'ar'
            TabOrder = 0
            OnClick = btFaixaNextClick
          end
          object btFaixaUndo: TBitBtn
            Left = 496
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Voltar'
            TabOrder = 1
            OnClick = btFaixaUndoClick
          end
        end
      end
    end
    object tabApply2: TTabSheet
      Caption = 'tabApply2'
      ImageIndex = 11
      object Panel37: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel38: TPanel
          Left = 6
          Top = 6
          Width = 682
          Height = 41
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Calcular pre'#231'os'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel39: TPanel
          Left = 6
          Top = 47
          Width = 682
          Height = 294
          Align = alClient
          BevelEdges = [beLeft, beRight]
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object lbParametro2: TLabel
            Left = 487
            Top = 175
            Width = 50
            Height = 13
            Caption = 'Parametro'
          end
          object switchPrecoBtn: TSpeedButton
            Left = 34
            Top = 271
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = 'Alternar entre 1 pre'#231'o por vez e mais de 1'
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
              840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
              C6001873CE001873D600187BDE00187BE7001884EF001884F700FF00FF00188C
              FF001894FF002194FF00299CFF00319CFF0039A5FF004AADFF0052ADFF0063B5
              FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101D1D1D1D1D
              1D1D1D1D1D1D1D1D1D101D18030404040505040403030201171D1D05080A0A0A
              0A0A0A0A0A090805001D1D060A0C0C0D0D111111110C0906021D1D090C0E0E1D
              111C1C1C110E0A08031D1D0A0D11111D1D1D1D1D1C0E0B09041D1D0C1111111D
              1D1111111D0D0B0A051D1D0D1111111D1D1D11110E0C0A0A061D1D0E11111111
              1111110E0D0B0A0A061D1D1113131111110F1D1D1D0A0A0A061D1D111616131D
              11110E1D1D0B0A0A061D1D131817141C1D1D1D1D1D0C0A0A061D1D161A181615
              1C1C1C111D0E0C0A061D1D171B1A18171615141312110E0A041D1D1C17151311
              1111110E0D0C0A08191D101D1D1D1D1D1D1D1D1D1D1D1D1D1D10}
            OnClick = switchPrecoBtnClick
          end
          object lbCasasDecimais: TLabel
            Left = 487
            Top = 221
            Width = 155
            Height = 13
            Caption = 'Casas decimais arredondamento'
            Visible = False
          end
          object edParametro2: TEditHw
            Left = 487
            Top = 194
            Width = 165
            Height = 21
            TabOrder = 3
            Text = '                                           0,000'
            Formato = fNumber
            FormatSize = '0.3'
          end
          object radioTabelaPreco: TRadioGroup
            Left = 32
            Top = 32
            Width = 165
            Height = 233
            Caption = 'Tabela de Pre'#231'o'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Varejo'
              'Atacado'
              '30 dias'
              '60 dias'
              '90 dias'
              'Promo'#231#227'o'
              'Outras')
            ParentFont = False
            TabOrder = 0
            OnClick = radioTabelaPrecoClick
          end
          object radioFator: TRadioGroup
            Left = 275
            Top = 32
            Width = 165
            Height = 233
            Caption = 'Fator de altera'#231#227'o'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Pre'#231'o'
              'Markup'
              'Margem'
              '% Adicional')
            ParentFont = False
            TabOrder = 1
            OnClick = radioFatorClick
          end
          object radioForma: TRadioGroup
            Left = 487
            Top = 32
            Width = 165
            Height = 137
            Caption = 'Forma'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Substitui'#231#227'o'
              'Aumento'
              'Redu'#231#227'o')
            ParentFont = False
            TabOrder = 2
          end
          object grupoMultiPreco: TGroupBox
            Left = 32
            Top = 32
            Width = 185
            Height = 233
            Caption = 'Pre'#231'os'
            TabOrder = 4
            Visible = False
            object Label19: TLabel
              Left = 27
              Top = 30
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Varejo'
            end
            object Label20: TLabel
              Left = 18
              Top = 57
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Atacado'
            end
            object Label21: TLabel
              Left = 24
              Top = 84
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = '30 dias'
            end
            object Label22: TLabel
              Left = 24
              Top = 111
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = '60 dias'
            end
            object Label23: TLabel
              Left = 24
              Top = 138
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = '90 dias'
            end
            object Label24: TLabel
              Left = 11
              Top = 165
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Promo'#231#227'o'
            end
            object edMultVarejo: TEditHw
              Left = 64
              Top = 27
              Width = 85
              Height = 21
              TabOrder = 0
              Text = '              0,0000'
              Formato = fNumber
              FormatSize = '0.4'
            end
            object edMultAtacado: TEditHw
              Left = 64
              Top = 54
              Width = 85
              Height = 21
              TabOrder = 2
              Text = '              0,0000'
              Formato = fNumber
              FormatSize = '0.4'
            end
            object edMult30dias: TEditHw
              Left = 64
              Top = 81
              Width = 85
              Height = 21
              TabOrder = 4
              Text = '              0,0000'
              Formato = fNumber
              FormatSize = '0.4'
            end
            object edMult60dias: TEditHw
              Left = 64
              Top = 108
              Width = 85
              Height = 21
              TabOrder = 6
              Text = '              0,0000'
              Formato = fNumber
              FormatSize = '0.4'
            end
            object edMult90dias: TEditHw
              Left = 64
              Top = 135
              Width = 85
              Height = 21
              TabOrder = 8
              Text = '              0,0000'
              Formato = fNumber
              FormatSize = '0.4'
            end
            object edMultPromocao: TEditHw
              Left = 64
              Top = 162
              Width = 85
              Height = 21
              TabOrder = 10
              Text = '              0,0000'
              Formato = fNumber
              FormatSize = '0.4'
            end
            object ckMultVarejo: TCheckBox
              Left = 155
              Top = 29
              Width = 17
              Height = 17
              TabOrder = 1
              OnClick = ckMultVarejoClick
            end
            object ckMultAtacado: TCheckBox
              Left = 155
              Top = 56
              Width = 17
              Height = 17
              TabOrder = 3
              OnClick = ckMultAtacadoClick
            end
            object ckMult30dias: TCheckBox
              Left = 155
              Top = 83
              Width = 17
              Height = 17
              TabOrder = 5
              OnClick = ckMult30diasClick
            end
            object ckMult60dias: TCheckBox
              Left = 155
              Top = 110
              Width = 17
              Height = 17
              TabOrder = 7
              OnClick = ckMult60diasClick
            end
            object ckMult90dias: TCheckBox
              Left = 155
              Top = 137
              Width = 17
              Height = 17
              TabOrder = 9
              OnClick = ckMult90diasClick
            end
            object ckMultPromocao: TCheckBox
              Left = 155
              Top = 164
              Width = 17
              Height = 17
              TabOrder = 11
              OnClick = ckMultPromocaoClick
            end
          end
          object edCasasDecimais: TSpinEdit
            Left = 487
            Top = 240
            Width = 165
            Height = 22
            MaxValue = 10
            MinValue = 0
            TabOrder = 5
            Value = 0
            Visible = False
          end
        end
        object Panel41: TPanel
          Left = 6
          Top = 341
          Width = 682
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 2
          object btParar: TSpeedButton
            Left = 424
            Top = 12
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = 'Parar'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFCFCFDCBCCE3ADAFD8B3B5DADEDEECFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBFE24853C9303ECC2F
              3CC92E39C72D36C3585CC4CBCBE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEFEFE8F92C83345D13244D13142CF303FCC303DCA2F3AC82E37C42E35C19EA0
              D8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFE6A699F3247CE344AD63347D43245D231
              43CF3140CD303DCB2F3BC82E38C52D35C2ADAEDDFFFFFFFFFFFFFFFFFFA09FBF
              232D96354FDB354DD9344BD73348D53246D23243D03141CE303ECB2F3BC92E39
              C6363DC1E6E7F1FFFFFFFEFEFE3332762C3FB73652DE425BDE3B53DB344BD833
              49D63346D33244D13141CF303FCC2F3CCA2F3AC7868AD3FFFFFFDBDBE3161463
              3048C73755E192A0E8E8EAF0D3D7EDB8BFE99CA5E5808BDF6472DA4857D33241
              CD303DCA414AC5FEFEFEC1C1D01614633048C53858E494A4E9EAEBF0EAEBF0EA
              EBF0EAEBF0EAEAF0EAEAF0EAEAF0E2E4EF4A57D2303ECBE4E5EFC8C7D5161463
              2B3EB1395BE7395AE54A66E46279E57B8CE592A0E7ABB4E9C4C9EBDDDEEEEAEA
              F05160D63141CED2D3E6ECECF01816642029893A5EEA395CE8395AE53858E337
              55E13653DF3650DD354EDB344CD84054D8374BD43244D1DEDFECFFFFFF4E4B8A
              1715683553D53A5FEA3A5DE8395BE63858E43756E23754E03651DE354FDB344C
              D9344AD73E4FCFFBFBFDFFFFFFB8B7D018156A2027893B60EB3B60EB3A5EE939
              5BE73859E53857E33754E03652DE3650DC354DDA858EDAFFFFFFFFFFFFFFFFFF
              6A68A019167026339F3B62EC3B61EC3A5EEA395CE8395AE63858E33755E13653
              DF475CD6ECEDF5FFFFFFFFFFFFFFFFFFF8F7FA5D5A9B1B1776242B953759DE3B
              61ED3A5FEB3A5DE8395BE63858E44E65D9D9DBEEFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFDFDFE9A99C42F2B851D1A7F2630A02E42BC3148C55E70D1ABB2E3F7F7
              FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFCC7C6DCA9
              A7CBB0AFCFE0E0EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Visible = False
            OnClick = btPararClick
          end
          object btApply: TBitBtn
            Left = 577
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Executar'
            TabOrder = 0
            OnClick = btApplyClick
          end
          object btUndoApply: TBitBtn
            Left = 496
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Voltar'
            TabOrder = 1
            OnClick = btUndoApplyClick
          end
          object pnLogCalculo: TPanel
            Left = 32
            Top = 0
            Width = 389
            Height = 37
            BevelOuter = bvNone
            BorderWidth = 3
            TabOrder = 2
            Visible = False
            object lbCalculo: TLabel
              Left = 3
              Top = 3
              Width = 383
              Height = 13
              Align = alTop
              Caption = 'Progresso'
              ExplicitWidth = 48
            end
            object progressCalculo: TProgressBar
              Left = 3
              Top = 17
              Width = 383
              Height = 17
              Align = alBottom
              TabOrder = 0
            end
          end
        end
      end
    end
    object tabFinish: TTabSheet
      Caption = 'tabFinish'
      ImageIndex = 10
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel33: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel34: TPanel
          Left = 6
          Top = 6
          Width = 682
          Height = 41
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Lista de produtos e seus novos pre'#231'os'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel35: TPanel
          Left = 6
          Top = 47
          Width = 682
          Height = 253
          Align = alClient
          BevelEdges = [beLeft, beRight]
          BevelKind = bkTile
          BevelOuter = bvNone
          BorderWidth = 6
          TabOrder = 1
          object gridProdutosPrecos: TDBGrid
            Left = 6
            Top = 6
            Width = 666
            Height = 241
            Align = alClient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosPrecosDrawColumnCell
            OnKeyDown = gridProdutosPrecosKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCR_PROD'
                Title.Caption = 'Produto'
                Width = 258
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TABNAME'
                Title.Caption = 'Tabela'
                Width = 119
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECO'
                Title.Caption = 'Pre'#231'o'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MSG'
                Title.Caption = 'Mais detalhes'
                Width = 202
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GRUPO_PROD'
                Title.Caption = 'Grupo'
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_PROD'
                Title.Caption = 'C'#243'digo'
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Title.Caption = 'Tipo'
                Width = 96
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROBLEMA'
                Title.Caption = 'Aviso'
                Visible = True
              end>
          end
        end
        object Panel36: TPanel
          Left = 6
          Top = 341
          Width = 682
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 2
          object Label17: TLabel
            Left = 40
            Top = 6
            Width = 225
            Height = 26
            AutoSize = False
            Caption = 
              '*Pre'#231'os calculados, por'#233'm ainda n'#227'o salvos no banco de dados, fi' +
              'nalize o processo clicando em Concluir *'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object SpeedButton8: TSpeedButton
            Left = 9
            Top = 7
            Width = 23
            Height = 22
            Hint = 'Remover todos os itens'
            Flat = True
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
            OnClick = SpeedButton8Click
          end
          object Label16: TLabel
            Left = 271
            Top = 6
            Width = 219
            Height = 26
            AutoSize = False
            Caption = 
              '* Alguns itens podem n'#227'o atender as especifica'#231#245'es da altera'#231#227'o ' +
              'de pre'#231'o, consulte a coluna "Aviso" *'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clPurple
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object btParar2: TSpeedButton
            Left = 11
            Top = 6
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = 'Parar'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFCFCFDCBCCE3ADAFD8B3B5DADEDEECFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBFE24853C9303ECC2F
              3CC92E39C72D36C3585CC4CBCBE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEFEFE8F92C83345D13244D13142CF303FCC303DCA2F3AC82E37C42E35C19EA0
              D8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFE6A699F3247CE344AD63347D43245D231
              43CF3140CD303DCB2F3BC82E38C52D35C2ADAEDDFFFFFFFFFFFFFFFFFFA09FBF
              232D96354FDB354DD9344BD73348D53246D23243D03141CE303ECB2F3BC92E39
              C6363DC1E6E7F1FFFFFFFEFEFE3332762C3FB73652DE425BDE3B53DB344BD833
              49D63346D33244D13141CF303FCC2F3CCA2F3AC7868AD3FFFFFFDBDBE3161463
              3048C73755E192A0E8E8EAF0D3D7EDB8BFE99CA5E5808BDF6472DA4857D33241
              CD303DCA414AC5FEFEFEC1C1D01614633048C53858E494A4E9EAEBF0EAEBF0EA
              EBF0EAEBF0EAEAF0EAEAF0EAEAF0E2E4EF4A57D2303ECBE4E5EFC8C7D5161463
              2B3EB1395BE7395AE54A66E46279E57B8CE592A0E7ABB4E9C4C9EBDDDEEEEAEA
              F05160D63141CED2D3E6ECECF01816642029893A5EEA395CE8395AE53858E337
              55E13653DF3650DD354EDB344CD84054D8374BD43244D1DEDFECFFFFFF4E4B8A
              1715683553D53A5FEA3A5DE8395BE63858E43756E23754E03651DE354FDB344C
              D9344AD73E4FCFFBFBFDFFFFFFB8B7D018156A2027893B60EB3B60EB3A5EE939
              5BE73859E53857E33754E03652DE3650DC354DDA858EDAFFFFFFFFFFFFFFFFFF
              6A68A019167026339F3B62EC3B61EC3A5EEA395CE8395AE63858E33755E13653
              DF475CD6ECEDF5FFFFFFFFFFFFFFFFFFF8F7FA5D5A9B1B1776242B953759DE3B
              61ED3A5FEB3A5DE8395BE63858E44E65D9D9DBEEFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFDFDFE9A99C42F2B851D1A7F2630A02E42BC3148C55E70D1ABB2E3F7F7
              FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFCC7C6DCA9
              A7CBB0AFCFE0E0EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Visible = False
            OnClick = btPararClick
          end
          object btFinish: TBitBtn
            Left = 577
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Concluir'
            TabOrder = 0
            OnClick = btFinishClick
          end
          object btFinishUndo: TBitBtn
            Left = 496
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Voltar'
            TabOrder = 1
            OnClick = btFinishUndoClick
          end
        end
        object pnLogUpdate: TPanel
          Left = 6
          Top = 300
          Width = 682
          Height = 41
          Align = alBottom
          BevelEdges = [beLeft, beRight]
          BevelKind = bkTile
          BevelOuter = bvNone
          BorderWidth = 3
          Padding.Left = 3
          Padding.Right = 3
          TabOrder = 3
          Visible = False
          object lbLogUpdate: TLabel
            Left = 6
            Top = 3
            Width = 666
            Height = 15
            Align = alTop
            AutoSize = False
            Caption = 'Label19'
            ExplicitLeft = 3
            ExplicitWidth = 672
          end
          object progressUpdate: TProgressBar
            Left = 6
            Top = 18
            Width = 666
            Height = 17
            Align = alTop
            TabOrder = 0
          end
        end
      end
    end
    object tabReport: TTabSheet
      Caption = 'tabReport'
      ImageIndex = 12
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel40: TPanel
        Left = 0
        Top = 0
        Width = 694
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel42: TPanel
          Left = 6
          Top = 6
          Width = 682
          Height = 41
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Relat'#243'rio de altera'#231#227'o de pre'#231'os'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel43: TPanel
          Left = 6
          Top = 47
          Width = 682
          Height = 294
          Align = alClient
          BevelEdges = [beLeft, beRight]
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object Label15: TLabel
            Left = 32
            Top = 32
            Width = 51
            Height = 13
            Caption = 'Data inicial'
          end
          object Label18: TLabel
            Left = 168
            Top = 32
            Width = 46
            Height = 13
            Caption = 'Data final'
          end
          object edDataIni: TMaskEdit
            Left = 32
            Top = 51
            Width = 116
            Height = 21
            EditMask = '!99/99/0000 90:00:00;1;_'
            MaxLength = 19
            TabOrder = 0
            Text = '  /  /       :  :  '
          end
          object edDataFim: TMaskEdit
            Left = 168
            Top = 51
            Width = 116
            Height = 21
            EditMask = '!99/99/0000 90:00:00;1;_'
            MaxLength = 19
            TabOrder = 1
            Text = '  /  /       :  :  '
          end
          object Panel45: TPanel
            Left = 0
            Top = 64
            Width = 673
            Height = 233
            Caption = 'Panel45'
            TabOrder = 2
            Visible = False
            object QuickRep2: TQuickRep
              Left = -10
              Top = -32
              Width = 816
              Height = 1056
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Functions.Strings = (
                'PAGENUMBER'
                'COLUMNNUMBER'
                'REPORTTITLE')
              Functions.DATA = (
                '0'
                '0'
                #39#39)
              OnPreview = QuickRep2Preview
              Options = [FirstPageHeader, LastPageFooter]
              Page.Columns = 1
              Page.Orientation = poPortrait
              Page.PaperSize = Letter
              Page.Values = (
                100.000000000000000000
                2794.000000000000000000
                100.000000000000000000
                2159.000000000000000000
                100.000000000000000000
                100.000000000000000000
                0.000000000000000000)
              PrinterSettings.Copies = 1
              PrinterSettings.OutputBin = Auto
              PrinterSettings.Duplex = False
              PrinterSettings.FirstPage = 0
              PrinterSettings.LastPage = 0
              PrinterSettings.UseStandardprinter = False
              PrinterSettings.UseCustomBinCode = False
              PrinterSettings.CustomBinCode = 0
              PrinterSettings.ExtendedDuplex = 0
              PrinterSettings.UseCustomPaperCode = False
              PrinterSettings.CustomPaperCode = 0
              PrinterSettings.PrintMetaFile = False
              PrinterSettings.PrintQuality = 0
              PrinterSettings.Collate = 0
              PrinterSettings.ColorOption = 0
              PrintIfEmpty = True
              ReportTitle = 'Relat'#243'rio de altera'#231#227'o de pre'#231'os'
              SnapToGrid = True
              Units = MM
              Zoom = 100
              PrevFormStyle = fsNormal
              PreviewInitialState = wsNormal
              PrevInitialZoom = qrZoomToFit
              PreviewDefaultSaveType = stQRP
              object QRBand4: TQRBand
                Left = 38
                Top = 38
                Width = 740
                Height = 131
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  346.604166666666700000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbPageHeader
                object QRLabel20: TQRLabel
                  Left = 2
                  Top = 36
                  Width = 399
                  Height = 24
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    63.500000000000000000
                    5.291666666666670000
                    95.250000000000000000
                    1055.687500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'Relat'#243'rio de altera'#231#227'o de pre'#231'os'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Arial'
                  Font.Style = [fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 14
                end
                object QRLabel21: TQRLabel
                  Left = 2
                  Top = 61
                  Width = 65
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    5.291666666666667000
                    161.395833333333300000
                    171.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data/Hora:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRSysData3: TQRSysData
                  Left = 73
                  Top = 61
                  Width = 69
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    193.145833333333300000
                    161.395833333333300000
                    182.562500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  Color = clWhite
                  Data = qrsDateTime
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsItalic]
                  ParentFont = False
                  Transparent = False
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel22: TQRLabel
                  Left = 636
                  Top = 61
                  Width = 47
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1682.750000000000000000
                    161.395833333333300000
                    124.354166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'P'#225'gina:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRSysData4: TQRSysData
                  Left = 689
                  Top = 61
                  Width = 46
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1822.979166666667000000
                    161.395833333333300000
                    121.708333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  Color = clWhite
                  Data = qrsPageNumber
                  Transparent = False
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRShape5: TQRShape
                  Left = 2
                  Top = 79
                  Width = 735
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    5.291666666666667000
                    209.020833333333300000
                    1944.687500000000000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape6: TQRShape
                  Left = 2
                  Top = 124
                  Width = 735
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    5.291666666666667000
                    328.083333333333400000
                    1944.687500000000000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel24: TQRLabel
                  Left = 7
                  Top = 85
                  Width = 51
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    18.520833333333330000
                    224.895833333333300000
                    134.937500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Produto'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel25: TQRLabel
                  Left = 689
                  Top = 88
                  Width = 38
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1822.979166666667000000
                    232.833333333333400000
                    100.541666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Pre'#231'o'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel28: TQRLabel
                  Left = 592
                  Top = 103
                  Width = 48
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1566.333333333333000000
                    272.520833333333400000
                    127.000000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Markup'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel29: TQRLabel
                  Left = 674
                  Top = 103
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1783.291666666667000000
                    272.520833333333400000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Margem'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel30: TQRLabel
                  Left = 2
                  Top = 4
                  Width = 727
                  Height = 25
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    66.145833333333320000
                    5.291666666666667000
                    10.583333333333330000
                    1923.520833333333000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'NOME DA EMPRESA'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -21
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 16
                end
                object QRLabel31: TQRLabel
                  Left = 364
                  Top = 85
                  Width = 45
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    963.083333333333400000
                    224.895833333333300000
                    119.062500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Tabela'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel26: TQRLabel
                  Left = 609
                  Top = 84
                  Width = 31
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1611.312500000000000000
                    222.250000000000000000
                    82.020833333333340000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Qtde'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel27: TQRLabel
                  Left = 364
                  Top = 103
                  Width = 94
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    963.083333333333400000
                    272.520833333333400000
                    248.708333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data altera'#231#227'o'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
              object QRBand6: TQRBand
                Left = 38
                Top = 214
                Width = 740
                Height = 32
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  84.666666666666680000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbPageFooter
                object QRLabel38: TQRLabel
                  Left = 5
                  Top = 13
                  Width = 78
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    13.229166666666670000
                    34.395833333333340000
                    206.375000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'HW Sistemas'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRShape8: TQRShape
                  Left = 2
                  Top = 8
                  Width = 735
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    5.291666666666667000
                    21.166666666666670000
                    1944.687500000000000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
              end
              object DetailBand1: TQRBand
                Left = 38
                Top = 169
                Width = 740
                Height = 45
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  119.062500000000000000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbDetail
                object QRExpr1: TQRExpr
                  Left = 656
                  Top = 22
                  Width = 73
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1735.666666666667000000
                    58.208333333333340000
                    193.145833333333300000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Color = clWhite
                  ParentFont = False
                  ResetAfterPrint = False
                  Transparent = False
                  WordWrap = True
                  Expression = 'FORMATNUMERIC('#39'#,##0.00'#39',MARGEM)'
                  ExportAs = exptNumeric
                  FontSize = 8
                end
                object QRExpr2: TQRExpr
                  Left = 565
                  Top = 22
                  Width = 75
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1494.895833333333000000
                    58.208333333333340000
                    198.437500000000000000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Color = clWhite
                  Master = QuickRep2
                  ParentFont = False
                  ResetAfterPrint = False
                  Transparent = False
                  WordWrap = True
                  Expression = 'FORMATNUMERIC('#39'#,##0.00'#39',MARKUP)'
                  ExportAs = exptFormula
                  FontSize = 8
                end
                object QRExpr3: TQRExpr
                  Left = 592
                  Top = 6
                  Width = 48
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1566.333333333333000000
                    15.875000000000000000
                    127.000000000000000000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Color = clWhite
                  Master = QuickRep2
                  ParentFont = False
                  ResetAfterPrint = False
                  Transparent = False
                  WordWrap = True
                  Expression = 'FORMATNUMERIC('#39'#,##0.00'#39',QUANTIDADE)'
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRExpr4: TQRExpr
                  Left = 364
                  Top = 6
                  Width = 213
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    963.083333333333400000
                    15.875000000000000000
                    563.562500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Color = clWhite
                  Master = QuickRep2
                  ParentFont = False
                  ResetAfterPrint = False
                  Transparent = False
                  WordWrap = True
                  Expression = 'TABELA'
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRExpr5: TQRExpr
                  Left = 72
                  Top = 6
                  Width = 286
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    190.500000000000000000
                    15.875000000000000000
                    756.708333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Color = clWhite
                  Master = QuickRep2
                  ParentFont = False
                  ResetAfterPrint = False
                  Transparent = False
                  WordWrap = True
                  Expression = 'DESCR_PROD'
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRExpr6: TQRExpr
                  Left = 7
                  Top = 6
                  Width = 60
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    18.520833333333330000
                    15.875000000000000000
                    158.750000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Color = clWhite
                  Master = QuickRep2
                  ParentFont = False
                  ResetAfterPrint = False
                  Transparent = False
                  WordWrap = True
                  Expression = 'CODIGO'
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRExpr7: TQRExpr
                  Left = 656
                  Top = 6
                  Width = 73
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1735.666666666667000000
                    15.875000000000000000
                    193.145833333333300000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Color = clWhite
                  Master = QuickRep2
                  ParentFont = False
                  ResetAfterPrint = False
                  Transparent = False
                  WordWrap = True
                  Expression = 'FORMATNUMERIC('#39'#,##0.000'#39',PRECO)'
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRExpr8: TQRExpr
                  Left = 364
                  Top = 22
                  Width = 117
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    963.083333333333400000
                    58.208333333333340000
                    309.562500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Color = clWhite
                  Master = QuickRep2
                  ParentFont = False
                  ResetAfterPrint = False
                  Transparent = False
                  WordWrap = True
                  Expression = 'DATA'
                  ExportAs = exptText
                  FontSize = 8
                end
              end
            end
          end
        end
        object Panel44: TPanel
          Left = 6
          Top = 341
          Width = 682
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 2
          object BitBtn11: TBitBtn
            Left = 577
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Executar'
            TabOrder = 0
            OnClick = BitBtn11Click
          end
          object BitBtn12: TBitBtn
            Left = 496
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Voltar'
            TabOrder = 1
            OnClick = BitBtn12Click
          end
        end
      end
    end
  end
  object popDelete: TPopupMenu
    Left = 632
    Top = 72
    object Removertodos1: TMenuItem
      Caption = 'Remover todos'
      OnClick = Removertodos1Click
    end
    object Removeritenscomavisos1: TMenuItem
      Caption = 'Remover itens com avisos'
      OnClick = Removeritenscomavisos1Click
    end
  end
end
