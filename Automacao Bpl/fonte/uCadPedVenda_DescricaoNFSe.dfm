object frmCadPedVenda_DescricaoNFSe: TfrmCadPedVenda_DescricaoNFSe
  Left = 0
  Top = 0
  Caption = 'Discrimina'#231#227'o dos Servi'#231'os da NFSe'
  ClientHeight = 475
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 434
    Width = 763
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 216
    ExplicitTop = 280
    ExplicitWidth = 185
    object BitBtn115: TBitBtn
      Left = 678
      Top = 3
      Width = 75
      Height = 25
      Caption = '&Voltar'
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
        0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
        0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
        1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
        3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
        5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
        2828281F05002828282828282828282828282817050713282828282828282828
        2828282817060715282828282828282828282828281507062328280004040404
        040404232828000701282802090807070707061B28282706062328040B090711
        2727272828282800071328060D070A07232828282828281C070128070E13020B
        082028282828281C0701280F101D28020D0818282828280107132816191E2828
        140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
        282827140808041B282828282828282828282828282828282828282828282828
        2828282828282828282828282828282828282828282828282828}
    end
  end
  object PageControl2: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 757
    Height = 428
    ActivePage = TabSheet2
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    ExplicitTop = 33
    ExplicitHeight = 398
    object TabSheet1: TTabSheet
      Caption = '   Observa'#231#227'o da O.S   '
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 700
      ExplicitHeight = 367
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 743
        Height = 13
        Align = alTop
        Caption = 
          'Voc'#234' pode modificar a observa'#231#227'o da O.S. para ser adicionada ao ' +
          'final da descri'#231#227'o dos servi'#231'os e formar a Discrimina'#231#227'o dos ser' +
          'vi'#231'os da NFS-e'
        ExplicitWidth = 693
      end
      object Panel4: TPanel
        Left = 0
        Top = 356
        Width = 749
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 327
        object btObsOS: TBitBtn
          Left = 307
          Top = 8
          Width = 134
          Height = 25
          Caption = 'Salvar'
          ModalResult = 1
          TabOrder = 0
        end
      end
      object DBMemoObservacao: TDBMemo
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 743
        Height = 331
        Align = alClient
        DataField = 'OBS_OS'
        DataSource = DtmPedVenda.dsPedVenda
        TabOrder = 1
        ExplicitLeft = 2
        ExplicitTop = 15
        ExplicitWidth = 625
        ExplicitHeight = 163
      end
    end
    object TabSheet2: TTabSheet
      Caption = '    Descri'#231#227'o Personalizada para NFS-e    '
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 700
      ExplicitHeight = 367
      object Label2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 743
        Height = 13
        Align = alTop
        Caption = 
          'Voc'#234' pode digitar uma descri'#231#227'o personalizada para a Discrimina'#231 +
          #227'o dos servi'#231'os da NFS-e'
        ExplicitWidth = 433
      end
      object edPersonalizado: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 743
        Height = 331
        Align = alClient
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
        OnChange = edPersonalizadoChange
        ExplicitLeft = 0
        ExplicitTop = 10
        ExplicitWidth = 688
        ExplicitHeight = 355
      end
      object Panel30: TPanel
        Left = 0
        Top = 356
        Width = 749
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 357
        object lbSize: TLabel
          Left = 712
          Top = 3
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'lbSize'
        end
        object btPersonalizado: TBitBtn
          Left = 237
          Top = 8
          Width = 134
          Height = 25
          Caption = 'Personalizar'
          TabOrder = 0
          OnClick = btPersonalizadoClick
        end
        object btExcluir: TBitBtn
          Left = 377
          Top = 8
          Width = 134
          Height = 25
          Caption = 'Excluir'
          TabOrder = 1
          OnClick = btExcluirClick
        end
        object btSugestao: TBitBtn
          Left = 3
          Top = 8
          Width = 94
          Height = 25
          Caption = 'Usar sugest'#227'o'
          TabOrder = 2
          OnClick = btSugestaoClick
        end
      end
    end
  end
end
