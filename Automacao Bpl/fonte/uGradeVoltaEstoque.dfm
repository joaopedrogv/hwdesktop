inherited frmGradeVoltaEstoque: TfrmGradeVoltaEstoque
  Caption = 'Grades para voltar o estoque'
  ClientHeight = 522
  ClientWidth = 619
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 627
  ExplicitHeight = 556
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 522
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 607
      Height = 51
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Padding.Left = 12
      Padding.Right = 12
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 18
        Top = 6
        Width = 567
        Height = 35
        Align = alClient
        AutoSize = False
        Caption = 
          'O produto selecionado n'#227'o tinha grade no momento da entrada da n' +
          'ota, no entanto neste momento est'#225' com grade. Por favor selecion' +
          'e as grades para voltar o estoque'
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 272
        ExplicitTop = 16
        ExplicitWidth = 56
        ExplicitHeight = 221
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 57
      Width = 607
      Height = 66
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lbGrupoCodigo: TLabel
        Left = 18
        Top = 6
        Width = 265
        Height = 13
        Caption = 'Produto Grupo/codigo/numfab : 0 - 000000 - 00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbDescricaoProd: TLabel
        Left = 18
        Top = 25
        Width = 199
        Height = 13
        Caption = 'PRODUTO DO PRODUTO DO PRODUO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbQtdeSai: TLabel
        Left = 415
        Top = 6
        Width = 170
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sair com a quantidade de ????'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFalta: TLabel
        Left = 530
        Top = 25
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Falta ????'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 18
        Top = 53
        Width = 278
        Height = 13
        Caption = 'Por favor preencha o valor da sa'#237'da na coluna quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel4: TPanel
      Left = 6
      Top = 123
      Width = 607
      Height = 352
      Align = alClient
      BevelOuter = bvNone
      Padding.Top = 6
      Padding.Bottom = 6
      TabOrder = 2
      object DBGrid13: TDBGrid
        Left = 0
        Top = 6
        Width = 607
        Height = 340
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColEnter = DBGrid13ColEnter
        OnColExit = DBGrid13ColExit
        OnKeyDown = DBGrid13KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'cod_grade'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 198
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao1'
            Width = 194
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Width = 91
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 6
      Top = 475
      Width = 607
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 3
      object BitBtn118: TBitBtn
        Left = 510
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Confirmar'
        TabOrder = 0
        OnClick = BitBtn118Click
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
      object BitBtn77: TBitBtn
        Left = 18
        Top = 6
        Width = 75
        Height = 25
        Hint = 'Cancelar'
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = BitBtn77Click
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
      object BitBtn1: TBitBtn
        Left = 99
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Limpar'
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
  end
end
