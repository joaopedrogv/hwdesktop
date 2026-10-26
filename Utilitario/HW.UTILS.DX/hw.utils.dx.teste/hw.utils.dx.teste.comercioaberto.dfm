object TFrmTesteComercioAbertoApi: TTFrmTesteComercioAbertoApi
  Left = 0
  Top = 0
  Caption = 'TFrmTesteComercioAbertoApi'
  ClientHeight = 295
  ClientWidth = 922
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 922
    Height = 65
    Align = alTop
    Caption = 'Url Api'
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 711
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Login'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object ed_cnpj_login: TComboBox
      Left = 560
      Top = 24
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'ed_cnpj_login'
      Items.Strings = (
        '03530705000109'
        '32169618000176'
        '20985278000172')
    end
    object ed_url: TComboBox
      Left = 16
      Top = 24
      Width = 538
      Height = 21
      TabOrder = 0
      Text = 'ed_url'
      Items.Strings = (
        'hwsistemas.homelinux.com/apihdesk/api')
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 65
    Width = 922
    Height = 80
    ActivePage = TabSheet3
    Align = alTop
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Utils'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 914
        Height = 47
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 17
          Top = 14
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cnpj'
        end
        object BitBtn1: TBitBtn
          Left = 172
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Chave'
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object ed_cnpj: TEdit
          Left = 45
          Top = 10
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'ed_cnpj'
        end
        object BitBtn7: TBitBtn
          Left = 253
          Top = 8
          Width = 75
          Height = 25
          Caption = 'BitBtn7'
          TabOrder = 2
          OnClick = BitBtn7Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Via DLL'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 914
        Height = 41
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object Label2: TLabel
          Left = 12
          Top = 11
          Width = 31
          Height = 13
          Caption = 'Label2'
        end
        object Label3: TLabel
          Left = 119
          Top = 12
          Width = 76
          Height = 13
          Caption = 'Banco de dados'
        end
        object ed_codemp: TEdit
          Left = 49
          Top = 8
          Width = 64
          Height = 21
          TabOrder = 0
          Text = '1'
        end
        object ed_database: TComboBox
          Left = 201
          Top = 8
          Width = 500
          Height = 21
          ItemIndex = 1
          TabOrder = 1
          Text = 'joaopedro-pc:D:\Hw\bases\construcenter\hwauto.fdb'
          Items.Strings = (
            'joaopedro-pc:D:\Hw\bases\producao\Hwauto.fdb'
            'joaopedro-pc:D:\Hw\bases\construcenter\hwauto.fdb')
        end
        object BitBtn5: TBitBtn
          Left = 788
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Cad Produto'
          TabOrder = 2
          OnClick = BitBtn5Click
        end
        object BitBtn6: TBitBtn
          Left = 707
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Cad Lojista'
          TabOrder = 3
          OnClick = BitBtn6Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 2
      object Label4: TLabel
        Left = 7
        Top = 24
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo'
      end
      object Label5: TLabel
        Left = 169
        Top = 24
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Codigo'
      end
      object Label6: TLabel
        Left = 341
        Top = 24
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grade'
      end
      object BitBtn3: TBitBtn
        Left = 503
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Enviar'
        TabOrder = 3
        OnClick = BitBtn3Click
      end
      object ed_grupo: TEdit
        Left = 42
        Top = 18
        Width = 121
        Height = 21
        TabOrder = 0
        Text = '1'
      end
      object ed_codigo: TEdit
        Left = 208
        Top = 18
        Width = 121
        Height = 21
        TabOrder = 1
        Text = '16656'
      end
      object BitBtn4: TBitBtn
        Left = 584
        Top = 17
        Width = 75
        Height = 25
        Caption = 'Peri'#243'dico'
        TabOrder = 4
        OnClick = BitBtn4Click
      end
      object ed_grade: TEdit
        Left = 376
        Top = 18
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '0'
      end
      object BitBtn8: TBitBtn
        Left = 665
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Notificacoes'
        TabOrder = 5
        OnClick = BitBtn8Click
      end
    end
  end
  object ed_log: TMemo
    Left = 0
    Top = 145
    Width = 922
    Height = 150
    Align = alClient
    Lines.Strings = (
      'ed_log')
    TabOrder = 2
  end
end
