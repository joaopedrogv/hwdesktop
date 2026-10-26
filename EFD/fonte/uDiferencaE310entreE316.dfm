object frmDifE310eE316: TfrmDifE310eE316
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Aten'#231#227'o!!! Deferen'#231#227'o de registros FCP / DIFAL'
  ClientHeight = 465
  ClientWidth = 793
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 465
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object Label1: TLabel
      Left = 64
      Top = 162
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'UF do estado'
    end
    object Label2: TLabel
      Left = 286
      Top = 162
      Width = 210
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo da obriga'#231#227'o recolhida ou a recolher'
    end
    object Label7: TLabel
      Left = 629
      Top = 162
      Width = 101
      Height = 13
      Caption = '[000, 003, 006, 090]'
    end
    object Label8: TLabel
      Left = 422
      Top = 189
      Width = 201
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor da obriga'#231#227'o recolhida ou a recolher'
    end
    object Label10: TLabel
      Left = 462
      Top = 216
      Width = 161
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data de vencimento da obriga'#231#227'o'
    end
    object Label11: TLabel
      Left = 33
      Top = 243
      Width = 590
      Height = 13
      Alignment = taRightJustify
      Caption = 
        'C'#243'digo de receita referente '#224' obriga'#231#227'o, pr'#243'prio da unidade da f' +
        'edera'#231#227'o da origem/destino, conforme legisla'#231#227'o estadual'
    end
    object Label12: TLabel
      Left = 204
      Top = 270
      Width = 419
      Height = 13
      Alignment = taRightJustify
      Caption = 
        'N'#250'mero do processo ou auto de infra'#231#227'o ao qual a obriga'#231#227'o est'#225' ' +
        'vinculada, se houver'
    end
    object Label13: TLabel
      Left = 467
      Top = 297
      Width = 156
      Height = 13
      Alignment = taRightJustify
      Caption = 'Indicador da origem do processo'
    end
    object Label14: TLabel
      Left = 33
      Top = 321
      Width = 287
      Height = 13
      Caption = 'Descri'#231#227'o resumida do processo que embasou o lan'#231'amento'
    end
    object Label15: TLabel
      Left = 394
      Top = 321
      Width = 308
      Height = 13
      Caption = 'Descri'#231#227'o complementar das obriga'#231#245'es recolhidas ou a recolher'
    end
    object Label16: TLabel
      Left = 515
      Top = 389
      Width = 108
      Height = 13
      Caption = 'Mes/ano de referencia'
    end
    object Edit1: TEdit
      Left = 134
      Top = 159
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 502
      Top = 159
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 781
      Height = 147
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 11
      object Label3: TLabel
        Left = 16
        Top = 8
        Width = 58
        Height = 16
        HelpContext = 8
        Caption = 'Aten'#231#227'o!!!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 80
        Top = 10
        Width = 655
        Height = 38
        AutoSize = False
        Caption = 
          'Valor recolhido ou a recolher referente a FCP e Imposto do Difer' +
          'encial de Al'#237'quota da UF de Origem/Destino (E310 campo VL_RECOL+' +
          'DEB_ESP_DIFAL) difere da soma das Obriga'#231#245'es do ICMS recolhido o' +
          'u a recolher - Diferencial de al'#237'quota uf origem/destino EC87/15' +
          ' (E316)'
        WordWrap = True
      end
      object Label5: TLabel
        Left = 80
        Top = 54
        Width = 207
        Height = 13
        Caption = 'E310 campo VL_RECOL + DEB_ESP_DIFAL:'
      end
      object Label6: TLabel
        Left = 211
        Top = 73
        Width = 76
        Height = 13
        Caption = 'Registros E316:'
      end
      object lbE310: TLabel
        Left = 293
        Top = 54
        Width = 37
        Height = 13
        Caption = 'lbE310'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbE316: TLabel
        Left = 293
        Top = 73
        Width = 37
        Height = 13
        Caption = 'lbE316'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 80
        Top = 104
        Width = 652
        Height = 26
        Caption = 
          'Por favor cancele esta opera'#231#227'o e registre no sistema os valores' +
          ' corretamente atrav'#233's do menu "Estoque / Movimento / SPED / Fisc' +
          'al / Obriga'#231#245'es do ICMS Recolhido ou a Recolher DIFAL" ou prossi' +
          'ga digitando os valores nos campos abaixo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 418
      Width = 781
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 10
      object BitBtn1: TBitBtn
        Left = 289
        Top = 6
        Width = 93
        Height = 25
        Caption = 'Prosseguir'
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          10000300000000020000120B0000120B00000000000000000000007C0000E003
          00001F0000007467813A813A813661366136613241324132422E422E222E222A
          222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232422E422E
          222A222A0226A13EC142C142C142A23EA23EA23A61366136623662324232422E
          422E222A222AA13EC146C146C142C142A23EA23E6136A7426136623662324232
          422E422E222AC142E146E146C146C142C142A23E6136DD7BED4E613662366232
          4232422E222AC142E146E14AC142A13EA13EA13E6136FF7FFF7FED4E61366236
          62324232222EC142E14AC142CB4A305B305B305B305BFF7FFF7FFF7F525F6136
          62364232422EC146014BA142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5463
          61366232422EE146014FC142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FED4E
          613662364232E1462453E44ACB4A305B305B305B305BFF7FFF7FFF7FED4E6236
          823A82364132E14A45574657054F044BE44AE44A823AFF7FFF7FED4E823EA33E
          A33E823A6132E14A4557465B4657265725532553823ADD7BA742A33EC342C342
          A33EA23A6132014B455B665B465B465725532553823AA742C342E44AC346C342
          A342A23E6136014F455B665B665B465745572553A23EE44A044BE44AE346C346
          C342A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
          C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
          813A813A7467}
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 388
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Cancela'
        Glyph.Data = {
          E6010000424DE60100000000000036000000280000000C0000000C0000000100
          180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
          9696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
          ED0000C50000B69191BAFFFFFFFFFFFFFFFFFFFFFFFF7F7FC500009100008FA2
          A2C64848EC0000DD0000D50000BC9292BBFFFFFFFFFFFF7A7AC80000A30000A7
          0000938F8FC9FFFFFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
          B40000A67D7DCBFFFFFFFFFFFFFFFFFF3838EF0000E60101E40000D40000C401
          01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
          0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DE10F0F
          ED0C0CEC0303EC0000E28E8EC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484DD39
          39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFFFFFFFFFFFFFFF8787DD
          4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFF8A8A
          DD4D4DDE7373E46868E48E8EE4FFFFFFFFFFFF7B7BEB6C6CF06F6FF73D3DEAA6
          A6CE8787E36262DD6767E09191E3FFFFFFFFFFFFFFFFFFFFFFFF8080E96D6DEF
          5555F2A4A4E9FFFFFF8F8FE49393E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF7D7DE9A4A4EDFFFFFF}
        ModalResult = 2
        TabOrder = 1
      end
    end
    object MaskEdit1: TMaskEdit
      Left = 629
      Top = 213
      Width = 120
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
    object Edit3: TEdit
      Left = 629
      Top = 240
      Width = 120
      Height = 21
      TabOrder = 4
    end
    object Edit4: TEdit
      Left = 629
      Top = 267
      Width = 120
      Height = 21
      MaxLength = 15
      TabOrder = 5
    end
    object ComboBox1: TComboBox
      Left = 629
      Top = 294
      Width = 120
      Height = 21
      ItemIndex = 4
      TabOrder = 6
      Text = '  '
      Items.Strings = (
        '0 - SEFAZ;'
        '1 - Justi'#231'a Federal;'
        '2 - Justi'#231'a Estadual;'
        '9 - Outros'
        '  ')
    end
    object Memo1: TMemo
      Left = 33
      Top = 340
      Width = 355
      Height = 40
      TabOrder = 7
    end
    object Memo2: TMemo
      Left = 394
      Top = 340
      Width = 355
      Height = 40
      TabOrder = 8
    end
    object MaskEdit2: TMaskEdit
      Left = 629
      Top = 386
      Width = 118
      Height = 21
      EditMask = '!99/0000;0;_'
      MaxLength = 7
      TabOrder = 9
      Text = ''
    end
    object edVLObrig: TMaskEdit
      Left = 629
      Top = 186
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      Text = '0,00'
      OnExit = edVLObrigExit
    end
  end
end
