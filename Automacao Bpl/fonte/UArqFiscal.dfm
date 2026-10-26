inherited FrmArqUsados: TFrmArqUsados
  Left = 233
  Top = 134
  Caption = 'Arquivos Usados pelo Fiscal...'
  ClientHeight = 465
  ClientWidth = 515
  ExplicitWidth = 523
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 515
    Height = 216
    Align = alTop
    DataSource = dtmTerminaisF.DtArquivosFiscal
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 257
    Width = 515
    Height = 41
    Align = alTop
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 88
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object Button1: TButton
      Left = 169
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object BitBtn2: TBitBtn
      Left = 250
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 331
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 298
    Width = 515
    Height = 162
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 35
      Width = 77
      Height = 13
      Caption = 'C'#243'digo Arquivo:'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 27
      Top = 6
      Width = 66
      Height = 13
      Caption = 'C'#243'digo Fiscal:'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 7
      Top = 62
      Width = 86
      Height = 13
      Caption = 'Nome do Arquivo:'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 28
      Top = 89
      Width = 65
      Height = 13
      Caption = 'MD5 Arquivo:'
      FocusControl = DBEdit4
    end
    object DBEdit1: TDBEdit
      Left = 99
      Top = 27
      Width = 134
      Height = 21
      DataField = 'COD_ARQUIVO'
      DataSource = dtmTerminaisF.DtArquivosFiscal
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 99
      Top = 2
      Width = 134
      Height = 21
      DataField = 'COD_FISCAL'
      DataSource = dtmTerminaisF.DtArquivosFiscal
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 99
      Top = 54
      Width = 412
      Height = 21
      DataField = 'NOME_ARQUIVO'
      DataSource = dtmTerminaisF.DtArquivosFiscal
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 99
      Top = 81
      Width = 412
      Height = 21
      DataField = 'MD5_ARQUIVO'
      DataSource = dtmTerminaisF.DtArquivosFiscal
      TabOrder = 3
    end
    object BitBtn4: TBitBtn
      Left = 158
      Top = 113
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 4
      OnClick = BitBtn4Click
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
    object BitBtn5: TBitBtn
      Left = 256
      Top = 113
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancela'
      TabOrder = 5
      OnClick = BitBtn5Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
end
