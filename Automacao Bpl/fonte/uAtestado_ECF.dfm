inherited frmAtestado_ECF: TfrmAtestado_ECF
  Left = 206
  Top = 58
  Caption = 
    'Atestado de Interven'#231#227'o T'#233'cnica em Equipamento Emisso de Cupom F' +
    'iscal ( ECF )'
  ClientHeight = 509
  ClientWidth = 866
  Position = poMainFormCenter
  ExplicitWidth = 874
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 13
  object Label20: TLabel
    Left = 384
    Top = 16
    Width = 37
    Height = 13
    Caption = 'Label20'
  end
  object PageControl2: TPageControl
    Left = 0
    Top = 0
    Width = 866
    Height = 458
    ActivePage = tsMotivo
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsIndenEquip: TTabSheet
      Caption = 'Identifica'#231#227'o do Equipametno'
      ExplicitLeft = 68
      ExplicitTop = 67
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 324
        Top = 16
        Width = 93
        Height = 13
        Caption = 'Ato Homologat'#243'rio:'
      end
      object Label2: TLabel
        Left = 10
        Top = 62
        Width = 33
        Height = 13
        Caption = 'Marca:'
      end
      object Label3: TLabel
        Left = 324
        Top = 62
        Width = 38
        Height = 13
        Caption = 'Modelo:'
      end
      object Label4: TLabel
        Left = 10
        Top = 108
        Width = 120
        Height = 13
        Caption = 'N'#186' de Ordem Sequencial:'
      end
      object Label5: TLabel
        Left = 324
        Top = 108
        Width = 86
        Height = 13
        Caption = 'N'#186' de Fabrica'#231#227'o:'
      end
      object Label6: TLabel
        Left = 10
        Top = 154
        Width = 132
        Height = 13
        Caption = 'Vers'#227'o do Software B'#225'sico:'
      end
      object Label7: TLabel
        Left = 324
        Top = 154
        Width = 244
        Height = 13
        Caption = 'N'#186' do lacre do Estabelecimento do Software B'#225'sico'
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 10
        Top = 7
        Width = 294
        Height = 49
        Caption = 'Tipo de Equipamento'
        Columns = 3
        DataField = 'TIPO_ECF'
        DataSource = dtmInterventor.dsImpCNIEE
        Items.Strings = (
          'ECF - MR'
          'ECF - IF'
          'ECF - PDV')
        ParentBackground = True
        TabOrder = 0
        Values.Strings = (
          'ECF-MR'
          'ECF-IF'
          'ECF-PDV')
      end
      object DBEdit1: TDBEdit
        Left = 324
        Top = 35
        Width = 308
        Height = 21
        DataField = 'ATO_APROVACAO'
        DataSource = dtmInterventor.dsImpCNIEE
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 10
        Top = 81
        Width = 294
        Height = 21
        DataField = 'MARCA_ECF'
        DataSource = dtmInterventor.dsImpCNIEE
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 324
        Top = 81
        Width = 308
        Height = 21
        DataField = 'MODELO_ECF'
        DataSource = dtmInterventor.dsImpCNIEE
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 10
        Top = 127
        Width = 294
        Height = 21
        DataField = 'IDENTIFICACAO'
        DataSource = dtmInterventor.dsImpCNIEE
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 10
        Top = 173
        Width = 294
        Height = 21
        DataField = 'VERSAOSB'
        DataSource = dtmInterventor.dsImpCNIEE
        TabOrder = 6
      end
      object DBEdit7: TDBEdit
        Left = 324
        Top = 173
        Width = 308
        Height = 21
        DataField = 'LACRE_MFD'
        DataSource = dtmInterventor.dsAtestado
        TabOrder = 7
      end
      object MaskEdit1: TMaskEdit
        Left = 324
        Top = 127
        Width = 308
        Height = 21
        TabOrder = 5
        Text = 'MaskEdit1'
        OnEnter = MaskEdit1Enter
      end
    end
    object tsAcumulado: TTabSheet
      Caption = 'Valor Registrado ou Acumulado'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox48: TGroupBox
        Left = 3
        Top = 0
        Width = 853
        Height = 426
        Caption = 'Valor Registrado ou Acumulado'
        TabOrder = 0
        object StringGrid1: TStringGrid
          Left = 0
          Top = 15
          Width = 427
          Height = 407
          BevelInner = bvNone
          BevelOuter = bvNone
          ColCount = 3
          DefaultColWidth = 140
          DefaultRowHeight = 18
          RowCount = 21
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
          ScrollBars = ssNone
          TabOrder = 0
        end
        object StringGrid2: TStringGrid
          Left = 423
          Top = 15
          Width = 427
          Height = 407
          BevelInner = bvNone
          BevelOuter = bvNone
          ColCount = 3
          DefaultColWidth = 140
          DefaultRowHeight = 18
          RowCount = 21
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
          ScrollBars = ssNone
          TabOrder = 1
          RowHeights = (
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18)
        end
        object edTot1: TMaskEdit
          Left = 524
          Top = 226
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 2
          Text = '  ,  '
        end
        object edTot2: TMaskEdit
          Left = 524
          Top = 245
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 3
          Text = '  ,  '
        end
        object edTot3: TMaskEdit
          Left = 524
          Top = 264
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 4
          Text = '  ,  '
        end
        object edTot4: TMaskEdit
          Left = 524
          Top = 283
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 5
          Text = '  ,  '
        end
        object edTot5: TMaskEdit
          Left = 524
          Top = 302
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 6
          Text = '  ,  '
        end
        object edTot6: TMaskEdit
          Left = 524
          Top = 321
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 7
          Text = '  ,  '
        end
        object edTot7: TMaskEdit
          Left = 524
          Top = 340
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 8
          Text = '  ,  '
        end
        object edTot8: TMaskEdit
          Left = 524
          Top = 359
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 9
          Text = '  ,  '
        end
        object edTot9: TMaskEdit
          Left = 524
          Top = 378
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 10
          Text = '  ,  '
        end
        object edTot10: TMaskEdit
          Left = 524
          Top = 397
          Width = 40
          Height = 18
          BevelOuter = bvNone
          BevelKind = bkTile
          BorderStyle = bsNone
          CharCase = ecUpperCase
          EditMask = '!00,00;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 11
          Text = '  ,  '
        end
      end
    end
    object tsIntervAutalAnterior: TTabSheet
      Caption = 'Lacre / Dados Interven'#231#227'o Atual e Imediatamente Anterior'
      ImageIndex = 3
      ExplicitLeft = -628
      ExplicitTop = -165
      ExplicitWidth = 824
      ExplicitHeight = 0
      object Label8: TLabel
        Left = 600
        Top = 342
        Width = 74
        Height = 13
        Caption = 'N'#186' do Atestado'
      end
      object Label9: TLabel
        Left = 121
        Top = 342
        Width = 196
        Height = 13
        Caption = 'Interven'#231#227'o anterior - Nome da Empresa'
      end
      object Label10: TLabel
        Left = 616
        Top = 248
        Width = 79
        Height = 13
        Caption = 'Data de T'#233'rmino'
      end
      object Label11: TLabel
        Left = 488
        Top = 248
        Width = 66
        Height = 13
        Caption = 'Data de In'#237'cio'
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 121
        Top = 239
        Width = 352
        Height = 49
        Caption = 'Local da Interven'#231#227'o T'#233'cnica'
        Columns = 2
        DataField = 'LOCALINTERVENCAO'
        DataSource = dtmInterventor.dsAtestado
        Items.Strings = (
          'Estabelecimento Usu'#225'rio'
          'Estabelecimento Interventor')
        ParentBackground = True
        TabOrder = 0
        Values.Strings = (
          'U'
          'I')
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 121
        Top = 294
        Width = 352
        Height = 42
        Caption = 'Houve perda de dados gravados na mem'#243'ria de Trabalho (MT) ?'
        Columns = 2
        DataField = 'PERDADADOS_MT'
        DataSource = dtmInterventor.dsAtestado
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentBackground = True
        TabOrder = 3
        Values.Strings = (
          'S'
          'N')
      end
      object DBEdit8: TDBEdit
        Left = 488
        Top = 267
        Width = 121
        Height = 21
        DataField = 'DATAINICIO'
        DataSource = dtmInterventor.dsAtestado
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 616
        Top = 267
        Width = 121
        Height = 21
        DataField = 'DATAFINAL'
        DataSource = dtmInterventor.dsAtestado
        TabOrder = 2
      end
      object DBEdit10: TDBEdit
        Left = 121
        Top = 361
        Width = 440
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMPRESA_INTER_ANT'
        DataSource = dtmInterventor.dsAtestado
        TabOrder = 4
      end
      object DBEdit11: TDBEdit
        Left = 600
        Top = 361
        Width = 137
        Height = 21
        DataField = 'NUM_ATEST_INTER_ANT'
        DataSource = dtmInterventor.dsAtestado
        TabOrder = 5
      end
      object GroupBox47: TGroupBox
        Left = 64
        Top = 71
        Width = 729
        Height = 140
        Caption = 'Lacre'
        TabOrder = 6
        object StringGrid3: TStringGrid
          Left = 11
          Top = 17
          Width = 711
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvNone
          ColCount = 2
          DefaultColWidth = 405
          DefaultRowHeight = 18
          RowCount = 2
          ScrollBars = ssNone
          TabOrder = 0
        end
        object StringGrid4: TStringGrid
          Left = 11
          Top = 35
          Width = 711
          Height = 42
          BevelInner = bvNone
          BevelOuter = bvNone
          ColCount = 7
          DefaultColWidth = 100
          DefaultRowHeight = 18
          RowCount = 2
          FixedRows = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
          ScrollBars = ssNone
          TabOrder = 1
        end
        object StringGrid5: TStringGrid
          Left = 11
          Top = 74
          Width = 711
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvNone
          ColCount = 1
          DefaultColWidth = 707
          DefaultRowHeight = 18
          FixedCols = 0
          RowCount = 2
          ScrollBars = ssNone
          TabOrder = 2
        end
        object StringGrid6: TStringGrid
          Left = 11
          Top = 93
          Width = 711
          Height = 42
          BevelInner = bvNone
          BevelOuter = bvNone
          ColCount = 7
          DefaultColWidth = 100
          DefaultRowHeight = 18
          RowCount = 2
          FixedRows = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
          ScrollBars = ssNone
          TabOrder = 3
        end
        object Panel1: TPanel
          Left = 166
          Top = 20
          Width = 185
          Height = 13
          BevelOuter = bvNone
          Caption = 'Retirado'
          TabOrder = 4
        end
        object Panel2: TPanel
          Left = 478
          Top = 20
          Width = 185
          Height = 13
          BevelOuter = bvNone
          Caption = 'Aplicado no Final da Interven'#231#227'o'
          TabOrder = 5
        end
        object Panel3: TPanel
          Left = 318
          Top = 77
          Width = 185
          Height = 13
          BevelOuter = bvNone
          Caption = 'Utilizados Durante a Interven'#231#227'o'
          TabOrder = 6
        end
      end
      object DBRadioGroup5: TDBRadioGroup
        Left = 479
        Top = 294
        Width = 258
        Height = 42
        Caption = 'Tipo de Dispositivo'
        Columns = 2
        DataField = 'TIPO_DISPOSITIVO'
        DataSource = dtmInterventor.dsAtestado
        Items.Strings = (
          'Lacre'
          'Etiqueta')
        ParentBackground = True
        TabOrder = 7
        Values.Strings = (
          'L'
          'E')
      end
    end
    object tsMotivo: TTabSheet
      Caption = 'Motivo da Interven'#231#227'o/Servi'#231'os'
      ImageIndex = 4
      object Label13: TLabel
        Left = 28
        Top = 373
        Width = 170
        Height = 13
        Caption = 'N'#186' da NF do fornecimento de Pe'#231'as'
      end
      object Label12: TLabel
        Left = 405
        Top = 373
        Width = 167
        Height = 13
        Caption = 'N'#186' da NF da Presta'#231#227'o de Servi'#231'os'
      end
      object DBRadioGroup4: TDBRadioGroup
        Left = 26
        Top = 3
        Width = 157
        Height = 115
        Caption = 'Motivo Interven'#231#227'o'
        DataField = 'MOTIVO_INTERVENCAO'
        DataSource = dtmInterventor.dsAtestado
        Items.Strings = (
          'Lacra'#231#227'o Inicial'
          'Cessa'#231#227'o de Uso'
          'Manuten'#231#227'o e concertos'
          'Troca de Lacre')
        ParentBackground = True
        TabOrder = 0
        Values.Strings = (
          'L'
          'C'
          'M'
          'T')
      end
      object GroupBox51: TGroupBox
        Left = 26
        Top = 124
        Width = 805
        Height = 154
        Caption = 
          'Rela'#231#227'o de Servi'#231'os (De acordo com os c'#243'digos pela DICAC/SAIF/SR' +
          'E) - [ Pressione Enter ou Clique 2 vezes para assumir ]'
        TabOrder = 4
        object ListBox1: TListBox
          Left = 2
          Top = 15
          Width = 801
          Height = 137
          Align = alClient
          ItemHeight = 13
          Items.Strings = (
            '101 Substitui'#231#227'o da Placa Controladora Fiscal'
            '102 Reparo no circuito impresso da Placa Controladora Fiscal'
            '103 Substitui'#231#227'o da Bateria da Placa Controladora Fiscal'
            '104 Substitui'#231#227'o do Dispositivo de Mem'#243'ria do Software B'#225'sico'
            '105 Substitui'#231#227'o do Dispositivo da Mem'#243'ria de Trabalho'
            '106 Substitui'#231#227'o do Dispositivo de Mem'#243'ria do Relogio'
            '107 Substitui'#231#227'o do Processador da Placa Controladora Fiscal'
            
              '108 Substitui'#231#227'o de outro componente da Placa Controladora Fisca' +
              'l n'#227'o relacionado'
            '201 Instala'#231#227'o de Dispositivo Adicional de Mem'#243'ria Fiscal'
            
              '202 Instala'#231#227'o de Dispositivo Adicional de Mem'#243'ria de Fita Detal' +
              'he'
            '301 Substitui'#231#227'o da Placa Controladora do Mecanismo Impressor'
            
              '302 Reparo no circuito impresso da Placa Controladora do Mecanis' +
              'mo Impressor'
            
              '303 Substitui'#231#227'o de componente da Placa Controladora do Mecanism' +
              'o Impressor'
            '304 Substitui'#231#227'o da Placa de Comunica'#231#227'o do Mecanismo Impressor'
            
              '305 Reparo no circuito impresso da Placa de Comunica'#231#227'o do Mecan' +
              'ismo Impressor'
            
              '306 Substitui'#231#227'o de componente da Placa de Comunica'#231#227'o do Mecani' +
              'smo Impressor'
            '307 Substitui'#231#227'o do Mecanismo Impressor'
            '308 Reparo no Mecanismo Impressor'
            '309 Limpeza do Mecanismo Impressor'
            '401 Substitui'#231#227'o da Fonte de Alimenta'#231#227'o'
            '402 Reparo no circuito impresso da Fonte de Alimenta'#231#227'o'
            '403 Substitui'#231#227'o de componente da Fonte de Alimenta'#231#227'o'
            
              '501 Substitui'#231#227'o de conector da porta de comunica'#231#227'o com PC (ger' +
              'al)'
            '502 Reparo no conector da porta de comunica'#231#227'o com PC (geral)'
            
              '503 Substitui'#231#227'o de conector da porta de comunica'#231#227'o com PC (de ' +
              'uso exclusivo do fisco)'
            
              '504 Reparo no conector da porta de comunica'#231#227'o com PC (de uso ex' +
              'clusivo do fisco)'
            '505 Substitui'#231#227'o de conector da gaveta'
            '506 Reparo no conector da gaveta'
            '507 Substitui'#231#227'o de conector da balan'#231'a'
            '508 Reparo no conector da balan'#231'a'
            '509 Substitui'#231#227'o de conector do leitor '#243'ptico'
            '510 Reparo no conector do leitor '#243'ptico'
            '511 Substitui'#231#227'o de outro conector externo n'#227'o relacionado'
            '512 Reparo em outro conector externo n'#227'o relacionado'
            '513 Substitui'#231#227'o de fios ou cabos internos'
            '514 Reparo em fios ou cabos internos'
            '601 Substitui'#231#227'o de bot'#245'es de acionamento'
            '602 Reparo em bot'#245'es de acionamento'
            '603 Substitui'#231#227'o do teclado de ECF-MR ou ECF-PDV'
            '604 Reparo no teclado de ECF-MR ou ECF-PDV'
            '701 Substitui'#231#227'o do display de ECF-MR ou ECF-PDV'
            '702 Reparo no display de ECF-MR ou ECF-PDV'
            '801 Substitui'#231#227'o do Leitor CMC-7'
            '802 Reparo no Leitor CMC-7'
            '901 Configura'#231#227'o do rel'#243'gio'
            '902 Programa'#231#227'o de dados do usu'#225'rio'
            '903 Programa'#231#227'o de par'#226'metros de funcionamento'
            
              '904 Outros servi'#231'os n'#227'o relacionados sem substitui'#231#227'o ou reparo ' +
              'de partes, pe'#231'as e componentes'
            
              '905 Outros servi'#231'os n'#227'o relacionados com substitui'#231#227'o de partes,' +
              ' pe'#231'as e componentes'
            
              '906 Outros servi'#231'os n'#227'o relacionados com reparo de partes, pe'#231'as' +
              ' e componentes'
            
              '907 N'#227'o realiza'#231#227'o de servi'#231'o por falta de aprova'#231#227'o de or'#231'ament' +
              'o')
          TabOrder = 0
          OnDblClick = ListBox1DblClick
        end
      end
      object GroupBox52: TGroupBox
        Left = 26
        Top = 284
        Width = 805
        Height = 83
        Caption = 
          'Rela'#231#227'o de Servi'#231'os Executados - [ Pressione Delete para remover' +
          ' ]'
        TabOrder = 5
        object ListBox2: TListBox
          Left = 2
          Top = 15
          Width = 801
          Height = 66
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          OnKeyDown = ListBox2KeyDown
        end
      end
      object GroupBox1: TGroupBox
        Left = 189
        Top = 44
        Width = 210
        Height = 74
        Caption = 'Vers'#227'o do Software B'#225'sico'
        TabOrder = 1
        object Label14: TLabel
          Left = 12
          Top = 18
          Width = 39
          Height = 13
          Caption = 'Anterior'
        end
        object Label15: TLabel
          Left = 108
          Top = 18
          Width = 25
          Height = 13
          Caption = 'Atual'
        end
        object DBEdit14: TDBEdit
          Left = 12
          Top = 37
          Width = 90
          Height = 21
          DataField = 'VERSAO_SB_ANT'
          DataSource = dtmInterventor.dsAtestado
          TabOrder = 0
        end
        object DBEdit15: TDBEdit
          Left = 108
          Top = 37
          Width = 90
          Height = 21
          DataField = 'VERSAO_SB_ATUAL'
          DataSource = dtmInterventor.dsAtestado
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 405
        Top = 44
        Width = 210
        Height = 74
        Caption = 'N'#186' Dispositivo do SB '
        TabOrder = 2
        object Label16: TLabel
          Left = 12
          Top = 18
          Width = 41
          Height = 13
          Caption = 'Retirado'
        end
        object Label17: TLabel
          Left = 108
          Top = 18
          Width = 45
          Height = 13
          Caption = 'Instalado'
        end
        object DBEdit16: TDBEdit
          Left = 12
          Top = 37
          Width = 90
          Height = 21
          DataField = 'NUM_DISP_SB_ANT'
          DataSource = dtmInterventor.dsAtestado
          TabOrder = 0
        end
        object DBEdit17: TDBEdit
          Left = 108
          Top = 37
          Width = 90
          Height = 21
          DataField = 'NUM_DISP_SB_ATUAL'
          DataSource = dtmInterventor.dsAtestado
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 621
        Top = 44
        Width = 210
        Height = 74
        Caption = 'N'#186' Lacre do Dispositivo do SB'
        TabOrder = 3
        object Label18: TLabel
          Left = 12
          Top = 18
          Width = 41
          Height = 13
          Caption = 'Retirado'
        end
        object Label19: TLabel
          Left = 108
          Top = 18
          Width = 44
          Height = 13
          Caption = 'Colocado'
        end
        object DBEdit18: TDBEdit
          Left = 12
          Top = 37
          Width = 90
          Height = 21
          DataField = 'NUM_LACRE_SB_RET'
          DataSource = dtmInterventor.dsAtestado
          TabOrder = 0
        end
        object DBEdit19: TDBEdit
          Left = 108
          Top = 37
          Width = 90
          Height = 21
          DataField = 'NUM_LACRE_SB_COLOCADO'
          DataSource = dtmInterventor.dsAtestado
          TabOrder = 1
        end
      end
      object DBEdit12: TDBEdit
        Left = 26
        Top = 392
        Width = 245
        Height = 21
        DataField = 'N_NF_PROD'
        DataSource = dtmInterventor.dsAtestado
        TabOrder = 6
      end
      object DBEdit13: TDBEdit
        Left = 405
        Top = 392
        Width = 245
        Height = 21
        DataField = 'N_NF_SERV'
        DataSource = dtmInterventor.dsAtestado
        TabOrder = 7
      end
      object DBRadioGroup6: TDBRadioGroup
        Left = 189
        Top = 3
        Width = 642
        Height = 35
        Caption = 'Houve substitui'#231#227'o do Software B'#225'sico (Informe os dados abaixo)'
        Columns = 2
        DataField = 'SUBSTITUICAO_SB'
        DataSource = dtmInterventor.dsAtestado
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentBackground = True
        TabOrder = 8
        Values.Strings = (
          'S'
          'N')
        OnClick = DBRadioGroup6Click
        OnExit = DBRadioGroup6Exit
      end
    end
  end
  object Panel44: TPanel
    Left = 0
    Top = 458
    Width = 866
    Height = 51
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn49: TBitBtn
      Left = 353
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Salva'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn49Click
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
    object BitBtn68: TBitBtn
      Left = 764
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn68Click
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
    object BitBtn1: TBitBtn
      Left = 434
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Limpar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
        8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
        0404040404040404040404040404040404040404040404040404040404040404
        0404040404040404040404010000000000000104040404040404040002020202
        0202000004040404040404000202020202020001000404040404040100020202
        0202000101000404040404040003030303030300010100040404040404000303
        0303030300010100040404040404000303030303030001010004040404040400
        0303030303030001000404040404040400030303030303000004040404040404
        0400030303030303000404040404040404040100000000010104040404040404
        0404040404040404040404040404040404040404040404040404}
    end
  end
end
