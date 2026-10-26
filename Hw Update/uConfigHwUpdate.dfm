object frmConfigAtualizador: TfrmConfigAtualizador
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Configura'#231#245'es para Atualiza'#231#227'o'
  ClientHeight = 576
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 535
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object Label1: TLabel
      Left = 78
      Top = 84
      Width = 78
      Height = 13
      Caption = 'Diret'#243'rio padr'#227'o'
    end
    object Label2: TLabel
      Left = 78
      Top = 15
      Width = 69
      Height = 13
      Caption = 'CNPJ Empresa'
    end
    object Label4: TLabel
      Left = 78
      Top = 178
      Width = 37
      Height = 13
      Caption = 'Sistema'
    end
    object Label5: TLabel
      Left = 78
      Top = 301
      Width = 48
      Height = 13
      Caption = 'Relat'#243'rios'
    end
    object Label7: TLabel
      Left = 78
      Top = 427
      Width = 311
      Height = 13
      Caption = 'Outro computador est'#225' selecionado para verificar novas vers'#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object SpeedButton1: TSpeedButton
      Left = 660
      Top = 84
      Width = 23
      Height = 13
      Cursor = crHandPoint
      Caption = '...'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 631
      Top = 178
      Width = 23
      Height = 13
      Cursor = crHandPoint
      Caption = '+'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 631
      Top = 301
      Width = 23
      Height = 13
      Cursor = crHandPoint
      Caption = '+'
      Flat = True
      OnClick = SpeedButton3Click
    end
    object SpeedButton5: TSpeedButton
      Left = 660
      Top = 178
      Width = 23
      Height = 13
      Cursor = crHandPoint
      Caption = '-'
      Flat = True
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 660
      Top = 301
      Width = 23
      Height = 13
      Cursor = crHandPoint
      Caption = '-'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object Edit1: TEdit
      Left = 78
      Top = 103
      Width = 605
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
    end
    object ComboBox1: TComboBox
      Left = 78
      Top = 34
      Width = 605
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 78
      Top = 142
      Width = 605
      Height = 30
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 'Diret'#243'rios Adicionais para atualiza'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object ListBox1: TListBox
      Left = 78
      Top = 197
      Width = 605
      Height = 90
      ItemHeight = 13
      TabOrder = 4
    end
    object ListBox2: TListBox
      Left = 78
      Top = 320
      Width = 605
      Height = 90
      ItemHeight = 13
      TabOrder = 5
    end
    object CheckBox1: TCheckBox
      Left = 78
      Top = 446
      Width = 491
      Height = 17
      Caption = 
        'Deseja selecionar este computador para ser o respons'#225'vel pelas c' +
        'onsultas de novas vers'#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = False
    end
    object CheckBox2: TCheckBox
      Left = 78
      Top = 61
      Width = 605
      Height = 17
      Caption = 'Stand Alone'
      TabOrder = 1
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 560
      Top = 416
      Width = 123
      Height = 17
      BiDiMode = bdRightToLeft
      Caption = 'F2 - Homologa'#231#227'o'
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 7
    end
    object RadioGroup1: TRadioGroup
      Left = 78
      Top = 469
      Width = 605
      Height = 52
      Caption = 'Respons'#225'vel pela instala'#231#227'o do sistema'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Deixar como est'#225
        'Este computador'
        'Qualquer computador')
      TabOrder = 8
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 535
    Width = 774
    Height = 41
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 1
    object btCancelar: TBitBtn
      Left = 383
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btCancelarClick
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
    object btSalvar: TBitBtn
      Left = 302
      Top = 6
      Width = 75
      Height = 25
      Hint = 'Salvar Configura'#231#245'es'
      Caption = 'S&alvar'
      TabOrder = 1
      OnClick = btSalvarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000942929009431
        31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
        4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
        5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
        73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
        8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
        A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
        BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
        CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
        E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
        33343433332505050B4848191516111B27384647452D0002131048191515111A
        05184046492E0102121048191515111C03032F42493200011210481915151120
        0601243A493200011210481915151221231D1F27322C04041310481915151515
        1515151313151515160F48190D111E282B292B2828292B26150C481909384544
        4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
        3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
        4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
        4343434343434630130F4848092D3A363636363636363A2A0748}
    end
  end
end
