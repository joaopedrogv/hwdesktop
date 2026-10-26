inherited frmListar: TfrmListar
  BorderStyle = bsSingle
  Caption = 'Listar'
  ClientHeight = 286
  ClientWidth = 830
  Position = poScreenCenter
  ExplicitWidth = 836
  ExplicitHeight = 318
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid_Listar: TDBGrid
    Left = 0
    Top = 0
    Width = 830
    Height = 216
    Align = alClient
    Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid_ListarDblClick
    OnKeyPress = DBGrid_ListarKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 400
        Visible = True
      end>
  end
  object StatusBar_Listar: TStatusBar
    Left = 0
    Top = 267
    Width = 830
    Height = 19
    Panels = <
      item
        Text = 
          'Para busca r'#225'pida digite a palavra. Para limpar a busca digite E' +
          'SC'
        Width = 320
      end
      item
        Bevel = pbRaised
        Text = 'Palavra da busca :'
        Width = 95
      end
      item
        Bevel = pbRaised
        Width = 50
      end>
  end
  object Panel_Listar: TPanel
    Left = 0
    Top = 216
    Width = 830
    Height = 51
    Align = alBottom
    Caption = 'Duplo clique<ou Enter> para inserir'
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object SpeedButton_Novo: TSpeedButton
      Left = 6
      Top = 5
      Width = 38
      Height = 31
      Cursor = crHandPoint
      Hint = 'Cadastrar nova TAG - [BAS168]'
      Caption = 'Novo'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABAF2D5B1F0D0A7EECB9DEBC7
        93F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFFFEF7F2FAEFE6F8EAD9F7
        E3CFF6E0C5F2DABBF2D4B1F0D0A7EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFFFFFEFCFCF6F0FAEFE6F7EADAF6E3CFF4E0C5F3D9BBF3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFFFFFFFFFFFEFCFEF7F0FA
        EFE5F8EAD9F7E5CEF6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFFFFFEFCFCF7F0FAEFE5F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFCFCF6EFFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = SpeedButton_NovoClick
    end
    object Label_Pesquisa: TLabel
      Left = 411
      Top = 4
      Width = 67
      Height = 13
      Caption = 'Pesquisar por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object RadioButton_Pesquisa1: TRadioButton
      Left = 411
      Top = 18
      Width = 113
      Height = 17
      Caption = 'RadioButton_Pesquisa1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = RadioButton_Pesquisa1Click
    end
    object RadioButton_Pesquisa2: TRadioButton
      Left = 411
      Top = 33
      Width = 113
      Height = 17
      Caption = 'RadioButton_Pesquisa2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = RadioButton_Pesquisa2Click
    end
  end
end
