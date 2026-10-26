inherited frmCadNFFretePorPeso: TfrmCadNFFretePorPeso
  Caption = 'C'#225'lculo de frete por peso'
  ClientHeight = 469
  ClientWidth = 836
  Position = poScreenCenter
  OnDestroy = FormDestroy
  ExplicitWidth = 844
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 836
    Height = 469
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 9
    TabOrder = 0
    object Panel2: TPanel
      Left = 9
      Top = 9
      Width = 818
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 0
        Width = 73
        Height = 13
        Caption = 'Frete calculado'
      end
      object lbAlerta: TLabel
        Left = 176
        Top = 8
        Width = 593
        Height = 27
        Alignment = taCenter
        AutoSize = False
        Caption = 
          '** A nota fiscal j'#225' possui frete dentro da NF, o sistema ir'#225' cal' +
          'cular o frete e armazenar no campo Outras Despesas PF **'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object edFreteCalculado: TEditHw
        Left = 16
        Top = 19
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = '                      0,00'
        Formato = fNumber
        FormatSize = '0.2'
      end
    end
    object Panel3: TPanel
      Left = 9
      Top = 50
      Width = 818
      Height = 369
      Align = alClient
      BevelOuter = bvNone
      Padding.Top = 6
      Padding.Bottom = 6
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 6
        Width = 818
        Height = 357
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColEnter = DBGrid1ColEnter
        OnColExit = DBGrid1ColExit
        OnExit = DBGrid1Exit
        OnKeyDown = DBGrid1KeyDown
        OnMouseActivate = DBGrid1MouseActivate
        Columns = <
          item
            Expanded = False
            FieldName = 'NITEM'
            Title.Caption = 'N'#186' item'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE'
            Title.Caption = 'Und'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FRETEPR'
            Title.Caption = '$ Frete Fonecedor'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESO'
            Title.Caption = 'Peso Fornecedor'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FRETENF'
            Title.Caption = '$ Frete calc item'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Quantidade'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCR_PROD'
            Title.Caption = 'Produto'
            Width = 284
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_FAB_PROD'
            Title.Caption = 'Num fab prod'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Valor total'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRUPO_PROD'
            Title.Caption = 'Grupo prod'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESO_LIQ_PROD'
            Title.Caption = 'Peso Liq Prod'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_PROD'
            Title.Caption = 'Cod prod'
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 9
      Top = 419
      Width = 818
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 16
        Top = 6
        Width = 233
        Height = 25
        Caption = 'Salvar Frete por Unidade nos produtos'
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object Panel5: TPanel
        Left = 440
        Top = 0
        Width = 374
        Height = 37
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtn2: TBitBtn
          Left = 283
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Confirmar'
          TabOrder = 2
          OnClick = BitBtn2Click
        end
        object edFreteAjustado: TEditHw
          Left = 167
          Top = 6
          Width = 97
          Height = 21
          Enabled = False
          TabOrder = 1
          Text = '                      0,00'
          Formato = fNumber
          FormatSize = '0.2'
        end
        object ckAjustarFrete: TCheckBox
          Left = 8
          Top = 10
          Width = 153
          Height = 17
          Caption = 'Ajustar valor de frete para'
          TabOrder = 0
          OnClick = ckAjustarFreteClick
        end
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = ClientDataSet1BeforePost
    BeforeScroll = ClientDataSet1BeforeScroll
    Left = 408
    Top = 240
  end
end
