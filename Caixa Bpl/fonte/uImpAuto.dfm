inherited frmImpAuto: TfrmImpAuto
  Caption = 'Processamento de pagamentos para o Financeiro'
  ClientHeight = 574
  ClientWidth = 1032
  KeyPreview = True
  Scaled = False
  OnClose = FormClose
  ExplicitWidth = 1040
  ExplicitHeight = 608
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 14
    Top = 8
    Width = 768
    Height = 560
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object pgcImpAuto: TPageControl
      Left = 0
      Top = 0
      Width = 764
      Height = 554
      ActivePage = tsProcessamento
      Align = alTop
      Style = tsFlatButtons
      TabOrder = 0
      object tsProcessamento: TTabSheet
        Caption = 'Processamento'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 756
          Height = 64
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Top = 6
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Inicial'
          end
          object Label2: TLabel
            Left = 144
            Top = 5
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Final'
          end
          object Label15: TLabel
            Left = 279
            Top = 6
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operador'
          end
          object Label10: TLabel
            Left = 378
            Top = 5
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unificada'
          end
          object edDataIni: TMaskEdit
            Left = 61
            Top = 2
            Width = 74
            Height = 21
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 0
            Text = '  /  /    '
          end
          object edDataFim: TMaskEdit
            Left = 196
            Top = 2
            Width = 75
            Height = 21
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
          end
          object btOK: TBitBtn
            Left = 592
            Top = 4
            Width = 75
            Height = 25
            Hint = 'OK - [IMPFIN014]'
            Caption = '&OK'
            TabOrder = 5
            OnClick = btOKClick
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
          object btSair: TBitBtn
            Left = 673
            Top = 4
            Width = 75
            Height = 25
            Hint = 'Sair desta tela'
            Cancel = True
            Caption = '&Sair'
            ModalResult = 2
            TabOrder = 6
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
          end
          object edOperador: TEditHw
            Left = 328
            Top = 2
            Width = 42
            Height = 21
            TabOrder = 2
            Text = '         0'
            Formato = fInteger
            FormatSize = '0.0'
          end
          object edCodigoUnificada: TEditHw
            Left = 427
            Top = 2
            Width = 42
            Height = 21
            TabOrder = 3
            Text = '         0'
            Formato = fInteger
            FormatSize = '0.0'
          end
          object rbRadioGroupRecFinanc: TRadioGroup
            Left = 0
            Top = 29
            Width = 752
            Height = 31
            Align = alBottom
            Caption = 'Tipo de Documento'
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              'Todos Documentos'
              'Documentos Recebidos pelo Caixa'
              'Documentos Recebidos pelo Financeiro')
            TabOrder = 4
            OnClick = rbRadioGroupRecFinancClick
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 64
          Width = 756
          Height = 252
          Align = alClient
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 0
            Top = 25
            Width = 752
            Height = 189
            Align = alClient
            DataSource = dtmImportPDVFinan.dsFPG
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnColExit = DBGrid1ColExit
            OnDrawColumnCell = DBGrid1DrawColumnCell
            OnDblClick = DBGrid1DblClick
            OnKeyDown = DBGrid1KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'SEL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_CONTA_PLC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPDOC'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TPDOCS'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NREQUISICAO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NDOC'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_REC_DEP'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_REC_PARC'
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HISTORICO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORDOC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_MOV'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_VENC'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_CONTROLE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CLIENTE'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_CLIENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_BANCO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TERCEIROS'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OPERADOR'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIP_CNT'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OP_CXL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_PROCESSAMENTO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRCSS'
                Visible = True
              end>
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 752
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Documentos do Per'#237'odo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object btSelectAll: TSpeedButton
              Left = 537
              Top = 0
              Width = 23
              Height = 21
              Hint = '[ F2 ] - Selecionar todos'
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
            object btUnSelectAll: TSpeedButton
              Left = 566
              Top = 0
              Width = 23
              Height = 21
              Hint = '[ F3 ] - Desfazer sele'#231#227'o'
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
            object Label4: TLabel
              Left = 3
              Top = 4
              Width = 211
              Height = 13
              Caption = 'Favor definir a conta correspondente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Panel16: TPanel
              Left = 725
              Top = 0
              Width = 27
              Height = 25
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object imgInformation: TImage
                Left = 0
                Top = 0
                Width = 24
                Height = 25
                Cursor = crHelp
                Align = alLeft
                Picture.Data = {
                  055449636F6E0000010001001818000001002000880900001600000028000000
                  1800000030000000010020000000000060090000000000000000000000000000
                  00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                  FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                  FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                  FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000021
                  0000002700000000000000000000000000000000000000000000000000000000
                  FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000023170B0088
                  27150286060400080E0700000F0800000F0800000F0800000F0800000F080000
                  FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                  000000000000000000000000000000000000000604000050492A0CC3BE9263FF
                  B4895BEE5D2F0033492702004122010041220100412201004222010042220100
                  FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                  0000000400000022000000450200005F1F0C0097774F26EBE0B98EFFFFECCBFF
                  C29667E0502700210A0600000000000000000000000000000000000000000000
                  FFFFFF00FFFFFF0003010000010000000000000000000000000000000000002A
                  150800844B2B0ACB805931ED9B754DF7BF986DFFEFCEA7FFFFE9CBFFFFE5C2FF
                  996F44E20000003A000000000000000000000000020100000301000003010000
                  FFFFFF00FFFFFF00030100000100000000000000000000040700005A573715CF
                  BC9468FFF5D8B7FFFFE7C8FFFFE8C8FFFFECCEFFFFEED2FFFFECCEFFFFE5C5FF
                  C8A176FF5E3D1BD70E0300730000000F00000000020100000301000003010000
                  FFFFFF00FFFFFF0003010000000000000000000D1A0A007F8A6337EFEFD1AFFF
                  FFF1DAFFFFEAD0FFFFE8CDFFFFE9CFFFF2D2B6FFBF7855FFE0B293FFFFEACEFF
                  FFEDD1FFF7D8B4FFAB8255FA2D17019F0000001B010000000301000003010000
                  FFFFFF00FFFFFF00010000000000000425100086A07446FCFBE2C6FFFFF4DFFF
                  FFEAD3FFFFEAD2FFFFEAD1FFFFEED6FFDDB296FF962300FF9A3109FFDDAF91FF
                  FFEDD2FFFFEBD0FFFFEED0FFCEA67AFF3B2004A5000000110201000003010000
                  FFFFFF00FFFFFF00000000031508004F956636F9ECD3B5FFFFF5E3FFFFEDD9FF
                  FFECD8FFFFECD7FFFFEBD6FFFFEFD9FFE8C7AEFF992B00FFA64C26FFA6502CFF
                  E9C5AAFFFFECD3FFFFEAD1FFFFF2D8FFCBA479FF291302800000000003010000
                  FFFFFF00FFFFFF0017090031623B11BBCEAB84FFF6E5D2FFFFF2E2FFFFEFDEFF
                  FFEFDCFFFFEEDCFFFFEEDBFFFFEFDCFFF7E1CDFF9F370AFFC5805AFFD6AB92FF
                  E6C5ACFFFFEED7FFFFEAD2FFFFEBD4FFFFEED5FFA0784DF00D05003600000000
                  FFFFFF00FFFFFF0046270772936A3FE9D7B998FFFEF1E3FFFFF3E4FFFFF2E3FF
                  FFF1E2FFFFF1E0FFFFF1E0FFFFF1E0FFFDEDDCFFC06F3FFFC97B49FFF9E5D2FF
                  FFF8E5FFFFECD9FFFFEDD7FFFFECD6FFFFF0DBFFF2D7B9FF4E2D0B9C0A00001A
                  FFFFFF00FFFFFF00673C0E98A88157F6D8BD9EFFFFF6EBFFFFF5E9FFFFF4E7FF
                  FFF3E6FFFFF3E5FFFFF2E4FFFFF5E6FFFCF1E5FFD9A079FFD88543FFF4DAC4FF
                  FFF5E6FFFFEFDFFFFFEFDDFFFFEEDCFFFFEEDCFFFFF3DDFF99754EDA321B0454
                  FFFFFF00FFFFFF007946109EB1895EF8D9BD9EFFFCF3E8FFFFF7EEFFFFF6ECFF
                  FFF6ECFFFFF5EAFFFFF8EDFFF6E7D9FFC58C72FFD5A587FFD47B32FFEFD0B5FF
                  FFF6EBFFFFF2E3FFFFF1E2FFFFF1E1FFFFF1E1FFFFF7E6FFC4A98CF1613C148C
                  FFFFFF00FFFFFF007D480E87AE8456EFD6B997FFF4E8DBFFFFFCF6FFFFF8F0FF
                  FFF8EFFFFFF8EFFFFFF9F0FFFAF5ECFFBD7D62FFA84E22FFC15F1EFFDAA889FF
                  FEF5ECFFFFF5E9FFFFF4E7FFFFF4E6FFFFF3E6FFFFFBEFFFDCC5ACFA855422A2
                  FFFFFF00FFFFFF00743E05479A6934D5D5B38EFFEAD8C3FFFFFEFAFFFFFAF5FF
                  FFFAF3FFFFF9F4FFFFF9F2FFFFFCF5FFFAF3ECFFBC7B5EFFA73D08FFC07D5CFF
                  FEF7EEFFFFF7EEFFFFF6ECFFFFF6ECFFFFF5EBFFFFFDF4FFDAC4ACF78554229B
                  FFFFFF00FFFFFF006B34000E82490C89CDA87FFFE2C6A7FFFAF2EAFFFFFEFBFF
                  FFFCF8FFFFFBF7FFFFFBF7FFFFFAF6FFFFFFFAFFFDF9F3FFDAB6A8FFE6CCC1FF
                  FFFAF5FFFFFAF3FFFFF8F0FFFFF8F1FFFFF8F0FFFFFCF5FFC7A98CEA82501B79
                  FFFFFF00FFFFFF007C4203007D410017A26F39E2E3C4A1FFEFDAC0FFFEFCF9FF
                  FFFEFDFFFFFDFAFFFFFDFAFFFFFCF9FFFFFBF8FFFFFFFFFFF1E1DBFFD6AFA0FF
                  FCF6F0FFFFFCF7FFFFFBF5FFFFFAF4FFFFFBF6FFFEF9F3FF9E6F3EC47D430731
                  FFFFFF00FFFFFF0083470500814503008345054AB78A59F6F0D3B1FFF7E5CFFF
                  FEFDFBFFFFFFFFFFFFFEFCFFFFFEFCFFFFFDFCFFFFFFFFFFCA9680FFB44B0AFF
                  E0C0AFFFFFFFFFFFFFFCF9FFFFFDFAFFFFFFFFFFD0B89DFF84480A527E430404
                  FFFFFF00FFFFFF00824605008246050084470700874B0C5DB98C5BF3F4D7B4FF
                  FDE9D0FFFFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D5CDFFD0936EFF
                  EAD5CAFFFFFFFFFFFFFFFFFFFFFFFFFFDBC9B4FF8D551B8B83480900874D0E00
                  FFFFFF00FFFFFF008246050082460500854909008549090083460543A47139D1
                  E2BE95FFFDE5C7FFFFF3E2FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF
                  FFFFFFFFFFFEFEFFF4EFE9FFBF9F7EF48A51157A85490C04864D0F00864C0E00
                  FFFFFF00FFFFFF00824605008246050085490900864B0B00864A09008042010D
                  894E0F77A9763ECFCFA679EEDFBC96FFE1C4A5FFE1CBB3FFE0CCB7FFDAC6B1F7
                  C7AB8FE5AD855BD08D571C958347082D84490A00894F1400864C0E00864C0E00
                  FFFFFF00FFFFFF00824605008246050085490900864B0B00874B0B0083460600
                  8346060C864A0A3E8E531486996126B7A57139D0A3713BCF99652DBA915A209A
                  8C551971864B0D3E7F42001484480900874D0F00894F1300864C0E00864C0E00
                  FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                  FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                  FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                  FFFFFF00FFFFFF00FFFCFF00FFF87F00FFE07F00FE007F00FC007F00F0001F00
                  E0000F00C0000700800007008000030080000100800001008000010080000100
                  8000010080000100C0000100E0000100F0000700F8000700FC001F00FE003F00
                  FFFFFF00}
                ExplicitLeft = 839
                ExplicitTop = 11
                ExplicitHeight = 168
              end
            end
          end
          object dbCheck: TDBCheckBox
            Left = 15
            Top = 46
            Width = 15
            Height = 17
            Color = clBtnFace
            DataField = 'SEL'
            DataSource = dtmImportPDVFinan.dsFPG
            ParentColor = False
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = ' '
            Visible = False
          end
          object pnProcessarFormas: TPanel
            Left = 0
            Top = 214
            Width = 752
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 3
            object Label3: TLabel
              Left = 11
              Top = 11
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#250'mero da Conta'
            end
            object btProcessarSelecionados: TSpeedButton
              Left = 269
              Top = 6
              Width = 193
              Height = 25
              Hint = 'Processar selecionadas - [IMPFIN018]'
              Caption = '&Processar selecionados'
              Enabled = False
              Flat = True
              Glyph.Data = {
                E6040000424DE604000000000000360000002800000013000000140000000100
                180000000000B0040000CA0E0000C30E00000000000000000000BFBFBFBFBFBF
                BFBFBF7F7F7F7F7F7F3F370060302F7F7F00BFBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBF7F7F7F7F
                7F7F007F00007F003F370060302F7F7F007F7F7F7F7F7F7F7F7FBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF7F7F7F7F7F7F7F7F7F007F
                00A0983F007F003F370060302F7F7F007F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBF
                BFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF007F00A0983F
                007F00007F003F370060302F7F7F007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7FBFBFBF000000007F003F37003F37003F37003F3700A0983F007F0000
                7F00007F003F37003F37007F7F007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F00000000FF0000FF00007F00A0983F007F00A0983F007F00007F00007F
                00007F003F37003F37007F7F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00
                000000FF00FFC8CFA0983F007F00A0983F007F00007F00007F00007F00007F00
                007F003F37003F37007F7F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000090FF
                2FBFBFBF007F00A0983F007F00A0983F007F00007F00007F00007F00007F0000
                7F003F37003F37007F7F00BFBFBFBFBFBFBFBFBFBFBFBF00000090FF2FFFC8CF
                A0983FA0983FA0983FA0983FA0983FA0983FA0983FA0983FA0983FA0983FA098
                3F3F37003F37007F7F00BFBFBFBFBFBFBFBFBF00000090FF2FBFBFBF90FF2F90
                FF2F00FF0000FF0000FF0090FF2F00FF0090FF2F00FF0000FF0000FF0000FF00
                007F007F7F00BFBFBFBFBFBFBFBFBF00000090FF2FFFC8CF90FF2F90FF2F90FF
                2F00FF0090FF2FFFC8CF90FF2FFFC8CF90FF2FFFC8CF90FF2FFFC8CF7F7F0000
                7F00BFBFBFBFBFBFBFBFBF00000090FF2FBFBFBF90FF2F90FF2FFFC8CF90FF2F
                FFC8CF90FF2FFFC8CF90FF2FFFC8CF90FF2FFFC8CF7F7F00007F00BFBFBFBFBF
                BFBFBFBFBFBFBF00000090FF2FFFC8CFBFBFBFFFC8CFBFBFBFFFC8CF90FF2FFF
                C8CF90FF2FFFC8CF90FF2FFFC8CF7F7F00007F00BFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBF00000000FF0000FF0000FF0000FF0000FF00BFBFBFFFC8CF90FF2FFFC8
                CF90FF2FFFC8CF007F00007F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00
                0000BFBFBFBFBFBFBFBFBFBFBFBF90FF2FFFC8CF90FF2FFFC8CF90FF2FFFC8CF
                007F00A0983FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBF
                BFBFBFBFBFBFBFBFBFBF90FF2FBFBFBFFFC8CF90FF2FFFC8CF007F00A0983FBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBF
                BFBFBFBFBFBF90FF2FFFC8CF90FF2FFFC8CF007F00A0983FBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBF
                BFBF90FF2FBFBFBFFFC8CF007F00A0983FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF00FF
                0000FF00007F00A0983FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF00FF007F7F00
                A0983FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBF23EC48}
              OnClick = btProcessarSelecionadosClick
            end
            object DBEdit1: TDBEdit
              Left = 101
              Top = 8
              Width = 74
              Height = 21
              DataField = 'N_CONTA_PLC'
              DataSource = dtmImportPDVFinan.dsFPG
              TabOrder = 0
              OnExit = DBEdit1Exit
            end
            object progCreditos: TProgressBar
              Left = 526
              Top = 6
              Width = 218
              Height = 25
              TabOrder = 1
              Visible = False
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 316
          Width = 756
          Height = 207
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 2
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 752
            Height = 25
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            Caption = 'Presta'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DBGrid2: TDBGrid
            Left = 0
            Top = 25
            Width = 752
            Height = 147
            Align = alClient
            DataSource = dtmImportPDVFinan.dsPrest
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NOME_C'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_VENC_C'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIA_CXL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_RQ_PG_CXL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OP_CXL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_CRED'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE_CXL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TP_REC_CXL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRCSS'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_C'
                Width = 64
                Visible = True
              end>
          end
          object pnProcessarPrest: TPanel
            Left = 0
            Top = 172
            Width = 752
            Height = 31
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object Label16: TLabel
              Left = 2
              Top = 12
              Width = 104
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total das Presta'#231#245'es:'
            end
            object lbTotalPrestacoes: TLabel
              Left = 112
              Top = 12
              Width = 26
              Height = 13
              Caption = '0,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btProcessarPrestacoes: TSpeedButton
              Left = 269
              Top = 6
              Width = 193
              Height = 25
              Hint = 'Processar presta'#231#245'es recebidas - [IMPFIN019]'
              Caption = '&Processar presta'#231#245'es recebidas'
              Enabled = False
              Flat = True
              Glyph.Data = {
                E6040000424DE604000000000000360000002800000013000000140000000100
                180000000000B0040000CA0E0000C30E00000000000000000000BFBFBFBFBFBF
                BFBFBF7F7F7F7F7F7F3F370060302F7F7F00BFBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBF7F7F7F7F
                7F7F007F00007F003F370060302F7F7F007F7F7F7F7F7F7F7F7FBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF7F7F7F7F7F7F7F7F7F007F
                00A0983F007F003F370060302F7F7F007F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBF
                BFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF007F00A0983F
                007F00007F003F370060302F7F7F007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F7FBFBFBF000000007F003F37003F37003F37003F3700A0983F007F0000
                7F00007F003F37003F37007F7F007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
                7F7F7F00000000FF0000FF00007F00A0983F007F00A0983F007F00007F00007F
                00007F003F37003F37007F7F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00
                000000FF00FFC8CFA0983F007F00A0983F007F00007F00007F00007F00007F00
                007F003F37003F37007F7F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000090FF
                2FBFBFBF007F00A0983F007F00A0983F007F00007F00007F00007F00007F0000
                7F003F37003F37007F7F00BFBFBFBFBFBFBFBFBFBFBFBF00000090FF2FFFC8CF
                A0983FA0983FA0983FA0983FA0983FA0983FA0983FA0983FA0983FA0983FA098
                3F3F37003F37007F7F00BFBFBFBFBFBFBFBFBF00000090FF2FBFBFBF90FF2F90
                FF2F00FF0000FF0000FF0090FF2F00FF0090FF2F00FF0000FF0000FF0000FF00
                007F007F7F00BFBFBFBFBFBFBFBFBF00000090FF2FFFC8CF90FF2F90FF2F90FF
                2F00FF0090FF2FFFC8CF90FF2FFFC8CF90FF2FFFC8CF90FF2FFFC8CF7F7F0000
                7F00BFBFBFBFBFBFBFBFBF00000090FF2FBFBFBF90FF2F90FF2FFFC8CF90FF2F
                FFC8CF90FF2FFFC8CF90FF2FFFC8CF90FF2FFFC8CF7F7F00007F00BFBFBFBFBF
                BFBFBFBFBFBFBF00000090FF2FFFC8CFBFBFBFFFC8CFBFBFBFFFC8CF90FF2FFF
                C8CF90FF2FFFC8CF90FF2FFFC8CF7F7F00007F00BFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBF00000000FF0000FF0000FF0000FF0000FF00BFBFBFFFC8CF90FF2FFFC8
                CF90FF2FFFC8CF007F00007F00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00
                0000BFBFBFBFBFBFBFBFBFBFBFBF90FF2FFFC8CF90FF2FFFC8CF90FF2FFFC8CF
                007F00A0983FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBF
                BFBFBFBFBFBFBFBFBFBF90FF2FBFBFBFFFC8CF90FF2FFFC8CF007F00A0983FBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBF
                BFBFBFBFBFBF90FF2FFFC8CF90FF2FFFC8CF007F00A0983FBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBF
                BFBF90FF2FBFBFBFFFC8CF007F00A0983FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF00FF
                0000FF00007F00A0983FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF00FF007F7F00
                A0983FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                BFBFBFBFBFBFBF23EC48}
              OnClick = btProcessarPrestacoesClick
            end
            object progPrestacoes: TProgressBar
              Left = 526
              Top = 6
              Width = 218
              Height = 25
              TabOrder = 0
              Visible = False
            end
          end
        end
      end
      object tsBoletoSomatorio: TTabSheet
        Caption = 'Boleto de Somat'#243'rio'
        ImageIndex = 1
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 756
          Height = 30
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object SpeedButton3: TSpeedButton
            Left = 0
            Top = 0
            Width = 752
            Height = 26
            Hint = 'Somar - [IMPFIN020]'
            Align = alClient
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
              03333377777777777F33333003333330033333377FF333377F33333300333333
              0333333377FF33337F3333333003333303333333377FF3337333333333003333
              333333333377FF3333333333333003333333333333377FF33333333333330033
              3333333333337733333333333330033333333333333773333333333333003333
              33333333337733333F3333333003333303333333377333337F33333300333333
              03333333773333337F33333003333330033333377FFFFFF77F33330000000000
              0333337777777777733333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = SpeedButton3Click
            ExplicitHeight = 16
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 30
          Width = 756
          Height = 282
          Align = alClient
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object DBGrid3: TDBGrid
            Left = 0
            Top = 25
            Width = 752
            Height = 234
            Align = alClient
            DataSource = dtmImportPDVFinan.dsSumFp
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = DBGrid3DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'COD_CONTROLE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_CTRL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAO_GERA_FINAN'
                Title.Caption = 'N'#227'o Gera Financeiro'
                Width = 139
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SOMA'
                Visible = True
              end>
          end
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 752
            Height = 25
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            Caption = 'Soma das formas de pagamento por Controle'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object pnButtonSomaFormas: TPanel
            Left = 0
            Top = 259
            Width = 752
            Height = 19
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object Panel18: TPanel
              Left = 4
              Top = 0
              Width = 121
              Height = 18
              Caption = 'N'#227'o gera financeiro'
              Color = 42218
              ParentBackground = False
              TabOrder = 0
            end
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 312
          Width = 756
          Height = 211
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 2
          object Label7: TLabel
            Left = 35
            Top = 34
            Width = 250
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total das Vendas / Recibos / Presta'#231#245'es:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbTotalVendasPrest: TLabel
            Left = 363
            Top = 34
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 506
            Top = 34
            Width = 113
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total dos Cr'#233'ditos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbTotalCreditos: TLabel
            Left = 697
            Top = 34
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 97
            Top = 55
            Width = 188
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total de Lan'#231'amentos Avulsos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbTotalLancamentosAvulso: TLabel
            Left = 363
            Top = 55
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 505
            Top = 153
            Width = 114
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total da Diferen'#231'a:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbTotalDiferenca: TLabel
            Left = 697
            Top = 153
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 37
            Top = 97
            Width = 248
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total de Recibos Antecipados Utilizados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbTotalRecibosUsados: TLabel
            Left = 363
            Top = 97
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbDif2: TLabel
            Left = 159
            Top = 196
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label8: TLabel
            Left = 0
            Top = 199
            Width = 263
            Height = 16
            Caption = 'Diferen'#231'as Abatendo Recibos Antecipados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label12: TLabel
            Left = 189
            Top = 75
            Width = 96
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total dos Juros:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbTotalJuros: TLabel
            Left = 363
            Top = 75
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 204
            Top = 153
            Width = 81
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total L'#237'quido:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbTotalLiquido: TLabel
            Left = 363
            Top = 153
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 290
            Top = 130
            Width = 102
            Height = 13
            Caption = '_________________'
          end
          object Label17: TLabel
            Left = 538
            Top = 56
            Width = 81
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total L'#237'quido:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbTotalLiquido2: TLabel
            Left = 697
            Top = 56
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 624
            Top = 130
            Width = 102
            Height = 13
            Caption = '_________________'
          end
          object Label18: TLabel
            Left = 15
            Top = 120
            Width = 270
            Height = 16
            Alignment = taRightJustify
            Caption = 'Total Taxa Intermediador Pag (E-commerce):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbTotalTaxaInterPagEC: TLabel
            Left = 363
            Top = 119
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 752
            Height = 25
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            Caption = 'Confer'#234'ncias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Panel17: TPanel
            Left = 0
            Top = 176
            Width = 752
            Height = 31
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object SpeedButton4: TSpeedButton
              Left = 178
              Top = 1
              Width = 193
              Height = 25
              Hint = 'Resumo do Per'#237'odo - [IMPFIN021]'
              Caption = '&Resumo do Per'#237'odo'
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000030F0000030F00000001000000010000421821004221
                21004A2121004A292900523131005A313100393939004A4A4A007B4A5200844A
                52004A525200525252005A525200524A5A008C4A5A0052525A00636363007363
                63007B6363006B6B6300736B63007B6B63006B5A6B00845A6B007B636B008463
                6B006B6B6B00846B6B008C6B6B008C637300846B73008C6B73009C6B73007373
                73007B737300847373007B947300A56B7B00A5737B00737B7B007B7B7B00847B
                7B009C7B7B00A57B7B00AD7B7B007B847B00A5847B008CFF7B00847B84008C7B
                8400947B8400BD7B84007384840084848400A5848400AD848400B58484009C84
                8C00848C8C008C8C8C00948C8C009C8C8C00BD8C8C00C68C8C0084948C00BD8C
                9400C68C9400849494008C949400949494009C9494008C9C9400AD7B9C008C84
                9C008C949C0094949C00AD949C008C9C9C00949C9C009C9C9C00A59C9C00B5A5
                9C00A57BA500A5A5A500ADA5A500B5A5A500AD9CAD009CA5AD00BDA5AD00A5AD
                AD00ADADAD00ADB5B500B5B5B500BDB5BD00B5BDBD00BDBDBD00BDD6BD00C6C6
                C600CEC6C600C6C6CE00C6CECE00CECECE00D6CECE00CED6CE00D6CED600CED6
                D600D6D6D600DED6D600D6DEDE00DEDEDE00DEE7DE00E7D6E700DEE7E700E7E7
                E700EFE7E700E7EFE700E7EFEF00EFEFEF00F7EFEF00EFF7F700F7F7F700FF00
                FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979797979
                797979797979797979797979797979533B3B3B3B3B5379797979797979790075
                785E615C7B61001A79797979790B0075786266617B63000B7979791A07070770
                693A3B5C75640707001328070C0B074F5A5B5C5C534B070F0A000B304E4D474E
                453B2D40444E495C2F000B4F5F5A3C1E1B1917181C1D520E5C00105A6C1F202B
                3E4241413F26250E600B3B5C65080907000000000007090E630B3B5C65000753
                6D6D6D6D6D530602651079535B46235F7B7B78787878183D5B7979797979795F
                7B7B785353537979797979797979795F7A7B78536D537979797979797979795F
                7878785353797979797979797979795F53535353797979797979}
              OnClick = SpeedButton4Click
            end
            object SpeedButton5: TSpeedButton
              Left = 377
              Top = 1
              Width = 193
              Height = 25
              Hint = 'Detalhes do Per'#237'odo - [IMPFIN022]'
              Caption = '&Detalhes do Per'#237'odo'
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000030F0000030F00000001000000010000421821004221
                21004A2121004A292900523131005A313100393939004A4A4A007B4A5200844A
                52004A525200525252005A525200524A5A008C4A5A0052525A00636363007363
                63007B6363006B6B6300736B63007B6B63006B5A6B00845A6B007B636B008463
                6B006B6B6B00846B6B008C6B6B008C637300846B73008C6B73009C6B73007373
                73007B737300847373007B947300A56B7B00A5737B00737B7B007B7B7B00847B
                7B009C7B7B00A57B7B00AD7B7B007B847B00A5847B008CFF7B00847B84008C7B
                8400947B8400BD7B84007384840084848400A5848400AD848400B58484009C84
                8C00848C8C008C8C8C00948C8C009C8C8C00BD8C8C00C68C8C0084948C00BD8C
                9400C68C9400849494008C949400949494009C9494008C9C9400AD7B9C008C84
                9C008C949C0094949C00AD949C008C9C9C00949C9C009C9C9C00A59C9C00B5A5
                9C00A57BA500A5A5A500ADA5A500B5A5A500AD9CAD009CA5AD00BDA5AD00A5AD
                AD00ADADAD00ADB5B500B5B5B500BDB5BD00B5BDBD00BDBDBD00BDD6BD00C6C6
                C600CEC6C600C6C6CE00C6CECE00CECECE00D6CECE00CED6CE00D6CED600CED6
                D600D6D6D600DED6D600D6DEDE00DEDEDE00DEE7DE00E7D6E700DEE7E700E7E7
                E700EFE7E700E7EFE700E7EFEF00EFEFEF00F7EFEF00EFF7F700F7F7F700FF00
                FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979797979
                797979797979797979797979797979533B3B3B3B3B5379797979797979790075
                785E615C7B61001A79797979790B0075786266617B63000B7979791A07070770
                693A3B5C75640707001328070C0B074F5A5B5C5C534B070F0A000B304E4D474E
                453B2D40444E495C2F000B4F5F5A3C1E1B1917181C1D520E5C00105A6C1F202B
                3E4241413F26250E600B3B5C65080907000000000007090E630B3B5C65000753
                6D6D6D6D6D530602651079535B46235F7B7B78787878183D5B7979797979795F
                7B7B785353537979797979797979795F7A7B78536D537979797979797979795F
                7878785353797979797979797979795F53535353797979797979}
              OnClick = SpeedButton5Click
            end
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Processamento de Arquivo de Retorno'
        ImageIndex = 2
        object BitBtn2: TBitBtn
          Left = 0
          Top = 0
          Width = 756
          Height = 25
          Hint = 'Processamento de Arquivo de Retorno de Banco'
          Align = alTop
          Caption = 'Processamento de Arquivo de Retorno de Banco'
          TabOrder = 0
          OnClick = BitBtn2Click
        end
      end
    end
  end
  object pnDtBaixa: TPanel
    Left = 782
    Top = 8
    Width = 242
    Height = 105
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object BitBtn1: TBitBtn
      Left = 81
      Top = 63
      Width = 75
      Height = 25
      Hint = 'OK'
      Caption = 'OK'
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object Panel13: TPanel
      Left = 19
      Top = 14
      Width = 201
      Height = 41
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object edDtBaixa: TMaskEdit
        Left = 62
        Top = 8
        Width = 73
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
  end
  object pnOpcoesImportacao: TPanel
    Left = 782
    Top = 150
    Width = 298
    Height = 142
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 2
    Visible = False
    OnEnter = pnOpcoesImportacaoEnter
    object Panel15: TPanel
      Left = 6
      Top = 91
      Width = 282
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn3: TBitBtn
        Left = 61
        Top = 6
        Width = 75
        Height = 25
        Hint = 'OK'
        Caption = '&OK'
        TabOrder = 0
        OnClick = BitBtn3Click
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
      object BitBtn4: TBitBtn
        Left = 142
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = BitBtn4Click
        Glyph.Data = {
          E6010000424DE60100000000000036000000280000000C0000000C0000000100
          180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
          9696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
          ED0000C50000B69191BAFFFFFFFFFFFFFFFFFFFFFFFF7F7FC500009100008FA2
          A2C64848EC0000DD0000D50000BC9292BBFFFFFFFFFFFF7A7AC80000A30000A7
          0000938F8FC9FFFFFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
          B40000A67D7DCBFFFFFFFFFFFFFFFFFF3838EF0000E60101E40000D40000C401
          01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
          0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DE10F0F
          ED0C0CEC0303EC0000E28E8EC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484DD39
          39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFFFFFFFFFFFFFFF8787DD
          4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFF8A8A
          DD4D4DDE7373E46868E48E8EE4FFFFFFFFFFFF7B7BEB6C6CF06F6FF73D3DEAA6
          A6CE8787E36262DD6767E09191E3FFFFFFFFFFFFFFFFFFFFFFFF8080E96D6DEF
          5555F2A4A4E9FFFFFF8F8FE49393E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF7D7DE9A4A4EDFFFFFF}
      end
    end
    object Panel14: TPanel
      Left = 6
      Top = 6
      Width = 282
      Height = 85
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object ckAgruparDinheiro: TCheckBox
        Left = 16
        Top = 20
        Width = 233
        Height = 17
        Caption = 'Agrupar valores lan'#231'ados em Dinheiro'
        TabOrder = 0
      end
      object ckAguparBxAuto: TCheckBox
        Left = 16
        Top = 43
        Width = 249
        Height = 17
        Caption = 'Agrupar valores de baixas autom'#225'ticas'
        TabOrder = 1
      end
    end
  end
end
