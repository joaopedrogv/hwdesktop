object frmEscolhaProdutoPedvenda: TfrmEscolhaProdutoPedvenda
  Left = 0
  Top = 0
  Caption = 'Escolha o Produto'
  ClientHeight = 266
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 234
    Width = 800
    Height = 32
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 320
      Top = 2
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
      Top = 2
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
  object pnStatusProcessamento: TPanel
    Left = 498
    Top = 224
    Width = 481
    Height = 42
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object lbStatusProcessamento: TLabel
      Left = 2
      Top = 2
      Width = 477
      Height = 17
      Align = alTop
      AutoSize = False
      Caption = 'Status do processamento'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lbTextoProcessamento: TLabel
      Left = 2
      Top = 19
      Width = 477
      Height = 21
      Align = alClient
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 4
      ExplicitHeight = 18
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 800
    Height = 234
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object GroupBoxProd: TGroupBox
        Left = 0
        Top = 0
        Width = 792
        Height = 206
        Align = alClient
        Caption = 'Produtos'
        TabOrder = 0
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 788
          Height = 20
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
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
        object DBGrid1: TDBGrid
          Left = 288
          Top = 35
          Width = 502
          Height = 169
          Align = alClient
          DataSource = DtmPedVenda.dsProd
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu1
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnColumnMoved = DBGrid1ColumnMoved
          OnExit = DBGrid1Exit
          OnKeyDown = DBGrid1KeyDown
          OnTitleClick = DBGrid1TitleClick
        end
        object GroupBox1: TGroupBox
          Left = 2
          Top = 35
          Width = 286
          Height = 169
          Align = alLeft
          Caption = 'Configura'#231#227'o das Colunas'
          TabOrder = 2
          Visible = False
          object ScrollBox1: TScrollBox
            Left = 2
            Top = 15
            Width = 282
            Height = 152
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBoxServ: TGroupBox
        Left = 0
        Top = 0
        Width = 792
        Height = 206
        Align = alClient
        Caption = 'Servi'#231'os'
        TabOrder = 0
        ExplicitHeight = 113
        object DBGrid2: TDBGrid
          Left = 288
          Top = 15
          Width = 502
          Height = 189
          Align = alClient
          DataSource = DtmPedVenda.dsTipoServico
          Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu2
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnColumnMoved = DBGrid2ColumnMoved
          OnExit = DBGrid2Exit
          OnKeyDown = DBGrid2KeyDown
          OnTitleClick = DBGrid2TitleClick
        end
        object GroupBox2: TGroupBox
          Left = 2
          Top = 15
          Width = 286
          Height = 189
          Align = alLeft
          Caption = 'Configura'#231#227'o das Colunas'
          TabOrder = 1
          Visible = False
          ExplicitHeight = 96
          object ScrollBox2: TScrollBox
            Left = 2
            Top = 15
            Width = 282
            Height = 172
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitHeight = 79
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 176
    object ConfigurarColunas1: TMenuItem
      Caption = 'Configurar Colunas'
      OnClick = ConfigurarColunas1Click
    end
    object ResetarConfiguraesdecolunas1: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = ResetarConfiguraesdecolunas1Click
    end
    object SalvardadosnoExcel1: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = SalvardadosnoExcel1Click
    end
    object ReajustarLarguradascolunas1: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = ReajustarLarguradascolunas1Click
    end
    object Copiarparareadetransferncia1: TMenuItem
      Caption = 'Copiar para area de transfer'#234'ncia'
      OnClick = Copiarparareadetransferncia1Click
    end
    object Somarvaloresdacoluna1: TMenuItem
      Caption = 'Somar valores da coluna'
      OnClick = Somarvaloresdacoluna1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 43
    Top = 48
    object ConfigurarColunas2: TMenuItem
      Caption = 'Configurar Colunas'
      OnClick = ConfigurarColunas2Click
    end
    object ResetarConfiguraesdecolunas2: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = ResetarConfiguraesdecolunas2Click
    end
    object SalvardadosnoExcel2: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = SalvardadosnoExcel2Click
    end
    object ReajustarLarguradascolunas2: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = ReajustarLarguradascolunas2Click
    end
    object Copiarparareadetransferncia2: TMenuItem
      Caption = 'Copiar para area de transfer'#234'ncia'
      OnClick = Copiarparareadetransferncia2Click
    end
    object Somarvaloresdacoluna2: TMenuItem
      Caption = 'Somar valores da coluna'
      OnClick = Somarvaloresdacoluna2Click
    end
  end
end
