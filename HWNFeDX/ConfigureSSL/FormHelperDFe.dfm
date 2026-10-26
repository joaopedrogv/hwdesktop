object FrmHelperDFe: TFrmHelperDFe
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Comunica'#231#227'o DFe'
  ClientHeight = 305
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 305
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 24
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object lSSLLib: TLabel
      Left = 39
      Top = 78
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'SSLLib'
      Color = clBtnFace
      ParentColor = False
    end
    object lCryptLib: TLabel
      Left = 29
      Top = 105
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'CryptLib'
      Color = clBtnFace
      ParentColor = False
    end
    object lHttpLib: TLabel
      Left = 35
      Top = 132
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'HttpLib'
      Color = clBtnFace
      ParentColor = False
    end
    object lXmlSign: TLabel
      Left = 17
      Top = 159
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'XMLSignLib'
      Color = clBtnFace
      ParentColor = False
    end
    object lSSLLib1: TLabel
      Left = 27
      Top = 186
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'SSLType'
      Color = clBtnFace
      ParentColor = False
    end
    object Label2: TLabel
      Left = 49
      Top = 51
      Width = 25
      Height = 13
      Caption = 'Ativo'
    end
    object cbDocDFe: TComboBox
      Left = 80
      Top = 21
      Width = 160
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbDocDFeChange
      Items.Strings = (
        'Padr'#227'o (SSLIB)'
        'NFe'
        'NFSe'
        'MDFe')
    end
    object cbSSLLib: TComboBox
      Left = 80
      Top = 75
      Width = 160
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cbSSLLibChange
    end
    object cbCryptLib: TComboBox
      Left = 80
      Top = 102
      Width = 160
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnChange = cbCryptLibChange
    end
    object cbHttpLib: TComboBox
      Left = 80
      Top = 129
      Width = 160
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnChange = cbHttpLibChange
    end
    object cbXmlSignLib: TComboBox
      Left = 80
      Top = 156
      Width = 160
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      OnChange = cbXmlSignLibChange
    end
    object cbSSLType: TComboBox
      Left = 80
      Top = 183
      Width = 160
      Height = 21
      Hint = 'Depende de configura'#231#227'o de  SSL.HttpLib'
      Style = csDropDownList
      TabOrder = 6
      OnChange = cbSSLTypeChange
    end
    object btnSalvarConfig: TBitBtn
      Left = 20
      Top = 238
      Width = 220
      Height = 36
      Caption = 'Salvar Configura'#231#245'es'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      TabOrder = 7
      OnClick = btnSalvarConfigClick
    end
    object cbYesNo: TComboBox
      Left = 80
      Top = 48
      Width = 160
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        'NAO'
        'SIM')
    end
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 128
    Top = 160
  end
end
