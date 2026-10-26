object frmTaxasPlano2: TfrmTaxasPlano2
  Left = 440
  Top = 233
  Caption = 'Taxas por Forma de Pagamento'
  ClientHeight = 462
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 609
    Height = 377
    DataSource = dtmFP.dsJurosPl2
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnExit = DBGrid1Exit
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO_PRESTACOES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS_CARTAO'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS_CARTAO_COM_ENTRADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS_CHEQUE'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS_CHEQUE_COM_ENTRADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS_BOLETA'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS_BOLETA_COM_ENTRADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS_CREDIARIO'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS_CREDIARIO_COM_ENTRADA'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
