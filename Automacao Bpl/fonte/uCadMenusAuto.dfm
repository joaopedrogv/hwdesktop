inherited frmMenusAuto: TfrmMenusAuto
  Caption = 'Configura'#231#227'o dos Menus do Sistema'
  Position = poMainFormCenter
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            object Label10: TLabel [5]
              Left = 450
              Top = 51
              Width = 274
              Height = 13
              Caption = 'Para Habilitar os Menus pressione bot'#227'o direito do mouse'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object btSelectAll: TSpeedButton [6]
              Left = 730
              Top = 46
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
            object btUnSelectAll: TSpeedButton [7]
              Left = 759
              Top = 46
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
            inherited MaskEdit3: TMaskEdit
              CharCase = ecNormal
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CFG001]'
            end
            inherited BitBtn3: TBitBtn
              Enabled = False
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              Hint = 'Cadastro dos Menus do Sistema'
              PopupMenu = PopupMenu3
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              OnMouseUp = DBGrid1MouseUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_MENU'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_MENU'
                  Width = 350
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DEPART_MENU'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'STATUS_MENU'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENABLE_MENU'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_MENU'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = False
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CFG002]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Top = 6
                Hint = 'Recuperar registro - [CFG004]'
                Visible = False
                OnClick = SpeedButton5Click
                ExplicitTop = 6
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Verificar e criar menus para os Depto Cadastrados - [CFG005]'
                Glyph.Data = {
                  5E060000424D5E060000000000001E0400002800000018000000180000000100
                  08000000000040020000120B0000120B0000FA000000FA00000000000000FFFF
                  FF00675F6900FF00FF007F6F7B00837077007A676C0086737800D1C7C700E1D7
                  D700F4F2F200AFADAD00EAE0DE00BB9A9200CBC7C6009F8A8400A58379005E2D
                  1C0078584D00A7877B00A6979200726F6E00FFFCFB007E321300883615008C38
                  16008B3816008B371600863515006B2B1100A5827400A07E7000AD8C7F005623
                  0D00874F3500A3827300A7816E00AD887600A7837200AF8C7B00A6867600AD8C
                  7B00A7887800AF8E7E006D5D5500AA867300A6847200A7887700A48675008F64
                  4A008F766700B7988600BD4C0000752F0000BB530B0078391000B65C2200A46F
                  4A00AB7F6000A7826800A0837000D9CBC200CCC9C700CB5C0700C75B0A00B15A
                  1C00C5692700AD83640097786000BC9C8400BBA18E00D1B5A000E3D0C200DDD0
                  C600D978280081685400B89C8600BA9F8A00C1A79100DD6C0A00F3A96600EAA6
                  6900BC916C007D6753007F6A5700FE800000F27A0000ED780000EB770000D46B
                  0000BF600000E9872800FBAF6600EAAB6E00F7BF8800FAC79300F3C29000D9AD
                  8000AF8C6800A98866008C725800FED5AB00C4A68800FFD9B200FED8B100C2A6
                  8A00FFDDBA00F2EEEA00ADABA900FA7F0000CC680000F3800600AC5E0A009C64
                  2700EFB77800EEB47700EEB77B00F8C79200EEBF8C00E9BB8900E0B48400DDB1
                  8200FECB9600FCCA9500F4C49000F0C18E00DEB28300CEA67A00C7A07600FCCB
                  9700D7AD8100B18F6B00D5AD8300F0C49500FCCF9D00A48666009A7E6000CEAA
                  8300F4CA9D00A3876900D8B58E00A98E7000D9B69100C2A58600AA917600816F
                  5C009C877000F7D8B5007E6F5F00FFE2C400FFEFDD00EEBB7E00F0C28900F8CA
                  9300FBD19D00D9B48A00FEDCB200FEDCB500C2AB9000FEE2C200FCE1C100FEE7
                  CC00FEEBD400D7A45F00FEDCAF00D1B79600FFFBF600DCAA6000F2C78A00F3C9
                  8B00F4C98E00F8D49F00FED9A400FEDAA600FEDCA900FEDCAB00FEDCAC00E3AF
                  5D00F7D19500F3CE9500E2C59500FAE9CE00E0C69A00DEC69A00FFFBF400E5CC
                  9C00FAE1B100E2CCA300F4D79A00F7DCA000F6DDA500F8E0AB00F4DCA300CCC9
                  C200F8E3AD00E1D3AC00FFE9A900FAE9B400FBEBB700FFFEFB00DED3AF00E5DA
                  B500E5DAB6004B494200F0EBC000FFFCE000FEFBC900F7F4CA00F7F4CC00FFFF
                  C700FFFFCF00FFFFD100FFFFE100FFFFE700FFFFF000FFFFF700FFFFFC00F2F2
                  F10033A4330033A333003E454900B8C6CE0038A6FF0041A7FB0062B0ED00A7CE
                  EE00B8D7F000BBD8F00035A1FF003AA4FF003AA3FF0043739D00B4D4F200BAD7
                  F0001660AC00165DA400175DA100919395002D7FDA00276AB400187BF200187A
                  F000197BF400537BFF003553C700FEFEFE00FAFAFA00F6F6F600AFAFAF00ADAD
                  AD000315DC02030303030303030303030303030303030303030303EDEFEA0403
                  03030303030303030303030303030303030319E7DEF2EB0611211D171C181818
                  18181B1A19191919191919E3DFE5F0EB0532358F8C9B84827977605F7B7A7A7A
                  7A1919B8E9DFE6F1EC073792908D8B878380787D5F7B7A7A7A191916B8E2DFE6
                  F0EB12949154534B6463807E76757B7A7A191901C7A6E8DFE4EECB2C312E2F2F
                  2D39705A59576D5555191901010B6CE1E0DD0F239ECAD0CFC94E1E4462617C7B
                  7B1919010101166BC11427B6ACAEAEAEB09F3D1F887F7D7B7B19190101DADBD9
                  0E1066B2C5D2D2D4D6D8014D716E56555519190101DADBD93E29B474C2D2D3D5
                  D8D7D4C83C898581811919010101F5F7082ABC5D99ADAEA49D9CB0CC308E8A86
                  8619190101F8F9F6092ABD515E9AAEAFAFAFAEAB3B586D5555191901010101F5
                  0A2BB9AA97A8C2CED2D2D2C3339368656519190101F3F301F50D69CDB59897B3
                  BFC6D14C47A06A676719190101F3F301010C244901BA7273A9C4A53A6F555555
                  55191901010101010101411346BBBEC0B745204896A2A195951919B1B1B1B1B1
                  B1B134A3432628282552A7B1B1B1B1B1B11919363F3F3F3F3F3F3F3F3F3F3F3F
                  3F5C5B4F5C5B22F43619193842424242424242424242424242504A405C4A22F4
                  3819031919191919191919191919191919191919191919191903030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Top = 6
                Hint = 'Configurar menus por M'#243'dulos do Sistema -[CFG011]'
                Glyph.Data = {
                  02060000424D0206000000000000C20300002800000018000000180000000100
                  08000000000040020000120B0000120B0000E3000000E300000000000000FFFF
                  FF00FF00FF00FFFEFF00A4676900A5686B00FFFEFE009365600093655E009263
                  5D009566600093655F00986963009E6E64008469640080676200A37266009D70
                  6500896A63009F6F6200A0706300A7756800986859009F6F6000AC796900A072
                  6400B17E6B00BB846E00B6816C00CB917300C58C7000C0896F00CF8E6800D498
                  7500CF967400FFFCFA00FFF8F300FFFBF800FFF4EB00FFFAF600FFEFE000FFF0
                  E200FFF0E300FFF2E600FFF4EA00FFF6EE00FFF8F200FECC9900FFCE9C00FECE
                  9D00FECF9F00FED1A300FFD5AA00FED4A900FED5AB00FED7AF00FFDAB500FEDA
                  B500FFDDBA00FFDEBC00FEDDBB00FFE3C700FFE5CB00FFE7CF00FEE6CE00FFEB
                  D800FFEEDE00FFF0E100FEEFE000FFF2E500FFF3E700FFF4E900FFF6ED00FFF7
                  EF00FFFBF700D5812700FECB9600FECC9700FECC9800FECE9900FECE9A00FECE
                  9C00FECF9D00FFD09F00FECF9E00FED09E00FED0A000FED3A300FFD4A500FED3
                  A400FED4A500FED4A600FED4A700FED5A700FED5A900FED5AA00FED7AB00FFD8
                  AD00FED7AD00FED8AD00FED8AF00FED8B000FFDAB200FED9B100FED9B200FEDA
                  B200FEDAB400FFDCB700FEDCB600FFDDB800FEDCB700FEDDB800FFDEBB00FEDD
                  BA00FFE0BD00FEDEBC00FEE0BF00FFE1C100FEE0C000FFE1C200FFE2C200FEE1
                  C100FFE3C500FEE2C400FFE3C600FEE3C500FEE3C600FEE3C700FFE5C900FFE5
                  CA00FEE5C900FFE6CB00FEE5CA00FFE6CC00FEE6CB00FEE6CC00FFE7CE00FFE9
                  D100FFEAD300FFEAD400FFEBD500FEEAD400FEEBD700FFEDD900FFEDDA00FFEE
                  DC00FFEFDD00FEEEDC00FFEFDE00FEEEDD00FFF0E000FEF0E100FFF3E600FEF2
                  E500FEF3E700FEF4E900FFF7EE00F8CE9C00FED9AF00FEE0BC00FEE0BD00FEE1
                  BF00FEE1C000FEE2C200FEE3C400FFE5C700FFE7CB00FEE6CA00FEE7CC00FEE9
                  CF00FEE9D000FEE9D100FEEAD300FEEBD400FEEBD500FFEDD700FFEDD800FEED
                  D900FFF0DE00FEEFDD00FFF2E200FFF3E500FFF4E700FEF3E600FFF6EB00FFF8
                  F000F6D3A700F8D9B100FEEAD100FFF2E100FEF2E300FFF6EA00FFF7ED00FFF8
                  EF00FEF7EE00FEF8F000FFFBF600EECE9E00F6E0C000F8E6CB00FEF6EB00FFFA
                  F300FEFAF400EED9B500FFFBF400FEFAF300FFFCF700FFFEFC00F7EEDA00EFE6
                  CF00FFFEFB00FFFEFA00FEFEFB00FFFFFE00AFB17400AFBA8400AFC49700648E
                  43005484370064934C0054893E0064995600548F470032772500327A2900327D
                  2E00008100000202020904040404040404040404040404040404040402020202
                  02086B386764605D5A57563231504E4C4C4C4C1702020202020B736F38686460
                  5F5B59565452514F4D4C4C1702020202020B75A0716C6965635F5C5933E25230
                  4F4E4D1702020202020B7A7972706E6A67613635E2E2E255522F4E1702020202
                  0207817E4B4B4B4B4B4B64E2DFD9E2DA5451501702020202020A883EA57B769F
                  3A6C66E2BA34D6E2E29D521702020202020C8AA98582A479A0706C6A676236C5
                  E2E2531702020202020D41ADAA40847E77743B6E396737603558331702020202
                  021093B08DAB88867C7BA2736DE2689E605E5B170202020202159695B18C893F
                  863DA479E2E2E26665635F1302020202021845B44B4B4B4B4B4B80E2E0DBE2DC
                  3967621402020202021A472B294491418BABA8E2C6A3D7E2E2BB671902020202
                  021CC02C46B444918F8CBC3FA73D78CBE2E26C1102020202021BC1C2C8469943
                  428F8EACA987A57D79A03C1202020202021FC92E9CBFB6B7BD9490AF8BE2A882
                  7C77A10F02020202021ECECA2E494847982AB293E2E2E288837F780E02020202
                  021D23254B4B4B4B4B4BBEE2E1DDE2DE3F83A516020202020222CFD22527CDB9
                  2D269AE2D094D8E2E2C7A60502020202022103CFD325C4C92EC1B847B5B428D1
                  E2E2AA0E020202020221010106D2234ACC2E49B89B98BE9692B1AE0E02020202
                  0221010101D5D2D425CC24C39C2CB69997B3900E020202020220202020202020
                  20202020202020202020200E0202020202020202020202020202020202020202
                  020202020202}
                OnClick = SpeedButton7Click
                ExplicitTop = 6
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Aplicar altera'#231#245'es nos menus - [CFG010]'
                Glyph.Data = {
                  BE030000424DBE030000000000007E0100002800000018000000180000000100
                  08000000000040020000120B0000120B0000520000005200000000000000FFFF
                  FF00FF00FF00004B0000058C0D00068F0E000791110007901100089111000992
                  1300099113000A9514000A9515000B9617000C9818000D991B000E9C1C000F9C
                  1D000D9A1C000F9E1F0012A0230013A3250014A5280016A5290017A72B0017A7
                  2C0019AB2F0019AA30001AAC31001CAD34001DAF360021B53D0022B63E0022B5
                  3E0022B63F0023B7410025BA440026BA440027BC450029C04B002CC14E002CC1
                  4F002EC552002DC4530030C9580032CA590031C7570031C7580033CA5B0035CE
                  5F0036CE5F0038D0640038D0650039D166003AD368003AD167003CD46A003ED7
                  6D003DD56C003ED56C009EDDFF009FDEFF0046B7FF0048BAFF0042B2FF0045B6
                  FF003191D9003291D9003FACFF0040ADFF002C8AD90036A3FF0038A4FF0039A6
                  FF003BA9FF00339EFF00257FD9002E97FF003099FF00288EFF002C93FF000C48
                  9800020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020303030303030303030303030303
                  03030303020202020202033834312D2A2725211E1A1714110E0B060302020202
                  0202030303030303030303030303030303030303020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202030303030303030303020202
                  02020202020251510202020203362C241B130A04030202020202020202514C51
                  020202020339332B221912070302020202020202514649515151510203030303
                  030303030302020202020251424144474D4F5102020202020202020202020202
                  020251433D3F404A4B50510202020202020202020202020202020251433D3E45
                  484E51020303030303030303030303030303020251433C515151510203393939
                  3A332E27201C150F0903020202514351020202020339393939353028231D1611
                  0C03020202025151020202020303030303030303030303030303020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020203030303030303030303030303030303030302020202
                  020203393B37322F29261F1D1814100D08050403020202020202030303030303
                  0303030303030303030303030202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202}
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
                Hint = 'Ver registros da lixeira - [CFG003]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
        end
        object tsMenus: TTabSheet
          Caption = 'Menus Empresas'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 783
            Height = 49
            Align = alTop
            Caption = 'Configura'#231#245'es dos Menus - F5 '
            TabOrder = 0
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 779
              Height = 31
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label6: TLabel
                Left = 76
                Top = 10
                Width = 41
                Height = 13
                Caption = 'Sistema:'
              end
              object SpeedButton9: TSpeedButton
                Left = 482
                Top = 6
                Width = 23
                Height = 22
                Hint = 'Adicionar todos os menus'
                Flat = True
                Glyph.Data = {
                  CE010000424DCE01000000000000CE0000002800000010000000100000000100
                  08000000000000010000120B0000120B0000260000002600000000000000FFFF
                  FF00FF00FF00B73D3D00C95C5C00CA5F5F00CC656500CC666600CD696900CE6B
                  6B00CE6C6C00CF6E6E00CF6F6F00D2777700D7868600DA909000DC959500DE9B
                  9B0000660000149D210019AA2B00179D27001AB02D001BA92E001DB132001EB2
                  31001FB133001EAE310022B7380021B4370025A83B0031C24F0031B54D003BCB
                  5E0041C5630047D36D004FD6790053DE7F000202020202020202020202020202
                  0202020202020202020202020202020202020202020202021212020202020202
                  0202020202020212191A120202020202020202020202121F1C161D1202020202
                  02020202021223211E121718120202020202020212242520120212151B120202
                  02020202021222120A03020212141202020202020203120C080B030202121312
                  02020202030F0E0803070903020202121202020310110D030203050803020202
                  12120202030E0302020202030603020202020202020302020202020203040302
                  0202020202020202020202020202030302020202020202020202020202020203
                  030202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton9Click
              end
              object DBLookupComboBox1: TDBLookupComboBox
                Left = 123
                Top = 7
                Width = 353
                Height = 21
                Hint = 'Sistema ao qual ser'#225' vinculado os menus'
                KeyField = 'COD_APLICATIVO'
                ListField = 'NOME_APLICATIVO'
                ListSource = dtmConfig.dsERP
                TabOrder = 0
              end
              object BitBtn7: TBitBtn
                Left = 723
                Top = 0
                Width = 56
                Height = 31
                Hint = 'Savar altera'#231#245'es nos menus e retornar '#224' tela anterior.'
                Align = alRight
                TabOrder = 1
                OnClick = BitBtn7Click
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
          object ScrollBox4: TScrollBox
            Left = 0
            Top = 49
            Width = 783
            Height = 461
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object GroupBox6: TGroupBox
              Left = 0
              Top = 0
              Width = 779
              Height = 228
              Align = alTop
              Caption = 'Menus - F2 '
              TabOrder = 0
              object DBGrid2: TDBGrid
                Left = 2
                Top = 43
                Width = 775
                Height = 183
                Hint = '[Ins: para Incluir abaixo ]  -  Todos os Menus'
                Align = alTop
                DataSource = dtmConfig.dsMenusAtuais
                Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid2KeyDown
              end
              object Panel5: TPanel
                Left = 2
                Top = 15
                Width = 775
                Height = 28
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label7: TLabel
                  Left = 16
                  Top = 5
                  Width = 97
                  Height = 13
                  Caption = 'Localizar Menu (F3):'
                end
                object Label9: TLabel
                  Left = 488
                  Top = 5
                  Width = 218
                  Height = 13
                  Caption = 'Ao Encontrar o Menu Pressione INSERT'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Edit1: TEdit
                  Left = 119
                  Top = 2
                  Width = 353
                  Height = 21
                  Hint = '[F3: Localizar Menus ]'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnKeyDown = DBGrid2KeyDown
                end
              end
            end
            object GroupBox5: TGroupBox
              Left = 0
              Top = 228
              Width = 779
              Height = 228
              Align = alTop
              Caption = 'Menus do Sistema - F4 '
              TabOrder = 1
              object DBGrid3: TDBGrid
                Left = 2
                Top = 43
                Width = 775
                Height = 183
                Hint = 
                  '[H: Habilitar]  [D: Desabilitar]  [V: Vis'#237'vel]  [I: Invis'#237'vel]  ' +
                  '- Menus do Sistema Selecionado'
                Align = alTop
                DataSource = dtmConfig.dsMnSis
                Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                PopupMenu = PopupMenu4
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid3KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'STATUS_MENU'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ENABLE_MENU'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NIVEL_MENU'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_MENU'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESC_MENU'
                    Visible = True
                  end>
              end
              object Panel6: TPanel
                Left = 2
                Top = 15
                Width = 775
                Height = 28
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label8: TLabel
                  Left = 16
                  Top = 5
                  Width = 97
                  Height = 13
                  Caption = 'Localizar Menu (F3):'
                end
                object Edit2: TEdit
                  Left = 119
                  Top = 2
                  Width = 353
                  Height = 21
                  Hint = '[F3: Localizar Menus ]'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnKeyDown = DBGrid3KeyDown
                end
              end
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Panels = <
      item
        Text = 
          '[Alt+P: Pesquisa ]   [Alt+S: Sair]   [Del: Delete]   [Bot'#227'o Dire' +
          'ito Mouse: Configurar]'
        Width = 405
      end
      item
        Width = 655
      end>
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 20
    Top = 33
  end
  object PopupMenu3: TPopupMenu
    Left = 384
    Top = 288
    object HabilitarMenu1: TMenuItem
      Caption = 'Habilitar Menu'
      OnClick = HabilitarMenu1Click
    end
    object DesabilitarMenu1: TMenuItem
      Caption = 'Desabilitar Menu'
      OnClick = DesabilitarMenu1Click
    end
    object MenuVisvel1: TMenuItem
      Caption = 'Menu Vis'#237'vel'
      OnClick = MenuVisvel1Click
    end
    object MenuInvisvel1: TMenuItem
      Caption = 'Menu Invis'#237'vel'
      OnClick = MenuInvisvel1Click
    end
    object HabilitarMenusSelecionados1: TMenuItem
      Caption = 'Habilitar Menus Selecionados'
      OnClick = HabilitarMenusSelecionados1Click
    end
    object DesabilitarMenusSelecionados1: TMenuItem
      Caption = 'Desabilitar Menus Selecionados'
      OnClick = DesabilitarMenusSelecionados1Click
    end
    object MenusVisveisSelecionados1: TMenuItem
      Caption = 'Menus Vis'#237'veis Selecionados'
      OnClick = MenusVisveisSelecionados1Click
    end
    object MenuInvisvelSelecionados1: TMenuItem
      Caption = 'Menus Invis'#237'veis Selecionados'
      OnClick = MenuInvisvelSelecionados1Click
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 540
    Top = 305
    object DefinirNveldeUsurio1: TMenuItem
      Caption = 'Definir N'#237'vel de Usu'#225'rio'
      object SemNvel1: TMenuItem
        Caption = 'Sem N'#237'vel'
        OnClick = N11Click
      end
      object N11: TMenuItem
        Tag = 1
        Caption = '1'
        OnClick = N11Click
      end
      object N21: TMenuItem
        Tag = 2
        Caption = '2'
        OnClick = N11Click
      end
      object N31: TMenuItem
        Tag = 3
        Caption = '3'
        OnClick = N11Click
      end
      object N41: TMenuItem
        Tag = 4
        Caption = '4'
        OnClick = N11Click
      end
      object N51: TMenuItem
        Tag = 5
        Caption = '5'
        OnClick = N11Click
      end
      object N61: TMenuItem
        Tag = 6
        Caption = '6'
        OnClick = N11Click
      end
      object N71: TMenuItem
        Tag = 7
        Caption = '7'
        OnClick = N11Click
      end
      object N81: TMenuItem
        Tag = 8
        Caption = '8'
        OnClick = N11Click
      end
      object N91: TMenuItem
        Tag = 9
        Caption = '9'
        OnClick = N11Click
      end
      object N101: TMenuItem
        Tag = 10
        Caption = '10'
        OnClick = N11Click
      end
    end
    object ApagarMenu1: TMenuItem
      Caption = 'Apagar Menu'
      OnClick = ApagarMenu1Click
    end
    object Habilitar1: TMenuItem
      Caption = 'Habilitar'
      OnClick = Habilitar1Click
    end
    object Desabilitar1: TMenuItem
      Caption = 'Desabilitar'
      OnClick = Desabilitar1Click
    end
    object Visvel1: TMenuItem
      Caption = 'Vis'#237'vel'
      OnClick = Visvel1Click
    end
    object Invisvel1: TMenuItem
      Caption = 'Invis'#237'vel'
      OnClick = Invisvel1Click
    end
  end
end
