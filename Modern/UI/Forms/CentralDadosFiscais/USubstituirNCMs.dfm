inherited FrmSubstituirNCMs: TFrmSubstituirNCMs
  Left = 0
  Top = 0
  Caption = 'Substituir NCM'#39's'
  ClientHeight = 507
  ClientWidth = 860
  Position = poScreenCenter
  OnDestroy = FormDestroy
  ExplicitWidth = 868
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 344
    Top = 248
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 0
  end
  object pnContent: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 854
    Height = 460
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 161
      Top = 0
      Height = 460
      ExplicitLeft = 424
      ExplicitTop = 176
      ExplicitHeight = 100
    end
    object pnNcms: TPanel
      Left = 0
      Top = 0
      Width = 161
      Height = 460
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label3: TLabel
        AlignWithMargins = True
        Left = 9
        Top = 3
        Width = 143
        Height = 16
        Margins.Left = 9
        Margins.Right = 9
        Align = alTop
        Alignment = taCenter
        Caption = 'NCM'#39's para substitui'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 136
      end
      object lbxNCMs: TListBox
        AlignWithMargins = True
        Left = 3
        Top = 25
        Width = 155
        Height = 407
        Style = lbOwnerDrawFixed
        Align = alClient
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 18
        Items.Strings = (
          '9081290>198231'
          '9081290>198231'
          '9081290>198231')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnClick = lbxNCMsClick
      end
      object Panel7: TPanel
        Left = 0
        Top = 435
        Width = 161
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 192
        ExplicitWidth = 624
        object lbSituacao: TLabel
          AlignWithMargins = True
          Left = 18
          Top = 0
          Width = 145
          Height = 13
          Margins.Left = 18
          Margins.Top = 0
          Margins.Right = 9
          Margins.Bottom = 0
          Align = alClient
          Alignment = taCenter
          Caption = 'NCM Extinto / Inexistente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
      end
    end
    object pnConsultas: TPanel
      Left = 164
      Top = 0
      Width = 690
      Height = 460
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 230
      ExplicitWidth = 624
      object pnConsultaDescricao: TPanel
        Left = 0
        Top = 0
        Width = 690
        Height = 55
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          AlignWithMargins = True
          Left = 9
          Top = 3
          Width = 106
          Height = 16
          Margins.Left = 9
          Margins.Right = 9
          Align = alTop
          Alignment = taCenter
          Caption = 'Consulta de NCM'#39's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object pnCamposConsulta: TPanel
          Left = 0
          Top = 22
          Width = 690
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel4: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 684
            Height = 27
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object Label5: TLabel
              AlignWithMargins = True
              Left = 12
              Top = 6
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'C'#243'digo:'
            end
            object Label6: TLabel
              AlignWithMargins = True
              Left = 143
              Top = 6
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Descri'#231#227'o'
            end
            object edCodigo: TMaskEdit
              AlignWithMargins = True
              Left = 55
              Top = 3
              Width = 74
              Height = 21
              Hint = 'Informar pelo menos 2 d'#237'gitos para localizar o NCM'
              EditMask = '00.99.9999;0;*'
              MaxLength = 10
              TabOrder = 0
              OnChange = edCodigoChange
              OnEnter = edCodigoEnter
            end
            object edDescricao: TMaskEdit
              AlignWithMargins = True
              Left = 195
              Top = 3
              Width = 246
              Height = 21
              Hint = 'Informe parte da descri'#231#227'o do NCM para localizar'
              TabOrder = 1
              OnChange = edDescricaoChange
              OnEnter = edDescricaoEnter
            end
          end
        end
      end
      object pnConsultaAto: TPanel
        Left = 0
        Top = 55
        Width = 690
        Height = 47
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 217
        object Label1: TLabel
          AlignWithMargins = True
          Left = 9
          Top = 3
          Width = 265
          Height = 16
          Margins.Left = 9
          Margins.Right = 9
          Align = alTop
          Alignment = taCenter
          Caption = 'Consulta de NCM'#39's prov'#225'veis para substitui'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object Panel8: TPanel
          Left = 0
          Top = 22
          Width = 690
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitTop = 23
          object Label8: TLabel
            AlignWithMargins = True
            Left = 18
            Top = 0
            Width = 126
            Height = 13
            Margins.Left = 18
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alLeft
            Alignment = taCenter
            Caption = 'Data da extin'#231#227'o do NCM:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object lbDataExtincao: TLabel
            AlignWithMargins = True
            Left = 150
            Top = 0
            Width = 6
            Height = 13
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alLeft
            Alignment = taCenter
            Caption = '?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
        end
      end
      object pnGrids: TPanel
        Left = 0
        Top = 102
        Width = 690
        Height = 358
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitLeft = 150
        ExplicitTop = 376
        ExplicitWidth = 185
        ExplicitHeight = 41
        object Splitter2: TSplitter
          Left = 444
          Top = 0
          Height = 333
          ExplicitLeft = 540
          ExplicitTop = -44
        end
        object pnGridArvore: TPanel
          Left = 447
          Top = 0
          Width = 243
          Height = 333
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitTop = 43
          ExplicitHeight = 127
          inline DBGridFrame2NcmArv: TDBGridFrame
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 237
            Height = 327
            Align = alClient
            TabOrder = 0
            TabStop = True
            ExplicitLeft = 3
            ExplicitTop = 3
            ExplicitWidth = 237
            ExplicitHeight = 121
            inherited DBGrid: TDBGrid
              Width = 237
              Height = 299
            end
            inherited pnBtns: TPanel
              Width = 237
              ExplicitWidth = 237
            end
          end
        end
        object pnGridNcm8: TPanel
          Left = 0
          Top = 0
          Width = 444
          Height = 333
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = -259
          ExplicitTop = 1
          ExplicitHeight = 39
          inline DBGridFrameNcms8: TDBGridFrame
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 438
            Height = 327
            Align = alClient
            TabOrder = 0
            TabStop = True
            ExplicitLeft = 3
            ExplicitTop = 3
            ExplicitWidth = 438
            ExplicitHeight = 121
            inherited DBGrid: TDBGrid
              Width = 438
              Height = 299
              OnDblClick = DBGridFrameNcms8DBGridDblClick
            end
            inherited pnBtns: TPanel
              Width = 438
              ExplicitWidth = 438
            end
          end
        end
        object pnLinks: TPanel
          Left = 0
          Top = 333
          Width = 690
          Height = 25
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitTop = 170
          object linkSelecionar: TLabel
            AlignWithMargins = True
            Left = 18
            Top = 0
            Width = 59
            Height = 13
            Cursor = crHandPoint
            Margins.Left = 18
            Margins.Top = 0
            Margins.Right = 9
            Margins.Bottom = 0
            Align = alLeft
            Caption = 'Selecionar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            OnClick = linkSelecionarClick
          end
          object linkVerNovos: TLabel
            AlignWithMargins = True
            Left = 104
            Top = 0
            Width = 92
            Height = 13
            Cursor = crHandPoint
            Margins.Left = 18
            Margins.Top = 0
            Margins.Right = 9
            Margins.Bottom = 0
            Align = alLeft
            Caption = 'Ver novos NCM'#39's'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            OnClick = linkVerNovosClick
          end
          object linkUsarConsulta: TLabel
            AlignWithMargins = True
            Left = 223
            Top = 0
            Width = 77
            Height = 13
            Cursor = crHandPoint
            Margins.Left = 18
            Margins.Top = 0
            Margins.Right = 9
            Margins.Bottom = 0
            Align = alLeft
            Caption = 'Usar consulta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            OnClick = linkUsarConsultaClick
          end
        end
      end
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 466
    Width = 860
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btSair: TBitBtn
      AlignWithMargins = True
      Left = 6
      Top = 8
      Width = 79
      Height = 25
      Margins.Left = 6
      Margins.Top = 8
      Margins.Right = 30
      Margins.Bottom = 8
      Align = alLeft
      Caption = ' Sair'
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
      ExplicitLeft = -21
      ExplicitTop = 5
    end
    object btSelecaoContinuar: TBitBtn
      AlignWithMargins = True
      Left = 121
      Top = 8
      Width = 79
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 8
      Margins.Right = 6
      Margins.Bottom = 8
      Align = alLeft
      Caption = 'Continuar'
      TabOrder = 1
      OnClick = btSelecaoContinuarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF466D12466D12FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D6A193677003577004C
        6A19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF586227357800456F0E456F0E357800586327FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF596328347800456F0E3B74013A740145
        6F0E347800566426FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF596228
        337900456F0F33780073534A75524C337800456F0F347900566427FF00FFFF00
        FFFF00FFFF00FFFF00FF8D4371297F00466E0F337900586327FF00FFFF00FF58
        6228337900456F0F347800566426FF00FFFF00FFFF00FFFF00FFFF00FF3D7204
        297F00586326FF00FFFF00FFFF00FFFF00FF596328347800456F0F3479005664
        27FF00FFFF00FFFF00FFFF00FFFF00FF784F56FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF586228337900456F0F347800566426FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF596328347800456F
        0F347900566327FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF586227337900466E0F297F008D4370FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5962
        28297E003C7304FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF794F56FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ExplicitLeft = 527
      ExplicitTop = 16
    end
  end
end
