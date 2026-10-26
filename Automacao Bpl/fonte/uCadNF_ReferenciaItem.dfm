inherited FrmCadNF_ReferenciaItem: TFrmCadNF_ReferenciaItem
  Left = 0
  Top = 0
  Caption = 'Referencia de Item com NFe'
  Position = poScreenCenter
  OnDestroy = FormDestroy
  ExplicitWidth = 792
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 778
    Height = 458
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 784
    ExplicitHeight = 464
    object GroupBox77: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 772
      Height = 452
      Align = alClient
      Caption = 
        'Dados da NF Referenciada - Informar abaixo a nota fiscal e o Ite' +
        'm referenciado'
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 132
      ExplicitWidth = 734
      ExplicitHeight = 282
      object Panel117: TPanel
        Left = 2
        Top = 409
        Width = 768
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 239
        ExplicitWidth = 730
        object BitBtn132: TBitBtn
          Left = 335
          Top = 8
          Width = 97
          Height = 25
          Caption = 'Referenciar'
          TabOrder = 0
          OnClick = BitBtn132Click
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
      object GroupBox78: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 52
        Width = 762
        Height = 354
        Align = alClient
        Caption = 'Selecione o Item desta nota fiscal para referenciar '
        TabOrder = 1
        ExplicitLeft = 2
        ExplicitTop = 59
        ExplicitWidth = 730
        ExplicitHeight = 180
        object DBGrid34: TDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 752
          Height = 331
          Align = alClient
          DragCursor = crDefault
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid34DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'NITEM'
              Title.Caption = 'N'#186' Item'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NITEM_XML'
              Title.Caption = 'N'#186' Item XML'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO_ITEM'
              Title.Caption = 'Descri'#231#227'o'
              Width = 318
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTIDADE'
              Title.Caption = 'Qtde'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_UNITARIO'
              Title.Caption = 'Valor Unit'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Title.Caption = 'Valot Tot'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_FAB_PROD'
              Title.Caption = 'Num Fab prod'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_NOP'
              Title.Caption = 'CFOP'
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
              Title.Caption = 'Unid'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERMITIR_DESCONTO'
              Title.Caption = 'Permitir Desconto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERC_DESCONTO'
              Title.Caption = 'Desconto %'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_DESCONTO_PERC'
              Title.Caption = 'Desconto $'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RATEIO_DESCONTO'
              Title.Caption = 'Rateio Desc $'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NCM'
              Title.Caption = 'NCM/SH'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALIQ_ICM'
              Title.Caption = '% ICMS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASE_ICM'
              Title.Caption = 'Base ICM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ICM'
              Title.Caption = 'Valor ICM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERC_RED_PROD'
              Title.Caption = '% Red Base'
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
              Title.Caption = '% ICMS Sub'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASE_ICMSUB'
              Title.Caption = 'Base ICMS Sub'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ICMSUB'
              Title.Caption = 'Valor ICMS Sub'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALIQ_IPI'
              Title.Caption = '% IPI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASE_IPI'
              Title.Caption = 'Base IPI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_IPI'
              Title.Caption = 'Valor IPI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERC_RED_IPI'
              Title.Caption = '% Red IPI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASE_ICMANT_SUB'
              Title.Caption = 'Base ICMS Ant'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ICMANT_SUB'
              Title.Caption = 'Valor ICMS Ant'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RATEIO_SEGURO'
              Title.Caption = 'Seguro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RATEIO_OUTDESP'
              Title.Caption = 'Out Despesas'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RATEIO_FRETE'
              Title.Caption = 'Frete'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLISENTO'
              Title.Caption = 'Isento $'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLOUTRAS'
              Title.Caption = 'Outras $'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLN_TRIB'
              Title.Caption = 'N'#227'o Trib $'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_ITEM'
              Title.Caption = 'Tipo'
              Visible = True
            end>
        end
      end
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 768
        Height = 34
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label480: TLabel
          Left = 414
          Top = 8
          Width = 65
          Height = 13
          BiDiMode = bdRightToLeft
          Caption = 'N'#250'mero/Serie'
          ParentBiDiMode = False
        end
        object Label481: TLabel
          Left = 685
          Top = 8
          Width = 37
          Height = 13
          BiDiMode = bdRightToLeft
          Caption = 'N'#186' Item'
          ParentBiDiMode = False
        end
        object Label482: TLabel
          Left = 582
          Top = 8
          Width = 38
          Height = 13
          BiDiMode = bdRightToLeft
          Caption = 'Emiss'#227'o'
          ParentBiDiMode = False
        end
        object Label1: TLabel
          Left = 13
          Top = 13
          Width = 68
          Height = 13
          BiDiMode = bdRightToLeft
          Caption = 'Chave da NFe'
          ParentBiDiMode = False
        end
        object edNumero: TEdit
          Left = 486
          Top = 5
          Width = 58
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = '999999999'
        end
        object edSerie: TEdit
          Left = 551
          Top = 5
          Width = 25
          Height = 21
          Enabled = False
          TabOrder = 1
          Text = '999'
        end
        object edEmissao: TEdit
          Left = 627
          Top = 5
          Width = 48
          Height = 21
          Enabled = False
          TabOrder = 2
          Text = '99/9999'
        end
        object edChaveNFe: TMaskEdit
          Left = 88
          Top = 5
          Width = 321
          Height = 21
          Enabled = False
          EditMask = 
            '9999\-9999\-9999\-9999\-9999\-9999\-9999\-9999\-9999\-9999\-9999' +
            ';0;_'
          MaxLength = 54
          TabOrder = 3
        end
        object edNItemNFeRef: TEditHw
          Left = 728
          Top = 5
          Width = 30
          Height = 21
          Enabled = False
          TabOrder = 4
          Text = ' 000'
          Formato = fInteger
          FormatSize = '0.2'
          DisplayFormat = '000'
        end
      end
    end
  end
end
