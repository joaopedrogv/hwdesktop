inherited frmSelecionaCobrebem: TfrmSelecionaCobrebem
  Left = 422
  Top = 207
  BorderIcons = []
  Caption = 'Impress'#227'o do boleto'
  ClientHeight = 244
  ClientWidth = 778
  KeyPreview = True
  Position = poScreenCenter
  ExplicitWidth = 794
  ExplicitHeight = 283
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Cobrebem: TPanel
    Left = 0
    Top = 0
    Width = 778
    Height = 244
    Align = alClient
    TabOrder = 0
    object pnSelecionaCobrebemBottom: TPanel
      Left = 1
      Top = 208
      Width = 776
      Height = 35
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object BitBtn_OK: TBitBtn
        Left = 299
        Top = 3
        Width = 174
        Height = 25
        Caption = '&OK'
        TabOrder = 0
        OnClick = BitBtn_OKClick
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
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 776
      Height = 207
      Align = alClient
      Caption = 'Selecione a configura'#231#227'o desejada (Conv'#234'nio):'
      TabOrder = 0
      object GroupBoxConvenio: TGroupBox
        Left = 2
        Top = 164
        Width = 772
        Height = 41
        Align = alBottom
        Caption = 'Conv'#234'nio'
        TabOrder = 1
        object DBLookupComboBox_Cobrebem: TDBLookupComboBox
          Left = 2
          Top = 15
          Width = 768
          Height = 21
          Align = alClient
          KeyField = 'COD_COBREBEM'
          ListField = 'DESCRICAO'
          ListSource = DtmBoletos.dsCobreBemBol
          TabOrder = 0
        end
      end
      object GroupBoxAcoes: TGroupBox
        Left = 2
        Top = 15
        Width = 772
        Height = 42
        Align = alTop
        Caption = 'A'#231#245'es'
        TabOrder = 0
        object Panel1: TPanel
          Left = 2
          Top = 15
          Width = 768
          Height = 26
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object ckImprimirBoleto: TCheckBox
            Left = 10
            Top = 6
            Width = 97
            Height = 17
            Caption = 'Imprimir   (F2)'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = ckImprimirBoletoClick
          end
          object ckEnviarBoleto: TCheckBox
            Left = 274
            Top = 6
            Width = 97
            Height = 17
            Caption = 'Enviar  (F3)'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = ckEnviarBoletoClick
          end
        end
      end
      inline FrameCheckListaContato: TFrameCheckListaContato
        Left = 2
        Top = 57
        Width = 772
        Height = 107
        Align = alClient
        TabOrder = 2
        TabStop = True
        ExplicitLeft = 2
        ExplicitTop = 57
        ExplicitWidth = 772
        ExplicitHeight = 107
        inherited GroupBoxContato: TGroupBox
          Width = 772
          Height = 107
          ExplicitWidth = 772
          ExplicitHeight = 107
          inherited CheckListBoxContato: TCheckListBox
            Width = 671
            Height = 59
            ExplicitWidth = 671
            ExplicitHeight = 59
          end
          inherited pnContato: TPanel
            Top = 74
            Width = 768
            ExplicitTop = 74
            ExplicitWidth = 768
            inherited bt_contatos_pla_add: TSpeedButton
              Left = 342
              ExplicitLeft = 342
            end
            inherited bt_contatos_pla_edit: TSpeedButton
              Left = 371
              ExplicitLeft = 371
            end
            inherited bt_contatos_pla_del: TSpeedButton
              Left = 400
              ExplicitLeft = 400
            end
            inherited bt_contatos_pla_outros_add: TSpeedButton
              Left = 704
              ExplicitLeft = 704
            end
            inherited bt_contatos_pla_outros_del: TSpeedButton
              Left = 733
              ExplicitLeft = 733
            end
          end
          inherited CheckListBoxAplicativo: TCheckListBox
            Left = 673
            Height = 59
            ExplicitLeft = 673
            ExplicitHeight = 59
          end
        end
      end
    end
  end
end
