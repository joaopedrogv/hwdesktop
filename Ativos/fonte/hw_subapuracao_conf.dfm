object frmSubApuracaoConf: TfrmSubApuracaoConf
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o Subapura'#231#227'o'
  ClientHeight = 332
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object page1920Conf: TPageControl
    Left = 0
    Top = 0
    Width = 499
    Height = 332
    ActivePage = tsConf
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsConf: TTabSheet
      Caption = 'tsConf'
      object Panel23: TPanel
        Left = 0
        Top = 0
        Width = 491
        Height = 301
        Align = alClient
        BorderWidth = 6
        TabOrder = 0
        object GridPanel2: TGridPanel
          Left = 7
          Top = 7
          Width = 477
          Height = 246
          Align = alClient
          BevelEdges = [beLeft, beTop, beRight]
          BevelKind = bkTile
          BevelOuter = bvNone
          ColumnCollection = <
            item
              Value = 50.000000000000000000
            end
            item
              Value = 50.000000000000000000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = Panel24
              Row = 0
            end
            item
              Column = 1
              Control = Panel25
              Row = 0
            end
            item
              Column = 0
              Control = Label14
              Row = 1
            end
            item
              Column = 1
              Control = Label16
              Row = 1
            end
            item
              Column = 0
              Control = ed_IndicadorApuracaoIcms1900
              Row = 2
            end
            item
              Column = 1
              Control = ed_DescricaoComplementar1900
              Row = 2
            end
            item
              Column = 0
              Control = Label18
              Row = 3
            end
            item
              Column = 1
              Control = Label19
              Row = 3
            end
            item
              Column = 0
              Control = ed_CodigoObrigacaoRecolher1926
              Row = 4
            end
            item
              Column = 1
              Control = ed_CodigoReceitaObrigacaoRecolher1926
              Row = 4
            end
            item
              Column = 0
              Control = Label20
              Row = 5
            end
            item
              Column = 1
              Control = Label21
              Row = 5
            end
            item
              Column = 0
              Control = ed_DiaVencimentoObrigacaoRecolher1926
              Row = 6
            end
            item
              Column = 1
              Control = ed_IndicadorProcessoObrigacaoRecolher1926
              Row = 6
            end
            item
              Column = 0
              Control = Label22
              Row = 7
            end
            item
              Column = 1
              Control = Label23
              Row = 7
            end
            item
              Column = 0
              Control = ed_NumeroProcessoObrigacaoRecolher1926
              Row = 8
            end
            item
              Column = 1
              Control = ed_DescricaoProcessoObrigacaoRecolher1926
              Row = 8
            end
            item
              Column = 0
              ColumnSpan = 2
              Control = Label24
              Row = 9
            end
            item
              Column = 0
              ColumnSpan = 2
              Control = ed_TextoComplementarObrigacaoRecolher1926
              Row = 10
            end>
          RowCollection = <
            item
              SizeStyle = ssAbsolute
              Value = 10.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 20.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 26.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 20.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 26.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 20.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 26.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 20.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 26.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 20.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 26.000000000000000000
            end>
          TabOrder = 0
          object Panel24: TPanel
            Left = 0
            Top = 0
            Width = 236
            Height = 10
            Align = alClient
            BevelEdges = [beBottom]
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Panel25: TPanel
            Left = 236
            Top = 0
            Width = 237
            Height = 10
            Align = alClient
            BevelEdges = [beBottom]
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object Label14: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 13
            Width = 230
            Height = 14
            Align = alClient
            Caption = 'Indicador de Apuracao - 1900'
            ExplicitWidth = 143
            ExplicitHeight = 13
          end
          object Label16: TLabel
            AlignWithMargins = True
            Left = 239
            Top = 13
            Width = 231
            Height = 14
            Align = alClient
            Caption = 'Descri'#231#227'o complementar - 1900'
            ExplicitWidth = 150
            ExplicitHeight = 13
          end
          object ed_IndicadorApuracaoIcms1900: TComboBox
            AlignWithMargins = True
            Left = 3
            Top = 33
            Width = 230
            Height = 21
            Align = alClient
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              '0 - SEM APURA'#199#195'O'
              '3 - APURA'#199#195'O 1'
              '4 - APURA'#199#195'O 2'
              '5 - APURA'#199#195'O 3'
              '6 - APURA'#199#195'O 4'
              '7 - APURA'#199#195'O 5'
              '8 - APURA'#199#195'O 6')
          end
          object ed_DescricaoComplementar1900: TMaskEdit
            AlignWithMargins = True
            Left = 239
            Top = 33
            Width = 231
            Height = 20
            Align = alClient
            TabOrder = 3
            Text = 'ed_DescricaoComplementar1900'
            ExplicitHeight = 21
          end
          object Label18: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 59
            Width = 230
            Height = 14
            Align = alClient
            Caption = 'Codigo Obriga'#231#227'o a Recolher - 1926'
            ExplicitWidth = 173
            ExplicitHeight = 13
          end
          object Label19: TLabel
            AlignWithMargins = True
            Left = 239
            Top = 59
            Width = 231
            Height = 14
            Align = alClient
            Caption = 'Codigo Receita a Recolher - 1926'
            ExplicitWidth = 160
            ExplicitHeight = 13
          end
          object ed_CodigoObrigacaoRecolher1926: TMaskEdit
            AlignWithMargins = True
            Left = 3
            Top = 79
            Width = 230
            Height = 20
            Align = alClient
            TabOrder = 4
            Text = 'ed_CodigoObrigacaoRecolher1926'
            ExplicitHeight = 21
          end
          object ed_CodigoReceitaObrigacaoRecolher1926: TMaskEdit
            AlignWithMargins = True
            Left = 239
            Top = 79
            Width = 231
            Height = 20
            Align = alClient
            TabOrder = 5
            Text = 'ed_CodigoReceitaObrigacaoRecolher1926'
            ExplicitHeight = 21
          end
          object Label20: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 105
            Width = 230
            Height = 14
            Align = alClient
            Caption = 'Dia de vencimento - 1926'
            ExplicitWidth = 122
            ExplicitHeight = 13
          end
          object Label21: TLabel
            AlignWithMargins = True
            Left = 239
            Top = 105
            Width = 231
            Height = 14
            Align = alClient
            Caption = 'Indicador de Processo - 1926'
            ExplicitWidth = 140
            ExplicitHeight = 13
          end
          object ed_DiaVencimentoObrigacaoRecolher1926: TEditHw
            AlignWithMargins = True
            Left = 3
            Top = 125
            Width = 230
            Height = 20
            Align = alClient
            TabOrder = 6
            Text = 
              '                                                                ' +
              '                                                   0,00'
            Formato = fInteger
            FormatSize = '0.0'
            ExplicitHeight = 21
          end
          object ed_IndicadorProcessoObrigacaoRecolher1926: TComboBox
            AlignWithMargins = True
            Left = 239
            Top = 125
            Width = 231
            Height = 21
            Align = alClient
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 7
            Text = '  - Nenhum'
            Items.Strings = (
              '  - Nenhum'
              '0 - SEFAZ'
              '1 - Justi'#231'a Federal'
              '2 - Justi'#231'a Estadual'
              '9 - Outros')
          end
          object Label22: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 151
            Width = 230
            Height = 14
            Align = alClient
            Caption = 'Numero Processo - 1926'
            ExplicitWidth = 117
            ExplicitHeight = 13
          end
          object Label23: TLabel
            AlignWithMargins = True
            Left = 239
            Top = 151
            Width = 231
            Height = 14
            Align = alClient
            Caption = 'Descri'#231#227'o processo - 1926'
            ExplicitWidth = 126
            ExplicitHeight = 13
          end
          object ed_NumeroProcessoObrigacaoRecolher1926: TMaskEdit
            AlignWithMargins = True
            Left = 3
            Top = 171
            Width = 230
            Height = 20
            Align = alClient
            TabOrder = 8
            Text = 'ed_NumeroProcessoObrigacaoRecolher1926'
            ExplicitHeight = 21
          end
          object ed_DescricaoProcessoObrigacaoRecolher1926: TMaskEdit
            AlignWithMargins = True
            Left = 239
            Top = 171
            Width = 231
            Height = 20
            Align = alClient
            TabOrder = 9
            Text = 'ed_DescricaoProcessoObrigacaoRecolher1926'
            ExplicitHeight = 21
          end
          object Label24: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 197
            Width = 467
            Height = 14
            Align = alClient
            Caption = 'Texto complementar - 1926'
            ExplicitWidth = 132
            ExplicitHeight = 13
          end
          object ed_TextoComplementarObrigacaoRecolher1926: TMaskEdit
            AlignWithMargins = True
            Left = 3
            Top = 217
            Width = 467
            Height = 20
            Align = alClient
            TabOrder = 10
            Text = 'ed_TextoComplementarObrigacaoRecolher1926'
            ExplicitHeight = 21
          end
        end
        object Panel26: TPanel
          Left = 7
          Top = 253
          Width = 477
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object BitBtn7: TBitBtn
            Left = 158
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Salvar'
            ModalResult = 1
            TabOrder = 0
            OnClick = BitBtn7Click
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
          object BitBtn8: TBitBtn
            Left = 239
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Cancelar'
            ModalResult = 2
            TabOrder = 1
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
