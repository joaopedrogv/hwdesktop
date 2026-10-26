object FormAlterarFiscalNFSe: TFormAlterarFiscalNFSe
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Altera'#231#227'o de c'#243'digos Fiscals para emiss'#227'o de NFSe'
  ClientHeight = 137
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 834
    object PanelServicos2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 32
      Width = 527
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 828
      object edClc116: TMaskEdit
        AlignWithMargins = True
        Left = 263
        Top = 3
        Width = 72
        Height = 21
        Align = alLeft
        EditMask = '99.99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  .  '
        ExplicitLeft = 83
      end
      object edCTribNac: TMaskEdit
        AlignWithMargins = True
        Left = 437
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        EditMask = '99.99.99;0;_'
        MaxLength = 8
        TabOrder = 5
        ExplicitLeft = 257
      end
      object ckLc116: TCheckBox
        AlignWithMargins = True
        Left = 182
        Top = 3
        Width = 75
        Height = 21
        TabStop = False
        Align = alLeft
        Alignment = taLeftJustify
        Caption = 'Cod LC 116'
        TabOrder = 2
        OnClick = ckLc116Click
        ExplicitLeft = 179
      end
      object ckCtribNac: TCheckBox
        AlignWithMargins = True
        Left = 341
        Top = 3
        Width = 90
        Height = 21
        TabStop = False
        Align = alLeft
        Alignment = taLeftJustify
        Caption = 'CTrib Nacional'
        TabOrder = 4
        OnClick = ckCtribNacClick
        ExplicitLeft = 161
      end
      object ckCCNAE: TCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 93
        Height = 21
        TabStop = False
        Align = alLeft
        Alignment = taLeftJustify
        Caption = 'CNAE Servi'#231'o'
        TabOrder = 0
        OnClick = ckCCNAEClick
      end
      object edCcnae: TMaskEdit
        AlignWithMargins = True
        Left = 102
        Top = 3
        Width = 74
        Height = 21
        Align = alLeft
        EditMask = '0000-0/00;0;_'
        MaxLength = 9
        TabOrder = 1
        ExplicitLeft = 3
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 527
      Height = 23
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 828
      object lbCaption: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 521
        Height = 14
        Margins.Bottom = 6
        Align = alTop
        Caption = '1: Servico padrao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 107
      end
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 104
      Width = 131
      Height = 25
      Caption = 'Abrir corre'#231#245'es fiscais'
      TabOrder = 3
      TabStop = False
      OnClick = BitBtn1Click
    end
    object btConcluir: TBitBtn
      Left = 229
      Top = 104
      Width = 75
      Height = 25
      Caption = 'C&oncluir'
      TabOrder = 4
      OnClick = btConcluirClick
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
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 65
      Width = 527
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 32
      ExplicitWidth = 828
      object Label1: TLabel
        Left = 180
        Top = 0
        Width = 35
        Height = 27
        Align = alLeft
        AutoSize = False
        ExplicitLeft = 177
      end
      object ckcIndOp: TCheckBox
        AlignWithMargins = True
        Left = 344
        Top = 3
        Width = 87
        Height = 21
        TabStop = False
        Align = alLeft
        Alignment = taLeftJustify
        Caption = 'Cod Ind Oper'
        TabOrder = 4
        OnClick = ckcIndOpClick
        ExplicitLeft = 341
      end
      object edCIndOp: TMaskEdit
        AlignWithMargins = True
        Left = 437
        Top = 3
        Width = 72
        Height = 21
        Align = alLeft
        EditMask = '999999;0;_'
        MaxLength = 6
        TabOrder = 5
        ExplicitLeft = 509
        ExplicitTop = 0
      end
      object ckcNbs: TCheckBox
        AlignWithMargins = True
        Left = 218
        Top = 3
        Width = 39
        Height = 21
        TabStop = False
        Align = alLeft
        Alignment = taLeftJustify
        Caption = 'NBS'
        TabOrder = 2
        OnClick = ckcNbsClick
        ExplicitLeft = 229
      end
      object edCNBS: TMaskEdit
        AlignWithMargins = True
        Left = 263
        Top = 3
        Width = 75
        Height = 21
        Hint = 'Informe parte da descri'#231#227'o do NCM para localizar'
        Align = alLeft
        EditMask = '9.9999.99.99;0;_'
        MaxLength = 12
        TabOrder = 3
        ExplicitLeft = 276
        ExplicitTop = 12
      end
      object ckcTribMun: TCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 93
        Height = 21
        TabStop = False
        Align = alLeft
        Alignment = taLeftJustify
        Caption = 'CTrib Municipal'
        TabOrder = 0
        OnClick = ckcTribMunClick
      end
      object edCTribMun: TMaskEdit
        AlignWithMargins = True
        Left = 102
        Top = 3
        Width = 75
        Height = 21
        Hint = 'Informe parte da descri'#231#227'o do NCM para localizar'
        Align = alLeft
        EditMask = '999;0;_'
        MaxLength = 3
        TabOrder = 1
        ExplicitLeft = 83
        ExplicitTop = 0
      end
    end
  end
end
