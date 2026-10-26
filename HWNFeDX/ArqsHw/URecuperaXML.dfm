object FrmRecuperaXML: TFrmRecuperaXML
  Left = 210
  Top = 66
  Caption = 'Recuperar XML NF-e'
  ClientHeight = 478
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1017
    478)
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 88
    Top = 63
    Width = 249
    Height = 99
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Chave NF-e'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 163
    Height = 13
    Caption = 'Digite o c'#243'digo da imagem ao lado'
  end
  object lblStatus: TLabel
    Left = 118
    Top = 173
    Width = 110
    Height = 13
    Caption = 'Conectando ao SEFAZ'
    FocusControl = ProgressBar1
    Visible = False
  end
  object btnPegarHTML: TButton
    Left = 9
    Top = 97
    Width = 73
    Height = 25
    Caption = 'Consulta NFe'
    Enabled = False
    TabOrder = 3
    OnClick = btnPegarHTMLClick
  end
  object edtCaptcha: TEdit
    Left = 8
    Top = 63
    Width = 73
    Height = 21
    TabOrder = 2
  end
  object edtChaveNFe: TEdit
    Left = 8
    Top = 24
    Width = 329
    Height = 21
    TabOrder = 1
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 192
    Width = 335
    Height = 17
    TabOrder = 6
    Visible = False
  end
  object Memo2: TMemo
    Left = 369
    Top = 24
    Width = 431
    Height = 419
    Anchors = [akLeft, akTop, akBottom]
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object btnNovaConsulta: TButton
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Nova Consulta'
    Enabled = False
    TabOrder = 4
    OnClick = btnNovaConsultaClick
  end
  object btnGerarXML: TButton
    Left = 322
    Top = 215
    Width = 185
    Height = 25
    Caption = 'Confirma XML'
    Enabled = False
    TabOrder = 7
    OnClick = btnGerarXMLClick
  end
  object WebBrowser1: TWebBrowser
    Left = 369
    Top = 8
    Width = 879
    Height = 449
    TabStop = False
    DragMode = dmAutomatic
    TabOrder = 0
    OnProgressChange = WebBrowser1ProgressChange
    OnDocumentComplete = WebBrowser1DocumentComplete
    ControlData = {
      4C000000D95A0000682E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620A000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 8
    OnClick = BitBtn1Click
  end
end
