inherited FrmCotacaoVenda: TFrmCotacaoVenda
  Left = 323
  Top = 9
  Caption = 'Sugest'#227'o para Venda de produtos'
  ClientHeight = 310
  ClientWidth = 585
  Position = poScreenCenter
  OnCreate = FormCreate
  ExplicitLeft = 323
  ExplicitTop = 9
  ExplicitWidth = 601
  ExplicitHeight = 348
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 262
    Top = 277
    Width = 75
    Height = 25
    Caption = 'Sair'
    Default = True
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 585
    Height = 271
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Nova Sugest'#227'o'
      ExplicitLeft = -36
      ExplicitTop = 40
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 577
        Height = 209
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 11
          Top = 11
          Width = 128
          Height = 13
          Caption = 'Qtde dias Dispon'#237'veis M'#234's:'
        end
        object Label2: TLabel
          Left = 2
          Top = 30
          Width = 137
          Height = 13
          Caption = 'Curvas a Serem  Analisadas:'
        end
        object LbContador: TLabel
          Left = 11
          Top = 168
          Width = 6
          Height = 13
          Caption = '0'
        end
        object Edit1: TEdit
          Left = 144
          Top = 3
          Width = 49
          Height = 21
          TabOrder = 0
        end
        object CheckListBox1: TCheckListBox
          Left = 144
          Top = 26
          Width = 121
          Height = 47
          ItemHeight = 13
          Items.Strings = (
            'A'
            'B'
            'C')
          TabOrder = 1
        end
        object CheckBox1: TCheckBox
          Left = 11
          Top = 80
          Width = 254
          Height = 17
          Caption = 'Verificar Produtos Com Classe Atualidade = "R"'
          TabOrder = 2
        end
      end
      object BitBtn2: TBitBtn
        Left = 3
        Top = 215
        Width = 143
        Height = 25
        Caption = 'Nova Sugest'#227'o >>'
        TabOrder = 1
        OnClick = BitBtn2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Sugest'#245'es j'#225' Feitas'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 577
        Height = 201
        Align = alTop
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object BitBtn3: TBitBtn
        Left = 2
        Top = 214
        Width = 143
        Height = 25
        Caption = 'Obter Sugest'#227'o >>'
        TabOrder = 1
      end
      object BitBtn4: TBitBtn
        Left = 151
        Top = 215
        Width = 106
        Height = 25
        Caption = 'Excluir Sugest'#227'o'
        TabOrder = 2
      end
      object BitBtn5: TBitBtn
        Left = 263
        Top = 215
        Width = 178
        Height = 25
        Caption = 'Verificar margem Por Produto >>'
        TabOrder = 3
        OnClick = BitBtn5Click
      end
    end
  end
  object ProgressContador: TProgressBar
    Left = 12
    Top = 208
    Width = 565
    Height = 17
    TabOrder = 2
  end
end
