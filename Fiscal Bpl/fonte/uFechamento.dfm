inherited frmFechamento: TfrmFechamento
  Left = 499
  Top = 275
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = 'Fechamento do Cupom'
  ClientHeight = 437
  ClientWidth = 608
  KeyPreview = True
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 624
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 13
  object lMensagem: TPanel
    Left = 0
    Top = 394
    Width = 608
    Height = 43
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'Selecione a Forma de Pagamento e aperte "Enter"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 608
    Height = 393
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object grupoControle: TGroupBox
      Left = 4
      Top = 64
      Width = 233
      Height = 233
      Caption = 'Forma de Pagamento (F7)  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = grupoControleEnter
      OnExit = grupoControleExit
      object gridFina: TDBGrid
        Left = 2
        Top = 15
        Width = 229
        Height = 175
        Align = alClient
        DataSource = DtmConfigF.dsFinaliz
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = gridFinaDblClick
        OnKeyDown = gridFinaKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_FINALIZADOR'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 160
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 2
        Top = 190
        Width = 229
        Height = 41
        Align = alBottom
        BevelOuter = bvLowered
        Caption = 'Pressione Enter para escolher'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 243
      Top = 64
      Width = 358
      Height = 233
      BevelKind = bkTile
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = Panel5Enter
      OnExit = Panel5Exit
      object Label1: TLabel
        Left = 51
        Top = 46
        Width = 39
        Height = 16
        Caption = 'Valor:'
      end
      object Label2: TLabel
        Left = 24
        Top = 80
        Width = 66
        Height = 16
        Caption = 'Desconto:'
      end
      object Label3: TLabel
        Left = 18
        Top = 114
        Width = 72
        Height = 16
        Caption = 'Acr'#233'scimo:'
      end
      object EditMoeda1: TEditMoeda
        Left = 96
        Top = 34
        Width = 225
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        FormatReal = fMoney
        FormatSize = '10.2'
        OnEnter = EditMoeda1Enter
        OnExit = EditMoeda1Exit
        OnKeyDown = EditMoeda1KeyDown
      end
      object BitBtn1: TBitBtn
        Left = 54
        Top = 148
        Width = 120
        Height = 28
        Caption = 'OK(F3)'
        TabOrder = 3
        OnClick = BitBtn1Click
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000D30E0000D30E00000001000000010000008C00000094
          0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
          210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
          420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
          94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
          04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
          0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
          170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
          13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
          1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
          1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
          1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
          1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
      end
      object BitBtn2: TBitBtn
        Left = 180
        Top = 148
        Width = 120
        Height = 28
        Caption = 'Cancelar(Esc)'
        TabOrder = 4
        OnClick = BitBtn2Click
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
      object Panel1: TPanel
        Left = 0
        Top = 188
        Width = 354
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 5
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 177
          Height = 41
          Align = alLeft
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Desconto (F5)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel4: TPanel
          Left = 177
          Top = 0
          Width = 177
          Height = 41
          Align = alLeft
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Acr'#233'cimo(F6)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object EditMoeda2: TEditMoeda
        Left = 96
        Top = 68
        Width = 226
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        FormatReal = fMoney
        FormatSize = '10.2'
        OnEnter = EditMoeda2Enter
        OnExit = EditMoeda2Exit
        OnKeyDown = EditMoeda1KeyDown
      end
      object EditMoeda3: TEditMoeda
        Left = 96
        Top = 102
        Width = 226
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        FormatReal = fMoney
        FormatSize = '10.2'
        OnEnter = EditMoeda3Enter
        OnExit = EditMoeda3Exit
        OnKeyDown = EditMoeda1KeyDown
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 597
      Height = 58
      Caption = 'Cliente do Cadastro (F2)  Cliente Avulso (F8)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = GroupBox1Enter
      OnExit = GroupBox1Exit
      object SpeedButton1: TSpeedButton
        Left = 16
        Top = 21
        Width = 53
        Height = 24
        Caption = 'Avulso'
        Flat = True
        OnClick = SpeedButton1Click
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 143
        Top = 21
        Width = 418
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'COD_CLIENTE'
        ListField = 'NOME_CLIENTE'
        ListSource = DtmFiscalHwF.dsCliente
        ParentFont = False
        TabOrder = 0
        OnEnter = DBLookupComboBox1Enter
        OnExit = DBLookupComboBox1Exit
      end
      object Edit1: TEdit
        Left = 75
        Top = 21
        Width = 62
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '00000'
        OnChange = Edit1Change
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyPress = Edit1KeyPress
      end
    end
    object grupoValor: TGroupBox
      Left = 4
      Top = 297
      Width = 597
      Height = 94
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label4: TLabel
        Left = 260
        Top = 29
        Width = 67
        Height = 16
        Caption = 'Valor Doc:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 263
        Top = 63
        Width = 64
        Height = 16
        Caption = 'Recebido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 22
        Top = 30
        Width = 65
        Height = 16
        Caption = 'Restante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 46
        Top = 64
        Width = 41
        Height = 16
        Caption = 'Troco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object mValorDoc: TEditMoeda
        Left = 333
        Top = 17
        Width = 225
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        FormatReal = fMoney
        FormatSize = '10.2'
      end
      object mPago: TEditMoeda
        Left = 333
        Top = 51
        Width = 225
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        FormatReal = fMoney
        FormatSize = '10.2'
      end
      object mRestante: TEditMoeda
        Left = 93
        Top = 18
        Width = 138
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        FormatReal = fMoney
        FormatSize = '10.2'
      end
      object mTroco: TEditMoeda
        Left = 93
        Top = 52
        Width = 138
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        FormatReal = fMoney
        FormatSize = '10.2'
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 520
    Top = 144
    object CancelarCupo1: TMenuItem
      Caption = 'CancelarCupom'
      ShortCut = 16451
      OnClick = CancelarCupo1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 392
    Top = 64
  end
end
