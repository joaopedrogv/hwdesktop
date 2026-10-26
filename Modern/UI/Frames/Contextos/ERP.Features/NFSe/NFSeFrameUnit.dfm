object NFSeFrame: TNFSeFrame
  Left = 0
  Top = 0
  Width = 829
  Height = 343
  TabOrder = 0
  TabStop = True
  object pnContent: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 823
    Height = 337
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pageDPS: TPageControl
      Left = 0
      Top = 33
      Width = 823
      Height = 304
      ActivePage = tabValores
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object tabResumo: TTabSheet
        Caption = '    Resumo    '
        object PanelResumo4: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 102
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object Label5: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 152
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'S'#233'rie'
            Layout = tlCenter
          end
          object lbNumDpsRps1: TLabel
            AlignWithMargins = True
            Left = 242
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'N'#250'mero DPS'
            Layout = tlCenter
            ExplicitLeft = 164
          end
          object Label49: TLabel
            AlignWithMargins = True
            Left = 404
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'N'#250'mero NFS-e'
            Layout = tlCenter
            ExplicitLeft = 164
          end
          object Label1: TLabel
            AlignWithMargins = True
            Left = 566
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'DH Emiss'#227'o'
            Layout = tlCenter
          end
          object btAtualizarDataEmissao: TSpeedButton
            AlignWithMargins = True
            Left = 780
            Top = 2
            Width = 23
            Height = 23
            Cursor = crHandPoint
            Hint = 'Atualizar data de emiss'#227'o'
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alLeft
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF6DFAFFFFFFFFFFFFFFFFFFFFFFFFFEBBF6DEABB65E3B463ECD3A4FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D28CE6A722EBB74BFFFFFFFFFFFFFF
              FFFFE09A19DF9918D58F15E5B450F3D390FFFFFFFFFFFFFFFFFFFFFFFFF1D288
              E7AA24E7A923E6A823EBB84CFFFFFFFFFFFFF6E1BAF4DDB2F1DAB1EDC162E7A8
              23FAECCEFFFFFFFFFFFFFFFFFFF8E6BDF2D186E8AB25EBBD53F7E2B6FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF0C76EE7AA24F7E3B6FFFFFFFFFFFFFFFFFFFFFFFF
              F8E4B7E9AD26F0C86EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C86EE8AD
              26F7E3B6FFFFFFFFFFFFFFFFFFFFFFFFF8E5B7E9AF28F0C96FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF1CA70E9AF27F8E4B7FFFFFFFFFFFFFFFFFFFFFFFF
              F8E5B8EAB129F1CA70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CC71EAB1
              29F8E5B7FFFFFFFFFFFFFFFFFFFFFFFFF8E6B8EBB32BF2CC71FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF2CD72EBB32BF8E5B8FFFFFFFFFFFFFFFFFFFFFFFF
              F9E7B9ECB52CF2CE72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E7B9EFC55AECB5
              2CF4D68AF9E8BFFFFFFFFFFFFFFFFFFFFBEFD1EDB82EF0CA69F1DAB1F4DDB2F6
              E1BAFFFFFFFFFFFFF0C657EDB82EEDB72EECB72DF5D78DFFFFFFFFFFFFFFFFFF
              FFFFFFF7DD97EBBF59D58F15DF9918E09A19FFFFFFFFFFFFFFFFFFF1C759EEBA
              2FF5D78BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEED8A8E3B463EABB65EB
              BF6DFFFFFFFFFFFFFFFFFFFFFFFFF9E7B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = btAtualizarDataEmissaoClick
            ExplicitLeft = 779
          end
          object edSerie: TMaskEdit
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 0
          end
          object edNumeroDps: TEditHw
            AlignWithMargins = True
            Left = 323
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 1
            Text = '0'
            OnExit = edVServ2Exit
            Formato = fInteger
            FormatSize = '0.2'
            Nullable = True
          end
          object edNumeroNFSe: TEditHw
            AlignWithMargins = True
            Left = 485
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 2
            Text = '????????'
            OnExit = edVServ2Exit
            Formato = fInteger
            FormatSize = '0.2'
            Nullable = True
          end
          object edDhemi: TMaskEdit
            AlignWithMargins = True
            Left = 647
            Top = 3
            Width = 127
            Height = 21
            Align = alLeft
            EditMask = '!99/99/9999 99:99:99;1;_'
            MaxLength = 19
            TabOrder = 3
            Text = '  /  /       :  :  '
            OnExit = edDhemiExit
          end
        end
        object PanelResumo1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label53: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 152
            Height = 21
            Hint = 'Opera'#231#227'o Interna'
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Opera'#231#227'o Interna'
            Layout = tlCenter
          end
          object Label2: TLabel
            AlignWithMargins = True
            Left = 488
            Top = 3
            Width = 156
            Height = 21
            Hint = 'Data da presta'#231#227'o do servi'#231'o'
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Data Presta'#231#227'o do Servico'
            Layout = tlCenter
            ExplicitLeft = 323
          end
          inline ComboBoxOpInternasFrame1: TComboBoxOpInternasFrame
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 321
            Height = 21
            Align = alLeft
            TabOrder = 0
            TabStop = True
            ExplicitLeft = 161
            ExplicitTop = 3
            ExplicitWidth = 321
            ExplicitHeight = 21
            inherited pnInfo: TPanel
              Top = 5
              Width = 321
              ExplicitTop = 5
              ExplicitWidth = 321
            end
            inherited edOpInternas: TComboBox
              Width = 321
              ExplicitWidth = 321
            end
          end
          object edDataPrestacao: TMaskEdit
            AlignWithMargins = True
            Left = 650
            Top = 3
            Width = 156
            Height = 21
            Hint = 'Data da presta'#231#227'o do servi'#231'o'
            Align = alLeft
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
          end
        end
        object PanelResumo6: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 168
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 5
          object Label6: TLabel
            AlignWithMargins = True
            Left = 404
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Chave NFSe'
            Layout = tlCenter
            ExplicitLeft = 242
          end
          object Label50: TLabel
            AlignWithMargins = True
            Left = 242
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Vr NF(IBSCBS)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object Label70: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 152
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Valor L'#237'quido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object edChave: TMaskEdit
            AlignWithMargins = True
            Left = 485
            Top = 3
            Width = 318
            Height = 21
            Align = alLeft
            TabOrder = 2
            Text = '31062002221977556000102000000000007126030430591290'
          end
          object edTotNF: TEditHw
            AlignWithMargins = True
            Left = 323
            Top = 3
            Width = 75
            Height = 21
            TabStop = False
            Align = alLeft
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 1
            Text = '0,00'
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
          object edVLIQ: TEditHw
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 75
            Height = 21
            TabStop = False
            Align = alLeft
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
            Text = '0,00'
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
        end
        object PanelResumo2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 36
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lbPartPrincipal: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 152
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tomador do Servi'#231'o'
            Layout = tlCenter
          end
          object btPesquisarPartPrincipal: TSpeedButton
            AlignWithMargins = True
            Left = 780
            Top = 2
            Width = 23
            Height = 23
            Cursor = crHandPoint
            Hint = 'Consultar no cadastro de Clientes/Fornecedores'
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alLeft
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
            OnClick = linkPesquisarPartPrincipalClick
            ExplicitLeft = 779
          end
          object edCodCliente: TMaskEdit
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 613
            Height = 21
            TabStop = False
            Align = alLeft
            ReadOnly = True
            TabOrder = 0
          end
        end
        object PanelResumo3: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 69
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label68: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 152
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Servi'#231'o prestado'
            Layout = tlCenter
          end
          object btPesquisarServico2: TSpeedButton
            AlignWithMargins = True
            Left = 780
            Top = 2
            Width = 23
            Height = 23
            Cursor = crHandPoint
            Hint = 'Consultar no Servi'#231'os'
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alLeft
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
            OnClick = btPesquisarServicoClick
            ExplicitLeft = 779
          end
          object edCodServico: TMaskEdit
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 613
            Height = 21
            TabStop = False
            Align = alLeft
            ReadOnly = True
            TabOrder = 0
          end
        end
        object PanelResumo5: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 135
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          object Label66: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 152
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Valor dos servi'#231'os'
            Layout = tlCenter
          end
          object Label69: TLabel
            AlignWithMargins = True
            Left = 242
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Desconto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = 164
          end
          object Label60: TLabel
            AlignWithMargins = True
            Left = 404
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tot Reten'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = 366
            ExplicitTop = 9
          end
          object Label63: TLabel
            AlignWithMargins = True
            Left = 566
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Dh Processam.'
            Layout = tlCenter
          end
          object btAtualizarDataProcessamento: TSpeedButton
            AlignWithMargins = True
            Left = 780
            Top = 2
            Width = 23
            Height = 23
            Cursor = crHandPoint
            Hint = 'Atualizar data de processamento'
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alLeft
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF6DFAFFFFFFFFFFFFFFFFFFFFFFFFFEBBF6DEABB65E3B463ECD3A4FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D28CE6A722EBB74BFFFFFFFFFFFFFF
              FFFFE09A19DF9918D58F15E5B450F3D390FFFFFFFFFFFFFFFFFFFFFFFFF1D288
              E7AA24E7A923E6A823EBB84CFFFFFFFFFFFFF6E1BAF4DDB2F1DAB1EDC162E7A8
              23FAECCEFFFFFFFFFFFFFFFFFFF8E6BDF2D186E8AB25EBBD53F7E2B6FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF0C76EE7AA24F7E3B6FFFFFFFFFFFFFFFFFFFFFFFF
              F8E4B7E9AD26F0C86EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C86EE8AD
              26F7E3B6FFFFFFFFFFFFFFFFFFFFFFFFF8E5B7E9AF28F0C96FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF1CA70E9AF27F8E4B7FFFFFFFFFFFFFFFFFFFFFFFF
              F8E5B8EAB129F1CA70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CC71EAB1
              29F8E5B7FFFFFFFFFFFFFFFFFFFFFFFFF8E6B8EBB32BF2CC71FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF2CD72EBB32BF8E5B8FFFFFFFFFFFFFFFFFFFFFFFF
              F9E7B9ECB52CF2CE72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E7B9EFC55AECB5
              2CF4D68AF9E8BFFFFFFFFFFFFFFFFFFFFBEFD1EDB82EF0CA69F1DAB1F4DDB2F6
              E1BAFFFFFFFFFFFFF0C657EDB82EEDB72EECB72DF5D78DFFFFFFFFFFFFFFFFFF
              FFFFFFF7DD97EBBF59D58F15DF9918E09A19FFFFFFFFFFFFFFFFFFF1C759EEBA
              2FF5D78BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEED8A8E3B463EABB65EB
              BF6DFFFFFFFFFFFFFFFFFFFFFFFFF9E7B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = btAtualizarDataProcessamentoClick
            ExplicitLeft = 779
          end
          object edVServ: TEditHw
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '0,00'
            OnExit = edVServ2Exit
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
          object edVDesc: TEditHw
            AlignWithMargins = True
            Left = 323
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 1
            Text = '0,00'
            OnExit = edVDesc2Exit
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
          object edTotRet: TEditHw
            AlignWithMargins = True
            Left = 485
            Top = 3
            Width = 75
            Height = 21
            TabStop = False
            Align = alLeft
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 2
            Text = '0,00'
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
          object edDhProcessamento: TMaskEdit
            AlignWithMargins = True
            Left = 647
            Top = 3
            Width = 127
            Height = 21
            Align = alLeft
            EditMask = '!99/99/9999 99:99:99;1;_'
            MaxLength = 19
            TabOrder = 3
            Text = '  /  /       :  :  '
            OnExit = edDhemiExit
          end
        end
        object PanelIbsCbsNac1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 201
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 6
          object Label33: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 152
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Cod Indic Oper Fornecimento'
            Layout = tlCenter
          end
          object linkCorrelacao2: TLabel
            AlignWithMargins = True
            Left = 242
            Top = 3
            Width = 189
            Height = 21
            Cursor = crHandPoint
            Align = alLeft
            Caption = 'Consultar C'#243'digo Correlacionados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            OnClick = linkCorrelacao1Click
            ExplicitHeight = 13
          end
          object Label34: TLabel
            AlignWithMargins = True
            Left = 437
            Top = 3
            Width = 203
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Finalidade'
            Layout = tlCenter
          end
          object edcIndOp: TMaskEdit
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            EditMask = '000000;0;_'
            MaxLength = 6
            ReadOnly = True
            TabOrder = 0
          end
          object edFinNFS: TComboBox
            AlignWithMargins = True
            Left = 646
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            TabStop = False
            Text = '0-Regular'
            Items.Strings = (
              '0-Regular')
          end
        end
        object pnOS: TPanel
          Left = 0
          Top = 231
          Width = 815
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Ordens de Servi'#231'o: 114,222,123123'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
      end
      object tabPart: TTabSheet
        Caption = '  Participantes  '
        ImageIndex = 1
        object PanelParticipantes1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label9: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 152
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Local da Presta'#231#227'o do Servi'#231'o'
            Layout = tlCenter
          end
          object ckIndDest: TCheckBox
            AlignWithMargins = True
            Left = 488
            Top = 3
            Width = 234
            Height = 21
            Align = alLeft
            Caption = 'Destinat'#225'rio diferente do Tomador/Prestador'
            TabOrder = 0
            OnClick = ckIndDestClick
          end
          inline ComboBoxMunicipiosFrame1: TComboBoxMunicipiosFrame
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 321
            Height = 21
            Align = alLeft
            TabOrder = 1
            TabStop = True
            ExplicitLeft = 161
            ExplicitTop = 3
            ExplicitWidth = 321
            ExplicitHeight = 21
            inherited edMunicipios: TComboBox
              Width = 321
              ExplicitWidth = 321
            end
            inherited pnInfo: TPanel
              Top = 5
              Width = 321
              ExplicitTop = 5
              ExplicitWidth = 321
            end
          end
        end
        object pageParticipantes: TPageControl
          Left = 0
          Top = 66
          Width = 815
          Height = 207
          ActivePage = tabPartPrincipal
          Align = alClient
          Style = tsFlatButtons
          TabOrder = 1
          object tabPartPrincipal: TTabSheet
            Caption = '  Tomador  '
            inline DPSPartPrincipalFrame1: TNFSeParticipanteFrame
              Left = 0
              Top = 25
              Width = 807
              Height = 132
              Align = alTop
              Enabled = False
              TabOrder = 0
              TabStop = True
              ExplicitTop = 25
              ExplicitWidth = 807
              inherited pnContentPart: TPanel
                Width = 807
                ExplicitWidth = 807
                inherited Panel13: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
                inherited Panel1: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
                inherited Panel3: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
                inherited Panel2: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
              end
            end
            object pnLinksTomador: TPanel
              Left = 0
              Top = 0
              Width = 807
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object linkPesquisarPartPrincipal: TLabel
                AlignWithMargins = True
                Left = 18
                Top = 0
                Width = 109
                Height = 25
                Cursor = crHandPoint
                Margins.Left = 18
                Margins.Top = 0
                Margins.Right = 9
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Pesquisar Tomador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                OnClick = linkPesquisarPartPrincipalClick
                ExplicitHeight = 13
              end
              object linkRemoverPartPrincipal: TLabel
                AlignWithMargins = True
                Left = 145
                Top = 0
                Width = 106
                Height = 25
                Cursor = crHandPoint
                Margins.Left = 9
                Margins.Top = 0
                Margins.Right = 9
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Remover Tomador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                OnClick = linkRemoverPartPrincipalClick
                ExplicitHeight = 13
              end
            end
          end
          object tabIntermediario: TTabSheet
            Caption = '  Intermedi'#225'rio  '
            ImageIndex = 1
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 807
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object linkPesquisarIntermediario: TLabel
                AlignWithMargins = True
                Left = 18
                Top = 0
                Width = 137
                Height = 25
                Cursor = crHandPoint
                Margins.Left = 18
                Margins.Top = 0
                Margins.Right = 9
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Pesquisar Intermedi'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                OnClick = linkPesquisarPartPrincipalClick
                ExplicitHeight = 13
              end
              object linkRemoverIntermediario: TLabel
                AlignWithMargins = True
                Left = 173
                Top = 0
                Width = 134
                Height = 25
                Cursor = crHandPoint
                Margins.Left = 9
                Margins.Top = 0
                Margins.Right = 9
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Remover Intermedi'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                OnClick = linkRemoverPartPrincipalClick
                ExplicitHeight = 13
              end
            end
            inline DPSIntermediarioFrame1: TNFSeParticipanteFrame
              Left = 0
              Top = 25
              Width = 807
              Height = 132
              Align = alTop
              Enabled = False
              TabOrder = 1
              TabStop = True
              ExplicitTop = 25
              ExplicitWidth = 807
              inherited pnContentPart: TPanel
                Width = 807
                ExplicitWidth = 807
                inherited Panel13: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
                inherited Panel1: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
                inherited Panel3: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
                inherited Panel2: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
              end
            end
          end
          object tabDestIbsCbs: TTabSheet
            Caption = '  Destinat'#225'rio IBSCBS  '
            ImageIndex = 2
            object Panel16: TPanel
              Left = 0
              Top = 0
              Width = 807
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object linkPesquisarDestIbsCbs: TLabel
                AlignWithMargins = True
                Left = 18
                Top = 0
                Width = 128
                Height = 25
                Cursor = crHandPoint
                Margins.Left = 18
                Margins.Top = 0
                Margins.Right = 9
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Pesquisar Destinat'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                OnClick = linkPesquisarPartPrincipalClick
                ExplicitHeight = 13
              end
              object linkRemoverDestIbcCbs: TLabel
                AlignWithMargins = True
                Left = 164
                Top = 0
                Width = 125
                Height = 25
                Cursor = crHandPoint
                Margins.Left = 9
                Margins.Top = 0
                Margins.Right = 9
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Remover Destinat'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                OnClick = linkRemoverPartPrincipalClick
                ExplicitHeight = 13
              end
            end
            inline DPSDestIbsCbsFrame1: TNFSeParticipanteFrame
              Left = 0
              Top = 25
              Width = 807
              Height = 132
              Align = alTop
              Enabled = False
              TabOrder = 1
              TabStop = True
              ExplicitTop = 25
              ExplicitWidth = 807
              inherited pnContentPart: TPanel
                Width = 807
                ExplicitWidth = 807
                inherited Panel13: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
                inherited Panel1: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
                inherited Panel3: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
                inherited Panel2: TPanel
                  Width = 801
                  ExplicitWidth = 801
                end
              end
            end
          end
        end
        object PanelIbsCbsNac2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 36
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label36: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 152
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tp Opr GOV'
            Layout = tlCenter
          end
          object Label35: TLabel
            AlignWithMargins = True
            Left = 485
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tipo ente GOV'
            Layout = tlCenter
            ExplicitLeft = 158
          end
          object edTpFornecimento: TComboBox
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 318
            Height = 21
            Align = alLeft
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 4
            TabOrder = 0
            Text = '5 '#8211' Fornecimento e pagamento simult'#226'neos'
            Items.Strings = (
              '1 '#8211' Fornecimento antes do pagamento'
              '2 '#8211' Pagamento ap'#243's fornecimento'
              '3 '#8211' Fornecimento ap'#243's pagamento'
              '4 '#8211' Pagamento antes do fornecimento'
              '5 '#8211' Fornecimento e pagamento simult'#226'neos')
          end
          object edTipoEnteGov: TComboBox
            AlignWithMargins = True
            Left = 566
            Top = 3
            Width = 156
            Height = 21
            Align = alLeft
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Text = '3 - Distrito Federal'
            Items.Strings = (
              '3 - Distrito Federal')
          end
        end
      end
      object tabServ: TTabSheet
        Caption = '  Servi'#231'os  '
        ImageIndex = 2
        object PanelServicos1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label13: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 71
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'C'#243'digo servi'#231'o'
            Layout = tlCenter
          end
          object btPesquisarServico: TSpeedButton
            AlignWithMargins = True
            Left = 646
            Top = 2
            Width = 23
            Height = 23
            Cursor = crHandPoint
            Hint = 'Consultar no Servi'#231'os'
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alLeft
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
            OnClick = btPesquisarServicoClick
            ExplicitLeft = 615
          end
          object linkCorrelacao1: TLabel
            AlignWithMargins = True
            Left = 675
            Top = 3
            Width = 101
            Height = 21
            Cursor = crHandPoint
            Align = alLeft
            Caption = 'Consultar C'#243'digos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            OnClick = linkCorrelacao1Click
            ExplicitHeight = 13
          end
          object edCodServico2: TMaskEdit
            AlignWithMargins = True
            Left = 80
            Top = 3
            Width = 560
            Height = 21
            TabStop = False
            Align = alLeft
            ReadOnly = True
            TabOrder = 0
          end
        end
        object PanelServicos3: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 69
          Width = 809
          Height = 201
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label14: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 71
            Height = 195
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Discrimina'#231#227'o dos servi'#231'os'
            WordWrap = True
            ExplicitHeight = 48
          end
          object edDiscriminacao: TMemo
            AlignWithMargins = True
            Left = 80
            Top = 3
            Width = 723
            Height = 195
            Align = alLeft
            Lines.Strings = (
              'Memo1')
            TabOrder = 0
          end
        end
        object PanelServicos2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 36
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label39: TLabel
            AlignWithMargins = True
            Left = 160
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Cod LC 116'
            Layout = tlCenter
            ExplicitLeft = 164
          end
          object Label52: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 71
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'CNAE Servi'#231'o'
            Layout = tlCenter
          end
          object Label10: TLabel
            AlignWithMargins = True
            Left = 322
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'CTrib Nacional'
            Layout = tlCenter
            ExplicitLeft = 321
          end
          object Label11: TLabel
            AlignWithMargins = True
            Left = 484
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'CTrib Municipal'
            Layout = tlCenter
            ExplicitLeft = 478
          end
          object Label12: TLabel
            AlignWithMargins = True
            Left = 646
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'NBS'
            Layout = tlCenter
            ExplicitLeft = 605
            ExplicitTop = 0
            ExplicitHeight = 27
          end
          object edCcnae: TMaskEdit
            AlignWithMargins = True
            Left = 80
            Top = 3
            Width = 74
            Height = 21
            Align = alLeft
            EditMask = '0000-0/00;0;_'
            MaxLength = 9
            ReadOnly = True
            TabOrder = 0
          end
          object edClc116: TMaskEdit
            AlignWithMargins = True
            Left = 241
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            ReadOnly = True
            TabOrder = 1
          end
          object edCTribNac: TMaskEdit
            AlignWithMargins = True
            Left = 403
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            EditMask = '99.99.99;0;_'
            MaxLength = 8
            ReadOnly = True
            TabOrder = 2
          end
          object edCTribMun: TMaskEdit
            AlignWithMargins = True
            Left = 565
            Top = 3
            Width = 75
            Height = 21
            Hint = 'Informe parte da descri'#231#227'o do NCM para localizar'
            Align = alLeft
            EditMask = '999;0;_'
            MaxLength = 3
            ReadOnly = True
            TabOrder = 3
          end
          object edCNBS: TMaskEdit
            AlignWithMargins = True
            Left = 727
            Top = 3
            Width = 75
            Height = 21
            Hint = 'Informe parte da descri'#231#227'o do NCM para localizar'
            Align = alLeft
            EditMask = '9.9999.99.99;0;_'
            MaxLength = 12
            ReadOnly = True
            TabOrder = 4
          end
        end
      end
      object tabValores: TTabSheet
        Caption = '  Valores  '
        ImageIndex = 3
        object pageValores: TPageControl
          AlignWithMargins = True
          Left = 0
          Top = 36
          Width = 815
          Height = 234
          Margins.Left = 0
          Margins.Right = 0
          ActivePage = tabRetencoes
          Align = alClient
          Style = tsFlatButtons
          TabOrder = 0
          object tabISS: TTabSheet
            Caption = '     ISSQN     '
            object Panel10: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 801
              Height = 27
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label25: TLabel
                AlignWithMargins = True
                Left = 320
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Al'#237'quota'
                Layout = tlCenter
                ExplicitLeft = 164
              end
              object Label26: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 68
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Tributa'#231#227'o'
                Layout = tlCenter
              end
              object Label27: TLabel
                AlignWithMargins = True
                Left = 482
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Base c'#225'lculo'
                Layout = tlCenter
                ExplicitLeft = 489
              end
              object Label28: TLabel
                AlignWithMargins = True
                Left = 644
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor ISS'
                Layout = tlCenter
                ExplicitLeft = 651
              end
              object edIssPAliq: TEditHw
                AlignWithMargins = True
                Left = 401
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 1
                Text = '0,00'
                OnExit = edIssPAliqExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edTribISSQN: TComboBox
                AlignWithMargins = True
                Left = 77
                Top = 3
                Width = 237
                Height = 21
                Align = alLeft
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = '3 - Exporta'#231#227'o de servi'#231'o'
                OnExit = edTribISSQNExit
                Items.Strings = (
                  '3 - Exporta'#231#227'o de servi'#231'o')
              end
              object edIssVBCISS: TEditHw
                AlignWithMargins = True
                Left = 563
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 2
                Text = '0,00'
                OnExit = edIssVBCISSExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edVISS: TEditHw
                AlignWithMargins = True
                Left = 725
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 3
                Text = '0,00'
                OnExit = edVISSExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
            end
          end
          object tabPISCOFINS: TTabSheet
            Caption = '     PISCOFINS      '
            ImageIndex = 1
            object Panel9: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 801
              Height = 27
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label19: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 68
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'CST'
                Layout = tlCenter
              end
              object Label20: TLabel
                AlignWithMargins = True
                Left = 111
                Top = 3
                Width = 60
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Base c'#225'lculo'
                Layout = tlCenter
              end
              object Label21: TLabel
                AlignWithMargins = True
                Left = 258
                Top = 3
                Width = 56
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Aliq PIS'
                Layout = tlCenter
              end
              object Label22: TLabel
                AlignWithMargins = True
                Left = 376
                Top = 3
                Width = 60
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Aliq COFINS'
                Layout = tlCenter
                ExplicitLeft = 481
              end
              object Label23: TLabel
                AlignWithMargins = True
                Left = 498
                Top = 3
                Width = 59
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor PIS'
                Layout = tlCenter
              end
              object Label24: TLabel
                AlignWithMargins = True
                Left = 644
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor COFINS'
                Layout = tlCenter
                ExplicitLeft = 647
                ExplicitTop = 11
              end
              object edpc_CST: TMaskEdit
                AlignWithMargins = True
                Left = 77
                Top = 3
                Width = 28
                Height = 21
                Align = alLeft
                EditMask = '99;0;_'
                MaxLength = 2
                TabOrder = 0
              end
              object edpc_vbc: TEditHw
                AlignWithMargins = True
                Left = 177
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 1
                Text = '0,00'
                OnExit = edpc_vbcExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edpc_ppis: TEditHw
                AlignWithMargins = True
                Left = 320
                Top = 3
                Width = 50
                Height = 21
                Align = alLeft
                TabOrder = 2
                Text = '0,00'
                OnExit = edpc_ppisExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edpc_pcofins: TEditHw
                AlignWithMargins = True
                Left = 442
                Top = 3
                Width = 50
                Height = 21
                Align = alLeft
                TabOrder = 3
                Text = '0,00'
                OnExit = edpc_pcofinsExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edpc_vpis: TEditHw
                AlignWithMargins = True
                Left = 563
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 4
                Text = '0,00'
                OnExit = edpc_vpisExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edpc_vcofins: TEditHw
                AlignWithMargins = True
                Left = 725
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 5
                Text = '0,00'
                OnExit = edpc_vcofinsExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
            end
          end
          object tabRetencoes: TTabSheet
            Caption = '    Reten'#231#245'es    '
            ImageIndex = 3
            ExplicitLeft = 3
            object Panel11: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 69
              Width = 801
              Height = 27
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Label17: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 68
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor IRRF'
                Layout = tlCenter
              end
              object Label18: TLabel
                AlignWithMargins = True
                Left = 158
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor CSLL'
                Layout = tlCenter
                ExplicitLeft = 164
              end
              object Label40: TLabel
                AlignWithMargins = True
                Left = 320
                Top = 3
                Width = 75
                Height = 21
                Hint = 'Valor de reten'#231#227'o da Contribui'#231#227'o Previdenci'#225'ria'
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor CP'
                Layout = tlCenter
                ExplicitLeft = 164
              end
              object Label58: TLabel
                AlignWithMargins = True
                Left = 482
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor PIS'
                Layout = tlCenter
                ExplicitLeft = 164
              end
              object Label62: TLabel
                AlignWithMargins = True
                Left = 644
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Valor COFINS'
                Layout = tlCenter
                ExplicitLeft = 629
                ExplicitTop = 0
              end
              object edret_virrf: TEditHw
                AlignWithMargins = True
                Left = 77
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 0
                Text = '0,00'
                OnExit = edret_virrfExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edret_vcsll: TEditHw
                AlignWithMargins = True
                Left = 239
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 1
                Text = '0,00'
                OnExit = edret_virrfExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edret_vcp: TEditHw
                AlignWithMargins = True
                Left = 401
                Top = 3
                Width = 75
                Height = 21
                Hint = 'Valor de reten'#231#227'o da Contribui'#231#227'o Previdenci'#225'ria'
                Align = alLeft
                TabOrder = 2
                Text = '0,00'
                OnExit = edret_virrfExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edret_vpis: TEditHw
                AlignWithMargins = True
                Left = 563
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 3
                Text = '0,00'
                OnExit = edret_virrfExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
                ExplicitTop = -5
              end
              object edret_vcofins: TEditHw
                AlignWithMargins = True
                Left = 725
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 4
                Text = '0,00'
                OnExit = edret_virrfExit
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
            end
            object pnRetencoesComboNacional: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 801
              Height = 27
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label55: TLabel
                AlignWithMargins = True
                Left = 319
                Top = 3
                Width = 237
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Reten'#231#227'o PISCOFINS'
                Layout = tlCenter
                ExplicitLeft = 238
              end
              object Label7: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 67
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Reten'#231#227'o ISS'
                Layout = tlCenter
              end
              object edRetPISCOFINS: TComboBox
                AlignWithMargins = True
                Left = 562
                Top = 3
                Width = 237
                Height = 21
                Align = alLeft
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 1
                Text = '3 - PIS Retido/COFINS N'#227'o Retido'
                OnExit = edRetPISCOFINSExit
                Items.Strings = (
                  '3 - PIS Retido/COFINS N'#227'o Retido')
              end
              object edRetIss: TComboBox
                AlignWithMargins = True
                Left = 76
                Top = 3
                Width = 237
                Height = 21
                Align = alLeft
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = '3 - Retido pelo Intermediario'
                OnExit = edRetIssExit
                Items.Strings = (
                  '3 - Retido pelo Intermediario')
              end
            end
            object Panel18: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 36
              Width = 801
              Height = 27
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 2
              object ckRetIss: TCheckBox
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Caption = 'ISS Retido'
                TabOrder = 0
                OnClick = ckRetIssClick
                ExplicitLeft = 130
              end
            end
          end
          object tabTotTrib: TTabSheet
            Caption = '    Total de tributos aproximados    '
            ImageIndex = 4
            object Panel12: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 801
              Height = 27
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label29: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 68
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = '% Federal'
                Layout = tlCenter
              end
              object Label30: TLabel
                AlignWithMargins = True
                Left = 158
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = '% Estadual'
                Layout = tlCenter
                ExplicitLeft = 164
              end
              object Label31: TLabel
                AlignWithMargins = True
                Left = 320
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = '% Municipal'
                Layout = tlCenter
                ExplicitLeft = 164
              end
              object Label32: TLabel
                AlignWithMargins = True
                Left = 644
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                Alignment = taRightJustify
                AutoSize = False
                Caption = '% Total'
                Layout = tlCenter
              end
              object edvtrib_pfed: TEditHw
                AlignWithMargins = True
                Left = 77
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 0
                Text = '0,00'
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edvtrib_pest: TEditHw
                AlignWithMargins = True
                Left = 239
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 1
                Text = '0,00'
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edvtrib_pmun: TEditHw
                AlignWithMargins = True
                Left = 401
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 2
                Text = '0,00'
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
              object edvtrib_indtot: TCheckBox
                AlignWithMargins = True
                Left = 482
                Top = 3
                Width = 156
                Height = 21
                Align = alLeft
                Caption = 'Informar % Trib Aproximados'
                TabOrder = 3
                OnClick = edvtrib_indtotClick
              end
              object edvtrib_ptot: TEditHw
                AlignWithMargins = True
                Left = 725
                Top = 3
                Width = 75
                Height = 21
                Align = alLeft
                TabOrder = 4
                Text = '0,00'
                Formato = fNumber
                FormatSize = '0.2'
                Nullable = True
              end
            end
          end
        end
        object PanelValores1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label15: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 71
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Valor servi'#231'os'
            Layout = tlCenter
          end
          object Label16: TLabel
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Desconto'
            Layout = tlCenter
            ExplicitLeft = 164
          end
          object edVServ2: TEditHw
            AlignWithMargins = True
            Left = 80
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '0,00'
            OnExit = edVServ2Exit
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
          object edVDesc2: TEditHw
            AlignWithMargins = True
            Left = 242
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 1
            Text = '0,00'
            OnExit = edVDesc2Exit
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
          object Panel23: TPanel
            Left = 320
            Top = 0
            Width = 402
            Height = 27
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 2
            object linkInformarTribManual: TLabel
              AlignWithMargins = True
              Left = 18
              Top = 0
              Width = 193
              Height = 27
              Cursor = crHandPoint
              Margins.Left = 18
              Margins.Top = 0
              Margins.Right = 9
              Margins.Bottom = 0
              Align = alLeft
              Caption = '  Informar tributos manualmente  '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              OnClick = linkInformarTribManualClick
              ExplicitHeight = 13
            end
          end
        end
      end
      object tabSubst: TTabSheet
        Caption = '    NFSe Substitu'#237'da    '
        ImageIndex = 4
        object PanelNFSeSubst1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 71
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'NFSe Subst'
            Layout = tlCenter
          end
          object Label4: TLabel
            AlignWithMargins = True
            Left = 485
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Motivo'
            Layout = tlCenter
          end
          object edSubChave: TMaskEdit
            AlignWithMargins = True
            Left = 80
            Top = 3
            Width = 399
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '12345678901234567890123456789012345678901234567890'
          end
          object edSubCMotivo: TComboBox
            AlignWithMargins = True
            Left = 566
            Top = 3
            Width = 237
            Height = 21
            Align = alLeft
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
          end
        end
        object PanelNFSeSubst2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 36
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label8: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 71
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Justificativa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4210816
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object edSubXMotivo: TMaskEdit
            AlignWithMargins = True
            Left = 80
            Top = 3
            Width = 723
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '12345678901234567890123456789012345678901234567890'
          end
        end
        object PanelNFSeSubst3: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 69
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label56: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 71
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'S'#233'rie'
            Layout = tlCenter
          end
          object Label59: TLabel
            AlignWithMargins = True
            Left = 161
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'N'#250'mero DPS'
            Layout = tlCenter
            ExplicitLeft = 164
          end
          object Label61: TLabel
            AlignWithMargins = True
            Left = 323
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'N'#250'mero NFS-e'
            Layout = tlCenter
            ExplicitLeft = 164
          end
          object Label64: TLabel
            AlignWithMargins = True
            Left = 485
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Num Lote'
            Layout = tlCenter
          end
          object Label65: TLabel
            AlignWithMargins = True
            Left = 647
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Cd Verifica'#231#227'o'
            Layout = tlCenter
            ExplicitLeft = 632
            ExplicitTop = 11
          end
          object edSubSerie: TMaskEdit
            AlignWithMargins = True
            Left = 80
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 0
          end
          object edSubNDps: TEditHw
            AlignWithMargins = True
            Left = 242
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 1
            Text = '0'
            OnExit = edVServ2Exit
            Formato = fInteger
            FormatSize = '0.2'
            Nullable = True
          end
          object edSubNNFSe: TEditHw
            AlignWithMargins = True
            Left = 404
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 2
            Text = '????????'
            OnExit = edVServ2Exit
            Formato = fInteger
            FormatSize = '0.2'
            Nullable = True
          end
          object edSubNLote: TMaskEdit
            AlignWithMargins = True
            Left = 566
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 3
          end
          object edSubCVerificacao: TMaskEdit
            AlignWithMargins = True
            Left = 728
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 4
          end
        end
      end
      object tabIbsCbsNac: TTabSheet
        Caption = '    IBSCBS    '
        ImageIndex = 5
        object PanelIbsCbsNac3: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbRegraIbsCbsNacCaption: TLabel
            AlignWithMargins = True
            Left = 157
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Regra Fiscal'
            Layout = tlCenter
          end
          object Label54: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 67
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tipo Regra'
            Layout = tlCenter
          end
          object pnRegraIbsCbsNac: TPanel
            Left = 235
            Top = 0
            Width = 405
            Height = 27
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            inline ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 399
              Height = 37
              Align = alTop
              TabOrder = 0
              TabStop = True
              ExplicitLeft = 3
              ExplicitTop = 3
              ExplicitWidth = 399
              inherited pnVigencia: TPanel
                Width = 399
                ExplicitWidth = 399
              end
              inherited pnRegras: TPanel
                Width = 399
                ExplicitWidth = 399
                inherited btDetalhes: TSpeedButton
                  Left = 377
                  ExplicitLeft = 377
                end
                inherited edRegrasFiscais: TComboBox
                  Width = 374
                  ExplicitWidth = 374
                end
              end
            end
          end
          object edTipoRegra: TComboBox
            AlignWithMargins = True
            Left = 76
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Text = '0-Regular'
            Items.Strings = (
              '0-Regular')
          end
        end
        object PanelIbsCbsNac4: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 36
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label38: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 67
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'CST'
            Layout = tlCenter
          end
          object Label41: TLabel
            AlignWithMargins = True
            Left = 157
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'cClassTrib'
            Layout = tlCenter
            ExplicitLeft = 128
            ExplicitTop = 9
          end
          object Label42: TLabel
            AlignWithMargins = True
            Left = 319
            Top = 3
            Width = 237
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tributa'#231#227'o Regular > CST'
            Layout = tlCenter
          end
          object Label43: TLabel
            AlignWithMargins = True
            Left = 643
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'cClassTrib'
            Layout = tlCenter
            ExplicitLeft = 527
            ExplicitTop = 6
          end
          object edCClassTrib: TMaskEdit
            AlignWithMargins = True
            Left = 238
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            EditMask = '000-000;0;_'
            MaxLength = 7
            TabOrder = 1
          end
          object edCClassTribReg: TMaskEdit
            AlignWithMargins = True
            Left = 724
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            EditMask = '000-000;0;_'
            MaxLength = 7
            TabOrder = 3
          end
          object edCST: TMaskEdit
            AlignWithMargins = True
            Left = 76
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            EditMask = '000;0;_'
            MaxLength = 3
            TabOrder = 0
          end
          object edCSTReg: TMaskEdit
            AlignWithMargins = True
            Left = 562
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            EditMask = '000;0;_'
            MaxLength = 3
            TabOrder = 2
          end
        end
        object PanelIbsCbsNac5: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 69
          Width = 809
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label44: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 67
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = '% Dif IBS UF'
            Layout = tlCenter
          end
          object Label46: TLabel
            AlignWithMargins = True
            Left = 157
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = '% Dif IBS Mun'
            Layout = tlCenter
            ExplicitLeft = 489
          end
          object Label47: TLabel
            AlignWithMargins = True
            Left = 319
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = '% Dif CBS'
            Layout = tlCenter
            ExplicitLeft = 342
            ExplicitTop = 11
          end
          object edPDifIbsUF: TEditHw
            AlignWithMargins = True
            Left = 76
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '0,00'
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
          object edPDifIbsMun: TEditHw
            AlignWithMargins = True
            Left = 238
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 1
            Text = '0,00'
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
          object edPDifCbs: TEditHw
            AlignWithMargins = True
            Left = 400
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 2
            Text = '0,00'
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
        end
      end
      object tabIbsCbsValores: TTabSheet
        Caption = '    Valores IBSCBS    '
        ImageIndex = 6
        inline NFSeTributosDFeFrame1: TNFSeTributosDFeFrame
          Left = 0
          Top = 0
          Width = 663
          Height = 278
          TabOrder = 0
          TabStop = True
          inherited pageGrupos: TPageControl
            inherited tsGIbsCbs: TTabSheet
              inherited TribDFeIbsCbsGrupoFrame1: TTribDFeIbsCbsGrupoFrame
                inherited PageControl1: TPageControl
                  inherited tabIbsCbs: TTabSheet
                    ExplicitLeft = 4
                    ExplicitTop = 27
                    ExplicitWidth = 652
                    ExplicitHeight = 162
                  end
                  inherited TabSheet2: TTabSheet
                    ExplicitLeft = 4
                    ExplicitTop = 27
                    ExplicitWidth = 652
                    ExplicitHeight = 162
                  end
                  inherited TabSheet3: TTabSheet
                    ExplicitLeft = 4
                    ExplicitTop = 27
                    ExplicitWidth = 652
                    ExplicitHeight = 162
                  end
                end
              end
            end
          end
        end
      end
    end
    object pnTopResumo: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 817
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label45: TLabel
        AlignWithMargins = True
        Left = 114
        Top = 3
        Width = 55
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'DH Emiss'#227'o'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbNumDpsRps: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Num DPS'
        Layout = tlCenter
        ExplicitTop = 6
        ExplicitHeight = 40
      end
      object lbSerieDps: TLabel
        AlignWithMargins = True
        Left = 84
        Top = 3
        Width = 18
        Height = 21
        Margins.Right = 9
        Align = alLeft
        Caption = '?/?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbDhemi: TLabel
        AlignWithMargins = True
        Left = 175
        Top = 3
        Width = 6
        Height = 21
        Margins.Right = 9
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbSituacao: TLabel
        AlignWithMargins = True
        Left = 504
        Top = 3
        Width = 55
        Height = 21
        Margins.Right = 9
        Align = alLeft
        Caption = 'Rascunho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label51: TLabel
        AlignWithMargins = True
        Left = 457
        Top = 3
        Width = 41
        Height = 21
        Hint = 'Data da presta'#231#227'o do servi'#231'o'
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label48: TLabel
        AlignWithMargins = True
        Left = 193
        Top = 3
        Width = 33
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'Layout'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbLayout: TLabel
        AlignWithMargins = True
        Left = 232
        Top = 3
        Width = 49
        Height = 21
        Margins.Right = 9
        Align = alLeft
        Caption = 'lbLayout'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label57: TLabel
        AlignWithMargins = True
        Left = 293
        Top = 3
        Width = 85
        Height = 21
        Hint = 'Data da presta'#231#227'o do servi'#231'o'
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'Natureza Emiss'#227'o'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbNaturezaEmissao: TLabel
        AlignWithMargins = True
        Left = 384
        Top = 3
        Width = 61
        Height = 21
        Margins.Right = 9
        Align = alLeft
        Caption = 'lbNatureza'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
  end
end
