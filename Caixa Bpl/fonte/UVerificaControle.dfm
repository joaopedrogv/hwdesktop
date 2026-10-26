inherited frmVerificaControle: TfrmVerificaControle
  Left = 300
  Top = 145
  BorderStyle = bsDialog
  Caption = 'Verificar Cr'#233'dito'
  ClientHeight = 274
  ClientWidth = 731
  Position = poScreenCenter
  ExplicitLeft = 300
  ExplicitTop = 145
  ExplicitWidth = 739
  ExplicitHeight = 301
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Principal: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 274
    Align = alClient
    TabOrder = 0
    object Panel_Cabecalho: TPanel
      Left = 1
      Top = 1
      Width = 729
      Height = 41
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 15
        Top = 14
        Width = 563
        Height = 13
        Caption = 
          'Existem cr'#233'ditos com o mesmo Nosso N'#250'mero, selecione qual deseja' +
          ' ser incluir no processamento?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object DBGrid_Retorno: TDBGrid
      Left = 1
      Top = 42
      Width = 729
      Height = 185
      Align = alTop
      DataSource = dtmImportPDVFinan.dsControleCreditos
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid_RetornoDblClick
      OnKeyDown = DBGrid_RetornoKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_CRED'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_SEQ_BOL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_CONTA_PLC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_CTRL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_DUPL_C'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DATA_REC_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_DOC_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HISTORICO_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_VENC_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATQ_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NATL_C'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LOTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TP_DOC_V'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_DOC_V'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_DOC_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_RETORNO_QUITACAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SELEC'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COD_CLI_TERC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_TERC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIP_CNT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DATA_CXL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_VEND'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIP_BAIXA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_REM_REC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_TERM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_BAIXA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_VENDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_CORR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_FUNC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE_QUIT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_DESC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE_ENT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIA_CXL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_CXL_RQ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_RQ_PG_CXL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_CXL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPFCGC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE_CXL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TP_REC_CXL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRCSS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JUROS_COB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_IT_CARTAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_REG_CARTAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CARTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_AUT_CART'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_FATURAMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE_NEG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_LOTE_NEG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_EMP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_EMP_MULT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_NOTA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NREQ'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'N_OS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NCOMANDO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NGRP'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COONAOFISCAL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOSSO_NUMERO_BANCO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAXA_COBRANCA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'US_CANCELOU'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_US_CANCELOU'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_PARACREDITO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTORIGINAL_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_PREV_REC'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEPENDENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NSERIEECF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COD_TERMINAL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COD_COBREBEM'
          Visible = False
        end>
    end
    object BitBtn_OK: TBitBtn
      Left = 312
      Top = 233
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 2
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
end
