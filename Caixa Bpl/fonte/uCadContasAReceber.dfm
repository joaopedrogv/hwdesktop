inherited frmCadContasAReceber: TfrmCadContasAReceber
  Left = 221
  Top = 85
  Caption = 'Contas a Receber'
  ClientHeight = 574
  ClientWidth = 891
  Scaled = False
  ExplicitWidth = 907
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 891
    Height = 555
    ExplicitWidth = 891
    ExplicitHeight = 555
    inherited Splitter2: TSplitter
      Height = 553
      ExplicitLeft = 841
      ExplicitHeight = 553
    end
    inherited PanelLeft: TPanel
      Width = 886
      Height = 553
      ExplicitWidth = 886
      ExplicitHeight = 553
      inherited PageControl1: TPageControl
        Width = 884
        Height = 551
        ExplicitWidth = 884
        ExplicitHeight = 551
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 876
          ExplicitHeight = 520
          inherited ScrollBox1: TScrollBox
            Width = 876
            Height = 520
            ExplicitWidth = 876
            ExplicitHeight = 520
            inherited PageControl3: TPageControl
              Width = 876
              Height = 472
              ActivePage = tsCadastroCheque
              ExplicitWidth = 876
              ExplicitHeight = 472
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 868
                ExplicitHeight = 441
                inherited ScrollBox3: TScrollBox
                  Width = 868
                  Height = 441
                  BorderStyle = bsNone
                  ExplicitWidth = 868
                  ExplicitHeight = 441
                  inherited GroupBox1: TGroupBox
                    Width = 868
                    Height = 441
                    Align = alClient
                    ExplicitWidth = 868
                    ExplicitHeight = 441
                  end
                end
              end
              object tsCadastroCheque: TTabSheet
                Caption = 'tsCadastroCheque'
                ImageIndex = 1
                object ScrollBox5: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 868
                  Height = 441
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object grupoCheque: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 851
                    Height = 466
                    Align = alTop
                    Caption = 'Cadastro Cheque'
                    TabOrder = 0
                    OnEnter = grupoChequeEnter
                    object Label6: TLabel
                      Left = 111
                      Top = 41
                      Width = 59
                      Height = 13
                      Hint = 'Numero do Plano de Contas'
                      Alignment = taRightJustify
                      Caption = 'N'#186' da Conta'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 98
                      Top = 142
                      Width = 70
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Cadastro'
                      FocusControl = DBEdit3
                    end
                    object Label8: TLabel
                      Left = 498
                      Top = 142
                      Width = 56
                      Height = 13
                      Caption = 'Data Venda'
                      FocusControl = DBEdit4
                    end
                    object Label9: TLabel
                      Left = 91
                      Top = 250
                      Width = 77
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Numero Cheque'
                      FocusControl = DBEdit5
                    end
                    object Label10: TLabel
                      Left = 525
                      Top = 250
                      Width = 29
                      Height = 13
                      Caption = 'Conta'
                      FocusControl = DBEdit6
                    end
                    object Label11: TLabel
                      Left = 253
                      Top = 250
                      Width = 38
                      Height = 13
                      Caption = 'Agencia'
                      FocusControl = DBEdit7
                    end
                    object Label12: TLabel
                      Left = 99
                      Top = 276
                      Width = 69
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Numero Banco'
                      FocusControl = DBEdit8
                    end
                    object Label13: TLabel
                      Left = 262
                      Top = 276
                      Width = 29
                      Height = 13
                      Caption = 'Banco'
                      FocusControl = DBEdit9
                    end
                    object Label14: TLabel
                      Left = 87
                      Top = 303
                      Width = 81
                      Height = 13
                      Caption = 'Data Vencimento'
                      FocusControl = DBEdit11
                    end
                    object Label15: TLabel
                      Left = 104
                      Top = 330
                      Width = 64
                      Height = 13
                      Caption = 'Valor Cheque'
                      FocusControl = DBEdit12
                    end
                    object Label16: TLabel
                      Left = 80
                      Top = 169
                      Width = 88
                      Height = 13
                      Caption = 'Cliente do Cheque'
                      FocusControl = DBEdit13
                    end
                    object Label17: TLabel
                      Left = 93
                      Top = 223
                      Width = 75
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cliente Terceiro'
                      FocusControl = DBEdit16
                    end
                    object Label18: TLabel
                      Left = 72
                      Top = 196
                      Width = 96
                      Height = 13
                      Caption = 'Razao Social Cliente'
                    end
                    object Label21: TLabel
                      Left = 127
                      Top = 357
                      Width = 41
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Controle'
                      FocusControl = DBEdit18
                    end
                    object Label23: TLabel
                      Left = 58
                      Top = 410
                      Width = 110
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo Documento Venda'
                    end
                    object Label24: TLabel
                      Left = 443
                      Top = 410
                      Width = 111
                      Height = 13
                      Caption = 'Num Documento Venda'
                      FocusControl = DBEdit20
                    end
                    object Label25: TLabel
                      Left = 87
                      Top = 436
                      Width = 81
                      Height = 13
                      Caption = 'Tipo Lancamento'
                    end
                    object Label26: TLabel
                      Left = 472
                      Top = 436
                      Width = 82
                      Height = 13
                      Caption = 'Codigo Vendedor'
                      FocusControl = DBEdit21
                    end
                    object spbContasBancarias: TSpeedButton
                      Left = 376
                      Top = 246
                      Width = 143
                      Height = 22
                      Caption = 'Contas Banc'#225'rias'
                      Flat = True
                      Glyph.Data = {
                        46030000424D4603000000000000460200002800000010000000100000000100
                        08000000000000010000120B0000120B00008400000084000000504BC5005854
                        BD009795C500ABA8C600A39CCB00A098C500675E87009F95C400B3A7C800FF00
                        FF0068C16A0008750D0060B96A004DB15A0043A3530023AB3D0025AB3D0035AD
                        4C003FA6510023AB3F0067BE780023AB410028B047002FB94F002DA652001073
                        2F002C7D4D00398F5C002385500049A072004EA375001E94580024855600249B
                        6500239567001F946B001F956E001E937300239178001D8F78002F766A003B83
                        79002E6E67003F78780034778200477A890000AEFF0000AFFF0000A8FF0000A2
                        FF0000A5FF000DAAFF001AAEFF0000A1FF007390A6004096D900016FDE001074
                        DC00117BFF001984FF005B7BA200A4CDFF008C9BAD000069F6000269F6002786
                        FF006FAEFF007DB5FF008292A6004E6C9900B1D0FF00E0EBFF009DBBFF00F8FA
                        FF000C49FB002355EA003166FF00979FB800D2DBFF00031B8E0004209D00041E
                        9A00041C920005219F000621A100081E8A004E6DF700798FFC00EEF1FF00041B
                        9600969ECE000021F700001AD7000019D100031CD7000523F7007E8DF600000F
                        9C000116DC000116DB000115D0000E25D6002437D9003044DC003446DE000011
                        D400000FD3000213C7000211C100101FD500000ECB00000AC300000AB700030F
                        BB00040FB300040EAA007278D5000006BC000007B7000005A0002329B2000000
                        B8000000B7000004B7000000B6000002B6000001B00000019B0000009A007576
                        BD00FFFFFF00000000000909090909097F80800909090909090909090909090B
                        777B5D80800909090909090909090B1F73705C5B4A4038090909090909551621
                        727B6560483A313909090909804F1522717C668258433539090909097E521523
                        6C765E564E823439090909097D5913246B7A6747493D33390909090975510F25
                        647A688246413039090909096F5010276A79625782423239090909096E541726
                        00016D5F4C3B2F3909090909695311182D4D04744B3F2E390909090963611A0A
                        12202B3E085A3739090909097881452C1D0C0E1C2A4406090909090980800502
                        3C291E140D1909090909090909098080070336281B0909090909090909090909
                        80808009090909090909}
                      OnClick = spbContasBancariasClick
                    end
                    object SpeedButton16: TSpeedButton
                      Left = 253
                      Top = 138
                      Width = 23
                      Height = 22
                      Hint = 'Modificar a data de cadastro da conta - [CAR040]'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B00000001000000010000000000000084
                        0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                        52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                        9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                        A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                        B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                        BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                        DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                        FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                        0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                        2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                        31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                        363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                        2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                        443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                        4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                        3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton16Click
                    end
                    object Label129: TLabel
                      Left = 126
                      Top = 16
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Unificada'
                      FocusControl = DBEdit1
                    end
                    object Label130: TLabel
                      Left = 488
                      Top = 330
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Cont'#225'bil'
                      FocusControl = DBEdit67
                    end
                    object Label22: TLabel
                      Left = 127
                      Top = 384
                      Width = 41
                      Height = 13
                      Caption = 'Historico'
                      FocusControl = DBEdit19
                    end
                    object Label141: TLabel
                      Left = 422
                      Top = 303
                      Width = 132
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Previs'#227'o Recebimento'
                      FocusControl = DBEdit70
                    end
                    object bt_alt_data_prev_rec: TSpeedButton
                      Left = 663
                      Top = 299
                      Width = 23
                      Height = 22
                      Hint = 'Habilitar data previs'#227'o de recebimento - [CAR107]'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B00000001000000010000000000000084
                        0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                        52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                        9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                        A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                        B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                        BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                        DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                        FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                        0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                        2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                        31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                        363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                        2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                        443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                        4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                        3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = bt_alt_data_prev_recClick
                    end
                    object bt_limpar_data_prev_rec: TSpeedButton
                      Left = 636
                      Top = 300
                      Width = 23
                      Height = 21
                      Hint = 'Limpar data previs'#227'o recebimento'
                      Glyph.Data = {
                        36040000424D3604000000000000360000002800000010000000100000000100
                        20000000000000040000130B0000130B00000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        000000000000000000000098FE7C0097FE4F0000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000098FE770098FFFF0096FEFA0099FF5000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        00000098FE770098FFFF0098FFFF0098FFFF0096FEF90099FF50000000000000
                        0000000000000000000000000000000000000000000000000000000000000098
                        FE7C0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF39A3E5D4C4BEB14F0000
                        0000000000000000000000000000000000000000000000000000000000000096
                        FE470096FEF70098FFFF0098FFFF0098FFFF33A2E9EDC2BEAEF5CCC7BCCFDBD8
                        CE4F000000000000000000000000000000000000000000000000000000000000
                        00000099FE490096FEF70098FFFF31A2E9EDC2BDAFF5CBC7B9EFDCD8CFFBCFCA
                        BFCCC4BEB14F0000000000000000000000000000000000000000000000000000
                        0000000000000096FE4739A4E7D5C2BEAEF5CCC5B9ECDCD8CFFBD1C9C0EFC3BC
                        AEFED3CEC4CDDBD8CE4F00000000000000000000000000000000000000000000
                        00000000000000000000C4BDAE46CCC7BCCFDCD8CFFBCFCCBFEDC3BCAEFED2CB
                        C1EFDAD6D0FF8A8AE0D07474E54F000000000000000000000000000000000000
                        0000000000000000000000000000DCD8CE49D0C8BECAC3BCAEFED1CDC0EDDAD6
                        D0FF9594DDF17373E5FF7373E5FA7272E5500000000000000000000000000000
                        000000000000000000000000000000000000C6BFB148D4CFC5CBDAD6D0FF9492
                        DEF17373E5FF7373E5FF7373E5FF7171E5F97171E64800000000000000000000
                        00000000000000000000000000000000000000000000DCD8CE498B8BE0CF7373
                        E5FF7373E5FF7373E5FF7373E5FF7373E5FF7272E57A00000000000000000000
                        00000000000000000000000000000000000000000000000000007272E5477171
                        E5F77373E5FF7373E5FF7373E5FF7272E39C7F7FFF0200000000000000000000
                        0000000000000000000000000000000000000000000000000000000000007272
                        E5477171E5F77373E5FF7272E39C7F7FFF020000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        00007373E3427373E5770000FF01000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = bt_limpar_data_prev_recClick
                    end
                    object DBEdit1: TDBEdit
                      Left = 174
                      Top = 38
                      Width = 75
                      Height = 21
                      Hint = 'Numero do plano de Contas'
                      DataField = 'N_CONTA_PLC'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 3
                      OnExit = DBEdit1Exit
                      OnKeyDown = DBEdit1KeyDown
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 253
                      Top = 38
                      Width = 380
                      Height = 21
                      Hint = 'Nome do Plano de Contas'
                      DataField = 'N_CONTA_PLC'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      KeyField = 'N_CONTA_PLC'
                      ListField = 'DESC_PLC;N_CONTA_PLC'
                      ListSource = dtmContasAReceber.dsPCont
                      TabOrder = 4
                      OnExit = DBLookupComboBox1Exit
                    end
                    object Panel4: TPanel
                      Left = 17
                      Top = 59
                      Width = 630
                      Height = 85
                      BevelOuter = bvNone
                      Enabled = False
                      TabOrder = 0
                      object Label19: TLabel
                        Left = 75
                        Top = 8
                        Width = 76
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Grupo da Conta'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label20: TLabel
                        Left = 35
                        Top = 33
                        Width = 116
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Departamento da Conta'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label134: TLabel
                        Left = 75
                        Top = 59
                        Width = 76
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo de Entrada'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit2: TDBEdit
                        Left = 157
                        Top = 5
                        Width = 459
                        Height = 21
                        DataField = 'DESC_GR'
                        DataSource = dtmContasAReceber.dsPCont
                        TabOrder = 0
                      end
                      object DBEdit10: TDBEdit
                        Left = 157
                        Top = 30
                        Width = 459
                        Height = 21
                        DataField = 'DESC_DEP'
                        DataSource = dtmContasAReceber.dsPCont
                        TabOrder = 1
                      end
                      object Edit11: TEdit
                        Left = 157
                        Top = 55
                        Width = 459
                        Height = 21
                        CharCase = ecUpperCase
                        TabOrder = 2
                      end
                    end
                    object DBEdit3: TDBEdit
                      Left = 174
                      Top = 139
                      Width = 73
                      Height = 21
                      Hint = 'Data do caixa que a conta teve sua entrada'
                      DataField = 'DATA_REC'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 5
                      OnExit = DBEdit3Exit
                    end
                    object DBEdit4: TDBEdit
                      Left = 560
                      Top = 139
                      Width = 73
                      Height = 21
                      Hint = 'Data da venda'
                      DataField = 'DATA_VENDA'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 6
                    end
                    object DBEdit5: TDBEdit
                      Left = 174
                      Top = 247
                      Width = 73
                      Height = 21
                      Hint = 'Numero do cheque'
                      CharCase = ecUpperCase
                      DataField = 'N_CH'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 12
                    end
                    object DBEdit6: TDBEdit
                      Left = 560
                      Top = 247
                      Width = 73
                      Height = 21
                      Hint = 'Numero da conta do cheque'
                      CharCase = ecUpperCase
                      DataField = 'CONTA'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 14
                      OnKeyDown = DBEdit7KeyDown
                    end
                    object DBEdit7: TDBEdit
                      Left = 297
                      Top = 247
                      Width = 73
                      Height = 21
                      Hint = 'Ag'#234'ncia do cheque'
                      CharCase = ecUpperCase
                      DataField = 'AGENCIA'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 13
                      OnKeyDown = DBEdit7KeyDown
                    end
                    object DBEdit8: TDBEdit
                      Left = 174
                      Top = 273
                      Width = 73
                      Height = 21
                      Hint = 'Numero do Banco do cheque'
                      CharCase = ecUpperCase
                      DataField = 'ID_BANCO'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 15
                      OnKeyDown = DBEdit7KeyDown
                    end
                    object DBEdit9: TDBEdit
                      Left = 297
                      Top = 273
                      Width = 336
                      Height = 21
                      Hint = 'Nome do Banco'
                      CharCase = ecUpperCase
                      DataField = 'BANCO'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 16
                      OnKeyDown = DBEdit7KeyDown
                    end
                    object DBEdit11: TDBEdit
                      Left = 174
                      Top = 300
                      Width = 73
                      Height = 21
                      Hint = 'Data de vencimento'
                      DataField = 'DATA_VENC'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 17
                      OnExit = DBEdit11Exit
                    end
                    object DBEdit12: TDBEdit
                      Left = 174
                      Top = 327
                      Width = 73
                      Height = 21
                      Hint = 'Valor do cheque'
                      DataField = 'VALOR_CH'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 19
                      OnExit = DBEdit12Exit
                    end
                    object DBEdit13: TDBEdit
                      Left = 174
                      Top = 166
                      Width = 73
                      Height = 21
                      Hint = 'Codigo do cliente'
                      DataField = 'COD_CLIENTE'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 7
                      OnEnter = DBEdit13Enter
                      OnExit = DBEdit13Exit
                      OnKeyDown = DBEdit13KeyDown
                    end
                    object DBEdit14: TDBEdit
                      Left = 253
                      Top = 166
                      Width = 380
                      Height = 21
                      Hint = 'Nome ou Nome Fazia do cliente'
                      CharCase = ecUpperCase
                      DataField = 'NOME_CH'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 8
                    end
                    object DBEdit15: TDBEdit
                      Left = 174
                      Top = 193
                      Width = 459
                      Height = 21
                      Hint = 'Razao Social do cliente'
                      CharCase = ecUpperCase
                      DataField = 'RAZAO'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      Enabled = False
                      TabOrder = 9
                    end
                    object DBEdit16: TDBEdit
                      Left = 174
                      Top = 220
                      Width = 73
                      Height = 21
                      Hint = 'Codigo cliente terceiro'
                      DataField = 'COD_CLI_TERC'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 10
                      OnExit = DBEdit16Exit
                      OnKeyDown = DBEdit16KeyDown
                    end
                    object DBEdit17: TDBEdit
                      Left = 253
                      Top = 220
                      Width = 380
                      Height = 21
                      Hint = 'Nome Cliente terceiro'
                      CharCase = ecUpperCase
                      DataField = 'NOME_TERC'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 11
                    end
                    object DBEdit18: TDBEdit
                      Left = 174
                      Top = 354
                      Width = 73
                      Height = 21
                      Hint = 'Codigo Controle'
                      DataField = 'CODIGO_CTRL'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 21
                      OnExit = DBEdit18Exit
                      OnKeyDown = DBEdit18KeyDown
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 253
                      Top = 354
                      Width = 380
                      Height = 21
                      Hint = 'Nome Controle'
                      DataField = 'CODIGO_CTRL'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      KeyField = 'CODIGO_CTRL'
                      ListField = 'NOME_CTRL'
                      ListSource = dtmContasAReceber.dsCtrl
                      TabOrder = 22
                      OnExit = DBLookupComboBox2Exit
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 174
                      Top = 407
                      Width = 73
                      Height = 21
                      Hint = 'Tipo de documento de venda'
                      CharCase = ecUpperCase
                      DataField = 'TP_DOC_V'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      ItemHeight = 13
                      Items.Strings = (
                        'REQ'
                        'OS'
                        'MOT'
                        'NF'
                        'REC'
                        'PRE'
                        'CUP')
                      TabOrder = 24
                    end
                    object DBEdit20: TDBEdit
                      Left = 560
                      Top = 407
                      Width = 73
                      Height = 21
                      Hint = 'Numero do documento de venda'
                      CharCase = ecUpperCase
                      DataField = 'N_DOC_V'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 25
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 174
                      Top = 433
                      Width = 73
                      Height = 21
                      Hint = 'Tipo de lan'#231'amento'
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'TIP_CNT'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      ItemHeight = 13
                      Items.Strings = (
                        'C'
                        'N')
                      TabOrder = 26
                    end
                    object DBEdit21: TDBEdit
                      Left = 560
                      Top = 433
                      Width = 73
                      Height = 21
                      Hint = 'C'#243'digo do vendedor'
                      CharCase = ecUpperCase
                      DataField = 'CODIGO_VEND'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 27
                    end
                    object DBEdit66: TDBEdit
                      Left = 174
                      Top = 13
                      Width = 75
                      Height = 21
                      Hint = 'C'#243'digo Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 1
                      OnExit = DBEdit66Exit
                    end
                    object DBLookupComboBox14: TDBLookupComboBox
                      Left = 253
                      Top = 13
                      Width = 380
                      Height = 21
                      Hint = 'Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      KeyField = 'COD_EMPRESA'
                      ListField = 'IDENTIFICACAO_EMP'
                      ListSource = dtmContasAReceber.dsEmpresasUnificadas
                      TabOrder = 2
                      OnExit = DBEdit66Exit
                    end
                    object DBEdit67: TDBEdit
                      Left = 560
                      Top = 327
                      Width = 73
                      Height = 21
                      Hint = 'Valor cont'#225'bil do lan'#231'amento'
                      DataField = 'VL_CONTABIL'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 20
                    end
                    object DBEdit19: TDBEdit
                      Left = 174
                      Top = 381
                      Width = 459
                      Height = 21
                      Hint = 'Hist'#243'rico do cheque'
                      CharCase = ecUpperCase
                      DataField = 'HISTORICO_CH'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      TabOrder = 23
                    end
                    object DBEdit70: TDBEdit
                      Left = 560
                      Top = 300
                      Width = 73
                      Height = 21
                      Hint = 
                        'Data previs'#227'o de recebimento utilizada para barrar / desbarrar c' +
                        'liente automaticamente'
                      DataField = 'DATA_PREV_REC'
                      DataSource = dtmContasAReceber.dsCtrlCh
                      Enabled = False
                      TabOrder = 18
                      OnExit = DBEdit11Exit
                    end
                  end
                end
              end
              object tsCadastroCredito: TTabSheet
                Caption = 'tsCadastroCredito'
                ImageIndex = 2
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 868
                  Height = 441
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object grupoCredito: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 851
                    Height = 500
                    Align = alTop
                    Caption = 'Cadastro Cr'#233'dito'
                    TabOrder = 0
                    OnEnter = grupoCreditoEnter
                    object Label34: TLabel
                      Left = 111
                      Top = 43
                      Width = 59
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' da Conta'
                      FocusControl = DBEdit24
                    end
                    object Label35: TLabel
                      Left = 100
                      Top = 145
                      Width = 70
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Data Cadastro'
                      FocusControl = DBEdit27
                      ParentBiDiMode = False
                    end
                    object Label36: TLabel
                      Left = 500
                      Top = 145
                      Width = 56
                      Height = 13
                      Caption = 'Data Venda'
                      FocusControl = DBEdit30
                    end
                    object Label40: TLabel
                      Left = 61
                      Top = 253
                      Width = 109
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Numero do Documento'
                      FocusControl = DBEdit34
                    end
                    object Label42: TLabel
                      Left = 474
                      Top = 253
                      Width = 81
                      Height = 13
                      Caption = 'Data Vencimento'
                      FocusControl = DBEdit36
                    end
                    object Label43: TLabel
                      Left = 146
                      Top = 306
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor'
                      FocusControl = DBEdit37
                    end
                    object Label44: TLabel
                      Left = 84
                      Top = 172
                      Width = 86
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cliente do Cr'#233'dito'
                      FocusControl = DBEdit38
                    end
                    object Label45: TLabel
                      Left = 95
                      Top = 226
                      Width = 75
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cliente Terceiro'
                      FocusControl = DBEdit41
                    end
                    object Label46: TLabel
                      Left = 74
                      Top = 199
                      Width = 96
                      Height = 13
                      Caption = 'Razao Social Cliente'
                    end
                    object Label47: TLabel
                      Left = 129
                      Top = 361
                      Width = 41
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Controle'
                      FocusControl = DBEdit43
                    end
                    object Label49: TLabel
                      Left = 60
                      Top = 415
                      Width = 110
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo Documento Venda'
                    end
                    object Label50: TLabel
                      Left = 445
                      Top = 415
                      Width = 111
                      Height = 13
                      Caption = 'Num Documento Venda'
                      FocusControl = DBEdit45
                    end
                    object Label51: TLabel
                      Left = 89
                      Top = 441
                      Width = 81
                      Height = 13
                      Caption = 'Tipo Lancamento'
                    end
                    object Label37: TLabel
                      Left = 93
                      Top = 388
                      Width = 77
                      Height = 13
                      Caption = 'Tipo Documento'
                      FocusControl = DBEdit31
                    end
                    object Label38: TLabel
                      Left = 474
                      Top = 441
                      Width = 82
                      Height = 13
                      Caption = 'Codigo Vendedor'
                      FocusControl = DBEdit32
                    end
                    object SpeedButton20: TSpeedButton
                      Left = 255
                      Top = 141
                      Width = 23
                      Height = 22
                      Hint = 'Modificar a data de cadastro da conta - [CAR041]'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B00000001000000010000000000000084
                        0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                        52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                        9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                        A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                        B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                        BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                        DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                        FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                        0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                        2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                        31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                        363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                        2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                        443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                        4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                        3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton20Click
                    end
                    object Label128: TLabel
                      Left = 126
                      Top = 16
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Unificada'
                      FocusControl = DBEdit1
                    end
                    object Label131: TLabel
                      Left = 104
                      Top = 334
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Cont'#225'bil'
                      FocusControl = DBEdit68
                    end
                    object Label127: TLabel
                      Left = 68
                      Top = 467
                      Width = 102
                      Height = 13
                      Caption = 'Nosso N'#250'mero Boleto'
                    end
                    object Label52: TLabel
                      Left = 529
                      Top = 467
                      Width = 27
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Func.'
                      FocusControl = DBEdit46
                    end
                    object Label48: TLabel
                      Left = 129
                      Top = 280
                      Width = 41
                      Height = 13
                      Caption = 'Historico'
                      FocusControl = DBEdit44
                    end
                    object SpeedButtonInfDadosCartao: TSpeedButton
                      Left = 539
                      Top = 358
                      Width = 96
                      Height = 21
                      Hint = 'Informar dados da Transa'#231#227'o de Cart'#227'o - [CAR079]'
                      Flat = True
                      Glyph.Data = {
                        76060000424D7606000000000000360400002800000018000000180000000100
                        08000000000040020000030F0000030F00000001000000010000630000009C00
                        00007B212100AD212100392921004A423900524A42004A4A4A005A524A005A52
                        520063525200635A52006B5A5200735A520073635200635A5A006B635A007363
                        5A006B6363007B736B0084736B00847B7B008C7B7B0084847B0084848400848C
                        8C00948C8C00DE9C9C00DEA5A500DEADAD00DEB5B500DEBDBD00D6C6C600DEC6
                        C600CECECE00D6D6D600E7E7E700FFE7E700EFEFEF00FF00FF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00272727272727
                        2727272727272727272727272727272727272727272727272727272727272727
                        2727272727272727272727272727272727272727272712121A1A1A271A1A1A1A
                        1A27272727272727272727272727191926202012212125070727272727272727
                        2727272727271919262020122121250707272727272727272727272727271919
                        091616250909060C0C270E0E0E0E0E0E0E0E0E0E0E0E0E0E0E13131B04041111
                        11140E282828282828282828282828282809131B040928281114102828282828
                        28282828282828282828151C062828280F111028282828282828282828282828
                        2828151C0A2828280F0E10282400010001280001000124282828151C0A282828
                        0F0E10280001280001280001280003282828151D0A2828280F0D102822000100
                        01280001280102282828151E0A2828280F0D1028282828010028010028000228
                        2828151E0A2828280F0D10282800010022280001000123282828171E0A282828
                        0F0D10282828282828280100282828282828181F0A2828280B0D102828282828
                        28280001282828282828181F0A2828280B0D1028282828282828282828282828
                        2828181F082828280B1110282828282828282828282828282809152105092828
                        10111010101010101010101010100F0F08151521050510101011272727272727
                        2727272727271919091A1A250909060C0C272727272727272727272727271919
                        2620201221212507072727272727272727272727272719192620201221212507
                        07272727272727272727272727271212191A1A2719191A1A1A27}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButtonInfDadosCartaoClick
                    end
                    object SpeedButtonObsCred: TSpeedButton
                      Left = 639
                      Top = 277
                      Width = 58
                      Height = 21
                      Hint = 'Observa'#231#227'o do cr'#233'dito - [CAR027]'
                      Flat = True
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F6FBF7F5FAF5F4FAF5F3FBF6F5FCF7F5F8
                        F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CECD93B1BC
                        9BB8C4AAD0DFA8CDDC9DB8C493B0BCB2ADABFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFF12B8D813BADF127F9E167C9B10A3DA0E9ED8FF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6C7CB
                        04C5E51D323644545800A7DE91B9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDDDC5C7174545C5DC7D2D7FFFFFEE1
                        E7EAB5FFFFFFFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFF4F36873746B6666D2C0BFCAD7DCB7FBFEB2FFFFB8C8CDC0C9CDF7F1F0FFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF67ACECC64D4D7A4F6FFA7F3FFA7
                        F4FFA7F4FFA9F6FFA9F6FF9DF3FFA1F2FFB6BDBFFBF5F4FFFFFFFFFFFFFFF9F6
                        90D1EFB7C7D1AEB9BF9BEAFF9DEBFF9DECFF9DEDFF9FF0FFA0F0FF9CEDFF96E8
                        FF98E8FFA6BBC3FFFFFFFFFFFF76D0F788D5F896DBF998DEFB99E1FC96E1FC8D
                        E0FE8CE0FE8AE1FF8AE1FF86DFFF86DEFF8BDFFF8AE1FFE9E1DFFFFFFF84D3F7
                        98DBF8A6E0FAA8E0FAA3E0FB9DE0FC8EDCFB89DCFC85DCFE81DCFE7BDAFE7CDA
                        FF84DCFF86DDFFCBD0D2FFFFFFCFEDFCD2EEFBD1EEFCCEEDFCBEE8FBB3E5FB9A
                        DDFA8ED9FA82D6FA7DD5FB76D4FC76D5FD82DBFF89DDFFE8E5E3FFFFFFB9E5F9
                        E3F4FCDFF3FCDBF1FCCEEDFCC2EAFCAAE1FA9EDEFA8FDAFA87D7FA7DD5FB7BD5
                        FC84DAFD87DFFFFFFFFEFFFFFFFFFFFFEAF5FBECF9FEF0FAFDE1F3FCD7F0FBC0
                        E9FBB4E4FAA5DFFA9FDFFA95DCFA8EDAFC9FD2E8FFF8F5FFFFFFFFFFFFFFFFFF
                        FFFFFFD2ECF9C5E9F9E5F6FDDFF3FCCAECFCBFE9FBAEE3FAA6DFFA86D5F894D1
                        EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton41Click
                    end
                    object Label142: TLabel
                      Left = 424
                      Top = 388
                      Width = 132
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Previs'#227'o Recebimento'
                      FocusControl = DBEdit71
                    end
                    object bt_alt_data_prev_rec2: TSpeedButton
                      Left = 665
                      Top = 384
                      Width = 23
                      Height = 22
                      Hint = 'Habilitar data previs'#227'o de recebimento - [CAR108]'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B00000001000000010000000000000084
                        0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                        52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                        9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                        A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                        B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                        BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                        DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                        FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                        0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                        2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                        31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                        363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                        2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                        443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                        4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                        3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = bt_alt_data_prev_rec2Click
                    end
                    object bt_limpar_data_prev_rec2: TSpeedButton
                      Left = 638
                      Top = 385
                      Width = 23
                      Height = 21
                      Hint = 'Limpar data previs'#227'o recebimento'
                      Glyph.Data = {
                        36040000424D3604000000000000360000002800000010000000100000000100
                        20000000000000040000130B0000130B00000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        000000000000000000000098FE7C0097FE4F0000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000098FE770098FFFF0096FEFA0099FF5000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        00000098FE770098FFFF0098FFFF0098FFFF0096FEF90099FF50000000000000
                        0000000000000000000000000000000000000000000000000000000000000098
                        FE7C0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF39A3E5D4C4BEB14F0000
                        0000000000000000000000000000000000000000000000000000000000000096
                        FE470096FEF70098FFFF0098FFFF0098FFFF33A2E9EDC2BEAEF5CCC7BCCFDBD8
                        CE4F000000000000000000000000000000000000000000000000000000000000
                        00000099FE490096FEF70098FFFF31A2E9EDC2BDAFF5CBC7B9EFDCD8CFFBCFCA
                        BFCCC4BEB14F0000000000000000000000000000000000000000000000000000
                        0000000000000096FE4739A4E7D5C2BEAEF5CCC5B9ECDCD8CFFBD1C9C0EFC3BC
                        AEFED3CEC4CDDBD8CE4F00000000000000000000000000000000000000000000
                        00000000000000000000C4BDAE46CCC7BCCFDCD8CFFBCFCCBFEDC3BCAEFED2CB
                        C1EFDAD6D0FF8A8AE0D07474E54F000000000000000000000000000000000000
                        0000000000000000000000000000DCD8CE49D0C8BECAC3BCAEFED1CDC0EDDAD6
                        D0FF9594DDF17373E5FF7373E5FA7272E5500000000000000000000000000000
                        000000000000000000000000000000000000C6BFB148D4CFC5CBDAD6D0FF9492
                        DEF17373E5FF7373E5FF7373E5FF7171E5F97171E64800000000000000000000
                        00000000000000000000000000000000000000000000DCD8CE498B8BE0CF7373
                        E5FF7373E5FF7373E5FF7373E5FF7373E5FF7272E57A00000000000000000000
                        00000000000000000000000000000000000000000000000000007272E5477171
                        E5F77373E5FF7373E5FF7373E5FF7272E39C7F7FFF0200000000000000000000
                        0000000000000000000000000000000000000000000000000000000000007272
                        E5477171E5F77373E5FF7272E39C7F7FFF020000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        00007373E3427373E5770000FF01000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = bt_limpar_data_prev_rec2Click
                    end
                    object DBEdit24: TDBEdit
                      Left = 176
                      Top = 40
                      Width = 73
                      Height = 21
                      Hint = 'Numero da conta do Plano de Contas'
                      DataField = 'N_CONTA_PLC'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 2
                      OnExit = DBEdit24Exit
                      OnKeyDown = DBEdit24KeyDown
                    end
                    object DBLookupComboBox4: TDBLookupComboBox
                      Left = 255
                      Top = 40
                      Width = 380
                      Height = 21
                      Hint = 'Nome da Conta do Plano de Contas'
                      DataField = 'N_CONTA_PLC'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      KeyField = 'N_CONTA_PLC'
                      ListField = 'DESC_PLC;N_CONTA_PLC'
                      ListSource = dtmContasAReceber.dsPCont
                      TabOrder = 3
                      OnExit = DBLookupComboBox4Exit
                    end
                    object Panel16: TPanel
                      Left = 19
                      Top = 61
                      Width = 622
                      Height = 78
                      Hint = 'Dados da Conta Selecionada'
                      BevelOuter = bvNone
                      Enabled = False
                      TabOrder = 4
                      object Label53: TLabel
                        Left = 75
                        Top = 9
                        Width = 76
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Grupo da Conta'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label54: TLabel
                        Left = 35
                        Top = 34
                        Width = 116
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Departamento da Conta'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label133: TLabel
                        Left = 75
                        Top = 60
                        Width = 76
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo de Entrada'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit25: TDBEdit
                        Left = 157
                        Top = 6
                        Width = 459
                        Height = 21
                        DataField = 'DESC_GR'
                        DataSource = dtmContasAReceber.dsPCont
                        TabOrder = 0
                      end
                      object DBEdit26: TDBEdit
                        Left = 157
                        Top = 31
                        Width = 459
                        Height = 21
                        DataField = 'DESC_DEP'
                        DataSource = dtmContasAReceber.dsPCont
                        TabOrder = 1
                      end
                      object Edit9: TEdit
                        Left = 157
                        Top = 56
                        Width = 459
                        Height = 21
                        CharCase = ecUpperCase
                        TabOrder = 2
                      end
                    end
                    object DBEdit27: TDBEdit
                      Left = 176
                      Top = 142
                      Width = 73
                      Height = 21
                      Hint = 'Data do caixa que a conta teve sua entrada'
                      DataField = 'DATA_REC_C'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 5
                      OnExit = DBEdit27Exit
                    end
                    object DBEdit30: TDBEdit
                      Left = 562
                      Top = 142
                      Width = 73
                      Height = 21
                      Hint = 'Data da venda'
                      DataField = 'DATA_VENDA'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 6
                    end
                    object DBEdit34: TDBEdit
                      Left = 176
                      Top = 250
                      Width = 199
                      Height = 21
                      Hint = 'Numero do Documento'
                      CharCase = ecUpperCase
                      DataField = 'N_DOC_C'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 12
                      OnExit = DBEdit34Exit
                    end
                    object DBEdit36: TDBEdit
                      Left = 562
                      Top = 250
                      Width = 73
                      Height = 21
                      Hint = 'Data de vencimento do cr'#233'dito'
                      DataField = 'DATA_VENC_C'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 13
                      OnExit = DBEdit36Exit
                    end
                    object DBEdit37: TDBEdit
                      Left = 176
                      Top = 303
                      Width = 73
                      Height = 21
                      Hint = 'Valor do cr'#233'dito'
                      DataField = 'VALOR_C'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 15
                      OnExit = DBEdit12Exit
                    end
                    object DBEdit38: TDBEdit
                      Left = 176
                      Top = 169
                      Width = 73
                      Height = 21
                      Hint = 'Codigo do Cliente'
                      DataField = 'COD_CLIENTE'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 7
                      OnExit = DBEdit38Exit
                      OnKeyDown = DBEdit13KeyDown
                    end
                    object DBEdit39: TDBEdit
                      Left = 255
                      Top = 169
                      Width = 380
                      Height = 21
                      Hint = 'Nome do cliente'
                      CharCase = ecUpperCase
                      DataField = 'NOME_C'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 8
                    end
                    object DBEdit40: TDBEdit
                      Left = 176
                      Top = 196
                      Width = 459
                      Height = 21
                      Hint = 'Razao social do cliente'
                      CharCase = ecUpperCase
                      DataField = 'RAZAO'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      Enabled = False
                      TabOrder = 9
                    end
                    object DBEdit41: TDBEdit
                      Left = 176
                      Top = 223
                      Width = 73
                      Height = 21
                      Hint = 'Codigo cliente terceiro'
                      DataField = 'COD_CLI_TERC'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 10
                      OnExit = DBEdit41Exit
                      OnKeyDown = DBEdit16KeyDown
                    end
                    object DBEdit42: TDBEdit
                      Left = 255
                      Top = 223
                      Width = 380
                      Height = 21
                      Hint = 'Nome do cliente terceiro'
                      CharCase = ecUpperCase
                      DataField = 'NOME_TERC'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 11
                    end
                    object DBEdit43: TDBEdit
                      Left = 176
                      Top = 358
                      Width = 73
                      Height = 21
                      Hint = 'Codigo Controle'
                      DataField = 'CODIGO_CTRL'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 18
                      OnExit = DBEdit18Exit
                      OnKeyDown = DBEdit43KeyDown
                    end
                    object DBLookupComboBox5: TDBLookupComboBox
                      Left = 255
                      Top = 358
                      Width = 284
                      Height = 21
                      Hint = 'Nome do controle'
                      DataField = 'CODIGO_CTRL'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      KeyField = 'CODIGO_CTRL'
                      ListField = 'NOME_CTRL'
                      ListSource = dtmContasAReceber.dsCtrl
                      TabOrder = 19
                      OnExit = DBLookupComboBox5Exit
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 176
                      Top = 412
                      Width = 73
                      Height = 21
                      Hint = 'Tipo de Documento de venda'
                      CharCase = ecUpperCase
                      DataField = 'TP_DOC_V'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      ItemHeight = 13
                      Items.Strings = (
                        'REQ'
                        'OS'
                        'MOT'
                        'NF'
                        'REC'
                        'PRE'
                        'CUP')
                      TabOrder = 22
                    end
                    object DBEdit45: TDBEdit
                      Left = 562
                      Top = 412
                      Width = 73
                      Height = 21
                      Hint = 'Numero do documento de venda'
                      DataField = 'N_DOC_V'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 23
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 176
                      Top = 438
                      Width = 73
                      Height = 21
                      Hint = 'Tipo de lan'#231'amento'
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'TIP_CNT'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      ItemHeight = 13
                      Items.Strings = (
                        'C'
                        'N')
                      TabOrder = 24
                    end
                    object DBEdit31: TDBEdit
                      Left = 176
                      Top = 385
                      Width = 199
                      Height = 21
                      Hint = 'Tipo Documento'
                      CharCase = ecUpperCase
                      DataField = 'TIPO_DOC_C'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 20
                    end
                    object DBEdit32: TDBEdit
                      Left = 562
                      Top = 438
                      Width = 73
                      Height = 21
                      Hint = 'C'#243'digo do vendedor'
                      DataField = 'CODIGO_VEND'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 25
                    end
                    object GroupBox5: TGroupBox
                      Left = 255
                      Top = 300
                      Width = 380
                      Height = 52
                      Caption = 'Replica'#231#227'o de Cr'#233'dito'
                      TabOrder = 17
                      OnExit = GroupBox5Exit
                      object Label60: TLabel
                        Left = 42
                        Top = 21
                        Width = 71
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Qtde a replicar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label61: TLabel
                        Left = 212
                        Top = 21
                        Width = 88
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dia de Vencimento'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object SpeedButton50: TSpeedButton
                        Left = 362
                        Top = 15
                        Width = 16
                        Height = 35
                        Margins.Top = 30
                        Align = alRight
                        Caption = 'v'
                        OnClick = SpeedButton50Click
                        ExplicitHeight = 52
                      end
                      object imgReplInformation: TImage
                        Left = 2
                        Top = 15
                        Width = 24
                        Height = 35
                        Cursor = crHelp
                        Align = alLeft
                        Picture.Data = {
                          055449636F6E0000010001001818000001002000880900001600000028000000
                          1800000030000000010020000000000060090000000000000000000000000000
                          00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000021
                          0000002700000000000000000000000000000000000000000000000000000000
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          00000000000000000000000000000000000000000000000000000023170B0088
                          27150286060400080E0700000F0800000F0800000F0800000F0800000F080000
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          000000000000000000000000000000000000000604000050492A0CC3BE9263FF
                          B4895BEE5D2F0033492702004122010041220100412201004222010042220100
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          0000000400000022000000450200005F1F0C0097774F26EBE0B98EFFFFECCBFF
                          C29667E0502700210A0600000000000000000000000000000000000000000000
                          FFFFFF00FFFFFF0003010000010000000000000000000000000000000000002A
                          150800844B2B0ACB805931ED9B754DF7BF986DFFEFCEA7FFFFE9CBFFFFE5C2FF
                          996F44E20000003A000000000000000000000000020100000301000003010000
                          FFFFFF00FFFFFF00030100000100000000000000000000040700005A573715CF
                          BC9468FFF5D8B7FFFFE7C8FFFFE8C8FFFFECCEFFFFEED2FFFFECCEFFFFE5C5FF
                          C8A176FF5E3D1BD70E0300730000000F00000000020100000301000003010000
                          FFFFFF00FFFFFF0003010000000000000000000D1A0A007F8A6337EFEFD1AFFF
                          FFF1DAFFFFEAD0FFFFE8CDFFFFE9CFFFF2D2B6FFBF7855FFE0B293FFFFEACEFF
                          FFEDD1FFF7D8B4FFAB8255FA2D17019F0000001B010000000301000003010000
                          FFFFFF00FFFFFF00010000000000000425100086A07446FCFBE2C6FFFFF4DFFF
                          FFEAD3FFFFEAD2FFFFEAD1FFFFEED6FFDDB296FF962300FF9A3109FFDDAF91FF
                          FFEDD2FFFFEBD0FFFFEED0FFCEA67AFF3B2004A5000000110201000003010000
                          FFFFFF00FFFFFF00000000031508004F956636F9ECD3B5FFFFF5E3FFFFEDD9FF
                          FFECD8FFFFECD7FFFFEBD6FFFFEFD9FFE8C7AEFF992B00FFA64C26FFA6502CFF
                          E9C5AAFFFFECD3FFFFEAD1FFFFF2D8FFCBA479FF291302800000000003010000
                          FFFFFF00FFFFFF0017090031623B11BBCEAB84FFF6E5D2FFFFF2E2FFFFEFDEFF
                          FFEFDCFFFFEEDCFFFFEEDBFFFFEFDCFFF7E1CDFF9F370AFFC5805AFFD6AB92FF
                          E6C5ACFFFFEED7FFFFEAD2FFFFEBD4FFFFEED5FFA0784DF00D05003600000000
                          FFFFFF00FFFFFF0046270772936A3FE9D7B998FFFEF1E3FFFFF3E4FFFFF2E3FF
                          FFF1E2FFFFF1E0FFFFF1E0FFFFF1E0FFFDEDDCFFC06F3FFFC97B49FFF9E5D2FF
                          FFF8E5FFFFECD9FFFFEDD7FFFFECD6FFFFF0DBFFF2D7B9FF4E2D0B9C0A00001A
                          FFFFFF00FFFFFF00673C0E98A88157F6D8BD9EFFFFF6EBFFFFF5E9FFFFF4E7FF
                          FFF3E6FFFFF3E5FFFFF2E4FFFFF5E6FFFCF1E5FFD9A079FFD88543FFF4DAC4FF
                          FFF5E6FFFFEFDFFFFFEFDDFFFFEEDCFFFFEEDCFFFFF3DDFF99754EDA321B0454
                          FFFFFF00FFFFFF007946109EB1895EF8D9BD9EFFFCF3E8FFFFF7EEFFFFF6ECFF
                          FFF6ECFFFFF5EAFFFFF8EDFFF6E7D9FFC58C72FFD5A587FFD47B32FFEFD0B5FF
                          FFF6EBFFFFF2E3FFFFF1E2FFFFF1E1FFFFF1E1FFFFF7E6FFC4A98CF1613C148C
                          FFFFFF00FFFFFF007D480E87AE8456EFD6B997FFF4E8DBFFFFFCF6FFFFF8F0FF
                          FFF8EFFFFFF8EFFFFFF9F0FFFAF5ECFFBD7D62FFA84E22FFC15F1EFFDAA889FF
                          FEF5ECFFFFF5E9FFFFF4E7FFFFF4E6FFFFF3E6FFFFFBEFFFDCC5ACFA855422A2
                          FFFFFF00FFFFFF00743E05479A6934D5D5B38EFFEAD8C3FFFFFEFAFFFFFAF5FF
                          FFFAF3FFFFF9F4FFFFF9F2FFFFFCF5FFFAF3ECFFBC7B5EFFA73D08FFC07D5CFF
                          FEF7EEFFFFF7EEFFFFF6ECFFFFF6ECFFFFF5EBFFFFFDF4FFDAC4ACF78554229B
                          FFFFFF00FFFFFF006B34000E82490C89CDA87FFFE2C6A7FFFAF2EAFFFFFEFBFF
                          FFFCF8FFFFFBF7FFFFFBF7FFFFFAF6FFFFFFFAFFFDF9F3FFDAB6A8FFE6CCC1FF
                          FFFAF5FFFFFAF3FFFFF8F0FFFFF8F1FFFFF8F0FFFFFCF5FFC7A98CEA82501B79
                          FFFFFF00FFFFFF007C4203007D410017A26F39E2E3C4A1FFEFDAC0FFFEFCF9FF
                          FFFEFDFFFFFDFAFFFFFDFAFFFFFCF9FFFFFBF8FFFFFFFFFFF1E1DBFFD6AFA0FF
                          FCF6F0FFFFFCF7FFFFFBF5FFFFFAF4FFFFFBF6FFFEF9F3FF9E6F3EC47D430731
                          FFFFFF00FFFFFF0083470500814503008345054AB78A59F6F0D3B1FFF7E5CFFF
                          FEFDFBFFFFFFFFFFFFFEFCFFFFFEFCFFFFFDFCFFFFFFFFFFCA9680FFB44B0AFF
                          E0C0AFFFFFFFFFFFFFFCF9FFFFFDFAFFFFFFFFFFD0B89DFF84480A527E430404
                          FFFFFF00FFFFFF00824605008246050084470700874B0C5DB98C5BF3F4D7B4FF
                          FDE9D0FFFFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D5CDFFD0936EFF
                          EAD5CAFFFFFFFFFFFFFFFFFFFFFFFFFFDBC9B4FF8D551B8B83480900874D0E00
                          FFFFFF00FFFFFF008246050082460500854909008549090083460543A47139D1
                          E2BE95FFFDE5C7FFFFF3E2FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF
                          FFFFFFFFFFFEFEFFF4EFE9FFBF9F7EF48A51157A85490C04864D0F00864C0E00
                          FFFFFF00FFFFFF00824605008246050085490900864B0B00864A09008042010D
                          894E0F77A9763ECFCFA679EEDFBC96FFE1C4A5FFE1CBB3FFE0CCB7FFDAC6B1F7
                          C7AB8FE5AD855BD08D571C958347082D84490A00894F1400864C0E00864C0E00
                          FFFFFF00FFFFFF00824605008246050085490900864B0B00874B0B0083460600
                          8346060C864A0A3E8E531486996126B7A57139D0A3713BCF99652DBA915A209A
                          8C551971864B0D3E7F42001484480900874D0F00894F1300864C0E00864C0E00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFCFF00FFF87F00FFE07F00FE007F00FC007F00F0001F00
                          E0000F00C0000700800007008000030080000100800001008000010080000100
                          8000010080000100C0000100E0000100F0000700F8000700FC001F00FE003F00
                          FFFFFF00}
                        Visible = False
                        OnDblClick = imgReplInformationDblClick
                        ExplicitLeft = 747
                        ExplicitTop = 74
                        ExplicitHeight = 144
                      end
                      object edQtdeReplicarCadastro: TEditHw
                        Left = 119
                        Top = 18
                        Width = 41
                        Height = 21
                        TabOrder = 0
                        Text = '0'
                        OnExit = edQtdeReplicarCadastroExit
                        Formato = fInteger
                        FormatSize = '0.0'
                      end
                      object edDiaVencimentoReplicarCadastro: TEditHw
                        Left = 306
                        Top = 18
                        Width = 41
                        Height = 21
                        TabOrder = 1
                        Text = '0'
                        Formato = fInteger
                        FormatSize = '0.0'
                      end
                      object ckbReplAlterarNumQdeParcelaCadastro: TCheckBox
                        Left = 42
                        Top = 49
                        Width = 303
                        Height = 25
                        Alignment = taLeftJustify
                        Caption = 
                          'Replicar alterando o n'#250'mero e quantidade da parcela do documento' +
                          ' atual selecionado'
                        Checked = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        State = cbChecked
                        TabOrder = 2
                        WordWrap = True
                        OnClick = ckbReplAlterarNumQdeParcelaCadastroClick
                      end
                      object ckbReplNaoAlterarNumQdeParcelaCadastro: TCheckBox
                        Left = 42
                        Top = 77
                        Width = 303
                        Height = 25
                        Alignment = taLeftJustify
                        Caption = 
                          'Replicar sem alterar o n'#250'mero e quantidade da parcela do documen' +
                          'to atual selecionado'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 3
                        WordWrap = True
                        OnClick = ckbReplNaoAlterarNumQdeParcelaCadastroClick
                      end
                    end
                    object DBEdit65: TDBEdit
                      Left = 176
                      Top = 13
                      Width = 73
                      Height = 21
                      Hint = 'C'#243'digo Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 0
                      OnExit = DBEdit65Exit
                    end
                    object DBLookupComboBox13: TDBLookupComboBox
                      Left = 255
                      Top = 13
                      Width = 380
                      Height = 21
                      Hint = 'Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      KeyField = 'COD_EMPRESA'
                      ListField = 'IDENTIFICACAO_EMP'
                      ListSource = dtmContasAReceber.dsEmpresasUnificadas
                      TabOrder = 1
                      OnExit = DBEdit65Exit
                    end
                    object DBEdit68: TDBEdit
                      Left = 176
                      Top = 331
                      Width = 73
                      Height = 21
                      Hint = 'Valor cont'#225'bil do lan'#231'amento'
                      DataField = 'VL_CONTABIL'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 16
                    end
                    object DBEdit64: TDBEdit
                      Left = 176
                      Top = 464
                      Width = 199
                      Height = 21
                      Hint = 'Nosso N'#250'mero Banco'
                      CharCase = ecUpperCase
                      DataField = 'NOSSO_NUMERO_BANCO'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 26
                    end
                    object DBEdit46: TDBEdit
                      Left = 562
                      Top = 464
                      Width = 73
                      Height = 21
                      Hint = 'Codigo do Funcion'#225'rio do Vale'
                      DataField = 'CODIGO_FUNC'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 27
                    end
                    object DBEdit44: TDBEdit
                      Left = 176
                      Top = 277
                      Width = 459
                      Height = 21
                      Hint = 'Historico do cr'#233'dito'
                      CharCase = ecUpperCase
                      DataField = 'HISTORICO_C'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 14
                    end
                    object GroupBox17: TGroupBox
                      Left = 253
                      Top = 294
                      Width = 382
                      Height = 60
                      Caption = 'Parcelas'
                      TabOrder = 28
                      object ListBox1: TListBox
                        Left = 2
                        Top = 15
                        Width = 284
                        Height = 43
                        Align = alClient
                        ItemHeight = 13
                        TabOrder = 0
                      end
                      object Panel69: TPanel
                        Left = 286
                        Top = 15
                        Width = 94
                        Height = 43
                        Align = alRight
                        BevelOuter = bvNone
                        TabOrder = 1
                        object BitBtn64: TBitBtn
                          Left = 0
                          Top = 0
                          Width = 94
                          Height = 21
                          Hint = 'Parcelas'
                          Align = alTop
                          Caption = 'Parcelas'
                          TabOrder = 0
                          OnClick = BitBtn64Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000430B0000430B000000010000000100008C5A5A009C6B
                            6B00A57B73000000840084848400B58C8C0039529C00395AAD004A6BBD005A73
                            C600C6C6C6006384CE00F7E7CE00F7EFDE00FFF7E700FFFFEF00FF00FF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101010070606
                            0606060606060607101010100805000000000000000000000710101008050D0D
                            0D0D0D0D0D0D0D000610101008050D040404040404040D000610101008050D0C
                            0C0C0C0C0C0C0D000610101008050D040404040404040D000610101008050D0D
                            0D0D0D0D0D0D0D010610101008050E0E030D0A03030A0E010610101009050F0F
                            030F030F0F030F010610101009050F0F030F0F0F0F030F020610101009050F0F
                            030F0303030A0F02061010100B0511030311031111111105061010100B051111
                            0311030303031105061010100B0511111111111111111105061010100B050505
                            050505050505050507101010100B090808080808080808081010}
                        end
                        object BitBtn65: TBitBtn
                          Left = 0
                          Top = 22
                          Width = 94
                          Height = 21
                          Hint = 'Apagar'
                          Align = alBottom
                          Caption = 'Apagar'
                          TabOrder = 1
                          OnClick = BitBtn65Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000430B0000430B00000001000000000000000000000000
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
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFD5D5D5D
                            5D5D5D5D5D5D5D5DFDFDFDFD5EE49B9B9B9B9B9B9B9B9B9B5DFDFDFD5EE4B767
                            67AFF6F6B76767665DFDFDFD5EE467676767A466676767675DFDFDFD5EE40867
                            676767676767679D5DFDFDFD5EE4F666676767676767EF9B5DFDFDFD5EE4F6F6
                            EF67676767EFF69B5DFDFDFD5EE4FFFF1667676767AFFF9B5DFDFDFD66E4FFB7
                            676767676767FF9B5DFDFDFD66E4B767676767676767B7E45DFDFDFD66A66767
                            67671667676767E45DFDFDFDA667676767B701F6676767675DFDFDFDA6A56767
                            16FF01010D1FB7A65DFDFDFDA6E4FFFFFFFFFFFFFFFFFFE45DFDFDFDA6E4E4E4
                            E4E4E4E4E4E4E4E45DFDFDFDFDA6665E5E5E5E5E5E5E5E5EFDFD}
                        end
                      end
                    end
                    object DBEdit71: TDBEdit
                      Left = 562
                      Top = 385
                      Width = 73
                      Height = 21
                      Hint = 
                        'Data previs'#227'o de recebimento utilizada para barrar / desbarrar c' +
                        'liente automaticamente'
                      DataField = 'DATA_PREV_REC'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      Enabled = False
                      TabOrder = 21
                      OnExit = DBEdit36Exit
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 472
              Width = 876
              ExplicitTop = 472
              ExplicitWidth = 876
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [CAR030] - [CAR031] - [CAR054]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar - [CAR029]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 876
          ExplicitHeight = 520
          inherited GroupBox3: TGroupBox
            Width = 876
            Height = 161
            ExplicitWidth = 876
            ExplicitHeight = 161
            object Bevel2: TBevel [0]
              Left = 746
              Top = 44
              Width = 57
              Height = 24
              Shape = bsLeftLine
            end
            object Bevel1: TBevel [6]
              Left = 552
              Top = 44
              Width = 194
              Height = 24
              Shape = bsLeftLine
            end
            object btSelectAll: TSpeedButton [7]
              Left = 751
              Top = 44
              Width = 23
              Height = 21
              Hint = '[ F2 ] - Selecionar todos'
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
              OnClick = btSelectAllClick
            end
            object btUnSelectAll: TSpeedButton [8]
              Left = 776
              Top = 44
              Width = 23
              Height = 21
              Hint = '[ F4 ] - Desfazer sele'#231#227'o'
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
              OnClick = btUnSelectAllClick
            end
            inherited imgInformation: TImage
              Left = 850
              Height = 144
              ExplicitLeft = 747
              ExplicitTop = 74
              ExplicitHeight = 144
            end
            object SpeedButton54: TSpeedButton [10]
              Left = 821
              Top = 43
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000007B00000084
                0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
              OnClick = SpeedButton54Click
            end
            inherited BitBtn1: TBitBtn
              Left = 408
              Hint = 'Clique para pesquisar - [CAR003] - [CAR004]'
              ExplicitLeft = 408
            end
            inherited BitBtn2: TBitBtn
              Left = 663
              ExplicitLeft = 663
            end
            inherited BitBtn3: TBitBtn
              Left = 489
              Hint = 'Novo cadastro - [CAR005] - [CAR006]'
              ExplicitLeft = 489
            end
            inherited CheckBox3: TCheckBox
              Left = 468
              Top = 71
              Width = 97
              Caption = 'Avan'#231'ado [ F8 ]'
              Enabled = False
              Visible = False
              ExplicitLeft = 468
              ExplicitTop = 71
              ExplicitWidth = 97
            end
            inherited CheckBox1: TCheckBox
              Left = 460
              Width = 92
              Caption = 'Adicional [ F9 ]'
              TabOrder = 12
              ExplicitLeft = 460
              ExplicitWidth = 92
            end
            object ckbNaoQuitado: TCheckBox
              Left = 257
              Top = 48
              Width = 111
              Height = 17
              Hint = 'N'#227'o Quitado'
              Caption = 'N'#227'o Quitado [ F6 ]'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 10
            end
            object ckbQuitado: TCheckBox
              Left = 368
              Top = 48
              Width = 88
              Height = 17
              Hint = 'Quitado'
              Caption = 'Quitado [ F7 ]'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
            end
            object groupAdicional: TGroupBox
              Left = 3
              Top = 70
              Width = 420
              Height = 85
              Caption = 'Pesquisa Adicional'
              TabOrder = 13
              Visible = False
              object Label109: TLabel
                Left = 6
                Top = 54
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Conte'#250'do'
              end
              object Label110: TLabel
                Left = 16
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label111: TLabel
                Left = 143
                Top = 54
                Width = 20
                Height = 13
                Caption = 'at'#233':'
              end
              object Label112: TLabel
                Left = 210
                Top = 27
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 59
                Top = 20
                Width = 145
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 59
                Top = 46
                Width = 187
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 2
              end
              object MaskEdit8: TMaskEdit
                Left = 173
                Top = 46
                Width = 75
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 61
                Top = 46
                Width = 69
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 264
                Top = 21
                Width = 133
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox12Exit
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
            object BitBtn12: TBitBtn
              Left = 570
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Ativar ou Desativar tela de Recebimento - [CAR032] - [CAR033]'
              Caption = '&Receber'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 14
              OnClick = BitBtn12Click
              Glyph.Data = {
                FE020000424DFE02000000000000FE0100002800000010000000100000000100
                08000000000000010000120B0000120B00007200000072000000FF00FF00036B
                0000005F00000A8C08000A8D0C001686190007720C0008750D0005760F0011A6
                1F0014A8230017AA280018AA28002396310021B2350027B53D001D90310031BF
                4E001A8F360037C256003DC65D0046CE6A0049D070004CD27400057C2E000670
                310006763500006C330000643200016B4400149C69000378500005745100047A
                6F000B88830075F4F9000081870061F7FF0063F3FB0071F4FA004EF1FF0037D6
                E80047EFFF0001788A00068496001FE3FF002AE5FF003DE9FF0000D8FF0011DD
                FF0013DEFF0024E1FF0000CFFB0001D3FC0002D2FC0006D4FF0026D9FC002FCE
                EE0043CBE50001C0EE0001BFEB0008C4F100057591000BC9F3001ECBF20020AE
                D20000C0F400007C9D002CA5C70000B6ED0000A8DA0000A1D3000097C8000379
                9C0008A3D300008EC1000194C6001191BE001993BD00198AB4000088BC00007F
                B3000495CC000484B6000674A1000B8ABB000B80B0001184B2001791C3001681
                AD001C84AF001F88B200208AB200007EB700007DB2000188C100017AAE000177
                AC000174AA00047FB3000678A9000C86BB000C7EAF000C78A8000F81B2000070
                A5000178B1000171A8000584C1000883BF00117EB300006398000B7BB6000000
                0000000000000000000000000000000000000006070707000000000000000000
                00000000050C09071F6F6F6F6F0000000000000000020D0A102C524B506F6F00
                0000000000001B0E0B1E2D37343B61690000006F6F6F24070F1229383F465160
                6B006F6807071D07130707073E5D514C3C5A6F58220117171514111C635E4A36
                30486F576D210417171619566541333247006F4E4D6C20031718546E44282F47
                00006F6764626A1A0843705C2726470000006F6655535F492B59005B47470000
                0000593A39403D42455900000000000000005923252A2E313559000000000000
                0000004F4F4F4F4F4F0000000000000000000000000000000000000000000000
                0000}
            end
            object rbCheque: TRadioButton
              Left = 558
              Top = 48
              Width = 92
              Height = 17
              Caption = 'Cheque [ F11 ]'
              Checked = True
              TabOrder = 15
              TabStop = True
              OnClick = rbChequeClick
            end
            object rbCredito: TRadioButton
              Left = 651
              Top = 48
              Width = 95
              Height = 17
              Caption = 'Cr'#233'ditos [ F12 ]'
              TabOrder = 16
              OnClick = rbCreditoClick
            end
            object CheckBox13: TCheckBox
              Left = 519
              Top = 80
              Width = 266
              Height = 53
              Caption = 'Apenas Cr'#233'ditos provenientes de controles de Retornos'
              TabOrder = 17
              WordWrap = True
            end
            object CheckBoxVerFormas: TCheckBox
              Left = 748
              Top = 17
              Width = 96
              Height = 17
              Hint = 'Ver Formas de Pagamento'
              Caption = 'Ver Formas (F8)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 18
              OnClick = CheckBox1Click
            end
          end
          inherited Panel1: TPanel
            Top = 161
            Width = 876
            Height = 359
            ExplicitTop = 161
            ExplicitWidth = 876
            ExplicitHeight = 359
            inherited Splitter1: TSplitter
              Top = 167
              Height = 188
              ExplicitTop = 169
              ExplicitHeight = 248
            end
            inherited DBGrid1: TDBGrid
              Top = 167
              Width = 583
              Height = 188
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OnCellClick = DBGrid1CellClick
              OnColEnter = DBGrid1ColEnter
              OnColExit = DBGrid1ColExit
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              OnMouseUp = DBGrid1MouseUp
            end
            inherited Panel2: TPanel
              Width = 872
              Height = 110
              ExplicitWidth = 872
              ExplicitHeight = 110
              inherited SpeedButton4: TSpeedButton [0]
                Left = 805
                Top = 39
                Enabled = False
                Visible = False
                ExplicitLeft = 805
                ExplicitTop = 39
              end
              inherited SpeedButton5: TSpeedButton [1]
                Left = 805
                Top = 23
                Enabled = False
                Visible = False
                ExplicitLeft = 805
                ExplicitTop = 23
              end
              inherited SpeedButton25: TSpeedButton [2]
                Left = 805
                Top = 28
                Enabled = False
                Visible = False
                ExplicitLeft = 805
                ExplicitTop = 28
              end
              inherited SpeedButton26: TSpeedButton [3]
                Left = 748
                Hint = 'Visualizar Cartas de Cobran'#231'a - [CAR065]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59
                  8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
                  598E5D598E5D59FF00FFFF00FF8E5D59AC7967EBB283FFC48BFFC48AFEC48AFF
                  C48BFFC48BFFC48AFFC48AFFC48BFFC48AFFC48AFFC48AFFC48AFFC48BFFC48B
                  FFC48BFFC48BFFC58BEBB282AC79678E5D59FF00FF8E5D59D9A784A67567F7C5
                  96FFCB98FECB98FFCB99FFCB98FFCB99FECB98FFCA98FECB99FECB99FFCB98FF
                  CB99FFCB98FECB98FFCB99FFCB98F8C596A67567D9A6848E5D59FF00FF8E5D59
                  FED4AAC2937EBA8A78FFD4A9FFD4AAFFD4AAFFD4AAFED4AAFED4AAFFD4A9FFD4
                  AAFED4AAFFD4AAFED4AAFED4AAFFD4AAFFD4AAFFD4AAB88A78C2937EFED4AA8E
                  5D59FF00FF8E5D59FEDEBDFBDABBAC8075D1AA95FEDEBCFFDDBCFFDEBCFEDEBC
                  FEDDBDFFDDBDFFDDBDFFDEBCFEDDBDFEDEBDFEDEBCFFDDBCFFDDBDD1AA95AC80
                  74FCDABAFFDEBC8E5D59FF00FF8E5D59FEE7D0FFE7D0F0D5C2A1756DE9CBB7FF
                  E7D0FFE7D0FEE7D0FFE7D0FEE7D0FFE7D0FEE7D0FEE7D0FEE7D0FEE7D0FEE7D0
                  E7CBB8A1756DEFD5C1FEE7D0FEE7D08E5D59FF00FF8E5D59FEF0E2FEF0E3FEF0
                  E2DDC5BBA37873F6E6DAFFF0E3FEF0E3FEF0E3FEF0E2FEF0E3FEF0E2FEF0E3FE
                  F0E2FEF0E2F7E6DAA37873DEC5BAFEF0E2FEF0E3FEF0E28E5D59FF00FF8E5D59
                  FEF8F2FEF8F3FEF8F2FFF7F3C5A7A3B5918CFEF8F3FEF8F3FEF8F2FEF7F2FEF8
                  F3FEF8F2FEF8F3FEF8F2FFF8F3B5918CC5A9A4FEF7F3FEF8F3FEF8F2FEF8F28E
                  5D59FF00FF8E5D59FEFEFEFEFEFEFEFEFEFEFEFEFCFBFBAD8987CCB5B4FEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECAB2B0AF8B88FCFBFBFEFEFEFEFE
                  FEFEFEFEFEFEFE8E5D59FF00FF8E5D59FEFEFEFEFEFEFEFEFEFCFBFBC7ADACAC
                  8884986B68986B68986B68986B68986B68986B68986B68986B68986B68C2A6A4
                  FCFBFBFEFEFEFEFEFEFEFEFEFEFEFE8E5D59FF00FF8E5D59FEFEFEFEFEFEF0EB
                  EAAD8986B4918FF4F0F0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEF4F0F0B4918FAD8986F0EBEAFEFEFEFEFEFEFEFEFE8E5D59FF00FF8E5D59
                  FEFEFEDCCCCAA07673CEB6B5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECEB6B5A07673DCCCCAFEFEFEFEFEFE8E
                  5D59FF00FF8E5D59C6ACAAA57E7AACACACFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE9DEDDA57E
                  7AC6ACAAFEFEFE8E5D59FF00FF8E5D59A18687A5E6E6ACACACFFFFFFFBFFFFFA
                  FFFFF6FFFFF6FFFFEFFFFFEFFFFFEFFFFFF2FFFFF2FFFFF4FFFFF6FFFFF4FFFF
                  EFFFFFE7F6F6D1E1E1B5B7B7B29D9D8E5D59FF00FF8E5D59A69598A7FEFFACAC
                  ACFEFFFFFBFFFFFBFFFFFBFFFFFFFFFFFFFFFFFFFFFFFBFFFFEEF7F7D5DEE0C1
                  CCCEB6BDBFADB4B5ACADADAAADAFA1AFB49AACB2A390928E5D59FF00FFFF00FF
                  8E5D59B89696ACACACFFFFFFFFFFFFFFFFFFE9EBEBCED5D7BDC5C6B1BABAAAAF
                  B0AAACADA3ADB097AFB589AFBA7EAFC073B1CC67BAE079AAC7A683898E5D59FF
                  00FFFF00FFFF00FFFF00FF8E5D59C69695ADB4B5ABBABAACACACA5B6B89ABABC
                  8FBFC581C9CF76D1DA6DD8E76ED8EB70D4EB72D1ED6FD7F76DD7FC91ADC28E5D
                  598E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D5997747299B6BB72
                  F0FB6BF6FF70EAFA72EBFB72EEFC74EFFF74F0FF75EDFE76E7FC6FEBFF77DAF4
                  9AA9B68E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF8E5D59B0959686D1D96BFFFF72F6FF74EFFF74EFFF74EFFF70F4FF6D
                  F8FF87CAD9B092968E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D5998BABF77EBF66DFBFF6DFB
                  FF6EF8FF75EEFB98BABF8E5D598E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D59
                  8E5D599DAFB295BBC19EADB08E5D598E5D59FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D59FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton26Click
                ExplicitLeft = 748
              end
              inherited SpeedButton1: TSpeedButton [4]
                Hint = 'Editar Registro - [CAR007] - [CAR008]'
              end
              inherited SpeedButton2: TSpeedButton [5]
                Hint = 'Apagar Registro - [CAR009] - [CAR010]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton [6]
                Hint = 'Emitir Relat'#243'rio - [CAR011] - [CAR012] - [BOL010]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton6: TSpeedButton [7]
                Left = 178
                Hint = 'Exibir Somat'#243'rio - [CAR013] - [CAR014]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000330B0000330B00000001000000010000424242008484
                  8400FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020000000000000000000000000002020202
                  0202020202020200000000020202020202020100020202020202020202020201
                  0000000102020202020202000202020202020202020202020100000001020202
                  0202020202020202020202020202020202010000000102020202020202020202
                  0202020202020202020201000000010202020202020202020202020202020202
                  0202020100000001020202020202020202020202020202020202020100000000
                  0202020202020202020202020202020202020100000001020202020202020202
                  0202020202020202020100000001020202020202020202020202020202020202
                  0100000001020202020202020202020202020202020202010000000102020202
                  0202020002020202020202020202020000000002020202020202010002020202
                  0202020202020200000000000000000000000000020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202}
                OnClick = SpeedButton6Click
                ExplicitLeft = 178
              end
              inherited SpeedButton7: TSpeedButton [8]
                Left = 292
                Hint = 'Hist'#243'rico Cliente - [CAR016]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFEFE
                  FFFEFEFFFFFEFFFFFEFFFFFFFFFFFFFEFDFFFAFAF9F6F4F7DFE2D9BDCBAE9EB0
                  858DA078ADB5A7F4F2F6FFFFFFFFFFFFFFFFFFFDFDFFFDFDFEFFFFFFFFFFFFFF
                  FFFFE1EFF3C0E5EEC5E6EFC4E7EFC4E7EFC0E7F5C1D5CEA3B7887B8E5986A65F
                  93C45F98C3658EB55C749D3E41711159754EB8CBCDE0E2D4CDC29EB59F70A885
                  5DB59B91E6E0E2FFFFFFB8E4ED63D9F16DDAF165D7EF62DBFA5FC4C983A74388
                  B84E9BB072B3C192A6CE7FACD088B1D08A9DBF7280AB4C47602C817E47B49E34
                  B69E31B28F27A26D0B7A2A00875034F2F4F6C3E8EF78DDF282DEF27ADCF075E0
                  FF7FC5A7ADCB6AA2CC79B1C193D6D5B8AED182ACCF88BFDAA2ACCE868CB95B6C
                  7642C9B37DC6B257C7B664C9B869BEA54FA87811864D0CDCDFE5C4E8EF7CDFF2
                  84E0F27DDEF17AE0FB76CFCFACC363AAD087AFC093D1C9C3BCD38DACD182B8D5
                  99ADD28794BB618A8C5DEFE7D2C1AA4DC7B465D3C584CAB96CB09022B5985CF6
                  F7F9C5E9F07FE0F489E3F382E0F27FDEF273E5FFA4B651CEDE9A93AE9144628C
                  345886A1BE74B1D786A3D0829CAD5EAA9A6DE6E5D7E3CF83C8B152D0C07CCBBA
                  6BA78D1CE2DCC1FFFFFFC7EAF184E3F58DE4F585E1F384E1F280DFF476E4FF99
                  D49791AC8249678D305583506865A0B7619DA864D1AD5EB6AD823F628A1A4D92
                  AC9D54CAB355BBA747BFB070F4F2EEFFFFFFC8EBF288E5F793EBF98CE9F988E3
                  F484E1F282E3F676DFFE4688B02A5A86224A723657697ADEE067D8FBA9C18AA2
                  A47A4D6D8C31557E435F72B99738C7B97EF2EFE7FFFFFFFFFFFFCAEDF38BE4F4
                  86D1DE7ECCD98AE1F189E4F586E7F773B9D4587CA55685AB4577A32D455B73D8
                  E076ECFF65DBFD5091AF3460892A557D254969E9D9B8FFFFFFFFFFFFFFFFFFFF
                  FFFFCDEEF58FE6F685C7D479BDC68EE2EF8FE7F78AE6F581B0CF89A8CA7CA3C4
                  6291B83C58772E2C247AE6F76DC1DE5C84AC5683AA4679A6284460CCC6C5FFFF
                  FFFFFFFFFFFFFFFFFFFFCFF0F693E7F673AAB663989E91DFEA95EBF78FE8F6A3
                  C2DAB0C6DD94B4D4739BBD4D86B525293359929A84CBEB88A3C67EA5C76491B6
                  406A8F352A22D7D7D7FFFFFFFFFFFFFFFFFFD0F0F599EDFB99E3F091D9E5A0F2
                  FF99EBFA91E9F7B1D0E3C9D7E6ACC7DF83ADD04C83B02D3744486062A6E4FEB1
                  C4D997B7D57AA2C35081AC1A364E7E7771FFFFFFFFFFFFFFFFFFD2F2F79AEAF9
                  6C99A5537F886FA2A49DEDFB99EEFC9ACBE3A4C1DE8AB1D36285A53C53652D1D
                  1348636AB2F0FFCCD9E7B3CDE589B0D34F85AF243E576A6360FFFFFFFFFFFFFF
                  FFFFD2F1F89EEEFB99DAE694D8E18ACAD5A2F3FF97DDE6382B2C484C533A3430
                  4D423950433D4D4C4C6FB6BD8DCBDEA3B9D288A7C36B8BA845688521140A6869
                  69FFFFFFFFFFFFFFFFFFD3F3F99FEDFB84B9C578AFB786BEC8A3EFFBA3F5FE91
                  B3B5797F8081848570777968797D81C4CB8DEBF15861685557614F535648413B
                  433B363C3D3EB0AFAFFFFFFFFFFFFFFFFFFFD4F4FA9EEBF887C0CB83BAC3A6EF
                  F7A5EFFDA2EEFBA4F7FF9CE2EC91D0D88FD3DD98EEFB99F7FF90E7F883B7BF6F
                  7777706D6B737271838383C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFD4F2F9A1F0FE
                  9FE1EBA0E4EDB1FEFFB5FFFFB2FFFFA9F6FFA3F0FDA1F2FF9FF1FF9BECFA97E8
                  F593E9F892EDFC87E1F099D7E2DDDEDFF4F3F3FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFD4F5FC9AE5F27EB1BC5F8D9848647155757659869287BEC2AAF7FFA2EDF9
                  A0ECF99DEBF89BEAF697E9F693E9F688E9F8A2EAF7FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFD3F3FA9FF1FFABF4FFB0F9FEB9FFFFB6FEFDB7FFFFAD
                  F9FFA6EFFBA5EEFBA3EDF9A1ECFA9FEBF79CEAF899EAF78DE7F5A5E6F5FDFDFE
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2F5FC9BECFC7BB3C06E9B9E6194
                  A35E7C7A88C4CCB4FFFFAEF9FFACF5FFADF8FFABF8FFA9F7FFA2F3FE9DECF792
                  EAF6A7E9F6FCFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3F4FB9AECFA
                  94D3DB8BC9CD90CECF92CDD494D7DA92CCD287BEC396D3D787C2CA86BCBF81BD
                  C28DCDD3A5F3FE95EAF6AAEAF7FCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFCEF4FC91EAFA83C4D375B5C17FC0C57BB5C789CED48CCBD37EBAC391D3D8
                  77B3C182BCBE7DBCC289CED3A1F4FE91EBF8A7EBF7FBFEFEFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFD9F4FBAFEDFDBBF4FFBEF6FFC0F9FFBFF6FFC3F8FFC4
                  F7FFC7F9FFC6F9FFC5F7FFC8FCFFC6FAFFC4F8FFBEF0F9B8EEF9CAF2F9FDFEFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton7Click
                ExplicitLeft = 292
              end
              inherited SpeedButton8: TSpeedButton [9]
                Left = 234
                Hint = 'Negativa Cliente - [CAR015]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000C40E0000C40E00000001000000000000000000000000
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
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDACACACACACACFDFDEF
                  EFEFEFEFFDFDFDFDFDFDFDFDFDACACF5F5F7F7F7F5EFEF4747474747EFFDFDFD
                  FDFDFDACACF5ECECECACE4A4EB4F4F4F4F4F4F4F4FEFFDFDFDFDFDACEBEDECEC
                  F409F4F49E4F474747474747474FEFFDFDFDFDE3ECF509ECF509F5F45647F6F6
                  F6F6F6F6F647A7FDFDFDFDE3ECF409EC090909095747F6F6F6F6F6F6F647A7FD
                  FDFDFDE3F4ECF6F5090909099E4F474747474747474F9DF708FDFDECF4ED08F6
                  F4090909F49E4F4F4F4F4F4F4F64B4A408FDFD08F5ED6565EDF4F4F4ECE35C47
                  4F4F4F476372B4B508FDFDFDF6F55C5C5CA4F4ECA3106A63636363636AAAF5B6
                  08FDFDFDFDA55C54535C5AED5A116A6A6A6A6A6A6A6AB5B508FDFDFDA4535C5C
                  5454FDFD59116A6A6A6A6A6A6A6AB5F508FDFD6464655D5C5C1C08FD59107B6A
                  6A6A6A6A6A6AB5B508FDFD64656565655C5CADFD6211BC6B6A6A6A6A6A6BF507
                  08FDFD64A6AEAEA6655D5C086A10B473736B6B6B6A6BF50708FDFDAEAEB7AEAE
                  655B52F76B18B4B4B3B3736B6B6BB5F508FDFDAFAFB7AEAE655B52A46B10BDB4
                  B4B4B4B3B373F7B508FDFDAFB7B7AFAE655252AD6B10BFBDB4B4B4B4B4B3F7B5
                  08FDFDF7F7A4A55C5B5252076A1008BDBDBDB4B4B4B4F7F508FDFDF7F7A4A49B
                  5B52A408621007BDBDBDBDBDB5B5B50808FDFDFDFDF707F7AD07FDFDB5AB07B5
                  B508BDBDBDB5B5B5FDFDFDFDFDFDFDF7F7FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
                OnClick = SpeedButton8Click
                ExplicitLeft = 234
              end
              inherited SpeedButton11: TSpeedButton [10]
                Left = 349
                Hint = 'Volta Cheque para o Ativo - [CAR017] - [CAR018]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000120B0000120B00000001000000000000000000000000
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
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD9B9B9B9B9B9B9B9B9A9A9A9A9A9A
                  9A9A9A9A9A9A9A9A9A9B9BFFFFFFFFFFF608F5F5F4F4F4F5F5F509F6F6F6F6F6
                  F69B9BFFFFFFFFFF08F5F4ECECECF4F5090909F6F6F6F6F6F69B9BFF08080809
                  ECECECECECECECECECEC0909E3E3E3E3EC9BE3FF9B9B9B9B9B9B9B0909090909
                  090909ECE3ECECECE39BE3FFFFFFFFFFFFFFFFFFFF09090909090909DBDBDBDB
                  E39BE3FF9B9B9B9B9B9B9B9B9B9B9B9B9B9BEC0909090909099BE3FFFFFFFFFF
                  09090909090909090909090909090909099BE3FF72FFFFB7B709090909090909
                  0909097109090909099BE3FFFF02FF5F5F5FFFFFFFFFFFFFFFFF7171FFFFFFFF
                  FF9BE3FF72FFFFFFFFFFFFFFFFFFFFFFFF717171FFFFFFFFFF9BE3E3E3E3E3E3
                  E3E3E3E3E3E3E3E371717171E3E3E3E3E39BFDFDFDFDFDFDFDFDFDFDFDFDFD71
                  717171FDFDFDFDFDFDFDFDFDFDFD71FDFDFDFDFDFDFD71717171FDFDFDFDFDFD
                  FDFDFDFDFD7171FDFDFDFDFDFD71717171FDFDFDFDFDFDFDFDFDFDFD71717171
                  7171717171717171FDFDFDFDFDFDFDFDFDFDFD717171717171717171717171FD
                  FDFDFDFDFDFDFDFDFDFDFDFD71717171717171717171FDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFD7171FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD71FD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
                OnClick = SpeedButton11Click
                ExplicitLeft = 349
              end
              inherited SpeedButton12: TSpeedButton [11]
                Left = 766
                Top = -12
                Hint = 'Envia M'#243'dulo de Transfer'#234'ncia'
                Glyph.Data = {
                  EE050000424DEE05000000000000AE0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000DE000000DE00000000000000FFFF
                  FF003E3D5400413F4D00828089002423250087828800372A3800FF00FF003834
                  3500413B3B002D2A2A0044404000413D3D00504C4C005B595900676666007342
                  41008E5D590051353300412B2900704641007F4F4A007A4D4800694541008F6A
                  6400A0675B00A7756B007D7A7900BC826800F2E7E200E6D4CB0086807D00F6EE
                  EA0079757300E5D1C600EBDED700F8EFEA00F4EBE600D0916C00D1926D00E9DA
                  D100EEE1D900EEE3DC00FAF2ED00F7EFEA00DA9D7500E6D8CF00E3D0C200FAF3
                  EE00E7AB7900F8D1AF00F7D1AF0095837300DAC6B4007B706600E6D4C400E0A5
                  6B00AF815400EFB17300F2B47600EDB074008F6B4600EDB17500926D4800A57B
                  5200956F4A00F2B77B00F2B87F00F2B88000F0B87F00F2BA8100F6D1AB00F7D1
                  AC00F6D1AC00F2CFAB00D1B29300F7D3B000F7D4B100B1A08F00CFBDAC00F2DE
                  CA00E1D0C000E2D3C400827D7800FAF4EE00EFB47600A67D5200F2BA8000F4CE
                  A500F4D0AA00EFD3B400F6DCC100B7A49000D1BCA600C2B09D00BCAB9900BBAA
                  9800EAD8C400F2E0CC00ADA09200A1958800DECEBD00F0E0CE00EEDECC00F2E2
                  D00089807600F2E2D100D0BCA500E3CFB800E2CEB700EAD7C000DECCB700EFDC
                  C600E9D7C100EDDCC700EDDDCA00D8C9B800EFE0CE006F696200EDE1D300E7D5
                  BD00EBD9C200E5D4BD00EBDAC400EEDECA009F968A00EFE2D1007A746C00EFE3
                  D400F7EFE500EEDDC500EBDAC200F2E2CA00EDDDC600EADAC400EBDCC600F2E3
                  CE00E7D9C400EEE0CC00EEE1CF00F4E7D500CCC2B400F7EEE100F8F2E900EEDE
                  C500F3E5CF00F4EADA00F3E9D900F0E1C600F0E1C700F7EBD700EDE0C700F3E6
                  CB00F7F6F000F6F7F600B7B8B8008FE2F000A5E6F2007BD9ED00BCEAF30077D4
                  EE00B4E5F3006FCBEB006FC5E5006CCEF400B2E6FA0067C0E90060BFEF00ABDE
                  F70058AADA005EA4CE0088B0C90055B0EB0059A1D3004BA1E600478AC2005097
                  D0004193E1003686DD003B73B000467DBA004C82BA004F7EAF00436489004966
                  8A002D77D8004074B700648BBC005778A3008298B5003B5781004A6C9C004C6F
                  9F0050678A005974A40058698B0024428300324674003B528E0044528100555E
                  82001F2550001E214B001B1C45009F9FB500A3A3B800A6A6BB00A9A9BC001F1F
                  210076767700ACACAD00FEFEFE00FCFCFC00FAFAFA00EDEDED00EAEAEA00A7A7
                  A7007373730072727200626262003A3A3A000808080808080808080808080808
                  0808080808080808080808080808080808080808080808080808080808080808
                  0808121212121212121212121212121211080808080808080808123897928985
                  96959596969699791108080808080808080812308D768B7D737C7C7A847A916D
                  11080808080808080808122393817F8C68748887877A836D1108080808080808
                  08081A1F8F4E444745584546434B986D110808080808080808081A2F825C334D
                  344A485A595B866E110808080808080808081A2990946B69676351716F7B8A70
                  160808080808080808081B2455493B3F563C3C3D394C8E501708080808080808
                  08081B2A557852756662723660657E64150808080808080808081D2B9A535F4F
                  616C5E5D3537806A180808080808080808081D1E9BC33A404241573EBFC60277
                  130808080808080808082826D6BCC306205422BFABAACA031408080808080D0B
                  0B0B2821D5C8A0BE041CBFA4BFAEB0CB070808D2DDDD0D05D10A2E2DD4CDC9A0
                  ACBFA1BFA5BFB1B4CCCCCCD2D3D30D090A0A2E2501D4CEC49EBDBFA3BFA8BFAF
                  B2B3BAD2D9D90D0D0C0C322C0101D4CFC29DC1BFA7BFADAFB2B3BAD29C9C0D0E
                  0E0E3231010101D4D0B99FC0A7A8ADAFB2B3BAD2D7D80D0F0F0F322828282828
                  2719B8A2A5A8ADAFB2B3BAD2D7D70D101010080808080808080808BFA6A9ADAF
                  B2B3C5D2D7D70DDBDBDB0808080808080808080808B7B6B5BBC708D2D2D20DDA
                  DCDC08080808080808080808080808080808080808080D0D0D0D080808080808
                  080808080808080808080808080808080808}
                Visible = False
                OnClick = SpeedButton12Click
                ExplicitLeft = 766
                ExplicitTop = -12
              end
              inherited SpeedButton23: TSpeedButton [12]
                Left = 405
                Hint = 'Marcar Baixa para Devolu'#231#227'o - [CAR021] - [CAR022]'
                Glyph.Data = {
                  32060000424D3206000000000000F20300002800000018000000180000000100
                  08000000000040020000120B0000120B0000EF000000EF00000000000000FFFF
                  FF00B7B6E200605BAF005549CD00716BB400B9B6DB006B63AC007D70AC007967
                  AD00A298C100C1B6D0009A83A400AC97B200BBA9BF00FF00FF00FCFAFB00A87C
                  7800AA7F7A00AA807B00AA817C00AF857E00F7F1F000B4898000BA8C8100BF91
                  8600BE908500BF928700BF938800BA897C00AF817500BE958900C2938400BE91
                  8300BD928400BC918300BD938600BE928300FEFBFA00FCF9F800FBF8F700C598
                  8600C4978600CB9D8900C89B8700D2A38B00CDA08900DEBBA900DEBFB000D7A7
                  8C00D4A58B00DCA88700DEAD8E00DCAC8E00D9A98C00CE9F7E00FDFAF800FCF9
                  F700C1865800FBF5F000D7A27400F6E5D600D99C5F00FCDFC200F9E6D300FEFB
                  F800DD984C00E5B98900E6BB8B00FFE0BE00FDE3C800FAE2C900FEE7CD00FFE9
                  D200FDECDA00FCEFE100F4CC9B00FFDDB400FFE0BA00FFE3C300FFF1E000FDF4
                  E900FFD59D00F8B35200F6C07600F2BE7500FFD8A200E6C28700FFEACA00FFDB
                  9C00FFE0AB00FFE5B900FFE9C200FFFEFC00FFEBBF00FFF2D500A4987900FFFB
                  E400FFFDEF00FFFEF600ADAE6800FFFFF300FFFFF900FFFFFE008299550085A1
                  55007EA2510075954E006B9A4300B9D8A10045923300CDE5C700248719002F75
                  28002B9329007EB47E000370080005710A0008750E002C9A350039BD450039A5
                  4300047D1100158D230046CF5D0026A63E002AAC42002DB646002FAE46008EBE
                  97000C7B220019AC390026AA420035C3540035C253002BBC4E002EB24D002587
                  3C003AC95B003CCC5E003BC85C003CC95D002DBB510036C45B003ECA610041CF
                  650041CE660045CF69001D943D0033BE580046D36C004AD872004DDA750050DB
                  770053DE78004AD773004ED9780050DA7B0052DD7C0049D8760055E084005CE8
                  8E0018814C00238E56003F685C001D6C6D00579296007CA5AC00065C7500D0D5
                  D800004A8100EBF1F8001E53FF002659FF00285CFF002A5FFF003064FF00839E
                  EF00093DFF000E41F6001246FF001549FE001646F500194CFF001C4EFF002153
                  FF00285AFF002B5CFF003460FF00416BFF005C82FF007E9BFF0088A3FF000031
                  FF000032FF000031FC00002FEC000236FF000639FF000938F3000C3FFF000A2C
                  B1001041FF00133BE7001848FF001E4BFF002048EB002752FF006583FC00002A
                  FF00002DFF00002FFF00133FFF001234DC00163BE300173CE300183FE8004F6F
                  FF000028FF000026FC000026F2000221D8002744DB0095A6FF00001DDF00051E
                  C4001C33C900D5D9F7003B4AC8004354D500434FC600303AD200434ABD008488
                  D7009397DB00777ACF00A5A7E0008E8ECF00EAEAFB000F0F0F0F0F0F0F0F0F0F
                  0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F717A
                  0F0F0F0F0F0F111111111111111111111111111111117583750F0F0F0F0F1247
                  584F4E4D5A5A595259565257646A758786750F0F0F0F1247484F455B2F0C0703
                  09606C7784878F8D8A86750F0F0F124049585C0DC9E0DBD2C9828E9F9B969290
                  8C8A857B0F0F12404A4805DDD3DAD9A79499A09D9C9B9692908D8B7E750F134A
                  610AE0C2D1D0A9729EA19A7C787F959392917D760F0F144B50E6C3C2CDEE7388
                  A080A2A8AAA46E8F977E750F0F0F1551A9D5B4B2CFD0A39879A7C7D2DA04698E
                  7D740F0F0F0F176206CBB7B5C8C4A3806DDFD1C2C2E76B7A750F0F0F0F0F1863
                  06D8B9B8CCB17789B1D4D3C2C1E768750F0F0F0F0F0F2363E3DEAEB9BDAB70A5
                  B4CAC6C5D2E84C200F0F0F0F0F0F204110E5ADBABDAB6EA6EEBFC5B2DC085A25
                  0F0F0F0F0F0F292801ECD6B0BBC0816FE3BCB4C8E2304D220F0F0F0F0F0F2B28
                  0167EBD5B0AFBEBFADACB5E10D5E4D240F0F0F0F0F0F2E3901015DEADECEB6B3
                  B6D7E40E584F451F0F0F0F0F0F0F2D3901010167EE02E9E9ED0B3D5F48463F1F
                  0F0F0F0F0F0F3139010101010101676665611A1A191A1A1E0F0F0F0F0F0F3527
                  010101010101015D635118373C3E423A0F0F0F0F0F0F34380101010101010101
                  673B1B4454533A0F0F0F0F0F0F0F3438010101010101010101281C43553A0F0F
                  0F0F0F0F0F0F343B263838272739392827161B433A0F0F0F0F0F0F0F0F0F3334
                  34343536322D2B2C2A211D3A0F0F0F0F0F0F0F0F0F0F}
                OnClick = SpeedButton23Click
                ExplicitLeft = 405
              end
              inherited SpeedButton24: TSpeedButton [13]
                Left = 462
                Hint = 'Detalhes do Recebimento - [CAR023] - [CAR024]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFE8E9EAE0E0E1E0E1E2E0E1E2E0E1E2E0E1E2E0E1E2E0
                  E1E2E0E1E2E1E1E2E1E1E2E1E1E2E1E1E2E1E2E2E1E2E2E1E2E2E1E2E2E1E2E2
                  E1E2E2E1E2E2E1E2E2E1E2E2E0E1E2EFF0F0D2C9C2E4DDD7E2DAD4E2DAD4E1DA
                  D3E1D9D3E1D9D3E0D9D2E0D9D2DFD8D2E0D8D2DFD7D1DFD8D2DED6D0DDD5CFDD
                  D5CEDDD5CFDCD4CEDCD4CEDCD4CEDCD4CEDDD5CFD6CCC5D8D4D1DAD4D0FFFFFF
                  FBFCFCFAFBFCFCFEFFFBFCFDF8F9F9F8F9F9F7F7F8F6F7F8F6F6F7F5F5F6F5F5
                  F6F4F5F5F4F5F5F3F4F5F3F3F4F2F4F4F2F2F4F2F2F3F2F2F3F3F4F5E3E0DFDA
                  D5D2D9D3CFFDFEFEF9F9F9F7FAFEE0D7C9E6E8EBF9F9F9FAFBFBFBFCFBFAFBFB
                  F9FAFAF9FAFAF8F9F9F8F9F9F7F8F8F7F8F8F6F7F7F6F7F7F6F7F6F1F1F2EFEF
                  EFF1F2F2E2DFDDDAD5D2DAD3CFFDFEFEFCFDFFE2D8C8BB7813BA9965FFFFFFC4
                  B7B9C1B2B4C0B3B5C0B3B5C0B2B4C0B2B4BFB1B3BFB2B3BEB0B2BFB1B2BDB0B2
                  BAACAEE2DEDFF1F2F1F1F1F2E2DFDDDAD5D2DAD4CFFEFFFFFBFCFDECE2D4F3F9
                  FFD3A85EE3E0DBFEFFFFFBFDFCFBFCFCFAFBFBFAFBFBF9FAFAF8FAFAF8F9F9F7
                  F9F8F7F8F8F6F8F8F5F7F7F2F3F3F0F0F0F1F1F2E2DFDCDAD5D2DAD3CFFEFFFF
                  FAFAFAFCFDFEFFFFFFFFFFFFD6B568F3F6FDF7F7F7F5F5F5F5F6F6F4F4F4F4F4
                  F4F3F3F4F3F3F3F3F3F3F2F2F2F2F2F1F1F1F1F0F0F0F0F1F1F1F2F2E2DFDDDA
                  D5D2DAD4CFFFFFFFFBFBFBF8FCFFCEB289DCDBDCFBF6E0EFEAD6FDFFFFFCFDFD
                  FBFCFCFAFCFCFAFBFBF9FBFAF9FAFAF8F9F9F8F9F9F7F8F8F7F8F8F3F3F3F0F0
                  F0F2F3F3E2DFDED9D5D2D9D3CFFFFFFFFDFFFFDDC5A3CC994DB78B44FFFFFFC7
                  BBBEC2B4B6C2B4B6C2B4B6C1B3B5C1B3B5C0B3B5C0B2B3C0B2B4BFB1B3BFB2B3
                  BBACAEE4E0E0F2F3F3F2F2F3E3E0DED9D5D2D9D3CEFFFFFFFCFDFCF6F7F9F7FF
                  FFE2C48DD9CDB7FFFFFFFDFEFEFDFEFEFCFDFDFBFDFDFBFCFCFAFBFBFAFBFBF9
                  FAFAF9FAFAF8F9F9F7F9F9F3F3F3F1F2F2F2F2F3E3E0DED9D5D2D9D3CEFFFFFF
                  FBFBFCFEFEFEFFFFFFFFFFFFE0C174EEF0F0FCFDFEFAFAFAFAFAFAF9FAFAF8F9
                  F9F8F9F9F7F7F7F7F7F7F6F7F6F5F6F6F5F6F5F3F3F3F1F1F1F3F3F3E3E0DFD9
                  D5D2D9D3CFFFFFFFFEFEFEF3F9FFB27519C5B9A8FFFFFFDED4C6E3DEE0E2DDDE
                  E2DCDDE1DBDCE1DBDCE0DADBE0DADBDFD9DADED9DADED8D9DCD6D6EDEBEBF2F3
                  F3F3F3F4E4E1DFD9D5D2D8D2CDFFFFFFFFFFFFDFC6A0EDDDC5C18D37FAFFFFE2
                  DDDFDFD8D9DED8D9DFD8D8DED7D8DDD6D7DDD6D7DCD5D6DBD5D6DBD5D5DAD4D4
                  D9D1D2ECEAEAF3F3F4F3F4F4E4E1DED8D4D0E2DFDEFFFFFFFDFDFDFCFEFFF4F7
                  FEF1E5CFD1B783FFFFFFFCFDFDFCFDFDFBFCFCFBFBFCFAFBFBF9FAFAF9FAF9F8
                  F9F9F7F8F8F7F8F8F6F7F7F4F4F5F2F2F2F4F4F4E5E2E1E3E4E4E1DEDDFFFFFF
                  FDFDFDFEFEFEFFFFFFFFFFFFF3DFA4EAE6D7FFFFFFFDFEFDFCFDFDFCFDFCFBFB
                  FBFBFCFBFAFAFAF9FAF9F9FAF9F8F8F8F7F9F8F4F5F5F3F3F3F4F4F4E5E2E0E3
                  E3E3DEDBD9FFFFFFFEFFFFF7F5F5DBD3D4DDD5D7DED8DDDDD5D4DCD5D6DBD4D5
                  DBD4D5DAD3D4DBD3D4DAD2D3DAD2D3D9D2D3D8D1D2D9D1D2D6CECFEDEAEAF4F5
                  F5F4F5F5E6E2E1E1E0E0DEDAD8FFFFFFFEFEFEFAF9F9E8E3E4EAE5E6E9E5E5E9
                  E4E5E8E4E4E8E3E4E7E3E3E7E3E3E6E2E2E6E2E2E6E1E2E5E0E1E5E0E1E4DFE0
                  E2DEDEF0EEEFF4F5F4F5F5F6E6E2E1DFDEDEDFDCDAFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFDFEFEFCFDFDFCFCFDFB
                  FCFCFAFBFBFAFBFBF9FAFAF7F8F8F6F7F7F7F7F8E7E5E3DFDFDED7D2CFEFEDEC
                  EDEBEAECEAE9EDEAE9EDEAE9ECEAE9EDEBEAECEAE9ECEAE9EBE9E9EBE9E8EAE9
                  E8EAE8E7E9E7E7E8E6E6E8E6E5E7E5E4E7E5E4E7E5E4E6E4E3E7E5E5D9D4D2E0
                  E0DFEFEEEDFAF8F7F7F5F3F4F2EFF2EEEBEEEAE7EBE6E2E8E2DDE5DED9E3DBD5
                  E1D9D3DFD7D1DFD6D0DFD6D0DFD7D1E1D8D3E2DAD5E5DFDADBD3CFDDD5D1DCD4
                  D0DBD3CFE5DDDAE5E5E5F4F4F4F2F2F2F2F2F3F3F3F3F3F3F3F3F4F4F4F4F4F4
                  F4F5F4F5F5F4F5F6F5F5F6F5F5F6F5F6F6F5F6F6F5F6F6F5F5F6F5F5F6F4F5F5
                  F5F5F6F4F5F5F4F4F4F4F5F5F3F4F4FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton24Click
                ExplicitLeft = 462
              end
              object btDataRealBaixa: TSpeedButton
                Left = 577
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Informar data real da Baixa - [CAR026]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFCFDFEFAFCFDF8FAFBF6F9
                  FAF2F5F6EDF1F2E8ECEDE3E7E8DCE2E3D5DCDDCCD1D2C6C9CABEC0C0CFD1D1FF
                  FFFFBEA79AA8A6A5AAA7A5A6A3A0A39E9AA19A96A095909D918C9D8D879D8A82
                  9C867E9C837A9E7F759C7A6FA0796EA2796EA3776CAF7C71BD7E72E7C0BBEBC2
                  BDF0C5BFBCAAA7FFFFFFBD754EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  F7F3F1CA9688EBC6C1F1CCC7C0ADABFFFFFFBE805DFFFFFFF8EEECDBABAFE1BD
                  BFD5A1A0DFBCBDD6A7A8DDBBBEE0BEC2D4A5A9E0C3C6D9B5B9CC9389D4A39BC6
                  8B83D2A49ED2A7A1C68D8ACA9489DCBDAFE7BCB7C1AFACFFFFFFC18560FFFFFF
                  F9EFEEE3B9B6F0E4E7DFB6B3EBD5D6E7CFD2E4C3C0F1E7ECE0BEBDE9D6D5EFE4
                  E7DFBCAFE8CEC4D8B2A8E7D2C8E8D3C9D9B5ADE7D1C7EFD8C5EEDCD5B39B97FF
                  FFFFC38B67FFFFFFFBF7F7C86541E1B9B7CF8470D28F7DDEB9BBC46949E0C0C1
                  CA8879CC8975E1C6C8D19A8CD6AB9ECB9588D6ACA0D5ABA1CB968CD6AEA4D6AF
                  AAFFFFFFDAD3D0CECFCFC5916EFFFFFFF8EDEAF0E4EAF3E9ECE8CCCEF5F0F5E8
                  CDCEF3F0F6F2ECEDE9D5D6F8F8FDEEDEDDF2EAEBF8F5F8EBD7DCFAF9FFFAF9FE
                  E9D9DEFAFAFFEDDFE2FFFFFFFFFFFFCCCBCAC79674FFFFFFF9F1F0E0AB99F1E1
                  E3E0B4A8E8CAC3EAD6D7DEB3A1F2EBECE0BBB2E7CBC2F3E9E9D9AD9BF4EBEFDF
                  C0BAE4C8BFFCFFFFD09F92F1E6E8EEDFE2FFFFFFFFFFFFCCCBCAC89B7AFFFFFF
                  FBF5F5D2805DE5C4BDD5947EDBA491E1BFB9CF8766E5CAC6D39986D5A18AE5CC
                  CAC68061E3C6C2D1A091CE9682EFE0E1BC7559DDBDB6E4CBC9FFFFFFFFFFFFCC
                  CBCACBA181FFFFFFF9EDE9F3EBEEF5EEEEEBD4D2F6F4F8EAD5D0F8F7FDF6F1F2
                  EDDBD7FBFAFDF0E4E4F6F1F7FCFBFFEDDEDFFFFFFFFBF7FAF0E4E7FEFEFFEFE0
                  DFFFFFFFFFFFFFCCCBCACCA689FFFFFFFAF3F1DEA080F4E7E5E1B19DE7C6B4F0
                  E0DFDBA586F6EFEDDFB8A4E4C3B0F6EEF4D5A080F5ECEFE1C0B2DFBAA5FFFFFF
                  CB9476F1E4E0F3E8E7FFFFFFFFFFFFCCCBCACDAB8EFFFFFFFBF4F2DC9C7DEBCD
                  C5DDA68EE3B8A5E5C3BADAA484EAD1C8DAAB96DEB5A2E8D0CCD39E80E9D1CAD9
                  AF9DDBB39FF1E4E3CA9377E6CEC6E7D1CCFFFFFFFFFFFFCCCBCACFAF93FFFFFF
                  F8EEE9F7F2F4F9F5F4F0DBD5FBF9FDEFDCD3FAFAFDF9F5F7EFDFDDFEFFFFF3E8
                  EAFAF7FCFDFCFFF2E5E3FFFFFFFFFFFFF5EEEFFFFFFFF3E9E6FFFFFFFFFFFFCC
                  CACAD0B59BFFFFFFFBF5F4DC9362F5ECE6E1AE8EE7BFA4F4E8E5D79662F6F0F0
                  DFB498E0B898FAF7FDCE8F5BF7EFECE1C0A9D9AE8AFFFFFFC38453F3E8DFF6EE
                  ECFFFFFFFFFFFFCCCACAD1B9A2FFFFFFFCF4F3E0A57DEAC6B0E0AB89E5BC9FE3
                  BAA2E5BFA9EDD8D0E1BAA6E8CBBAEBD2C8E0BBA3EFDDD5E1C0AEE8CEBDF2E7E2
                  DAB39BEDDCD3E9D6CDFFFFFFFFFFFFCBCAC9D3BEA8FFFFFFFAF1EEEED0B4F1DC
                  C6E9C6A9F2DFCBEAC8AFFDFFFFFCFAFFF2E3DFFFFFFFF6ECE8FEFFFFFFFFFFF6
                  EEEAFFFFFFFFFFFFF9F3F3FFFFFFF5ECE7FFFFFFFFFFFFCBC9C8D5C2ADFFFFFF
                  FAF0EBECCEAFF1DAC2E8C3A4F2DDC8ECCDB5D79254FAF6F8E0B38EE1B58EFFFE
                  FFCC8947FAF6F1E2C0A2D8AB7EFFFFFFC37F42F3E5DBF6EEEAFFFFFFFFFFFFCB
                  C9C8D8C7B3FFFFFFFEFEFEF5E2D4F5E4D8F5E3D7F5E4D9F4E3D8F4E1D6F5E6DD
                  F3E3D8F3E3D8F4E6DEF1E1D4F3E5DDF2E3D9F1E1D7F3E6DFEFDFD4F1E3DBF4E9
                  E4FFFFFFFFFFFFCBC9C8DCCDBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBC9C8E0D2C1FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBC9C8E4D8C9FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
                  CAC9E3D5C3EBD9C5EAD8C4EAD8C5EAD8C5EAD8C4E9D7C3EAD7C4EAD6C1EAD6C0
                  EAD5BFE9D4BEE9D4C0E7D5C2E6D3C1E5D2C1E5D2C2E5D2C3E4D1C1E4D1C2E3D0
                  C0E3D0C1E5CEBDC6C6C6EAC294D17812D37F21D28025D18128D0812DD28838D2
                  8B42D89E63E0B184E4C19DE2BB95D9AB7CD19A65CA8D54C98C55C58850C9925F
                  C99466CA976DCB9B74CEA07CD1A482C7C4C1F0D6B7DE9C50DFA25DDFA35FDEA4
                  62DDA365E2B079DFAC76E4BC91EACBABEDD4BAEACEB1E4C2A0DEB68EDAAF85D9
                  AF86D8AE86DEBB99D9B491DAB798DBBA9EDDBDA3DFBEA5E7E5E3}
                ParentShowHint = False
                ShowHint = True
                OnClick = btDataRealBaixaClick
              end
              object SpeedButton41: TSpeedButton
                Left = 519
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Observa'#231#227'o sobre o cr'#233'dito - [CAR027]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F5FCF7F6FBF7F5FAF6F4FAF5F4FAF5F3FA
                  F6F4FBF6F5FCF7F5FBF7F6F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CECD86A9B493B1BC9BB8C4A4C1
                  CCAAD0DFA8CDDCA7C2CD9DB8C493B0BC87A9B7B2ADABFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F660B1C3
                  0FC2EC18BBE712C1F41D4D5B3E647115B4ED1CADE210ADE75DACCAEBE3E0FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFEDD7D312B8D813BADF11BCE7127F9E167C9B0DADE410A3DA0E9ED8
                  D4C4BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6C7CB04C5E514CAF01D323644545809
                  B9ED00A7DE91B9C9FAF3F1FFFFFFFFFFFFFCF9F8FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEC53D7E32EE6
                  FC364E5248595C14CAF22FBAE0F1DBD5FFFFFFFFFFFFE2ECEEABCBD1FFFBFBFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFDBDDDC15EFFF5C7174545C5D16D8F7C7D2D7FFFFFEFFFFFFE1E7EAB5FF
                  FFA9D6DEFFFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFF4F361E1E76873746B666666E3F3D2C0BFCAD7DC
                  BDD4DAB7FBFEB2FFFFA6DBE6B8C8CDC0C9CDDBD5D5F7F1F0FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D4D212D4DA15D6E0C2
                  C0C1AEFBFFB3FFFFB1FEFFB1FCFFB0FAFFA9F9FFA7FAFFACFAFFA2EBF9A3D1DC
                  B3C1C6E5DDDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6C4D9
                  E77ACECC64D4D7A5DAE7A4F6FFA7F3FFA7F4FFA7F4FFA7F4FFA8F5FFA9F6FFA9
                  F6FFA4F5FF9DF3FFA1F2FF9DD7EBB6BDBFFBF5F4FFFFFFFFFFFFFFFFFFFFFFFF
                  FFF9F690D1EF67D3FFB7C7D1AEB9BF91EBFF9BEAFF9DEBFF9DECFF9DECFF9DED
                  FF9DEEFF9FF0FFA0F0FF9FF0FF9CEDFF96E8FF90E4FF98E8FFA6BBC3F7F2EFFF
                  FFFFFFFFFFFFFFFD99D5F070D0F980D3F883D8FC8CDFFF93E2FD95E4FE95E4FF
                  94E4FF94E5FF93E5FF94E5FF95E7FF95E8FF94E8FF92E6FF90E3FF8DE1FF8DE1
                  FF97E9FFB0BCC1FFFFFFFFFFFFDEEEF576D0F788D5F891D8F996DBF998DEFB9A
                  E0FB99E1FC96E1FC90E0FD8DE0FE8CE0FE8BE1FF8AE1FF8AE1FF88E1FF86DFFF
                  86DEFF88DEFF8BDFFF8AE1FF98D8EFE9E1DFFFFFFFB5E1F584D3F798DBF8A1DE
                  F9A6E0FAA8E0FAA7E1FBA3E0FB9DE0FC96DEFB8EDCFB89DCFC86DBFD85DCFE81
                  DCFE7EDBFF7BDAFE7CDAFF81DBFF84DCFF86DDFF93E6FFCBD0D2FFFFFFB2E1F6
                  ABE1FAB4E4FAB5E5FAB7E6FAB7E6FBB4E5FBAFE3FAA7E0FB9DDFFB93DCFB8ADA
                  FB86D9FB81D7FC7CD5FC78D7FD75D5FE74D6FF79D8FF7FDAFF84DCFF8BE2FFCC
                  D5D8FFFFFFCBEAF8CFEDFCD2EEFBD2EEFCD1EEFCCEEDFCC7EBFBBEE8FBB3E5FB
                  A7E0FA9ADDFA8ED9FA87D7FA82D6FA7DD5FB78D5FB76D4FC76D5FD7AD8FE82DB
                  FF89DDFF90DEFCE8E5E3FFFFFFFEFDFDB9E5F9E3F4FCDFF3FCDFF3FCDBF1FCD5
                  F0FBCEEDFCC2EAFCB6E6FBAAE1FA9EDEFA95DCFA8FDAFA87D7FA81D6FA7DD5FB
                  7BD5FC7ED7FC84DAFD87DFFFA9D0E1FFFFFEFFFFFFFFFFFFE5F4FACBECFBEDFA
                  FDE9F8FDE6F6FDE0F3FCD9F0FBCFEDFCC2EAFCB5E5FAAAE0FAA0DFFA9ADDF994
                  DBFA8FD9FA8AD8FA87D8FA86D9FB86DBFF94D3EEFCF5F2FFFFFFFFFFFFFFFFFF
                  FFFFFFEAF5FBC4E9FAECF9FEF0FAFDE8F7FDE1F3FCD7F0FBCDECFCC0E9FBB4E4
                  FAAAE0FAA5DFFA9FDFFA9ADDFA95DCFA8EDAFC83D7FC9FD2E8FFF8F5FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED2ECF9C5E9F9DCF3FDE5F6FDDFF3FC
                  D5EFFCCAECFCBFE9FBB6E6FAAEE3FAA6DFFA98DDFA86D5F894D1EBD9E6ECFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE4
                  F2F9CDEBF8C2E7F7B8E3F6AFDFF6A4DDF6A2DAF5A5DBF4B0DEF3C9E6F4F2F4F5
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton41Click
              end
              object SpeedButton42: TSpeedButton
                Left = 633
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Replica'#231#227'o de Conta - [CAR028]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8F6FAF3EBF7ECDDF2E4CCEE
                  DCBBEAD2A7E0CFB2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  F1EBD7F8F0E5F3EAD9EFE2C9ECDCBCE9D5AEE4CD9CDFC388DDBF80DDC07FDBBD
                  7ADBBB76DBB975DBBA76DCBA73CBB284F8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFE4D6B1DBCB9ADAC897DAC591DEC892DFC991E0C991E2CC95
                  E4CF98E6D19CE8D5A0EAD8A4EDDCA9EFE1AEF3E8B2DCD1AFFAFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E8D5F1EBD7F5F0DEF7F5E3FBF9E8FF
                  FFEDFFFFECFAF9E1FAF7DBF8F5D7F8F5D2F7F3CDF7F1C7F7F0C3F9F2C2DACFA9
                  D9BA7FD8C6A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EBD7F1EBD7F6F0
                  E8EFE4D7E7D7C5DEC8B2E2C4A6FBF0D4F7F3D6F7F1D2F7F1CDF6F1C9F5EFC5F5
                  EEC0F8F1C2D9CCA5D3B16CD2BF9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FED1A4FFD2A4A25D3B9E5B369F5D389A5835C27C4CFFEECDF8F9DFF7F7D8F7F7
                  D4F6F6D0F6F6CCF6F5C8F8F5C5DBD2ADF1ECBCDED5BBF8F0E6F4F2F2FFFFFFFF
                  FFFFFFFFFFFFFFFFFED1A4FED1A4A25D3B9C5F3FA56846AA6D49F4B57BF9D0A9
                  F4C7A0F4C49BF4C096F4BD92F4B98EF3B68AF6B489DAAF8DF1EFC0D5C59BDAB6
                  68D4C9B8FFFFFFFFFFFFFFFFFFFFFFFFF3BF99F7BF8CA25D3BA25D3B9C5F3FA2
                  5D3BFFC386F4BF93F0B283F1B384F0B384F0B384F0B284F0B384F3B484D9AF8B
                  F1F0C1D7C9A1E7CE8CD8CFC0FFFFFFFFFFFFFFFFFFFFFFFFF0BB93F5B381A25D
                  3BB26B44A25D3BA6613EFFB275F2B788EDAA77EDAB78EDAB78EDAB77EDAB78EE
                  AC7BF1AE7CD8AD88F0E5B8DCCDA9FAF6C2DBD5C8FFFFFFFFFFFFFFFFFFFFFFFF
                  ECB286F5AA79A25D3B9C4E2DA3512DAA552FA25D3BEFAB7BE7A068E8A06AE8A0
                  69E8A06AEAA46FECA974F1AE7CD7A782EDAF85DAB795F8F5BFDAD4C7FFFFFFFF
                  FFFFFFFFFFFFFFFFE9AC7CF39059A25D3BB75D37AA5837AB5A3AA25D3BEDA371
                  E4975CE5975DE5995EE79D63E9A26DECAA76F1B07ED8A984EAAD7ED9B894F9F9
                  C3DAD5C8FFFFFFFFFFFFFFFFFFFFFFFFE5A06BEC8A52F28650F88D54DE7E4FF0
                  8955F98D56EC9C66E28E4EE49152E7975BE99E64ECA670F0AD7AF5B685DBAC88
                  E8A878D9AF8AF8D09FDBCEC2FFFFFFFFFFFFFFFFFFFFFFFFF4D7C2F4D5BDE0A8
                  7AE1A67ADB9F73C9946ECB956ECF976FD69E76D5A27AD8A47CDCAA84DFB18FE3
                  BA99E9C2A3C49D7EEBAA79D7A883F5B282DACABEFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFE49C62F88953A25D3BB6542DA0492BA25D3BFD864BE7A16FDF92
                  57DF9157DE9359DE965EDE9A67E6A574F3B381D7A783F2AF7ADAC9BDFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8B4BEB8C55ED8D58F4945CEB8F59F8965D
                  F4925BE99A60E28E4EE59254E8995DEBA068EFAA74F1B07EF6B98AD8AA86F1AA
                  75DAC9BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9DDF9EADEE6AA77E9
                  9E71D6966EBB8566C08A69C88F6DDFA27AD7A57ED9A47CDBA981DDAE8ADFB493
                  E2BA9BCB9B76F3AD77DAC9BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE09152FA6C30A25D3BA25D3BB34A23A25D3BFE7D43E59D64E49051E4
                  9154E69659E89B61EBA36CF0AD7AF2B17EDACABDFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFDF8441E9A776E8A673EDA873EEA872EAA570E9A3
                  72E39358E49458E79A60E99F67ECA772EFAE7CF2B585F7B888D7C5B8FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFF9FFFFF6FCFF
                  F5F7F9F5F6F6F4F5F5F2F2F2EFEEEDEEEBE8EFEAE7EFEBE7EFEBE8EEEAE7EDE6
                  E0F0F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton42Click
              end
              object SpeedButton9: TSpeedButton
                Left = 576
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Contas Banc'#225'rias - [CAR025]'
                Flat = True
                Glyph.Data = {
                  DA050000424DDA050000000000009A0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000D9000000D9000000010097007D7A
                  A9008F8BBA00695DAC009288BA00998EBB009F95B000A99FBB00FAF7FF00AF9F
                  B700BCACC000AA9EAD00FF00FF00BDB4BB00AA999F00B6ADAF00C6BDBD00CCBF
                  B700C5BCB200C5C4BB00086E0600035A0500117D160035903A0016861F001C86
                  25002D8C3500419E4C0016B02B0015A5280016A7290016A72A0017AB2B0016A0
                  29004AA4560018B13000139F2D00139E2D0018A93100015D1300139E2F001BA4
                  360024B541005CAA6C001FBA410068B87A0018702F0053A769002F964C005DB4
                  750066A67800046B24003895570035794B00238E4A00035A2D0003582D000C60
                  3A0009603B00044E36000C5641000E4D4B0017676300FEFFFF0000282C000434
                  450000B5FF0000AFFF0000ABFF0000ADFF0000A4FF000A3E5C00009EFF00184C
                  6F00F8FCFF0009416E00093F6B00F4FAFF001891FF00007FFF000083FF00027B
                  ED0002284E00146DC400103D68000079FF000A80FF000075FF00006DF000093C
                  7900006DFF003C8EFE00004EC1000B50B70009398100DCEAFE002B7DFE002F80
                  FF00005FFF000050DE000045BD000326660006399500063990000C295D00347F
                  FF006CA3FF0095BCFF00D9E7FF00EEF4FF00075CFF00BDD3FF000051FE00004B
                  EF00011B51000538A500104ACB004B649D00032576002062FF00001653000131
                  B00001195E0001185A00032DA50031488900CCDAFF00003CFF0001185C000219
                  5E00041B6200506BBB0083A1FE000136F300021860000E2A87007996FE006884
                  FC00758CF600525F9F000228FF003652F6004859BC00505DA700001FFF00243F
                  F4000E1859002E42C200272D55000017F2000016E600051DDD00283CE100283C
                  DC003343DA00394ADD007078B5000011D400041AF4000617D7000C1CD000000F
                  F200000DE700000CDA00000CD300000CCF00000ABC000009B700000AB6000006
                  5B00010ED4000211DA000007D4000008CF000006CA000005C5000007C4000005
                  BF000005BB000007B7000006B50000049A00161DAC002F32A000393DA9009293
                  B5000004CC000003BD000002B8000003B8000003B7000002B5000002B1000003
                  AF000000AD000002AD000000A7000000A5000000A10000009D0000039C000001
                  990000039900000098000000900000008E000000870000008200000258000105
                  B80004048200131397005F5FA0006D6DA6008989AD00FFFFFF00000000000C0C
                  0C0C0C0C0C0C0CCED3CF0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C72CD
                  C9C1CFCF0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C1552CBCAA89D96CFCF0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C151D4CC7C8A79D95908571630C0C0C0C0C0C0C0C
                  0C0CCD68291C4BC6C8A8A5A29177704F51790C0C0C0C0C0C0CCFCC7B282059C4
                  CAB4A08A7E6A705544640C0C0C0C0C0C0CCFCB8025205EC3B5BF9AD73F6D5B5A
                  46640C0C0C0C0C0C0CCFC78025205EC0B5B39F8D887E6F56465C0C0C0C0C0C0C
                  0CCFC580251F67BECAA7AA91846C084E485C0C0C0C0C0C0C0CCFC280251E67B1
                  B5BE995F3FD76C56465C0C0C0C0C0C0C0CCFC080241E66B1CABF9BD75F6B6157
                  445C0C0C0C0C0C0C0CCFBC7A241E73B0B5BD984D6F696E4F455C0C0C0C0C0C0C
                  0CCFBB7A242173ADC8A6AB894A6D6A57445C0C0C0C0C0C0C0CCFAF8126267CD1
                  00B2A39E886B6055455C0C0C0C0C0C0C0CCFAF862A2C8703D5B6A4A18C7F6250
                  435C0C0C0C0C0C0C0CCFAE822A233E8F090F9C93977F6250425C0C0C0C0C0C0C
                  0CCFAC78191A1837498B0612B98E7458425C0C0C0C0C0C0C0CCFBAA92E2D2B1A
                  1838477504110B83535D0C0C0C0C0C0C0CCFB8B7653C343132171633417D020E
                  0E5C0C0C0C0C0C0C0CD2D51305B8763B3031322218273D92D00C0C0C0C0C0C0C
                  0C0CCFCFD60D078E5439302F2D1B14150C0C0C0C0C0C0C0C0C0C0C0CCFCF0112
                  109C493A36350C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CCFCFD4100A94400C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CCFCFCFCF0C0C0C0C0C0C0C0C0C0C}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton9Click
              end
              object SpeedButton21: TSpeedButton
                Left = 690
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Gera'#231#227'o de Carn'#234' (Boletas) - [CAR063]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000130B0000130B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF6C8C9C293643293643293643293643293643293643293643293643293643
                  293643293643293643293643293643FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FF6C8C9C335D71335D71335D71335D71335D71335D71335D7133
                  5D71335D71335D715CCAE177DEEB85E9F098F8F8293643FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C90F2F553A3B753A3B753A3B753A3
                  B753A3B753A3B753A3B753A3B753A3B7335D715CCAE177DEEB85E9F0293643FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C2936436C8C9C98F8F890F2F5
                  88EBF280E5EF78DFEB70D9E868D3E561CEE359C8E053A3B75CCAE1335D715CCA
                  E177DEEB293643FF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C335D71335D716C
                  8C9C98F8F898F8F890F2F588EBF280E5EF78DFEB70D9E868D3E561CEE353A3B7
                  98F8F85CCAE1335D715CCAE1293643FF00FFFF00FFFF00FFFF00FFFF00FF6C8C
                  9C90F2F553A3B76C8C9C98F8F898F8F898F8F890F2F588EBF280E5EF78DFEB70
                  D9E868D3E553A3B753A3B753A3B753A3B7335D71293643FF00FFFF00FFFF00FF
                  6C8C9C2936436C8C9C98F8F890F2F56C8C9C98F8F898F8F898F8F898F8F894F5
                  F788EBF280E5EF78DFEB70D9E868D3E561CEE359C8E053A3B7335D71293643FF
                  00FFFF00FF6C8C9C335D71335D716C8C9C98F8F898F8F86C8C9C98F8F898F8F8
                  98F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED74DCEA68D3E561CEE353A3
                  B7335D71293643FF00FFFF00FF6C8C9C90F2F553A3B76C8C9C98F8F898F8F86C
                  8C9C98F8F898F8F898F8F898F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED
                  74DCEA6CD6E753A3B7335D71293643FF00FFFF00FF6C8C9C98F8F890F2F56C8C
                  9C98F8F898F8F86C8C9C98F8F898F8F898F8F898F8F898F8F898F8F898F8F894
                  F5F78CEFF484E8F07CE2ED74DCEA53A3B7335D71293643FF00FFFF00FF6C8C9C
                  98F8F898F8F86C8C9C98F8F898F8F86C8C9C98F8F898F8F898F8F898F8F898F8
                  F898F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED74DCEA335D716C8C9CFF
                  00FFFF00FF6C8C9C98F8F898F8F86C8C9C98F8F898F8F86C8C9C6C8C9C6C8C9C
                  6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C
                  9C6C8C9CFF00FFFF00FFFF00FF6C8C9C98F8F898F8F86C8C9C98F8F898F8F898
                  F8F898F8F898F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED74DCEA53A3B7
                  335D71293643FF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C98F8F898F8F86C8C
                  9C98F8F898F8F898F8F898F8F898F8F898F8F898F8F898F8F894F5F78CEFF484
                  E8F07CE2ED74DCEA335D716C8C9CFF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C
                  98F8F898F8F86C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C
                  9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9CFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF6C8C9C98F8F898F8F898F8F898F8F898F8F898F8F898F8F894F5F7
                  8CEFF484E8F07CE2ED74DCEA53A3B7335D71293643FF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF6C8C9C98F8F898F8F898F8F898F8F898F8F898
                  F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED74DCEA335D716C8C9CFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C6C8C9C6C8C9C6C8C
                  9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C
                  8C9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton21Click
              end
              object SpeedButton37: TSpeedButton
                Left = 852
                Top = 0
                Width = 16
                Height = 106
                Margins.Top = 30
                Align = alRight
                Caption = 'v'
                OnClick = SpeedButton37Click
                ExplicitLeft = 813
                ExplicitTop = 175
                ExplicitHeight = 192
              end
              object SpeedButton33: TSpeedButton
                Left = 7
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Informar dados da Transa'#231#227'o de Cart'#227'o - [CAR079]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000030F0000030F00000001000000010000630000009C00
                  00007B212100AD212100392921004A423900524A42004A4A4A005A524A005A52
                  520063525200635A52006B5A5200735A520073635200635A5A006B635A007363
                  5A006B6363007B736B0084736B00847B7B008C7B7B0084847B0084848400848C
                  8C00948C8C00DE9C9C00DEA5A500DEADAD00DEB5B500DEBDBD00D6C6C600DEC6
                  C600CECECE00D6D6D600E7E7E700FFE7E700EFEFEF00FF00FF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00272727272727
                  2727272727272727272727272727272727272727272727272727272727272727
                  2727272727272727272727272727272727272727272712121A1A1A271A1A1A1A
                  1A27272727272727272727272727191926202012212125070727272727272727
                  2727272727271919262020122121250707272727272727272727272727271919
                  091616250909060C0C270E0E0E0E0E0E0E0E0E0E0E0E0E0E0E13131B04041111
                  11140E282828282828282828282828282809131B040928281114102828282828
                  28282828282828282828151C062828280F111028282828282828282828282828
                  2828151C0A2828280F0E10282400010001280001000124282828151C0A282828
                  0F0E10280001280001280001280003282828151D0A2828280F0D102822000100
                  01280001280102282828151E0A2828280F0D1028282828010028010028000228
                  2828151E0A2828280F0D10282800010022280001000123282828171E0A282828
                  0F0D10282828282828280100282828282828181F0A2828280B0D102828282828
                  28280001282828282828181F0A2828280B0D1028282828282828282828282828
                  2828181F082828280B1110282828282828282828282828282809152105092828
                  10111010101010101010101010100F0F08151521050510101011272727272727
                  2727272727271919091A1A250909060C0C272727272727272727272727271919
                  2620201221212507072727272727272727272727272719192620201221212507
                  07272727272727272727272727271212191A1A2719191A1A1A27}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton33Click
              end
              object SpeedButton35: TSpeedButton
                Left = 64
                Top = 55
                Width = 51
                Height = 45
                Hint = 
                  'Selecionar pend'#234'ncia do processamento de extrato de cart'#227'o de cr' +
                  #233'dito para o registro selecionado - [CAR081]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000010000EFA53900EFA5
                  5200FFB55200E7AD6B00F7BD6B00AD7B7300AD847300B5847300AD7B7B00AD73
                  84009C7B8400A57B8400AD7B8400B57B8400B5848400BD848400E7B58400BD84
                  8C00C68C8C00CE948C00DEA58C00EFC68C00D69C9400DEA59400B5AD9400EFCE
                  9400B5AD9C00EFCE9C00CEADA500BDB5A500DEC6A500EFCEA500F7D6A500CEBD
                  AD00F7D6AD00F7D6B500F7DEB500DEC6BD00E7CEBD00EFD6BD00F7D6BD00F7DE
                  BD00E7CEC600EFCEC600EFDEC600F7DEC600F7E7C600C6BDCE00DEC6CE00E7D6
                  CE00E7DECE00F7DECE00F7E7CE00ADADD600CEC6D600DECED600E7D6D600EFDE
                  D600F7DED600F7E7D600949CDE009CA5DE00ADA5DE00BDB5DE00C6C6DE00CEC6
                  DE00CECEDE00D6CEDE00F7E7DE00F7EFDE007384E7008C94E7009CA5E700D6CE
                  E700F7EFE700FFF7E700526BEF006B7BEF007B8CEF008C9CEF00F7EFEF00FFF7
                  EF00425AF7005273F700637BF700FFF7F700FFFFF700FF00FF002942FF00294A
                  FF002952FF00315AFF00395AFF004263FF00426BFF004A6BFF006B84FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00575757080E0E
                  0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E5757575757092C2E29242322201B1B19
                  191919191919190E5757575757092C2E2D292322221F1B1B191919191919190E
                  57575757570933342D2D292322221F1B1B1919191919190E575757575709343B
                  342D29293747301F1B1B19191919190E5757575757093B453B342D354C593C22
                  1F1B1B191919190E57575757570C44453B41605A595A5C30221F1B1B1919190E
                  57575757570D4A4A2F52585C3D4D5A4622221F1B1B19190E57575757570E4A51
                  425F544134435C5B3F22221F1B1B190E57575757570F50514A4A453B3434475A
                  532722221F1B190E5757575757115556514A4A453B34345D5A3D2322221F1B0E
                  575757575712556155514A4A453B343E5A5F302322221F0E5757575757125561
                  6155514A4A453B345459462923221F0E5757575757125561616155514A4A453B
                  40524E392923220E575757575713556161616155514A4A453B36342D29291E0B
                  57575757571355616161616155514A4A453B34342721180A5757575757165561
                  616161616155514A45454532211D1A0A57575757571655616161616161615551
                  4B3907060505050557575757571755616161616161615655512A07100301000E
                  57575757571755616161616161616161562A071504020E575757575757175561
                  616161616161616161310715040E575757575757571761616161616161616161
                  613807150E5757575757575757142627272B262626262525251C070E57575757
                  5757575757575757575757575757575757575757575757575757}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton35Click
              end
              object SpeedButton40: TSpeedButton
                Left = 121
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Concilia'#231#227'o de Cart'#227'o  - [IMPFIN027]'
                Flat = True
                Glyph.Data = {
                  72060000424D7206000000000000320400002800000018000000180000000100
                  08000000000040020000120B0000120B0000FF000000FF00000000000000FFFF
                  FF00FF00FF009796D5006F6DBC005C5B7F008883C200DCD9EE0070639800EAE7
                  F300F0EEF4008974A100A698B600977E9900CFBFCC00CFC0CC008C777F008B76
                  7E00B79497009E6769009966660091605E009263600091636000936563009162
                  5E009869650093655E009D6E6700C2827800CEACA600A5756B00CCABA400CEAF
                  A900A9746700FBF7F600A4695800AB7A6C00B6837300C6978800B0766200B17E
                  6B00C48C7700BB8B7900BA8E7E00C6988800CB9F8F00B2796300C1887200B984
                  6F00BB8C7900BC877000BC887000C28C7400BB887000BC897200BB8A7500C990
                  7500FEFAF800FCF8F600FAF6F400D3936F00D5997700CE957600D0AA9600D59A
                  7700D3997700E0A47F00AF816500D5A68A00FAF2ED00E7AC8500CA906600E6AC
                  7F00CB8A5400E5CEBC00D0823900F8DCC400F8E3D100F4C79C00FEDAB500F7D9
                  BC00F7E0CA00FEFAF600DAA56E00FFD19E00FFD5A700FFD5A900FFD9AF00FFE0
                  BE00FFE5C900FBEAD800EF9C3900EFA95300F7D9B700FFE5C700EEB67000EDBF
                  8200FFE1B900FFD39100FFF3E200FFDDA700FFD48B00FFE4B400FFEAC100FFEA
                  C200FFF2D4009E8E5A00FFF7D700FFFEF800FFFFEE00FFFFF300FFFFFB007A86
                  4B0043602F000162040003640600015D040002600500025F050003630600046E
                  09000467080005750B00036C0A00036A090004700A0006740E00088E11000879
                  0F000A931400097213000D971A000D8418000F801A00097414000973140015A9
                  27002EBD3D00B3CFB6001AAA2D00189729001AA02D001B962D00178928001FB0
                  35001F9D340028BB420027B541002DC04A0030BB4D0021A53F0023A6400032C6
                  550030BF500037CC5D0029B750002EBC550039CC62003BCE63003FD769003FD1
                  660041D36A0031C25B003FD46C0045D7700046D8740048DC770047DA770049DD
                  790048D976004BE07D004DE27F004DE581002659A400527BB800CCD8FF00F3F6
                  FF0091AAFF00A1B5FF00A3B7FF00BDCBFF00D4DEFF00113EFF001A47FF00234F
                  FF002854FF005576FF005778FF006382FF007B96FF007D96FF009EB2FF00D9E1
                  FF00E6EBFF00062FFF000C37FF000C34FF000E37FF000E35F3000F39FF001139
                  FF001035EE00133FFF00133CFF001640FF001843FF002348FF003C5EFF005372
                  FF006781FF000026FF000024FF000026EE000128FF00032BFF00042AFF00042B
                  F6000C31F0000C2DE3003656FF00C2CBFF000021FF00001FFF000023FF000020
                  FB000020E900001BDD00001AD4000019D300011FDD00011CDC000320DD000B25
                  D4001028CF002338D0002439D000667BFF00BDC6FF00001AFF00001CF7000019
                  EB000115CE000A20CA00F6F7FF000111C7002430B1003541C0003642C0005F67
                  CC001F27A700494DB5006C70CB008487D10035359D0002020202020202020202
                  0202020283020202020202020202020202020202020202020202028383020202
                  0202020202021B2C2C2B3238383634372A31839D83441D130202020202021A5E
                  6258565555636666618397AD888787870202020202021A51595058654F120B11
                  839CABA7A6A398907C75020202021A4D5F59670DFAE3E5839AACA7AAA5A19B99
                  9486750202021A525F680BF5F0EFAE83A4ABA8A5A29F99959391857502021A4E
                  6C0CF2DED4D1C28B839EA9A296928F8D8E8C898102021A5B5BF8E1DFD0F4B6EE
                  8B8396A083716B72737F848278021C640EF3C3E0D0D2BFEDDDAF838A83104714
                  02027A8079021F6E04E7C8C5D7D8C0C1B1DCE683830543140202027E7B021F6F
                  04E8CDC6CCB501F4BCE0E0D583054318020202747D02256D03E9B8C6BBC2B0BD
                  DFD7D6D3F1084917020202027602295323EBCECBBDB6B3C0B4CFD7D7E4124916
                  020202027702313C01FDDBB9B9B50101B4C9C4E2FE564517020202020202333C
                  010AF7CAB8BAB2BECEB7D9F61E674519020202020202353C010109F9ECCAC7DA
                  DAEAFB4B69624019020202020202393C010101010703FCFC060F6A6A5A694015
                  0202020202023923010101010101706F6E4B2E272D2D261B0202020202024223
                  010101010101016D702024484A4C4C02020202020202413B0101010101010101
                  01202F605D5C0202020202020202413B0101010101010101012128605D020202
                  0202020202023E463A3B3B23233C3C3C01202F54020202020202020202023D3E
                  4141423F393530332622290202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton40Click
              end
              object SpeedButton46: TSpeedButton
                Left = 177
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Lista de Mercadorias Retornadas - [CAR083]'
                Flat = True
                Glyph.Data = {
                  2A060000424D2A06000000000000EA0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000ED000000ED00000001008200100F
                  97003B37A1001A12840016115E00282292003A349D000C037B00BAB7DA004033
                  93008C81BC004534840018035300200A5300250A43006F50880091759A003C1B
                  4000FF00FF003C0D2B00AD95A0004C112300A4818A00A5808100A78282008E0C
                  00006F160F008E140000B2867F00981B00007D17000070170300A5888100861C
                  000064231000A0260000A45239006F1C00007B4A3800BC765D009D3205009A3A
                  1500E0C7BD00C03900007D2E09006E3A23006624000044352D00D7A98600EBB0
                  7E00EDBB9200FFC08100FECA8F00FCD5A500FECB8400FCE1B7004F330200FFD0
                  8100FFD78C00FAEDD300FFD78200FFE5A500FFEFB700F7F6F00006660B000A75
                  0F0007730F0008740F00086D0E000977110009750F0009731000097211000B79
                  1300096F11000A7213000C7E16000C7716000D8018000F841A00087916000E80
                  1C00118A1F0011841F0011831F0006771600067614000E811E0010821F00138C
                  2300128621001690280025C0410029C44D002FD358001EB6480026C9550025C5
                  530020AA46002ACA58002CCC5A0032D35E0034D760001FBD4D0022C1510029CE
                  5A002BD15E002ED762002DD15E0030D7630033DD680033DC660035E26B0035DD
                  670037E26B003BE76F003EED74003CE7700021CB570025D05C0026D35E0028D0
                  5D0031DD680039E9700041F2790044FB800044F87E002CE0690049FC860034D4
                  72001B9753001A874E00189055001884500016815000137D5100167A6400187B
                  700072F7FC007FFAFC0058E2EF003EE1FA0011D0FF002AB4D7001DAFD9001362
                  790000C0FF0000C4FF0000BBF80018AFDD0000BCFB0000ADEE0000AAE90002A4
                  E0000CA9DE000B9CCF000A88B700119FD1000098D8000190CB0015648200009C
                  DE000093D800046C9A000089D0000088C900135C7F0024638300007BBD000178
                  BA0011568800006FD000006FF2000A3A89000046E600003DE500031E66000022
                  AC00072AB0007689E9002B48F2000021EE000117BB000018E9004959D7000014
                  E0000011D100000FCB00000D96001F2DC200000DED00000CC2000009BF00000C
                  B80001087B000C16BB001119AF00313ABB007A7EC9000007B4000005A9000005
                  A30000048B0000057A00030AA9000A11A900191DA7000004CB000001B2000004
                  B2000000A5000000A00000009F0000029C0000009A0000039700000096000001
                  9300000092000002900000008F0000008C0000018C0000018A00000089000000
                  88000000870000008400000083000000810000017B000404A10004058B000C0E
                  9700393BB4006365CC0000000000121212A9A9A9A91212121212121212121212
                  121212121212A9A9A9989EA997A9A9A91212121212121212121212121212A98D
                  8D8E99A9939396A9A412121212121212121212121212A98A8A8D9AA9939292A9
                  1212121212121212121212121212A98A8B8C9BA9979493A9221D121212121212
                  121212121212A9909D9D8F959FA5A19F2D1A15121212121212122323121212A8
                  A39C959AA2A9A9A72003DCD4D9DBDFE1E10D13130C121212262D2F1212121211
                  2401B7AEAFB9BABBBFC0C7B6B1CA121927241B1B1B2B2B131F07B5ACACB7B9BA
                  BABFC1ACABBC121E24291E212128280E0DE8D5D4D6D7DEDDE1E3E2E2E2121212
                  2C252E2E2E383804CFC9CCC7C9C8C3C5EAC5CCE4E51212565655555550504288
                  E70BCED1C1B4B3C6B80AEBC4E41212577F787776777945830F31CED1C1BDBDC4
                  C1CE05E9E31212517A696061685F43851033C4D1C9D4D8DAE0E1E3E500121251
                  706C6960605F43851032CD101416171717171818CB1212577B6D6A6969674385
                  0A2ACD3B3E3D3A3939393C39CB121258746F6D6C6A6843860A2ACD3B3B373534
                  33333630CB1212587C706F6D6B614687EB08CD3F3F3B373534363C1CCB121253
                  7E7372716E634184B6C3CDEAEA02060909090BCB1212125A807473727064485C
                  ADCFC7D3D8DCE0E1E6CB121212121254807E7C7373654762B2BEBBC7C9D7DEDD
                  C2401212121212124D5B74747D664A5DAACFCFD0D2D6DCDAB040121212121212
                  1212544D59754B5E8189A0A6A6918988824012121212121212121212124A4454
                  59524F4E4C494546444012121212}
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = SpeedButton46Click
              end
              object SpeedButton48: TSpeedButton
                Left = 234
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Pend'#234'ncias Concilia'#231#227'o de Cart'#227'o  - [IMPFIN027]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000120B0000120B00000001000000000000000000000000
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
                  FDFDFDFDFDFDFDFDFDFD9BE4E4E4E4E4E4E4E4EBECECECECECECEC9BFDFDFDFD
                  FDFD9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEC9BFDFDFDFDFDFD9BFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFEC9BFDFDFDFDFDFD9BFFFFFFFFFFFFAFA6A6AFFFFFFF
                  FFFFEC9BFDFDFDFDFDFD9BFFFFFFA50E56F9F9F9575656FFFFFFEC9BFDFDFDFD
                  FDFD9BFFFFF70E0F0F67F60757575756FFFFEC9BFDFDFDFDFDFD9BFFFF560FF9
                  5FF6F6EF0757575756A2ED9BFDFDFDFDFDFD9BFF070E0F0F5FA7AFA7EF665757
                  56A4ED9BFDFDFDFDFDFDE3FF9E0F17170F0FB7F6F65F57570F5CEC9BFDFDFDFD
                  FDFDE3FF9E0F171717EFFFF6670F0F0F0F5CEC9BFDFDFDFDFDFDE3FFAF0F1717
                  67F6F6A7F90F0F0F0F9DEC9BFDFDFDFDFDFDE3FFFF571717A7F6EFB7EF570F0F
                  0FEDEC9BFDFDFDFDFDFDE3FFFFA70F5757EFFFFFEF17170F55FFEC9BFDFDFDFD
                  FDFDE4FFFFF65617175FAFAF17170F56EDFFEC9BFDFDFDFDFDFDE4FFFFFFF65E
                  57171717170E5609FFFFED9BFDFDFDFDFDFDECFFFFFFFFFFF6AFA6A6A607FFFF
                  FFFFED9BFDFDFDFDFDFDECFFFFFFFFFFFFFFFFFFFF09ECECECECE49BFDFDFDFD
                  FDFDECFFFFFFFFFFFFFFFFFFFFEDDBEBE3E2E2FDFDFDFDFDFDFDECFFFFFFFFFF
                  FFFFFFFFFFEDE3F4EBEAFDFDFDFDFDFDFDFDECFFFFFFFFFFFFFFFFFFFFEDE3F4
                  EBFDFDFDFDFDFDFDFDFDEBECECECECECECE4E4E4E4E4E3EBFDFDFDFDFDFDFDFD
                  FDFDEBECECECECECECE4E4E4E4E3E3FDFDFDFDFDFDFDFDFDFDFD}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton48Click
              end
              object SpeedButton51: TSpeedButton
                Left = 349
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Negativar / Desnegativar Clientes - [CLI275]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000C30E0000C30E00000001000000000000000000000000
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
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDACACACACACACFDFDEF
                  EFEFEFEFFDFDFDFDFDFDFDFDFDACACF5F5F7F7F7F5EFEF4747474747EFFDFDFD
                  FDFDFDACACF5ECECECACE4A4EB4F4F4F4747474F4FEFFDFDFDFDFDACEBEDECEC
                  F409F4F49E4F474747474747474FEFFDFDFDFDE3ECF509ECF509F5F45647F6F6
                  F6F6F6F6F647A7FDFDFDFDE3ECF409EC090909095747F6F6F6F6F6F6F647A7FD
                  FDFDFDE3F4ECF6F5090909099E4F474747474747474F9DFDFDFDFDECF4ED08F6
                  F4090909F49E4F4F4747474F4F64FDFDFDFDFD08F5ED6565EDF4F4F4ECE35C47
                  4F4F4F4763FDFDFDFDFDFDFDF6F55C5C5CA4F4ECA310FDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDA55C54535C5AED5AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA4535C5C
                  5454FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD6464655D5C5C1C08FDFDFDFDEF
                  EFEFEFEFFDFDFDFDFDFDFD64656565655C5CADFD59EFEF4747474747EFFDFDFD
                  FDFDFD64A6AEAEA6655D5C08EB4F4F4FFFFFFF4F4FEFFDFDFDFDFDAEAEB7AEAE
                  655B52F79E4F4747FFFFFF47474FEFFDFDFDFDAFAFB7AEAE655B52A45647F6F6
                  F6F6F6F6F647A7FDFDFDFDAFB7B7AFAE655252AD5747F6F6F6F6F6F6F647A7FD
                  FDFDFDF7F7A4A55C5B5252079E4F4747FFFFFF47474F9DFDFDFDFDF7F7A4A49B
                  5B52A408F49E4F4FFFFFFF4F4F64FDFDFDFDFDFDFDF707F7AD07FDFDECE35C47
                  4F4F4F4763FDFDFDFDFDFDFDFDFDFDF7F7FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton51Click
              end
              object SpeedButton52: TSpeedButton
                Left = 292
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Informar data de previs'#227'o de recebimento - [CAR111] - [CAR112]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000B0000000B00000000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D56C72613F4732454C3B5A5D54B4B5
                  B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE787E6F48582DA2C864C8EE91
                  B6D787BDDF8C6E7F564E5148EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8084776A853EBB
                  E776D2F89BBDDF8C95B06FD2F89CCBF097A1BE78474B42FCFCFCFFFFFFC0C0C0
                  989798989898989898989798999999999999999999999999999999ADACADDEDD
                  DE42512BC1F36F697C4DD2F89CD2F89CD2F89CD2F89C8AA367AFCF827E92609A
                  9C987171717574759F9E9F9F9E9FA3A2A3A5A5A6A5A5A6A5A5A6A5A5A6A5A5A6
                  A5A5A6B5B4B5797E7290B651C9F682D2F89CD2F89CC6E993B9DB8AD2F89CD2F8
                  9CD2F89CCDF29844483E464646EFEDEFB5B4B8767580BEBDC0F8F7F9A09FA086
                  8585DCDBDDF8F7F9F8F7F9F3F2F44E5540AFDE62A1C36ED2F89CCEF3992C3815
                  31420FA5C37AD2F89CB9DB8AB5D687424839474647EFEDEF3130435A5ABE3939
                  46E4E3E44C4C45A9A6916E6E6CF8F7F9F8F7F9F3F2F44E5640ABD85F97B667D2
                  F89CCAEE961F270E364A0D708453D2F89CB3D385AECD81434939474647EFEDEF
                  3837463C3C6F3F3F4AEAE9EB33332F6362587C7B7AF8F7F9F8F7F9F5F4F69197
                  86B0DF62CAF782D2F89C596942819960ADCC80697C4ED0F59AD2F89CCFF49A43
                  473C474647EFEDEFE1DFE1C0BEC0EAE9EBF8F7F9DDDCDEC8C8C9F5F4F6F8F7F9
                  F8F7F9F7F7F8F0EEF0809D51C2F371728754C5E892D2F89CD2F89CD2F89C8FA9
                  6AB4D485869C6590918D474647EFEDEF5E5E6B2D2D40686872F2F1F34645433F
                  3E3AA3A3A2CCCBCD3D3D393D3D39D2D0D2727768749242B5DD74D2F89CBFE28E
                  9CB974D2F89CC6EA93A6C47B40443BF9F9F9474647EFEDEF3332477171EE3B3B
                  49DEDDDF616058D6D3B96968669E9D9EA29F8C969483A9A9AAEFEEEF676D5D50
                  6330ADD56EC6E991AFCE82C7EB947C915F41453BE8E8E8FFFFFF474647EFEDEF
                  78778332314082828BF6F5F75A5A57444340B7B5B6D9D8DA4948454B4A48E0DF
                  E1F7F6F8F3F1F4BDBCBC565E493F4730414836494D43989896C4C3C5FFFFFFFF
                  FFFF474647EFEDEFCCCBCCA09FA0D5D4D6F8F7F9BFBEBFA7A7A8E8E7E9F3F2F4
                  AEADAFB1B0B2F5F4F6E6E5E6A6A6A7C2C0C3F3F2F4CCCACDA2A0A2D5D4D5F6F5
                  F64F4F50F9F9F9FFFFFF474647EFEDEF3333444B4B9F3B3B47E6E6E742413B8D
                  8B7A737371A9A9AA6B695D626156B5B4B66867659592803D3C38EFEEF043423F
                  A4A18D4B4A47F8F7F94F4F50F9F9F9FFFFFF474647EFEDEF34334444448F3B3B
                  47E7E7E83D3C377F7D6E747472A9A9AA615F545A584FB6B5B769686687857539
                  3834EFEEF042413E94917F4C4B48F8F7F94F4F50F9F9F9FFFFFF474647EFEDEF
                  CECCCEA09FA0D7D6D8F8F7F9C1C0C1A8A8A9E9E8EAF3F2F4B0AFB1B2B1B3F5F4
                  F6E6E6E7A7A7A8C4C4C5F8F7F9D3D2D4A5A5A6DAD9DBF8F7F94F4F50F9F9F9FF
                  FFFF2726267F7E7C7F7E7CCECCC9A7A7A6848483848483848483848483848483
                  8484838484838484838484838484838484838484838484838484838484838484
                  832A2A2AF9F9F9FFFFFF353329B0A97AB0A97AE0D89FCBC7AFB4B19BB4B19BB4
                  B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19B
                  B4B19BB4B19BB4B19B3A3934F9F9F9FFFFFF454437F0E7A6F0E7A6EAE3A5504F
                  4869675DF3EFD255544C605F55F6F2D45B5A51595850F5F1D364625953524BF2
                  EED16C6A5F4F4D47EEEACDF6F2D4F6F2D4484742FDFDFDFFFFFF7B7B7369654C
                  908B647975546B6A66454442838171605F5D4F4F4C8583735554525B5A578482
                  724B4A47666563807E6F44434071706E7A786994917F6E6C60787875FFFFFFFF
                  FFFFFFFFFFCDCDCDAAAAAA9090906B6B6B474647989898605F604F4F4F9A9A9A
                  5554555A5A5A9999994C4B4C6665669494944545457170718D8D8DAAAAAACBCB
                  CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA595959737373FDFDFD60
                  5F606B6B6BFFFFFF666666636363FEFEFE6E6E6E5E5E5EFCFCFC777777575757
                  F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton52Click
              end
              object SpeedButton55: TSpeedButton
                Left = 405
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Documento de origem'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFCF8FFFCF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFEFDFCE5C9FCE4C8FFFEFCFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEAD3FBDEBBFBDEBBFCE9D0FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFDF1E2FDEDDBFDEDDBFDEDDBFDEDDBFDEDDBFCE8D2FBDEBBFBDEBBFBDE
                  BBFBDEBBFCE8D2FDEDDBFDEDDBFDEDDBFDEDDBFDEDDBFDF0E1FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBB
                  FBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDE
                  BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDEBBFBDEBBFBDEBBFB
                  DEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBB
                  FBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDE
                  BBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFB
                  DEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFBDEBBFBDEBBFBDEBBE6AA6AE6AA6AF1C492F1C492E6AA6AE6AA6AE6AA
                  6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6AFBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDEBBFBDEBBE6AA6AE6AA6AF1C492F1C492
                  E6AA6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6AFBDEBBFBDEBBFBDE
                  BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDEBBFBDEBBFBDEBBFB
                  DEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBB
                  FBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDE
                  BBFBDEBBD27619D27619E6AA6AE6AA6AD27619D27619D27619D27619D27619D2
                  7619D27619D27619FBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDE
                  BBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDEBBFBDEBBE6AA6AE6AA6AF1C492F1C492
                  E6AA6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6AFBDEBBFBDEBBFBDE
                  BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDEBBFBDEBBE6AA6AE6
                  AA6AF1C492F1C492E6AA6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6AE6AA6A
                  FBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDE
                  BBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFB
                  DEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFBDEBBFBDEBBFBDEBBD27619D27619E6AA6AE6AA6AD27619D27619D276
                  19D27619D27619D27619D27619D27619FBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBB
                  FBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDE
                  BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDEBBFBDEBBFBDEBBFB
                  DEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBB
                  FBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDEBBFBDE
                  BBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFB
                  DEBBFBDEBBFBDEBBFBDEBBFBDEBBFBDEBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFB5513FB5513FB5513FB5513FB5513FB5513FB5513FB5513FB5513FB551
                  3FB5513FB5513FB5513FB5513FB5513FB5513FB5513FB5513FFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFB5513FB5513FB5513FB5513FB5513FB5513FB5513F
                  B5513FB5513FB5513FB5513FB5513FB5513FB5513FB5513FB5513FB5513FB551
                  3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0B7AFDCAEA5DCAEA5DCAEA5DC
                  AEA5DCAEA5DCAEA5DCAEA5DCAEA5DCAEA5DCAEA5DCAEA5DCAEA5DCAEA5DCAEA5
                  DCAEA5DCAEA5E0B7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton55Click
              end
            end
            inherited GroupBox2: TGroupBox
              Top = 167
              Height = 188
              ExplicitTop = 167
              ExplicitHeight = 188
              inherited ScrollBox2: TScrollBox
                Height = 171
                ExplicitHeight = 171
              end
            end
            object Panel15: TPanel
              Left = 0
              Top = 110
              Width = 872
              Height = 57
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              PopupMenu = PopupMenu2
              TabOrder = 3
              Visible = False
              object SpeedButton17: TSpeedButton
                Left = 7
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Somar conta(s) -  - [CAR013] - [CAR014]'
                Caption = 'Somar'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000330B0000330B00000001000000010000424242008484
                  8400FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020000000000000000000000000002020202
                  0202020202020200000000020202020202020100020202020202020202020201
                  0000000102020202020202000202020202020202020202020100000001020202
                  0202020202020202020202020202020202010000000102020202020202020202
                  0202020202020202020201000000010202020202020202020202020202020202
                  0202020100000001020202020202020202020202020202020202020100000000
                  0202020202020202020202020202020202020100000001020202020202020202
                  0202020202020202020100000001020202020202020202020202020202020202
                  0100000001020202020202020202020202020202020202010000000102020202
                  0202020002020202020202020202020000000002020202020202010002020202
                  0202020202020200000000000000000000000000020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton17Click
              end
              object SpeedButton18: TSpeedButton
                Left = 64
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Quintar conta(s) - [CAR034] - [CAR035]'
                Caption = 'Quitar'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF50A75B5C8E62
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B
                  B33009A41C00B71776917AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF44B5531BB73122B2351CAC2F10AE26AD9DABFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF6BB57429CF4331C2462DBF4329BA3E1DBF33509259FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF83B58A33E14D40D2573ED0543CCD5137C94C
                  32C3461AC634B1A3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AF8D3CEB584CDE6349DC6048
                  DC5F31D74C43D3593ED05438D350399E48FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF70A87647F76455E8
                  6E53E66C51E96B3FD155C5D3C63AE45346D85D44D55B33E44D818E83FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF54B260
                  53FE715AEB7259EB7158F0723EDD56FF00FFFF00FF67DA774CE5654CE0644BDF
                  622EC045AD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8DC5944FF96C59EB7259EC7259F47441D959FF00FFFF00FFFF00FFFF00FF
                  3DE75954E76C51E46A4DF469528D5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF4FF96C31DC4C4BE4664BF0664CC85EFF00FFFF00FFFF
                  00FFFF00FFFF00FF89DA9553F26F56EA6E55E76F3EEA58A297A1FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4FF96C69CF7598C49CFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF46E15D59EE7359EC725CF67639
                  AD4AAD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBADFBE4AF1
                  665AED735AEC7355FF726B856CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF63D47353EC6D58EB715CEF753EE459AD9DABFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF38D8504FE16854E56B5AF4753EAB4D
                  AD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBBDEBF2ED44948
                  D95F4DDD654CF768608564FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF6DCA793FCD553BCD5243D35B35DE4F9D929AFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF3EBF5051C96442C7563ACE5227B23BCDB8
                  C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32BC4632BC464FC460
                  52C7644CD66240914AAD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8FCD9535B84A48BE584AC15C45D45B628565FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF50BA5D3AB34C42B85345BB5636C74B879088FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2BAB3B37AF493DB2
                  4E3DB75047A352FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  32BC4620A63121A73429AA3A32BC46FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF32BC46FF00FFFF00FFFF00FF}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton18Click
              end
              object SpeedButton19: TSpeedButton
                Left = 121
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Quitar Parcial - [CAR036]'
                Caption = 'Parcial'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF50A75B5C8E62
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B
                  B33009A41C00B71776917AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF44B5531BB73122B2351CAC2F10AE2610AE26FF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF6BB57429CF4331C2462DBF4329BA3E1DBF33509259FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF83B58A33E14D40D2573ED0543CCD5137C94C
                  32C3461AC63410AE26FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AF8D3CEB584CDE6349DC6048
                  DC5F31D74C43D3593ED05438D350399E48FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF70A87647F76455E8
                  6E53E66C51E96B3FD155C5D3C63AE45346D85D44D55B33E44D818E83FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF54B260
                  53FE715AEB7259EB7158F0723EDD56FF00FFFF00FF67DA774CE5654CE0644BDF
                  622EC04510AE26FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8DC5944FF96C59EB7259EC7259F47441D959FF00FFFF00FFFF00FFFF00FF
                  3DE75954E76C51E46A4DF469528D5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF4FF96C31DC4C4BE4664BF0664CC85EFF00FFFF00FFFF
                  00FFFF00FFFF00FF89DA9553F26F56EA6E55E76F3EEA58A297A1FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4FF96C69CF7598C49CFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF46E15D59EE7359EC725CF67639
                  AD4A39AD4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBADFBE39ED
                  5745EA6145EA6140FF61558159FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF000000FF00FF000000000000FF00FF000000000000FF
                  00FF000000000000FF00FF000000000000FF00FF000000000000FF00FF000000
                  000000FF00FF000000000000000000FF00FF000000FF00FF000000000000FF00
                  FF000000000000FF00FF000000000000FF00FF000000000000FF00FF00000000
                  0000FF00FF000000000000FF00FF000000000000000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF32BC4545C65936C54C2ECB4822AD3610AE
                  26FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF39AD4A32BC464FC460
                  52C7644CD66240914AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8FCD9535B84A48BE584AC15C45D45B628565FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF50BA5D3AB34C42B85345BB5636C74B879088FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2BAB3B37AF493DB2
                  4E3DB75047A352FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF20A63121A73429AA3A39AD4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF39AD4AFF00FFFF00FFFF00FF}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton19Click
              end
              object SpeedButton22: TSpeedButton
                Left = 176
                Top = 4
                Width = 55
                Height = 45
                Hint = 'Detalhes - [CAR023] - [CAR024]'
                Caption = 'Detalhes'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DFDED8D6D4D9D7D5D9D7D5D9D7
                  D5D9D7D5D9D7D5D9D7D5D9D7D5D9D7D5D9D7D5D9D7D5D9D7D5D9D7D6DAD8D6DA
                  D8D6DAD8D6DAD8D6DAD8D6DAD8D6DAD8D6DAD8D6D9D7D6E8E8E8D4CCC6EBE7E4
                  E8E4E1E8E3E0E7E3E0E7E2DFE7E2DFE6E1DEE6E1DEE5E0DDE5E0DDE4E0DCE4E0
                  DDE3DEDBE2DDDAE1DDD9E2DDD9E1DCD9E2DDDAE3DFDCE3DFDCE4E0DDD8D1CCD9
                  D5D1DAD4D0FEFFFFFAFBFBF9FAFAF9F9FAF8F9F9F7F8F8F7F8F8F6F7F7F6F7F7
                  F5F6F6F4F5F6F4F5F5F3F4F4F3F4F4F3F3F4F2F3F3F3F4F5E6E5E5D8D2CED9D4
                  D1D6D2D0E5E3E1DAD5D2DAD4D0FDFEFEF8F8F9F8F8F9F8F7F7F7F7F7F7F7F7F5
                  F5F5F5F5F5F4F4F5F4F4F4F4F4F4F3F2F2F3F3F3F2F1F2F2F2F2F1F1F1F0F0F0
                  F2F2F1F2F2F3F2F2F3F4F5F5E2DFDCDAD5D2DAD4D0FDFEFEFAFAF9F8F8F8FCF9
                  FBFCF9FBF8F8F8F8F9F9F8F8F8F7F8F7F7F7F7F6F6F6F6F6F6F4F5F5F5F5F5F4
                  F4F4F4F4F4F2F3F3F2F3F3F1F0F1EFF0EFF1F1F2E2DFDDDAD5D2DAD4D0FEFFFF
                  F9F9F9FDFAFDCDEDD4CCECD6EEE8EAE4E0E0E4E0E1E4DFE0E3DFDFE3DEDFE2DD
                  DEE2DDDEE1DDDDE1DDDDE0DCDCE0DCDCDFDADBF2F3F3F1F0F0F1F1F2E2DFDEDA
                  D5D2DAD4D0FEFFFFFAFAFAFCFAFCDEF4E2D8F7E1E5DCDFD9D2D2DAD2D3D9D1D2
                  D9D1D2D8D0D1D8D0D1D7CFD0D7CFD0D6CFD0D6CED0D5CDCED4CCCEF3F4F4F0F1
                  F1F2F2F2E2DFDED9D5D2DAD4D0FFFFFFFAFBFAFAFAFAFFFBFEFFFAFEFCFDFDFD
                  FEFEFCFDFDFCFDFDFBFCFCFAFCFCF9FBFBF9FBFAF9FAFAF8F9F9F8F9F9F7F8F8
                  F6F7F7F1F1F1F0F0F0F2F3F3E3E0DED9D5D2DAD3D0FFFFFFFBFBFBFDFCFDE0EF
                  E3D9EFE0EEE9EBE6E1E2E6E1E2E5E0E1E5E0E1E4DFE0E4DFDFE3DFDFE3DEDEE2
                  DEDEE1DDDDE1DDDDE0DBDCF4F4F4F0F1F1F2F2F3E3E0DED9D5D2D9D3D0FFFFFF
                  FCFCFCFFFBFECDF5D6CCF7D8E8DEE1DAD2D4DBD3D4DBD3D4D9D2D3DAD2D3D9D1
                  D2D8D1D2D8D1D1D7CFD0D7D0D1D6CECFD5CECEF4F5F5F2F2F2F2F2F3E3E0DED9
                  D5D2DAD3D0FFFFFFFCFBFCFBFCFBFFFCFFFFFCFFFCFDFDFDFEFEFDFEFEFCFDFD
                  FCFDFCFBFCFCFAFBFBFAFBFBF8FAF9F8FAF9F8F9F8F7F8F8F6F7F7F2F2F2F1F1
                  F1F3F3F3E4E1DFD9D5D2D9D3CFFFFFFFFCFCFCFEFDFEE5F1E8E7EFE9F7F5F6F3
                  F1F1F2F1F1F2F1F1F1F0F0F1EFF0F0EFEFF0EEEEEFEEEEEEEDEDEEEDEDEDECEC
                  ECEBEAF3F4F4F2F2F2F3F3F4E4E1DFD9D5D2D9D3CFFFFFFFFDFDFDFFFFFF89D0
                  8ABDECC4E1D5DAD0C4C6D1C6C7D0C5C7D0C5C7CFC4C6CFC4C5CEC4C5CEC3C4CD
                  C3C4CDC2C4CCC1C3CBC0C2F7F7F7F3F2F3F3F4F4E4E1DFD9D5D1E3E1E0FFFFFF
                  FDFDFDFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
                  FFFDFEFEFCFEFEFCFDFDFBFDFDFBFCFCF9FBFAF4F3F4F2F2F2F4F4F4E5E2E1E4
                  E5E6E1DEDCFFFFFFFDFDFEFEFFFFEBE6E7E9E4E5E9E5E5E8E4E4E8E4E4E8E3E4
                  E7E3E3E7E2E3E6E1E2E6E2E2E5E1E1E5E0E0E4E0E0E4DFE0E3DEDFF5F6F6F3F3
                  F4F4F4F4E5E2E0E3E3E3DFDBD8FFFFFFFEFEFEFFFFFFDFD8D9DED6D7DDD6D7DD
                  D6D7DDD5D6DDD5D6DCD4D5DBD4D5DBD4D5DAD3D4DBD3D4DAD2D3D9D2D3D9D2D3
                  D7D0D1F7F8F8F3F4F3F4F5F5E6E3E1E0E0DFDEDAD8FFFFFFFEFDFDFEFDFEFFFF
                  FFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFEFDFEFDFDFEFEFCFCFCFBFCFCFBFCFBFA
                  FBFBFAFAFAF8F9F9F8F9F9F4F4F4F4F4F4F5F5F6E6E3E1DFDEDEE0DCDAFFFFFF
                  FFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFEFEFEFEFEFEFDFDFEFDFDFDFBFCFCFCFC
                  FCFAFBFBFAFAFBFAFAFAF8F9F9F8F9F9F7F8F8F7F7F7F6F7F7F7F7F8E7E5E3DF
                  DFDEDAD6D3EFECEAEDEAE8ECE9E7ECE9E7ECE9E7EBE8E7EBE9E7EAE7E6EBE8E6
                  EAE7E5EAE7E5E9E6E5E9E6E4E8E5E4E7E4E3E7E5E3E6E3E2E7E4E3E7E4E2E6E4
                  E2E7E5E4DDD7D5E0DFDFE5E4E3EDECEBEBE9E7E8E6E4E6E2E0E3DFDCE0DBD7DC
                  D7D3DAD4CFD8D1CCD6CFCAD5CDC8D4CCC7D4CCC7D5CDC7D6CEC9D7D0CBDAD4D0
                  D0C9C5D5CDCAD3CCC9D3CCC9DBD5D3E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton22Click
              end
              object SpeedButton27: TSpeedButton
                Left = 291
                Top = 4
                Width = 77
                Height = 45
                Hint = 'Desconto/Acr'#233'scimo - [CAR097]'
                Caption = 'Desc/Acresc'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  06050000424D0605000000000000C60200002800000018000000180000000100
                  08000000000040020000120B0000120B0000A4000000A400000000000000FFFF
                  FF00FF00FF00235604002E7E02002F8103002D7A0300308304002E7D04002D7B
                  04002D790400296904002F7F0500275F0700204F06002F8304002F8204002E7F
                  04002F8205002F8105002E7F05002F8106002E7E06002D7A06002F8207002D79
                  07002D7409002867090028650900255D08002764090023590900255C0A00245B
                  0A002A6D0C00296B0D00265E0C0027640D0027620D0027600D0028630E002762
                  0E002F830C002F830D002A6D0E0027630E002868100028691100286811002F88
                  1300308A1500286A1200296C1300296C14002A6F15002D7917002C7718002B73
                  17002D7A19002C7518002C7519002C7919002D7B1A002D7B1B002D7D1C003092
                  1F002E8720002D811F002E832000309322002D8220002E8421002E8723002E86
                  23002E8322002E8823002E8924002E8824002D8423002E8A25002F8C26002E89
                  2500309927002F9226002E8B26002E8E27002F8E27002F9028002F8F28002F8B
                  27002F8E28002F8C28002E8F28002E9129002F9129002E9029002F9029002E8F
                  29002F8F29002F912A002E902A0030922B002F902B00309C2D002E912A002E92
                  2B002F962D002F952D002F932D002F982E002F972E002F982F0030982F002F9A
                  32002F9930002F9831002FA133002F9E35002F9D34002F9C33002FA037002F9F
                  36002FA63A002FA339002FA039002EA43A002EA63D002EA63E002EA63F002EA9
                  43002EA741002EA946002DAA47002DAA48002DAA49002DAB4C002CAB50002DAC
                  51002DAB4F002DAB50002CAD54002CAB51002DAD53002DAC52002CAF58002CAD
                  55002CAD56002CAD57002CAC54002CAC55002DAD56002BAF5A002BAD57002CAF
                  59002CAF5A002CAD58002CAD59002BAF5B002BAF5C002CB05C002CB05D002CAF
                  5C002AB05E002BB05E0002020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020235380202020202
                  020202020202020202020202020202294A576B66360202020202020202020202
                  02020202022440604F686B606E4C260202020202020202020202023434614B60
                  4F6F77636B5D70400202020202020202021D1D0D375F56505A5A637B7269696A
                  0E0202020202022E2E4E231B3F5A5C728DA08658737C636D1F02020202282846
                  64481C224D738A9A9391988A5D4B79783002023D3D3D654F63441E2C537E869C
                  9D938939276271632F021F1F594F5E516C3A0B18121419327A9A8F7D3333897F
                  2F021F1F495E5155824104101305070C0645989F888043212F021F305B54798C
                  A3740A1512130513130983996321200202021F2F768797939490671708111210
                  0F1642252002020202021F3E9DA395949196978552312B2A1A03200202020202
                  0202022D2D75A1999294919BA2A3813C200202020202020202020202023B3B84
                  9E93959D8B4620020202020202020202020202020202023B478E926320020202
                  0202020202020202020202020202020202263002020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02020202020202020202}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton27Click
              end
              object SpeedButton28: TSpeedButton
                Left = 234
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Corrigir Valor(es) - [CAR037] - [CAR038] '
                Caption = 'Corrigir'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  A2030000424DA203000000000000620100002800000018000000180000000100
                  08000000000040020000120B0000120B00004B0000004B000000FF00FF009635
                  1100FFFCFA00BD580C00E97F1E00FBAF6600FEDAB500FFEEDD00FFF2E500FFF7
                  EF00FECB9600FED3A400FED7AC00FEDCB600FEE0BF00FFE5C900FFEAD300FFEE
                  DC00FFF3E600FEE5C700FFF8F000ADB16F00ADB17600ADB47D00ADBA6A000081
                  0000007A000000730000037E0800088815000A8B19000C8F1F000B801B001097
                  280019AC40001CB546001EBC4C000D6A2B0002632400C5DECE00035E27000962
                  3D000A6340000D704A003A7F630013835E003595EF003998F0003C9AF200409D
                  F20089A4BD00288AEE002C8CEE003292F0003291EF003796F0003D9AF2001A7D
                  EA001B7DEB001F81ED001F82ED001F82EB002587EE002D8CEF0089A7C7000F73
                  E9001174E9001275E9001377EA001678EA001679EA0007397A003553C700FFFF
                  FF00000000000000000000000000470000000000000000000000000000000000
                  0000000000004747000000000000000000000000000000000000000000474741
                  4700000000000000000000000000202020202A47473C454141472A2020202020
                  202020000000202424244730353E394341414724242424242424200000002024
                  242D473137343D4641472823242447242424200000002024244731314747473A
                  4726191E2424472D2424200000002024244731472B1947472619191C24244747
                  24242001010120242447472D1F1947261919191B242447472424200A0A012024
                  24474724211919191926471C242D47472424200A0A01202424474724221A1919
                  2647471D2D4741472424200A0A012024242D4724241E19264736474747414147
                  2424200A0A0120202020472020202947312F3F3B444147292020202525010000
                  000127272727473131312E333A42472517161518180100000001494949494047
                  3131383647472C250E060C0B0B01000000014949494949404731474732080825
                  130E0D0C0C01000000014949494949492647470808080825130E0D0C0C010000
                  0001252525252525252547252525252525252525250100000001494949494949
                  25494949494949251211100F0F01000000014949494949492549494949494925
                  0912111010010000000149494949494925494949494949250214120707010000
                  0001010101010101010101010101010101010101010100000003040404040404
                  0404040404040405040504480403000000000303030303030303030303030303
                  030303030300}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton28Click
              end
              object SpeedButton29: TSpeedButton
                Left = 691
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Voltar'
                Caption = 'Voltar'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B00000001000000010000942900009C31
                  00009C390000A5390000A5420000AD420000AD4A0000B54A0000B5520000BD52
                  0000BD5A0000C65A0000C6630000CE630000CE6B0000D66B0000D67300009C39
                  0800A5390800A5420800AD420800AD4A0800B5520800BD5A0800CE630800AD4A
                  1000B5521000B55A1000BD5A1000C6631000DE7B1000BD5A1800BD631800C663
                  1800CE731800D6731800DE7B1800DE841800C6632100C66B2100D67B2100DE84
                  2100EF942100D6842900E78C2900EF942900DE8C3100EF943100F79C3100F7A5
                  3100E7943900F7A53900FFA53900F7A54200FFAD4200FFB54200F7AD4A00FFAD
                  4A00FFB54A00FFB55200FFBD5200FFC65200FF00FF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003E3E3E3E3E3E
                  3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E
                  1313133E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E13080A13113E3E3E3E
                  3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E120A0F0A13133E3E3E3E3E3E3E3E3E3E3E
                  3E3E3E3E3E3E3E13130B0F0A13133E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E
                  11130C0E0811113E3E3E131111111111111111111111133E3E11150D0E151111
                  3E3E131B1B16151515151515071513133E3E11150E0C13113E3E192F2C1E0E0E
                  0E0E0E0E0E0F16113E3E3E11160E0A11113E1935332C25180808080808161313
                  3E3E3E3E110A0E15113E193839322F24131111111111133E3E3E3E3E11150E0A
                  111119353B272E302313113E3E3E3E3E3E3E3E3E3E130D0C131119353C1F1935
                  332212113E3E3E3E3E3E3E3E3E130C0C131119353C20002038332213113E3E3E
                  3E3E3E3E3E130C0C131119353B2002022739332813113E3E3E3E3E3E11150E0C
                  131119353B20023E022638362915113E3E3E3E13110A0E0A113E19353B20023E
                  3E011F35362C1A1111111111080E0E14113E19353B20023E3E3E021932363022
                  1B15150A0E0E16113E3E19383C20023E3E3E3E02112732302D1E100E0B15113E
                  3E3E132B3219113E3E3E3E3E1102131B2120161313113E3E3E3E3E1111113E3E
                  3E3E3E3E3E3E1111111111113E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E
                  3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E
                  3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E}
                Layout = blGlyphTop
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = SpeedButton29Click
              end
              object SpeedButton47: TSpeedButton
                Left = 372
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Alterar - [CAR096]'
                Caption = 'Alterar'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000D30E0000D30E00000001000000000000F7844A00FF8C
                  4A00E7845200FF8C5200FF945200E7845A00DE8C5A00FF945A008C6B6300A573
                  6300DE8C6300E78C6300FF946300FF9C630084736B0094736B00AD736B00B57B
                  6B00BD846B00FF9C6B00FFA56B00BD847300C6847300C68C7300CE8C7300D68C
                  7300FFA57300B5847B00BD847B00BD8C7B00C68C7B00CE8C7B00C6947B00CE94
                  7B00D6947B00DE947B00DE9C7B00E79C7B00FFAD7B008C8484008C8C8400CE94
                  8400D6948400D69C8400DE9C8400E79C8400DEA58400E7A58400FFAD8400FFB5
                  8400B5948C00D69C8C00E79C8C00D6A58C00DEA58C00E7A58C00DEAD8C00E7AD
                  8C00EFAD8C00FFB58C00B59C9400DEA59400DEAD9400E7AD9400EFAD9400E7B5
                  9400F7B59400F7BD9400DEAD9C00D6B59C00DEB59C00E7B59C00EFB59C00E7BD
                  9C00EFBD9C00F7BD9C00FFBD9C00E7B5A500E7BDA500EFBDA500F7BDA500FFBD
                  A500E7C6A500EFC6A500F7C6A500FFC6A500FFBDAD00E7C6AD00F7C6AD00FFC6
                  AD00F7CEAD00FFCEAD007384B50094A5B500CEC6B500E7C6B500FFC6B500E7CE
                  B500EFCEB500F7CEB500FFCEB500FFD6B5006B84BD009CA5BD009CADBD00EFCE
                  BD00FFCEBD00EFD6BD00FFD6BD00FFDEBD00FFCEC600FFD6C600F7DEC600FFDE
                  C600FFE7C600FFD6CE00FFDECE00FFE7CE00FFEFCE00FFF7CE007BADD600FFDE
                  D600FFF7D600FFE7DE006394E700FFE7E700FFEFE700FFF7E700FFEFEF00FFFF
                  F700FF00FF007394FF0094BDFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00828282828282
                  8282828282828282828282828282828282828282828282828282828282828282
                  8282828282828282828282828282828282828282828282828282828282828282
                  8282828282828282321109080E27272727272727273282828282828282828282
                  1B4C423A2C2C2C2C2C2C2C2C2C29828282828282828282821B481618394B2C3A
                  2C15102C2C29828282828282828282821C3658552C2922184B2B2C2C2C298282
                  82828282828282821D4817183F4B1E3955444644442982828282828282828282
                  1D366355362B2C224B2121292929828282828282828282821D505F70443E6C58
                  2B3F42424229828282828282828282821E5B3E3E544A614E4857717171298282
                  82828282828282821E4F1E214154203E5B464545452982828282828282828282
                  1E3E63553D35372C4F5C665C5C2982828282828282828282294F697246446D6C
                  3C7C8383832982828282828282828282295B4E46544F614E5778848484298282
                  828282828282828229655A586465585A655E6868682982828282828282828282
                  2953383F3E3E3E474E4E5A5A5A29828282828282828282823353060001010303
                  0307070705298282828282828282828233655A41382E2E240B05050505298282
                  8282828282828282337676727272716D6D6C6C6C6C2982828282828282828282
                  82335A6D727677777776767633828282828282828282828282823E3E33333333
                  3333333382828282828282828282828282828282828282828282828282828282
                  8282828282828282828282828282828282828282828282828282}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton47Click
              end
              object SpeedButton49: TSpeedButton
                Left = 428
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Atualizar valor l'#237'quido  - [CAR106]'
                Caption = 'Atualizar'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000330B0000330B00000001000000010000007B00000094
                  000000C6000000314A00084263006363630084848400085A940010849C002194
                  9C00A5FFA5001873AD002984BD002184C600429CC60042A5C6004AA5C600C6C6
                  C600C6FFC6005A5ACE003963CE00107BCE0042A5CE005AA5CE0073B5D6006BBD
                  D6007BBDD6006BC6D6004A5ADE0073C6DE007BCEDE0039A5E700299CEF007B9C
                  EF008CCEEF0094DEEF0052C6F700FF00FF008C94FF0084A5FF004ABDFF007BE7
                  FF0094E7FF009CE7FF008CF7FF00BDFFFF00C6FFFF00D6FFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00252525252525
                  2525252525252525252525252525252525252525252525252525252525252525
                  2525252525252525252525252525252525252525252525252525252525252525
                  2525252525252525252525252506070404040306252525252525252525250607
                  0404030625282F2D2C2C201525252525252525252525282F2D2C201525062828
                  282828060403252525252525252506282828280625252525272A2D1E100C1325
                  2525252525252525252525252525252526222D190E0D1C252525252525252525
                  2525252525252525250704040403252525252525252525252525252525252525
                  21222D190E0D14252525252500000000000000000000000018232D190E0D0B00
                  000025250001010101020A121212121212170404040301010100252500010101
                  020A1212120505051A1D2D1B0F0D080101002525000101020A121212052E112E
                  222B2D29241F0901010025250001020A121212052E1111111128282828281202
                  0100252500010212121212052E2E11112E2E051212121202010025250001020A
                  12121212051111111105121212120A0201002525000101020A12121212050505
                  05121212120A02010100252500010101020A121212121212121212120A020101
                  010025250001010101021212121212121212120A020101010100252500000000
                  0000000000000000000000000000000000002525252525252525252525252525
                  2525252525252525252525252525252525252525252525252525252525252525
                  2525252525252525252525252525252525252525252525252525}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton49Click
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 876
          ExplicitHeight = 520
        end
        object tsRelatorio: TTabSheet
          Caption = 'tsRelatorio'
          ImageIndex = 3
          object relCR: TQuickRep
            Left = -9
            Top = 0
            Width = 816
            Height = 1056
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            BeforePrint = relCRBeforePrint
            DataSet = dtmContasAReceber.cdsCtrlCr
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
            OnPreview = relCRPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = Letter
            Page.Values = (
              100.000000000000000000
              2794.000000000000000000
              100.000000000000000000
              2159.000000000000000000
              100.000000000000000000
              100.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = First
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
            PrevFormStyle = fsNormal
            PreviewInitialState = wsNormal
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object QRBand7: TQRBand
              Left = 38
              Top = 38
              Width = 740
              Height = 122
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRBand7BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                322.791666666666700000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRLabel29: TQRLabel
                Left = 2
                Top = 36
                Width = 343
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  95.250000000000000000
                  907.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Relat'#243'rio de Cr'#233'ditos'
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
              object QRLabel35: TQRLabel
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
              object QRSysData5: TQRSysData
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
              object QRLabel36: TQRLabel
                Left = 631
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
                  1669.520833333333000000
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
              object QRSysData6: TQRSysData
                Left = 684
                Top = 60
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1809.750000000000000000
                  158.750000000000000000
                  121.708333333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape7: TQRShape
                Left = 3
                Top = 79
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  209.020833333333300000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape8: TQRShape
                Left = 3
                Top = 117
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  309.562500000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel37: TQRLabel
                Left = 8
                Top = 83
                Width = 51
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  21.166666666666670000
                  219.604166666666700000
                  134.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nome Ref.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel38: TQRLabel
                Left = 152
                Top = 83
                Width = 48
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  402.166666666666700000
                  219.604166666666700000
                  127.000000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data Rec.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel39: TQRLabel
                Left = 305
                Top = 83
                Width = 70
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  806.979166666666800000
                  219.604166666666700000
                  185.208333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'N'#186' Documento'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel40: TQRLabel
                Left = 384
                Top = 83
                Width = 43
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1016.000000000000000000
                  219.604166666666700000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Hist'#243'rico'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel41: TQRLabel
                Left = 704
                Top = 83
                Width = 27
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1862.666666666667000000
                  219.604166666666700000
                  71.437500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Valor'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel42: TQRLabel
                Left = 592
                Top = 83
                Width = 43
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1566.333333333333000000
                  219.604166666666700000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Dt.Venc.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel43: TQRLabel
                Left = 211
                Top = 84
                Width = 46
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  558.270833333333400000
                  222.250000000000000000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Tipo Doc.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel60: TQRLabel
                Left = 605
                Top = 99
                Width = 69
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1600.729166666667000000
                  261.937500000000000000
                  182.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data Quita'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel61: TQRLabel
                Left = 388
                Top = 99
                Width = 41
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1026.583333333333000000
                  261.937500000000000000
                  108.479166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Controle'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel68: TQRLabel
                Left = 8
                Top = 101
                Width = 71
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  21.166666666666670000
                  267.229166666666700000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nome Terceiro'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object qrlNome_Emp: TQRLabel
                Left = 3
                Top = 10
                Width = 147
                Height = 25
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  66.145833333333340000
                  7.937500000000000000
                  26.458333333333330000
                  388.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'qrlNome_Emp'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 16
              end
              object QRLabel5: TQRLabel
                Left = 299
                Top = 98
                Width = 28
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  791.104166666666800000
                  259.291666666666700000
                  74.083333333333340000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Juros'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel6: TQRLabel
                Left = 335
                Top = 98
                Width = 47
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  886.354166666666900000
                  259.291666666666700000
                  124.354166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Desconto'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel59: TQRLabel
                Left = 680
                Top = 98
                Width = 21
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1799.166666666667000000
                  259.291666666666700000
                  55.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Emp'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object QRBand8: TQRBand
              Left = 38
              Top = 160
              Width = 740
              Height = 36
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRBand8BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                95.250000000000000000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText10: TQRDBText
                Left = 138
                Top = 1
                Width = 69
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  365.125000000000000000
                  2.645833333333333000
                  182.562500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'DATA_REC_C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText11: TQRDBText
                Left = 8
                Top = 1
                Width = 127
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  21.166666666666670000
                  2.645833333333333000
                  336.020833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'NOME_C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText12: TQRDBText
                Left = 304
                Top = 1
                Width = 73
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  804.333333333333200000
                  2.645833333333333000
                  193.145833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'N_DOC_C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
              object QRDBText14: TQRDBText
                Left = 384
                Top = 1
                Width = 185
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1016.000000000000000000
                  2.645833333333333000
                  489.479166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'HISTORICO_C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText15: TQRDBText
                Left = 644
                Top = 1
                Width = 89
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1703.916666666667000000
                  2.645833333333333000
                  235.479166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'VALOR_C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText16: TQRDBText
                Left = 576
                Top = 0
                Width = 66
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1524.000000000000000000
                  0.000000000000000000
                  174.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'DATA_VENC_C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText17: TQRDBText
                Left = 209
                Top = 1
                Width = 87
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  552.979166666666700000
                  2.645833333333333000
                  230.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'TIPO_DOC_C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText26: TQRDBText
                Left = 585
                Top = 17
                Width = 89
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1547.812500000000000000
                  44.979166666666670000
                  235.479166666666700000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'DATQ_C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText27: TQRDBText
                Left = 9
                Top = 17
                Width = 264
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  23.812500000000000000
                  44.979166666666670000
                  698.500000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'NOME_TERC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText28: TQRDBText
                Left = 388
                Top = 17
                Width = 192
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1026.583333333333000000
                  44.979166666666670000
                  508.000000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'NOME_CTRL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText1: TQRDBText
                Left = 276
                Top = 17
                Width = 51
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  730.250000000000000000
                  44.979166666666670000
                  134.937500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'JUROS_COB'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
              object QRDBText2: TQRDBText
                Left = 331
                Top = 17
                Width = 51
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  875.770833333333400000
                  44.979166666666670000
                  134.937500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'VALOR_DESC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
              object QRDBText35: TQRDBText
                Left = 680
                Top = 17
                Width = 57
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1799.166666666667000000
                  44.979166666666670000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCr
                DataField = 'COD_EMP_MULT'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object QRBand9: TQRBand
              Left = 38
              Top = 196
              Width = 740
              Height = 117
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRBand9BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                309.562500000000000000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape9: TQRShape
                Left = 5
                Top = 7
                Width = 731
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  13.229166666666670000
                  18.520833333333330000
                  1934.104166666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel46: TQRLabel
                Left = 644
                Top = 61
                Width = 89
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1703.916666666667000000
                  161.395833333333300000
                  235.479166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'QRLabel46'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel2: TQRLabel
                Left = 7
                Top = 82
                Width = 210
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  18.520833333333330000
                  216.958333333333400000
                  555.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'TOTAL DE CREDITOS QUITADOS: '
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel3: TQRLabel
                Left = 7
                Top = 63
                Width = 242
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  18.520833333333330000
                  166.687500000000000000
                  640.291666666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'TOTAL DE CREDITOS N'#195'O QUITADOS: '
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel4: TQRLabel
                Left = 644
                Top = 82
                Width = 89
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1703.916666666667000000
                  216.958333333333300000
                  235.479166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'QRLabel4'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel7: TQRLabel
                Left = 17
                Top = 28
                Width = 133
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  44.979166666666670000
                  74.083333333333340000
                  351.895833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Total Juros Recebidos:'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel8: TQRLabel
                Left = 429
                Top = 28
                Width = 169
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1135.062500000000000000
                  74.083333333333340000
                  447.145833333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Total Descontos concedidos:'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel9: TQRLabel
                Left = 156
                Top = 28
                Width = 149
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  412.750000000000000000
                  74.083333333333320000
                  394.229166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'QRLabel9'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel10: TQRLabel
                Left = 604
                Top = 29
                Width = 132
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1598.083333333333000000
                  76.729166666666680000
                  349.250000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'QRLabel10'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
            object QRBand2: TQRBand
              Left = 38
              Top = 313
              Width = 740
              Height = 25
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = True
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                66.145833333333330000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRShape2: TQRShape
                Left = 2
                Top = 3
                Width = 731
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  5.291666666666667000
                  7.937500000000000000
                  1934.104166666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel1: TQRLabel
                Left = 4
                Top = 7
                Width = 174
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  18.520833333333330000
                  460.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas  Computadores'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
            object relCR2: TQuickRep
              Left = 0
              Top = 301
              Width = 816
              Height = 1056
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              BeforePrint = relCRBeforePrint
              DataSet = dtmContasAReceber.cdsCtrlCr
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
              OnPreview = relCRPreview
              Options = [FirstPageHeader, LastPageFooter]
              Page.Columns = 1
              Page.Orientation = poPortrait
              Page.PaperSize = Letter
              Page.Values = (
                100.000000000000000000
                2794.000000000000000000
                100.000000000000000000
                2159.000000000000000000
                100.000000000000000000
                100.000000000000000000
                0.000000000000000000)
              PrinterSettings.Copies = 1
              PrinterSettings.OutputBin = First
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
              PrevFormStyle = fsNormal
              PreviewInitialState = wsNormal
              PrevInitialZoom = qrZoomToFit
              PreviewDefaultSaveType = stQRP
              object QRBand3: TQRBand
                Left = 38
                Top = 38
                Width = 740
                Height = 122
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                BeforePrint = QRBand7BeforePrint
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  322.791666666666700000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbPageHeader
                object QRLabel11: TQRLabel
                  Left = 2
                  Top = 36
                  Width = 343
                  Height = 24
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    63.500000000000000000
                    5.291666666666667000
                    95.250000000000000000
                    907.520833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'Relat'#243'rio de Cr'#233'ditos'
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
                object QRLabel12: TQRLabel
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
                object QRLabel13: TQRLabel
                  Left = 631
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
                    1669.520833333333000000
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
                  Left = 684
                  Top = 60
                  Width = 46
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1809.750000000000000000
                    158.750000000000000000
                    121.708333333333300000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  Color = clWhite
                  Data = qrsPageNumber
                  Transparent = False
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRShape3: TQRShape
                  Left = 3
                  Top = 79
                  Width = 734
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    7.937500000000000000
                    209.020833333333300000
                    1942.041666666667000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape4: TQRShape
                  Left = 3
                  Top = 117
                  Width = 734
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    7.937500000000000000
                    309.562500000000000000
                    1942.041666666667000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel14: TQRLabel
                  Left = 8
                  Top = 83
                  Width = 51
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    21.166666666666670000
                    219.604166666666700000
                    134.937500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Nome Ref.'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel15: TQRLabel
                  Left = 152
                  Top = 83
                  Width = 48
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    402.166666666666700000
                    219.604166666666700000
                    127.000000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data Rec.'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel16: TQRLabel
                  Left = 305
                  Top = 83
                  Width = 70
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    806.979166666666800000
                    219.604166666666700000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'N'#186' Documento'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel17: TQRLabel
                  Left = 384
                  Top = 83
                  Width = 43
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1016.000000000000000000
                    219.604166666666700000
                    113.770833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Hist'#243'rico'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel18: TQRLabel
                  Left = 704
                  Top = 83
                  Width = 27
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1862.666666666667000000
                    219.604166666666700000
                    71.437500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Valor'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel19: TQRLabel
                  Left = 592
                  Top = 83
                  Width = 43
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1566.333333333333000000
                    219.604166666666700000
                    113.770833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Dt.Venc.'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel20: TQRLabel
                  Left = 211
                  Top = 84
                  Width = 46
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    558.270833333333400000
                    222.250000000000000000
                    121.708333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Tipo Doc.'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel21: TQRLabel
                  Left = 665
                  Top = 99
                  Width = 69
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1759.479166666667000000
                    261.937500000000000000
                    182.562500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data Quita'#231#227'o'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel22: TQRLabel
                  Left = 432
                  Top = 100
                  Width = 41
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1143.000000000000000000
                    264.583333333333400000
                    108.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Controle'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel23: TQRLabel
                  Left = 8
                  Top = 101
                  Width = 71
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    21.166666666666670000
                    267.229166666666700000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Nome Terceiro'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object qrlNome_Emp2: TQRLabel
                  Left = 3
                  Top = 10
                  Width = 159
                  Height = 25
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    66.145833333333340000
                    7.937500000000000000
                    26.458333333333330000
                    420.687500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'qrlNome_Emp2'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -21
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 16
                end
                object QRLabel25: TQRLabel
                  Left = 315
                  Top = 99
                  Width = 28
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    833.437500000000000000
                    261.937500000000000000
                    74.083333333333340000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Juros'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel26: TQRLabel
                  Left = 372
                  Top = 99
                  Width = 47
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    984.250000000000000000
                    261.937500000000000000
                    124.354166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Desconto'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
              end
              object QRBand4: TQRBand
                Left = 38
                Top = 190
                Width = 740
                Height = 36
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                BeforePrint = QRBand8BeforePrint
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  95.250000000000000000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbDetail
                object QRDBText3: TQRDBText
                  Left = 138
                  Top = 1
                  Width = 69
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    365.125000000000000000
                    2.645833333333333000
                    182.562500000000000000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'DATA_REC_C'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText4: TQRDBText
                  Left = 8
                  Top = 1
                  Width = 127
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    21.166666666666670000
                    2.645833333333333000
                    336.020833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'NOME_C'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText5: TQRDBText
                  Left = 304
                  Top = 1
                  Width = 73
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    804.333333333333200000
                    2.645833333333333000
                    193.145833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'N_DOC_C'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -8
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 6
                end
                object QRDBText6: TQRDBText
                  Left = 384
                  Top = 1
                  Width = 185
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1016.000000000000000000
                    2.645833333333333000
                    489.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'HISTORICO_C'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 7
                end
                object QRDBText7: TQRDBText
                  Left = 644
                  Top = 1
                  Width = 89
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1703.916666666667000000
                    2.645833333333333000
                    235.479166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'VALOR_C'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText8: TQRDBText
                  Left = 576
                  Top = 0
                  Width = 66
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1524.000000000000000000
                    0.000000000000000000
                    174.625000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'DATA_VENC_C'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText9: TQRDBText
                  Left = 209
                  Top = 1
                  Width = 87
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    552.979166666666700000
                    2.645833333333333000
                    230.187500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'TIPO_DOC_C'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText13: TQRDBText
                  Left = 645
                  Top = 19
                  Width = 89
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1706.562500000000000000
                    50.270833333333330000
                    235.479166666666700000)
                  Alignment = taCenter
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'DATQ_C'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText18: TQRDBText
                  Left = 9
                  Top = 17
                  Width = 264
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    23.812500000000000000
                    44.979166666666670000
                    698.500000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'NOME_TERC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText19: TQRDBText
                  Left = 433
                  Top = 17
                  Width = 192
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1145.645833333333000000
                    44.979166666666670000
                    508.000000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'NOME_CTRL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText32: TQRDBText
                  Left = 294
                  Top = 17
                  Width = 51
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    777.875000000000000000
                    44.979166666666670000
                    134.937500000000000000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'JUROS_COB'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -8
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 6
                end
                object QRDBText33: TQRDBText
                  Left = 368
                  Top = 17
                  Width = 51
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    973.666666666666800000
                    44.979166666666670000
                    134.937500000000000000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'VALOR_DESC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -8
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 6
                end
              end
              object QRBand5: TQRBand
                Left = 38
                Top = 226
                Width = 740
                Height = 117
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                BeforePrint = QRBand5BeforePrint
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  309.562500000000000000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbGroupFooter
                object QRShape5: TQRShape
                  Left = 5
                  Top = 7
                  Width = 731
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    13.229166666666670000
                    18.520833333333330000
                    1934.104166666667000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel27: TQRLabel
                  Left = 644
                  Top = 61
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1703.916666666667000000
                    161.395833333333300000
                    235.479166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel27'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel28: TQRLabel
                  Left = 7
                  Top = 82
                  Width = 210
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    18.520833333333330000
                    216.958333333333400000
                    555.625000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'TOTAL DE CREDITOS QUITADOS: '
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel30: TQRLabel
                  Left = 7
                  Top = 63
                  Width = 242
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    18.520833333333330000
                    166.687500000000000000
                    640.291666666666800000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'TOTAL DE CREDITOS N'#195'O QUITADOS: '
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel31: TQRLabel
                  Left = 644
                  Top = 82
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1703.916666666667000000
                    216.958333333333300000
                    235.479166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel31'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel32: TQRLabel
                  Left = 17
                  Top = 28
                  Width = 133
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    44.979166666666670000
                    74.083333333333340000
                    351.895833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Total Juros Recebidos:'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel33: TQRLabel
                  Left = 429
                  Top = 28
                  Width = 169
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1135.062500000000000000
                    74.083333333333340000
                    447.145833333333400000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Total Descontos concedidos:'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel34: TQRLabel
                  Left = 156
                  Top = 28
                  Width = 149
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    412.750000000000000000
                    74.083333333333320000
                    394.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel34'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel44: TQRLabel
                  Left = 604
                  Top = 29
                  Width = 132
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1598.083333333333000000
                    76.729166666666680000
                    349.250000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel44'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
              object QRBand6: TQRBand
                Left = 38
                Top = 343
                Width = 740
                Height = 25
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = True
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  66.145833333333330000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbPageFooter
                object QRShape6: TQRShape
                  Left = 2
                  Top = 3
                  Width = 731
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    5.291666666666667000
                    7.937500000000000000
                    1934.104166666667000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel45: TQRLabel
                  Left = 4
                  Top = 7
                  Width = 174
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    10.583333333333330000
                    18.520833333333330000
                    460.375000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'HW Sistemas  Computadores'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
              object QRGroup1: TQRGroup
                Left = 38
                Top = 160
                Width = 740
                Height = 30
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
                  79.375000000000000000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                Expression = 'cdsCtrlCr.COD_EMP_MULT'
                FooterBand = QRBand5
                Master = relCR2
                ReprintOnNewPage = False
                object QRLabel24: TQRLabel
                  Left = 8
                  Top = 4
                  Width = 33
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    21.166666666666670000
                    10.583333333333330000
                    87.312500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'EMP:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText34: TQRDBText
                  Left = 47
                  Top = 4
                  Width = 40
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    124.354166666666700000
                    10.583333333333330000
                    105.833333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCr
                  DataField = 'COD_EMP_MULT'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
            end
          end
        end
        object tsRelatorioCH: TTabSheet
          Caption = 'tsRelatorioCH'
          ImageIndex = 9
          object relCH: TQuickRep
            Left = -9
            Top = -8
            Width = 816
            Height = 1056
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            BeforePrint = relCHBeforePrint
            DataSet = dtmContasAReceber.cdsCtrlCh
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
            OnPreview = relCHPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = Letter
            Page.Values = (
              100.000000000000000000
              2794.000000000000000000
              100.000000000000000000
              2159.000000000000000000
              100.000000000000000000
              100.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = First
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
            PrevFormStyle = fsNormal
            PreviewInitialState = wsNormal
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object QRBand10: TQRBand
              Left = 38
              Top = 38
              Width = 740
              Height = 125
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRBand10BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                330.729166666666700000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRLabel47: TQRLabel
                Left = 2
                Top = 36
                Width = 343
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  95.250000000000000000
                  907.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Relat'#243'rio de Cheques'
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
              object QRLabel48: TQRLabel
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
              object QRSysData7: TQRSysData
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
              object QRLabel49: TQRLabel
                Left = 631
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
                  1669.520833333333000000
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
              object QRSysData8: TQRSysData
                Left = 684
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
                  1809.750000000000000000
                  161.395833333333300000
                  121.708333333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape10: TQRShape
                Left = 3
                Top = 79
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  209.020833333333300000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape11: TQRShape
                Left = 3
                Top = 120
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  317.500000000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel50: TQRLabel
                Left = 8
                Top = 83
                Width = 51
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  21.166666666666670000
                  219.604166666666700000
                  134.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Dt.Entrada'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel51: TQRLabel
                Left = 64
                Top = 83
                Width = 28
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  169.333333333333300000
                  219.604166666666700000
                  74.083333333333330000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nome'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel52: TQRLabel
                Left = 232
                Top = 83
                Width = 53
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  613.833333333333300000
                  219.604166666666700000
                  140.229166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'N'#186' Cheque'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel53: TQRLabel
                Left = 509
                Top = 83
                Width = 27
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1346.729166666667000000
                  219.604166666666700000
                  71.437500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Valor'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel54: TQRLabel
                Left = 557
                Top = 83
                Width = 43
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1473.729166666667000000
                  219.604166666666700000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Dt.Venc.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel55: TQRLabel
                Left = 623
                Top = 83
                Width = 43
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1648.354166666667000000
                  219.604166666666700000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Situa'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel62: TQRLabel
                Left = 8
                Top = 102
                Width = 41
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  21.166666666666670000
                  269.875000000000000000
                  108.479166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Controle'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel63: TQRLabel
                Left = 144
                Top = 102
                Width = 63
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  381.000000000000000000
                  269.875000000000000000
                  166.687500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Banco/Pra'#231'a'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel67: TQRLabel
                Left = 301
                Top = 102
                Width = 43
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  796.395833333333300000
                  269.875000000000000000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Hist'#243'rico'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object qrlNomeEmpresa: TQRLabel
                Left = 3
                Top = 10
                Width = 179
                Height = 25
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  66.145833333333330000
                  7.937500000000000000
                  26.458333333333330000
                  473.604166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'qrlNomeEmpresa'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 16
              end
              object QRLabel66: TQRLabel
                Left = 712
                Top = 83
                Width = 21
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1883.833333333333000000
                  219.604166666666700000
                  55.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Emp'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel82: TQRLabel
                Left = 318
                Top = 83
                Width = 41
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  841.375000000000000000
                  219.604166666666700000
                  108.479166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Ag'#234'ncia'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel88: TQRLabel
                Left = 369
                Top = 83
                Width = 29
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  976.312500000000000000
                  219.604166666666700000
                  76.729166666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Conta'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object QRBand11: TQRBand
              Left = 38
              Top = 163
              Width = 740
              Height = 31
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRBand11BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                82.020833333333330000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText20: TQRDBText
                Left = 5
                Top = 1
                Width = 55
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  13.229166666666670000
                  2.645833333333333000
                  145.520833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'DATA_REC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText21: TQRDBText
                Left = 64
                Top = 1
                Width = 153
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  169.333333333333300000
                  2.645833333333333000
                  404.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'NOME_CH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText22: TQRDBText
                Left = 232
                Top = 1
                Width = 80
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  613.833333333333400000
                  2.645833333333333000
                  211.666666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'N_CH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText23: TQRDBText
                Left = 449
                Top = 1
                Width = 89
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1187.979166666667000000
                  2.645833333333333000
                  235.479166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'VALOR_CH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText24: TQRDBText
                Left = 555
                Top = 0
                Width = 58
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1468.437500000000000000
                  0.000000000000000000
                  153.458333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'DATA_VENC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText25: TQRDBText
                Left = 623
                Top = -1
                Width = 82
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1648.354166666667000000
                  -2.645833333333333000
                  216.958333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'STATUS_CH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText29: TQRDBText
                Left = 8
                Top = 16
                Width = 113
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  21.166666666666670000
                  42.333333333333330000
                  298.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'NOME_CTRL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText30: TQRDBText
                Left = 144
                Top = 16
                Width = 145
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  381.000000000000000000
                  42.333333333333330000
                  383.645833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'BANCO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText31: TQRDBText
                Left = 301
                Top = 16
                Width = 428
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  796.395833333333200000
                  42.333333333333330000
                  1132.416666666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'HISTORICO_CH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText36: TQRDBText
                Left = 712
                Top = 1
                Width = 25
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1883.833333333333000000
                  2.645833333333333000
                  66.145833333333340000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'COD_EMP_MULT'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText46: TQRDBText
                Left = 318
                Top = 1
                Width = 41
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  841.375000000000000000
                  2.645833333333333000
                  108.479166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'AGENCIA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText48: TQRDBText
                Left = 369
                Top = 1
                Width = 76
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  976.312500000000000000
                  2.645833333333333000
                  201.083333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmContasAReceber.cdsCtrlCh
                DataField = 'CONTA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object QRBand12: TQRBand
              Left = 38
              Top = 194
              Width = 740
              Height = 70
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRBand12BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                185.208333333333300000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape12: TQRShape
                Left = 5
                Top = 7
                Width = 731
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  13.229166666666670000
                  18.520833333333330000
                  1934.104166666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel57: TQRLabel
                Left = 7
                Top = 15
                Width = 241
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  18.520833333333330000
                  39.687500000000000000
                  637.645833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'TOTAL DE CHEQUES N'#195'O QUITADOS: '
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel58: TQRLabel
                Left = 556
                Top = 16
                Width = 89
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1471.083333333333000000
                  42.333333333333340000
                  235.479166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'QRLabel58'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel64: TQRLabel
                Left = 7
                Top = 34
                Width = 209
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  18.520833333333330000
                  89.958333333333330000
                  552.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'TOTAL DE CHEQUES QUITADOS: '
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel65: TQRLabel
                Left = 556
                Top = 35
                Width = 89
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1471.083333333333000000
                  92.604166666666680000
                  235.479166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'QRLabel65'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
            object QRBand1: TQRBand
              Left = 38
              Top = 264
              Width = 740
              Height = 27
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = True
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                71.437500000000000000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRShape1: TQRShape
                Left = 2
                Top = 3
                Width = 731
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  5.291666666666667000
                  7.937500000000000000
                  1934.104166666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel56: TQRLabel
                Left = 4
                Top = 7
                Width = 174
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  18.520833333333330000
                  460.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas  Computadores'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
            object relCH2: TQuickRep
              Left = 1
              Top = 297
              Width = 816
              Height = 1056
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              BeforePrint = relCHBeforePrint
              DataSet = dtmContasAReceber.cdsCtrlCh
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
              OnPreview = relCHPreview
              Options = [FirstPageHeader, LastPageFooter]
              Page.Columns = 1
              Page.Orientation = poPortrait
              Page.PaperSize = Letter
              Page.Values = (
                100.000000000000000000
                2794.000000000000000000
                100.000000000000000000
                2159.000000000000000000
                100.000000000000000000
                100.000000000000000000
                0.000000000000000000)
              PrinterSettings.Copies = 1
              PrinterSettings.OutputBin = First
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
              PrevFormStyle = fsNormal
              PreviewInitialState = wsNormal
              PrevInitialZoom = qrZoomToFit
              PreviewDefaultSaveType = stQRP
              object QRBand13: TQRBand
                Left = 38
                Top = 38
                Width = 740
                Height = 125
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                BeforePrint = QRBand10BeforePrint
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  330.729166666666700000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbPageHeader
                object QRLabel69: TQRLabel
                  Left = 2
                  Top = 36
                  Width = 343
                  Height = 24
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    63.500000000000000000
                    5.291666666666667000
                    95.250000000000000000
                    907.520833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'Relat'#243'rio de Cheques'
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
                object QRLabel70: TQRLabel
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
                object QRSysData3: TQRSysData
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
                object QRLabel71: TQRLabel
                  Left = 631
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
                    1669.520833333333000000
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
                object QRSysData4: TQRSysData
                  Left = 684
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
                    1809.750000000000000000
                    161.395833333333300000
                    121.708333333333300000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  Color = clWhite
                  Data = qrsPageNumber
                  Transparent = False
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRShape13: TQRShape
                  Left = 3
                  Top = 79
                  Width = 734
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    7.937500000000000000
                    209.020833333333300000
                    1942.041666666667000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape14: TQRShape
                  Left = 3
                  Top = 120
                  Width = 734
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    7.937500000000000000
                    317.500000000000000000
                    1942.041666666667000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel72: TQRLabel
                  Left = 8
                  Top = 83
                  Width = 51
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    21.166666666666670000
                    219.604166666666700000
                    134.937500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Dt.Entrada'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel73: TQRLabel
                  Left = 64
                  Top = 83
                  Width = 28
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    169.333333333333300000
                    219.604166666666700000
                    74.083333333333330000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Nome'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel74: TQRLabel
                  Left = 232
                  Top = 83
                  Width = 53
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    613.833333333333300000
                    219.604166666666700000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'N'#186' Cheque'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel75: TQRLabel
                  Left = 509
                  Top = 83
                  Width = 27
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1346.729166666667000000
                    219.604166666666700000
                    71.437500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Valor'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel76: TQRLabel
                  Left = 557
                  Top = 83
                  Width = 43
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1473.729166666667000000
                    219.604166666666700000
                    113.770833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Dt.Venc.'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel77: TQRLabel
                  Left = 624
                  Top = 83
                  Width = 43
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1651.000000000000000000
                    219.604166666666700000
                    113.770833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Situa'#231#227'o'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel78: TQRLabel
                  Left = 8
                  Top = 102
                  Width = 41
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    21.166666666666670000
                    269.875000000000000000
                    108.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Controle'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel79: TQRLabel
                  Left = 144
                  Top = 102
                  Width = 63
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    381.000000000000000000
                    269.875000000000000000
                    166.687500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Banco/Pra'#231'a'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel80: TQRLabel
                  Left = 301
                  Top = 102
                  Width = 43
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    796.395833333333300000
                    269.875000000000000000
                    113.770833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Hist'#243'rico'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object qrlNomeEmpresa2: TQRLabel
                  Left = 3
                  Top = 10
                  Width = 179
                  Height = 25
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    66.145833333333330000
                    7.937500000000000000
                    26.458333333333330000
                    473.604166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'qrlNomeEmpresa'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -21
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 16
                end
                object QRLabel89: TQRLabel
                  Left = 318
                  Top = 83
                  Width = 41
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    841.375000000000000000
                    219.604166666666700000
                    108.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Ag'#234'ncia'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel90: TQRLabel
                  Left = 369
                  Top = 83
                  Width = 29
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    976.312500000000000000
                    219.604166666666700000
                    76.729166666666670000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Conta'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
              end
              object QRBand14: TQRBand
                Left = 38
                Top = 193
                Width = 740
                Height = 31
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                BeforePrint = QRBand11BeforePrint
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  82.020833333333330000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbDetail
                object QRDBText37: TQRDBText
                  Left = 5
                  Top = 1
                  Width = 55
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    13.229166666666670000
                    2.645833333333333000
                    145.520833333333300000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'DATA_REC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText38: TQRDBText
                  Left = 64
                  Top = 1
                  Width = 153
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    169.333333333333300000
                    2.645833333333333000
                    404.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'NOME_CH'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText39: TQRDBText
                  Left = 232
                  Top = 1
                  Width = 80
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    613.833333333333400000
                    2.645833333333333000
                    211.666666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'N_CH'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText40: TQRDBText
                  Left = 449
                  Top = 1
                  Width = 89
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1187.979166666667000000
                    2.645833333333333000
                    235.479166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'VALOR_CH'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText41: TQRDBText
                  Left = 555
                  Top = 0
                  Width = 58
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1468.437500000000000000
                    0.000000000000000000
                    153.458333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'DATA_VENC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText42: TQRDBText
                  Left = 623
                  Top = -1
                  Width = 82
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1648.354166666667000000
                    -2.645833333333333000
                    216.958333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'STATUS_CH'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText43: TQRDBText
                  Left = 8
                  Top = 16
                  Width = 113
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    21.166666666666670000
                    42.333333333333330000
                    298.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'NOME_CTRL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText44: TQRDBText
                  Left = 144
                  Top = 16
                  Width = 145
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    381.000000000000000000
                    42.333333333333330000
                    383.645833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'BANCO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText45: TQRDBText
                  Left = 301
                  Top = 16
                  Width = 428
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    796.395833333333200000
                    42.333333333333330000
                    1132.416666666667000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'HISTORICO_CH'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText49: TQRDBText
                  Left = 318
                  Top = 1
                  Width = 41
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    841.375000000000000000
                    2.645833333333333000
                    108.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'AGENCIA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText50: TQRDBText
                  Left = 369
                  Top = 1
                  Width = 76
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    976.312500000000000000
                    2.645833333333333000
                    201.083333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'CONTA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
              end
              object QRBand15: TQRBand
                Left = 38
                Top = 224
                Width = 740
                Height = 70
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                BeforePrint = QRBand12BeforePrint
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  185.208333333333300000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbGroupFooter
                object QRShape15: TQRShape
                  Left = 5
                  Top = 7
                  Width = 731
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    13.229166666666670000
                    18.520833333333330000
                    1934.104166666667000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel83: TQRLabel
                  Left = 7
                  Top = 15
                  Width = 241
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    18.520833333333330000
                    39.687500000000000000
                    637.645833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'TOTAL DE CHEQUES N'#195'O QUITADOS: '
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel84: TQRLabel
                  Left = 556
                  Top = 16
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1471.083333333333000000
                    42.333333333333340000
                    235.479166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel84'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel85: TQRLabel
                  Left = 7
                  Top = 34
                  Width = 209
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    18.520833333333330000
                    89.958333333333330000
                    552.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'TOTAL DE CHEQUES QUITADOS: '
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel86: TQRLabel
                  Left = 556
                  Top = 35
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1471.083333333333000000
                    92.604166666666680000
                    235.479166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel86'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
              object QRBand16: TQRBand
                Left = 38
                Top = 294
                Width = 740
                Height = 27
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = True
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  71.437500000000000000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbPageFooter
                object QRShape16: TQRShape
                  Left = 2
                  Top = 3
                  Width = 731
                  Height = 3
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    7.937500000000000000
                    5.291666666666667000
                    7.937500000000000000
                    1934.104166666667000000)
                  Brush.Color = clBlack
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel87: TQRLabel
                  Left = 4
                  Top = 7
                  Width = 174
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    10.583333333333330000
                    18.520833333333330000
                    460.375000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'HW Sistemas  Computadores'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
              object QRGroup2: TQRGroup
                Left = 38
                Top = 163
                Width = 740
                Height = 30
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
                  79.375000000000000000
                  1957.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                Expression = 'cdsCtrlCh.COD_EMP_MULT'
                FooterBand = QRBand15
                Master = relCH2
                ReprintOnNewPage = False
                object QRLabel81: TQRLabel
                  Left = 8
                  Top = 4
                  Width = 33
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    21.166666666666670000
                    10.583333333333330000
                    87.312500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'EMP:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText47: TQRDBText
                  Left = 48
                  Top = 4
                  Width = 40
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    127.000000000000000000
                    10.583333333333330000
                    105.833333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmContasAReceber.cdsCtrlCh
                  DataField = 'COD_EMP_MULT'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
            end
          end
        end
        object tsAvancado: TTabSheet
          Caption = 'tsAvancado'
          ImageIndex = 7
          object pnNegativar: TPanel
            Left = 0
            Top = 149
            Width = 438
            Height = 217
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            OnEnter = pnNegativarEnter
            object Panel25: TPanel
              Left = 9
              Top = 163
              Width = 416
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtn20: TBitBtn
                Left = 128
                Top = 6
                Width = 75
                Height = 25
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn20Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                  B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                  DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                  4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                  E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                  6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                  4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
              end
              object BitBtn21: TBitBtn
                Left = 209
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn21Click
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
              end
            end
            object RadioGroup1: TRadioGroup
              Left = 9
              Top = 5
              Width = 416
              Height = 75
              Items.Strings = (
                'Barra cliente ( Negativar )'
                'Desbarrar cliente ( Remover Negativa'#231#227'o )')
              TabOrder = 1
            end
            object ckbImpFicha: TCheckBox
              Left = 9
              Top = 86
              Width = 128
              Height = 17
              Caption = 'Imprimir Ficha SPC'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object rbValorParcela: TRadioButton
              Left = 9
              Top = 117
              Width = 107
              Height = 17
              Caption = 'Valor de Parcela'
              Checked = True
              TabOrder = 3
              TabStop = True
            end
            object rbValorVenda: TRadioButton
              Left = 9
              Top = 140
              Width = 100
              Height = 17
              Caption = 'Valor de Venda'
              TabOrder = 4
            end
            object ckbEmLote: TCheckBox
              Left = 191
              Top = 86
              Width = 64
              Height = 17
              Caption = 'Em Lote'
              TabOrder = 5
              OnClick = ckbEmLoteClick
            end
            object ckbCodigoMV: TCheckBox
              Left = 350
              Top = 86
              Width = 75
              Height = 17
              Caption = 'C'#243'digo MV'
              TabOrder = 6
            end
          end
        end
        object tsGlobal: TTabSheet
          Caption = 'tsGlobal'
          ImageIndex = 11
          object pgGlobal: TPageControl
            Left = 0
            Top = 0
            Width = 876
            Height = 520
            ActivePage = tsDetalhes
            Align = alClient
            Enabled = False
            Style = tsFlatButtons
            TabOrder = 0
            Visible = False
            object tsDetalhes: TTabSheet
              Caption = 'tsDetalhes'
              ImageIndex = 9
              object pnDetalhes: TPanel
                Left = 3
                Top = 3
                Width = 818
                Height = 331
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnDetalhesEnter
                object Panel10: TPanel
                  Left = 8
                  Top = 8
                  Width = 801
                  Height = 81
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label41: TLabel
                    Left = 58
                    Top = 11
                    Width = 44
                    Height = 15
                    Alignment = taRightJustify
                    Caption = 'Cliente:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label70: TLabel
                    Left = 45
                    Top = 30
                    Width = 57
                    Height = 15
                    Alignment = taRightJustify
                    Caption = 'Num Doc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label71: TLabel
                    Left = 20
                    Top = 49
                    Width = 82
                    Height = 15
                    Alignment = taRightJustify
                    Caption = 'Valor Original:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object DBText5: TDBText
                    Left = 108
                    Top = 11
                    Width = 501
                    Height = 17
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText6: TDBText
                    Left = 108
                    Top = 30
                    Width = 501
                    Height = 17
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText7: TDBText
                    Left = 108
                    Top = 49
                    Width = 173
                    Height = 17
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object SpeedButton44: TSpeedButton
                    Left = 736
                    Top = 19
                    Width = 51
                    Height = 45
                    Hint = 'Alterar Data e Valor para Comiss'#227'o - [CAR052] - [CAR053]'
                    Flat = True
                    Glyph.Data = {
                      F6060000424DF606000000000000360000002800000018000000180000000100
                      180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C1C18A87
                      84D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9897
                      251C17040000000000B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4
                      B1AF0602010000000000004B4B4CDCDBDBFFFFFFFFFFFFFFFFFEFFF3F2F1E9E9
                      FFFFFFF5F6F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFE0DBD8D3C7BD9798930000004A4A4AE7E1E0FFFFFFFFFEFFC0E2EC8DD6E566
                      D0E358D9ED69C7D42B799126BBDE45C9E379D4E7FFFCFAFFFFFFFFFFFFFFFFFF
                      FFFFFFE8E4E3CDC2B9D4D2CBC7CFCEEEF1F1FFFFFFFFFFFFC5EBF66ED1E647D1
                      E859DBED67E0EF73E4F07AE7F088F7FE145C7940BADD51D7EE3DD2ECB1A5A4E4
                      E4E4FFFFFFF2F0EFCCC2BAD5D3CCCAD1D0E3E6E7FFFFFFFFFFFFA8DFEF48CAE6
                      4CD5EC60DBEC6EE0EE76E4EF7CE6F082E8F088E9F196F4FA4D91A439A3C653D8
                      EF42D0EADDD2D0EAEAEAF5F4F4BDBBB4E1E8E7F7F9FAFFFFFFFFFFFFB8E0EE45
                      C8E750D5EC66DCEE72E0EF7AE5F080E7F085E9F18AEAF191ECF29AEDF3A7F3F8
                      8FCFD7308EB154DAF03ECDE6FEF2F1FDFCFCFFFFFFFFFFFFFFFFFFFFFFFFCAE7
                      F14CC4E346D0EC66DBEE74E0EF7EE5F185E8F189EAF18EECF293ECF29BEDF3A4
                      EFF4ADF1F5B6F2F6C5FBFC2F8AAE53DAF03CCBE5FFFDFCFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF62CCE851D4ED70DDEF7EE4F187E9F294F4FA9DFEFF95EEF39BEE
                      F3A3F0F4B7FEFFC3FFFFC1FBFFBEF3F7CBFDFC48A5C44FD7EE3BCBE5FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6BD9EB83E6F28FEBF39BF6FB5D9BA8
                      2D3E37B7FFFFACF2F5C3FFFF5B7C842B3534A0C4C2C5FDFFC4F9F962C2DC4CD3
                      EB3BCAE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5ECF48CECF39B
                      EFF4A0F1F5B3FFFF00000162786DD2FFFF79A5B200000095C3CC000000C8FFFD
                      B7F7F96ED4E84AD1EA39CAE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFDFE8FE9F0A5F2F5ABF2F6B7F8FBB6F6FF000000BFE7DF5F828E27271DE9
                      FFFF0000009FD3CDA9F7FB6AD8EC49CFEA38CAE4FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFAEEAF2B0F4F6BAF4F7CAFFFFE3FFFF8EBCCA0000
                      00A8DAE4000000689198000000A7FCFC96F0F564D7EC49CFE938C9E4FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1EFF5BCF6F8D2FFFF80A4AC
                      171C1E8399913F5B6934392D8ED1DD3A5A5B85D0D290F2FB8CEBF361D6EC47CE
                      E936C8E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4F2F8C9
                      FAFBC3F5FF000000B9E0DA00000099CAC500000066958DA2FFFF8DF0F986E8F1
                      89EBF15FD4EB47CEE936C8E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFEFF6FACEFDFDA5D2E1000000EBFFFF0E1E2B5C837A90EDFD00000085
                      DBDD8AEFF985E8F089EBF15ED4EB45CEE834C7E4FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFAFAFDC1F4F7C9FFFF0000005779760000007DC2
                      BE9BFFFF4E8FA100000090F6FC87EAF28AEBF15DD3EA46CEE933C7E2FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFAAEEF4AEF6FA97E5EF
                      44717675B8BA94F9FF8BEAF297FFFF3E707A6AB1B18AEEF78BEBF15CD2EA44CD
                      E833C6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF95
                      EAF299EDF495F0F797F7FF90F2FB8BEAF38AE9F188E9F18FF6FE8AEFF888E9F2
                      8FEDF25DD2EB43CDE832C6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFF85E6F190EBF38CEAF28BEAF28DEBF38FEBF391ECF393EDF395
                      EEF397EFF497EFF49DF1F561D4EB42CDE831C6E2FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFEFF8AE9F199EFF49BEFF49BEFF49BEFF49BEF
                      F49AF0F49AF0F49AEFF499EFF498EFF39EF2F460D4EB42CCE830C6E1FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF91ECF29CF0F59BEFF4
                      9AEEF39AEFF49AEFF49AF0F49AF1F49BF1F49AF1F4A1F2F5ACF5F65CD1E92DC0
                      E41FBDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B
                      EAF199EFF49FF0F4A0F1F498EEF393EBF28EE9F089E6EF82E2ED7FDDEB80DCEB
                      86DCEB9CE3EFB0E8F2A7E2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFBFF1F9A7E7F1A5E6F0B1E9F2C0ECF4D0F0F6DEF3F9EEF7FBFE
                      FCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton44Click
                  end
                  object Label72: TLabel
                    Left = 305
                    Top = 49
                    Width = 269
                    Height = 18
                    Alignment = taRightJustify
                    Caption = 'Aten'#231#227'o! Cheque ainda n'#227'o quitado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    Visible = False
                  end
                end
                object Panel22: TPanel
                  Left = 8
                  Top = 95
                  Width = 801
                  Height = 177
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object DBGrid4: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 797
                    Height = 173
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = DBGrid4KeyDown
                  end
                end
                object Panel26: TPanel
                  Left = 8
                  Top = 278
                  Width = 801
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn22: TBitBtn
                    Left = 21
                    Top = 6
                    Width = 125
                    Height = 25
                    Hint = 'Imprimir Recibo - [CAR042]'
                    Caption = '&Imprimir Recibo'
                    TabOrder = 0
                    OnClick = BitBtn22Click
                    OnKeyDown = DBGrid4KeyDown
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000030F0000030F00000001000000010000000000002100
                      0000000808000808080010100800101010001818100018181800311818003918
                      1800421818001821180018291800181021004218210021212100292121004221
                      21004A21210021292100292929004A2929002921310031213100392131003129
                      31003131310039313100523131005A3131003939310031393900393939004242
                      420042D642004A4A4A00524A52007B4A5200844A52004A525200525252005A52
                      5200524A5A008C4A5A0052525A0063636300736363007B6363006B6B6300736B
                      63007B6B63006B5A6B00845A6B007B636B0084636B006B6B6B00846B6B008C6B
                      6B006B846B008C637300846B73008C6B73009C6B7300737373007B7373008473
                      73007B94730073C67300A56B7B00A5737B00737B7B007B7B7B00847B7B009C7B
                      7B00A57B7B00AD7B7B007B847B00A5847B0084CE7B008CFF7B00847B84008C7B
                      8400947B8400BD7B840073848400848484008C848400A5848400AD848400B584
                      84007BB584009C848C00848C8C008C8C8C00948C8C009C8C8C00BD8C8C00C68C
                      8C0084948C0094948C008CBD8C00BD8C9400C68C9400849494008C9494009494
                      94009C9494008C9C9400949C940094DE9400AD7B9C008C849C008C949C009494
                      9C00AD949C008C9C9C00949C9C009C9C9C00A59C9C00B5A59C009CEF9C00A57B
                      A500A5A5A500ADA5A500B5A5A500AD9CAD009CA5AD00BDA5AD00A5ADAD00ADAD
                      AD00B5ADAD00ADB5B500B5B5B500B5B5BD00BDB5BD00B5BDBD00BDBDBD00BDC6
                      BD00BDD6BD00C6C6C600CEC6C600C6C6CE00C6CECE00CECECE00D6CECE00CED6
                      CE00D6D6CE00D6CED600CED6D600D6D6D600DED6D600DEDED600D6DEDE00DEDE
                      DE00DEE7DE00E7D6E700DEE7E700E7E7E700EFE7E700E7EFE700EFEFE700E7EF
                      EF00EFEFEF00F7EFEF00F7F7EF00EFEFF700F7EFF700EFF7F700F7F7F700FF00
                      FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9A9A9A9A9A9
                      A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A95D5D5D5D5D7AA9A9A9A9A9A9A9A90346
                      A88E8B84AB8B0485A9A9A9A9A9A90037A895908BAB8D0028A9A9A9A90720145C
                      94745D56A28E191E0D30A94729481437818384847A71182C2720A92874676B68
                      69744C6268746F336D33A92888865E4838383435393B792B8D7DA93F94515358
                      4A4B49494A4D592B9B81A95D8F52261D110A090E111C26258D81A9A9907F0E77
                      ABABABABABAB0A128F84A9A98384415EABABABABABAA355F83A9A9A9A9A9A99A
                      A8AB8F755D55A9A9A9A9A9A9A9A9A990AAAB7A638B7AA9A9A9A9A9A9A9A9A98B
                      A8A881999D7AA9A9A9A9A9A9A9A9A988959584957AA9A9A9A9A9}
                  end
                  object BitBtn23: TBitBtn
                    Left = 152
                    Top = 6
                    Width = 153
                    Height = 25
                    Hint = 'Detalhes do Recebimento - [CAR043] - [CAR044]'
                    Caption = '&Detalhes do Recebimento'
                    TabOrder = 1
                    OnClick = BitBtn23Click
                    OnKeyDown = DBGrid4KeyDown
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000130B0000130B0000000100000001000000000000CE63
                      0000FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                      0202020202020202020201010102020202020101010202020202010301020000
                      0002010301020000000201010202020202020101020202020202020202020202
                      0202020202020202020202020202020202020202020202020202010101020202
                      0202010101020202020201030102000000020103010200000002010102020202
                      0202010102020202020202020202020202020202020202020202020202020202
                      0202020202020202020201010102020202020101010202020202010301020000
                      0002010301020000000201010202020202020101020202020202020202020202
                      0202020202020202020202020202020202020202020202020202}
                  end
                  object BitBtn24: TBitBtn
                    Left = 712
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = 'Voltar'
                    TabOrder = 2
                    OnClick = BitBtn24Click
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
                  object BitBtn44: TBitBtn
                    Left = 311
                    Top = 6
                    Width = 153
                    Height = 25
                    Hint = 'Visualizar Lote de Baixa - [CAR045] - [CAR046]'
                    Caption = '&Visualizar Lote de Baixa'
                    TabOrder = 3
                    OnClick = BitBtn44Click
                    OnKeyDown = DBGrid4KeyDown
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000130B0000130B0000000100000001000000000000CE63
                      0000FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201010101010101010101010101010101020202020202
                      0202020202020202020202020200000000020000000200000002020202020202
                      0202020202020202020202020202020202020202020202020202}
                  end
                end
              end
            end
            object tsHistorico: TTabSheet
              Caption = 'tsHistorico'
              ImageIndex = 4
              object pnHistorico: TPanel
                Left = 3
                Top = 0
                Width = 798
                Height = 465
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnHistoricoEnter
                OnExit = pnHistoricoExit
                object Panel5: TPanel
                  Left = 0
                  Top = 25
                  Width = 794
                  Height = 395
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object DBGrid2: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 790
                    Height = 391
                    Align = alClient
                    DataSource = dtmContasAReceber.dsBuscas
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = DBGrid2KeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'DATA_MOV'
                        Title.Caption = 'Data Movimento'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TPDOCS'
                        Title.Caption = 'Tipo Doc'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NREQUISICAO'
                        Title.Caption = 'N'#186' Documento'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NDOC'
                        Title.Caption = 'N'#186' Doc Recebido'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_CTRL'
                        Title.Caption = 'Controle'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CLIENTE'
                        Title.Caption = 'Cliente'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HISTORICO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALORDOC'
                        Title.Caption = 'Valor Doc'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_VENC'
                        Title.Caption = 'Data Vencimento'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TERCEIROS'
                        Title.Caption = 'Nome Terceiro'
                        Visible = True
                      end>
                  end
                end
                object Panel6: TPanel
                  Left = 0
                  Top = 0
                  Width = 794
                  Height = 25
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Hist'#243'rico do Cliente'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -13
                  Font.Name = 'Times New Roman'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 2
                end
                object Panel7: TPanel
                  Left = 0
                  Top = 420
                  Width = 794
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object BitBtn7: TBitBtn
                    Left = 357
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn7Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFEF0FCEFE2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA00A211149525F9
                      E6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFF3FF21B93620B3350FB22478A67FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF42C95637D04F37CB4D31C34518
                      B52FE1CEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFBFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFF3EAF14BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DB1B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFC8EACD44EB6051E86A3EBC51F8E3F5FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFEEF4ED5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F3F141E75D5BEF7443E45DC9BAC6FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFA1E1AA43E35E56F0714AB85BFBE8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFAF7F837C14B40C95628CD42B3B1B2FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE0BD36BC4A4FC8
                      6138B44AE1CFDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50F7EDF5FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EF1E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91CF98E5EDE5FFFFFF}
                  end
                end
              end
            end
            object tsComissao: TTabSheet
              Caption = 'tsComissao'
              ImageIndex = 6
              object pnComissao: TPanel
                Left = 3
                Top = 0
                Width = 654
                Height = 225
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnComissaoEnter
                object Panel12: TPanel
                  Left = 0
                  Top = 25
                  Width = 650
                  Height = 155
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label29: TLabel
                    Left = 54
                    Top = 13
                    Width = 92
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Cliente do Cheque:'
                  end
                  object Label30: TLabel
                    Left = 46
                    Top = 40
                    Width = 100
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Razao Social Cliente:'
                  end
                  object Label31: TLabel
                    Left = 65
                    Top = 67
                    Width = 81
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Numero Cheque:'
                  end
                  object DBText1: TDBText
                    Left = 152
                    Top = 13
                    Width = 57
                    Height = 17
                    DataField = 'COD_CLIENTE'
                    DataSource = dtmContasAReceber.dsCtrlCh
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText2: TDBText
                    Left = 215
                    Top = 13
                    Width = 396
                    Height = 17
                    DataField = 'NOME_CH'
                    DataSource = dtmContasAReceber.dsCtrlCh
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText3: TDBText
                    Left = 152
                    Top = 40
                    Width = 459
                    Height = 17
                    DataField = 'RAZAO'
                    DataSource = dtmContasAReceber.dsCtrlCh
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText4: TDBText
                    Left = 152
                    Top = 67
                    Width = 134
                    Height = 17
                    DataField = 'N_CH'
                    DataSource = dtmContasAReceber.dsCtrlCh
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label73: TLabel
                    Left = 290
                    Top = 67
                    Width = 85
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor Documento:'
                  end
                  object DBText8: TDBText
                    Left = 381
                    Top = 67
                    Width = 134
                    Height = 17
                    DataField = 'N_CH'
                    DataSource = dtmContasAReceber.dsCtrlCh
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 93
                    Width = 646
                    Height = 58
                    Align = alBottom
                    Caption = 'Dados utilizados para efetuar o c'#225'lculo de comiss'#227'o'
                    TabOrder = 0
                    object Label32: TLabel
                      Left = 95
                      Top = 27
                      Width = 51
                      Height = 13
                      Caption = 'Valor Pago'
                      FocusControl = DBEdit28
                    end
                    object Label33: TLabel
                      Left = 323
                      Top = 27
                      Width = 52
                      Height = 13
                      Caption = 'Data Baixa'
                      FocusControl = DBEdit29
                    end
                    object SpeedButton45: TSpeedButton
                      Left = 521
                      Top = 21
                      Width = 23
                      Height = 22
                      Hint = 'Apagar Data'
                      Flat = True
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
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton45Click
                    end
                    object DBEdit28: TDBEdit
                      Left = 152
                      Top = 24
                      Width = 134
                      Height = 21
                      DataField = 'VL_BAIXA_COMISSAO'
                      TabOrder = 0
                      OnKeyDown = DBEdit28KeyDown
                    end
                    object DBEdit29: TDBEdit
                      Left = 381
                      Top = 24
                      Width = 134
                      Height = 21
                      DataField = 'DT_BAIXA_COMISSAO'
                      TabOrder = 1
                      OnKeyDown = DBEdit28KeyDown
                    end
                  end
                end
                object Panel13: TPanel
                  Left = 0
                  Top = 0
                  Width = 650
                  Height = 25
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Valor e Data do Cheque pago para comiss'#227'o de Colaboradores'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -13
                  Font.Name = 'Times New Roman'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 1
                end
                object Panel14: TPanel
                  Left = 0
                  Top = 180
                  Width = 650
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn10: TBitBtn
                    Left = 245
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn10Click
                    OnKeyDown = DBEdit28KeyDown
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFEF0FCEFE2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA00A211149525F9
                      E6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFF3FF21B93620B3350FB22478A67FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF42C95637D04F37CB4D31C34518
                      B52FE1CEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFBFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFF3EAF14BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DB1B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFC8EACD44EB6051E86A3EBC51F8E3F5FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFEEF4ED5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F3F141E75D5BEF7443E45DC9BAC6FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFA1E1AA43E35E56F0714AB85BFBE8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFAF7F837C14B40C95628CD42B3B1B2FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE0BD36BC4A4FC8
                      6138B44AE1CFDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50F7EDF5FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EF1E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91CF98E5EDE5FFFFFF}
                  end
                  object BitBtn11: TBitBtn
                    Left = 326
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn11Click
                    OnKeyDown = DBEdit28KeyDown
                    Glyph.Data = {
                      E6010000424DE60100000000000036000000280000000C0000000C0000000100
                      180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
                      9696BFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
                      ED0000C50000B69191BAFFFFF8FFFFFFFFFFFFFFFFFE7F7FC500009100008FA2
                      A2C64848EC0000DD0000D50000BC9292BBFFFFFEFFFFFF7A7AC80000A30000A7
                      0000938F8FC9FEFEFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
                      B40000A67D7DCBFFFFFFFFFFFFEBEBFD3838EF0000E60101E40000D40000C401
                      01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
                      0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D8DE10F0F
                      ED0C0CEC0303EC0000E28E8EC0FFFFFBFFFFFFFFFFFFFFFFFFFCFCFA8484DD39
                      39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFF5FFFFFFFFFFFE8787DD
                      4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFC8A8A
                      DD4D4DDE7373E46868E48E8EE4FFFFFEFDFDFE7B7BEB6C6CF06F6FF73D3DEAA6
                      A6CE8787E36262DD6767E09191E3F8F8FBFFFFFFFFFFFFEEEEFA8080E96D6DEF
                      5555F2A4A4E9FCFCFD8F8FE49393E2FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFDFD
                      FD7D7DE9A4A4EDFFFFFF}
                  end
                end
              end
            end
            object tsMudaControleOuVoltaParaAtivo: TTabSheet
              Caption = 'tsMudaControleOuVoltaParaAtivo'
              ImageIndex = 5
              object pnMudaControleOuVoltaParaAtivo: TPanel
                Left = 3
                Top = 0
                Width = 654
                Height = 161
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel9: TPanel
                  Left = 0
                  Top = 25
                  Width = 650
                  Height = 91
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label27: TLabel
                    Left = 70
                    Top = 22
                    Width = 41
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Controle'
                  end
                  object Label28: TLabel
                    Left = 70
                    Top = 49
                    Width = 41
                    Height = 13
                    Caption = 'Historico'
                  end
                  object DBLookupComboBox3: TDBLookupComboBox
                    Left = 117
                    Top = 19
                    Width = 459
                    Height = 21
                    KeyField = 'CODIGO_CTRL'
                    ListField = 'NOME_CTRL;CODIGO_CTRL'
                    ListSource = dtmContasAReceber.dsCtrl
                    TabOrder = 0
                  end
                  object edhistorico: TEdit
                    Left = 117
                    Top = 46
                    Width = 459
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 1
                    Text = 'EDHISTORICO'
                  end
                  object ckTranspComissao: TCheckBox
                    Left = 326
                    Top = 68
                    Width = 250
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 'Transportar valor de comiss'#227'o para o Cheque'
                    TabOrder = 2
                  end
                  object BitBtn76: TBitBtn
                    Left = 582
                    Top = 17
                    Width = 24
                    Height = 25
                    TabOrder = 3
                    OnClick = BitBtn76Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000DE0E0000DE0E00000001000000010000AD4A0000BD5A
                      0000D6730000DE730000E7840000CE6B0800FF9C0800B5521000BD633100CE7B
                      3900BD6B4200CE844200BD7B5200C6846300FF00FF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E0E0E0E0E0E
                      0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0D
                      080707080D0E0E0E0E0E0E0E0E0E08070707070707080E0E0E0E0E0E0E080708
                      0D0E0E0D0807080E0E0E0E0E0D07080E0E0E0E0E0E08070D0E0E0E0E08070E0E
                      0E0E0E0E0E0D07080E0E0E0E07070E0E0E0E0E0E0E0E07070E0E0E0E07070E0E
                      0E0E0E0B0E0E07070E0E0E0E08070D0E0E0E0E0C0B0E07080E0E0E0E0D07080E
                      0E0E0E090608070D0E0E0E0E0E08070E0E0E0E050403080E0E0E0E0E0E0E0E0E
                      0E0E0E010204060A0E0E0E0E0E0E0E0E0E0E0E000105090C0A0E0E0E0E0E0E0E
                      0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E}
                  end
                end
                object pnCaptionOperacao: TPanel
                  Left = 0
                  Top = 0
                  Width = 650
                  Height = 25
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Selecione o Controle para efetuar a opera'#231#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -13
                  Font.Name = 'Times New Roman'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 1
                end
                object Panel11: TPanel
                  Left = 0
                  Top = 116
                  Width = 650
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn8: TBitBtn
                    Left = 245
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn8Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFEF0FCEFE2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA00A211149525F9
                      E6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFF3FF21B93620B3350FB22478A67FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF42C95637D04F37CB4D31C34518
                      B52FE1CEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFBFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFF3EAF14BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DB1B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFC8EACD44EB6051E86A3EBC51F8E3F5FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFEEF4ED5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F3F141E75D5BEF7443E45DC9BAC6FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFA1E1AA43E35E56F0714AB85BFBE8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFAF7F837C14B40C95628CD42B3B1B2FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE0BD36BC4A4FC8
                      6138B44AE1CFDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50F7EDF5FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EF1E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91CF98E5EDE5FFFFFF}
                  end
                  object BitBtn9: TBitBtn
                    Left = 326
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn9Click
                    Glyph.Data = {
                      E6010000424DE60100000000000036000000280000000C0000000C0000000100
                      180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
                      9696BFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
                      ED0000C50000B69191BAFFFFF8FFFFFFFFFFFFFFFFFE7F7FC500009100008FA2
                      A2C64848EC0000DD0000D50000BC9292BBFFFFFEFFFFFF7A7AC80000A30000A7
                      0000938F8FC9FEFEFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
                      B40000A67D7DCBFFFFFFFFFFFFEBEBFD3838EF0000E60101E40000D40000C401
                      01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
                      0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D8DE10F0F
                      ED0C0CEC0303EC0000E28E8EC0FFFFFBFFFFFFFFFFFFFFFFFFFCFCFA8484DD39
                      39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFF5FFFFFFFFFFFE8787DD
                      4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFC8A8A
                      DD4D4DDE7373E46868E48E8EE4FFFFFEFDFDFE7B7BEB6C6CF06F6FF73D3DEAA6
                      A6CE8787E36262DD6767E09191E3F8F8FBFFFFFFFFFFFFEEEEFA8080E96D6DEF
                      5555F2A4A4E9FCFCFD8F8FE49393E2FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFDFD
                      FD7D7DE9A4A4EDFFFFFF}
                  end
                end
              end
            end
            object tsDataRealBaixa: TTabSheet
              Caption = 'tsDataRealBaixa'
              ImageIndex = 10
              object pnDataRealBaixa: TPanel
                Left = 3
                Top = 0
                Width = 470
                Height = 137
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel27: TPanel
                  Left = 0
                  Top = 25
                  Width = 466
                  Height = 67
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label75: TLabel
                    Left = 142
                    Top = 24
                    Width = 91
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Data Real da Baixa'
                  end
                  object edDataRealBaixa: TMaskEdit
                    Left = 239
                    Top = 21
                    Width = 81
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 0
                    Text = '  /  /    '
                    OnKeyDown = BitBtn26KeyDown
                  end
                end
                object Panel28: TPanel
                  Left = 0
                  Top = 0
                  Width = 466
                  Height = 25
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Informe a Data Real da Baixa para os Cr'#233'ditos Selecionados'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -13
                  Font.Name = 'Times New Roman'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 1
                end
                object Panel29: TPanel
                  Left = 0
                  Top = 92
                  Width = 466
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn25: TBitBtn
                    Left = 153
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn25Click
                    OnKeyDown = BitBtn26KeyDown
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFEF0FCEFE2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA00A211149525F9
                      E6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFF3FF21B93620B3350FB22478A67FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF42C95637D04F37CB4D31C34518
                      B52FE1CEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFBFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFF3EAF14BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DB1B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFC8EACD44EB6051E86A3EBC51F8E3F5FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFEEF4ED5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F3F141E75D5BEF7443E45DC9BAC6FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFA1E1AA43E35E56F0714AB85BFBE8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFAF7F837C14B40C95628CD42B3B1B2FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE0BD36BC4A4FC8
                      6138B44AE1CFDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50F7EDF5FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EF1E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91CF98E5EDE5FFFFFF}
                  end
                  object BitBtn26: TBitBtn
                    Left = 234
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn26Click
                    OnKeyDown = BitBtn26KeyDown
                    Glyph.Data = {
                      E6010000424DE60100000000000036000000280000000C0000000C0000000100
                      180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
                      9696BFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
                      ED0000C50000B69191BAFFFFF8FFFFFFFFFFFFFFFFFE7F7FC500009100008FA2
                      A2C64848EC0000DD0000D50000BC9292BBFFFFFEFFFFFF7A7AC80000A30000A7
                      0000938F8FC9FEFEFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
                      B40000A67D7DCBFFFFFFFFFFFFEBEBFD3838EF0000E60101E40000D40000C401
                      01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
                      0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D8DE10F0F
                      ED0C0CEC0303EC0000E28E8EC0FFFFFBFFFFFFFFFFFFFFFFFFFCFCFA8484DD39
                      39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFF5FFFFFFFFFFFE8787DD
                      4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFC8A8A
                      DD4D4DDE7373E46868E48E8EE4FFFFFEFDFDFE7B7BEB6C6CF06F6FF73D3DEAA6
                      A6CE8787E36262DD6767E09191E3F8F8FBFFFFFFFFFFFFEEEEFA8080E96D6DEF
                      5555F2A4A4E9FCFCFD8F8FE49393E2FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFDFD
                      FD7D7DE9A4A4EDFFFFFF}
                  end
                end
              end
            end
            object tsDataPrevRec: TTabSheet
              Caption = 'tsDataPrevRec'
              ImageIndex = 10
              object pnDataPrevRec: TPanel
                Left = 3
                Top = 0
                Width = 470
                Height = 137
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel78: TPanel
                  Left = 0
                  Top = 25
                  Width = 466
                  Height = 67
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label143: TLabel
                    Left = 101
                    Top = 24
                    Width = 132
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Data Previs'#227'o Recebimento'
                  end
                  object SpeedButton53: TSpeedButton
                    Left = 326
                    Top = 21
                    Width = 23
                    Height = 21
                    Hint = 'Limpar data previs'#227'o recebimento'
                    Glyph.Data = {
                      36040000424D3604000000000000360000002800000010000000100000000100
                      20000000000000040000130B0000130B00000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000098FE7C0097FE4F0000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000098FE770098FFFF0096FEFA0099FF5000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000098FE770098FFFF0098FFFF0098FFFF0096FEF90099FF50000000000000
                      0000000000000000000000000000000000000000000000000000000000000098
                      FE7C0098FFFF0098FFFF0098FFFF0098FFFF0098FFFF39A3E5D4C4BEB14F0000
                      0000000000000000000000000000000000000000000000000000000000000096
                      FE470096FEF70098FFFF0098FFFF0098FFFF33A2E9EDC2BEAEF5CCC7BCCFDBD8
                      CE4F000000000000000000000000000000000000000000000000000000000000
                      00000099FE490096FEF70098FFFF31A2E9EDC2BDAFF5CBC7B9EFDCD8CFFBCFCA
                      BFCCC4BEB14F0000000000000000000000000000000000000000000000000000
                      0000000000000096FE4739A4E7D5C2BEAEF5CCC5B9ECDCD8CFFBD1C9C0EFC3BC
                      AEFED3CEC4CDDBD8CE4F00000000000000000000000000000000000000000000
                      00000000000000000000C4BDAE46CCC7BCCFDCD8CFFBCFCCBFEDC3BCAEFED2CB
                      C1EFDAD6D0FF8A8AE0D07474E54F000000000000000000000000000000000000
                      0000000000000000000000000000DCD8CE49D0C8BECAC3BCAEFED1CDC0EDDAD6
                      D0FF9594DDF17373E5FF7373E5FA7272E5500000000000000000000000000000
                      000000000000000000000000000000000000C6BFB148D4CFC5CBDAD6D0FF9492
                      DEF17373E5FF7373E5FF7373E5FF7171E5F97171E64800000000000000000000
                      00000000000000000000000000000000000000000000DCD8CE498B8BE0CF7373
                      E5FF7373E5FF7373E5FF7373E5FF7373E5FF7272E57A00000000000000000000
                      00000000000000000000000000000000000000000000000000007272E5477171
                      E5F77373E5FF7373E5FF7373E5FF7272E39C7F7FFF0200000000000000000000
                      0000000000000000000000000000000000000000000000000000000000007272
                      E5477171E5F77373E5FF7272E39C7F7FFF020000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00007373E3427373E5770000FF01000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton53Click
                  end
                  object edDataPrevRec: TMaskEdit
                    Left = 239
                    Top = 21
                    Width = 81
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 0
                    Text = '  /  /    '
                    OnKeyDown = BitBtn69KeyDown
                  end
                end
                object Panel79: TPanel
                  Left = 0
                  Top = 0
                  Width = 466
                  Height = 25
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Informe a Data Real Previs'#227'o Recebimento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -13
                  Font.Name = 'Times New Roman'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 1
                end
                object Panel80: TPanel
                  Left = 0
                  Top = 92
                  Width = 466
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn17: TBitBtn
                    Left = 153
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn17Click
                    OnKeyDown = BitBtn69KeyDown
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFEF0FCEFE2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA00A211149525F9
                      E6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFF3FF21B93620B3350FB22478A67FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF42C95637D04F37CB4D31C34518
                      B52FE1CEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFBFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFF3EAF14BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DB1B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFC8EACD44EB6051E86A3EBC51F8E3F5FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFEEF4ED5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F3F141E75D5BEF7443E45DC9BAC6FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFA1E1AA43E35E56F0714AB85BFBE8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFAF7F837C14B40C95628CD42B3B1B2FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE0BD36BC4A4FC8
                      6138B44AE1CFDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50F7EDF5FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EF1E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91CF98E5EDE5FFFFFF}
                  end
                  object BitBtn69: TBitBtn
                    Left = 234
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn69Click
                    OnKeyDown = BitBtn69KeyDown
                    Glyph.Data = {
                      E6010000424DE60100000000000036000000280000000C0000000C0000000100
                      180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
                      9696BFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
                      ED0000C50000B69191BAFFFFF8FFFFFFFFFFFFFFFFFE7F7FC500009100008FA2
                      A2C64848EC0000DD0000D50000BC9292BBFFFFFEFFFFFF7A7AC80000A30000A7
                      0000938F8FC9FEFEFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
                      B40000A67D7DCBFFFFFFFFFFFFEBEBFD3838EF0000E60101E40000D40000C401
                      01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
                      0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D8DE10F0F
                      ED0C0CEC0303EC0000E28E8EC0FFFFFBFFFFFFFFFFFFFFFFFFFCFCFA8484DD39
                      39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFF5FFFFFFFFFFFE8787DD
                      4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFC8A8A
                      DD4D4DDE7373E46868E48E8EE4FFFFFEFDFDFE7B7BEB6C6CF06F6FF73D3DEAA6
                      A6CE8787E36262DD6767E09191E3F8F8FBFFFFFFFFFFFFEEEEFA8080E96D6DEF
                      5555F2A4A4E9FCFCFD8F8FE49393E2FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFDFD
                      FD7D7DE9A4A4EDFFFFFF}
                  end
                end
              end
            end
            object tsContasBancarias: TTabSheet
              Caption = 'tsContasBancarias'
              ImageIndex = 8
              object pnCadastroContasBancarias: TPanel
                Left = 0
                Top = 3
                Width = 537
                Height = 177
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel17: TPanel
                  Left = 6
                  Top = 9
                  Width = 521
                  Height = 108
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label39: TLabel
                    Left = 21
                    Top = 18
                    Width = 33
                    Height = 13
                    Caption = 'Cliente'
                    FocusControl = DBEdit33
                  end
                  object Label67: TLabel
                    Left = 16
                    Top = 45
                    Width = 38
                    Height = 13
                    Caption = 'Ag'#234'ncia'
                    FocusControl = DBEdit47
                  end
                  object Label68: TLabel
                    Left = 346
                    Top = 45
                    Width = 29
                    Height = 13
                    Caption = 'Conta'
                    FocusControl = DBEdit48
                  end
                  object Label69: TLabel
                    Left = 25
                    Top = 72
                    Width = 29
                    Height = 13
                    Caption = 'Banco'
                    FocusControl = DBEdit49
                  end
                  object DBLookupComboBox6: TDBLookupComboBox
                    Left = 140
                    Top = 15
                    Width = 362
                    Height = 21
                    DataField = 'COD_CLIENTE'
                    DataSource = dtmContasAReceber.dsContasBanc
                    KeyField = 'COD_CLIENTE'
                    ListField = 'NOME_CLIENTE'
                    ListSource = dtmContasAReceber.dsCl
                    TabOrder = 1
                  end
                  object DBEdit33: TDBEdit
                    Left = 60
                    Top = 15
                    Width = 74
                    Height = 21
                    DataField = 'COD_CLIENTE'
                    DataSource = dtmContasAReceber.dsContasBanc
                    TabOrder = 0
                    OnExit = DBEdit33Exit
                    OnKeyDown = DBEdit33KeyDown
                  end
                  object DBEdit47: TDBEdit
                    Left = 60
                    Top = 42
                    Width = 74
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'AGENCIA'
                    DataSource = dtmContasAReceber.dsContasBanc
                    TabOrder = 2
                  end
                  object DBEdit48: TDBEdit
                    Left = 381
                    Top = 42
                    Width = 121
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'CONTA'
                    DataSource = dtmContasAReceber.dsContasBanc
                    TabOrder = 3
                  end
                  object DBEdit49: TDBEdit
                    Left = 60
                    Top = 69
                    Width = 74
                    Height = 21
                    DataField = 'CODBANCO'
                    DataSource = dtmContasAReceber.dsContasBanc
                    TabOrder = 4
                  end
                  object DBEdit50: TDBEdit
                    Left = 140
                    Top = 69
                    Width = 362
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'BANCO'
                    DataSource = dtmContasAReceber.dsContasBanc
                    TabOrder = 5
                  end
                end
                object Panel21: TPanel
                  Left = 6
                  Top = 123
                  Width = 521
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn18: TBitBtn
                    Left = 180
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'OK - [CAR051]'
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn18Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn19: TBitBtn
                    Left = 261
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn19Click
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
                  end
                end
              end
              object pnConsultaContasBancarias: TPanel
                Left = 0
                Top = 186
                Width = 779
                Height = 298
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object Panel23: TPanel
                  Left = 6
                  Top = 7
                  Width = 763
                  Height = 234
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object DBGrid3: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 759
                    Height = 230
                    Align = alClient
                    DataSource = dtmContasAReceber.dsContasBanc
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = DBGrid3KeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'COD_CLIENTE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_CLIENTE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'AGENCIA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CONTA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODBANCO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'BANCO'
                        Width = 64
                        Visible = True
                      end>
                  end
                end
                object Panel24: TPanel
                  Left = 6
                  Top = 247
                  Width = 763
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object SpeedButton30: TSpeedButton
                    Left = 161
                    Top = 6
                    Width = 105
                    Height = 25
                    Hint = 'Nova Conta Banc'#225'ria - [CAR049]'
                    Caption = 'Nova [ Insert ]'
                    Flat = True
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000420B0000420B00000001000000010000B5847300AD73
                      8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                      D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                      FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                      1111111111111111111111111101020202020202020202020211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      13131313131313130211111112121210101010101010101002111111120D120C
                      0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                      120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                      0808080806000211111111111212120707070707050011111111}
                    OnClick = SpeedButton30Click
                  end
                  object SpeedButton31: TSpeedButton
                    Left = 388
                    Top = 6
                    Width = 105
                    Height = 25
                    Hint = 'Apagar Conta Banc'#225'ria - [CAR050]'
                    Caption = 'Apagar [ Delete ]'
                    Flat = True
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000220B0000220B000000010000000100000031DE000031
                      E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                      0404040404040404000004000004040404040404040404000004040000000404
                      0404040404040000040404000000000404040404040000040404040402000000
                      0404040400000404040404040404000000040000000404040404040404040400
                      0101010004040404040404040404040401010204040404040404040404040400
                      0201020304040404040404040404030201040403030404040404040404050203
                      0404040405030404040404040303050404040404040303040404040303030404
                      0404040404040403040403030304040404040404040404040404030304040404
                      0404040404040404040404040404040404040404040404040404}
                    OnClick = SpeedButton31Click
                  end
                  object SpeedButton32: TSpeedButton
                    Left = 272
                    Top = 6
                    Width = 105
                    Height = 25
                    Caption = 'Assumir [ Enter ]'
                    Flat = True
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                    OnClick = SpeedButton32Click
                  end
                  object SpeedButton34: TSpeedButton
                    Left = 499
                    Top = 6
                    Width = 105
                    Height = 25
                    Caption = 'Voltar [ Esc ]'
                    Flat = True
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
                    OnClick = SpeedButton34Click
                  end
                end
              end
            end
            object tsReplicacao: TTabSheet
              Caption = 'tsReplicacao'
              ImageIndex = 6
              object pnReplicar: TPanel
                Left = 3
                Top = 3
                Width = 677
                Height = 462
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel30: TPanel
                  Left = 0
                  Top = 41
                  Width = 673
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label74: TLabel
                    Left = 81
                    Top = 11
                    Width = 195
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Quantidade de Registros a replicar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object edQtdeRepl: TEditHw
                    Left = 282
                    Top = 8
                    Width = 41
                    Height = 21
                    TabOrder = 0
                    Text = '1'
                    Formato = fInteger
                    FormatSize = '0.0'
                    AsValue = 1.000000000000000000
                  end
                end
                object Panel31: TPanel
                  Left = 0
                  Top = 82
                  Width = 673
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label76: TLabel
                    Left = 115
                    Top = 11
                    Width = 161
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Dia de Vencimento a replicar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object edDiaVencReplicar: TEditHw
                    Left = 282
                    Top = 8
                    Width = 41
                    Height = 21
                    TabOrder = 0
                    Text = '1'
                    Formato = fInteger
                    FormatSize = '0.0'
                    AsValue = 1.000000000000000000
                  end
                end
                object Panel32: TPanel
                  Left = 0
                  Top = 221
                  Width = 673
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn27: TBitBtn
                    Left = 250
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn27Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn28: TBitBtn
                    Left = 331
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn28Click
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
                  end
                end
                object Panel8: TPanel
                  Left = 0
                  Top = 0
                  Width = 673
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 3
                  object Label77: TLabel
                    Left = 16
                    Top = 5
                    Width = 42
                    Height = 13
                    Caption = 'Cliente:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label78: TLabel
                    Left = 6
                    Top = 19
                    Width = 52
                    Height = 13
                    Caption = 'Num Doc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label79: TLabel
                    Left = 275
                    Top = 19
                    Width = 32
                    Height = 13
                    Caption = 'Valor:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText9: TDBText
                    Left = 64
                    Top = 5
                    Width = 321
                    Height = 13
                    DataField = 'NOME_C'
                    DataSource = dtmContasAReceber.dsCtrlCr
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText10: TDBText
                    Left = 64
                    Top = 19
                    Width = 87
                    Height = 13
                    DataField = 'N_DOC_C'
                    DataSource = dtmContasAReceber.dsCtrlCr
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText11: TDBText
                    Left = 313
                    Top = 19
                    Width = 85
                    Height = 13
                    DataField = 'VALOR_C'
                    DataSource = dtmContasAReceber.dsCtrlCr
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label80: TLabel
                    Left = 155
                    Top = 19
                    Width = 30
                    Height = 13
                    Caption = 'Venc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText12: TDBText
                    Left = 193
                    Top = 19
                    Width = 78
                    Height = 13
                    DataField = 'DATA_VENC_C'
                    DataSource = dtmContasAReceber.dsCtrlCr
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label139: TLabel
                    Left = 391
                    Top = 19
                    Width = 56
                    Height = 13
                    Caption = 'Num Parc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText13: TDBText
                    Left = 455
                    Top = 19
                    Width = 66
                    Height = 13
                    DataField = 'NPARCELA'
                    DataSource = dtmContasAReceber.dsCtrlCr
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label140: TLabel
                    Left = 527
                    Top = 19
                    Width = 58
                    Height = 13
                    Caption = 'Qtde Parc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText14: TDBText
                    Left = 591
                    Top = 19
                    Width = 66
                    Height = 13
                    DataField = 'QTDE_PARC'
                    DataSource = dtmContasAReceber.dsCtrlCr
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object Panel66: TPanel
                  Left = 0
                  Top = 123
                  Width = 673
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 4
                  object ckbReplVlContabil: TCheckBox
                    Left = 146
                    Top = 10
                    Width = 152
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 'Replicar valor cont'#225'bil'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel76: TPanel
                  Left = 0
                  Top = 164
                  Width = 673
                  Height = 57
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 5
                  object ckbReplAlterarNumQdeParcela: TCheckBox
                    Left = 43
                    Top = 7
                    Width = 510
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 
                      'Replicar alterando o n'#250'mero e quantidade da parcela do documento' +
                      ' atual selecionado'
                    Checked = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    State = cbChecked
                    TabOrder = 0
                    OnClick = ckbReplAlterarNumQdeParcelaClick
                  end
                  object ckbReplNaoAlterarNumQdeParcela: TCheckBox
                    Left = 33
                    Top = 28
                    Width = 520
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 
                      'Replicar sem alterar o n'#250'mero e quantidade da parcela do documen' +
                      'to atual selecionado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                    OnClick = ckbReplNaoAlterarNumQdeParcelaClick
                  end
                end
                object MemoReplicar: TMemo
                  Left = 0
                  Top = 262
                  Width = 673
                  Height = 196
                  Align = alClient
                  Lines.Strings = (
                    'MemoReplicar')
                  TabOrder = 6
                end
              end
            end
            object tsLoteQuit: TTabSheet
              Caption = 'tsLoteQuit'
              ImageIndex = 7
              object pnLoteQuit: TPanel
                Left = 3
                Top = 3
                Width = 702
                Height = 358
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnLoteQuitEnter
                OnExit = pnLoteQuitExit
                object Panel58: TPanel
                  Left = 5
                  Top = 5
                  Width = 689
                  Height = 25
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Lote de Quita'#231#227'o  N'#186' 88'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 1
                end
                object Panel59: TPanel
                  Left = 5
                  Top = 36
                  Width = 689
                  Height = 266
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object DBGrid8: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 685
                    Height = 262
                    Align = alClient
                    DataSource = dtmContasAReceber.dsBuscas
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = BitBtn13KeyDown
                  end
                end
                object Panel60: TPanel
                  Left = 5
                  Top = 308
                  Width = 689
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object BitBtn13: TBitBtn
                    Left = 20
                    Top = 6
                    Width = 149
                    Height = 25
                    Hint = 'Estornar Recebimento - [CAR047] - [CAR048]'
                    Caption = 'Estornar Recebimento'
                    TabOrder = 1
                    OnClick = BitBtn13Click
                    OnKeyDown = BitBtn13KeyDown
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D7E1E2D8321FF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FF2A70152D801F2F8F2830972E2E8B272D821FFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FF28660E2B781A2E8A25308E282F8E262F972D2F97
                      2E2F922A2E8E27FF00FFFF00FFFF00FFFF00FFFF00FF286811286B0F2862082D
                      811E2F8F282F932C2D9D3F2E9C372F9A302F9932309930256611FF00FFFF00FF
                      28650F2A72162D89262C7A1929680B2F8C282DA4442CAF582CB15D2CAC542D93
                      312F9129309F35297518255E0C2C791A2D84202F90292F902A2B70132B6F0A2F
                      921E2D992E2DA5462DB25C2DAA4E296E132B771B2FA7412A781B2355072A7418
                      3091282E8B262E9C362D7F0D2F7F032F80032F7B012F80062E93232CB1582DA7
                      4B2C902E2B8728286B12245A0A2D7F1D2F98302DA6492CB15B2E96222E7B022F
                      7F032F81032F80032F7F022EA03B2C983D276A11245807FF00FF255D0A2D9736
                      2CB55E2BAF592CAD572DAD542D972A2F870F2F83092F83072B7005286A0F286A
                      12FF00FFFF00FFFF00FFFF00FF286C162D993A0000662CB15B2CAD562CB4602C
                      B0582D9C392C7316286A12FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      0000660000662DA1452DB55D2CA54B2B8A2D286A12FF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FF0000660000FF0000FF000066000066000066FF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000660000FF
                      0000FF0000FF0000FF0000FF000066FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FF0000660000FF0000FF000066000066000066FF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      000066000066FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000066FF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  end
                  object BitBtn43: TBitBtn
                    Left = 594
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = 'Voltar'
                    TabOrder = 0
                    OnClick = BitBtn43Click
                    OnKeyDown = BitBtn13KeyDown
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
            object tsImpressao: TTabSheet
              Caption = 'tsImpressao'
              ImageIndex = 8
              object pnImpressao: TPanel
                Left = 40
                Top = 24
                Width = 465
                Height = 373
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                object GroupBox14: TGroupBox
                  Left = 6
                  Top = 91
                  Width = 449
                  Height = 231
                  Align = alClient
                  Caption = 'Relat'#243'rio'
                  TabOrder = 1
                  object CheckBox10: TCheckBox
                    Left = 16
                    Top = 50
                    Width = 369
                    Height = 17
                    Caption = 'Imprimir somente selecionados'
                    TabOrder = 2
                    OnKeyDown = BitBtn54KeyDown
                  end
                  object CheckBox11: TCheckBox
                    Left = 16
                    Top = 75
                    Width = 369
                    Height = 17
                    Caption = 'Imprimir com endere'#231'o do cliente (linha adicional)'
                    TabOrder = 3
                    OnKeyDown = BitBtn54KeyDown
                  end
                  object CheckBox12: TCheckBox
                    Left = 16
                    Top = 127
                    Width = 369
                    Height = 17
                    Caption = 
                      'Imprimir Status / Juros e Desconto quando existir (linha adicion' +
                      'al)'
                    TabOrder = 5
                    OnKeyDown = BitBtn54KeyDown
                  end
                  object RadioButton1: TRadioButton
                    Left = 16
                    Top = 24
                    Width = 113
                    Height = 17
                    Caption = 'Gr'#225'fico'
                    TabOrder = 0
                    OnClick = RadioButton1Click
                    OnKeyDown = BitBtn54KeyDown
                  end
                  object RadioButton2: TRadioButton
                    Left = 202
                    Top = 24
                    Width = 113
                    Height = 17
                    Caption = 'Matricial'
                    TabOrder = 1
                    OnClick = RadioButton1Click
                    OnKeyDown = BitBtn54KeyDown
                  end
                  object CheckBox15: TCheckBox
                    Left = 16
                    Top = 202
                    Width = 369
                    Height = 17
                    Caption = 'Agrupar empresas unificadas'
                    TabOrder = 8
                    OnKeyDown = BitBtn54KeyDown
                  end
                  object CheckBoxExibirVenda: TCheckBox
                    Left = 16
                    Top = 178
                    Width = 369
                    Height = 17
                    Caption = 'Imprimir data da venda, num doc e tipo documento'
                    TabOrder = 7
                    OnKeyDown = BitBtn54KeyDown
                  end
                  object CheckBox16: TCheckBox
                    Left = 16
                    Top = 101
                    Width = 417
                    Height = 17
                    Caption = 
                      'Imprimir Bandeira, Administradora, Parcela e Taxa quando existir' +
                      ' (linha adicional)'
                    TabOrder = 4
                    OnKeyDown = BitBtn54KeyDown
                  end
                  object CheckBox17: TCheckBox
                    Left = 16
                    Top = 153
                    Width = 369
                    Height = 17
                    Caption = 'Imprimir C'#243'digo e Nome do Vendededor (linha adicional)'
                    TabOrder = 6
                    OnKeyDown = BitBtn54KeyDown
                  end
                end
                object Panel67: TPanel
                  Left = 6
                  Top = 322
                  Width = 449
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn55: TBitBtn
                    Left = 144
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Imprimir'
                    Caption = '&Imprimir'
                    TabOrder = 0
                    OnClick = BitBtn55Click
                    OnKeyDown = BitBtn54KeyDown
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                      4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                      92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                      EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                      734EF75E104210429452AE358610861086108610861086108610861086108610
                      AE35945210423146F75EAE358610861086108610861086108610861086108610
                      AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                      9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                      F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                      B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                      1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                      1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C}
                  end
                  object BitBtn56: TBitBtn
                    Left = 225
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Cancelar'
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn56Click
                    OnKeyDown = BitBtn54KeyDown
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
                  end
                end
                object Panel73: TPanel
                  Left = 6
                  Top = 6
                  Width = 449
                  Height = 85
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox13: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 225
                    Height = 85
                    Align = alLeft
                    Caption = 'Imprimir &Boletos'
                    TabOrder = 0
                    object BitBtn54: TBitBtn
                      Left = 2
                      Top = 49
                      Width = 221
                      Height = 34
                      Hint = 'Gerar/Imprimir Boleto- [BOL010/CAR099]'
                      Align = alClient
                      Caption = 'Gerar/Imprimir &Boleto'
                      TabOrder = 1
                      OnClick = BitBtn54Click
                      OnKeyDown = BitBtn54KeyDown
                      Glyph.Data = {
                        42020000424D4202000000000000420000002800000010000000100000000100
                        10000300000000020000120B0000120B00000000000000000000007C0000E003
                        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                        4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                        92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                        EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                        734EF75E104210429452AE358610861086108610861086108610861086108610
                        AE35945210423146F75EAE358610861086108610861086108610861086108610
                        AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                        9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                        F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                        B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                        1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                        1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C}
                    end
                    object Panel74: TPanel
                      Left = 2
                      Top = 15
                      Width = 221
                      Height = 34
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object ckUsarValorCorrGerarBoleto: TCheckBox
                        Left = 4
                        Top = 6
                        Width = 349
                        Height = 17
                        Caption = 'Usar valor corrigido ao gerar boletos'
                        TabOrder = 0
                      end
                    end
                  end
                  object GroupBox18: TGroupBox
                    Left = 225
                    Top = 0
                    Width = 224
                    Height = 85
                    Align = alClient
                    Caption = 'Imprimir &Carn'#234' (Boletos)'
                    TabOrder = 1
                    object Panel75: TPanel
                      Left = 2
                      Top = 15
                      Width = 220
                      Height = 34
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                    end
                    object BitBtn68: TBitBtn
                      Left = 2
                      Top = 49
                      Width = 220
                      Height = 34
                      Hint = 'Imprimir Carn'#234' - [BOL010/CAR063]'
                      Align = alClient
                      Caption = 'Gerar/Imprimir &Carn'#234
                      TabOrder = 1
                      OnClick = BitBtn68Click
                      OnKeyDown = BitBtn68KeyDown
                      Glyph.Data = {
                        42020000424D4202000000000000420000002800000010000000100000000100
                        10000300000000020000120B0000120B00000000000000000000007C0000E003
                        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                        4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                        92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                        EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                        734EF75E104210429452AE358610861086108610861086108610861086108610
                        AE35945210423146F75EAE358610861086108610861086108610861086108610
                        AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                        9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                        F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                        B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                        1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                        1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C}
                    end
                  end
                end
              end
            end
            object tsListaRetornos: TTabSheet
              Caption = 'tsListaRetornos'
              ImageIndex = 9
              object pnListaRetornos: TPanel
                Left = 0
                Top = 0
                Width = 825
                Height = 493
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                object GroupBox15: TGroupBox
                  Left = 6
                  Top = 6
                  Width = 809
                  Height = 139
                  Align = alTop
                  Caption = 'Cr'#233'dito'
                  TabOrder = 0
                  object gridCreditosRetorno: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 805
                    Height = 122
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
                object GroupBox16: TGroupBox
                  Left = 6
                  Top = 145
                  Width = 809
                  Height = 297
                  Align = alClient
                  Caption = 'Lista Mercadorias Retornadas'
                  TabOrder = 1
                  object gridListaMercadoriasRet: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 805
                    Height = 263
                    Align = alClient
                    DataSource = dtmContasAReceber.dsNFRet
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnDrawColumnCell = gridListaMercadoriasRetDrawColumnCell
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'NUM_NF'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SERIE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'MODELO_NF'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_LANC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_TOTAL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUM_FAB_PROD'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DESCRICAO_ITEM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'QUANTIDADE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_UNITARIO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CRED_RET_FIN'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_NF'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NITEM'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'GRUPO_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_PROD'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EMPRESA'
                        Visible = True
                      end>
                  end
                  object CheckBox14: TCheckBox
                    Left = 2
                    Top = 278
                    Width = 805
                    Height = 17
                    Align = alBottom
                    Caption = 'Mostrar toda a lista de mercadorias retornadas sem baixas'
                    TabOrder = 1
                    OnClick = CheckBox14Click
                  end
                end
                object Panel68: TPanel
                  Left = 6
                  Top = 442
                  Width = 809
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn57: TBitBtn
                    Left = 26
                    Top = 6
                    Width = 122
                    Height = 25
                    Hint = 'Remover da Lista - [CAR084]'
                    Caption = 'Remover da Lista'
                    TabOrder = 0
                    OnClick = BitBtn57Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000220B0000220B000000010000000100000031DE000031
                      E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                      0404040404040404000004000004040404040404040404000004040000000404
                      0404040404040000040404000000000404040404040000040404040402000000
                      0404040400000404040404040404000000040000000404040404040404040400
                      0101010004040404040404040404040401010204040404040404040404040400
                      0201020304040404040404040404030201040403030404040404040404050203
                      0404040405030404040404040303050404040404040303040404040303030404
                      0404040404040403040403030304040404040404040404040404030304040404
                      0404040404040404040404040404040404040404040404040404}
                  end
                  object BitBtn58: TBitBtn
                    Left = 154
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Somar - [CAR085]'
                    Caption = 'Somar'
                    TabOrder = 1
                    OnClick = BitBtn58Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000130B0000130B00000001000000010000000000008484
                      8400FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                      0202020202020202020202020202020202020202020202020202020202020202
                      0202020202020202020202020202020202020202020202020202020202000000
                      0000000000000202020202020201000001020202020002020202020202020100
                      0001020202020202020202020202020100000102020202020202020202020202
                      0100000202020202020202020202020100000102020202020202020202020100
                      0001020202020202020202020201000001020202020002020202020202000000
                      0000000000000202020202020202020202020202020202020202020202020202
                      0202020202020202020202020202020202020202020202020202}
                  end
                  object BitBtn59: TBitBtn
                    Left = 235
                    Top = 6
                    Width = 129
                    Height = 25
                    Hint = 'Exportar para Excel - [CAR086]'
                    Caption = 'Exportar para Excel'
                    TabOrder = 2
                    OnClick = BitBtn59Click
                    Glyph.Data = {
                      8E020000424D8E020000000000008E0100002800000010000000100000000100
                      08000000000000010000120B0000120B0000560000005600000000000000FFFF
                      FF00FF00FF00A5696A0095655F009D6B620098686000A36F6400FFFBFA00AD78
                      6900A7746600BB7F6A00B47E6B00BF877000BA836D00BB704F00C48C7200D397
                      7800CA917400C2805C00D0906B00D59A7900CE957600F4EBE600FEF4ED00FFFC
                      FA00FCF4EE00FAEDE100FCF4ED00FEFCFA00EF993800E5A55F00F2D5B500F6E1
                      CA00F8E7D400F7E6D400F7E7D500F8EDE100E2A35B00F0D0A900F6E1C900F4E1
                      CA00FAEDDE00FAEEE000EECB9E00F4D5AD00F0D1AA00F2D7B400F2D7B500F4DD
                      C000F3DCBF00F8E9D500FAEFE000EFCA9600F0CF9F00FCE7C900E3D3BB00FCEB
                      D300FEEED400FBE5C000B7AD9C00FFF4E100FCF6EB00FFFBEE00FFFFFB00FFFF
                      FC00006A0000016C0100016B01000A760A000D780D001C831C0023892300469F
                      46004AA14A004DA34D004EA44E005FAD5F0060AD60006AB46A0078BB7800B4DA
                      B400BBDDBB00EEF7EE00FAFCFA00F8F8FE000202020202424242424242424242
                      424204030303034201010101010101010142063B2D3635420101010101010101
                      0142053720272C4201504247544F424B0142073A31302E420101514346424F01
                      01420A3D21322F420101014C424554010142093F2429324201014D424A434853
                      01420C40252328420149424E0152444801420E011A1B33420101010101010101
                      01420D0108182B4201010101010101010142100101191C424242424242424242
                      424212010101191C2A2239383C030202020216010101011D3E34030303030202
                      0202110101010101411703261E0F020202021501010101010155031F13020202
                      02021414141414141414030B020202020202}
                  end
                  object BitBtn60: TBitBtn
                    Left = 704
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = 'Sair'
                    TabOrder = 3
                    OnClick = BitBtn60Click
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
                  object BitBtn61: TBitBtn
                    Left = 370
                    Top = 6
                    Width = 168
                    Height = 25
                    Hint = 'Marcar Mercadoria p/ Baixa - [CAR087]'
                    Caption = 'Marcar Mercadoria p/ Baixa'
                    TabOrder = 4
                    OnClick = BitBtn61Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn62: TBitBtn
                    Left = 544
                    Top = 6
                    Width = 154
                    Height = 25
                    Hint = 'Marcar Automaticamente - [CAR087]'
                    Caption = 'Marcar Automaticamente'
                    TabOrder = 5
                    OnClick = BitBtn62Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                end
              end
            end
          end
        end
        object tsReceber: TTabSheet
          Caption = 'tsReceber'
          ImageIndex = 6
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 876
            Height = 520
            ActivePage = tsReceberIni
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tsReceberIni: TTabSheet
              Caption = 'tsReceberIni'
              object pnReceber: TPanel
                Left = 0
                Top = 0
                Width = 814
                Height = 511
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnReceberEnter
                object Panel38: TPanel
                  Left = 5
                  Top = 6
                  Width = 801
                  Height = 48
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  Visible = False
                  object Label65: TLabel
                    Left = 16
                    Top = 3
                    Width = 75
                    Height = 14
                    Caption = 'Conta de Sa'#237'da'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                  end
                  object Label66: TLabel
                    Left = 402
                    Top = 4
                    Width = 45
                    Height = 14
                    Caption = 'Hist'#243'rico'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                  end
                  object DBLookupComboBox7: TDBLookupComboBox
                    Left = 16
                    Top = 19
                    Width = 376
                    Height = 21
                    DropDownRows = 10
                    DropDownWidth = 760
                    KeyField = 'N_CONTA_PLC'
                    ListField = 'DESC_PLC;N_CONTA_PLC;DESC_GR;DESC_DEP'
                    ListSource = dtmContasAReceber.dsPCont
                    TabOrder = 0
                    OnExit = DBLookupComboBox7Exit
                  end
                  object Edit1: TEdit
                    Left = 398
                    Top = 19
                    Width = 378
                    Height = 21
                    TabOrder = 1
                    Text = 'Edit1'
                  end
                end
                object Panel37: TPanel
                  Left = 5
                  Top = 379
                  Width = 801
                  Height = 29
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label55: TLabel
                    Left = 29
                    Top = 6
                    Width = 52
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Dinheiro:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label56: TLabel
                    Left = 219
                    Top = 6
                    Width = 45
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Cheque:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label57: TLabel
                    Left = 410
                    Top = 6
                    Width = 50
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Cr'#233'ditos:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label58: TLabel
                    Left = 601
                    Top = 6
                    Width = 80
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Vale Compras:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbDinheiro: TLabel
                    Left = 87
                    Top = 6
                    Width = 59
                    Height = 13
                    Caption = 'lbDinheiro'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbCheque: TLabel
                    Left = 270
                    Top = 6
                    Width = 52
                    Height = 13
                    Caption = 'lbCheque'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbCreditos: TLabel
                    Left = 466
                    Top = 6
                    Width = 57
                    Height = 13
                    Caption = 'lbCreditos'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbValeCompras: TLabel
                    Left = 687
                    Top = 6
                    Width = 84
                    Height = 13
                    Caption = 'lbValeCompras'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                end
                object Panel36: TPanel
                  Left = 5
                  Top = 414
                  Width = 801
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label81: TLabel
                    Left = 15
                    Top = 11
                    Width = 95
                    Height = 16
                    Alignment = taRightJustify
                    Caption = 'Valor a Atingir:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbAtingir: TLabel
                    Left = 116
                    Top = 11
                    Width = 55
                    Height = 16
                    Caption = 'lbAtingir'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label83: TLabel
                    Left = 294
                    Top = 11
                    Width = 104
                    Height = 16
                    Alignment = taRightJustify
                    Caption = 'Valor a Informar:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbInformar: TLabel
                    Left = 404
                    Top = 11
                    Width = 64
                    Height = 16
                    Caption = 'lbInformar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label85: TLabel
                    Left = 602
                    Top = 11
                    Width = 95
                    Height = 16
                    Alignment = taRightJustify
                    Caption = 'Valor Atingido:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbAtingido: TLabel
                    Left = 703
                    Top = 11
                    Width = 66
                    Height = 16
                    Caption = 'lbAtingido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                end
                object Panel39: TPanel
                  Left = 5
                  Top = 461
                  Width = 801
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 3
                  object lbPrevistoDesc: TLabel
                    Left = 20
                    Top = 11
                    Width = 90
                    Height = 16
                    Alignment = taRightJustify
                    Caption = 'Valor Previsto:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbPrevisto: TLabel
                    Left = 116
                    Top = 11
                    Width = 61
                    Height = 16
                    Caption = 'lbPrevisto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object BitBtn14: TBitBtn
                    Left = 266
                    Top = 6
                    Width = 130
                    Height = 25
                    Caption = 'Confirmar - [ F11 ]'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                    OnClick = BitBtn14Click
                    OnKeyDown = DBGrid5KeyDown
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn15: TBitBtn
                    Left = 402
                    Top = 6
                    Width = 130
                    Height = 25
                    Caption = 'Cancelar - [ Esc ]'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 1
                    OnClick = BitBtn15Click
                    OnKeyDown = DBGrid5KeyDown
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
                  end
                end
                object Panel18: TPanel
                  Left = 5
                  Top = 6
                  Width = 801
                  Height = 367
                  BevelOuter = bvNone
                  Caption = 'Panel18'
                  TabOrder = 4
                  object Splitter3: TSplitter
                    Left = 225
                    Top = 0
                    Width = 5
                    Height = 367
                    ExplicitHeight = 313
                  end
                  object Panel19: TPanel
                    Left = 0
                    Top = 0
                    Width = 225
                    Height = 367
                    Align = alLeft
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object SpeedButton10: TSpeedButton
                      Left = 0
                      Top = 338
                      Width = 221
                      Height = 25
                      Align = alBottom
                      Caption = 'Vale Compra - [ F5 ]'
                      Flat = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -11
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFF1E2DFA7C7D389C7D589C9D5A5C9D4F2DA
                        D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF65A6BD00
                        98D406C5F40FCEFF0FD3FF04DBFF00D5FF66BBCBFF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FFCECCC8CCB3A631ABDB51A1C42393BF14A3D212A7D51FA1CE4CA6
                        D31BB9E8FF00FFFF00FFFF00FFFF00FFFF00FFD0CECAD9CEC4F2D8C73788A800
                        A3D70FCAF71AD5FD19D3F70CD4F900DAFF54B8CEFF00FFFF00FFFF00FFDEDEDD
                        A6A3A0B4AAA1DDDEDDC5A48F1FA6DD53A8CD2090B908A3D003BADF08BCDC14AC
                        D60095C2FFF4EAFF00FFFF00FFC9C0B7E3DBD2DDD2C9D2CAC2D1BDAE81B6CB00
                        8CC521B0DE35C0EB32C4F831C7FA2CCBFA07D6FF32BED9FF00FFDFDEDDD8D0C6
                        D6D1CAC6BFB5BCB1A5CAC6BDE9C2AA3FB5E33BAFD914B0E808C0FA07C4FF11C8
                        FF41D4FE54C3E9FF00FFFCFCFED3CABFD9D5CEF3F1EDF7F6F4F5F4F1FDF8F1CF
                        E3EA50BEE91ABDF31ACDFF1AD2FF15CCFF5ED3F1D8D7D7FF00FFEEEFEFE0D7CD
                        DFDBD5CDC7BEC7BFB5C1B9AFC0B9AEC3B6A9EFD5C4F2D9CCEFDFD8E7D4CBFFE3
                        D6FADCCBDAD7D6FF00FFEAEBEAD7CEC4B5AB9EB7ACA0B4AA9EC7C0B5D6D0C8EF
                        EEEAF1EFECECEBE7E3DED7EFEDE9F0EFEBC3B7AAFF00FFFF00FFDFDCD9DDD4CB
                        E9E2DCEDE8E2EEEBE5E9E6E0D8D1CBC7C1B8BEB6ABB2A99CBEB5ABA99E90D1CB
                        C3C2B9AFFF00FFFF00FFFF00FFF1F1F1EAE9E8E7E5E1E7E4E0CDC5BDDBD2C9D8
                        D0C8D9D1C9EDE6E1E4DCD4ECE8E2ECE7E1BCB0A4E0DFDEFF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFDCD8D4E6DED6C0B7ADBDB5AAE3E1DBDAD7D1CFC5
                        BBD8D5D3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDC
                        D8D4E7DFD6C4BFB4E0DCD7CEC1B6E7E7E6FF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAD7D2E1D7D0D6CCC2E6E5E5FF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFE6E3E0E7E6E4FF00FFFF00FFFF00FFFF00FFFF00FF}
                      ParentFont = False
                      OnClick = SpeedButton10Click
                      ExplicitTop = 242
                    end
                    object Panel20: TPanel
                      Left = 0
                      Top = 0
                      Width = 221
                      Height = 22
                      Align = alTop
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      Caption = 'Controles - [ F2 ]'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -11
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      TabOrder = 0
                    end
                    object DBGrid5: TDBGrid
                      Left = 0
                      Top = 22
                      Width = 221
                      Height = 299
                      Align = alClient
                      DataSource = dtmContasAReceber.dsCtrl
                      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      ReadOnly = True
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnDblClick = DBGrid5DblClick
                      OnKeyDown = DBGrid5KeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'codigo_ctrl'
                          Title.Caption = 'C'#243'digo'
                          Width = 39
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'nome_ctrl'
                          Title.Caption = 'Controle'
                          Visible = True
                        end>
                    end
                    object Panel50: TPanel
                      Left = 0
                      Top = 321
                      Width = 221
                      Height = 17
                      Align = alBottom
                      BevelOuter = bvNone
                      TabOrder = 2
                      object CheckBox2: TCheckBox
                        Left = 32
                        Top = 0
                        Width = 156
                        Height = 17
                        Alignment = taLeftJustify
                        BiDiMode = bdLeftToRight
                        Caption = 'Usar "Valor a Atingir" [ F6 ]'
                        Checked = True
                        ParentBiDiMode = False
                        State = cbChecked
                        TabOrder = 0
                        OnKeyDown = DBGrid5KeyDown
                      end
                    end
                  end
                  object Panel33: TPanel
                    Left = 230
                    Top = 0
                    Width = 571
                    Height = 367
                    Align = alClient
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Panel34: TPanel
                      Left = 0
                      Top = 0
                      Width = 567
                      Height = 22
                      Align = alTop
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      Caption = 'Lan'#231'amentos Efetuados  - [ F2 ]'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -11
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      TabOrder = 0
                    end
                    object DBGrid6: TDBGrid
                      Left = 0
                      Top = 22
                      Width = 567
                      Height = 300
                      Align = alClient
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnKeyDown = DBGrid5KeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'TIPO'
                          Title.Caption = 'Tipo'
                          Width = 32
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NOMECTRL'
                          Title.Caption = 'Controle'
                          Width = 175
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_L'
                          Title.Caption = 'Valor'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NDOC_L'
                          Title.Caption = 'Num Doc'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VENCIMENTO'
                          Title.Caption = 'Vencimento'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'HIST'
                          Title.Caption = 'Hist'#243'rico'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'HISTORICO_L'
                          Title.Caption = 'Hist'#243'rico Lan'#231'amento Sa'#237'da'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUMCONTASAIDA'
                          Title.Caption = 'Num Conta Sa'#237'da'
                          Visible = True
                        end>
                    end
                    object Panel35: TPanel
                      Left = 0
                      Top = 322
                      Width = 567
                      Height = 41
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 2
                      object SpeedButton13: TSpeedButton
                        Left = 168
                        Top = 7
                        Width = 110
                        Height = 23
                        Caption = 'Alterar - [ F3 ]'
                        Flat = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Arial'
                        Font.Style = [fsItalic]
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000320B0000320B0000000100000001000000000000CE63
                          00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
                          A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
                          C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
                          1818181818181818181818010101010101010101010101010101180119191716
                          1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
                          17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
                          1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
                          191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
                          19191919091505020C0118011919191919191919190700140001180101010101
                          0101010101041414030118180101010101010101010108080618181818181818
                          1818181818181818181818181818181818181818181818181818}
                        ParentFont = False
                        OnClick = SpeedButton13Click
                      end
                      object SpeedButton14: TSpeedButton
                        Left = 284
                        Top = 7
                        Width = 110
                        Height = 23
                        Caption = 'Excluir - [ Del ]'
                        Flat = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Arial'
                        Font.Style = [fsItalic]
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000220B0000220B000000010000000100000031DE000031
                          E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                          0404040404040404000004000004040404040404040404000004040000000404
                          0404040404040000040404000000000404040404040000040404040402000000
                          0404040400000404040404040404000000040000000404040404040404040400
                          0101010004040404040404040404040401010204040404040404040404040400
                          0201020304040404040404040404030201040403030404040404040404050203
                          0404040405030404040404040303050404040404040303040404040303030404
                          0404040404040403040403030304040404040404040404040404030304040404
                          0404040404040404040404040404040404040404040404040404}
                        ParentFont = False
                        OnClick = SpeedButton14Click
                      end
                    end
                  end
                end
              end
            end
            object tsRecLanc: TTabSheet
              Caption = 'tsRecLanc'
              ImageIndex = 1
              object pnRecLanc: TPanel
                Left = 0
                Top = 3
                Width = 675
                Height = 358
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnRecLancEnter
                object Panel41: TPanel
                  Left = 0
                  Top = 317
                  Width = 675
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn16: TBitBtn
                    Left = 257
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn16Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn29: TBitBtn
                    Left = 338
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn29Click
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
                  end
                end
                object GroupBox8: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 675
                  Height = 317
                  Align = alClient
                  Caption = 'Dinheiro'
                  TabOrder = 0
                  OnEnter = GroupBox8Enter
                  object scrollDinheiro: TScrollBox
                    Left = 2
                    Top = 15
                    Width = 671
                    Height = 300
                    Align = alClient
                    BevelOuter = bvNone
                    BorderStyle = bsNone
                    TabOrder = 0
                    object Label82: TLabel
                      Left = 111
                      Top = 24
                      Width = 59
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' da Conta'
                      FocusControl = DBEdit22
                    end
                    object Label87: TLabel
                      Left = 126
                      Top = 105
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Natureza'
                    end
                    object Label88: TLabel
                      Left = 86
                      Top = 132
                      Width = 84
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Lan'#231'amento'
                      FocusControl = DBEdit51
                    end
                    object Label89: TLabel
                      Left = 478
                      Top = 132
                      Width = 78
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Refer'#234'ncia'
                      FocusControl = DBEdit52
                    end
                    object Label90: TLabel
                      Left = 101
                      Top = 159
                      Width = 69
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' Documento'
                      FocusControl = DBEdit53
                    end
                    object Label91: TLabel
                      Left = 129
                      Top = 186
                      Width = 41
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Hist'#243'rico'
                      FocusControl = DBEdit54
                    end
                    object Label92: TLabel
                      Left = 146
                      Top = 213
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor'
                      FocusControl = DBEdit55
                    end
                    object Label93: TLabel
                      Left = 421
                      Top = 213
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Cont'#225'bil'
                      FocusControl = DBEdit56
                    end
                    object Label94: TLabel
                      Left = 129
                      Top = 240
                      Width = 41
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Controle'
                      FocusControl = DBEdit57
                    end
                    object Label95: TLabel
                      Left = 124
                      Top = 267
                      Width = 46
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo(C/N)'
                    end
                    object DBEdit22: TDBEdit
                      Left = 176
                      Top = 21
                      Width = 73
                      Height = 21
                      Hint = 'Numero da conta do Plano de Contas'
                      DataField = 'N_CONTA_PLC'
                      TabOrder = 0
                      OnExit = DBEdit22Exit
                    end
                    object DBLookupComboBox8: TDBLookupComboBox
                      Left = 255
                      Top = 21
                      Width = 380
                      Height = 21
                      Hint = 'Nome da Conta do Plano de Contas'
                      DataField = 'N_CONTA_PLC'
                      KeyField = 'N_CONTA_PLC'
                      ListField = 'DESC_PLC;N_CONTA_PLC'
                      ListSource = dtmContasAReceber.dsPCont
                      TabOrder = 1
                      OnExit = DBLookupComboBox8Exit
                    end
                    object Panel40: TPanel
                      Left = 19
                      Top = 42
                      Width = 621
                      Height = 57
                      Hint = 'Dados da Conta Selecionada'
                      BevelOuter = bvNone
                      Enabled = False
                      TabOrder = 2
                      object Label84: TLabel
                        Left = 75
                        Top = 9
                        Width = 76
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Grupo da Conta'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label86: TLabel
                        Left = 35
                        Top = 36
                        Width = 116
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Departamento da Conta'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit23: TDBEdit
                        Left = 157
                        Top = 6
                        Width = 459
                        Height = 21
                        DataField = 'DESC_GR'
                        DataSource = dtmContasAReceber.dsPCont
                        TabOrder = 0
                      end
                      object DBEdit35: TDBEdit
                        Left = 157
                        Top = 33
                        Width = 459
                        Height = 21
                        DataField = 'DESC_DEP'
                        DataSource = dtmContasAReceber.dsPCont
                        TabOrder = 1
                      end
                    end
                    object DBEdit51: TDBEdit
                      Left = 176
                      Top = 129
                      Width = 73
                      Height = 21
                      Hint = 'Data de Lan'#231'amento'
                      DataField = 'DATA'
                      TabOrder = 3
                      OnExit = DBEdit51Exit
                    end
                    object DBEdit52: TDBEdit
                      Left = 562
                      Top = 129
                      Width = 73
                      Height = 21
                      Hint = 'Data de refer'#234'ncia do lan'#231'amento'
                      DataField = 'DTREFERENCIA'
                      TabOrder = 4
                      OnExit = DBEdit52Exit
                    end
                    object DBEdit53: TDBEdit
                      Left = 176
                      Top = 156
                      Width = 134
                      Height = 21
                      Hint = 'Numero do documento'
                      CharCase = ecUpperCase
                      DataField = 'NDOC_L'
                      MaxLength = 10
                      TabOrder = 5
                    end
                    object DBEdit54: TDBEdit
                      Left = 176
                      Top = 183
                      Width = 459
                      Height = 21
                      Hint = 'Hist'#243'rico do Lan'#231'amento'
                      CharCase = ecUpperCase
                      DataField = 'HISTORICO_L'
                      TabOrder = 6
                    end
                    object DBEdit55: TDBEdit
                      Left = 176
                      Top = 210
                      Width = 134
                      Height = 21
                      Hint = 'Valor do lan'#231'amento'
                      DataField = 'VALOR_L'
                      TabOrder = 7
                      OnExit = DBEdit55Exit
                    end
                    object DBEdit56: TDBEdit
                      Left = 493
                      Top = 210
                      Width = 134
                      Height = 21
                      Hint = 'Valor cont'#225'bil do lan'#231'amento'
                      DataField = 'VL_CONTABIL'
                      TabOrder = 8
                    end
                    object DBEdit57: TDBEdit
                      Left = 176
                      Top = 237
                      Width = 73
                      Height = 21
                      Hint = 'Codigo do Controle'
                      DataField = 'CODIGO_CTRL'
                      TabOrder = 9
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 176
                      Top = 102
                      Width = 73
                      Height = 21
                      Hint = 'Natureza do Lan'#231'amento'
                      CharCase = ecUpperCase
                      DataField = 'TIPO_L'
                      Enabled = False
                      ItemHeight = 13
                      Items.Strings = (
                        'ENTRADA'
                        'SA'#205'DA')
                      TabOrder = 10
                    end
                    object DBLookupComboBox9: TDBLookupComboBox
                      Left = 255
                      Top = 237
                      Width = 380
                      Height = 21
                      Hint = 'Nome do controle do lancamento'
                      DataField = 'CODIGO_CTRL'
                      KeyField = 'CODIGO_CTRL'
                      ListField = 'NOME_CTRL'
                      ListSource = dtmContasAReceber.dsCtrl
                      TabOrder = 11
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 176
                      Top = 264
                      Width = 73
                      Height = 21
                      Hint = 'Tipo de Lan'#231'amento'
                      CharCase = ecUpperCase
                      DataField = 'TIP_CNT'
                      Enabled = False
                      ItemHeight = 13
                      Items.Strings = (
                        'C'
                        'N')
                      TabOrder = 12
                    end
                  end
                end
              end
            end
            object tsRecCheque: TTabSheet
              Caption = 'tsRecCheque'
              ImageIndex = 2
              object pnRecCheque: TPanel
                Left = 3
                Top = -77
                Width = 675
                Height = 545
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnRecChequeEnter
                object Panel42: TPanel
                  Left = 0
                  Top = 504
                  Width = 675
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn30: TBitBtn
                    Left = 257
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn30Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn31: TBitBtn
                    Left = 338
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn31Click
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
                  end
                end
                object GroupBox7: TGroupBox
                  Left = 0
                  Top = 466
                  Width = 675
                  Height = 38
                  Align = alBottom
                  Caption = 'Lan'#231'amento'
                  TabOrder = 0
                  object Label64: TLabel
                    Left = 129
                    Top = 16
                    Width = 41
                    Height = 13
                    Caption = 'Historico'
                  end
                  object Edit3: TEdit
                    Left = 176
                    Top = 13
                    Width = 459
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 0
                    Text = 'EDIT3'
                  end
                end
              end
            end
            object tsRecCredito: TTabSheet
              Caption = 'tsRecCredito'
              ImageIndex = 3
              object pnRecCredito: TPanel
                Left = 3
                Top = -102
                Width = 675
                Height = 577
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnRecCreditoEnter
                object Panel44: TPanel
                  Left = 0
                  Top = 536
                  Width = 675
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn32: TBitBtn
                    Left = 257
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn32Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn33: TBitBtn
                    Left = 338
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn33Click
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
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 0
                  Top = 498
                  Width = 675
                  Height = 38
                  Align = alBottom
                  Caption = 'Lan'#231'amento'
                  TabOrder = 0
                  object Label63: TLabel
                    Left = 129
                    Top = 16
                    Width = 41
                    Height = 13
                    Caption = 'Historico'
                  end
                  object Edit2: TEdit
                    Left = 176
                    Top = 13
                    Width = 459
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 0
                    Text = 'EDIT2'
                  end
                end
              end
            end
            object tsRecRecibo: TTabSheet
              Caption = 'tsRecRecibo'
              ImageIndex = 4
              object pnRecibos: TPanel
                Left = -3
                Top = 3
                Width = 669
                Height = 358
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnRecibosEnter
                object Panel43: TPanel
                  Left = 4
                  Top = 5
                  Width = 658
                  Height = 297
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label96: TLabel
                    Left = 8
                    Top = 8
                    Width = 201
                    Height = 13
                    Caption = 'Clique na no t'#237'tulo da coluna para ordenar'
                  end
                  object Label97: TLabel
                    Left = 8
                    Top = 266
                    Width = 127
                    Height = 13
                    Caption = 'Ir para recibo pelo numero'
                  end
                  object Label98: TLabel
                    Left = 467
                    Top = 6
                    Width = 174
                    Height = 16
                    Alignment = taRightJustify
                    Caption = 'Total de recibos : R$ 4.345,59'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label100: TLabel
                    Left = 231
                    Top = 8
                    Width = 196
                    Height = 13
                    Caption = 'Aperte F5 para informar o valor de baixa'
                  end
                  object Label101: TLabel
                    Left = 241
                    Top = 266
                    Width = 127
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Ir para recibos pelo cliente'
                  end
                  object SpeedButton15: TSpeedButton
                    Left = 212
                    Top = 263
                    Width = 23
                    Height = 22
                    Visible = False
                    OnClick = SpeedButton15Click
                  end
                  object DBGrid7: TDBGrid
                    Left = 8
                    Top = 27
                    Width = 633
                    Height = 230
                    DataSource = dtmContasAReceber.dsRec
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnCellClick = DBGrid7CellClick
                    OnDrawColumnCell = DBGrid7DrawColumnCell
                    OnDblClick = DBGrid7DblClick
                    OnKeyDown = DBGrid7KeyDown
                    OnMouseUp = DBGrid7MouseUp
                    OnTitleClick = DBGrid7TitleClick
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'SELEC'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EMP_MULT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_REC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NRECIBO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUM_REC_DEP'
                        Title.Caption = 'N'#186' Recibo'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_UT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_DEV'
                        Title.Caption = 'Cliente'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_REC'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'REFERENCIA1'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'REFERENCIA2'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'REFERENCIA3'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'REFERENCIA4'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_BENEF'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'BENEF_CLIENT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_DEVEDOR'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LOCALDATA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'RECANT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DEPREC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NDOCANT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DIA_CXL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_MOV_CXL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OBS_CXL_RQ'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_CXL_RQ'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_RQ_PG_CXL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_BAIXA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HISTORICO_REC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_PREP'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OP_CXL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_US'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUM_NF'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SERIE_NF'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ATRAVES1'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ATRAVES2'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ATRAVES3'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OBSERVACAO1'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OBSERVACAO2'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OBSERVACAO3'
                        Width = 64
                        Visible = True
                      end>
                  end
                  object Edit4: TEdit
                    Left = 374
                    Top = 263
                    Width = 267
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 1
                    OnEnter = Edit4Enter
                    OnExit = Edit4Exit
                    OnKeyDown = Edit4KeyDown
                  end
                  object edNumRecibo: TEdit
                    Left = 140
                    Top = 263
                    Width = 68
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 2
                    OnEnter = edNumReciboEnter
                    OnExit = edNumReciboExit
                    OnKeyDown = edNumReciboKeyDown
                    OnKeyPress = edNumReciboKeyPress
                  end
                end
                object Panel46: TPanel
                  Left = 4
                  Top = 308
                  Width = 658
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn34: TBitBtn
                    Left = 275
                    Top = 6
                    Width = 105
                    Height = 25
                    Caption = '&Continuar'
                    TabOrder = 0
                    OnClick = BitBtn34Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn63: TBitBtn
                    Left = 5
                    Top = 6
                    Width = 81
                    Height = 25
                    Hint = 'Imprimir - [REC006]'
                    Caption = '&Imprimir'
                    TabOrder = 1
                    OnClick = BitBtn63Click
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      10000300000000020000120B0000120B00000000000000000000007C0000E003
                      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                      4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                      92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                      EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                      734EF75E104210429452AE358610861086108610861086108610861086108610
                      AE35945210423146F75EAE358610861086108610861086108610861086108610
                      AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                      9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                      F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                      B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                      1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                      1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C}
                  end
                end
              end
              object pnReciboValor: TPanel
                Left = 3
                Top = 367
                Width = 478
                Height = 137
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                OnEnter = pnReciboValorEnter
                object Panel48: TPanel
                  Left = 6
                  Top = 86
                  Width = 463
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn38: TBitBtn
                    Left = 152
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn38Click
                    OnKeyDown = BitBtn38KeyDown
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn39: TBitBtn
                    Left = 233
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn39Click
                    OnKeyDown = BitBtn38KeyDown
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
                  end
                end
                object Panel49: TPanel
                  Left = 6
                  Top = 7
                  Width = 463
                  Height = 25
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 
                    'Informe o valor de baixa para o recibo numero:  4323. Valor : R$' +
                    ' 223,00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 2
                end
                object Panel47: TPanel
                  Left = 6
                  Top = 38
                  Width = 463
                  Height = 42
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label99: TLabel
                    Left = 113
                    Top = 11
                    Width = 107
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor a ser dado baixa'
                  end
                  object edValorDeBaixa: TEditHw
                    Left = 226
                    Top = 8
                    Width = 120
                    Height = 21
                    TabOrder = 0
                    Text = '0,00'
                    OnKeyDown = BitBtn38KeyDown
                    Formato = fNumber
                    FormatSize = '0.2'
                  end
                end
              end
            end
            object tsDesconto: TTabSheet
              Caption = 'tsDesconto'
              ImageIndex = 6
              object pnDesconto: TPanel
                Left = 3
                Top = 3
                Width = 430
                Height = 180
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnDescontoEnter
                object Label59: TLabel
                  Left = 99
                  Top = 82
                  Width = 137
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Percentual do Desconto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label62: TLabel
                  Left = 49
                  Top = 109
                  Width = 187
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Desconto sobre o Valor Corrigido:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object pnValorDaOperacao: TPanel
                  Left = 0
                  Top = 0
                  Width = 426
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Panel1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                end
                object Panel45: TPanel
                  Left = 0
                  Top = 135
                  Width = 426
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 4
                  object BitBtn36: TBitBtn
                    Left = 129
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn36Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn37: TBitBtn
                    Left = 210
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Cancelar'
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn37Click
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
                  end
                end
                object edDescPerc: TEditHw
                  Left = 242
                  Top = 79
                  Width = 121
                  Height = 21
                  TabOrder = 1
                  Text = '0,00'
                  OnExit = edDescPercExit
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object edDescValor: TEditHw
                  Left = 242
                  Top = 106
                  Width = 121
                  Height = 21
                  TabOrder = 2
                  Text = '0,00'
                  OnExit = edDescValorExit
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object RadioGroupDescontoAcrescimo: TRadioGroup
                  Left = 0
                  Top = 41
                  Width = 426
                  Height = 36
                  Align = alTop
                  Caption = 'Op'#231#227'o'
                  Columns = 2
                  ItemIndex = 0
                  Items.Strings = (
                    'Desconto'
                    'Acrescimo')
                  TabOrder = 0
                  OnClick = RadioGroupDescontoAcrescimoClick
                end
              end
              object pnDadosBaixa: TPanel
                Left = 3
                Top = 189
                Width = 494
                Height = 300
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 2
                OnEnter = pnDadosBaixaEnter
                object Panel55: TPanel
                  Left = 3
                  Top = 51
                  Width = 484
                  Height = 66
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label106: TLabel
                    Left = 8
                    Top = 34
                    Width = 71
                    Height = 13
                    Caption = 'Hist'#243'rico Caixa'
                  end
                  object CheckBox5: TCheckBox
                    Left = 8
                    Top = 8
                    Width = 241
                    Height = 17
                    Caption = 'Acrescentar o nome no hist'#243'rico da saida'
                    TabOrder = 0
                    OnClick = CheckBox5Click
                    OnKeyDown = edValorBaixaParcialKeyDown
                  end
                  object Edit5: TEdit
                    Left = 85
                    Top = 31
                    Width = 380
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 1
                    Text = 'EDIT5'
                    OnKeyDown = edValorBaixaParcialKeyDown
                  end
                end
                object pnValorBaixa: TPanel
                  Left = 3
                  Top = 4
                  Width = 484
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  object Label107: TLabel
                    Left = 116
                    Top = 11
                    Width = 121
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor da baixa Parcial'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object edValorBaixaParcial: TEditHw
                    Left = 243
                    Top = 8
                    Width = 121
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    Text = '0,00'
                    OnKeyDown = edValorBaixaParcialKeyDown
                    Formato = fNumber
                    FormatSize = '0.2'
                  end
                end
                object Panel51: TPanel
                  Left = 3
                  Top = 250
                  Width = 484
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 5
                  object BitBtn41: TBitBtn
                    Left = 162
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn41Click
                    OnKeyDown = edValorBaixaParcialKeyDown
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn42: TBitBtn
                    Left = 243
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn42Click
                    OnKeyDown = edValorBaixaParcialKeyDown
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
                  end
                end
                object Panel56: TPanel
                  Left = 3
                  Top = 203
                  Width = 484
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 4
                  object Label108: TLabel
                    Left = 159
                    Top = 13
                    Width = 78
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Data da Baixa'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object MaskEdit4: TMaskEdit
                    Left = 243
                    Top = 8
                    Width = 120
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 0
                    Text = '  /  /    '
                  end
                end
                object Panel57: TPanel
                  Left = 3
                  Top = 123
                  Width = 484
                  Height = 74
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 3
                  object CheckBox6: TCheckBox
                    Left = 8
                    Top = 4
                    Width = 289
                    Height = 17
                    Caption = 'Lan'#231'ar descontos concedidos para mensurar valores'
                    TabOrder = 0
                    OnClick = CheckBox5Click
                    OnKeyDown = edValorBaixaParcialKeyDown
                  end
                  object CheckBox7: TCheckBox
                    Left = 8
                    Top = 27
                    Width = 241
                    Height = 17
                    Caption = 'Lan'#231'ar juros recebidos para mensurar valores'
                    TabOrder = 1
                    OnClick = CheckBox5Click
                    OnKeyDown = edValorBaixaParcialKeyDown
                  end
                  object CheckBox8: TCheckBox
                    Left = 8
                    Top = 50
                    Width = 465
                    Height = 17
                    Caption = 
                      'Lan'#231'ar sa'#237'da do valor correspondente a taxa de cart'#227'o de cr'#233'dito' +
                      ' / taxa e-commerce'
                    TabOrder = 2
                    OnClick = CheckBox5Click
                    OnKeyDown = edValorBaixaParcialKeyDown
                  end
                end
                object pnUsarValorCorrigido: TPanel
                  Left = 3
                  Top = 4
                  Width = 484
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object CheckBox4: TCheckBox
                    Left = 8
                    Top = 10
                    Width = 121
                    Height = 17
                    Caption = 'Usar Valor Corrigido'
                    TabOrder = 0
                  end
                end
              end
              object pnDadosBaixaDevolv: TPanel
                Left = 431
                Top = 240
                Width = 506
                Height = 205
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 3
                OnEnter = pnDadosBaixaDevolvEnter
                object pnDadosHistSaidaDev: TPanel
                  Left = 6
                  Top = 6
                  Width = 490
                  Height = 148
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object lbHistSaidaDevo: TLabel
                    Left = 8
                    Top = 34
                    Width = 117
                    Height = 13
                    Caption = 'Hist'#243'rico do Lan'#231'amento'
                  end
                  object lbTextoHistSaidaDev: TLabel
                    Left = 8
                    Top = 53
                    Width = 118
                    Height = 13
                    Caption = 'lbTextoHistSaidaDev'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object ckHistSaidaDev: TCheckBox
                    Left = 8
                    Top = 8
                    Width = 241
                    Height = 17
                    Caption = 'Acrescentar o nome no hist'#243'rico da saida'
                    TabOrder = 0
                    OnClick = ckHistSaidaDevClick
                    OnKeyDown = edHistSaidaDevKeyDown
                  end
                  object ck_motivo_dev: TCheckBox
                    Left = 8
                    Top = 94
                    Width = 385
                    Height = 17
                    Caption = 
                      'Salvar motivo da Devolu'#231#227'o/Cancelamento no Hist'#243'rico do Cr'#233'dito/' +
                      'Cheque'
                    TabOrder = 1
                    OnClick = ck_motivo_devClick
                  end
                  object ed_motivo_dev: TEdit
                    Left = 8
                    Top = 117
                    Width = 465
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 2
                    Text = 'ED_MOTIVO_DEV'
                  end
                end
                object pnBotoesHistSaidaDev: TPanel
                  Left = 6
                  Top = 154
                  Width = 490
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object btContinuarHistSaidaDev: TBitBtn
                    Left = 201
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Continuar'
                    TabOrder = 0
                    OnClick = btContinuarHistSaidaDevClick
                    OnKeyDown = edHistSaidaDevKeyDown
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                end
              end
              object pnDiferenca: TPanel
                Left = 439
                Top = 3
                Width = 429
                Height = 217
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 1
                OnEnter = pnDiferencaEnter
                object Panel52: TPanel
                  Left = 6
                  Top = 166
                  Width = 413
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn35: TBitBtn
                    Left = 129
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn35Click
                    OnKeyDown = BitBtn40KeyDown
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                  object BitBtn40: TBitBtn
                    Left = 210
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn40Click
                    OnKeyDown = BitBtn40KeyDown
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
                  end
                end
                object Panel53: TPanel
                  Left = 6
                  Top = 6
                  Width = 413
                  Height = 22
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Lan'#231'ar o valor da DIFERENCA R$ 1.233,33'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 0
                end
                object Panel54: TPanel
                  Left = 6
                  Top = 28
                  Width = 413
                  Height = 138
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label102: TLabel
                    Left = 13
                    Top = 12
                    Width = 85
                    Height = 14
                    BiDiMode = bdRightToLeft
                    Caption = 'Conta de Entrada'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentBiDiMode = False
                    ParentFont = False
                  end
                  object Label103: TLabel
                    Left = 53
                    Top = 39
                    Width = 45
                    Height = 14
                    Caption = 'Hist'#243'rico'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                  end
                  object Label104: TLabel
                    Left = 56
                    Top = 66
                    Width = 42
                    Height = 14
                    Caption = 'Controle'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                  end
                  object Label132: TLabel
                    Left = 24
                    Top = 93
                    Width = 74
                    Height = 14
                    Alignment = taRightJustify
                    Caption = 'Valor Contabil:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                  end
                  object DBLookupComboBox10: TDBLookupComboBox
                    Left = 104
                    Top = 9
                    Width = 299
                    Height = 21
                    DropDownRows = 10
                    DropDownWidth = 760
                    KeyField = 'N_CONTA_PLC'
                    ListField = 'DESC_PLC;N_CONTA_PLC;DESC_GR;DESC_DEP'
                    ListSource = dtmContasAReceber.dsPCont
                    TabOrder = 0
                    OnExit = DBLookupComboBox10Exit
                    OnKeyDown = BitBtn40KeyDown
                  end
                  object edHistoricoDiferenca: TEdit
                    Left = 104
                    Top = 36
                    Width = 299
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 1
                    Text = 'EDHISTORICODIFERENCA'
                    OnKeyDown = BitBtn40KeyDown
                  end
                  object DBLookupComboBox11: TDBLookupComboBox
                    Left = 104
                    Top = 63
                    Width = 299
                    Height = 21
                    Hint = 'Nome do controle do lancamento'
                    KeyField = 'CODIGO_CTRL'
                    ListField = 'NOME_CTRL'
                    ListSource = dtmContasAReceber.dsCtrl
                    TabOrder = 2
                    OnKeyDown = BitBtn40KeyDown
                  end
                  object edVlContDif: TEditHw
                    Left = 104
                    Top = 90
                    Width = 121
                    Height = 21
                    TabOrder = 3
                    Text = '0,00'
                    OnExit = edVlContDifExit
                    Formato = fNumber
                    FormatSize = '0.2'
                  end
                end
              end
            end
            object tsObs: TTabSheet
              Caption = 'tsObs'
              ImageIndex = 6
              object pnObs: TPanel
                Left = 3
                Top = 6
                Width = 790
                Height = 387
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object GroupBox9: TGroupBox
                  Left = 16
                  Top = 5
                  Width = 753
                  Height = 273
                  Caption = 'Observa'#231#245'es do Cr'#233'dito'
                  TabOrder = 0
                  object DBMemo1: TDBMemo
                    Left = 16
                    Top = 192
                    Width = 640
                    Height = 73
                    DataField = 'OBSERVACAO'
                    DataSource = dtmContasAReceber.dsObsCred
                    TabOrder = 1
                  end
                  object BitBtn49: TBitBtn
                    Left = 662
                    Top = 192
                    Width = 75
                    Height = 25
                    Caption = 'Salvar'
                    TabOrder = 2
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
                  object BitBtn48: TBitBtn
                    Left = 662
                    Top = 216
                    Width = 75
                    Height = 25
                    Caption = 'Cancelar'
                    TabOrder = 3
                    OnClick = BitBtn48Click
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
                  end
                  object BitBtn45: TBitBtn
                    Left = 662
                    Top = 240
                    Width = 75
                    Height = 25
                    Caption = 'Novo'
                    TabOrder = 4
                    OnClick = BitBtn45Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000420B0000420B00000001000000010000B5847300AD73
                      8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                      D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                      FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                      1111111111111111111111111101020202020202020202020211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      13131313131313130211111112121210101010101010101002111111120D120C
                      0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                      120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                      0808080806000211111111111212120707070707050011111111}
                  end
                  object DBGrid9: TDBGrid
                    Left = 16
                    Top = 21
                    Width = 721
                    Height = 165
                    DataSource = dtmContasAReceber.dsObsCred
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'COD_OBS'
                        Visible = False
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EMPRESA'
                        Visible = False
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_OBS'
                        Width = 73
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HORA_OBS'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_VENDEDOR'
                        Width = 105
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OBSERVACAO'
                        Width = 440
                        Visible = True
                      end>
                  end
                end
                object BitBtn47: TBitBtn
                  Left = 678
                  Top = 348
                  Width = 75
                  Height = 25
                  Caption = 'Voltar'
                  TabOrder = 1
                  OnClick = BitBtn47Click
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
                object GroupBox10: TGroupBox
                  Left = 16
                  Top = 284
                  Width = 753
                  Height = 58
                  Caption = 'Observa'#231#227'o para o Caixa Auxiliar'
                  TabOrder = 2
                  object DBEdit58: TDBEdit
                    Left = 16
                    Top = 24
                    Width = 57
                    Height = 21
                    Enabled = False
                    TabOrder = 0
                  end
                  object BitBtn46: TBitBtn
                    Left = 662
                    Top = 20
                    Width = 75
                    Height = 25
                    Caption = 'Salvar'
                    TabOrder = 1
                    OnClick = BitBtn46Click
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
                  object Edit6: TEdit
                    Left = 16
                    Top = 24
                    Width = 513
                    Height = 21
                    TabOrder = 2
                  end
                  object CheckBox9: TCheckBox
                    Left = 535
                    Top = 26
                    Width = 121
                    Height = 17
                    Caption = 'Alterar selecionados'
                    Checked = True
                    State = cbChecked
                    TabOrder = 3
                  end
                end
              end
            end
          end
        end
        object tsCartao: TTabSheet
          Caption = 'tsCartao'
          ImageIndex = 7
          object PageControl4: TPageControl
            Left = 0
            Top = 0
            Width = 876
            Height = 520
            ActivePage = tsNSU
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tsNSU: TTabSheet
              Caption = 'tsNSU'
              object pnNSU: TPanel
                Left = 3
                Top = 3
                Width = 542
                Height = 286
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                OnEnter = pnNSUEnter
                object pnimpnimpn: TPanel
                  Left = 6
                  Top = 6
                  Width = 530
                  Height = 233
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object GroupBox11: TGroupBox
                    Left = 6
                    Top = 156
                    Width = 514
                    Height = 67
                    Align = alBottom
                    Caption = 'Controle Interno'
                    TabOrder = 1
                    object Panel63: TPanel
                      Left = 2
                      Top = 15
                      Width = 449
                      Height = 50
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      OnExit = Panel63Exit
                      object Label115: TLabel
                        Left = 27
                        Top = 2
                        Width = 62
                        Height = 13
                        Caption = 'NSU RO Adm'
                        FocusControl = DBEdit62
                      end
                      object Label116: TLabel
                        Left = 243
                        Top = 2
                        Width = 63
                        Height = 13
                        Caption = 'Num RO Adm'
                        FocusControl = DBEdit63
                      end
                      object DBEdit62: TDBEdit
                        Left = 27
                        Top = 21
                        Width = 200
                        Height = 21
                        DataField = 'NSU_RO_ADM'
                        DataSource = dtmContasAReceber.dsCtrlCr
                        TabOrder = 0
                      end
                      object DBEdit63: TDBEdit
                        Left = 243
                        Top = 21
                        Width = 200
                        Height = 21
                        DataField = 'RO_ADM'
                        DataSource = dtmContasAReceber.dsCtrlCr
                        TabOrder = 1
                      end
                    end
                    object Panel61: TPanel
                      Left = 451
                      Top = 15
                      Width = 61
                      Height = 50
                      Align = alRight
                      BevelOuter = bvNone
                      TabOrder = 1
                      object SpeedButton36: TSpeedButton
                        Left = 6
                        Top = 20
                        Width = 33
                        Height = 22
                        Hint = 'Modificar NSU RO ADM e Numero do RO Adm - [CAR080]'
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000420B0000420B00000001000000010000000000000084
                          0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                          52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                          9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                          A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                          B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                          BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                          C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                          DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                          FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                          0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                          2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                          31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                          363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                          2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                          443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                          4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                          3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = SpeedButton36Click
                      end
                    end
                  end
                  object GroupBox19: TGroupBox
                    Left = 6
                    Top = 6
                    Width = 514
                    Height = 150
                    Align = alClient
                    Caption = 'Dados Cart'#227'o'
                    TabOrder = 0
                    object Label105: TLabel
                      Left = 29
                      Top = 14
                      Width = 117
                      Height = 13
                      Caption = 'Num Autoriza'#231#227'o Cart'#227'o'
                      FocusControl = DBEdit59
                    end
                    object Label113: TLabel
                      Left = 221
                      Top = 14
                      Width = 83
                      Height = 13
                      Caption = 'Num Doc/NSU/CV'
                      FocusControl = DBEdit60
                    end
                    object Label114: TLabel
                      Left = 29
                      Top = 60
                      Width = 64
                      Height = 13
                      Caption = 'Terminal Adm'
                    end
                    object Label117: TLabel
                      Left = 334
                      Top = 14
                      Width = 59
                      Height = 13
                      Caption = 'Num Parcela'
                      FocusControl = DBEdit61
                    end
                    object lbBandeiraCart: TLabel
                      Left = 29
                      Top = 106
                      Width = 42
                      Height = 13
                      Caption = 'Bandeira'
                    end
                    object Label138: TLabel
                      Left = 414
                      Top = 14
                      Width = 62
                      Height = 13
                      Caption = 'Qtde Parcela'
                      FocusControl = DBEdit61
                    end
                    object DBEdit59: TDBEdit
                      Left = 29
                      Top = 33
                      Width = 186
                      Height = 21
                      DataField = 'N_AUT_CART'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 0
                    end
                    object DBEdit60: TDBEdit
                      Left = 221
                      Top = 33
                      Width = 107
                      Height = 21
                      DataField = 'N_DOCNSU_ADM'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 1
                    end
                    object DBLookupComboBox12: TDBLookupComboBox
                      Left = 29
                      Top = 79
                      Width = 459
                      Height = 21
                      DataField = 'COD_TERMINAL_ADM'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      KeyField = 'COD_TERM_ADM'
                      ListField = 'DESC_TERM_ADM;DESCRICAO_ADM'
                      ListSource = dtmContasAReceber.dsTermCart
                      TabOrder = 4
                    end
                    object DBEdit61: TDBEdit
                      Left = 334
                      Top = 33
                      Width = 74
                      Height = 21
                      DataField = 'NPARCELA'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 2
                    end
                    object DBLookupComboBox15: TDBLookupComboBox
                      Left = 29
                      Top = 125
                      Width = 459
                      Height = 21
                      DataField = 'COD_BANDEIRA_ADM'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      KeyField = 'COD_BANDEIRA'
                      ListField = 'DESCRICAO;COD_BANDEIRA'
                      ListSource = dtmContasAReceber.dsBandeiraCartao
                      TabOrder = 5
                    end
                    object DBEdit69: TDBEdit
                      Left = 414
                      Top = 33
                      Width = 74
                      Height = 21
                      DataField = 'QTDE_PARC'
                      DataSource = dtmContasAReceber.dsCtrlCr
                      TabOrder = 3
                    end
                  end
                end
                object Panel62: TPanel
                  Left = 6
                  Top = 239
                  Width = 530
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn50: TBitBtn
                    Left = 266
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Cancelar'
                    Caption = 'Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn50Click
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
                  end
                  object BitBtn51: TBitBtn
                    Left = 185
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Salvar'
                    Caption = 'Salvar'
                    TabOrder = 0
                    OnClick = BitBtn51Click
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
                  object btVisualizarComprovante: TBitBtn
                    Left = 380
                    Top = 6
                    Width = 140
                    Height = 25
                    Hint = 'Visualizar Comprovante - [POSV007]'
                    Caption = 'Visualizar Comprovante'
                    TabOrder = 2
                    OnClick = btVisualizarComprovanteClick
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000320B0000320B00000001000000010000181818003939
                      390042393900424242004A4A4A00524A4A00EFA54A00525252005A5A5A00AD6B
                      5A006B6B6B00C6846B00B58473009C8C7300CE947300EFB57300FFC67300BD84
                      7B00A5947B00C6947B0084848400B5848400B58C8400CE9C8400AD9C8C00C6B5
                      9400EFCE940094949C009C9C9C00A5A59C00C6A59C00E7C69C00EFCE9C00A5A5
                      A500C6ADA500C6BDA500D6BDA500EFD6A500F7D6A500ADADAD00CEB5AD00D6B5
                      AD00EFC6AD00F7D6AD00FFD6AD00D6BDB500DEBDB500DEC6B500E7C6B500EFCE
                      B500F7D6B500FFD6B500F7DEB500BDBDBD00EFCEBD00F7DEBD00C6C6C600F7DE
                      C600F7E7C600E7CECE00F7E7CE00DEDED600FFDED600F7E7D600FFE7D600FFEF
                      D600FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00F7FFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00474715151515
                      1515151515151515210347471E413A37342B26201A1A1A27083847471E413C39
                      37322620201A350A3814474722420909091C1C1C1C090A000A05474722433F3C
                      350405040721010A354747472846091B0209090909020A3D1547474729491D02
                      0C090909090C0238154747472D1D0A19402A2B2B1F3C0D02154747472D1D0A24
                      0909090909091802154747472E1D0A230C0C090909091202154747472F491D0A
                      2C4048463E330221154747473049491D0A2B0909250235161547474730490909
                      1D0A0A0A0A1D0F060B47474736494949491D1D1D1D13100E4747474730454444
                      444444443B1317474747474730313131313030312D1147474747}
                  end
                end
              end
            end
            object tsPendencias: TTabSheet
              Caption = 'tsPendencias'
              ImageIndex = 1
              object pnPendenciasCartao: TPanel
                Left = 3
                Top = 3
                Width = 822
                Height = 493
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                OnEnter = pnPendenciasCartaoEnter
                OnExit = pnPendenciasCartaoExit
                object Panel64: TPanel
                  Left = 6
                  Top = 6
                  Width = 810
                  Height = 440
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object GroupBox12: TGroupBox
                    Left = 6
                    Top = 320
                    Width = 794
                    Height = 110
                    Align = alBottom
                    Caption = 'Filtros'
                    TabOrder = 0
                    object Label118: TLabel
                      Left = 16
                      Top = 16
                      Width = 77
                      Height = 13
                      Caption = 'Num Aut Cartao'
                    end
                    object Label119: TLabel
                      Left = 143
                      Top = 16
                      Width = 83
                      Height = 13
                      Caption = 'Num Doc/NSU/CV'
                    end
                    object Label120: TLabel
                      Left = 270
                      Top = 16
                      Width = 62
                      Height = 13
                      Caption = 'Valor Parcela'
                    end
                    object Label121: TLabel
                      Left = 397
                      Top = 16
                      Width = 87
                      Height = 13
                      Caption = 'Cod Terminal ADM'
                    end
                    object Label122: TLabel
                      Left = 524
                      Top = 16
                      Width = 63
                      Height = 13
                      Caption = 'Num RO Adm'
                    end
                    object Label123: TLabel
                      Left = 651
                      Top = 16
                      Width = 62
                      Height = 13
                      Caption = 'NSU RO Adm'
                    end
                    object Label124: TLabel
                      Left = 16
                      Top = 62
                      Width = 113
                      Height = 13
                      Caption = 'Previsao de Pagamento'
                    end
                    object Label125: TLabel
                      Left = 143
                      Top = 62
                      Width = 114
                      Height = 13
                      Caption = 'Data de Processamento'
                    end
                    object Label126: TLabel
                      Left = 270
                      Top = 62
                      Width = 56
                      Height = 13
                      Caption = 'Status ADM'
                    end
                    object SpeedButton38: TSpeedButton
                      Left = 114
                      Top = 81
                      Width = 23
                      Height = 22
                      Hint = 'Modificar a data de cadastro da conta - [CAR041]'
                      Flat = True
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
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton38Click
                    end
                    object SpeedButton39: TSpeedButton
                      Left = 241
                      Top = 81
                      Width = 23
                      Height = 22
                      Hint = 'Modificar a data de cadastro da conta - [CAR041]'
                      Flat = True
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
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton39Click
                    end
                    object SpeedButton43: TSpeedButton
                      Left = 524
                      Top = 64
                      Width = 121
                      Height = 35
                      Caption = 'Excluir'
                      Glyph.Data = {
                        76060000424D7606000000000000360400002800000018000000180000000100
                        08000000000040020000220B0000220B000000010000000100000031DE00FF00
                        FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101010101
                        0101010101010101010101010101010101010101010101010101010101010101
                        0101010101010100000101010101010101010101010101010101010101010000
                        0001010100000001010101010101010101010101010000000101010100000000
                        0101010101010101010101000000000101010101000000000001010101010101
                        0101000000000101010101010100000000000101010101010100000000010101
                        0101010101010200000000010101010100000000010101010101010101010101
                        0000000001010000000000010101010101010101010101010100000000000000
                        0000010101010101010101010101010101010000020002000001010101010101
                        0101010101010101010101000000020001010101010101010101010101010101
                        0101000002000002020101010101010101010101010101010100000200020202
                        0002010101010101010101010101010102020200020101020202020101010101
                        0101010101010102020002020101010102020202010101010101010101010202
                        0202020101010101010102020201010101010101010202020202010101010101
                        0101010202020101010101010202020202010101010101010101010101020101
                        0101010202020202010101010101010101010101010101010101010202020201
                        0101010101010101010101010101010101010102020201010101010101010101
                        0101010101010101010101010101010101010101010101010101010101010101
                        0101010101010101010101010101010101010101010101010101}
                      OnClick = SpeedButton43Click
                    end
                    object Edit7: TEdit
                      Tag = 1
                      Left = 16
                      Top = 35
                      Width = 121
                      Height = 21
                      TabOrder = 0
                      OnExit = Edit7Exit
                    end
                    object Edit8: TEdit
                      Tag = 1
                      Left = 143
                      Top = 35
                      Width = 121
                      Height = 21
                      TabOrder = 1
                      OnExit = Edit7Exit
                    end
                    object Edit10: TEdit
                      Tag = 1
                      Left = 397
                      Top = 35
                      Width = 121
                      Height = 21
                      TabOrder = 3
                      OnExit = Edit7Exit
                    end
                    object Edit12: TEdit
                      Tag = 1
                      Left = 651
                      Top = 35
                      Width = 121
                      Height = 21
                      TabOrder = 5
                      OnExit = Edit7Exit
                    end
                    object MaskEdit5: TMaskEdit
                      Left = 16
                      Top = 81
                      Width = 92
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 6
                      Text = '  /  /    '
                      OnExit = Edit7Exit
                    end
                    object MaskEdit6: TMaskEdit
                      Left = 143
                      Top = 81
                      Width = 92
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 7
                      Text = '  /  /    '
                      OnExit = Edit7Exit
                    end
                    object Edit13: TEdit
                      Tag = 1
                      Left = 270
                      Top = 81
                      Width = 121
                      Height = 21
                      TabOrder = 8
                      OnExit = Edit7Exit
                    end
                    object EditHw1: TEditHw
                      Left = 270
                      Top = 35
                      Width = 121
                      Height = 21
                      TabOrder = 2
                      Text = '0,00'
                      OnExit = Edit7Exit
                      Formato = fNumber
                      FormatSize = '02'
                    end
                    object EditHw2: TEditHw
                      Left = 524
                      Top = 35
                      Width = 121
                      Height = 21
                      TabOrder = 4
                      Text = '0'
                      OnExit = Edit7Exit
                      Formato = fInteger
                      FormatSize = '0.0'
                    end
                  end
                  object DBGrid10: TDBGrid
                    Left = 6
                    Top = 6
                    Width = 794
                    Height = 314
                    Align = alClient
                    DataSource = dtmContasAReceber.dsPendencias_adm
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'SEQID'
                        Width = 41
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_AUT_CART_CRED'
                        Width = 85
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUM_DOC_ADM'
                        Title.Caption = 'Num Doc/NSU/CV'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALORPARCELA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NPARCELA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_PREV_PAG'
                        Width = 80
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DTPROCESSAMENTO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DESC_STATUS_ADM'
                        Width = 71
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'RO_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NSU_RO_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_TERMINAL_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_TIPOEXTRATO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_ADM'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPOEXTRATO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_PROC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TAXA_CARTAO_CRED'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PERCTXCARTAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TARIFA_CARTAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_PROD_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DESC_TIPO_PROD_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_BANDEIRA_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DESC_BANDEIRA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'IND_ANTEC_RO_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'IND_OR_AJUSTE_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'IND_OR_DESC_AJUSTE'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ARQ_EXTRATO_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CRED'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_CTRL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_CTRL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'AGENCIA_CTRL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_CONTA_CTRL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_TRANSACAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_TIPOTRANS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'IDBAIXA_CARTAO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUM_DOC_CRED'
                        Width = 64
                        Visible = True
                      end>
                  end
                end
                object Panel65: TPanel
                  Left = 6
                  Top = 446
                  Width = 810
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn52: TBitBtn
                    Left = 406
                    Top = 6
                    Width = 88
                    Height = 25
                    Caption = 'Cancelar'
                    TabOrder = 0
                    OnClick = BitBtn52Click
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
                  end
                  object BitBtn53: TBitBtn
                    Left = 312
                    Top = 6
                    Width = 88
                    Height = 25
                    Caption = 'Selecionar'
                    TabOrder = 1
                    OnClick = BitBtn53Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                      B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                      DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                      4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                      E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                      6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                      4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                  end
                end
              end
            end
          end
        end
        object tsFaturaRec: TTabSheet
          Caption = 'tsFaturaRec'
          ImageIndex = 8
          object pnFaturaRec: TPanel
            Left = 3
            Top = 0
            Width = 596
            Height = 286
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel70: TPanel
              Left = 0
              Top = 247
              Width = 592
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn66: TBitBtn
                Left = 216
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Confirar'
                Caption = 'Confirmar'
                TabOrder = 0
                OnClick = BitBtn66Click
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
              object BitBtn67: TBitBtn
                Left = 297
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn67Click
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
            object GroupBox40: TGroupBox
              Left = 0
              Top = 81
              Width = 592
              Height = 168
              Align = alTop
              Caption = 'Parcelas'
              TabOrder = 1
              object Panel71: TPanel
                Left = 454
                Top = 48
                Width = 133
                Height = 117
                BevelOuter = bvNone
                TabOrder = 2
                Visible = False
                object edDocFaturaEntrada: TEdit
                  Left = 0
                  Top = 4
                  Width = 119
                  Height = 21
                  TabOrder = 0
                  Text = 'edDocFaturaEntrada'
                end
                object edValorFaturaEntrada: TEditHw
                  Left = 0
                  Top = 31
                  Width = 119
                  Height = 21
                  TabOrder = 1
                  Text = '0,00'
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object edVencimentoFaturaEntrada: TMaskEdit
                  Left = 0
                  Top = 58
                  Width = 65
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 2
                  Text = '  /  /    '
                  OnExit = edVencimentoFaturaEntradaExit
                end
                object btSalvarFaturaEntrada: TBitBtn
                  Left = 0
                  Top = 87
                  Width = 120
                  Height = 25
                  Caption = 'Salvar Parcela'
                  TabOrder = 3
                  OnClick = btSalvarFaturaEntradaClick
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
              object ListBox3: TListBox
                Left = 2
                Top = 15
                Width = 446
                Height = 151
                Align = alLeft
                ItemHeight = 13
                TabOrder = 1
              end
              object btAlterarFaturaEntrada: TBitBtn
                Left = 454
                Top = 12
                Width = 121
                Height = 30
                Hint = 'Alterar Parcela - [NF0063]'
                Caption = 'Alterar Parcela'
                TabOrder = 0
                OnClick = btAlterarFaturaEntradaClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B0000000100000001000000000000CE63
                  00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
                  A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
                  C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
                  1818181818181818181818010101010101010101010101010101180119191716
                  1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
                  17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
                  1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
                  191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
                  19191919091505020C0118011919191919191919190700140001180101010101
                  0101010101041414030118180101010101010101010108080618181818181818
                  1818181818181818181818181818181818181818181818181818}
              end
            end
            object GroupBox26: TGroupBox
              Left = 0
              Top = 0
              Width = 592
              Height = 81
              Align = alTop
              TabOrder = 0
              object Label135: TLabel
                Left = 499
                Top = 20
                Width = 44
                Height = 13
                Caption = 'Parcelas:'
              end
              object Label136: TLabel
                Left = 65
                Top = 19
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'N'#186' Doc:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label137: TLabel
                Left = 332
                Top = 19
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Valor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Edit14: TEdit
                Left = 117
                Top = 16
                Width = 121
                Height = 21
                Enabled = False
                TabOrder = 0
                Text = 'Edit14'
              end
              object EditHw3: TEditHw
                Left = 370
                Top = 16
                Width = 120
                Height = 21
                Enabled = False
                TabOrder = 1
                Text = '0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object edcreditoQtdeParcelas: TSpinEdit
                Left = 549
                Top = 14
                Width = 41
                Height = 22
                MaxValue = 99
                MinValue = 1
                TabOrder = 2
                Value = 1
              end
              object Panel72: TPanel
                Left = 2
                Top = 49
                Width = 588
                Height = 30
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 3
                object btGerar: TBitBtn
                  Left = 197
                  Top = 1
                  Width = 92
                  Height = 25
                  Hint = 'Gerar'
                  Caption = '(F6) Gerar'
                  TabOrder = 0
                  OnClick = btGerarClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000430B0000430B000000010000000100008C5A5A009C6B
                    6B00A57B73000000840084848400B58C8C0039529C00395AAD004A6BBD005A73
                    C600C6C6C6006384CE00F7E7CE00F7EFDE00FFF7E700FFFFEF00FF00FF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101010070606
                    0606060606060607101010100805000000000000000000000710101008050D0D
                    0D0D0D0D0D0D0D000610101008050D040404040404040D000610101008050D0C
                    0C0C0C0C0C0C0D000610101008050D040404040404040D000610101008050D0D
                    0D0D0D0D0D0D0D010610101008050E0E030D0A03030A0E010610101009050F0F
                    030F030F0F030F010610101009050F0F030F0F0F0F030F020610101009050F0F
                    030F0303030A0F02061010100B0511030311031111111105061010100B051111
                    0311030303031105061010100B0511111111111111111105061010100B050505
                    050505050505050507101010100B090808080808080808081010}
                end
                object btApagarDesp: TBitBtn
                  Left = 295
                  Top = 1
                  Width = 92
                  Height = 25
                  Hint = 'Apagar'
                  Caption = '(F7) Apagar'
                  TabOrder = 1
                  OnClick = btApagarDespClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000430B0000430B00000001000000000000000000000000
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
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFD5D5D5D
                    5D5D5D5D5D5D5D5DFDFDFDFD5EE49B9B9B9B9B9B9B9B9B9B5DFDFDFD5EE4B767
                    67AFF6F6B76767665DFDFDFD5EE467676767A466676767675DFDFDFD5EE40867
                    676767676767679D5DFDFDFD5EE4F666676767676767EF9B5DFDFDFD5EE4F6F6
                    EF67676767EFF69B5DFDFDFD5EE4FFFF1667676767AFFF9B5DFDFDFD66E4FFB7
                    676767676767FF9B5DFDFDFD66E4B767676767676767B7E45DFDFDFD66A66767
                    67671667676767E45DFDFDFDA667676767B701F6676767675DFDFDFDA6A56767
                    16FF01010D1FB7A65DFDFDFDA6E4FFFFFFFFFFFFFFFFFFE45DFDFDFDA6E4E4E4
                    E4E4E4E4E4E4E4E45DFDFDFDFDA6665E5E5E5E5E5E5E5E5EFDFD}
                end
              end
            end
          end
        end
        object tsDocumentosOrigem: TTabSheet
          Caption = 'tsDocumentosOrigem'
          ImageIndex = 10
          object pnDocumentosOrigem: TPanel
            Left = 16
            Top = 16
            Width = 777
            Height = 361
            TabOrder = 0
            object pnDocumentosOrigemBottom: TPanel
              Left = 1
              Top = 328
              Width = 775
              Height = 32
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object btDocumentosOrigemDoc: TSpeedButton
                Left = 329
                Top = 0
                Width = 113
                Height = 28
                Caption = 'Visualizar'
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                  73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                  8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                  9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                  A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                  AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                  BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                  D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                  E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                  F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                  424242424242424242422B39180B42424242424242424242424243443C180B42
                  4242424242424242424242444438180B42424242424242424242424244433918
                  0A424242424242424242424242444335004201101A114242424242424242453D
                  05072F343434291942424242424242221A2D34343437403E0442424242424206
                  231C303437404146284242424242421B210F30373A414140310D42424242421F
                  20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                  2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                  4227312D21252314424242424242424242420E141B1B42424242}
                OnClick = btDocumentosOrigemDocClick
              end
              object btDocumentosOrigemVoltar: TBitBtn
                Left = 658
                Top = 0
                Width = 113
                Height = 28
                Caption = 'Voltar'
                TabOrder = 0
                OnClick = btDocumentosOrigemVoltarClick
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
            object DBGridDocumentosOrigem: TDBGrid
              Left = 1
              Top = 1
              Width = 775
              Height = 327
              Align = alClient
              DataSource = dtmContasAReceber.dsDocumentosOrigem
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NPED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_PED'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_FECH'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_TOTAL'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOT_PROD'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOT_SERV'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOT_PROD_TERC'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOT_SERV_TERC'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CLIENTE'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RAZAO'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CPFCGC'
                  Width = 64
                  Visible = True
                end>
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 844
      Width = 0
      Height = 553
      ExplicitLeft = 844
      ExplicitWidth = 0
      ExplicitHeight = 553
      inherited bMarketingHW: TBitBtn
        Top = 531
        Width = 0
        ExplicitTop = 531
        ExplicitWidth = 0
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 555
    Width = 891
    ExplicitTop = 555
    ExplicitWidth = 891
  end
  inherited pnStatusProcessamento: TPanel
    Left = 727
    ExplicitLeft = 727
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 132
    Top = 529
    object DesmarcardocumentocomoRecebendo1: TMenuItem
      Caption = 
        'Desmarcar documento como Recebendo - Linhas selecionadas - [CAR0' +
        '61/CAR113]'
      Hint = '[CAR061/CAR113]'
      OnClick = DesmarcardocumentocomoRecebendo1Click
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 222
    Top = 547
  end
  inherited Timer1: TTimer
    Left = 190
    Top = 539
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 166
    Top = 531
  end
  object dsDesp: TDataSource
    Left = 712
    Top = 16
  end
  object cdsDesp: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 16
    Data = {
      A20100009619E0BD010000001800000010000000000003000000A201084E756D
      436F6E746108000400000000000C446570617274616D656E746F010049000000
      01000557494454480200020020000556616C6F72080004000000010007535542
      545950450200490006004D6F6E6579000E446174615265666572656E63696104
      0006000000000009486973746F7269636F010049000000010005574944544802
      0002003C00064E756D446F630100490000000100055749445448020002001400
      0C4E6F6D65436F6E74726F6C6501004900000001000557494454480200020023
      000B5469706F4465737065736104000100000000000D436F64466F726E656365
      646F720400010000000000084461746156656E630400060000000000044E4368
      710100490000000100055749445448020002000A0009436F6E747242616E6301
      004900000001000557494454480200020001000A4E6F6D696E616C4368710100
      49000000010005574944544802000200230009436F6E74726F6C657304000100
      0000000007436F644372656404000100000000000750617263656C6104000100
      000000000000}
    object cdsDespNumConta: TFloatField
      FieldName = 'NumConta'
    end
    object cdsDespDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 32
    end
    object cdsDespValor: TCurrencyField
      FieldName = 'Valor'
      DisplayFormat = '##0.00'
    end
    object cdsDespDataReferencia: TDateField
      FieldName = 'DataReferencia'
    end
    object cdsDespHistorico: TStringField
      FieldName = 'Historico'
      Size = 60
    end
    object cdsDespNumDoc: TStringField
      FieldName = 'NumDoc'
    end
    object cdsDespNomeControle: TStringField
      FieldName = 'NomeControle'
      Size = 35
    end
    object cdsDespTipoDespesa: TIntegerField
      FieldName = 'TipoDespesa'
    end
    object cdsDespCodFornecedor: TIntegerField
      FieldName = 'CodFornecedor'
    end
    object cdsDespDataVenc: TDateField
      FieldName = 'DataVenc'
    end
    object cdsDespNChq: TStringField
      FieldName = 'NChq'
      Size = 10
    end
    object cdsDespContrBanc: TStringField
      FieldName = 'ContrBanc'
      Size = 1
    end
    object cdsDespNominalChq: TStringField
      FieldName = 'NominalChq'
      Size = 35
    end
    object cdsDespControles: TIntegerField
      FieldName = 'Controles'
    end
    object cdsDespCodCred: TIntegerField
      FieldName = 'CodCred'
    end
    object cdsDespParcela: TIntegerField
      FieldName = 'Parcela'
    end
  end
end
