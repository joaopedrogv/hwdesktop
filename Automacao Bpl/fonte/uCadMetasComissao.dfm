inherited frmCadMetasComissao: TfrmCadMetasComissao
  Caption = 'Perfis de Comiss'#227'o'
  ClientHeight = 594
  Scaled = False
  ExplicitWidth = 806
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 575
    ExplicitHeight = 575
    inherited Splitter2: TSplitter
      Width = 1
      Height = 573
      ExplicitLeft = 964
      ExplicitTop = 1
      ExplicitWidth = 1
      ExplicitHeight = 573
    end
    inherited PanelLeft: TPanel
      Left = 2
      Width = 795
      Height = 573
      ExplicitLeft = 2
      ExplicitWidth = 795
      ExplicitHeight = 573
      inherited PageControl1: TPageControl
        Width = 793
        Height = 571
        ExplicitWidth = 793
        ExplicitHeight = 571
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 785
          ExplicitHeight = 540
          inherited ScrollBox1: TScrollBox
            Width = 785
            Height = 540
            ExplicitWidth = 785
            ExplicitHeight = 540
            inherited PageControl3: TPageControl
              Width = 785
              Height = 492
              ActivePage = tsCadastro
              ExplicitWidth = 785
              ExplicitHeight = 492
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 777
                ExplicitHeight = 461
                inherited ScrollBox3: TScrollBox
                  Width = 777
                  Height = 461
                  ExplicitWidth = 777
                  ExplicitHeight = 461
                  inherited GroupBox1: TGroupBox
                    Width = 773
                    ExplicitWidth = 773
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Label6: TLabel
                  Left = 64
                  Top = 14
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'C'#243'digo'
                  FocusControl = DBEdit1
                end
                object Label7: TLabel
                  Left = 628
                  Top = 14
                  Width = 50
                  Height = 13
                  Caption = 'Data Perifl'
                  FocusControl = DBEdit2
                end
                object Label8: TLabel
                  Left = 73
                  Top = 43
                  Width = 24
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Perfil'
                  FocusControl = DBEdit3
                end
                object Label9: TLabel
                  Left = 401
                  Top = 43
                  Width = 66
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Agrupado por'
                end
                object Label10: TLabel
                  Left = 33
                  Top = 68
                  Width = 64
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Comiss'#227'o por'
                end
                object Label11: TLabel
                  Left = 427
                  Top = 95
                  Width = 40
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Em Cima'
                end
                object Label12: TLabel
                  Left = 77
                  Top = 95
                  Width = 20
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo'
                end
                object Label13: TLabel
                  Left = 60
                  Top = 121
                  Width = 37
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Sele'#231#227'o'
                end
                object Label14: TLabel
                  Left = 414
                  Top = 319
                  Width = 50
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Controles:'
                  Enabled = False
                  FocusControl = DBMemo1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object Label15: TLabel
                  Left = 416
                  Top = 68
                  Width = 51
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Perc. Peso'
                  FocusControl = DBEdit9
                end
                object Label16: TLabel
                  Left = 48
                  Top = 319
                  Width = 41
                  Height = 13
                  Caption = 'Tabelas:'
                  Enabled = False
                  FocusControl = DBMemo2
                  Visible = False
                end
                object Label17: TLabel
                  Left = 577
                  Top = 68
                  Width = 131
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Perc Lanc. D'#233'bito e Credito'
                  FocusControl = DBEdit4
                end
                object Label18: TLabel
                  Left = 427
                  Top = 144
                  Width = 37
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tabelas'
                  FocusControl = grid_tipovendas
                end
                object btConteudoSelectAll: TSpeedButton
                  Left = 74
                  Top = 163
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btConteudoSelectAllClick
                end
                object btConteudoUnSelectAll: TSpeedButton
                  Left = 74
                  Top = 190
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btConteudoSelectAllClick
                end
                object btTabelasSelectAll: TSpeedButton
                  Left = 441
                  Top = 163
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btTabelasSelectAllClick
                end
                object btTabelasUnSelectAll: TSpeedButton
                  Left = 441
                  Top = 190
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btTabelasSelectAllClick
                end
                object SpeedButton9: TSpeedButton
                  Left = 418
                  Top = 10
                  Width = 23
                  Height = 22
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000330B0000330B00000001000000010000840000006B18
                    00008C21000084291000B54A10008C3921009C422100734A290094633900B563
                    390094634200CE734200CEAD8C00E7C6AD00FFDEB500FFE7CE00FFEFD600FFEF
                    E700FFF7EF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00131313131313
                    1313131313131313131313131313080713131313131313131313131313131007
                    0713131313131313131313131313110C0707131313131313131313131313110F
                    0C070707070713131313131308070F10100E0E0F0C080707131313080D0D0F10
                    0A0504090F0E0C070713080D0F11101010050210100F0E0C07070D0F11101010
                    1005021010100F0E0C07121111101010030502101010100F0F07121211111010
                    0A0301101010100F0F070F12121111101010101010100F120C08130F12121111
                    11060B10100F120C081313130F141212120000100F100C081313131313130F12
                    1210100E0C081313131313131313131313131313131313131313}
                  OnClick = SpeedButton9Click
                end
                object DBEdit1: TDBEdit
                  Left = 103
                  Top = 11
                  Width = 74
                  Height = 21
                  DataField = 'CODIGO_PERFIL'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  Enabled = False
                  TabOrder = 2
                end
                object DBEdit2: TDBEdit
                  Left = 103
                  Top = 38
                  Width = 290
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'NOME_PERFIL'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  TabOrder = 4
                end
                object DBEdit3: TDBEdit
                  Left = 688
                  Top = 11
                  Width = 72
                  Height = 21
                  DataField = 'DATA_CADASTRO'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  Enabled = False
                  TabOrder = 3
                end
                object DBMemo1: TDBMemo
                  Left = 470
                  Top = 375
                  Width = 290
                  Height = 72
                  DataField = 'CONTEUDO_FLAG'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  Enabled = False
                  TabOrder = 1
                  Visible = False
                end
                object DBEdit9: TDBEdit
                  Left = 474
                  Top = 65
                  Width = 72
                  Height = 21
                  DataField = 'PERC_PESO'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  TabOrder = 7
                end
                object DBComboBox1: TDBComboBox
                  Left = 103
                  Top = 65
                  Width = 290
                  Height = 21
                  Style = csDropDownList
                  DataField = 'ABRANG_PERFIL'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  ItemHeight = 0
                  Items.Strings = (
                    'PESO'
                    'INDIVIDUAL')
                  TabOrder = 6
                  OnExit = DBComboBox1Exit
                end
                object DBComboBox3: TDBComboBox
                  Left = 103
                  Top = 118
                  Width = 290
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FLAG_SERV_PROD'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  ItemHeight = 0
                  Items.Strings = (
                    'Tipo Servi'#231'o'
                    'Tipo de Segmenta'#231#227'o'
                    'Grupo Produto'
                    'Controle Caixa')
                  TabOrder = 11
                  OnChange = DBComboBox3Change
                  OnExit = DBComboBox3Exit
                end
                object DBComboBox5: TDBComboBox
                  Left = 473
                  Top = 92
                  Width = 290
                  Height = 21
                  Style = csDropDownList
                  DataField = 'EM_CIMA_PERFIL'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  ItemHeight = 0
                  Items.Strings = (
                    'Valor Geral'
                    'Lucro Bruto')
                  TabOrder = 10
                  OnExit = DBComboBox5Exit
                end
                object DBMemo2: TDBMemo
                  Left = 95
                  Top = 368
                  Width = 290
                  Height = 72
                  DataField = 'TABELAS_PERFIL'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  Enabled = False
                  TabOrder = 0
                  Visible = False
                end
                object DBComboBox2: TDBComboBox
                  Left = 103
                  Top = 91
                  Width = 290
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TIPO_SERV_PROD'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  ItemHeight = 0
                  Items.Strings = (
                    'Servico'
                    'Produto'
                    'Ambos')
                  TabOrder = 9
                  OnExit = DBComboBox2Exit
                end
                object BitBtn7: TBitBtn
                  Left = 95
                  Top = 339
                  Width = 75
                  Height = 25
                  Hint = 'Incluir'
                  Caption = '&Incluir'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 16
                  Visible = False
                  OnClick = BitBtn7Click
                  Glyph.Data = {
                    E6040000424DE604000000000000360000002800000014000000140000000100
                    180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF3F7F6ECF0F6EDF1F7EEF3FFFC
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFE2EEE243AD5D2CAC542FAF592EA74EABD5B1FFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFC5E5C80FB95316D27915D67D11C3617CCE8EFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFC5E8CC4EDD926CF6C16BF6BE5CECAB91DBA4FFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8
                    EACE01E17900F39500F29400EB837ADC9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8EACE02DA
                    7100EC8900EB8800E4787BDA9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2EBD604D46902E57F
                    05E58000DD6F82D99EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFC2D8C491BD9896C09E96C09F96C19F9BC1A374B9851FD46E32E48A33E28922
                    DF7C4FBB6F9ABEA096C19F96C19F96C19E93BE9BA1C5A5F1F5F1FFFFFF3FB360
                    009F2B00AA3E00AF4300B14600B04500B4472CD7774CE18C47DF893DDD8200BC
                    5300AF4400B24700B04500AD4000A638009F2EC8E5CAFFFFFF57C17339C9743F
                    D2823ED6873ED98A3DDA8C39D8864ADA8453DC884FDB864FDA843FD98837D988
                    37D88636D58335D17D36CC781CB84FC1E4C5FFFFFF6AC37576D3827ED78D7BD9
                    8F79DA9178DC9371DC9161DA885DD9875BD9865AD98468DA8B68D98866D68363
                    D37E61D07760CF723CBB4BBFE3C3FFFFFF5BBC6668CB7276D28473D38471D487
                    6FD68871D88C6ED98B68D78766D78666D68669D78762D37E60D0795ECD755CCA
                    6E5CC96A30B33DBFE2C2FFFFFFB2DEB78FD09699D5A198D5A198D5A29AD5A57A
                    C88A52C76D77D88D74D68A62D07B64C27798D5A297D5A196D59F96D49E93D39A
                    8FD295ECF7EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4E1C94ABD
                    5F82D78F80D58E5FCA7188C993FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1E0C753BC608CD793
                    8AD5916ACA738BC894FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0DFC559BA6097D89894D69673
                    C9768CC693FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEDDC360BC65A6DDA4A3DCA281CD818BC5
                    92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFC6E0CB5CB66495D39793D29774C37994C89CFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFF6FAF7BEDEC4B9DDC0BBDEC1B7DBBDE4F1E7FFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF}
                end
                object BitBtn8: TBitBtn
                  Left = 176
                  Top = 339
                  Width = 75
                  Height = 25
                  Hint = 'Excluir'
                  Caption = '&Excluir'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 17
                  Visible = False
                  OnClick = BitBtn8Click
                  Glyph.Data = {
                    E6040000424DE604000000000000360000002800000014000000140000000100
                    180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFBFAF3F3F2E9F4F3EAF4F2EAF4F2EAF4F2EAF4F2EAF4F2EAF4F2EA
                    F4F2EAF4F2EAF4F2EAF4F2EAF4F2EAF4F2EAF4F2EAF3F2EAF7F6EDFFFFFEFFFF
                    FB6063BF282DB42D38B82D3ABB2D3CBC2D3DBE2D3EBF2D3FC02D3FC02D40C02D
                    40C02D3EC02D3DBF2D3CBE2D3BBD2D39BB2A33B8383DB6D5D5E9FCF9F62135CB
                    021DD3052AD6052DD80530DA0533DB0534DD0536DE0537DE0537DE0537DE0536
                    DD0534DD0532DB052FDA052CD70527D60016CBB3B5E5F9F4F5385ADA3665EA41
                    71ED4074EF4077F1407AF3407CF4407DF6407EF6407EF6407DF5407BF54079F2
                    4076F04073EE406FEB426DEA284CDCB4B9E9F8F3F53E5DDC3262EA386BED3870
                    F03874F33877F53879F6387AF7387BF8387BF8387AF63877F53875F33872F138
                    6DEE3869EB3A65E81E44DBB1B8E9F7F4F8445DDA617CE96986EB6889ED688BEF
                    688DF1688FF26890F36890F36890F2688FF2688EF1688CF0688AEE6887EC6884
                    EA6C84E83F59DCB2BBEBFEFEFEA1ACEC92A1EC9AACF099AEF199B0F299B2F399
                    B4F599B5F699B6F699B6F699B5F699B5F699B4F599B2F499B0F299AEF198AAEF
                    96A5ECE8EBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF}
                end
                object BitBtn9: TBitBtn
                  Left = 470
                  Top = 344
                  Width = 75
                  Height = 25
                  Hint = 'Incluir'
                  Caption = '&Incluir'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 18
                  Visible = False
                  OnClick = BitBtn9Click
                  Glyph.Data = {
                    E6040000424DE604000000000000360000002800000014000000140000000100
                    180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF3F7F6ECF0F6EDF1F7EEF3FFFC
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFE2EEE243AD5D2CAC542FAF592EA74EABD5B1FFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFC5E5C80FB95316D27915D67D11C3617CCE8EFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFC5E8CC4EDD926CF6C16BF6BE5CECAB91DBA4FFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8
                    EACE01E17900F39500F29400EB837ADC9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8EACE02DA
                    7100EC8900EB8800E4787BDA9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2EBD604D46902E57F
                    05E58000DD6F82D99EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFC2D8C491BD9896C09E96C09F96C19F9BC1A374B9851FD46E32E48A33E28922
                    DF7C4FBB6F9ABEA096C19F96C19F96C19E93BE9BA1C5A5F1F5F1FFFFFF3FB360
                    009F2B00AA3E00AF4300B14600B04500B4472CD7774CE18C47DF893DDD8200BC
                    5300AF4400B24700B04500AD4000A638009F2EC8E5CAFFFFFF57C17339C9743F
                    D2823ED6873ED98A3DDA8C39D8864ADA8453DC884FDB864FDA843FD98837D988
                    37D88636D58335D17D36CC781CB84FC1E4C5FFFFFF6AC37576D3827ED78D7BD9
                    8F79DA9178DC9371DC9161DA885DD9875BD9865AD98468DA8B68D98866D68363
                    D37E61D07760CF723CBB4BBFE3C3FFFFFF5BBC6668CB7276D28473D38471D487
                    6FD68871D88C6ED98B68D78766D78666D68669D78762D37E60D0795ECD755CCA
                    6E5CC96A30B33DBFE2C2FFFFFFB2DEB78FD09699D5A198D5A198D5A29AD5A57A
                    C88A52C76D77D88D74D68A62D07B64C27798D5A297D5A196D59F96D49E93D39A
                    8FD295ECF7EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4E1C94ABD
                    5F82D78F80D58E5FCA7188C993FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1E0C753BC608CD793
                    8AD5916ACA738BC894FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0DFC559BA6097D89894D69673
                    C9768CC693FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEDDC360BC65A6DDA4A3DCA281CD818BC5
                    92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFC6E0CB5CB66495D39793D29774C37994C89CFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFF6FAF7BEDEC4B9DDC0BBDEC1B7DBBDE4F1E7FFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF}
                end
                object BitBtn10: TBitBtn
                  Left = 551
                  Top = 348
                  Width = 75
                  Height = 25
                  Hint = 'Excluir'
                  Caption = '&Excluir'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 19
                  Visible = False
                  OnClick = BitBtn10Click
                  Glyph.Data = {
                    E6040000424DE604000000000000360000002800000014000000140000000100
                    180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFBFAF3F3F2E9F4F3EAF4F2EAF4F2EAF4F2EAF4F2EAF4F2EAF4F2EA
                    F4F2EAF4F2EAF4F2EAF4F2EAF4F2EAF4F2EAF4F2EAF3F2EAF7F6EDFFFFFEFFFF
                    FB6063BF282DB42D38B82D3ABB2D3CBC2D3DBE2D3EBF2D3FC02D3FC02D40C02D
                    40C02D3EC02D3DBF2D3CBE2D3BBD2D39BB2A33B8383DB6D5D5E9FCF9F62135CB
                    021DD3052AD6052DD80530DA0533DB0534DD0536DE0537DE0537DE0537DE0536
                    DD0534DD0532DB052FDA052CD70527D60016CBB3B5E5F9F4F5385ADA3665EA41
                    71ED4074EF4077F1407AF3407CF4407DF6407EF6407EF6407DF5407BF54079F2
                    4076F04073EE406FEB426DEA284CDCB4B9E9F8F3F53E5DDC3262EA386BED3870
                    F03874F33877F53879F6387AF7387BF8387BF8387AF63877F53875F33872F138
                    6DEE3869EB3A65E81E44DBB1B8E9F7F4F8445DDA617CE96986EB6889ED688BEF
                    688DF1688FF26890F36890F36890F2688FF2688EF1688CF0688AEE6887EC6884
                    EA6C84E83F59DCB2BBEBFEFEFEA1ACEC92A1EC9AACF099AEF199B0F299B2F399
                    B4F599B5F699B6F699B6F699B5F699B5F699B4F599B2F499B0F299AEF198AAEF
                    96A5ECE8EBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF}
                end
                object DBLookupComboBox1: TDBLookupComboBox
                  Left = 470
                  Top = 316
                  Width = 290
                  Height = 21
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMenuText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ListSource = DtmCadBasicos.dsTipoComissaoCons
                  ParentFont = False
                  TabOrder = 15
                  Visible = False
                end
                object DBComboBox4: TDBComboBox
                  Left = 473
                  Top = 38
                  Width = 290
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TIPO_PERFIL'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  ItemHeight = 0
                  Items.Strings = (
                    'Venda Geral'
                    'Produto'
                    'Presta'#231#227'o Recebida'
                    'Mod.Recebimento')
                  TabOrder = 5
                  OnExit = DBComboBox4Exit
                end
                object DBLookupComboBox2: TDBLookupComboBox
                  Left = 95
                  Top = 312
                  Width = 290
                  Height = 21
                  Enabled = False
                  KeyField = 'COD_TIPO'
                  ListField = 'DESCRICAO'
                  ListSource = DtmCadBasicos.dsTipoVendasCons
                  TabOrder = 14
                  Visible = False
                end
                object DBEdit4: TDBEdit
                  Left = 714
                  Top = 65
                  Width = 49
                  Height = 21
                  Hint = 
                    'Percentual para lan'#231'ar cr'#233'ditos na conta do colaborador em caso ' +
                    'de bonifica'#231#227'o por metas alcan'#231'adas '
                  DataField = 'PERC_LANCDEBCRED'
                  DataSource = DtmCadBasicos.dsPerfilComissao
                  TabOrder = 8
                end
                object grid_conteudo: TDBGrid
                  Left = 103
                  Top = 145
                  Width = 290
                  Height = 264
                  Hint = 'Duplo clique para selecionar o Conte'#250'do'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = #39
                  Font.Style = []
                  Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  TabOrder = 12
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = grid_conteudoDrawColumnCell
                  OnDblClick = grid_conteudoDblClick
                end
                object grid_tipovendas: TDBGrid
                  Left = 470
                  Top = 144
                  Width = 290
                  Height = 264
                  Hint = 'Duplo clique para selecionar o Conteudo'
                  Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 13
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = grid_conteudoDrawColumnCell
                  OnDblClick = grid_tipovendasDblClick
                end
                object Memo1: TMemo
                  Left = 117
                  Top = 159
                  Width = 657
                  Height = 313
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Lucida Console'
                  Font.Style = []
                  Lines.Strings = (
                    
                      'Agrupado por (TIPO_PERFIL   ) : Venda Geral | Presta'#231#227'o Recebida' +
                      ' | Produto |'
                    '                                Mod.Recebimento'
                    'Comiss'#227'o Por (ABRANG_PERFIL ) : INDIVIDUAL | PESO'
                    
                      'Tipo         (TIPO_SERV_PROD) : Produto | Servico | Ambos [Produ' +
                      'tos em REQ e OS - Servi'#231'os'
                    
                      '                                                           em OS' +
                      ']'
                    'Em Cima      (EM_CIMA_PERFIL) : Valor Geral | Lucro Bruto'
                    
                      'Selecao      (FLAG_SERV_PROD) : Tipo Servi'#231'o | Tipo de Segmenta'#231 +
                      #227'o | Grupo Produto |'
                    '                                Controle Caixa'
                    ''
                    'Agrupado Por ( Mod.Recebimento, Presta'#231#227'o Recebida)'
                    '        Comiss'#227'o Por [H] ( INDIVIDUAL | PESO )'
                    '        Tipo [D] ( Null )'
                    '        Em Cima [D] ( Valor Geral )'
                    '        Selecao [D] ( Controle Caixa )'
                    ''
                    'Agrupado Por ( Produto )'
                    
                      '        Comiss'#227'o Por [H] ( INDIVIDUAL | PESO ), aqui o peso pode' +
                      ' simplesmente multiplicar'
                    '        Tipo [D] ( Produto )'
                    '        Em Cima [D] ( Valor Geral )'
                    '        Selecao [H] ( Tipo de Segmenta'#231#227'o | Grupo Produto )'
                    ''
                    'Agrupado Por ( Venda Geral )'
                    '        Comiss'#227'o Por [H] ( INDIVIDUAL | PESO )'
                    '        Tipo [H] ( Produto | Servico | Ambos )'
                    '        Em Cima [H] ( Valor Geral | Lucro Bruto )'
                    
                      '        Selecao [H] ( Tipo Servi'#231'o | Tipo de Segmenta'#231#227'o | Grupo' +
                      ' Produto )')
                  ParentFont = False
                  ScrollBars = ssVertical
                  TabOrder = 20
                  Visible = False
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'TabSheet5'
                ImageIndex = 2
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Memo2: TMemo
                  Left = 0
                  Top = 0
                  Width = 777
                  Height = 420
                  Align = alClient
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Lines.Strings = (
                    
                      '************************************** AGRUPAMENTOS ************' +
                      '************************** '
                    ''
                    '1 ) Agrupado por "Venda Geral"'
                    ''
                    '        * Origem dos dados'
                    '                > Vendas(REQ, OS) e Devolu'#231#245'es'
                    '        * Tipo'
                    '                > Pode ser Produtos de REQ e OS'
                    '                > Pode ser Servi'#231'os OS'
                    '                > Ou podem ser ambos os casos acima'
                    ''
                    
                      '        * Em Cima (Qual valor ser'#225' usado para calcular a comiss'#227 +
                      'o)'
                    
                      '                > Valor Geral, que '#233' o valor liquido da opera'#231#227'o' +
                      ' (Pre'#231'o + acr'#233'cimos - descontos)'
                    
                      '                > Lucro Bruto, que '#233' o valor acima menos o custo' +
                      ' da mercadoria, esse custo '#233' o m'#233'dio apurado no momento'
                    '                   que o item foi vendido'
                    ''
                    '        * Sele'#231#227'o (Forma de filtrar os dados)'
                    
                      '                > Tipo Servi'#231'o, dispon'#237'vel apenas quando o tipo ' +
                      #233' Servi'#231'o ou Ambos para filtrar os servi'#231'os da O.S'
                    
                      '                > Tipo Segmenta'#231#227'o, sempre dispon'#237'vel, s'#227'o os se' +
                      'rvicos do tipo = "SEGMENTA'#199#195'O"'
                    
                      '                        Para Servi'#231'os da OS quando o mesmo const' +
                      'a no registro'
                    
                      '                        Para Produtos da OS quando o Tipo de Ser' +
                      'vi'#231'o(SEGMENTA'#199#195'O) '#233' vinculado com o produto na OS'
                    
                      '                > Grupo Produto, dispon'#237'vel apenas quando o tipo' +
                      ' '#233' Produto ou Ambos para filtrar os produtos em REQ e OS'
                    ''
                    '2 ) Agrupado por "Produto"'
                    ''
                    '        * Origem dos dados'
                    '                > Vendas(REQ, OS) e Devolu'#231#245'es'
                    '        * Tipo'
                    '                > Apenas Produtos de REQ e OS'
                    ''
                    
                      '        * Em Cima (Qual valor ser'#225' usado para calcular a comiss'#227 +
                      'o)'
                    
                      '                > Valor Geral, que '#233' o valor da comiss'#227'o calcula' +
                      'da no momento da venda, a comiss'#227'o '#233' obtida usando o'
                    
                      '                   percentual definido no cadastro do produto, e' +
                      'xistem 2 percentuais no cadastro, 1'#186' para o colaborador'
                    '                   e o 2'#186' para o gerente, vide OBS 2 abaixo'
                    ''
                    '        * Sele'#231#227'o (Forma de filtrar os dados)'
                    
                      '                > Tipo Segmenta'#231#227'o, filtra os produtos em OS que' +
                      ' foram vinculados a servi'#231'os com do tipo = "SEGMENTA'#199#195'O"'
                    '                > Grupo Produto, filtra os produtos em REQ e OS'
                    ''
                    
                      '        * OBS 1, o valor para o campo "Comiss'#227'o por" ser'#225' sempre' +
                      ' INDIVIDUAL para este agrupamento'
                    ''
                    
                      '        * OBS 2, Quando o colaborar '#233' gerente de alguem o sistem' +
                      'a ir'#225' filtrar as vendas por todos os colaboradores'
                    
                      '          ligados ao gerente, e o valor da comiss'#227'o ser'#225' usada c' +
                      'om base no campo de percentual da comiss'#227'o do gerente.'
                    
                      '          No cadastro do colaboradro possui um campo que indica ' +
                      'quem '#233' seu gerente'
                    ''
                    '3 ) Agrupado por "Presta'#231#227'o Recebida"'
                    ''
                    '        * Origem dos dados'
                    
                      '                > Formas de pagamento do tipo Caixa (Campo "Cont' +
                      'role de Documentos" = "N" no cadastro dos Controles),'
                    
                      '                  Cheques, Cr'#233'ditos, Cheques devolvidos e Cr'#233'dit' +
                      'os devolvidos'
                    
                      '                  Apenas os dados j'#225' quitados ser'#227'o apresentados' +
                      ' nesse agrupamento'
                    '        * Tipo'
                    '                > N'#227'o possui'
                    ''
                    
                      '        * Em Cima (Qual valor ser'#225' usado para calcular a comiss'#227 +
                      'o)'
                    
                      '                > Valor Geral, Valor do campo definido para baix' +
                      'a da comiss'#227'o, o campo de valor e a data da comiss'#227'o'
                    
                      '                   podem ser alterados a qualquer momento median' +
                      'te a processos'
                    ''
                    '        * Sele'#231#227'o (Forma de filtrar os dados)'
                    
                      '                > Controle de Caixa, S'#227'o os controles financeiro' +
                      's do sistema'
                    ''
                    
                      '        * OBS, o valor para o campo "Comiss'#227'o por" ser'#225' sempre I' +
                      'NDIVIDUAL para este agrupamento'
                    ''
                    '4 ) Agrupado por "Mod.Recebimento"'
                    ''
                    '        * Origem dos dados'
                    
                      '                > Formas de pagamento das Vendas, s'#227'o as formas ' +
                      'de pagamentos geradas pelo retaguarda ou Caixa Auxiliar'
                    '                   antes de importar para o financeiro'
                    '        * Tipo'
                    '                > N'#227'o possui'
                    ''
                    
                      '        * Em Cima (Qual valor ser'#225' usado para calcular a comiss'#227 +
                      'o)'
                    '                > Valor Geral, Valor do pagamento'
                    ''
                    '        * Sele'#231#227'o (Forma de filtrar os dados)'
                    
                      '                > Controle de Caixa, S'#227'o os controles financeiro' +
                      's do sistema'
                    ''
                    
                      '        * OBS, o valor para o campo "Comiss'#227'o por" ser'#225' sempre I' +
                      'NDIVIDUAL para este agrupamento'
                    ''
                    
                      '************************************** COMISS'#195'O POR ************' +
                      '**************************'
                    ''
                    '1) INDIVIDUAL'
                    ''
                    
                      '        * Os registros ser'#227'o selecionados exclusivamente com bas' +
                      'e no codigo do colaborador'
                    ''
                    
                      '        * A base de c'#225'lculo da comiss'#227'o ser'#225' o valor apurado com' +
                      ' base no campo "Em Cima" conforme cada agrupamento'
                    ''
                    
                      '        * O percentual de comiss'#227'o ser'#225' o que foi definido neste' +
                      ' perfil ou o percentual da meta, caso atingida'
                    ''
                    
                      '        * No Agrupamento "Produto" o valor da comiss'#227'o ser'#225' o pr' +
                      #243'prio valor apurado na base de c'#225'lculo, nos demais'
                    '           o c'#225'lculo ser'#225' feito utilizando o percentual'
                    ''
                    '2) PESO'
                    ''
                    
                      '        * Os registros ser'#227'o selecionados com base no departamen' +
                      'to em que o colaborador est'#225' vinculado,'
                    
                      '           o v'#237'nculo '#233' feito pela fun'#231#227'o definida no cadastro do' +
                      ' colaborador, e a fun'#231#227'o possui o departamento'
                    ''
                    
                      '        * A base de c'#225'lculo da comiss'#227'o ser'#225' o valor apurado com' +
                      ' base no campo "Em Cima" multiplicado o percentual do peso'
                    
                      '           que foi definido neste perfil conforme cada agrupamen' +
                      'to'
                    ''
                    
                      '        * O percentual de comiss'#227'o ser'#225' o definido no cadastro d' +
                      'o colaborador ou o percentual da meta, caso atingida'
                    ''
                    
                      '************************************** OBSERVA'#199#213'ES *************' +
                      '*************************'
                    ''
                    
                      '> O campo "Sele'#231#227'o" quando n'#227'o selecionado nenhum registro faz c' +
                      'om que o sistema n'#227'o aplique o filtro correspondente'
                    ''
                    
                      '> O campo "Tabelas" quando n'#227'o selecionado nenhum registro faz c' +
                      'om que o sistema n'#227'o aplique o filtro correspondente')
                  ParentFont = False
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
                object Panel4: TPanel
                  Left = 0
                  Top = 420
                  Width = 777
                  Height = 41
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn11: TBitBtn
                    Left = 688
                    Top = 8
                    Width = 75
                    Height = 25
                    Caption = 'Voltar'
                    TabOrder = 0
                    OnClick = BitBtn11Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                      0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                      0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                      1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                      3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                      5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
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
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                      2828281F05002828282828282828282828282817050713282828282828282828
                      2828282817060715282828282828282828282828281507062328280004040404
                      040404232828000701282802090807070707061B28282706062328040B090711
                      2727272828282800071328060D070A07232828282828281C070128070E13020B
                      082028282828281C0701280F101D28020D0818282828280107132816191E2828
                      140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                      282827140808041B282828282828282828282828282828282828282828282828
                      2828282828282828282828282828282828282828282828282828}
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 492
              Width = 785
              ExplicitTop = 492
              ExplicitWidth = 785
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS262]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
              inherited BitBtn6: TBitBtn
                Left = 692
                ExplicitLeft = 692
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          OnEnter = TabSheet2Enter
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 785
          ExplicitHeight = 540
          inherited GroupBox3: TGroupBox
            Width = 785
            ExplicitWidth = 785
            inherited imgInformation: TImage
              Left = 759
              ExplicitLeft = 924
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS256]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS257]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 785
            Height = 467
            ExplicitWidth = 785
            ExplicitHeight = 467
            inherited Splitter1: TSplitter
              Height = 406
              ExplicitHeight = 395
            end
            inherited DBGrid1: TDBGrid
              Width = 492
              Height = 406
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 781
              ExplicitWidth = 781
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro -[BAS258]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS259]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS264]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Left = 179
                ExplicitLeft = 179
              end
              inherited SpeedButton5: TSpeedButton
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Abrir Cadastro de Metas - [BAS265]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000330B0000330B00000001000000010000BD7B4200735A
                  4A00C6844A00CE8C4A00CE945200DEA56300FFCE8C00634AAD00FFDEAD0073AD
                  B500F7E7B50073A5BD008CB5BD007363C6009C84E7009C8CEF0073F7F700FF00
                  FF006BDEFF0073EFFF007BF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                  1111111111111111111111111111111111111111111111110011111111110011
                  1111111111001111111111110000000000000000000000000000000000000000
                  0011111104111111111111111111111111111111111111111111111104111111
                  11111111111111111111111111111111111111110411110202020111110B0B0B
                  0B11110707070711111111000411110303030111111212120B11110D0D0D0711
                  111111110411110303030111111212120B11110D0D0D07111111111104111103
                  03030111111212120B11110D0D0D071111111111041111050305001111131312
                  0B11110E0D0E0711111111110411110505050011111313130B11110E0E0E0711
                  111111000411110505050011111313130911110E0E0E0D111111111104111105
                  06050011111010130C11110E0E0E0D1111111111041111060606001111101010
                  0C11110E0E0E0D11111111110411110606060011111414140C11110F0E0F0D11
                  111111110411110608060211111414140C11110F0F0F0D111111110004111108
                  0808021111120C0C0C11110F0F0F0D1111111111041111080A08021111111111
                  1111110F0F0F0D11111111110411110A0A0A0511111111111111110F0F0F0D11
                  111111110411110505050511111111111111110D0D0D0D111111111104111111
                  1111111111111111111111111111111111111100041111111111111111111111
                  1111111111111111111111110411111111111111111111111111111111111111
                  1111111111111111111111111111111111111111111111111111}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Abrir Cadastro de Metas para o Perfil - [BAS275]'
                Glyph.Data = {
                  56080000424D5608000000000000360400002800000029000000180000000100
                  0800000000002004000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFD000000FDFDFDFDFDE2FDFDFDFDFDE2FDFDFDFDFDFDE2FDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD000000FDE2E2E2E2E2E2E2E2E2E2E2E2E2
                  E2E2E2E2E2E2E2E2FDFDFDA3626A6A6A6A6A6A5A9AA3A4FDFDFDFD000000FDEB
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAC2172696A6A6A6A216A
                  69616A619BFDFD000000FDEBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFD61726A727273086AB46ABC726A6151FDFD000000FDEBFDFDE2E2E29AFDFD
                  AEAEAEAEFDFD95959595FDFDFDFD6A69727273BC73B3086A0873726961FDFD00
                  0000E2EBFDFDE2E2E29AFDFDBFBFBFAEFDFD9E9E9E95FDFDFDFDB4697273B308
                  ABF6F6B408B3736A5AFDFD000000FDEBFDFDE2E2E29AFDFDBFBFBFAEFDFD9E9E
                  9E95FDFDFDFDFD6272B3086A08FFFFB4BCB4736AA3FDFD000000FDEBFDFDE2E2
                  E29AFDFDBFBFBFAEFDFD9E9E9E95FDFDFDFDFDFD62736AF7070708B4B4BC7362
                  FDFDFD000000FDEBFDFDEBE2EBE2FDFDBFBFBFAEFDFDA79EA795FDFDFDFDFDFD
                  FD62226566666563B36A62FDFDFDFD000000FDEBFDFDEBEBEBE2FDFDBFBFBFAE
                  FDFDA7A7A795FDFDFDFDFDFDFD652667676767265BFDFDFDFDFDFD000000E2EB
                  FDFDEBEBEBE2FDFDBFBFBFAEFDFDA7A7A79EFDFDFDFDFDFDFD666F6F6F6F6F6F
                  5DFDFDFDFDFDFD000000FDEBFDFDEB09EBE2FDFDBFBFBFB6FDFDA7A7A79EFDFD
                  FDFDFDFD656F6F6F6F6F6F6F671DFDFDFDFDFD000000FDEBFDFD090909E2FDFD
                  BFBFBFB6FDFDA7A7A79EFDFDFDFDFDFD666F6F6F6F6F6F6F6F5BFDFDFDFDFD00
                  0000FDEBFDFD090909E2FDFDBFBFBFB6FDFDA7A7A79EFDFDFDFDFDA56F6F6F6F
                  B7B76F6F6F5CFDFDFDFDFD000000FDEBFDFD090909E2FDFDBFBFBFB6FDFDA7A7
                  A79EFDFDFDFDFDAE6F6F77B777B777B76F65FDFDFDFDFD000000E2EBFDFD0909
                  09E2FDFDBFB6B6B6FDFDA7A7A79EFDFDFDFDFD6E6F77B7B7B77777777764FDFD
                  FDFDFD000000FDEBFDFD090909E2FDFDFDFDFDFDFDFDA7A7A79EFDFDFDFDFDAE
                  66666F6F666666666E1DFDFDFDFDFD000000FDEBFDFD090909EBFDFDFDFDFDFD
                  FDFDA7A7A79EFDFDFDFDFDA565666EAFB7AF6F665DFDFDFDFDFDFD000000FDEB
                  FDFDEBEBEBEBFDFDFDFDFDFDFDFD9E9E9E9EFDFDFDFDFDFD6566AFB7B7B76F6E
                  1DFDFDFDFDFDFD000000FDEBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFD666EAFB7B76E1DFDFDFDFDFDFDFD000000E2EBFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAE6E6E65A5FDFDFDFDFDFDFDFD00
                  0000FDEBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFD000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD000000}
                OnClick = SpeedButton8Click
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
                Left = 180
                Top = 3
                Hint = 'Ver registros da lixeira - [BAS263]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 180
                ExplicitTop = 3
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 406
              ExplicitHeight = 406
              inherited ScrollBox2: TScrollBox
                Height = 389
                ExplicitHeight = 389
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 785
          ExplicitHeight = 540
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object qrpPerfisComissao: TQuickRep
            Left = -220
            Top = 24
            Width = 1123
            Height = 794
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = DtmCadBasicos.cdsPerfilComissao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE')
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            OnPreview = qrpPerfisComissaoPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poLandscape
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2100.000000000000000000
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              100.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = Auto
            PrinterSettings.Duplex = False
            PrinterSettings.FirstPage = 0
            PrinterSettings.LastPage = 0
            PrinterSettings.UseStandardprinter = False
            PrinterSettings.UseCustomBinCode = False
            PrinterSettings.CustomBinCode = 0
            PrinterSettings.ExtendedDuplex = 0
            PrinterSettings.UseCustomPaperCode = False
            PrinterSettings.CustomPaperCode = 0
            PrinterSettings.PrintMetaFile = False
            PrinterSettings.PrintQuality = 0
            PrinterSettings.Collate = 0
            PrinterSettings.ColorOption = 0
            PrintIfEmpty = True
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsStayOnTop
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object TitleBand1: TQRBand
              Left = 38
              Top = 38
              Width = 1047
              Height = 83
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                219.604166666666700000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel1: TQRLabel
                Left = 0
                Top = 31
                Width = 283
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  0.000000000000000000
                  82.020833333333340000
                  748.770833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cadastro de Perfis de Comiss'#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel2: TQRLabel
                Left = 2
                Top = 61
                Width = 65
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  5.291666666666667000
                  161.395833333333300000
                  171.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData1: TQRSysData
                Left = 73
                Top = 61
                Width = 69
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  193.145833333333300000
                  161.395833333333300000
                  182.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel3: TQRLabel
                Left = 607
                Top = 61
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1606.020833333333000000
                  161.395833333333300000
                  124.354166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData2: TQRSysData
                Left = 658
                Top = 61
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1740.958333333333000000
                  161.395833333333300000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object lbEmpresa: TQRLabel
                Left = 2
                Top = 10
                Width = 103
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  26.458333333333330000
                  272.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'lbEmpresa'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                OnPrint = lbEmpresaPrint
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
            end
            object PageFooterBand1: TQRBand
              Left = 38
              Top = 175
              Width = 1047
              Height = 36
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                95.250000000000000000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRLabel15: TQRLabel
                Left = 3
                Top = 6
                Width = 210
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  7.937500000000000000
                  15.875000000000000000
                  555.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas e Computadores Ltda'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape3: TQRShape
                Left = 3
                Top = 29
                Width = 1041
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  76.729166666666680000
                  2754.312500000000000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
            object ColumnHeaderBand1: TQRBand
              Left = 38
              Top = 121
              Width = 1047
              Height = 35
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                92.604166666666680000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape2: TQRShape
                Left = 6
                Top = 29
                Width = 1041
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  15.875000000000000000
                  76.729166666666680000
                  2754.312500000000000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel4: TQRLabel
                Left = 10
                Top = 6
                Width = 57
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  26.458333333333330000
                  15.875000000000000000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel5: TQRLabel
                Left = 75
                Top = 6
                Width = 78
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  198.437500000000000000
                  15.875000000000000000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel6: TQRLabel
                Left = 384
                Top = 6
                Width = 77
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1016.000000000000000000
                  15.875000000000000000
                  203.729166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Agrupado'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel7: TQRLabel
                Left = 545
                Top = 7
                Width = 35
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1441.979166666667000000
                  18.520833333333330000
                  92.604166666666680000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Tipo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel8: TQRLabel
                Left = 671
                Top = 7
                Width = 62
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1775.354166666667000000
                  18.520833333333330000
                  164.041666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Sele'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel9: TQRLabel
                Left = 256
                Top = 6
                Width = 78
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  677.333333333333400000
                  15.875000000000000000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Comiss'#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRShape1: TQRShape
                Left = 3
                Top = 0
                Width = 1041
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  0.000000000000000000
                  2754.312500000000000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel10: TQRLabel
                Left = 799
                Top = 7
                Width = 69
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  2114.020833333333000000
                  18.520833333333330000
                  182.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Em Cima'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel11: TQRLabel
                Left = 911
                Top = 6
                Width = 83
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  2410.354166666667000000
                  15.875000000000000000
                  219.604166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Perc. Peso'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object DetailBand1: TQRBand
              Left = 38
              Top = 156
              Width = 1047
              Height = 19
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                50.270833333333330000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText2: TQRDBText
                Left = 10
                Top = 2
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  26.458333333333330000
                  5.291666666666667000
                  150.812500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsPerfilComissao
                DataField = 'CODIGO_PERFIL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText3: TQRDBText
                Left = 84
                Top = 0
                Width = 166
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  222.250000000000000000
                  0.000000000000000000
                  439.208333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsPerfilComissao
                DataField = 'NOME_PERFIL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText1: TQRDBText
                Left = 384
                Top = 0
                Width = 77
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1016.000000000000000000
                  0.000000000000000000
                  203.729166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsPerfilComissao
                DataField = 'TIPO_PERFIL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText4: TQRDBText
                Left = 545
                Top = 0
                Width = 109
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1441.979166666667000000
                  0.000000000000000000
                  288.395833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsPerfilComissao
                DataField = 'TIPO_SERV_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText5: TQRDBText
                Left = 671
                Top = 0
                Width = 112
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1775.354166666667000000
                  0.000000000000000000
                  296.333333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsPerfilComissao
                DataField = 'FLAG_SERV_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText6: TQRDBText
                Left = 256
                Top = 2
                Width = 99
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  677.333333333333400000
                  5.291666666666667000
                  261.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsPerfilComissao
                DataField = 'ABRANG_PERFIL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText7: TQRDBText
                Left = 799
                Top = 0
                Width = 102
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2114.020833333333000000
                  0.000000000000000000
                  269.875000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsPerfilComissao
                DataField = 'EM_CIMA_PERFIL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText9: TQRDBText
                Left = 911
                Top = 2
                Width = 75
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2410.354166666667000000
                  5.291666666666667000
                  198.437500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsPerfilComissao
                DataField = 'PERC_PESO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 962
      Width = 93
      Height = 573
      ExplicitLeft = 962
      ExplicitWidth = 93
      ExplicitHeight = 573
      inherited bMarketingHW: TBitBtn
        Top = 551
        Width = 91
        ExplicitTop = 551
        ExplicitWidth = 91
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 575
    ExplicitTop = 575
  end
  inherited pnStatusProcessamento: TPanel
    Left = 3000
    ExplicitLeft = 3000
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 574
    Top = 56
  end
  inherited Timer1: TTimer
    Left = 494
    Top = 51
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 534
    Top = 51
  end
end
