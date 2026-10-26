inherited frmMontaOrdemCarregamento: TfrmMontaOrdemCarregamento
  Caption = 'Montagem da Ordem de Carregamento'
  ClientHeight = 419
  Position = poMainFormCenter
  OnClose = FormClose
  ExplicitWidth = 792
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 784
    Height = 419
    ActivePage = tsPasso1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsPasso1: TTabSheet
      Caption = 'tsPasso1'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel2: TPanel
          Left = 6
          Top = 6
          Width = 764
          Height = 335
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 200
            Top = 0
            Height = 335
            ExplicitLeft = 191
            ExplicitHeight = 227
          end
          object Splitter2: TSplitter
            Left = 403
            Top = 0
            Height = 335
            ExplicitLeft = 384
            ExplicitTop = 64
            ExplicitHeight = 100
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 200
            Height = 335
            Align = alLeft
            Caption = 'Setor'
            TabOrder = 0
            object DBGrid1: TDBGrid
              Left = 2
              Top = 15
              Width = 196
              Height = 285
              Align = alClient
              DataSource = dtmOrdemCarregamento.dsSetorCons2
              Options = [dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnDblClick = DBGrid1DblClick
              OnKeyDown = DBGrid1KeyDown
              OnMouseUp = DBGrid1MouseUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
                  Width = 18
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SETOR'
                  Width = 140
                  Visible = True
                end>
            end
            object Panel21: TPanel
              Left = 2
              Top = 300
              Width = 196
              Height = 33
              Align = alBottom
              BevelOuter = bvNone
              BorderWidth = 4
              TabOrder = 0
              object BitBtn1: TBitBtn
                Left = 4
                Top = 4
                Width = 188
                Height = 25
                Align = alClient
                Caption = 'Iniciar'
                TabOrder = 0
                OnClick = BitBtn1Click
              end
            end
          end
          object GroupBox2: TGroupBox
            Left = 203
            Top = 0
            Width = 200
            Height = 335
            Align = alLeft
            Caption = 'Localidade'
            TabOrder = 1
            object DBGrid2: TDBGrid
              Left = 2
              Top = 15
              Width = 196
              Height = 318
              Align = alClient
              DataSource = dtmOrdemCarregamento.dsLocalCons2
              Options = [dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGrid2CellClick
              OnDrawColumnCell = DBGrid2DrawColumnCell
              OnDblClick = DBGrid2DblClick
              OnKeyDown = DBGrid2KeyDown
              OnMouseUp = DBGrid2MouseUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
                  Width = 18
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOCALIDADE'
                  Width = 140
                  Visible = True
                end>
            end
          end
          object GroupBox3: TGroupBox
            Left = 406
            Top = 0
            Width = 358
            Height = 335
            Align = alClient
            Caption = 'Clientes'
            TabOrder = 2
            object SpeedButton1: TSpeedButton
              Left = 2
              Top = 311
              Width = 354
              Height = 22
              Align = alBottom
              Caption = 'Mostrar Nome Fantasia'
              Flat = True
              OnClick = SpeedButton1Click
              ExplicitLeft = 3
              ExplicitTop = 288
            end
            object DBGrid3: TDBGrid
              Left = 2
              Top = 15
              Width = 354
              Height = 296
              Align = alClient
              DataSource = dtmOrdemCarregamento.dsCl
              Options = [dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGrid3CellClick
              OnDrawColumnCell = DBGrid3DrawColumnCell
              OnDblClick = DBGrid3DblClick
              OnKeyDown = DBGrid3KeyDown
              OnMouseUp = DBGrid3MouseUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
                  Width = 18
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CLIENTE'
                  Width = 300
                  Visible = True
                end>
            end
          end
        end
        object Panel3: TPanel
          Left = 6
          Top = 341
          Width = 764
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object BitBtn3: TBitBtn
            Left = 583
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Avan'#231'ar'
            TabOrder = 0
            OnClick = BitBtn3Click
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
          end
          object BitBtn27: TBitBtn
            Left = 502
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = BitBtn27Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
              83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
              835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
              835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
              835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
              A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
              A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
              A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
              A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
              A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
              E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
              0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
              0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
              C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
              8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
              E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
              C160C260D472}
          end
        end
      end
    end
    object tsPasso2: TTabSheet
      Caption = 'tsPasso2'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel5: TPanel
          Left = 6
          Top = 6
          Width = 764
          Height = 335
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter3: TSplitter
            Left = 0
            Top = 167
            Width = 764
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitWidth = 168
          end
          object GroupBox6: TGroupBox
            Left = 0
            Top = 0
            Width = 764
            Height = 167
            Align = alTop
            Caption = 'Clientes'
            TabOrder = 0
            object Panel7: TPanel
              Left = 592
              Top = 15
              Width = 170
              Height = 150
              Align = alRight
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 2
              TabOrder = 0
              object Label1: TLabel
                Left = 25
                Top = 12
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'Data Inicial'
              end
              object Label2: TLabel
                Left = 30
                Top = 39
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Data Final'
              end
              object Label3: TLabel
                Left = 18
                Top = 66
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Venda Inicial'
              end
              object Label4: TLabel
                Left = 23
                Top = 93
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Venda Final'
              end
              object MaskEdit1: TMaskEdit
                Left = 84
                Top = 9
                Width = 71
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
              object MaskEdit2: TMaskEdit
                Left = 84
                Top = 36
                Width = 71
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object EditHw1: TEditHw
                Left = 84
                Top = 63
                Width = 73
                Height = 21
                TabOrder = 2
                Text = '                   0'
                Formato = fInteger
                FormatSize = '0.2'
              end
              object EditHw2: TEditHw
                Left = 84
                Top = 90
                Width = 73
                Height = 21
                TabOrder = 3
                Text = '                   0'
                Formato = fInteger
                FormatSize = '0.2'
              end
              object BitBtn5: TBitBtn
                Left = 2
                Top = 119
                Width = 162
                Height = 25
                Align = alBottom
                Caption = 'Processar'
                TabOrder = 4
                OnClick = BitBtn5Click
              end
            end
            object Panel8: TPanel
              Left = 2
              Top = 15
              Width = 590
              Height = 150
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object DBGrid6: TDBGrid
                Left = 0
                Top = 0
                Width = 590
                Height = 117
                Align = alClient
                DataSource = dtmOrdemCarregamento.dsClTemp
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid6KeyDown
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
                    FieldName = 'CPFCGC'
                    Visible = True
                  end>
              end
              object Panel9: TPanel
                Left = 0
                Top = 117
                Width = 590
                Height = 33
                Align = alBottom
                BevelOuter = bvNone
                BorderWidth = 4
                TabOrder = 1
                object BitBtn2: TBitBtn
                  Left = 4
                  Top = 4
                  Width = 582
                  Height = 25
                  Align = alClient
                  Caption = 'Adicionar Cliente a Lista'
                  TabOrder = 0
                  OnClick = BitBtn2Click
                end
              end
            end
          end
          object GroupBox4: TGroupBox
            Left = 0
            Top = 170
            Width = 764
            Height = 165
            Align = alClient
            Caption = 'Vendas'
            TabOrder = 1
            object DBGrid4: TDBGrid
              Left = 2
              Top = 15
              Width = 760
              Height = 148
              Align = alClient
              DataSource = dtmOrdemCarregamento.dsVendasCons
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGrid4CellClick
              OnDrawColumnCell = DBGrid4DrawColumnCell
              OnDblClick = DBGrid4DblClick
              OnKeyDown = DBGrid4KeyDown
              OnMouseUp = DBGrid4MouseUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
                  Width = 18
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_VENDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_VENDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_TOTAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CLIENTE'
                  Visible = True
                end>
            end
          end
        end
        object Panel6: TPanel
          Left = 6
          Top = 341
          Width = 764
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object BitBtn4: TBitBtn
            Left = 583
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Avan'#231'ar'
            Enabled = False
            TabOrder = 0
            OnClick = BitBtn4Click
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
          end
          object BitBtn11: TBitBtn
            Left = 664
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Concluir'
            Enabled = False
            TabOrder = 1
            OnClick = BitBtn11Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F0000007467813A813A813661366136613241324132422E422E222E222A
              222A0226545FA13EA13EC142A23EA23EA23A813A8136623662324232422E422E
              222A222A0226A13EE146C142C142A23E813A525FED4E6136623662324232422E
              422E222A222AA13EE146C146C142A13E0E57FF7FFF7F853E8236623662324232
              422E422E222AC142E14AE146C142ED52FF7FFF7FFF7F54638136623662366232
              4232422E222AC142014BC146C94ADD7BFF7F7667FF7FFF7FA53E823A62366236
              62324232222EC142E14A0D53FF7FFF7F546361365463FF7F7667813682366236
              62364232422EC146E1465463FF7F5463813AC142833EDD7BFF7FC946813A8236
              62366232422EE146214FC342E94EA13EE24AE246C2420E57FF7FBB776136823A
              823662364232E14644574557265726530653054F054BA33EB96FFF7F305BA33E
              A33E823A4132E14A475B475B465726532653054F054FE54AC746FF7FFF7FC946
              A33EA33E6132E14A675B475B4657465726532553054F054FC446305BFF7FDD7B
              A746A33E6132014B675F675B465B4657265725532553054F054BA33E986BFF7F
              7667A33E6136014F675F675B665B465B465725532553054F054FE44AA4427667
              C946A33E6136014F4457455B4557455724532453044F044F044BE34AE346A23E
              C342A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
              813A813A7467}
          end
          object BitBtn16: TBitBtn
            Left = 6
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Voltar'
            TabOrder = 2
            OnClick = BitBtn16Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F0000007467813A813A813661366136613241324132422E422E222E222A
              222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232412E212E
              212A222A0226A13EE146C142C142A23EA23EA23A823A61366236212EAC4AF056
              8842012A222AA13EE146C146C142C142A23EA23E613641328236212EFF7FFF7F
              776B212E222AC142E14AE146C146C142C142413644364132823A212EFF7FFF7F
              776B212E222AC142014BE14AE146C1464136AC4A776B4136823A212EFF7FFF7F
              776B212E222EC142014B014BE1464132CE52FF7F776B41326136012EFF7FFF7F
              776B212E422EC146014FE14A2132345FFF7FFF7FDD7BF056F0565667FF7FFF7F
              345F4132422EE146E14A43365667FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              884261364232E146A242CE52FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF056
              413282364132E14A4657833E8842996FFF7FFF7FDD7BAA468842884244364236
              A33E823A6132E14A675B465BE54E4236CE52DD7B776B823AE44AE346C342C342
              A33EA23A6132014B675F665B465B4657A3422336CE52823EE44AE346C346C342
              A33EA23E6136014F675F665B665B465745572553623A823E044BE34AE346C346
              C242A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
              C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
              813A813A7467}
          end
          object BitBtn6: TBitBtn
            Left = 502
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 3
            OnClick = BitBtn27Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
              83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
              835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
              835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
              835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
              A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
              A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
              A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
              A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
              A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
              E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
              0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
              0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
              C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
              8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
              E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
              C160C260D472}
          end
        end
      end
    end
    object tsPasso3: TTabSheet
      Caption = 'tsPasso3'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel11: TPanel
          Left = 6
          Top = 6
          Width = 764
          Height = 335
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter4: TSplitter
            Left = 0
            Top = 167
            Width = 764
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitWidth = 168
          end
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 764
            Height = 167
            Align = alTop
            Caption = 'Vendas'
            TabOrder = 0
            object Panel13: TPanel
              Left = 2
              Top = 15
              Width = 760
              Height = 150
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBGrid5: TDBGrid
                Left = 0
                Top = 0
                Width = 760
                Height = 117
                Align = alClient
                DataSource = dtmOrdemCarregamento.dsVndTemp
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid5KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NUM_VENDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_CLIENTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_VENDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_TOTAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_VENDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_CLIENTE'
                    Visible = True
                  end>
              end
              object Panel14: TPanel
                Left = 0
                Top = 117
                Width = 760
                Height = 33
                Align = alBottom
                BevelOuter = bvNone
                BorderWidth = 4
                TabOrder = 1
                object BitBtn7: TBitBtn
                  Left = 4
                  Top = 4
                  Width = 752
                  Height = 25
                  Align = alClient
                  Caption = 'Adicionar Venda a Lista'
                  TabOrder = 0
                  OnClick = BitBtn7Click
                end
              end
            end
          end
          object GroupBox7: TGroupBox
            Left = 0
            Top = 170
            Width = 764
            Height = 165
            Align = alClient
            Caption = 'Mercadorias'
            TabOrder = 1
            object DBGrid7: TDBGrid
              Left = 2
              Top = 15
              Width = 760
              Height = 148
              Align = alClient
              DataSource = dtmOrdemCarregamento.dsCargaIt
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
                  Width = 18
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NITEM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_FAB_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QUANTIDADE_VENDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_VENDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_VENDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NITEM_VENDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PESO_UN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PESO_TOTAL'
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
                  Visible = True
                end>
            end
          end
        end
        object Panel15: TPanel
          Left = 6
          Top = 341
          Width = 764
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object BitBtn8: TBitBtn
            Left = 583
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Avan'#231'ar'
            TabOrder = 0
            OnClick = BitBtn8Click
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
          end
          object BitBtn12: TBitBtn
            Left = 664
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Concluir'
            TabOrder = 1
            OnClick = BitBtn12Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F0000007467813A813A813661366136613241324132422E422E222E222A
              222A0226545FA13EA13EC142A23EA23EA23A813A8136623662324232422E422E
              222A222A0226A13EE146C142C142A23E813A525FED4E6136623662324232422E
              422E222A222AA13EE146C146C142A13E0E57FF7FFF7F853E8236623662324232
              422E422E222AC142E14AE146C142ED52FF7FFF7FFF7F54638136623662366232
              4232422E222AC142014BC146C94ADD7BFF7F7667FF7FFF7FA53E823A62366236
              62324232222EC142E14A0D53FF7FFF7F546361365463FF7F7667813682366236
              62364232422EC146E1465463FF7F5463813AC142833EDD7BFF7FC946813A8236
              62366232422EE146214FC342E94EA13EE24AE246C2420E57FF7FBB776136823A
              823662364232E14644574557265726530653054F054BA33EB96FFF7F305BA33E
              A33E823A4132E14A475B475B465726532653054F054FE54AC746FF7FFF7FC946
              A33EA33E6132E14A675B475B4657465726532553054F054FC446305BFF7FDD7B
              A746A33E6132014B675F675B465B4657265725532553054F054BA33E986BFF7F
              7667A33E6136014F675F675B665B465B465725532553054F054FE44AA4427667
              C946A33E6136014F4457455B4557455724532453044F044F044BE34AE346A23E
              C342A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
              813A813A7467}
          end
          object BitBtn17: TBitBtn
            Left = 6
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Voltar'
            TabOrder = 2
            OnClick = BitBtn17Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F0000007467813A813A813661366136613241324132422E422E222E222A
              222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232412E212E
              212A222A0226A13EE146C142C142A23EA23EA23A823A61366236212EAC4AF056
              8842012A222AA13EE146C146C142C142A23EA23E613641328236212EFF7FFF7F
              776B212E222AC142E14AE146C146C142C142413644364132823A212EFF7FFF7F
              776B212E222AC142014BE14AE146C1464136AC4A776B4136823A212EFF7FFF7F
              776B212E222EC142014B014BE1464132CE52FF7F776B41326136012EFF7FFF7F
              776B212E422EC146014FE14A2132345FFF7FFF7FDD7BF056F0565667FF7FFF7F
              345F4132422EE146E14A43365667FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              884261364232E146A242CE52FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF056
              413282364132E14A4657833E8842996FFF7FFF7FDD7BAA468842884244364236
              A33E823A6132E14A675B465BE54E4236CE52DD7B776B823AE44AE346C342C342
              A33EA23A6132014B675F665B465B4657A3422336CE52823EE44AE346C346C342
              A33EA23E6136014F675F665B665B465745572553623A823E044BE34AE346C346
              C242A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
              C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
              813A813A7467}
          end
          object BitBtn10: TBitBtn
            Left = 502
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 3
            OnClick = BitBtn27Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
              83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
              835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
              835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
              835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
              A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
              A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
              A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
              A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
              A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
              E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
              0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
              0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
              C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
              8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
              E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
              C160C260D472}
          end
        end
      end
    end
    object tsPasso4: TTabSheet
      Caption = 'tsPasso4'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel16: TPanel
          Left = 6
          Top = 6
          Width = 764
          Height = 335
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object GroupBox8: TGroupBox
            Left = 0
            Top = 0
            Width = 764
            Height = 335
            Align = alClient
            Caption = 'Mercadorias'
            TabOrder = 0
            object Panel17: TPanel
              Left = 2
              Top = 15
              Width = 760
              Height = 318
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object DBGrid8: TDBGrid
                Left = 0
                Top = 0
                Width = 760
                Height = 318
                Align = alClient
                DataSource = dtmOrdemCarregamento.dsCargaItTemp
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid8KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NITEM'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FAB_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QUANTIDADE_VENDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_VENDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_VENDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PESO_UN'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PESO_TOTAL'
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
                    Visible = True
                  end>
              end
            end
          end
        end
        object Panel19: TPanel
          Left = 6
          Top = 341
          Width = 764
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object BitBtn9: TBitBtn
            Left = 583
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Avan'#231'ar'
            TabOrder = 0
            OnClick = BitBtn9Click
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
          end
          object BitBtn13: TBitBtn
            Left = 664
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Concluir'
            TabOrder = 1
            OnClick = BitBtn13Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F0000007467813A813A813661366136613241324132422E422E222E222A
              222A0226545FA13EA13EC142A23EA23EA23A813A8136623662324232422E422E
              222A222A0226A13EE146C142C142A23E813A525FED4E6136623662324232422E
              422E222A222AA13EE146C146C142A13E0E57FF7FFF7F853E8236623662324232
              422E422E222AC142E14AE146C142ED52FF7FFF7FFF7F54638136623662366232
              4232422E222AC142014BC146C94ADD7BFF7F7667FF7FFF7FA53E823A62366236
              62324232222EC142E14A0D53FF7FFF7F546361365463FF7F7667813682366236
              62364232422EC146E1465463FF7F5463813AC142833EDD7BFF7FC946813A8236
              62366232422EE146214FC342E94EA13EE24AE246C2420E57FF7FBB776136823A
              823662364232E14644574557265726530653054F054BA33EB96FFF7F305BA33E
              A33E823A4132E14A475B475B465726532653054F054FE54AC746FF7FFF7FC946
              A33EA33E6132E14A675B475B4657465726532553054F054FC446305BFF7FDD7B
              A746A33E6132014B675F675B465B4657265725532553054F054BA33E986BFF7F
              7667A33E6136014F675F675B665B465B465725532553054F054FE44AA4427667
              C946A33E6136014F4457455B4557455724532453044F044F044BE34AE346A23E
              C342A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
              813A813A7467}
          end
          object BitBtn18: TBitBtn
            Left = 6
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Voltar'
            TabOrder = 2
            OnClick = BitBtn18Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F0000007467813A813A813661366136613241324132422E422E222E222A
              222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232412E212E
              212A222A0226A13EE146C142C142A23EA23EA23A823A61366236212EAC4AF056
              8842012A222AA13EE146C146C142C142A23EA23E613641328236212EFF7FFF7F
              776B212E222AC142E14AE146C146C142C142413644364132823A212EFF7FFF7F
              776B212E222AC142014BE14AE146C1464136AC4A776B4136823A212EFF7FFF7F
              776B212E222EC142014B014BE1464132CE52FF7F776B41326136012EFF7FFF7F
              776B212E422EC146014FE14A2132345FFF7FFF7FDD7BF056F0565667FF7FFF7F
              345F4132422EE146E14A43365667FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              884261364232E146A242CE52FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF056
              413282364132E14A4657833E8842996FFF7FFF7FDD7BAA468842884244364236
              A33E823A6132E14A675B465BE54E4236CE52DD7B776B823AE44AE346C342C342
              A33EA23A6132014B675F665B465B4657A3422336CE52823EE44AE346C346C342
              A33EA23E6136014F675F665B665B465745572553623A823E044BE34AE346C346
              C242A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
              C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
              813A813A7467}
          end
          object BitBtn15: TBitBtn
            Left = 502
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 3
            OnClick = BitBtn27Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
              83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
              835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
              835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
              835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
              A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
              A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
              A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
              A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
              A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
              E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
              0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
              0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
              C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
              8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
              E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
              C160C260D472}
          end
        end
      end
    end
    object tsPasso5: TTabSheet
      Caption = 'tsPasso5'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel18: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        OnEnter = Panel18Enter
        object Panel20: TPanel
          Left = 6
          Top = 6
          Width = 764
          Height = 335
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox9: TGroupBox
            Left = 0
            Top = 0
            Width = 764
            Height = 335
            Align = alClient
            Caption = 'Dados da Ordem de Carregamento'
            TabOrder = 0
            OnEnter = GroupBox9Enter
            object Label5: TLabel
              Left = 120
              Top = 32
              Width = 46
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = DBEdit1
            end
            object Label6: TLabel
              Left = 123
              Top = 59
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Motorista'
              FocusControl = DBEdit2
            end
            object Label7: TLabel
              Left = 125
              Top = 113
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Faturista'
              FocusControl = DBEdit3
            end
            object Label8: TLabel
              Left = 113
              Top = 140
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Conferente'
              FocusControl = DBEdit4
            end
            object Label9: TLabel
              Left = 135
              Top = 86
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ve'#237'culo'
              FocusControl = DBEdit5
            end
            object Label10: TLabel
              Left = 383
              Top = 167
              Width = 62
              Height = 13
              Caption = 'Peso M'#225'ximo'
              FocusControl = DBEdit6
            end
            object Label11: TLabel
              Left = 376
              Top = 194
              Width = 70
              Height = 13
              Caption = 'Peso da Carga'
              FocusControl = DBEdit7
            end
            object Label12: TLabel
              Left = 354
              Top = 221
              Width = 95
              Height = 13
              Caption = 'Data Carregamento'
              FocusControl = DBEdit8
            end
            object Label13: TLabel
              Left = 121
              Top = 248
              Width = 49
              Height = 13
              Caption = 'Ajudantes'
              FocusControl = DBMemo1
            end
            object Label14: TLabel
              Left = 592
              Top = 167
              Width = 158
              Height = 13
              Caption = 'Habilitar ou Desabilitar [OCR034]'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 174
              Top = 167
              Width = 156
              Height = 17
              DataField = 'PESO_MAXIMO'
              DataSource = dtmOrdemCarregamento.dsVeicTrCons2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 70
              Top = 167
              Width = 98
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peso M'#225'ximo Ve'#237'culo'
              FocusControl = DBEdit8
            end
            object DBEdit1: TDBEdit
              Left = 174
              Top = 29
              Width = 412
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DESCRICAO'
              DataSource = dtmOrdemCarregamento.dsCarga
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 174
              Top = 56
              Width = 67
              Height = 21
              DataField = 'COD_MOTORISTA'
              DataSource = dtmOrdemCarregamento.dsCarga
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 174
              Top = 83
              Width = 67
              Height = 21
              DataField = 'COD_VEIC'
              DataSource = dtmOrdemCarregamento.dsCarga
              TabOrder = 3
              OnExit = DBEdit3Exit
            end
            object DBEdit4: TDBEdit
              Left = 174
              Top = 110
              Width = 67
              Height = 21
              DataField = 'COD_FATURISTA'
              DataSource = dtmOrdemCarregamento.dsCarga
              TabOrder = 5
            end
            object DBEdit5: TDBEdit
              Left = 174
              Top = 137
              Width = 67
              Height = 21
              DataField = 'COD_CONFERENTE'
              DataSource = dtmOrdemCarregamento.dsCarga
              TabOrder = 7
            end
            object DBEdit6: TDBEdit
              Left = 452
              Top = 164
              Width = 134
              Height = 21
              DataField = 'PESO_MAX'
              DataSource = dtmOrdemCarregamento.dsCarga
              TabOrder = 9
            end
            object DBEdit7: TDBEdit
              Left = 452
              Top = 191
              Width = 134
              Height = 21
              DataField = 'PESO_CARGA'
              DataSource = dtmOrdemCarregamento.dsCarga
              TabOrder = 10
            end
            object DBEdit8: TDBEdit
              Left = 452
              Top = 218
              Width = 134
              Height = 21
              DataField = 'DATA_CARREGAMENTO'
              DataSource = dtmOrdemCarregamento.dsCarga
              TabOrder = 11
            end
            object DBMemo1: TDBMemo
              Left = 174
              Top = 245
              Width = 412
              Height = 89
              DataField = 'AJUDANTES'
              DataSource = dtmOrdemCarregamento.dsCarga
              TabOrder = 12
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 246
              Top = 56
              Width = 339
              Height = 21
              DataField = 'COD_MOTORISTA'
              DataSource = dtmOrdemCarregamento.dsCarga
              KeyField = 'COD_VENDEDOR'
              ListField = 'NOME_VENDEDOR'
              ListSource = dtmOrdemCarregamento.dsColabCons2
              TabOrder = 2
            end
            object DBLookupComboBox3: TDBLookupComboBox
              Left = 247
              Top = 83
              Width = 339
              Height = 21
              DataField = 'COD_VEIC'
              DataSource = dtmOrdemCarregamento.dsCarga
              KeyField = 'COD_VEIC'
              ListField = 'MODELO'
              ListSource = dtmOrdemCarregamento.dsVeicTrCons2
              TabOrder = 4
              OnExit = DBEdit3Exit
            end
            object DBLookupComboBox4: TDBLookupComboBox
              Left = 246
              Top = 110
              Width = 339
              Height = 21
              DataField = 'COD_FATURISTA'
              DataSource = dtmOrdemCarregamento.dsCarga
              KeyField = 'COD_VENDEDOR'
              ListField = 'NOME_VENDEDOR'
              ListSource = dtmOrdemCarregamento.dsColabCons2
              TabOrder = 6
            end
            object DBLookupComboBox10: TDBLookupComboBox
              Left = 246
              Top = 137
              Width = 339
              Height = 21
              DataField = 'COD_CONFERENTE'
              DataSource = dtmOrdemCarregamento.dsCarga
              KeyField = 'COD_VENDEDOR'
              ListField = 'NOME_VENDEDOR'
              ListSource = dtmOrdemCarregamento.dsColabCons2
              TabOrder = 8
            end
          end
        end
        object Panel22: TPanel
          Left = 6
          Top = 341
          Width = 764
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object BitBtn14: TBitBtn
            Left = 664
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Concluir'
            TabOrder = 0
            OnClick = BitBtn14Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F0000007467813A813A813661366136613241324132422E422E222E222A
              222A0226545FA13EA13EC142A23EA23EA23A813A8136623662324232422E422E
              222A222A0226A13EE146C142C142A23E813A525FED4E6136623662324232422E
              422E222A222AA13EE146C146C142A13E0E57FF7FFF7F853E8236623662324232
              422E422E222AC142E14AE146C142ED52FF7FFF7FFF7F54638136623662366232
              4232422E222AC142014BC146C94ADD7BFF7F7667FF7FFF7FA53E823A62366236
              62324232222EC142E14A0D53FF7FFF7F546361365463FF7F7667813682366236
              62364232422EC146E1465463FF7F5463813AC142833EDD7BFF7FC946813A8236
              62366232422EE146214FC342E94EA13EE24AE246C2420E57FF7FBB776136823A
              823662364232E14644574557265726530653054F054BA33EB96FFF7F305BA33E
              A33E823A4132E14A475B475B465726532653054F054FE54AC746FF7FFF7FC946
              A33EA33E6132E14A675B475B4657465726532553054F054FC446305BFF7FDD7B
              A746A33E6132014B675F675B465B4657265725532553054F054BA33E986BFF7F
              7667A33E6136014F675F675B665B465B465725532553054F054FE44AA4427667
              C946A33E6136014F4457455B4557455724532453044F044F044BE34AE346A23E
              C342A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
              813A813A7467}
          end
          object BitBtn19: TBitBtn
            Left = 6
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Voltar'
            TabOrder = 1
            OnClick = BitBtn19Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F0000007467813A813A813661366136613241324132422E422E222E222A
              222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232412E212E
              212A222A0226A13EE146C142C142A23EA23EA23A823A61366236212EAC4AF056
              8842012A222AA13EE146C146C142C142A23EA23E613641328236212EFF7FFF7F
              776B212E222AC142E14AE146C146C142C142413644364132823A212EFF7FFF7F
              776B212E222AC142014BE14AE146C1464136AC4A776B4136823A212EFF7FFF7F
              776B212E222EC142014B014BE1464132CE52FF7F776B41326136012EFF7FFF7F
              776B212E422EC146014FE14A2132345FFF7FFF7FDD7BF056F0565667FF7FFF7F
              345F4132422EE146E14A43365667FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
              884261364232E146A242CE52FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF056
              413282364132E14A4657833E8842996FFF7FFF7FDD7BAA468842884244364236
              A33E823A6132E14A675B465BE54E4236CE52DD7B776B823AE44AE346C342C342
              A33EA23A6132014B675F665B465B4657A3422336CE52823EE44AE346C346C342
              A33EA23E6136014F675F665B665B465745572553623A823E044BE34AE346C346
              C242A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
              C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
              813A813A7467}
          end
          object BitBtn20: TBitBtn
            Left = 502
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 2
            OnClick = BitBtn27Click
            Glyph.Data = {
              42020000424D4202000000000000420000002800000010000000100000000100
              10000300000000020000120B0000120B00000000000000000000007C0000E003
              00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
              83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
              835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
              835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
              835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
              A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
              A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
              A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
              A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
              A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
              E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
              0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
              0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
              C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
              8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
              E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
              C160C260D472}
          end
        end
      end
    end
  end
end
