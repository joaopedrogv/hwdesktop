inherited frmSelTerminalF: TfrmSelTerminalF
  Caption = 'Selecione os Terminais para Sincroniza'#231#227'o'
  ClientHeight = 278
  ClientWidth = 599
  Position = poMainFormCenter
  ExplicitWidth = 607
  ExplicitHeight = 312
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 150
    Top = 173
    Width = 57
    Height = 13
    Caption = 'Data Inicial:'
  end
  object Label2: TLabel
    Left = 289
    Top = 173
    Width = 52
    Height = 13
    Caption = 'Data Final:'
  end
  object Label3: TLabel
    Left = 82
    Top = 13
    Width = 435
    Height = 13
    Caption = 
      'Antes de gerar o sintegra '#233' necess'#225'rio fazer a sincroniza'#231#227'o ent' +
      're o Fiscal e o Retaguarda'
  end
  object Label4: TLabel
    Left = 8
    Top = 234
    Width = 3
    Height = 13
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 583
    Height = 113
    Caption = 
      'Favor selecionar Terminais para esta a'#231#227'o. CTRL+Click Mouse ou S' +
      'hift+Seta para Baixo/Cima'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 579
      Height = 96
      Align = alClient
      DataSource = dtmTerminaisF.DtTerminalF
      Enabled = False
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TERMINAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_EMPRESA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_TERMINAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_TERMINAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_FISCAL'
          Width = 64
          Visible = True
        end>
    end
  end
  object MaskEdit1: TMaskEdit
    Left = 213
    Top = 165
    Width = 63
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object MaskEdit2: TMaskEdit
    Left = 347
    Top = 165
    Width = 70
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
  end
  object BitBtn1: TBitBtn
    Left = 203
    Top = 199
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      92010000424D9201000000000000920000002800000010000000100000000100
      08000000000000010000120B0000120B0000170000001700000000000000FFFF
      FF00FF00FF00004B0000098611000C9C19000A8615000C9518000D931A000F9E
      1C000F991C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1
      340024BC430029B548002EC6520035CA5E0039D4650002020202020202020202
      0202020202020202020202020202020202020202020202020202020303020202
      0202020202020202020203090C03020202020202020202020203100D050E0302
      02020202020202020314120F03080B030202020202020203151611030203060A
      0302020202020202031303020202020307030202020202020203020202020202
      0304030202020202020202020202020202020303020202020202020202020202
      0202020303020202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      02020202020202020202020202020202020202020202}
  end
  object BitBtn2: TBitBtn
    Left = 290
    Top = 199
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancela'
    ModalResult = 2
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
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 253
    Width = 583
    Height = 17
    TabOrder = 5
    Visible = False
  end
end
