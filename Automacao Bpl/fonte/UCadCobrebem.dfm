inherited frmCadCobreBem: TfrmCadCobreBem
  Left = 278
  Top = 131
  Caption = 'Conv'#234'nios'
  ClientHeight = 636
  ClientWidth = 810
  ExplicitWidth = 826
  ExplicitHeight = 675
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 810
    Height = 617
    ExplicitWidth = 810
    ExplicitHeight = 617
    inherited Splitter2: TSplitter
      Height = 615
      ExplicitHeight = 563
    end
    inherited PanelLeft: TPanel
      Width = 805
      Height = 615
      ExplicitWidth = 805
      ExplicitHeight = 615
      inherited PageControl1: TPageControl
        Width = 803
        Height = 613
        ExplicitWidth = 803
        ExplicitHeight = 613
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 795
          ExplicitHeight = 582
          inherited ScrollBox1: TScrollBox
            Width = 795
            Height = 582
            ExplicitWidth = 795
            ExplicitHeight = 582
            inherited PageControl3: TPageControl
              Width = 795
              Height = 534
              OnChange = PageControl3Change
              ExplicitWidth = 795
              ExplicitHeight = 534
              inherited TabSheet3: TTabSheet
                Caption = 'Configura'#231#245'es'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 787
                ExplicitHeight = 503
                inherited ScrollBox3: TScrollBox
                  Width = 787
                  Height = 503
                  ExplicitWidth = 787
                  ExplicitHeight = 503
                  inherited GroupBox1: TGroupBox
                    Width = 783
                    Height = 499
                    Caption = 'Dados do Conv'#234'nio'
                    ExplicitWidth = 783
                    ExplicitHeight = 499
                    object Label8: TLabel
                      Left = 114
                      Top = 116
                      Width = 42
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ag'#234'ncia:'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 362
                      Top = 116
                      Width = 79
                      Height = 13
                      Caption = 'Conta Corrente:'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 360
                      Top = 66
                      Width = 81
                      Height = 13
                      Caption = 'C'#243'digo Cedente:'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 55
                      Top = 144
                      Width = 101
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'In'#237'cio Nosso N'#250'mero:'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 349
                      Top = 144
                      Width = 92
                      Height = 13
                      Caption = 'Fim Nosso N'#250'mero:'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 42
                      Top = 169
                      Width = 114
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pr'#243'ximo Nosso N'#250'mero:'
                      FocusControl = DBEdit8
                    end
                    object lbLicencaOuConvenio: TLabel
                      Left = 77
                      Top = 37
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Arquivo Licen'#231'a:'
                      FocusControl = edLicencaOuConvenio
                    end
                    object Label15: TLabel
                      Left = 26
                      Top = 380
                      Width = 130
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Imagens C'#243'digo de Barras:'
                      FocusControl = DBEdit_ImagemCodigoBarras
                    end
                    object Label16: TLabel
                      Left = 70
                      Top = 406
                      Width = 86
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Imagem Logotipo:'
                      FocusControl = DBEdit_ImagemLogotipo
                    end
                    object Label17: TLabel
                      Left = 32
                      Top = 301
                      Width = 124
                      Height = 13
                      Alignment = taRightJustify
                      Caption = '1'#186' Identifica'#231#227'o Cedente:'
                      FocusControl = DBEdit12
                    end
                    object Label7: TLabel
                      Left = 75
                      Top = 248
                      Width = 81
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'C'#243'digo Controle:'
                      FocusControl = DBEdit2
                    end
                    object Label33: TLabel
                      Left = 360
                      Top = 198
                      Width = 81
                      Height = 13
                      Caption = 'Tipo Documento:'
                    end
                    object Label35: TLabel
                      Left = 17
                      Top = 195
                      Width = 139
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#250'mero Sequ'#234'ncia Remessa:'
                      FocusControl = DBEdit26
                    end
                    object Label36: TLabel
                      Left = 18
                      Top = 353
                      Width = 138
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Endere'#231'o Remessa/Retorno:'
                      FocusControl = DBEdit_EnderecoRemessaRetorno
                    end
                    object Label26: TLabel
                      Left = 32
                      Top = 326
                      Width = 124
                      Height = 13
                      Alignment = taRightJustify
                      Caption = '2'#186' Identifica'#231#227'o Cedente:'
                    end
                    object Label39: TLabel
                      Left = 46
                      Top = 432
                      Width = 110
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dados Configura'#231#227'o 1:'
                      FocusControl = DBEdit28
                    end
                    object Label40: TLabel
                      Left = 46
                      Top = 459
                      Width = 110
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dados Configura'#231#227'o 2:'
                      FocusControl = DBEdit29
                    end
                    object SpeedButton9: TSpeedButton
                      Left = 577
                      Top = 350
                      Width = 23
                      Height = 22
                      Hint = 'Selecione o Diret'#243'rio dos Arquivos'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B0000000100000001000000730800087B
                        080008841000088C100008A51800108C2100109C210018AD290031C64A0042D6
                        6B0052D67B005AE78C0018A5C60018ADD60021ADD60029ADD60031B5DE0052BD
                        E7004AC6E7004AC6EF009CDEEF00ADDEEF006BDEF70073DEF700A5EFF700FF00
                        FF0084EFFF008CEFFF0094EFFF008CF7FF0094F7FF00A5F7FF0094FFFF009CFF
                        FF00ADFFFF00C6FFFF00D6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00191919191919
                        19191919191919191919190F100E191919191919191919191919190F141A120E
                        0C0C0C19191919191919190F11212017171717120E0C19191919190F11221D1B
                        1B1B171717130E191919190F0F151E1E1B1B1B1B171713191919190F170F211D
                        1D1D1B1B1B17170C1919190F1E0F1518181F1B1B1B17000C1919190F21170F0C
                        0C0C151D1A000B000C19190F211E171717160F15000A09080019190F211E1E1E
                        1E17170F0C0508060C19190F23202124241B1C17170207021919190E14232314
                        0D0C0C0C0C03041919191919100F0C0C19191919030402191919191919191919
                        1900010303011919191919191919191919191919191919191919}
                      OnClick = SpeedButton9Click
                    end
                    object SpeedButton10: TSpeedButton
                      Left = 577
                      Top = 377
                      Width = 23
                      Height = 22
                      Hint = 'Selecione o Diret'#243'rio dos Arquivos'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B0000000100000001000000730800087B
                        080008841000088C100008A51800108C2100109C210018AD290031C64A0042D6
                        6B0052D67B005AE78C0018A5C60018ADD60021ADD60029ADD60031B5DE0052BD
                        E7004AC6E7004AC6EF009CDEEF00ADDEEF006BDEF70073DEF700A5EFF700FF00
                        FF0084EFFF008CEFFF0094EFFF008CF7FF0094F7FF00A5F7FF0094FFFF009CFF
                        FF00ADFFFF00C6FFFF00D6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00191919191919
                        19191919191919191919190F100E191919191919191919191919190F141A120E
                        0C0C0C19191919191919190F11212017171717120E0C19191919190F11221D1B
                        1B1B171717130E191919190F0F151E1E1B1B1B1B171713191919190F170F211D
                        1D1D1B1B1B17170C1919190F1E0F1518181F1B1B1B17000C1919190F21170F0C
                        0C0C151D1A000B000C19190F211E171717160F15000A09080019190F211E1E1E
                        1E17170F0C0508060C19190F23202124241B1C17170207021919190E14232314
                        0D0C0C0C0C03041919191919100F0C0C19191919030402191919191919191919
                        1900010303011919191919191919191919191919191919191919}
                      OnClick = SpeedButton10Click
                    end
                    object SpeedButton13: TSpeedButton
                      Left = 577
                      Top = 35
                      Width = 23
                      Height = 22
                      Hint = 'Selecione o Arquivo'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000230B0000230B00000001000000010000183952000031
                        63006363630021526B00296B940000639C0063639C00639CCE0029ADD60073DE
                        F700FF00FF007BBDFF009CCEFF008CEFFF009CFFFF00FFFFFF00FFFFFF00FFFF
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
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000A0A0A0A0A03
                        0302020A0A0A0A0A0A0A0A0A0A030307050302020A0A0A0A0A0A0A0303040C07
                        05050302020A0A0A0A0A03070C0B05070505050302020A0A0A0A030701050107
                        050C05050302020A0A0A030701010C0C0B020C05050302020A0A03070C0C0B02
                        0909080C05050302020A030C0B0009090D0D08020C0505030202030101000D0D
                        0D0E0809080C050503020A0301000D0E0E08080D08060C05030A0A0A03000E08
                        080D0D0E0809080C030A0A0A0A03000D0D0E0E08080D0801030A0A0A0A0A030E
                        0E08080D0D0E08030A0A0A0A0A0A0A03000D0D0E0E08080A0A0A0A0A0A0A0A0A
                        030E0E08080A0A0A0A0A0A0A0A0A0A0A0A03030A0A0A0A0A0A0A}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton13Click
                    end
                    object SpeedButton14: TSpeedButton
                      Left = 577
                      Top = 404
                      Width = 23
                      Height = 22
                      Hint = 'Selecione a Imagem'
                      Flat = True
                      Glyph.Data = {
                        2E030000424D2E030000000000002E0200002800000010000000100000000100
                        08000000000000010000120B0000120B00007E0000007E00000000000000FFFF
                        FF00FF00FF00922B0100862D0500AD887700C9967500E6AA7A00EABC9800F898
                        2900FFD8AA00726C6200A79365005D624900697B4C0070756B00AAE3C400148B
                        5C000E84570087C4B000079168009CD0C000AFE5D5008BCBBA0087BFB20083BA
                        AF0097DCD00093DCD10097DACF0089C2BA0097E0D8007DC4BD007FCAC50082C6
                        C2003CC4BF0095CFCC0086DEDD007EC6C5007DFEFF0083FEFF0084FEFF0084FF
                        FF0089FFFF008AFFFF0078CFD00096FFFF007FD4D500A1FFFF0076B4B4007AFA
                        FF007EFCFF0076CED00069AFB1009FFCFE0073F7FF007AF8FF007DF8FF0080F8
                        FF0084EBF00090FAFF00A0F8FC0069F3FF006DF4FF0072F3FF0073F3FF0075F6
                        FF0077F4FF0079F4FF0079F3FE007BF4FF007DF6FF0092F2FB009AF4FB009EE5
                        EA0086BFC4005AC9D50077F3FF0078F3FF0079F3FF0077E3EE005DADB50080EA
                        F70082EEFA0083EAF40065EEFF0068EEFF0072EFFF0073EFFF0074EFFF0076EE
                        FF0076F0FF007AEFFF0092E7F400B4EFF70054D8F0006BE7FB006AE2F70070D9
                        EB0083BAC40068E5FF0052919D004DCBEA005BD9F80068DDFA0060CCE60088D8
                        EB0084BFCC0004B4E30044C4E50052C1E10039B7E00057D0F6004099B40075CB
                        E60027A6D50040C1EF0042C4F4004DCAF6004CB6DC001896CA001FA1D40028A4
                        D3000D8EC7001490C9001996CC001E96CB00027D7D7D02020202020202020202
                        02027D5C5E6C6E7D7D7A02020202020202027D5D2927394460657D7D7A020202
                        02027D712D41434D4E4645595F7D020202027A793C36434C5A5857574F637802
                        02027A7D6D28424C5A58403319687D0202027A7D762F3E3F56402C1D1C30617D
                        02027A6F7D6948473B2E201E1A21187D02027A67737D7D7D701F3A241B251713
                        7D027A5B6675740F037D4B49162315107D027A2A32555003070B7D77776A624A
                        7D037A2B31433D3403050D126B77777703027A35263738546403080C14220903
                        02020277535152727A02030A0E110302020202027B777C7A0202020306040202
                        020202020202020202020202030202020202}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton14Click
                    end
                    object Label27: TLabel
                      Left = 123
                      Top = 90
                      Width = 33
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Banco:'
                    end
                    object Label41: TLabel
                      Left = 90
                      Top = 222
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'C'#243'digo Baixa:'
                      FocusControl = DBEdit25
                    end
                    object Label42: TLabel
                      Left = 366
                      Top = 222
                      Width = 75
                      Height = 13
                      Caption = 'C'#243'digo Recusa:'
                      FocusControl = DBEdit30
                    end
                    object Label43: TLabel
                      Left = 34
                      Top = 273
                      Width = 122
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'C'#243'digo Controle Entrada:'
                      FocusControl = DBEdit10
                    end
                    object Label6: TLabel
                      Left = 107
                      Top = 65
                      Width = 50
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit1
                    end
                    object Label129: TLabel
                      Left = 110
                      Top = 12
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Unificada:'
                      FocusControl = DBEdit1
                      Visible = False
                    end
                    object bnExportarLicenca: TSpeedButton
                      Left = 603
                      Top = 35
                      Width = 23
                      Height = 22
                      Hint = 'Exportar licen'#231'a do cobrebem salva no banco de dados - [COB010]'
                      Flat = True
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
                      OnClick = bnExportarLicencaClick
                    end
                    object bnExportarLogo: TSpeedButton
                      Left = 603
                      Top = 404
                      Width = 23
                      Height = 22
                      Hint = 'Exportar logotipo salva no banco de dados - [COB011]'
                      Flat = True
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
                      OnClick = bnExportarLogoClick
                    end
                    object DBEdit3: TDBEdit
                      Left = 162
                      Top = 113
                      Width = 130
                      Height = 21
                      Hint = 'C'#243'digo da ag'#234'ncia banc'#225'ria.'
                      DataField = 'CODIGOAGENCIA'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 7
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit4: TDBEdit
                      Left = 447
                      Top = 113
                      Width = 130
                      Height = 21
                      Hint = 'N'#250'mero da conta corrente do cedente.'
                      DataField = 'NUMEROCONTACORRENTE'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 8
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit5: TDBEdit
                      Left = 447
                      Top = 62
                      Width = 130
                      Height = 21
                      Hint = 
                        'C'#243'digo do cedente. C'#243'digo que o banco identifica o cliente nos a' +
                        'rquivos de remessa.'
                      DataField = 'CODIGOCEDENTE'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 4
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit6: TDBEdit
                      Left = 162
                      Top = 140
                      Width = 130
                      Height = 21
                      Hint = 'Sequ'#234'ncia inicial do nosso n'#250'mero que vai impresso no boleto.'
                      DataField = 'INICIONOSSONUMERO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 9
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit7: TDBEdit
                      Left = 447
                      Top = 141
                      Width = 130
                      Height = 21
                      Hint = 'Sequ'#234'ncia final do nosso n'#250'mero que vai impresso no boleto.'
                      DataField = 'FIMNOSSONUMERO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 10
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit8: TDBEdit
                      Left = 162
                      Top = 166
                      Width = 130
                      Height = 21
                      Hint = 
                        'Valor do proximo nosso numero. A cada novo boleto impresso o sis' +
                        'tema busca este valor e adiciona mais 1.'
                      DataField = 'PROXIMONOSSONUMERO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 11
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object edLicencaOuConvenio: TDBEdit
                      Left = 162
                      Top = 34
                      Width = 415
                      Height = 21
                      Hint = 'Endere'#231'o do arquivo de licen'#231'a.'
                      DataField = 'ARQUIVOLICENCA'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 2
                      OnEnter = DBEdit5Enter
                      OnExit = edLicencaOuConvenioExit
                    end
                    object DBEdit_ImagemCodigoBarras: TDBEdit
                      Left = 162
                      Top = 377
                      Width = 415
                      Height = 21
                      Hint = 'Endere'#231'o das imagens utilizadas na impress'#227'o do boleto.'
                      DataField = 'IMAGENSBOLETO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 23
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit_ImagemLogotipo: TDBEdit
                      Left = 162
                      Top = 403
                      Width = 415
                      Height = 21
                      Hint = 
                        'Endere'#231'o da imagem utilizada como logotipo na impress'#227'o do bolet' +
                        'o.'
                      DataField = 'IMAGENSLOGOTIPO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 24
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit12: TDBEdit
                      Left = 162
                      Top = 298
                      Width = 415
                      Height = 21
                      Hint = 'Identifica'#231#227'o do cedente.'
                      DataField = 'IDENTIFICACAOCEDENTE'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 20
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit2: TDBEdit
                      Left = 162
                      Top = 245
                      Width = 130
                      Height = 21
                      Hint = 'C'#243'digo de controle para identifica'#231#227'o do boleto no caixa.'
                      DataField = 'CODIGO_CTRL'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 9
                      TabOrder = 16
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBLookupComboBox_Controle: TDBLookupComboBox
                      Left = 298
                      Top = 245
                      Width = 279
                      Height = 21
                      Hint = 'Controle'
                      DataField = 'CODIGO_CTRL'
                      DataSource = DtmBoletos.dsCobreBem
                      KeyField = 'CODIGO_CTRL'
                      ListField = 'NOME_CTRL'
                      ListSource = DtmBoletos.dsControles
                      TabOrder = 17
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit23: TDBEdit
                      Left = 162
                      Top = 323
                      Width = 415
                      Height = 21
                      Hint = 'Identifica'#231#227'o do cedente 2.'
                      BevelEdges = []
                      DataField = 'IDENTIFICACAOCEDENTE1'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 21
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBComboBox_TipoDocumento: TDBComboBox
                      Left = 447
                      Top = 195
                      Width = 130
                      Height = 21
                      Hint = 'Tipo do Documento para emiss'#227'o o boleto.'
                      CharCase = ecUpperCase
                      DataField = 'TIPODOCUMENTOCOBRANCA'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'AP'
                        'CH'
                        'DM'
                        'DMI'
                        'DR'
                        'DS'
                        'DSI'
                        'FAT'
                        'LC'
                        'ME'
                        'NCC'
                        'NCE'
                        'NCI'
                        'NCR'
                        'ND'
                        'NP'
                        'NPR'
                        'NS'
                        'OUTROS'
                        'PC'
                        'RC'
                        'TM'
                        'TS')
                      TabOrder = 13
                      OnChange = DBComboBox_TipoDocumentoChange
                      OnEnter = DBComboBox_TipoDocumentoEnter
                      OnExit = DBComboBox_TipoDocumentoExit
                    end
                    object DBEdit26: TDBEdit
                      Left = 162
                      Top = 192
                      Width = 130
                      Height = 21
                      Hint = 'N'#250'mero de sequ'#234'ncia para gerar o arquivo de remessa.'
                      DataField = 'SEQUENCIA_REMESSA'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 9
                      TabOrder = 12
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit_EnderecoRemessaRetorno: TDBEdit
                      Left = 162
                      Top = 350
                      Width = 415
                      Height = 21
                      Hint = 'Endere'#231'o do arquivo de remessa.'
                      DataField = 'ENDERECOREMESSARETORNO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 22
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object ListBox1: TListBox
                      Left = 640
                      Top = 32
                      Width = 124
                      Height = 399
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ItemHeight = 11
                      ParentFont = False
                      TabOrder = 27
                      Visible = False
                      OnEnter = ListBox1Enter
                    end
                    object DBEdit28: TDBEdit
                      Left = 162
                      Top = 429
                      Width = 415
                      Height = 21
                      Hint = 'Outros dados de Configuracao 1.'
                      DataField = 'OUTRODADOCONFIGURACAO1'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 25
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit29: TDBEdit
                      Left = 162
                      Top = 456
                      Width = 415
                      Height = 21
                      Hint = 'Outros dados de Configuracao 2.'
                      DataField = 'OUTRODADOCONFIGURACAO2'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 26
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object Memo1: TMemo
                      Left = 632
                      Top = 32
                      Width = 135
                      Height = 425
                      TabOrder = 28
                      OnEnter = DBEdit1Enter
                    end
                    object DBEdit21: TDBEdit
                      Left = 162
                      Top = 87
                      Width = 130
                      Height = 21
                      Hint = 'C'#243'digo do banco'
                      DataField = 'BANCO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 5
                      OnEnter = DBEdit1Enter
                    end
                    object Edit1: TEdit
                      Left = 298
                      Top = 87
                      Width = 279
                      Height = 21
                      Hint = 'Banco'
                      TabOrder = 6
                      OnEnter = DBEdit1Enter
                    end
                    object DBEdit25: TDBEdit
                      Left = 162
                      Top = 219
                      Width = 130
                      Height = 21
                      Hint = 
                        'C'#243'digo da ocorr'#234'ncia do arquivo de retorno que informa que o bol' +
                        'eto ser'#225' quitado.'
                      DataField = 'CODIGO_BAIXA'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 19
                      TabOrder = 14
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit30: TDBEdit
                      Left = 447
                      Top = 219
                      Width = 130
                      Height = 21
                      Hint = 
                        'C'#243'digo da ocorr'#234'ncia do arquivo de retorno que informa que o bol' +
                        'eto foi recusado.'
                      DataField = 'CODIGO_RECUSA'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 19
                      TabOrder = 15
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit10: TDBEdit
                      Left = 162
                      Top = 270
                      Width = 130
                      Height = 21
                      Hint = 'C'#243'digo de controle para entrada pelo arquivo de retorno'
                      DataField = 'CODIGO_CTRL_ENT'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 9
                      TabOrder = 18
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 298
                      Top = 271
                      Width = 279
                      Height = 21
                      Hint = 'Controle'
                      DataField = 'CODIGO_CTRL_ENT'
                      DataSource = DtmBoletos.dsCobreBem
                      KeyField = 'CODIGO_CTRL'
                      ListField = 'NOME_CTRL'
                      ListSource = DtmBoletos.dsContBanc
                      TabOrder = 19
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit1: TDBEdit
                      Left = 162
                      Top = 61
                      Width = 192
                      Height = 21
                      Hint = 
                        'C'#243'digo do cedente. C'#243'digo que o banco identifica o cliente nos a' +
                        'rquivos de remessa.'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 3
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit66: TDBEdit
                      Left = 162
                      Top = 9
                      Width = 53
                      Height = 21
                      Hint = 'C'#243'digo Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 0
                      Visible = False
                      OnEnter = DBEdit5Enter
                    end
                    object DBLookupComboBox14: TDBLookupComboBox
                      Left = 216
                      Top = 9
                      Width = 361
                      Height = 21
                      Hint = 'Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = DtmBoletos.dsCobreBem
                      KeyField = 'COD_EMPRESA'
                      ListField = 'IDENTIFICACAO_EMP'
                      ListSource = DtmBoletos.dsEmpresasUnificadas
                      TabOrder = 1
                      Visible = False
                      OnEnter = DBEdit5Enter
                    end
                  end
                end
              end
              object TabLayouts: TTabSheet
                Caption = 'Dados HTML / Layouts'
                ImageIndex = 2
                object ScrollBox8: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 787
                  Height = 503
                  Align = alClient
                  TabOrder = 0
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 783
                    Height = 499
                    Align = alTop
                    Caption = 'Dados Html Boleto / Dados Layout'
                    TabOrder = 0
                    object Label28: TLabel
                      Left = 42
                      Top = 71
                      Width = 123
                      Height = 13
                      Caption = 'Layout Arquivo Remessa:'
                    end
                    object Label29: TLabel
                      Left = 46
                      Top = 98
                      Width = 119
                      Height = 13
                      Caption = 'Layout Arquivo Retorno:'
                    end
                    object Label30: TLabel
                      Left = 48
                      Top = 17
                      Width = 117
                      Height = 13
                      Caption = 'Layout Boleto Impresso:'
                    end
                    object Label31: TLabel
                      Left = 45
                      Top = 44
                      Width = 120
                      Height = 13
                      Caption = 'Layout Boleto por E-mail:'
                    end
                    object Label37: TLabel
                      Left = 102
                      Top = 125
                      Width = 63
                      Height = 13
                      Caption = 'HTML Boleto:'
                      FocusControl = DBMemo1
                    end
                    object DBComboBox_ArquivoRemessa: TDBComboBox
                      Left = 171
                      Top = 68
                      Width = 286
                      Height = 21
                      Hint = 'Layout para gerar arquivo de remessa.'
                      DataField = 'LAYOUTARQUIVOREMESSA'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      TabOrder = 2
                    end
                    object DBComboBox_ArquivoRetorno: TDBComboBox
                      Left = 171
                      Top = 95
                      Width = 286
                      Height = 21
                      Hint = 'Layout para ler o arquivo de retorno.'
                      DataField = 'LAYOUTARQUIVORETORNO'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      TabOrder = 3
                    end
                    object DBComboBox_BoletoImpresso: TDBComboBox
                      Left = 171
                      Top = 14
                      Width = 285
                      Height = 21
                      Hint = 'Layout para impress'#227'o de boletos.'
                      DataField = 'LAYOUTBOLETOIMPRESSO'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        '')
                      TabOrder = 0
                    end
                    object DBComboBox_BoletoEmail: TDBComboBox
                      Left = 171
                      Top = 41
                      Width = 286
                      Height = 21
                      Hint = 'Layout do boleto enviado por e-mail.'
                      DataField = 'LAYOUTBOLETOSEMAIL'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      TabOrder = 1
                    end
                    object DBMemo1: TDBMemo
                      Left = 171
                      Top = 122
                      Width = 550
                      Height = 311
                      Hint = 'Html do boleto impresso personalizado.'
                      DataField = 'HTMLBOLETO'
                      DataSource = DtmBoletos.dsCobreBem
                      ScrollBars = ssBoth
                      TabOrder = 4
                    end
                  end
                end
              end
              object TabEnvioEmail: TTabSheet
                Caption = 'Envio de Boleto por E-mail'
                ImageIndex = 1
                object ScrollBox7: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 787
                  Height = 503
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 783
                    Height = 499
                    Align = alTop
                    Caption = 'Dados para Envio de Boleto por E-mail '
                    TabOrder = 0
                    object Label18: TLabel
                      Left = 89
                      Top = 41
                      Width = 76
                      Height = 13
                      Caption = 'E-mail Cedente:'
                      FocusControl = DBEdit13
                    end
                    object Label19: TLabel
                      Left = 10
                      Top = 68
                      Width = 155
                      Height = 13
                      Caption = ' URL Imagens C'#243'digo de Barras:'
                      FocusControl = DBEdit14
                    end
                    object Label20: TLabel
                      Left = 57
                      Top = 95
                      Width = 108
                      Height = 13
                      Caption = 'URL Imagem Logotipo:'
                      FocusControl = DBEdit15
                    end
                    object Label21: TLabel
                      Left = 92
                      Top = 122
                      Width = 73
                      Height = 13
                      Caption = 'Servidor SMTP:'
                      FocusControl = DBEdit16
                    end
                    object Label22: TLabel
                      Left = 106
                      Top = 149
                      Width = 59
                      Height = 13
                      Caption = 'Porta SMTP:'
                      FocusControl = DBEdit17
                    end
                    object Label23: TLabel
                      Left = 96
                      Top = 176
                      Width = 69
                      Height = 13
                      Caption = 'Usu'#225'rio SMTP:'
                      FocusControl = DBEdit18
                    end
                    object Label24: TLabel
                      Left = 489
                      Top = 176
                      Width = 63
                      Height = 13
                      Caption = 'Senha SMTP:'
                      FocusControl = DBEdit_SenhaSMTP
                    end
                    object Label25: TLabel
                      Left = 88
                      Top = 203
                      Width = 77
                      Height = 13
                      Caption = 'Assunto E-mail :'
                      FocusControl = DBEdit20
                    end
                    object Label38: TLabel
                      Left = 75
                      Top = 230
                      Width = 90
                      Height = 13
                      Caption = 'HTML Boleto Email:'
                      FocusControl = DBMemo2
                    end
                    object DBEdit13: TDBEdit
                      Left = 171
                      Top = 38
                      Width = 550
                      Height = 21
                      Hint = 
                        'Endere'#231'o de E-mail do cedente, utilizado para envio de boleto po' +
                        'r e-mail.'
                      DataField = 'EMAIL_ENDERECOCEDENTE'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 0
                    end
                    object DBEdit14: TDBEdit
                      Left = 171
                      Top = 65
                      Width = 550
                      Height = 21
                      Hint = 'URL das imagens do C'#243'digo de barras.'
                      DataField = 'EMAIL_URLIMAGENSBOLETO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 1
                    end
                    object DBEdit15: TDBEdit
                      Left = 171
                      Top = 92
                      Width = 550
                      Height = 21
                      Hint = 'URL da Imagem de utilizada como Logotipo.'
                      DataField = 'EMAIL_URLIMAGENSLOGOTIPO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 2
                    end
                    object DBEdit16: TDBEdit
                      Left = 171
                      Top = 119
                      Width = 550
                      Height = 21
                      Hint = 'Endere'#231'o do servidor smtp para envio de e-mail.'
                      DataField = 'EMAIL_SMTP_SERVIDOR'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 3
                    end
                    object DBEdit17: TDBEdit
                      Left = 171
                      Top = 146
                      Width = 163
                      Height = 21
                      Hint = 'Porta do servidor de e-mail.'
                      DataField = 'EMAIL_SMTP_PORTA'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 9
                      TabOrder = 4
                    end
                    object DBEdit18: TDBEdit
                      Left = 171
                      Top = 173
                      Width = 163
                      Height = 21
                      Hint = 'Usu'#225'rio do e-mail.'
                      DataField = 'EMAIL_SMTP_USUARIO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 5
                    end
                    object DBEdit_SenhaSMTP: TDBEdit
                      Left = 558
                      Top = 173
                      Width = 163
                      Height = 21
                      Hint = 'Senha do usu'#225'rio do e-mail.'
                      DataField = 'EMAIL_SMTP_SENHA'
                      DataSource = DtmBoletos.dsCobreBem
                      PasswordChar = '*'
                      TabOrder = 6
                      OnChange = DBEdit_SenhaSMTPChange
                    end
                    object DBEdit20: TDBEdit
                      Left = 171
                      Top = 200
                      Width = 550
                      Height = 21
                      Hint = 'Assunto do e-mail.'
                      DataField = 'EMAIL_ASSUNTO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 7
                    end
                    object DBMemo2: TDBMemo
                      Left = 171
                      Top = 227
                      Width = 550
                      Height = 214
                      Hint = 'Html do boleto impresso personalizado.'
                      DataField = 'HTMLBOLETOEMAIL'
                      DataSource = DtmBoletos.dsCobreBem
                      ScrollBars = ssBoth
                      TabOrder = 8
                    end
                  end
                end
              end
              object TabLicencaGenerica: TTabSheet
                Caption = 'Licen'#231'a Gen'#233'rica'
                ImageIndex = 5
                object ScrollBox6: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 787
                  Height = 503
                  Align = alClient
                  TabOrder = 0
                  object GroupBoxLicencaGenerica: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 783
                    Height = 499
                    Align = alTop
                    Caption = 'Licen'#231'a Gen'#233'rica'
                    TabOrder = 0
                    object lbLicencaGenerica: TLabel
                      Left = 68
                      Top = 37
                      Width = 112
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Usar Licen'#231'a Gen'#233'rica: '
                    end
                    object lbNomeCedente: TLabel
                      Left = 86
                      Top = 65
                      Width = 90
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Nome do Cedente:'
                      FocusControl = DBEditNomeCedente
                    end
                    object lbCPFCNPJ: TLabel
                      Left = 124
                      Top = 92
                      Width = 52
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'CPF/CNPJ:'
                      FocusControl = DBEditCPFCNPJ
                    end
                    object lbTamCedente: TLabel
                      Left = 40
                      Top = 115
                      Width = 136
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'Tamanho do Nome Cedente no Arquivo de Remessa:'
                      FocusControl = DBEditTamanhoCedente
                      WordWrap = True
                    end
                    object DBComboBoxLicencaGenerica: TDBComboBox
                      Left = 183
                      Top = 34
                      Width = 145
                      Height = 21
                      Hint = 'Usar licen'#231'a gen'#233'rica'
                      CharCase = ecUpperCase
                      DataField = 'LICENCA_GENERICA'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 0
                      OnExit = DBComboBoxLicencaGenericaExit
                    end
                    object DBEditNomeCedente: TDBEdit
                      Left = 182
                      Top = 62
                      Width = 531
                      Height = 21
                      Hint = 'Nome cedente'
                      CharCase = ecUpperCase
                      DataField = 'NOME_EMP_GENERICO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 1
                    end
                    object DBEditCPFCNPJ: TDBEdit
                      Left = 182
                      Top = 89
                      Width = 177
                      Height = 21
                      Hint = 'CPF/CNPJ'
                      CharCase = ecUpperCase
                      DataField = 'CPF_CNPJ_GENERICO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 2
                    end
                    object DBEditTamanhoCedente: TDBEdit
                      Left = 182
                      Top = 117
                      Width = 67
                      Height = 21
                      Hint = 'CPF/CNPJ'
                      CharCase = ecUpperCase
                      DataField = 'TAM_NOME_CEDENTE_GENERICO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 3
                    end
                  end
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'Outros Dados'
                ImageIndex = 3
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 787
                  Height = 503
                  Align = alClient
                  TabOrder = 0
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 783
                    Height = 499
                    Align = alTop
                    Caption = 'Outros Dados'
                    TabOrder = 0
                    OnEnter = GroupBox6Enter
                    OnExit = GroupBox6Exit
                    object Label34: TLabel
                      Left = 64
                      Top = 20
                      Width = 108
                      Height = 13
                      Caption = 'D'#237'gitos Nosso N'#250'mero:'
                    end
                    object Label44: TLabel
                      Left = 458
                      Top = 43
                      Width = 95
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Banco Emite Boleto:'
                    end
                    object Label45: TLabel
                      Left = 39
                      Top = 59
                      Width = 131
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'Tipo Impress'#227'o ( Caso banco realize a impress'#227'o):'
                      WordWrap = True
                    end
                    object Label46: TLabel
                      Left = 376
                      Top = 66
                      Width = 177
                      Height = 13
                      Caption = 'Margem Superior(Ajuste Impress'#227'o):'
                      FocusControl = DBEdit11
                    end
                    object Label48: TLabel
                      Left = 41
                      Top = 43
                      Width = 131
                      Height = 13
                      Caption = 'Banco Gera Nosso N'#250'mero:'
                    end
                    object Label108: TLabel
                      Left = 87
                      Top = 217
                      Width = 85
                      Height = 13
                      Caption = 'Local Pagamento:'
                    end
                    object Label109: TLabel
                      Left = 64
                      Top = 134
                      Width = 106
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Observa'#231#227'o Protesto:'
                    end
                    object Label47: TLabel
                      Left = 117
                      Top = 249
                      Width = 55
                      Height = 13
                      Caption = 'Mensagem:'
                    end
                    object Label49: TLabel
                      Left = 85
                      Top = 89
                      Width = 87
                      Height = 13
                      Caption = 'Permite Protesto: '
                      FocusControl = DBEdit37
                    end
                    object Label56: TLabel
                      Left = 459
                      Top = 112
                      Width = 94
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Taxa de Juros (%):'
                      FocusControl = DBEdit39
                    end
                    object Label50: TLabel
                      Left = 72
                      Top = 288
                      Width = 100
                      Height = 13
                      Caption = 'Mensagem Adicional:'
                    end
                    object Label51: TLabel
                      Left = 115
                      Top = 112
                      Width = 57
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Multas (%):'
                      FocusControl = DBEdit37
                    end
                    object Label52: TLabel
                      Left = 44
                      Top = 314
                      Width = 128
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'Utilizar N'#250'mero de Parcela no C'#243'digo de Barras:'
                      WordWrap = True
                    end
                    object Label53: TLabel
                      Left = 327
                      Top = 314
                      Width = 392
                      Height = 26
                      Caption = 
                        '* Alguns bancos '#233' necess'#225'rio informar o n'#250'mero da parcela no C'#243'd' +
                        'igo de Barras: Exemplo (Sicoob).'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label54: TLabel
                      Left = 2
                      Top = 342
                      Width = 171
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 
                        'Desconsiderar d'#237'gito verificador ao quitar boletos (arquivo de r' +
                        'etorno):'
                      WordWrap = True
                    end
                    object Label55: TLabel
                      Left = 327
                      Top = 348
                      Width = 410
                      Height = 13
                      Caption = 
                        '* Alguns bancos n'#227'o utilizam o d'#237'gito verificador, favor n'#227'o uti' +
                        'lizar esta configura'#231#227'o.'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label57: TLabel
                      Left = 70
                      Top = 375
                      Width = 102
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'Utilizar propriedade InstrucaoCobranca3:'
                      WordWrap = True
                    end
                    object Label58: TLabel
                      Left = 327
                      Top = 371
                      Width = 391
                      Height = 26
                      Caption = 
                        '* Quando o banco for 104 (caixa econ'#244'mica federal), e a carteira' +
                        ' SIG14 e o layout de remessa for SIGCB240, preencher a proprieda' +
                        'de "InstrucaoCobranca3"'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label59: TLabel
                      Left = 84
                      Top = 409
                      Width = 86
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo de cobran'#231'a:'
                      WordWrap = True
                    end
                    object Label60: TLabel
                      Left = 327
                      Top = 403
                      Width = 389
                      Height = 26
                      Caption = 
                        '* Em alguns casos no Banco Santander '#233' necess'#225'rio informar o tip' +
                        'o de cobran'#231'a: Exemplo: 4 - Descontada, 5 - Simples'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object lbGerarRegistroMulta: TLabel
                      Left = 55
                      Top = 439
                      Width = 118
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Gerar Registro de Multa:'
                      WordWrap = True
                    end
                    object lbInfGerarRegistroMulta: TLabel
                      Left = 327
                      Top = 436
                      Width = 418
                      Height = 13
                      Caption = 
                        '* Gerar registro sobre multa no arquivo de remessa CNAB 400, uti' +
                        'lizado no banco ITA'#218
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label32: TLabel
                      Left = 485
                      Top = 89
                      Width = 68
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dias Protesto:'
                      FocusControl = DBEdit24
                    end
                    object Label91: TLabel
                      Left = 60
                      Top = 189
                      Width = 110
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Observa'#231#227'o Desconto:'
                    end
                    object Label92: TLabel
                      Left = 451
                      Top = 161
                      Width = 102
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dias Limite Desconto:'
                      FocusControl = DBEdit53
                    end
                    object Label93: TLabel
                      Left = 81
                      Top = 161
                      Width = 91
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Permite Desconto: '
                      FocusControl = DBEdit37
                      Visible = False
                    end
                    object Label94: TLabel
                      Left = 660
                      Top = 147
                      Width = 117
                      Height = 39
                      Alignment = taCenter
                      Caption = '* Quantidade dias antes do vencimento para concess'#227'o de desconto'
                      FocusControl = DBEdit53
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label95: TLabel
                      Left = 260
                      Top = 161
                      Width = 71
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Desconto (%):'
                      FocusControl = DBEdit37
                      Visible = False
                    end
                    object Label101: TLabel
                      Left = 660
                      Top = 185
                      Width = 114
                      Height = 26
                      Caption = '* Tags (#DESCONTO e #DATA)'
                      FocusControl = DBEdit53
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label105: TLabel
                      Left = 438
                      Top = 20
                      Width = 115
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Testar Html ao Imprimir:'
                    end
                    object DBEdit22: TDBEdit
                      Left = 176
                      Top = 17
                      Width = 57
                      Height = 21
                      Hint = 'Quantidade de digitos da configura'#231#227'o do Nosso N'#250'mero'
                      DataField = 'QTDEDIGNOSSONUMERO'
                      DataSource = DtmBoletos.dsCobreBem
                      Enabled = False
                      MaxLength = 4
                      TabOrder = 0
                    end
                    object DBEdit19: TDBEdit
                      Left = 176
                      Top = 63
                      Width = 100
                      Height = 21
                      DataField = 'TIPOIMPRESSAO'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 4
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 556
                      Top = 41
                      Width = 57
                      Height = 21
                      DataField = 'BANCOEMITEBOLETO'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#227'o'
                        'Sim')
                      TabOrder = 3
                    end
                    object DBEdit11: TDBEdit
                      Left = 556
                      Top = 63
                      Width = 100
                      Height = 21
                      DataField = 'MARGEMSUPERIOR'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 5
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 176
                      Top = 40
                      Width = 57
                      Height = 21
                      DataField = 'BANCOGERANOSSONUMERO'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#227'o'
                        'Sim')
                      TabOrder = 2
                      OnExit = DBComboBox2Exit
                    end
                    object DBMemo3: TDBMemo
                      Left = 176
                      Top = 214
                      Width = 480
                      Height = 30
                      Hint = 
                        'Local de pagamento nas boletas emitidas pelo sistema, campo de m' +
                        'ensagem padr'#227'o'
                      DataField = 'LOCAL_PAG'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 128
                      TabOrder = 15
                    end
                    object DBMemo4: TDBMemo
                      Left = 176
                      Top = 131
                      Width = 480
                      Height = 25
                      Hint = 'Observa'#231#227'o padr'#227'o de protesto para Boletas'
                      DataField = 'OBS_BOL'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 128
                      TabOrder = 10
                    end
                    object DBEdit37: TDBEdit
                      Left = 176
                      Top = 108
                      Width = 100
                      Height = 21
                      Hint = 'Percentual de Multa Praticado pela empresa'
                      DataField = 'MULTAS'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 8
                    end
                    object DBEdit39: TDBEdit
                      Left = 556
                      Top = 108
                      Width = 100
                      Height = 21
                      Hint = 'Taxa de Juros Mensal que a empresa trabalha'
                      DataField = 'TX_JUROS'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 9
                    end
                    object DBMemo5: TDBMemo
                      Left = 176
                      Top = 247
                      Width = 480
                      Height = 35
                      Hint = 'Mensagem a ser impressa em boletos'
                      DataField = 'MENSAGEM_BOL'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 128
                      TabOrder = 16
                    end
                    object DBMemo6: TDBMemo
                      Left = 176
                      Top = 283
                      Width = 480
                      Height = 30
                      Hint = 'Mensagem Adicional a ser impressa em boletos'
                      DataField = 'MENSAGEM_ADC'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 128
                      TabOrder = 17
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 176
                      Top = 86
                      Width = 57
                      Height = 21
                      DataField = 'PERMITE_PROTESTO'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 6
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 176
                      Top = 319
                      Width = 57
                      Height = 21
                      DataField = 'NUMPARC_CODBARRAS'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#227'o'
                        'Sim')
                      TabOrder = 18
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 176
                      Top = 348
                      Width = 57
                      Height = 21
                      DataField = 'DESCONS_DIGVERIF'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#227'o'
                        'Sim')
                      TabOrder = 19
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 175
                      Top = 376
                      Width = 57
                      Height = 21
                      DataField = 'INSTRUCAO_COBRANCA3'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#227'o'
                        'Sim')
                      TabOrder = 20
                    end
                    object DBEdit27: TDBEdit
                      Left = 175
                      Top = 406
                      Width = 100
                      Height = 21
                      Hint = 'Informar o tipo de cobran'#231'a (exemplo 4 ou 5)'
                      DataField = 'TIPO_COBRANCA'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 21
                    end
                    object DBComboBoxGerarRegistroMulta: TDBComboBox
                      Left = 176
                      Top = 436
                      Width = 57
                      Height = 21
                      DataField = 'GERAR_REGISTRO_MULTA'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#227'o'
                        'Sim')
                      TabOrder = 22
                    end
                    object DBEdit24: TDBEdit
                      Left = 556
                      Top = 86
                      Width = 100
                      Height = 21
                      Hint = 
                        'Dias de toler'#226'ncia para a boleta ser protestada. Quando informar' +
                        ' "0" o sistema n'#227'o vai  enviar dados para protesto no boleto'
                      DataField = 'DIASPROTESTO'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 4
                      TabOrder = 7
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBMemo11: TDBMemo
                      Left = 176
                      Top = 182
                      Width = 480
                      Height = 30
                      Hint = 'Mensagem Adicional a ser impressa em boletos'
                      DataField = 'MENSAGEM_DESC'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 128
                      TabOrder = 14
                    end
                    object DBEdit53: TDBEdit
                      Left = 556
                      Top = 158
                      Width = 100
                      Height = 21
                      Hint = 
                        'Quantidade de dias antes do vencimento para concess'#227'o de descont' +
                        'o'
                      DataField = 'QTD_DIAS_LIM_DESC'
                      DataSource = DtmBoletos.dsCobreBem
                      MaxLength = 4
                      TabOrder = 13
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                    end
                    object DBComboBox12: TDBComboBox
                      Left = 176
                      Top = 158
                      Width = 57
                      Height = 21
                      DataField = 'PERMITE_DESCONTO'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 11
                      Visible = False
                    end
                    object DBEdit54: TDBEdit
                      Left = 335
                      Top = 158
                      Width = 110
                      Height = 21
                      Hint = 'Percentual de Desconto Praticado pela empresa'
                      DataField = 'PERC_DESC'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 12
                      Visible = False
                    end
                    object DBComboBox16: TDBComboBox
                      Left = 556
                      Top = 17
                      Width = 57
                      Height = 21
                      DataField = 'TESTAR_HTML'
                      DataSource = DtmBoletos.dsCobreBem
                      ItemHeight = 13
                      Items.Strings = (
                        'Sim'
                        'N'#227'o')
                      TabOrder = 1
                    end
                  end
                end
              end
              object TabSheetOutrasConf: TTabSheet
                Caption = 'Outras Configura'#231#245'es'
                ImageIndex = 4
                object ScrollBox5: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 787
                  Height = 503
                  Align = alClient
                  TabOrder = 0
                  object GroupBoxOutrasConf: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 783
                    Height = 499
                    Align = alTop
                    Caption = 'Outras Configura'#231#245'es'
                    TabOrder = 0
                    object DBMemoOutrasConf: TDBMemo
                      Left = 151
                      Top = 24
                      Width = 561
                      Height = 457
                      DataField = 'OUTRAS_CONFIG_BOL'
                      DataSource = DtmBoletos.dsCobreBem
                      TabOrder = 0
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 534
              Width = 795
              ExplicitTop = 534
              ExplicitWidth = 795
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro  - [COB008]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [COB009]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 795
          ExplicitHeight = 582
          inherited GroupBox3: TGroupBox
            Width = 795
            ExplicitWidth = 795
            inherited imgInformation: TImage
              Left = 769
              ExplicitLeft = 755
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [COB001]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [COB002]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 795
            Height = 509
            ExplicitWidth = 795
            ExplicitHeight = 509
            inherited Splitter1: TSplitter
              Height = 448
              ExplicitHeight = 399
            end
            inherited DBGrid1: TDBGrid
              Width = 502
              Height = 448
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 791
              ExplicitWidth = 791
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro- [COB003]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [COB005]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [COB006]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Arquivos Remessa/Retorno'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF0082C10082C10082C10082C1FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF046B0BFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF0588C472C7E950C6F62DAFE7169CD70082C100
                  82C10082C10082C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF046B0B046B0B
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0284C25BB8DD93E2FE52CC
                  FF5AD0FF5CD1FF5CD0FF48C4F71C9FDA0083C20082C10082C10082C10082C1FF
                  00FF046B0B088111046B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082C1
                  1F9ACEAAE2F653CCFF54CCFE55CCFE55CCFE56CCFF046B0B046B0B046B0B046B
                  0B046B0B046B0B046B0B046B0B0E971C088211046B0BFF00FFFF00FFFF00FFFF
                  00FFFF00FF0082C10F93CA76C6E57FDCFF54CEFE56CEFE56CEFE56CEFE046B0B
                  3DDA6E37D36431CB592BC24E24BA431FB03818A72E139F250F991E098312046B
                  0BFF00FFFF00FFFF00FFFF00FF0082C11C9DD130A4D4ABE9FA56D3FE5CD4FE5C
                  D4FE5CD4FE046B0B43E1773FDC6F39D46633CC5B2DC45126BB451FB13A19A930
                  14A1280F9A1F098313046B0BFF00FFFF00FFFF00FF0082C138B1E00E91C998D9
                  EF76E1FF62D9FE62DAFE62DAFE046B0B46E57D44E27940DD723AD56834CE5D2D
                  C55227BC4721B43C1BAB3315A328119C21098313046B0BFF00FFFF00FF0082C1
                  45BBEA0F92CC43AFD8ADDCE56BBBCF70BCD06FBCD0046B0B46E57D46E57D44E3
                  7A41DD743CD76A35D05F2FC75528BF4A22B63F1CAD340E8C1D046B0BFF00FFFF
                  00FFFF00FF0082C14AC1F227A4DD1892C6B5E7F097E5E98FE2E78FE2E5046B0B
                  46E57D46E57D46E57D46E57B41DE753DD86C36D16230C9572AC04C159829046B
                  0BFF00FFFF00FFFF00FFFF00FF0082C14EC4F63BB4EF1682B258BCDECAF8F39D
                  F0EA9EF0E9046B0B046B0B046B0B046B0B046B0B046B0B046B0B046B0B38D365
                  1DA336046B0B80F8FF0082C1FF00FFFF00FFFF00FF0082C15CC9FB41B8FA526F
                  811391C7A6DEEEC9F0F6C9F2F6CAF3F6D1F7F6C0F6EEA7F0E59AEEE39CEDE29D
                  EDE2046B0B23AC41046B0B88FBFF8EFFFF2BB0D90082C1FF00FFFF00FF0082C1
                  72D0FF44BFFF9C6B6258ACC70B8AC20B8AC20A8AC2098AC20C8CC578CBE3E5FB
                  F7D0F4EBB5EFE3B1EFE3046B0B046B0B69DCEFA3FCFFA7FFFFA1FBFC0082C1FF
                  00FFFF00FF0082C181D9FF4CC6FFA47264FEEDDAFBE7D5EBE0CEDDD9C7CACFC1
                  8EB8BC138EC134A5D1DDF3F6F2F8F3E5F3E7046B0BB4FAFF84DCEECFFEFFCEFE
                  FFDAFFFF98E2F20082C1FF00FF0082C188E2FF55D1FFAB7867FFF0E5FEEFE0FE
                  EDDAFFE9D4FEE7CFFEE3C7C9CFC12395C0118FC586CCE5EDF6F7E1E2E2E2FCFF
                  C0E9F4F6FFFFF4FFFFFEFFFFE2F7FC0082C1FF00FF0082C191EAFF5BDDFFB27F
                  6AFFF6EEFEF3EAFEF0E5FEEEDEFEEDD8FFE9D4FFE6CCE2D9C775B2C02B98C100
                  82C10082C10082C10082C10082C10082C10082C10082C10082C1FF00FF0082C1
                  96F3FF64E7FFBC876DFEFAF6FFF8F2FEF6EDFEF3E9FFF2E2FFEEDEFEEBD8FFE9
                  D1FEE5CBFEE2C6FFE0C07342417AF4FF0082C1FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0082C1B7FFFF68F2FFC68F6FFEFCFBFEFCF8FEFAF6FEF7F0FEF4ED
                  FFF3E7FEF0E2FEEEDDFEEAD7FEE7D1FFE5CB734241A1FFFF0082C1FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF0082C18ED7EB89FCFFCE9574FEFEFEFEFEFEFE
                  FCFCFEFBF8FEF8F4FEF7F0FEF4EBFEF3E6FEF3E6D5DCD7C2D0CB7342410082C1
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082C1E6FFFFD79C
                  77FEFEFEFEFEFEFEFEFEFEFEFEFEFCFBFEFAF8FEF8F4A0675BA0675BA0675BA0
                  675B926363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF0082C1DCA378FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFEFCFAA067
                  5BD9995CD18C52DE8B37D9832AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFE2A77AFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEA0675BEEB164E9A758EA9635FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE3AA7AFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEA0675BD99F64DC9C5AFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1A5
                  77D1926DD1926DD1926DD1926DD1926DD1926DD1926DA0675BD99F64FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Top = 5
                Hint = 'Ver registros da lixeira - [BOL007]'
                OnClick = SpeedButton25Click
                ExplicitTop = 5
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 448
              ExplicitHeight = 448
              inherited ScrollBox2: TScrollBox
                Height = 431
                ExplicitHeight = 431
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 795
          ExplicitHeight = 582
        end
        object TabSheet4: TTabSheet
          Caption = 'Cadastro Conv'#234'nio'
          ImageIndex = 4
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 795
            Height = 534
            ActivePage = TabSheet5
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            OnChange = PageControl2Change
            object TabSheet5: TTabSheet
              Caption = 'Configura'#231#245'es'
              object ScrollBox9: TScrollBox
                Left = 0
                Top = 0
                Width = 787
                Height = 503
                Align = alClient
                TabOrder = 0
                object GroupBox7: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 783
                  Height = 499
                  Align = alTop
                  Caption = 'Dados do Conv'#234'nio'
                  TabOrder = 0
                  object Label14: TLabel
                    Left = 97
                    Top = 17
                    Width = 48
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Unificada:'
                    FocusControl = DBEdit1
                    Visible = False
                  end
                  object Label62: TLabel
                    Left = 96
                    Top = 44
                    Width = 50
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Descri'#231#227'o:'
                    FocusControl = DBEdit32
                  end
                  object Label63: TLabel
                    Left = 103
                    Top = 96
                    Width = 42
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Ag'#234'ncia:'
                    FocusControl = DBEdit33
                  end
                  object Label64: TLabel
                    Left = 304
                    Top = 96
                    Width = 79
                    Height = 13
                    Caption = 'Conta Corrente:'
                    FocusControl = DBEdit34
                  end
                  object Label65: TLabel
                    Left = 510
                    Top = 151
                    Width = 114
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Pr'#243'ximo Nosso N'#250'mero:'
                    FocusControl = DBEdit35
                  end
                  object Label67: TLabel
                    Left = 64
                    Top = 204
                    Width = 81
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'C'#243'digo Controle:'
                    FocusControl = DBEdit36
                  end
                  object Label68: TLabel
                    Left = 6
                    Top = 178
                    Width = 139
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'N'#250'mero Sequ'#234'ncia Remessa:'
                    FocusControl = DBEdit38
                  end
                  object Label70: TLabel
                    Left = 23
                    Top = 230
                    Width = 122
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'C'#243'digo Controle Entrada:'
                    FocusControl = DBEdit41
                  end
                  object Label71: TLabel
                    Left = 21
                    Top = 256
                    Width = 124
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '1'#186' Identifica'#231#227'o Cedente:'
                    FocusControl = DBEdit42
                    OnClick = BitBtn1Click
                  end
                  object Label72: TLabel
                    Left = 21
                    Top = 281
                    Width = 124
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '2'#186' Identifica'#231#227'o Cedente:'
                  end
                  object Label61: TLabel
                    Left = 7
                    Top = 306
                    Width = 138
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Endere'#231'o Remessa/Retorno:'
                    FocusControl = DBEdit_EnderecoRemessaRetorno2
                  end
                  object SpeedButton15: TSpeedButton
                    Left = 748
                    Top = 302
                    Width = 23
                    Height = 22
                    Hint = 'Selecione o Diret'#243'rio dos Arquivos'
                    Flat = True
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000420B0000420B0000000100000001000000730800087B
                      080008841000088C100008A51800108C2100109C210018AD290031C64A0042D6
                      6B0052D67B005AE78C0018A5C60018ADD60021ADD60029ADD60031B5DE0052BD
                      E7004AC6E7004AC6EF009CDEEF00ADDEEF006BDEF70073DEF700A5EFF700FF00
                      FF0084EFFF008CEFFF0094EFFF008CF7FF0094F7FF00A5F7FF0094FFFF009CFF
                      FF00ADFFFF00C6FFFF00D6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00191919191919
                      19191919191919191919190F100E191919191919191919191919190F141A120E
                      0C0C0C19191919191919190F11212017171717120E0C19191919190F11221D1B
                      1B1B171717130E191919190F0F151E1E1B1B1B1B171713191919190F170F211D
                      1D1D1B1B1B17170C1919190F1E0F1518181F1B1B1B17000C1919190F21170F0C
                      0C0C151D1A000B000C19190F211E171717160F15000A09080019190F211E1E1E
                      1E17170F0C0508060C19190F23202124241B1C17170207021919190E14232314
                      0D0C0C0C0C03041919191919100F0C0C19191919030402191919191919191919
                      1900010303011919191919191919191919191919191919191919}
                    OnClick = SpeedButton9Click
                  end
                  object Label74: TLabel
                    Left = 112
                    Top = 69
                    Width = 33
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Banco:'
                  end
                  object Label81: TLabel
                    Left = 44
                    Top = 152
                    Width = 101
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'In'#237'cio Nosso N'#250'mero:'
                    FocusControl = DBEdit47
                  end
                  object Label82: TLabel
                    Left = 291
                    Top = 152
                    Width = 92
                    Height = 13
                    Caption = 'Fim Nosso N'#250'mero:'
                    FocusControl = DBEdit48
                  end
                  object Label84: TLabel
                    Left = 302
                    Top = 178
                    Width = 81
                    Height = 13
                    Caption = 'Tipo Documento:'
                  end
                  object Label85: TLabel
                    Left = 543
                    Top = 96
                    Width = 81
                    Height = 13
                    Caption = 'C'#243'digo Cedente:'
                    FocusControl = DBEdit50
                  end
                  object Label86: TLabel
                    Left = 575
                    Top = 44
                    Width = 49
                    Height = 13
                    Caption = 'Ambiente:'
                    FocusControl = DBEdit50
                  end
                  object Label87: TLabel
                    Left = 539
                    Top = 123
                    Width = 87
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Varia'#231#227'o Carteira:'
                    FocusControl = DBEdit34
                  end
                  object Label88: TLabel
                    Left = 340
                    Top = 123
                    Width = 43
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Carteira:'
                    FocusControl = DBEdit34
                  end
                  object Label89: TLabel
                    Left = 77
                    Top = 332
                    Width = 68
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Padr'#227'o CNAB:'
                  end
                  object Label90: TLabel
                    Left = 555
                    Top = 69
                    Width = 69
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Tpo de Conta:'
                    FocusControl = DBEdit34
                  end
                  object Label69: TLabel
                    Left = 56
                    Top = 123
                    Width = 89
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'N'#250'mero Conv'#234'nio:'
                    FocusControl = DBEdit31
                  end
                  object DBEdit9: TDBEdit
                    Left = 146
                    Top = 14
                    Width = 53
                    Height = 21
                    Hint = 'C'#243'digo Empresa Unificada'
                    DataField = 'COD_EMP_MULT'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 0
                    Visible = False
                    OnEnter = DBEdit5Enter
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 201
                    Top = 14
                    Width = 545
                    Height = 21
                    Hint = 'Empresa Unificada'
                    DataField = 'COD_EMP_MULT'
                    DataSource = DtmBoletos.dsCobreBem
                    KeyField = 'COD_EMPRESA'
                    ListField = 'IDENTIFICACAO_EMP'
                    ListSource = DtmBoletos.dsEmpresasUnificadas
                    TabOrder = 1
                    Visible = False
                    OnEnter = DBEdit5Enter
                  end
                  object DBEdit32: TDBEdit
                    Left = 146
                    Top = 40
                    Width = 387
                    Height = 21
                    Hint = 
                      'C'#243'digo do cedente. C'#243'digo que o banco identifica o cliente nos a' +
                      'rquivos de remessa.'
                    CharCase = ecUpperCase
                    DataField = 'DESCRICAO'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 2
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit33: TDBEdit
                    Left = 146
                    Top = 93
                    Width = 120
                    Height = 21
                    Hint = 'C'#243'digo da ag'#234'ncia banc'#225'ria.'
                    DataField = 'CODIGOAGENCIA'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 6
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit34: TDBEdit
                    Left = 384
                    Top = 93
                    Width = 120
                    Height = 21
                    Hint = 'N'#250'mero da conta corrente do cedente.'
                    DataField = 'NUMEROCONTACORRENTE'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 7
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit35: TDBEdit
                    Left = 626
                    Top = 147
                    Width = 120
                    Height = 21
                    Hint = 
                      'Valor do proximo nosso numero. A cada novo boleto impresso o sis' +
                      'tema busca este valor e adiciona mais 1.'
                    DataField = 'PROXIMONOSSONUMERO'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 14
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit36: TDBEdit
                    Left = 146
                    Top = 201
                    Width = 120
                    Height = 21
                    Hint = 'C'#243'digo de controle para identifica'#231#227'o do boleto no caixa.'
                    DataField = 'CODIGO_CTRL'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 9
                    TabOrder = 17
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBLookupComboBox3: TDBLookupComboBox
                    Left = 268
                    Top = 201
                    Width = 478
                    Height = 21
                    Hint = 'Controle'
                    DataField = 'CODIGO_CTRL'
                    DataSource = DtmBoletos.dsCobreBem
                    KeyField = 'CODIGO_CTRL'
                    ListField = 'NOME_CTRL'
                    ListSource = DtmBoletos.dsControles
                    TabOrder = 18
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit38: TDBEdit
                    Left = 146
                    Top = 175
                    Width = 120
                    Height = 21
                    Hint = 'N'#250'mero de sequ'#234'ncia para gerar o arquivo de remessa.'
                    DataField = 'SEQUENCIA_REMESSA'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 9
                    TabOrder = 15
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit41: TDBEdit
                    Left = 146
                    Top = 227
                    Width = 120
                    Height = 21
                    Hint = 'C'#243'digo de controle para entrada pelo arquivo de retorno'
                    DataField = 'CODIGO_CTRL_ENT'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 9
                    TabOrder = 19
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBLookupComboBox4: TDBLookupComboBox
                    Left = 268
                    Top = 227
                    Width = 478
                    Height = 21
                    Hint = 'Controle'
                    DataField = 'CODIGO_CTRL_ENT'
                    DataSource = DtmBoletos.dsCobreBem
                    KeyField = 'CODIGO_CTRL'
                    ListField = 'NOME_CTRL'
                    ListSource = DtmBoletos.dsContBanc
                    TabOrder = 20
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit42: TDBEdit
                    Left = 146
                    Top = 253
                    Width = 600
                    Height = 21
                    Hint = 'Identifica'#231#227'o do cedente.'
                    DataField = 'IDENTIFICACAOCEDENTE'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 21
                  end
                  object DBEdit43: TDBEdit
                    Left = 146
                    Top = 278
                    Width = 600
                    Height = 21
                    Hint = 'Identifica'#231#227'o do cedente 2.'
                    BevelEdges = []
                    DataField = 'IDENTIFICACAOCEDENTE1'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 22
                  end
                  object DBEdit_EnderecoRemessaRetorno2: TDBEdit
                    Left = 147
                    Top = 303
                    Width = 599
                    Height = 21
                    Hint = 'Endere'#231'o do arquivo de remessa.'
                    DataField = 'ENDERECOREMESSARETORNO'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 23
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit40: TDBEdit
                    Left = 146
                    Top = 66
                    Width = 53
                    Height = 21
                    Hint = 'C'#243'digo do banco'
                    DataField = 'BANCO'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 4
                    OnExit = DBEdit40Exit
                    OnKeyPress = DBEdit40KeyPress
                  end
                  object DBEdit47: TDBEdit
                    Left = 146
                    Top = 148
                    Width = 120
                    Height = 21
                    Hint = 'Sequ'#234'ncia inicial do nosso n'#250'mero que vai impresso no boleto.'
                    DataField = 'INICIONOSSONUMERO'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 12
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit48: TDBEdit
                    Left = 385
                    Top = 148
                    Width = 120
                    Height = 21
                    Hint = 'Sequ'#234'ncia final do nosso n'#250'mero que vai impresso no boleto.'
                    DataField = 'FIMNOSSONUMERO'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 13
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBComboBox8: TDBComboBox
                    Left = 384
                    Top = 175
                    Width = 362
                    Height = 21
                    Hint = 'Tipo do Documento para emiss'#227'o o boleto.'
                    DataField = 'TIPODOCUMENTOCOBRANCA'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      '01 - Duplicata mercantil'
                      '02 - Nota promiss'#243'ria'
                      '03 - Nota de seguro'
                      '04 - Duplicata de servi'#231'o'
                      '05 - Recibo'
                      '06 - Letra de C'#226'mbio'
                      '07 - Nota de d'#233'bito'
                      '08 - Boleto de Proposta'
                      '09 - Letra de C'#226'mbio'
                      '10 - Warrant'
                      '11 - Cheque'
                      '12 - Cobran'#231'a seriada'
                      '13 - Mesanlidade escolar'
                      '14 - Ap'#243'lice de seguro'
                      '15 - Documento de D'#237'vida'
                      '16 - Encargos Condomianiais'
                      '17 - Conta de presta'#231#227'o de servi'#231'o'
                      '18 - Contrato'
                      '19 - Cosseguro'
                      '20 - Duplicata rural'
                      '21 - Nota Primiss'#243'ria'
                      '22 - D'#237'vida ativa da uni'#227'o'
                      '23 - D'#237'vida aitva de estado'
                      '24 - D'#237'vida ativa de munic'#237'pio'
                      '25 - Duplicata mercantil por indica'#231#227'o'
                      '26 - Duplicata de servi'#231'o por indica'#231#227'o'
                      '27 - Nota de cr'#233'dito comercial'
                      '28 - Nota de cr'#233'dito para exporta'#231#227'o'
                      '29 - Nota de cr'#233'dito industrial'
                      '30 - Nota de cr'#233'dito rural'
                      '32 - Triplicata mercantil'
                      '33 - Triplicata de servi'#231'o'
                      '34 - Fatura'
                      '35 - Parcela de cons'#243'rcio'
                      '36 - Nota fiscal'
                      '37 - C'#233'dula de produto rural'
                      '38 - Cart'#227'o de cr'#233'dito'
                      '99 - Outros')
                    TabOrder = 16
                    OnChange = DBComboBox_TipoDocumentoChange
                    OnEnter = DBComboBox_TipoDocumentoEnter
                    OnExit = DBComboBox_TipoDocumentoExit
                    OnKeyPress = DBComboBox8KeyPress
                  end
                  object DBEdit50: TDBEdit
                    Left = 626
                    Top = 92
                    Width = 120
                    Height = 21
                    Hint = 
                      'C'#243'digo do cedente. C'#243'digo que o banco identifica o cliente nos a' +
                      'rquivos de remessa.'
                    DataField = 'CODIGOCEDENTE'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 9
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBComboBox9: TDBComboBox
                    Left = 626
                    Top = 40
                    Width = 120
                    Height = 21
                    Hint = 'Ambiente (Homolo'#231#227'o / Produ'#231#227'o)'
                    DataField = 'AMBIENTE'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      'Homologa'#231#227'o'
                      'Produ'#231#227'o')
                    TabOrder = 3
                    OnKeyPress = DBComboBox9KeyPress
                  end
                  object DBEdit51: TDBEdit
                    Left = 626
                    Top = 120
                    Width = 120
                    Height = 21
                    Hint = 'Varia'#231#227'o Carteira'
                    DataField = 'OUTRODADOCONFIGURACAO2'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 11
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit52: TDBEdit
                    Left = 384
                    Top = 120
                    Width = 120
                    Height = 21
                    Hint = 'Carteira'
                    DataField = 'OUTRODADOCONFIGURACAO1'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 10
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBComboBox10: TDBComboBox
                    Left = 146
                    Top = 329
                    Width = 600
                    Height = 21
                    Hint = 'Padr'#227'o CNAB'
                    DataField = 'LAYOUTARQUIVOREMESSA'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      '240'
                      '400')
                    TabOrder = 24
                    OnKeyPress = DBComboBox10KeyPress
                  end
                  object DBComboBox11: TDBComboBox
                    Left = 626
                    Top = 66
                    Width = 120
                    Height = 21
                    Hint = 'Tipo de Conta (Corrente / Poupan'#231'a)'
                    DataField = 'TIPO_CONTA'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      'CORRENTE'
                      'POUPAN'#199'A')
                    TabOrder = 5
                    OnKeyPress = DBComboBox11KeyPress
                  end
                  object DBLookupComboBox5: TDBLookupComboBox
                    Left = 201
                    Top = 66
                    Width = 332
                    Height = 21
                    Hint = 'Bancos'
                    DataField = 'BANCO'
                    DataSource = DtmBoletos.dsCobreBem
                    KeyField = 'CODBANCO'
                    ListField = 'DESCRBANCO'
                    ListSource = DtmBoletos.dsBancosHomologados
                    TabOrder = 25
                    OnEnter = DBEdit5Enter
                    OnExit = DBLookupComboBox5Exit
                  end
                  object DBEdit31: TDBEdit
                    Left = 146
                    Top = 120
                    Width = 120
                    Height = 21
                    Hint = 'N'#250'mero do conv'#234'nio'
                    DataField = 'CODIGOCONVENIO'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 8
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                end
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'Outros Dados'
              ImageIndex = 1
              object ScrollBox10: TScrollBox
                Left = 0
                Top = 0
                Width = 787
                Height = 503
                Align = alClient
                TabOrder = 0
                object GroupBox8: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 783
                  Height = 499
                  Align = alTop
                  Caption = 'Dados Html Boleto / Outros Dados'
                  TabOrder = 0
                  object Label73: TLabel
                    Left = 28
                    Top = 30
                    Width = 85
                    Height = 13
                    Caption = 'Local Pagamento:'
                  end
                  object Label78: TLabel
                    Left = 45
                    Top = 149
                    Width = 68
                    Height = 13
                    Caption = 'Dias Protesto:'
                  end
                  object Label79: TLabel
                    Left = 58
                    Top = 354
                    Width = 55
                    Height = 13
                    Caption = 'Mensagem:'
                  end
                  object Label80: TLabel
                    Left = 13
                    Top = 403
                    Width = 100
                    Height = 13
                    Caption = 'Mensagem Adicional:'
                  end
                  object Label83: TLabel
                    Left = 7
                    Top = 175
                    Width = 106
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Observa'#231#227'o Protesto:'
                  end
                  object Label96: TLabel
                    Left = 3
                    Top = 246
                    Width = 110
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Observa'#231#227'o Desconto:'
                  end
                  object Label97: TLabel
                    Left = 430
                    Top = 220
                    Width = 102
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Dias Limite Desconto:'
                    FocusControl = DBEdit49
                  end
                  object Label98: TLabel
                    Left = 22
                    Top = 220
                    Width = 91
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Permite Desconto: '
                    FocusControl = DBEdit37
                    Visible = False
                  end
                  object Label99: TLabel
                    Left = 648
                    Top = 208
                    Width = 132
                    Height = 39
                    Alignment = taCenter
                    Caption = '* Quantidade dias antes do vencimento para concess'#227'o de desconto'
                    FocusControl = DBEdit49
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Label100: TLabel
                    Left = 216
                    Top = 220
                    Width = 71
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Desconto (%):'
                    FocusControl = DBEdit37
                    Visible = False
                  end
                  object Label102: TLabel
                    Left = 654
                    Top = 248
                    Width = 118
                    Height = 26
                    Caption = '* Usar Tags (#DESCONTO e #DATA)'
                    FocusControl = DBEdit53
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Label103: TLabel
                    Left = 248
                    Top = 74
                    Width = 89
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'TituloCodigoMulta:'
                  end
                  object Label75: TLabel
                    Left = 56
                    Top = 74
                    Width = 57
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Multas (%):'
                    FocusControl = DBEdit44
                  end
                  object Label76: TLabel
                    Left = 34
                    Top = 99
                    Width = 79
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Taxa Juros (%):'
                    FocusControl = DBEdit45
                  end
                  object Label104: TLabel
                    Left = 248
                    Top = 99
                    Width = 89
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'TituloCodigoJuros:'
                  end
                  object Label77: TLabel
                    Left = 29
                    Top = 124
                    Width = 84
                    Height = 13
                    Caption = 'Permite Protesto:'
                  end
                  object Label106: TLabel
                    Left = 233
                    Top = 124
                    Width = 104
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'TituloCodigoProtesto:'
                  end
                  object Label107: TLabel
                    Left = 37
                    Top = 275
                    Width = 76
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'QrCode do Pix: '
                    FocusControl = DBEdit37
                    Visible = False
                  end
                  object Label110: TLabel
                    Left = 13
                    Top = 301
                    Width = 100
                    Height = 13
                    Caption = 'Caminho Certificado:'
                    FocusControl = DBEdit37
                  end
                  object SpeedButton16: TSpeedButton
                    Left = 648
                    Top = 298
                    Width = 23
                    Height = 22
                    Hint = 'Selecione o Arquivo'
                    Flat = True
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000230B0000230B00000001000000010000183952000031
                      63006363630021526B00296B940000639C0063639C00639CCE0029ADD60073DE
                      F700FF00FF007BBDFF009CCEFF008CEFFF009CFFFF00FFFFFF00FFFFFF00FFFF
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
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000A0A0A0A0A03
                      0302020A0A0A0A0A0A0A0A0A0A030307050302020A0A0A0A0A0A0A0303040C07
                      05050302020A0A0A0A0A03070C0B05070505050302020A0A0A0A030701050107
                      050C05050302020A0A0A030701010C0C0B020C05050302020A0A03070C0C0B02
                      0909080C05050302020A030C0B0009090D0D08020C0505030202030101000D0D
                      0D0E0809080C050503020A0301000D0E0E08080D08060C05030A0A0A03000E08
                      080D0D0E0809080C030A0A0A0A03000D0D0E0E08080D0801030A0A0A0A0A030E
                      0E08080D0D0E08030A0A0A0A0A0A0A03000D0D0E0E08080A0A0A0A0A0A0A0A0A
                      030E0E08080A0A0A0A0A0A0A0A0A0A0A0A03030A0A0A0A0A0A0A}
                    OnClick = SpeedButton16Click
                  end
                  object Label111: TLabel
                    Left = 24
                    Top = 328
                    Width = 89
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Senha Certificado:'
                    FocusControl = DBEdit37
                  end
                  object Label112: TLabel
                    Left = 392
                    Top = 328
                    Width = 140
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Data Vencimento Certificado:'
                    FocusControl = DBEdit37
                  end
                  object DBMemo7: TDBMemo
                    Left = 114
                    Top = 27
                    Width = 529
                    Height = 40
                    Hint = 
                      'Local de pagamento nas boletas emitidas pelo sistema, campo de m' +
                      'ensagem padr'#227'o'
                    DataField = 'LOCAL_PAG'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 128
                    TabOrder = 0
                  end
                  object DBMemo8: TDBMemo
                    Left = 114
                    Top = 352
                    Width = 529
                    Height = 42
                    Hint = 'Mensagem a ser impressa em boletos'
                    DataField = 'MENSAGEM_BOL'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 128
                    TabOrder = 17
                  end
                  object DBMemo9: TDBMemo
                    Left = 114
                    Top = 400
                    Width = 529
                    Height = 42
                    Hint = 'Mensagem Adicional a ser impressa em boletos'
                    DataField = 'MENSAGEM_ADC'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 128
                    TabOrder = 18
                  end
                  object DBMemo10: TDBMemo
                    Left = 114
                    Top = 172
                    Width = 529
                    Height = 40
                    Hint = 'Observa'#231#227'o padr'#227'o de protesto para Boletas'
                    DataField = 'OBS_BOL'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 128
                    TabOrder = 8
                  end
                  object DBEdit46: TDBEdit
                    Left = 114
                    Top = 146
                    Width = 110
                    Height = 21
                    Hint = 
                      'Dias de toler'#226'ncia para a boleta ser protestada. Quando informar' +
                      ' "0" o sistema n'#227'o vai  enviar dados para protesto no boleto'
                    DataField = 'DIASPROTESTO'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 4
                    TabOrder = 7
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBMemo12: TDBMemo
                    Left = 114
                    Top = 242
                    Width = 529
                    Height = 25
                    Hint = 'Mensagem Adicional a ser impressa em boletos'
                    DataField = 'MENSAGEM_DESC'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 128
                    TabOrder = 12
                  end
                  object DBEdit49: TDBEdit
                    Left = 533
                    Top = 217
                    Width = 110
                    Height = 21
                    Hint = 
                      'Quantidade de dias antes do vencimento para concess'#227'o de descont' +
                      'o'
                    DataField = 'QTD_DIAS_LIM_DESC'
                    DataSource = DtmBoletos.dsCobreBem
                    MaxLength = 4
                    TabOrder = 11
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBComboBox13: TDBComboBox
                    Left = 114
                    Top = 217
                    Width = 57
                    Height = 21
                    DataField = 'PERMITE_DESCONTO'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 9
                    Visible = False
                  end
                  object DBEdit55: TDBEdit
                    Left = 288
                    Top = 217
                    Width = 110
                    Height = 21
                    Hint = 'Percentual de Desconto Praticado pela empresa'
                    DataField = 'PERC_DESC'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 10
                    Visible = False
                  end
                  object DBComboBox14: TDBComboBox
                    Left = 339
                    Top = 71
                    Width = 304
                    Height = 21
                    Hint = 'Como informar multa'
                    DataField = 'TITULOCODIGOMULTA'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      '1- Valor em reais'
                      '2 - Taxa mensal')
                    TabOrder = 2
                    OnKeyPress = DBComboBox14KeyPress
                  end
                  object DBEdit44: TDBEdit
                    Left = 114
                    Top = 71
                    Width = 110
                    Height = 21
                    Hint = 'Percentual de Multa Praticado pela empresa'
                    DataField = 'MULTAS'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 1
                  end
                  object DBEdit45: TDBEdit
                    Left = 114
                    Top = 96
                    Width = 110
                    Height = 21
                    Hint = 'Taxa de Juros Mensal que a empresa trabalha'
                    DataField = 'TX_JUROS'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 3
                  end
                  object DBComboBox15: TDBComboBox
                    Left = 339
                    Top = 96
                    Width = 304
                    Height = 21
                    Hint = 'Como informar juros'
                    DataField = 'TITULOCODIGOJUROS'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      '1- Valor em reais por dia'
                      '2 - Taxa mensal')
                    TabOrder = 4
                    OnKeyPress = DBComboBox15KeyPress
                  end
                  object DBComboBox7: TDBComboBox
                    Left = 114
                    Top = 121
                    Width = 57
                    Height = 21
                    DataField = 'PERMITE_PROTESTO'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 5
                    OnExit = DBComboBox7Exit
                    OnKeyPress = DBComboBox7KeyPress
                  end
                  object DBComboBox17: TDBComboBox
                    Left = 339
                    Top = 121
                    Width = 304
                    Height = 21
                    Hint = 'Como informar protesto'
                    DataField = 'TITULOCODIGOPROTESTO'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      '1 - Protestar Dias Corridos'
                      '2 - Protestar Dias '#218'teis'
                      '3 - N'#227'o Protestar'
                      '4 - Protestar Fim Falimentar - Dias '#218'teis'
                      '5 - Protestar Fim Falimentar - Dias Corridos'
                      '8 - Negativa'#231#227'o sem Protesto'
                      
                        '9 - Cancelamento Protesto Autom'#225'tivo (somente v'#225'lido p/C'#243'digo Mo' +
                        'vimento Remessa = 31)')
                    TabOrder = 6
                    OnKeyPress = DBComboBox17KeyPress
                  end
                  object DBComboBox18: TDBComboBox
                    Left = 114
                    Top = 272
                    Width = 57
                    Height = 21
                    DataField = 'QRCODE_PIX'
                    DataSource = DtmBoletos.dsCobreBem
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 13
                    Visible = False
                    OnKeyPress = DBComboBox18KeyPress
                  end
                  object DBEdit_CaminhoCertificado: TDBEdit
                    Left = 115
                    Top = 298
                    Width = 528
                    Height = 21
                    Hint = 'Endere'#231'o do arquivo do certificado.'
                    DataField = 'CAMINHO_CERT'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 14
                    OnEnter = DBEdit5Enter
                    OnExit = DBEdit5Exit
                  end
                  object DBEdit_SenhaCertificado: TDBEdit
                    Tag = 1
                    Left = 115
                    Top = 325
                    Width = 145
                    Height = 21
                    Hint = 'Senha do Certificado'
                    DataField = 'SENHA_CERT'
                    DataSource = DtmBoletos.dsCobreBem
                    PasswordChar = '*'
                    TabOrder = 15
                  end
                  object DBEdit56: TDBEdit
                    Tag = 1
                    Left = 533
                    Top = 325
                    Width = 110
                    Height = 21
                    Hint = 'Vencimento do Certificado'
                    DataField = 'DATA_VENC_CERT'
                    DataSource = DtmBoletos.dsCobreBem
                    Enabled = False
                    TabOrder = 16
                  end
                end
              end
            end
            object TabSheet8: TTabSheet
              Caption = 'Outras Configura'#231#245'es'
              ImageIndex = 2
              object ScrollBox11: TScrollBox
                Left = 0
                Top = 0
                Width = 787
                Height = 503
                Align = alClient
                TabOrder = 0
                object GroupBoxOutrasConf2: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 783
                  Height = 499
                  Align = alTop
                  Caption = 'Outros Configura'#231#245'es'
                  TabOrder = 0
                  object DBMemoOutrasConf2: TDBMemo
                    Left = 151
                    Top = 24
                    Width = 561
                    Height = 457
                    DataField = 'OUTRAS_CONFIG_BOL'
                    DataSource = DtmBoletos.dsCobreBem
                    TabOrder = 0
                  end
                end
              end
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 534
            Width = 795
            Height = 48
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object Label66: TLabel
              Left = 21
              Top = 23
              Width = 148
              Height = 13
              Caption = 'Cadastro Sequ'#234'ncial  (F2)'
              FocusControl = CheckBox2
              Font.Charset = ANSI_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = LabelSeqClick
            end
            object BitBtn7: TBitBtn
              Left = 312
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Salvar Registro  - [COB008]'
              Caption = '&OK'
              TabOrder = 1
              OnClick = BitBtn4Click
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
            object BitBtn8: TBitBtn
              Left = 393
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Cancelar Registro - [COB009]'
              Caption = '&Cancela'
              TabOrder = 2
              OnClick = BitBtn5Click
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
            object BitBtn9: TBitBtn
              Left = 604
              Top = 13
              Width = 75
              Height = 25
              Caption = '&Sair'
              TabOrder = 3
              OnClick = BitBtn2Click
              Glyph.Data = {
                2E020000424D2E020000000000002E0100002800000010000000100000000100
                08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                0202020202020202020202020202020202020204040404040404040404040402
                020202040132302E28272125242F04020202020401050F221B1614130B260402
                0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                0202020203040404040404043D383D0202020202020202020202023D353D393D
                020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                020202020202020202020202020202020202}
            end
            object CheckBox2: TCheckBox
              Left = 5
              Top = 22
              Width = 17
              Height = 15
              BiDiMode = bdLeftToRight
              Color = clBtnFace
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnClick = CheckCadSeqClick
            end
          end
        end
        object TabConfiguracoes: TTabSheet
          Caption = 'TabConfiguracoes'
          ImageIndex = 3
          object pnTipoConfiguracoes: TPanel
            Left = 3
            Top = 3
            Width = 278
            Height = 158
            TabOrder = 0
            object Panel5: TPanel
              Left = 1
              Top = 122
              Width = 276
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object pnConfiguracoesOK: TBitBtn
                Left = 58
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Salvar'
                Caption = '&OK'
                TabOrder = 0
                OnClick = pnConfiguracoesOKClick
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
              object pnConfiguracoesCanc: TBitBtn
                Left = 139
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = pnConfiguracoesCancClick
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
            end
            object RadioGroupOpcoes: TRadioGroup
              Left = 1
              Top = 1
              Width = 276
              Height = 121
              Align = alClient
              Caption = 'Configura'#231#227'o'
              ItemIndex = 0
              Items.Strings = (
                'Cobrebem'
                'Plug Boleto (TecnoSpeed)')
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Width = 1
      Height = 574
      ExplicitWidth = 1
      ExplicitHeight = 574
      inherited bMarketingHW: TBitBtn
        Top = 552
        Width = 3
        ExplicitTop = 552
        ExplicitWidth = 3
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 617
    Width = 810
    ExplicitTop = 617
    ExplicitWidth = 810
  end
  inherited pnStatusProcessamento: TPanel
    Left = 745
    Top = 522
    Height = 43
    ExplicitLeft = 745
    ExplicitTop = 522
    ExplicitHeight = 43
    inherited lbStatusProcessamento: TLabel
      ExplicitLeft = 10
      ExplicitTop = 24
    end
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 22
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 572
    Top = 9
  end
  inherited PopupMenu2: TPopupMenu
    Left = 630
    Top = 27
  end
  inherited Timer1: TTimer
    Left = 598
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 534
    Top = 3
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Configura'#231#227'o (*.conf)|*.conf'
    Left = 664
    Top = 24
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 696
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 512
    Top = 576
  end
  object popUpNew: TPopupMenu
    Left = 760
    Top = 16
    object ConvnioviaArquivodelicena1: TMenuItem
      Caption = 'Conv'#234'nio via Arquivo de licen'#231'a'
    end
    object ConvnioprausarcomaAPIdeboletos1: TMenuItem
      Caption = 'Conv'#234'nio pra usar com a API de boletos'
    end
  end
end
