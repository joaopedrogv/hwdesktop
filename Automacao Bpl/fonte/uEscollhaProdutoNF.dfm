inherited frmEscolhaProdutoNf: TfrmEscolhaProdutoNf
  Caption = 'Escolha o Produto para compor a Nota Fiscal'
  ClientHeight = 266
  ClientWidth = 800
  Position = poMainFormCenter
  ExplicitWidth = 808
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 113
    Width = 800
    Height = 171
    Align = alTop
    Caption = 'Produtos'
    TabOrder = 0
    Visible = False
    object DBGrid1: TDBGrid
      Left = 2
      Top = 35
      Width = 796
      Height = 134
      Align = alClient
      DataSource = dtmNF.dsProd
      Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnExit = DBGrid1Exit
      OnKeyDown = DBGrid1KeyDown
      OnTitleClick = DBGrid1TitleClick
      Columns = <
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
          Width = 392
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PREC_TAB_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Tabela'
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'CST_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'CST'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ICM_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'ICMS'
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'CODIGO_NOP'
          Title.Caption = 'CFOP'
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
          FieldName = 'UNIDADE'
          Title.Caption = 'Referencia'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PERMITIR_DESCONTO'
          Title.Alignment = taCenter
          Title.Caption = 'Desconto Permitido'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EM_PROMOCAO'
          Title.Alignment = taCenter
          Title.Caption = 'Promo'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_PROMOCAO'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Promocional'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PREC_30_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o 30 dias'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PREC_60_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o 60 dias'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PREC_90_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o 90 dias'
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO1'
          Visible = True
        end
        item
          Alignment = taLeftJustify
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
        end>
    end
    object Panel2: TPanel
      Left = 2
      Top = 15
      Width = 796
      Height = 20
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object DBText1: TDBText
        Left = 338
        Top = 3
        Width = 169
        Height = 17
        DataField = 'DESCRICAO'
        DataSource = dtmNF.dsProd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 513
        Top = 3
        Width = 223
        Height = 17
        DataField = 'DESCRICAO1'
        DataSource = dtmNF.dsProd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 289
        Top = 3
        Width = 43
        Height = 13
        Caption = 'Grade: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 212
    Width = 800
    Height = 54
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn2: TBitBtn
      Left = 320
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Assume'
      TabOrder = 0
      OnClick = BitBtn2Click
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
    object BitBtn4: TBitBtn
      Left = 401
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn4Click
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 800
    Height = 113
    Align = alTop
    Caption = 'Servi'#231'os'
    TabOrder = 1
    Visible = False
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 796
      Height = 96
      Align = alClient
      DataSource = dtmNF.dsServ
      Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnExit = DBGrid2Exit
      OnKeyDown = DBGrid2KeyDown
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_SERVICO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_NOP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_SERVICO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_SERVICO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALIQ_ISS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ISENTO_SERV'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_INCIDENCIA_SERV'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STIPO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHONDA'
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 688
    Top = 192
    object ConfigurarColunas1: TMenuItem
      Caption = 'Configurar Colunas'
      OnClick = ConfigurarColunas1Click
    end
  end
end
