object FrmConciliaCartao: TFrmConciliaCartao
  Left = 222
  Top = 24
  Caption = 'Concilia'#231#227'o Cart'#227'o de cr'#233'dito EDI'
  ClientHeight = 641
  ClientWidth = 905
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 905
    Height = 641
    Align = alClient
    TabOrder = 0
    object lbl_statusProc: TLabel
      Left = 1
      Top = 599
      Width = 903
      Height = 13
      Align = alTop
      Caption = '[Status Processamento]'
      Visible = False
      ExplicitWidth = 115
    end
    object Gauge_HistoricoRetorno: TGauge
      Left = 1
      Top = 610
      Width = 903
      Height = 30
      Align = alBottom
      Progress = 0
      Visible = False
      ExplicitLeft = 55
      ExplicitTop = -2
      ExplicitWidth = 780
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 903
      Height = 94
      Align = alTop
      Caption = 'Operadora de Cart'#227'o'
      TabOrder = 0
      object Label1: TLabel
        Left = 48
        Top = 24
        Width = 107
        Height = 13
        Caption = 'Operadora de Cart'#227'o:'
      end
      object Label2: TLabel
        Left = 478
        Top = 24
        Width = 89
        Height = 13
        Caption = 'Pasta de trabalho:'
      end
      object Label14: TLabel
        Left = 161
        Top = 43
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 161
        Top = 16
        Width = 304
        Height = 21
        DropDownWidth = 600
        KeyField = 'COD_ADM_TEMP'
        ListField = 'DESCRICAO_ADM_TEMP;END_ARQUIVO_ADM;COD_EMPRESA'
        ListSource = dtmContasAReceber.dtadmcartao
        TabOrder = 0
        OnExit = DBLookupComboBox1Exit
      end
      object Edit1: TEdit
        Left = 572
        Top = 18
        Width = 325
        Height = 21
        TabOrder = 1
      end
      object BitBtn3: TBitBtn
        Left = 315
        Top = 43
        Width = 290
        Height = 40
        Hint = 
          'Busca informa'#231#245'es sobre o movimento dos carta'#245'es de cr'#233'dito que ' +
          'est'#227'o na pasta de trabalho acima'
        Caption = 'Buscar informa'#231#245'es do movimento de cart'#245'es'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn3Click
        Glyph.Data = {
          9E050000424D9E05000000000000760000002800000025000000210000000100
          0800000000002805000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00080808080808
          0808080808080808080808080808080808080808080808080808080808080802
          D500080808080808080808080808080808080808080808080808080808080808
          0808080808080802D50008080808080808080808080808080808080808080808
          08080808080808080808080808080802D5000808080808080808080808080808
          000007080808080808080808080808080808080808080802D500080808080808
          0808080808080807000000080808080808080808080808080808080808080802
          D500080808080808080808080808080000000708080808080808080808080808
          0808080808080802D50008080808080808080808080807000000080808080808
          08000808080808080808080808080802D5000808080808080808080808080000
          000708080800080800000008080808080808080808080802D500080808080808
          0808080808070000000808080000000008080000080808080808080808080802
          D500080808080808080808080800000007080000080800000808080000080808
          0808080808080802D50008080808080808080808070000000800080000080800
          00080808000008080808080808080802D5000808080808080700000000000007
          000808080000080800000808080000080808080808080802D500080808080800
          0000000000000000080808080800000808000008080800000808080808080802
          D500080808080000000808080700000000080808080800000808000008080800
          0008080808080802D50008080807000008080700080808000008080808080800
          00080800000808080000080808080802D5000808080000000807000808080800
          000008080808080800000808000008080800000808080802D500080808000008
          0700080808080808000008080808080808000008080000080808000008080802
          D500080808000007000808080808080800000808080808080808000008080000
          0808080008080802D50008080800000008080000080808080000080808080808
          08080800000808000808000808080802D5000808080000080008080700080808
          000008080808080808080808000800080800080808080802D500080808070000
          0800080700000700000708080808080808080800080008080008080808080802
          D500080808080000000800080807000000080808080808080808000800080800
          0808080808080802D50008080808080000000000000000000808080808080808
          08000800080800080808080808080802D5000808080808080700000000000708
          000808080808080800080008080008080808080808080802D500080808080808
          0808080808000808080008080808080008000808000808080808080808080802
          D500080808080808080808080808000808080808080800080008080008080808
          0808080808080802D50008080808080808080808080808000808080808000800
          08000008080808080808080808080802D5000808080808080808080808080808
          000808080008000808080808080808080808080808080802D500080808080808
          0808080808080808080008000808080808080808080808080808080808080802
          D500080808080808080808080808080808080008080808080808080808080808
          0808080808080802D50008080808080808080808080808080808080808080808
          08080808080808080808080808080802D5000808080808080808080808080808
          080808080808080808080808080808080808080808080802D500080808080808
          0808080808080808080808080808080808080808080808080808080808080802
          D500}
      end
      object CheckBox15: TCheckBox
        Left = 688
        Top = 42
        Width = 206
        Height = 17
        Caption = 'Trazer Pend'#234'ncias Anteriores'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
    object PageControl_Retorno: TPageControl
      Left = 1
      Top = 95
      Width = 903
      Height = 504
      ActivePage = tsCreditos
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 1
      object tsCreditos: TTabSheet
        Caption = 'Cr'#233'ditos - Processamento'
        ImageIndex = 1
        object DBGrid_Retorno: TDBGrid
          Left = 0
          Top = 0
          Width = 895
          Height = 254
          Align = alTop
          DataSource = dtmContasAReceber.DsListaExtCartao
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = DBGrid_RetornoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DTPROCESSAMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTVENDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_STATUS_ADM'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_PROC'
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_DOC_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_AUT_CART_CRED'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NPARCELA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORPARCELA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_C'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_PREV_PAG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_C'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_TIPOEXTRATO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOEXTRATO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_DOC_CRED'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAXA_CARTAO_CRED'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_TERMINAL_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CRED'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERCTXCARTAO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA_CARTAO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_PROD_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_TIPO_PROD_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_BANDEIRA_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_BANDEIRA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IND_ANTEC_RO_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IND_OR_AJUSTE_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IND_OR_DESC_AJUSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARQ_EXTRATO_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_CTRL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CTRL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENCIA_CTRL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_CONTA_CTRL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_TRANSACAO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_TIPOTRANS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDBAIXA_CARTAO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEQID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RO_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSU_RO_ADM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE_PARC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_VENDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_EMP_MULT'
              Visible = True
            end>
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 254
          Width = 895
          Height = 108
          Align = alTop
          Caption = 'Soma do valor pago pelo cliente'
          Enabled = False
          TabOrder = 1
          object Label3: TLabel
            Left = 687
            Top = 77
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total L'#237'quido:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 734
            Top = 58
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 52
            Top = 21
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total tarifas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 29
            Top = 39
            Width = 96
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total comiss'#245'es:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 31
            Top = 58
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Ajustes(+):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 34
            Top = 77
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Ajustes(-):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 631
            Top = 21
            Width = 137
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transa'#231#245'es Vinculadas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 662
            Top = 39
            Width = 106
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transa'#231#245'es Pagas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object BitBtn_SomarSelecionados: TBitBtn
            Left = 376
            Top = 30
            Width = 171
            Height = 45
            Hint = 'Somar os cr'#233'ditos selecionados'
            Caption = 'Somar Selecionados'
            TabOrder = 2
            OnClick = BitBtn_SomarSelecionadosClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E0000000100000001000031319C003131
              A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
              E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
              FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
              FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
              1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
              0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
              0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
              0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
              1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
              0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
              111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
              0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
          end
          object Edit2: TEdit
            Left = 131
            Top = 18
            Width = 89
            Height = 21
            Hint = 'Soma total menos Juros'
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 3
            Text = '0'
          end
          object Edit3: TEdit
            Left = 131
            Top = 37
            Width = 89
            Height = 21
            Hint = 'Soma total menos Juros'
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 4
            Text = '0'
          end
          object Edit4: TEdit
            Left = 131
            Top = 56
            Width = 89
            Height = 21
            Hint = 'Soma total menos Juros'
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 5
            Text = '0'
          end
          object Edit5: TEdit
            Left = 131
            Top = 74
            Width = 89
            Height = 21
            Hint = 'Soma total menos Juros'
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 6
            Text = '0'
          end
          object CheckBox1: TCheckBox
            Left = 224
            Top = 22
            Width = 97
            Height = 17
            Caption = 'Lan'#231'ar Custo'
            Checked = True
            State = cbChecked
            TabOrder = 7
          end
          object CheckBox2: TCheckBox
            Left = 224
            Top = 41
            Width = 97
            Height = 17
            Caption = 'Lan'#231'ar Custo'
            Checked = True
            State = cbChecked
            TabOrder = 8
          end
          object CheckBox3: TCheckBox
            Left = 224
            Top = 60
            Width = 129
            Height = 17
            Caption = 'Lan'#231'ar Ajuste Positivo'
            Checked = True
            State = cbChecked
            TabOrder = 9
          end
          object CheckBox4: TCheckBox
            Left = 224
            Top = 78
            Width = 129
            Height = 17
            Caption = 'Lan'#231'ar Ajuste Negativo'
            Checked = True
            State = cbChecked
            TabOrder = 10
          end
          object Edit6: TEdit
            Left = 774
            Top = 18
            Width = 89
            Height = 21
            Hint = 'Soma total'
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 11
            Text = '0'
          end
          object Edit7: TEdit
            Left = 774
            Top = 36
            Width = 89
            Height = 21
            Hint = 'Soma total'
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 12
            Text = '0'
          end
          object Edit_Soma: TEdit
            Left = 774
            Top = 55
            Width = 89
            Height = 21
            Hint = 'Soma total'
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 0
            Text = '0'
          end
          object Edit_SomaMenosJuros: TEdit
            Left = 774
            Top = 74
            Width = 89
            Height = 21
            Hint = 'Soma total menos Juros'
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 1
            Text = '0'
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 362
          Width = 895
          Height = 48
          Align = alTop
          Caption = 'Sele'#231#245'es'
          Color = clBtnFace
          Enabled = False
          ParentColor = False
          TabOrder = 2
          object Label9: TLabel
            Left = 667
            Top = 22
            Width = 69
            Height = 13
            Caption = 'Status Adm:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object CheckBox5: TCheckBox
            Left = 3
            Top = 18
            Width = 76
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBox5Click
          end
          object CheckBox6: TCheckBox
            Left = 60
            Top = 18
            Width = 113
            Height = 17
            Caption = 'Cr'#233'ds.Encontrados'
            Checked = True
            Color = clHighlight
            ParentColor = False
            State = cbChecked
            TabOrder = 1
            OnClick = CheckBox6Click
          end
          object CheckBox7: TCheckBox
            Left = 179
            Top = 18
            Width = 138
            Height = 17
            Caption = 'Cr'#233'ds.N'#227'o Encontrados'
            Checked = True
            Color = clRed
            ParentColor = False
            State = cbChecked
            TabOrder = 2
            OnClick = CheckBox7Click
          end
          object CheckBox8: TCheckBox
            Left = 322
            Top = 18
            Width = 103
            Height = 17
            Caption = 'Cr'#233'ds. Conf. CVs'
            Checked = True
            Color = clGreen
            ParentColor = False
            State = cbChecked
            TabOrder = 3
            OnClick = CheckBox8Click
          end
          object CheckBox9: TCheckBox
            Left = 432
            Top = 18
            Width = 122
            Height = 17
            Caption = 'Cr'#233'ds.N'#227'o Conf. CVs'
            Checked = True
            Color = clGray
            ParentColor = False
            State = cbChecked
            TabOrder = 4
            OnClick = CheckBox9Click
          end
          object CheckBox10: TCheckBox
            Left = 560
            Top = 18
            Width = 101
            Height = 17
            Caption = 'Ajustes Pos/Neg'
            Checked = True
            Color = clOlive
            ParentColor = False
            State = cbChecked
            TabOrder = 5
            OnClick = CheckBox10Click
          end
          object CheckBox11: TCheckBox
            Left = 743
            Top = 9
            Width = 52
            Height = 17
            Caption = 'Pagos'
            TabOrder = 6
            OnClick = CheckBox11Click
          end
          object CheckBox12: TCheckBox
            Left = 797
            Top = 9
            Width = 96
            Height = 17
            Caption = 'Enviado Banco'
            TabOrder = 7
            OnClick = CheckBox12Click
          end
          object CheckBox13: TCheckBox
            Left = 743
            Top = 27
            Width = 53
            Height = 17
            Caption = 'Agend'
            TabOrder = 8
            OnClick = CheckBox13Click
          end
          object CheckBox14: TCheckBox
            Left = 797
            Top = 27
            Width = 94
            Height = 17
            Caption = 'A Confirmar'
            TabOrder = 9
            OnClick = CheckBox14Click
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 410
          Width = 895
          Height = 67
          Align = alTop
          Caption = 'A'#231#245'es'
          TabOrder = 3
          object BitBtn_QuitarCreditos: TBitBtn
            Left = 3
            Top = 13
            Width = 246
            Height = 50
            Cursor = crHandPoint
            Hint = 'Baixar os cr'#233'ditos selecionados  - [IFI001]'
            Caption = 'Processar extratos listados'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtn_QuitarCreditosClick
            Glyph.Data = {
              3A060000424D3A06000000000000FA0300002800000018000000180000000100
              08000000000040020000120B0000120B0000F1000000F10000007A6EA600230F
              530066537900FF00FF009E999C009A909500F0EAED009C939700F3EEF0009C91
              95009D9799009C8E9200EFE7E900EBE3E500FAF6F700F6F2F300937078006F36
              4200926D750091697000926D74008B696F008E5C640090656C0091696F00E2D5
              D7006A3A41008C585F0090626800866A6E00E5D9DA00E7DCDD00EAE0E1006736
              3900A17D7F00A7878900B4979900B1959700B59A9C00CAB0B200AA8B8C00B295
              9600C2A6A700BAA0A100C6ABAC00D0BCBD0058292A00906A6B0095727300A481
              8200A3808100A5838400A68687006D414100A4828200B69D9D00B89F9F00FBFA
              FA005E201C00825350007F443900AA8B8400B2968F007A3721007D3C24008B57
              4200997567009C310000972D000083422500966C5A00C4ACA1008E3205008434
              0D00A73A00009D3903009C3C0500983905008E441B00A0542800A9410200A442
              05009E3E0500923E0A00974E2000BFA59500B54A0200A7460500986B4C00996F
              5200CA550000C6520000965A2C009668450097694800B8998200D9620000BD57
              0500975823009E6A3F00A1704900E76D00009C653500AB5C0D00AF733800B177
              4000AB7E5100BA8E6200C19E7A00C7AD9300AD621400AF671B00B0681C00B26E
              2500B4732A00B4742C00BA885100BD956900C2A38100B67A3500B77B3700BA81
              4000BA834200D17D1100D4821800D4841B00D88C2400D88E2600DA963000DC96
              3100DE9F3E00E2AA4D00E5B25900E6B45C00E9BB6700E9BB6800EABF6E00EDC6
              7800EEC97E00EBC57600EFCF8700F2D49000F3D99700F4DEA000F6E2A600FAEB
              B600524F38003C3D2200414228002C351500243D130025401500345629002557
              1F0017561400004B0000004D010007650C0008670E00096A10000C7015000E75
              180013741C000D7518000F781B00117F1F0014832300178A2800168928001C93
              3000188F2D001E993500209E3900219F3A0023A43F0024A44400177A3C001873
              4C000F315D00DDE5FF007E9AFF0087A1FF008CA5FF0099B0FF00B0C1FF00B5C5
              FF00BCCBFF00D5DEFF003E64FF00496CFC005173FF005477FF005B7BFF006584
              FF006B8AFF007690FF00889FFF00ADBDFF00C1CEFF00C5D0FF00EAEEFF00143B
              FF00183EFF002249FF00274DFF002A51FF003658FF00375BFF00EDF0FF00072B
              FF00072CFF00082BFF00092EFF000B30FF000D32FF000F35FF001037FF00163C
              FF00001EFF00001FFF000121FF000324FF000325FF000528FF000628FF000019
              EE000016E6000720DE000F22C9001C2CBC001E30C400010FA1000310B400000C
              BF00020FBC00282DA400000397000D0D7F001D1F9300FFFFFF00000000000303
              030303ECECEC03030303030303030303030303030303030303E8E8DADADAECEC
              9C9C9C9C9C9B03030303030303030303E8DADADAC5DADADAE9B0A4A4A4A19C9C
              9C9C0303030303E8DBDACEBBEFC5E0DADAE7AFAEAEADABA9A7A09C9C030303E8
              DDD3C8C4C6C5C4DADAE2B1ACADABA9AAA8A6A59F9C03E8D5D1D6C0E0C5C3C5DA
              DADAB29892352E9499A2A3A09E9CE8CCD8D4D7B6EFEFCEDADADAED312A22111C
              3B21939A9D9CE8BFCDD7B9BBC7D9DCDBDADA01332C3211171C161B979D9C03EC
              C2D9EFBDB9BECADEDCE13A342C361113171C16969D0303ECB7C1BAD0D0EFCFD2
              DFEA4B232733111213171C9503030303ECB8B6B5B3BECBC9E31A4F2927341110
              121817110303030303ECB4B7B5C2BCE4002D2D28282F11151014181103030303
              0303EEE5E6EB026A775C627D7B671150493F3C11030303030303118E8C5D8784
              8378737F7D6E115B4C48441103030303030311908E588986847977807F701160
              574D4A11030303030303119190598C8B86747982817111655651561103030303
              03031147473D3E2B2B3726242530111D3B414111030303030303115F6C46756B
              74646469685C115445403F11030303030303118F8D5E88858378727E7C6E115A
              5248431103030303030311918F598A88857A77807E6F1160574C4A1103030303
              030311556D42766C756366777262116153534E11030303030303110E0F08060C
              0D201F1E1938110A07090B1103030303030311390E0F08060C0D201F1E2B1104
              0A0705110303030303031111111111111111111111111111111111110303}
          end
          object BitBtn1: TBitBtn
            Left = 254
            Top = 13
            Width = 246
            Height = 50
            Cursor = crHandPoint
            Hint = 'Baixar os cr'#233'ditos selecionados  - [IFI001]'
            Caption = 'Exportar Excel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtn1Click
            Glyph.Data = {
              4E010000424D4E01000000000000760000002800000012000000120000000100
              040000000000D800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770000007777777777777777770000007777777777770007770000007444
              4400000006007700000074FFFF08880600080700000074F008000060EE070700
              000074FFFFF8060EE0047700000074F0088060EE00F47700000074FFFF060EE0
              00747700000074F00800EE0EE0047700000074FFFF0EE0F0EE047700000074F0
              080000F000047700000074FFFFFFFFFFFFF47700000074444444444444447700
              000074F444F444F444F477000000744444444444444477000000777777777777
              777777000000777777777777777777000000}
          end
          object BitBtn2: TBitBtn
            Left = 506
            Top = 11
            Width = 246
            Height = 50
            Cursor = crHandPoint
            Hint = 'Baixar os cr'#233'ditos selecionados  - [IFI001]'
            Caption = 'Imprimir Cr'#233'ditos quitados pelo EDI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = BitBtn2Click
            Glyph.Data = {
              0E030000424D0E030000000000003600000028000000110000000E0000000100
              180000000000D802000000000000000000000000000000000000BFBFBFBFBFBF
              BFBFBF0000000000000000000000000000000000000000000000000000000000
              00000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BFBFBFBFBF
              BF00BFBFBF000000000000000000000000000000000000000000000000000000
              000000000000000000000000BFBFBF000000BFBFBF00BFBFBF000000BFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBF00FFFF00FFFF00FFFFBFBFBFBFBFBF000000
              000000000000BFBFBF00BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBF7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF000000BFBFBF000000BFBFBF00BFBF
              BF00000000000000000000000000000000000000000000000000000000000000
              0000000000000000BFBFBFBFBFBF00000000BFBFBF000000BFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BF
              BFBF00000000BFBFBFBFBFBF0000000000000000000000000000000000000000
              00000000000000000000BFBFBF000000BFBFBF00000000000000BFBFBFBFBFBF
              BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00BFBFBF000000BFBFBF00000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF
              000000000000000000000000000000FFFFFF000000000000000000000000BFBF
              BF00BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBF000000FFFFFF000000000000000000000000000000FFFFFF000000
              BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF00BFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000000000000000000000000000
              0000000000000000000000BFBFBFBFBFBF00}
          end
          object BitBtn4: TBitBtn
            Left = 815
            Top = 13
            Width = 75
            Height = 50
            Caption = '&Sair'
            TabOrder = 3
            OnClick = BitBtn4Click
            Glyph.Data = {
              0E060000424D0E06000000000000360000002800000016000000160000000100
              180000000000D8050000C30E0000C30E00000000000000000000FFFFFFF2F2F2
              F2F2F2D3D3D3E8E8E8F5F5F5DBDBDBDDDDDDECECECEEEEEED3D3D3EBEBEBF7F7
              F723230F4F4F00B2B2A8E9E9E9D6D6D6EBEBEBFAFAFAFFFFFFFFFFFF0000FFFF
              FFF0F0F0D8D8D8EDEDEDEAEAEADFDFDFDCDCDCF4F4F4E6E6E6D7D7D7F2F2F2E7
              E7E7DDDDDD4C4C0CFFFF006868119B9B9BF4F4F4E7E7E7DBDBDBE6E6E6FFFFFF
              0000D3D3D3E4E4E4EFEFEFE4E4E4D8D8D8EDEDEDF3F3F3D3D3D3E7E7E7F1F1F1
              DFDFDFDBDBDBECECEC4D4D0DFFFF008D8D00515105878781DFDFDFEDEDEDECEC
              ECD3D3D30000E6E6E6EDEDEDE1E1E1DBDBDBF5F5F5E3E3E3DCDCDCEAEAEAEAEA
              EAE0E0E0DBDBDBF6F6F6E3E3E34D4D0DFFFF008F8F007F7F0056560DA1A1A1E2
              E2E2DBDBDBF3F3F300004B4B4B5050504E4E4E4848484F4F4F5050504A4A4A4C
              4C4C444444F0F0F0F3F3F3D3D3D3E7E7E74E4E0EFFFF008F8F007F7F007D7D00
              4C4C0D3232324848484E4E4E0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBF4A4A4ADFDFDFDFDFDFE9E9E9EBEBEB4D4D0DFFFF008F8F007F7F
              007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFB0B0B0BFBFBF4040403F3F3F3737373737373F3F3F434303FFFF008F
              8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBF3D3D3D8F8F8F3E3E3E7F7F7F7F7F7F7F7F7F7F7F7F474707
              FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBF3C3C304D4D141515137F7F7F7F7F7F7F7F7F7F7F
              7F474707FFFF008D8D007777007D7D00474700636363BFBFBFBFBFBF0000BFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4646309A9A004545046161617F7F7F7F
              7F7F7F7F7F474707FFFF005F5F08171717676700474700636363BFBFBFBFBFBF
              0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF474727EDED0092920045450E
              6363637F7F7F7F7F7F474707FFFF004747276B6B6B676700474700636363BFBF
              BFBFBFBF0000AEAEAE57574531310A272700272700272700424200FFFF00F9F9
              009898004242006363637F7F7F474707FFFF007E7E002727006E6E0047470063
              6363BFBFBFBFBFBF00008989898C8C13CFCF01CFCF00CFCF00CFCF00D5D500FF
              FF00FFFF00EDED0098980045450E616161474707FFFF008F8F007F7F007F7F00
              474700636363BFBFBFBFBFBF0000898989A1A113FEFE2CFFFFAFFFFFAFFFFFAF
              FFFFAFFFFFAFFFFFDBFFFF6DE3E3004B4B095B5B5B474707FFFF008F8F007F7F
              007F7F00474700636363BFBFBFBFBFBF0000A7A7A76F6F4879790C7A7A0A7A7A
              0A7A7A0A8A8A09FFFF3EFFFF70E4E4005F5F005858587F7F7F474707FFFF008F
              8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFB1B1B1A9A9A9A9
              A9A9A9A9A9A9A9A94C4C2CFFFF0DE6E6075959085858537F7F7F7F7F7F474707
              FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBF505030E3E3005F5F035757577F7F7F7F7F7F7F7F
              7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4242356E6E2521211B7F7F7F7F7F7F7F
              7F7F7F7F7F5E5E52999906D5D5008787007F7F00474700636363BFBFBFBFBFBF
              0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7070708888884444447F7F7F
              7F7F7F7F7F7F7F7F7F7F7F7F565656999906DBDB00898900474700636363BFBF
              BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4444
              447F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5E5E529B9B03D7D7004C4C0076
              7676BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBF4141415656565656565656565656565656565656565656562E2E2E888807
              65650C888888BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBF9696968989898989898989898989898989898989898989898989
              89898989898989B1B1B1BFBFBFBFBFBF0000}
          end
        end
      end
      object tsHistorico: TTabSheet
        Caption = 'Hist'#243'rico - Log Arquivo'
        object Memo_Retorno: TMemo
          Left = 0
          Top = 41
          Width = 895
          Height = 432
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 895
          Height = 41
          Align = alTop
          Caption = 'Hist'#243'rico do Processamento'
          Color = clGradientInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object TabSheet_Relatorio1: TTabSheet
        Caption = 'Relat'#243'rio'
        ImageIndex = 3
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 895
          Height = 473
          HorzScrollBar.Position = 232
          Align = alClient
          TabOrder = 0
          object QuickRep_Retorno1: TQuickRep
            Left = -227
            Top = 47
            Width = 1123
            Height = 794
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmContasAReceber.qrRelConciliaCartao
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
            OnPreview = QuickRep_Retorno1Preview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poLandscape
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2100.000000000000000000
              100.000000000000000000
              2970.000000000000000000
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
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object QRBand1: TQRBand
              Left = 38
              Top = 211
              Width = 1047
              Height = 39
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
                103.187500000000000000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText10: TQRDBText
                Left = 1692
                Top = 3
                Width = 100
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  4476.750000000000000000
                  7.937500000000000000
                  264.583333333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmBoletos.cdsBoletos
                DataField = 'NOME_CLIENTE'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText13: TQRDBText
                Left = 744
                Top = 3
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1968.500000000000000000
                  7.937500000000000000
                  132.291666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'VALOR_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRDBText14: TQRDBText
                Left = 800
                Top = 3
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2116.666666666667000000
                  7.937500000000000000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'TAXA_CARTAO_CRED'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRDBText15: TQRDBText
                Left = 5
                Top = 3
                Width = 349
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  7.937500000000000000
                  923.395833333333200000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'NOME_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText16: TQRDBText
                Left = 5
                Top = 18
                Width = 349
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  47.625000000000000000
                  923.395833333333200000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'RAZAO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText17: TQRDBText
                Left = 961
                Top = 18
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2542.645833333333000000
                  47.625000000000000000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'DATQ_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText18: TQRDBText
                Left = 360
                Top = 3
                Width = 85
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  952.500000000000000000
                  7.937500000000000000
                  224.895833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'COD_TERMINAL_ADM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText19: TQRDBText
                Left = 961
                Top = 3
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2542.645833333333000000
                  7.937500000000000000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'DATA_VENC_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText1: TQRDBText
                Left = 877
                Top = 3
                Width = 68
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2320.395833333333000000
                  7.937500000000000000
                  179.916666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'TARIFA_CARTAO_CRED'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRDBText2: TQRDBText
                Left = 630
                Top = 18
                Width = 83
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1666.875000000000000000
                  47.625000000000000000
                  219.604166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'N_DOCNSU_ADM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRDBText3: TQRDBText
                Left = 630
                Top = 3
                Width = 83
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1666.875000000000000000
                  7.937500000000000000
                  219.604166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'N_AUT_CART'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText6: TQRDBText
                Left = 534
                Top = 18
                Width = 29
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1412.875000000000000000
                  47.625000000000000000
                  76.729166666666680000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'NPARCELA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRDBText7: TQRDBText
                Left = 532
                Top = 3
                Width = 74
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1407.583333333333000000
                  7.937500000000000000
                  195.791666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'N_DOC_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText8: TQRDBText
                Left = 360
                Top = 18
                Width = 166
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  952.500000000000000000
                  47.625000000000000000
                  439.208333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'DESC_TIPO_PROD_ADM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText9: TQRDBText
                Left = 455
                Top = 3
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1203.854166666667000000
                  7.937500000000000000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'DATA_VENDA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText11: TQRDBText
                Left = 856
                Top = 18
                Width = 99
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2264.833333333333000000
                  47.625000000000000000
                  261.937500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'DATA_BAIXA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel13: TQRLabel
                Left = 566
                Top = 18
                Width = 8
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1497.541666666667000000
                  47.625000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '/'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText12: TQRDBText
                Left = 575
                Top = 18
                Width = 30
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1521.354166666667000000
                  47.625000000000000000
                  79.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'QTDE_PARC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText20: TQRDBText
                Left = 737
                Top = 18
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1949.979166666667000000
                  47.625000000000000000
                  150.812500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'VL_VENDA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 8
              end
            end
            object QRBand2: TQRBand
              Left = 38
              Top = 38
              Width = 1047
              Height = 127
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
                336.020833333333400000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRHRule3: TQRHRule
                Left = -1
                Top = 75
                Width = 1045
                Height = 13
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  34.395833333333330000
                  -2.645833333333333000
                  198.437500000000000000
                  2764.895833333333000000)
                VertAdjust = 0
                Pen.Width = 2
              end
              object QRPLabel2: TQRPLabel
                Left = 5
                Top = 33
                Width = 169
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  13.229166666666670000
                  87.312500000000000000
                  447.145833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Relat'#243'rio de quita'#231#227'o'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 10
              end
              object QRSysData3: TQRSysData
                Left = 73
                Top = 52
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  193.145833333333300000
                  137.583333333333300000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel19: TQRLabel
                Left = 947
                Top = 52
                Width = 43
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2505.604166666667000000
                  137.583333333333300000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina :'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRSysData4: TQRSysData
                Left = 996
                Top = 52
                Width = 42
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2635.250000000000000000
                  137.583333333333300000
                  111.125000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel25: TQRLabel
                Left = 4
                Top = 52
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  137.583333333333300000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object lbEmpresa1: TQRLabel
                Left = 4
                Top = 1
                Width = 57
                Height = 32
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  84.666666666666680000
                  10.583333333333330000
                  2.645833333333333000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nome'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 18
              end
              object QRLabel30: TQRLabel
                Left = 1692
                Top = 87
                Width = 107
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  4476.750000000000000000
                  230.187500000000000000
                  283.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data da remessa'
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
                Left = 5
                Top = 83
                Width = 301
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  219.604166666666700000
                  796.395833333333200000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Nome do cliente'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel28: TQRLabel
                Left = 5
                Top = 98
                Width = 302
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  259.291666666666700000
                  799.041666666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Raz'#227'o social'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel32: TQRLabel
                Left = 360
                Top = 83
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  952.500000000000000000
                  219.604166666666700000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Terminal'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel33: TQRLabel
                Left = 544
                Top = 83
                Width = 62
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1439.333333333333000000
                  219.604166666666700000
                  164.041666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Num Doc'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRHRule4: TQRHRule
                Left = -1
                Top = 111
                Width = 1045
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  -2.645833333333333000
                  293.687500000000000000
                  2764.895833333333000000)
                VertAdjust = 0
                Pen.Width = 2
              end
              object QRLabel38: TQRLabel
                Left = 758
                Top = 83
                Width = 36
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2005.541666666667000000
                  219.604166666666700000
                  95.250000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Valor'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel40: TQRLabel
                Left = 814
                Top = 83
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2153.708333333333000000
                  219.604166666666700000
                  150.812500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Comiss'#227'o'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel43: TQRLabel
                Left = 961
                Top = 83
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2542.645833333333000000
                  219.604166666666700000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Data venc'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel44: TQRLabel
                Left = 961
                Top = 98
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2542.645833333333000000
                  259.291666666666700000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Data Quit'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel2: TQRLabel
                Left = 902
                Top = 83
                Width = 43
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2386.541666666667000000
                  219.604166666666700000
                  113.770833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Tarifa'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel3: TQRLabel
                Left = 577
                Top = 98
                Width = 29
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1526.645833333333000000
                  259.291666666666700000
                  76.729166666666680000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Parc'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel1: TQRLabel
                Left = 360
                Top = 98
                Width = 85
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  952.500000000000000000
                  259.291666666666700000
                  224.895833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Produto Adm'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel4: TQRLabel
                Left = 630
                Top = 83
                Width = 89
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1666.875000000000000000
                  219.604166666666700000
                  235.479166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Num Aut Cart'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel5: TQRLabel
                Left = 630
                Top = 98
                Width = 89
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1666.875000000000000000
                  259.291666666666700000
                  235.479166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Num Doc Adm'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel9: TQRLabel
                Left = 455
                Top = 83
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1203.854166666667000000
                  219.604166666666700000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data Venda'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel11: TQRLabel
                Left = 856
                Top = 99
                Width = 99
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2264.833333333333000000
                  261.937500000000000000
                  261.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Data R. Baixa'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel15: TQRLabel
                Left = 725
                Top = 99
                Width = 69
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1918.229166666667000000
                  261.937500000000000000
                  182.562500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Valor Vnd'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
            end
            object QRGroup1: TQRGroup
              Left = 38
              Top = 165
              Width = 1047
              Height = 46
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRGroup1BeforePrint
              Color = clWhite
              TransparentBand = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ForceNewColumn = False
              ForceNewPage = False
              ParentFont = False
              Size.Values = (
                121.708333333333400000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              Expression = 
                'qrRelConciliaCartao.COD_ADM + qrRelConciliaCartao.CODIGO_CTRL_CR' +
                'ED + qrRelConciliaCartao.AGENCIA_CTRL + qrRelConciliaCartao.N_CO' +
                'NTA_CTRL'
              FooterBand = QRBand4
              Master = QuickRep_Retorno1
              ReprintOnNewPage = False
              object QRDBText23: TQRDBText
                Left = 457
                Top = 21
                Width = 106
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1209.145833333333000000
                  55.562500000000000000
                  280.458333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'AGENCIA_CTRL'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText24: TQRDBText
                Left = 457
                Top = 4
                Width = 155
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1209.145833333333000000
                  10.583333333333330000
                  410.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'NUM_ESTAB_ADM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText25: TQRDBText
                Left = 696
                Top = 21
                Width = 153
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1841.500000000000000000
                  55.562500000000000000
                  404.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'N_CONTA_CTRL'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel46: TQRLabel
                Left = 394
                Top = 21
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1042.458333333333000000
                  55.562500000000000000
                  150.812500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Ag'#234'ncia:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel49: TQRLabel
                Left = 380
                Top = 4
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1005.416666666667000000
                  10.583333333333330000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Num Estab:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel51: TQRLabel
                Left = 584
                Top = 21
                Width = 106
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1545.166666666667000000
                  55.562500000000000000
                  280.458333333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Conta Corrente:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel52: TQRLabel
                Left = 17
                Top = 4
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  44.979166666666670000
                  10.583333333333330000
                  206.375000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Adm Cart'#227'o:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText26: TQRDBText
                Left = 101
                Top = 4
                Width = 28
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  267.229166666666700000
                  10.583333333333330000
                  74.083333333333320000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'COD_ADM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText27: TQRDBText
                Left = 135
                Top = 4
                Width = 244
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  357.187500000000000000
                  10.583333333333330000
                  645.583333333333200000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                BiDiMode = bdRightToLeft
                ParentBiDiMode = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'DESCRICAO_ADM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel7: TQRLabel
                Left = 31
                Top = 23
                Width = 64
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  82.020833333333340000
                  60.854166666666680000
                  169.333333333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Controle:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText4: TQRDBText
                Left = 101
                Top = 23
                Width = 28
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  267.229166666666700000
                  60.854166666666680000
                  74.083333333333320000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'CODIGO_CTRL_CRED'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText5: TQRDBText
                Left = 135
                Top = 23
                Width = 239
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  357.187500000000000000
                  60.854166666666680000
                  632.354166666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'NOME_CTRL'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel16: TQRLabel
                Left = 618
                Top = 4
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1635.125000000000000000
                  10.583333333333330000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Unificada:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText21: TQRDBText
                Left = 695
                Top = 6
                Width = 155
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1838.854166666667000000
                  15.875000000000000000
                  410.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Color = clWhite
                DataSet = dtmContasAReceber.qrRelConciliaCartao
                DataField = 'COD_EMP_MULT'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
            end
            object QRBand3: TQRBand
              Left = 38
              Top = 281
              Width = 1047
              Height = 41
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
                108.479166666666700000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRLabel45: TQRLabel
                Left = 63
                Top = 22
                Width = 81
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  166.687500000000000000
                  58.208333333333320000
                  214.312500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Valor:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel8: TQRLabel
                Left = 314
                Top = 22
                Width = 81
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  830.791666666666800000
                  58.208333333333320000
                  214.312500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Comiss'#227'o:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel10: TQRLabel
                Left = 562
                Top = 22
                Width = 81
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1486.958333333333000000
                  58.208333333333320000
                  214.312500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Tarifa:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel12: TQRLabel
                Left = 815
                Top = 22
                Width = 81
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2156.354166666667000000
                  58.208333333333320000
                  214.312500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Liquido:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel14: TQRLabel
                Left = 6
                Top = 3
                Width = 81
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  15.875000000000000000
                  7.937500000000000000
                  214.312500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Totais'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRExpr5: TQRExpr
                Left = 150
                Top = 22
                Width = 130
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  396.875000000000000000
                  58.208333333333320000
                  343.958333333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(VALOR_C)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 10
              end
              object QRExpr6: TQRExpr
                Left = 401
                Top = 22
                Width = 130
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1060.979166666667000000
                  58.208333333333320000
                  343.958333333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(TAXA_CARTAO_CRED)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 10
              end
              object QRExpr7: TQRExpr
                Left = 649
                Top = 22
                Width = 130
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1717.145833333333000000
                  58.208333333333320000
                  343.958333333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(TARIFA_CARTAO_CRED)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 10
              end
              object QRExpr8: TQRExpr
                Left = 902
                Top = 22
                Width = 130
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2386.541666666667000000
                  58.208333333333320000
                  343.958333333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(VALOR_C) - SUM(TAXA_CARTAO_CRED) - SUM(TARIFA_CARTAO_CRED)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 10
              end
            end
            object QRBand4: TQRBand
              Left = 38
              Top = 250
              Width = 1047
              Height = 31
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
              LinkBand = QRGroup1
              Size.Values = (
                82.020833333333340000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbGroupFooter
              object QRExpr1: TQRExpr
                Left = 709
                Top = 8
                Width = 85
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1875.895833333333000000
                  21.166666666666670000
                  224.895833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(VALOR_C)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRExpr2: TQRExpr
                Left = 800
                Top = 8
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2116.666666666667000000
                  21.166666666666670000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(TAXA_CARTAO_CRED)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRLabel55: TQRLabel
                Left = 5
                Top = 8
                Width = 113
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  21.166666666666670000
                  298.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Total Acumulado:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRExpr3: TQRExpr
                Left = 877
                Top = 8
                Width = 68
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2320.395833333333000000
                  21.166666666666670000
                  179.916666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(TARIFA_CARTAO_CRED)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRExpr4: TQRExpr
                Left = 961
                Top = 8
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2542.645833333333000000
                  21.166666666666670000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(VALOR_C) - SUM(TAXA_CARTAO_CRED) - SUM(TARIFA_CARTAO_CRED)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRLabel6: TQRLabel
                Left = 951
                Top = 8
                Width = 8
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2516.187500000000000000
                  21.166666666666670000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '='
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRShape2: TQRShape
                Left = 4
                Top = 27
                Width = 1040
                Height = 1
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  2.645833333333333000
                  10.583333333333330000
                  71.437500000000000000
                  2751.666666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
          object pnRelatorio: TPanel
            Left = 32
            Top = 5
            Width = 358
            Height = 191
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object GroupBox5: TGroupBox
              Left = 8
              Top = 0
              Width = 333
              Height = 74
              Caption = 'Per'#237'odo'
              TabOrder = 0
              object Label12: TLabel
                Left = 17
                Top = 45
                Width = 53
                Height = 13
                Caption = 'Data Inicial'
              end
              object Label13: TLabel
                Left = 182
                Top = 45
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Data Final'
              end
              object MaskEdit1: TMaskEdit
                Left = 76
                Top = 42
                Width = 78
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
              object MaskEdit2: TMaskEdit
                Left = 236
                Top = 42
                Width = 78
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object RadioButton1: TRadioButton
                Left = 16
                Top = 19
                Width = 145
                Height = 17
                Caption = 'Data Quita'#231#227'o Financeiro'
                Checked = True
                TabOrder = 2
                TabStop = True
              end
              object RadioButton2: TRadioButton
                Left = 182
                Top = 19
                Width = 123
                Height = 17
                Caption = 'Data Processamento'
                TabOrder = 3
              end
            end
            object GroupBox6: TGroupBox
              Left = 8
              Top = 79
              Width = 333
              Height = 49
              Caption = 'Ordem do Relat'#243'rio'
              TabOrder = 1
              object ComboBox1: TComboBox
                Left = 76
                Top = 20
                Width = 238
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = 'Data Venda'
                Items.Strings = (
                  'Data Venda'
                  'Nome do Cliente'
                  'Razao Social'
                  'Data Vencimento'
                  'Data Quitacao'
                  'Num Documento'
                  'Num Aut Cartao'
                  'Num Doc Adm'
                  'Parcela'
                  'Produto Adm'
                  'Terminal Adm'
                  'Valor'
                  'Comissao'
                  'Tarifa')
              end
            end
            object Panel3: TPanel
              Left = 8
              Top = 132
              Width = 333
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn5: TBitBtn
                Left = 86
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Imprimir'
                TabOrder = 0
                OnClick = BitBtn5Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FF959595787878787878787878787878787878787878939393FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878FEFEFEFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF797979FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF787878FFFFFFD9BB9ED9BB9ED9BB9ED9BB9EFFFFFF797979FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF797979FF00FFFF00FFFF00FFFF00FF868686787878
                  787878787878787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7979797878
                  787878787878788C8C8C787878FF00FFFF00FF78787878787878787878787878
                  7878787878787878787878787878787878787878787878787878787878787878
                  7878787878787878787878787878787878787878787878787878787878787878
                  7878787878787878787878787878787878787878787878787878787878787878
                  7878787878787878787878787878787878787878787878787878787878787878
                  D7D7D7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
                  FED9D9D9787878787878787878787878FCFCFCBC8956B3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EBD8957FEFEFE787878787878787878787878
                  FBFBFAB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EFDFDFC787878787878848484787878FBFBFAB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFDFDFC787878898989FF00FFFF00FF
                  FF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7AFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFEFEFE787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF7A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE787878FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93939378787878787878
                  7878787878787878787878959595FF00FFFF00FFFF00FFFF00FF}
              end
              object BitBtn6: TBitBtn
                Left = 167
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Sair'
                TabOrder = 1
                OnClick = BitBtn6Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7DA83E7DA83E
                  7DA83E7DA83E7DA83E7DA83E7DA83EFF00FFFF00FFFF00FFFF00FFFF00FF7CA7
                  3E7CA83E7DA83EFF00FF7CA73E7CA73E7CA73E7CA73E7CA73E7CA73E7CA73E7C
                  A73EFF00FFFF00FFFF00FFFF00FF9EBB767CA73E7CA73EC1CEAD7CA73E7CA73E
                  7CA73E7CA73E81AA467CA73E7CA73E7CA73E7CA73EFF00FFFF00FFFF00FFC0CE
                  AA7CA73E7CA73EA6BF837DA73F7CA73E7CA73E7CA73E7CA73EB6C89BFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF7CA73E7CA73E90B35F7DA73F7CA73E
                  7CA73E7CA73E7CA73E7CA73EB1C593FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF7CA73F7CA73E83AB497CA73E7CA73E7CA73EABC28A7CA73E7CA73E7CA73EB1
                  C593FF00FFFF00FFFF00FFFF00FFFF00FF88AE527CA73E7DA73F7EA8417CA73E
                  7CA73EFF00FFA5BE817CA73E7CA73E7CA73EA1BC7AFF00FFFF00FFFF00FFFF00
                  FF7CA73E7CA73E8BAF56FF00FF7CA73E7CA73EFF00FFFF00FFA4BE7F7CA73E7C
                  A73E7CA73E7CA73E94B6668FB15C7CA73E7CA73E7CA73EBBCBA4FF00FFFF00FF
                  7CA73FFF00FFFF00FFFF00FFB3C7987CA73E7CA73E7CA73E7CA73E7CA73E7CA7
                  3E7CA73E9FBB77FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFA5BF8183AB4A7CA73E7CA73E8DB15AC3D0B1FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
          end
        end
      end
    end
  end
  object FileListBox1: TFileListBox
    Left = 737
    Top = 108
    Width = 145
    Height = 97
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object PopupMenu1: TPopupMenu
    Left = 549
    Top = 250
    object ApagarPendnciaSelecionada1: TMenuItem
      Caption = 'Apagar Pend'#234'ncia Selecionada'
      OnClick = ApagarPendnciaSelecionada1Click
    end
  end
end
