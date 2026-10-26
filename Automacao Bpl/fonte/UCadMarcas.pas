unit UCadMarcas;
(************************ Hw Sistemas e Computadores ***************************
Tratamentos:
1 - Verifica se o departamento do usuário contém a palavra VEICULO e inicializa
com a opção TIPO : VEÍCULO, preenchida, senão começa com PRODUTO mas usuário
pode selecionar qualquer opção. Utilizado : vdadosini.vdpto;
*******************************************************************************)
interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadraoModal, DBCtrls, ExtCtrls, Menus,
  ComCtrls, Buttons, Grids, DBGrids, Controls, StdCtrls, Mask, Forms, Classes,
  AppEvnts, uCadPadrao, Graphics;

type
  TFrmCadMarcas = class(TfrmCadPadraoM)
    pnMarcaEC: TPanel;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBComboBox_TipoMarca: TDBComboBox;
    GroupBoxEC: TGroupBox;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    pnBotoesEC: TPanel;
    LabelSeqEC: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    CheckCadSeqEC: TCheckBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure LabelSeqECClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure pnMarcaECEnter(Sender: TObject);
    procedure DBComboBox_TipoMarcaDropDown(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMarcaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadMarcas: TFrmCadMarcas;
  Marca: TMarcas;
  vfocar: boolean;

implementation

uses
  uDtmAtivo, DB, UDtmCadastrosBasicos, uDadosIni, uDataSet_OOP, SysUtils;

{$R *.dfm}

procedure TFrmCadMarcas.BitBtn1Click(Sender: TObject);
begin
  inherited;
  SpeedButton2.Hint := 'Enviar para Lixeira - [BAS014]';

  Marca.rMARCA.vCampo := ComboBox1.Text;
  Marca.rMARCA.vCondicao := ComboBox3.Text;
  Marca.rMARCA.vDataIni := trim(MaskEdit1.Text);
  Marca.rMARCA.vDataFim := trim(MaskEdit2.Text);
  Marca.rMARCA.vValor := trim(MaskEdit3.Text);
  Marca._defineSqlAdicional;

  if MaskEdit2.Visible then
  begin
    if not Marca.ConsultaCampos('MARCA_PROD',
    	Marca.rMARCA.vCampo,
      'MARCA_PROD.COD_MARCA',
      Marca.rMARCA.vDataIni,
      Marca.rMARCA.vDataFim,
      vDadosIni.codEmpresa, 1,
      'MARCA_PROD.*, MARCA_PROD_EC.ID_COMMERCE',
      'LEFT JOIN MARCA_PROD_EC ON MARCA_PROD_EC.COD_MARCA = MARCA_PROD.COD_MARCA AND MARCA_PROD_EC.COD_EMPRESA = ' + vDadosIni.codEmpresa,
      Marca.rMARCA.vSqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not Marca.ConsultaCampos('MARCA_PROD',
  	Marca.rMARCA.vValor,
    Marca.rMARCA.vCampo,
    Marca.rMARCA.vCondicao,
    'MARCA_PROD.COD_MARCA', true,
    vDadosIni.codEmpresa,
    'MARCA_PROD.*, MARCA_PROD_EC.ID_COMMERCE',
    'LEFT JOIN MARCA_PROD_EC ON MARCA_PROD_EC.COD_MARCA = MARCA_PROD.COD_MARCA AND MARCA_PROD_EC.COD_EMPRESA = ' + vDadosIni.codEmpresa,
    Marca.rMARCA.vSqlAdicional) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmCadMarcas.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS008', 'INCLUIR', '', 'MARCA_PROD', '', Marca.buscas, true) then
//  if vDadosIni.PesqPros('BAS008', '', Marca.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;

      DBEdit1.Enabled := true;
      GroupBoxEC.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
      pnBotoesEC.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
      vfocar := true;
      if vDadosIni.vEcommerce.vHabilitarEcommerce then
		  begin
        pnMarcaEC.Align := alNone;
        pnMarcaEC.Height := 208;
        pnMarcaEC.Width := 544;
        CheckCadSeqEC.Enabled := true;
        CheckCadSeqEC.Visible := true;
        CheckCadSeqEC.Checked := false;
        LabelSeqEC.Enabled := true;
        LabelSeqEC.Visible := true;

        if not Marca.Insert then
          exit;

        Marca.PreencheCampos;
        TabSheet3.Caption := 'Cadastrando um nova Marca de Produto';

        if ((pos('VEICULO', vDadosIni.vDpto) > 0)) then
        begin
          Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'V';
          DBComboBox_TipoMarca.ItemIndex := 1;
        end
        else
          if (vDadosIni.vSistemasUsuario.vSisVeiculos) then
          begin
            Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'P';
            DBComboBox_TipoMarca.ItemIndex := 0;
          end;

        if not vDadosIni.abreForm('Marca', pnMarcaEC, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
        begin
          BitBtn8Click(Sender);
          Exit;
        end;
      end
      else
      begin
        inherited;
        pnMarcaEC.Align := alClient;
        TabSheet3.TabVisible := true;
        PageControl3.ActivePage := TabSheet3;
        TabSheet3.Show;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          DBEdit1.SetFocus;

        if not Marca.Insert then
          exit;

        Marca.PreencheCampos;
        TabSheet3.Caption := 'Cadastrando um nova Marca de Produto';

        if ((pos('VEICULO', vDadosIni.vDpto) > 0)) then
        begin
          Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'V';
          DBComboBox_TipoMarca.ItemIndex := 1;
        end
        else
          if (vDadosIni.vSistemasUsuario.vSisVeiculos) then
          begin
            Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'P';
            DBComboBox_TipoMarca.ItemIndex := 0;
          end;
      end;

    finally
      Screen.Cursor := crDefault;
    end;
    if TelaCadastro = 2 then
    begin
      Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'V';
      DBComboBox_TipoMarca.ItemIndex := 1;
    end;
  end;
end;

procedure TFrmCadMarcas.BitBtn4Click(Sender: TObject);
var
  status: integer;
  acao: string;
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not Marca.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Marca.vNomeCampoErro, Marca.vMensagemErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if Marca.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          DBEdit1.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          DBEdit2.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
   {
  if vDadosIni.PesqPros('BAS013', 'CONFIRMAR', '', 'MARCA_PROD', '', Marca.buscas, true) then
//  if vDadosIni.PesqPros('BAS013', '', Marca.buscas, false) then
  begin
    try
      Screen.Cursor := crHourGlass;
      if Marca.dataSet.State = dsInsert then
      begin
        status := 1;
        acao := 'INSERIR';
      end
      else
      begin
        status := 0;
        acao := 'EDITAR';
      end;

      Marca._VerificarCampos(1, acao, 'COD_MARCA', 'COD_MARCA',
        'MARCA_PROD', 'Código da marca não informado!', '');

      Marca._VerificarCampos(1, acao, 'COD_MARCA', 'DESCRICAO_MARCA',
        'MARCA_PROD', 'Descrição da marca não informada!', '');

      Marca._VerificarCampos(1, acao, 'COD_MARCA', 'TIPO_MARCA',
        'MARCA_PROD', 'Tipo de marca não informado!', '');

      if acao = 'INSERIR' then
        vDadosIni.vPesquisa := Marca.dataSet.FieldByName('COD_MARCA').AsString;

      if not Marca.Post then
        Application.MessageBox('Erro ao gravar Marca de Produto. Verifique se o código informado já não existe cadastrado.' + chr(13) + 'Tente novamente.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if Marca.Apply then
      begin
//        if acao = 'INSERIR' then
        vDadosIni.vPesquisa := marca.dataSet.FieldByName('COD_MARCA').AsString;
        if Marca.CommitaTransacao then
        begin
          if status = 1 then
            Marca.ExecutaComandosSql('select GEN_ID(INC_COD_MARCA,1) from rdb$database');
          vDadosIni.GravaAuditoria('BAS013', 'CONFIRMAR', Marca.dataSet.FieldByName('COD_MARCA').AsString + ' Gravação Confirmada', 'MARCA_PROD', Marca.dataSet.FieldByName('COD_MARCA').AsString, Marca.buscas);
        end
        else
          vDadosIni.GravaAuditoria('BAS013', 'CONFIRMAR', Marca.dataSet.FieldByName('COD_MARCA').AsString + ' Gravação não Confirmada', 'MARCA_PROD', Marca.dataSet.FieldByName('COD_MARCA').AsString, Marca.buscas);
      end
      else
      begin
        Marca.Cancel;
        Marca.RollBackTransacao;
        vDadosIni.GravaAuditoria('BAS013', 'CONFIRMAR', Marca.dataSet.FieldByName('COD_MARCA').AsString + ' Gravação não Confirmada', 'MARCA_PROD', Marca.dataSet.FieldByName('COD_MARCA').AsString, Marca.buscas);
      end;
      Marca.Refresh;
      if CheckCadSeq.Checked then
        BitBtn3Click(Sender);
    finally
      Screen.Cursor := crDefault;
       inherited;
    end;
  end;}
end;

procedure TFrmCadMarcas.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS014', 'CANCELAR', '', 'MARCA_PROD', '', Marca.buscas, true) then
//  if vDadosIni.PesqPros('BAS014', '', Marca.buscas, true) then
//  begin
//    try
//      Screen.Cursor := crHourGlass;
      inherited;
      PageControl1.ActivePage := TabSheet2;
      Marca.Cancel;
      Marca.RollBackTransacao;
//    finally
//      Screen.Cursor := crDefault;
//    end;
//  end;
end;

procedure TFrmCadMarcas.BitBtn7Click(Sender: TObject);
begin
  if not Marca.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Marca.vNomeCampoErro, Marca.vMensagemErro);
  end
  else
  begin
    if CheckCadSeqEC.Checked then
    begin
      TForm(pnMarcaEC.Parent).ModalResult := IDOK;
      if Marca.Insert then
         vDadosIni.abreForm('Marca', pnMarcaEC, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);
    end
    else
      TForm(pnMarcaEC.Parent).ModalResult := IDOK;
  end;
end;

procedure TFrmCadMarcas.BitBtn8Click(Sender: TObject);
begin
//  if not vDadosIni.PesqPros('BAS014', 'CANCELAR', '', 'MARCA_PROD', '', Marca.buscas, true) then
//    exit;
//  if vDadosIni.PesqPros('BAS014', '', Marca.buscas, true) then

  Marca.Cancel;
  Marca.RollBackTransacao;
  TForm(pnMarcaEC.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadMarcas.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Marca._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadMarcas.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Marca._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadMarcas.DBComboBox_TipoMarcaDropDown(Sender: TObject);
begin
  inherited;
//  case DBComboBox_TipoMarca.ItemIndex of
//    0: Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'P';
//    1: Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'V';
//  end;
end;

procedure TFrmCadMarcas.DBEdit2Exit(Sender: TObject);
begin
  if trim(Marca.dataSet.FieldByName('DESCRICAO_EC').AsString) = '' then
    Marca.dataSet.FieldByName('DESCRICAO_EC').AsString :=
      vDadosIni.PrimeiraLetrasMaiusculaCadaPalavra(trim(Marca.dataSet.FieldByName('DESCRICAO_MARCA').AsString));
end;

procedure TFrmCadMarcas.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    Marca._marcaDesmarcaLinha;
end;

procedure TFrmCadMarcas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadMarcas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not Marca.dataSet.IsEmpty then
      Marca._marcaDesmarcaLinha;
end;

procedure TFrmCadMarcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Marca.Cancel;
  Marca.RollBackTransacao;
  Marca.Destroy;
  Action := caFree;
  FrmCadMarcas := nil;
end;

procedure TFrmCadMarcas.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'MARCAS' then
  begin
    if DtmCadBasicos = nil then
      DtmCadBasicos := TDtmCadBasicos.Create(DtmCadBasicos);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end;

  DBGrid1.DataSource := DtmCadBasicos.dsMarcas;
  Marca := TMarcas.create;
  Marca.abreMarcas;
  TelaCadastro := vDadosIni.vTipoForm;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadMarcas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (Marca.dataSet.State in [dsEdit, dsInsert]) then
    begin
    	ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TFrmCadMarcas.FormMarcaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_ESCAPE then
 begin
   if (Marca.dataSet.State in [dsEdit, dsInsert]) then
   begin
     ActiveControl := BitBtn8;
     BitBtn8Click(Sender);
   end;
 end
 else if (key = vk_f2) and CheckCadSeqEC.Enabled then
 begin
   CheckCadSeqEC.Checked := not CheckCadSeqEC.Checked;
   if CheckCadSeqEC.Checked then
   begin
     CheckCadSeqEC.Font.Color := clRed;
     LabelSeqEC.Font.Color := clRed;
   end
   else
   begin
     LabelSeqEC.Font.Color := clTeal;
     CheckCadSeqEC.Font.Color := clTeal;
   end;
 end
end;

procedure TFrmCadMarcas.FormShow(Sender: TObject);
begin
  inherited;
  if (TelaCadastro = 1) or (TelaCadastro = 2) then
    BitBtn3Click(Sender);

  if (TelaCadastro = 6) then
  begin
    BitBtn3.Click;
    Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'V';
    DBComboBox_TipoMarca.ItemIndex := 1;
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  end;
end;

procedure TFrmCadMarcas.LabelSeqECClick(Sender: TObject);
begin
  if CheckCadSeqEC.Tag = 0 then
  begin
    CheckCadSeqEC.Checked := not CheckCadSeqEC.Checked;
    if CheckCadSeqEC.Checked then
    begin
      CheckCadSeqEC.Font.Color := clRed;
      LabelSeqEC.Font.Color := clRed
    end
    else
    begin
      LabelSeqEC.Font.Color := clTeal;
      CheckCadSeqEC.Font.Color := clTeal;
    end;
  end;
end;

procedure TFrmCadMarcas.pnMarcaECEnter(Sender: TObject);
begin
  if not vfocar then
    exit;

  if not vDadosIni.vEcommerce.vHabilitarEcommerce then
    exit;

  vfocar := false;
  TForm(pnMarcaEC).OnKeyDown := FormMarcaKeyDown;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TFrmCadMarcas.SpeedButton1Click(Sender: TObject);
var
  tipo_marca: char;
begin
  if vDadosIni.PesqPros('BAS009', 'EDITAR', '', 'MARCA_PROD', Marca.dataSet.FieldByName('COD_MARCA').AsString, Marca.buscas, true) then
//  if vDadosIni.PesqPros('BAS009', Marca.dataSet.FieldByName('COD_MARCA').AsString, Marca.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;

      DBEdit1.Enabled := false;
      GroupBoxEC.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce);
      pnBotoesEC.Visible := (vDadosIni.vEcommerce.vHabilitarEcommerce);
      vfocar := true;

      if (vDadosIni.vEcommerce.vHabilitarEcommerce) then
      begin
        if not Marca.dataSet.IsEmpty then
        begin
          if Marca.dataSet.FieldByName('ATIVO').AsInteger = 1 then
          begin
            pnMarcaEC.Align := alNone;
            pnMarcaEC.Height := 208;
            pnMarcaEC.Width := 544;
            CheckCadSeqEC.Enabled := false;
            CheckCadSeqEC.Visible := false;
            CheckCadSeqEC.Checked := false;
            LabelSeqEC.Enabled := false;
            LabelSeqEC.Visible := false;

            if not Marca.Edit then
              exit;

            if trim(Marca.dataSet.FieldByName('DESCRICAO_EC').AsString) = '' then
              Marca.dataSet.FieldByName('DESCRICAO_EC').AsString :=
                vDadosIni.PrimeiraLetrasMaiusculaCadaPalavra(trim(Marca.dataSet.FieldByName('DESCRICAO_MARCA').AsString));

            if trim(Marca.dataSet.FieldByName('TIPO_MARCA').asstring) = '' then
            begin
              if ((pos('VEICULO', vDadosIni.vDpto) > 0)) then
              begin
                Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'V';
                DBComboBox_TipoMarca.ItemIndex := 1;
              end
              else
                if (vDadosIni.vSistemasUsuario.vSisVeiculos) then
                begin
                  Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'P';
                  DBComboBox_TipoMarca.ItemIndex := 0;
                end;
            end
            else
            begin
              tipo_marca := Marca.dataSet.FieldByName('TIPO_MARCA').asstring[1];

              case tipo_marca of
                'P': DBComboBox_TipoMarca.ItemIndex := 0;
                'V': DBComboBox_TipoMarca.ItemIndex := 1;
              end;
            end;

            if not vDadosIni.abreForm('Marca', pnMarcaEC, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
            begin
              BitBtn8Click(Sender);
          		Exit;
            end;
          end
          else
            Application.MessageBox('Este registro está na lixeira.' + chr(13) + 'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        end
        else
          Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      end
      else
      begin
        inherited;
        if not Marca.dataSet.IsEmpty then
        begin
          if Marca.dataSet.FieldByName('ATIVO').AsInteger = 1 then
          begin
            pnMarcaEC.Align := alClient;
            PageControl1.ActivePage := TabSheet1;
            TabSheet3.TabVisible := true;
            PageControl3.ActivePage := TabSheet3;
            TabSheet3.Show;
            if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
              DBEdit1.SetFocus
            else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
              DBEdit2.SetFocus;  
            if Marca.Edit then
            begin
              Marca.PreencheCampos;
              TabSheet3.Caption := 'Alterando Marca de Produto';
              if (Marca.dataSet.FieldByName('TIPO_MARCA').IsNull) then
              begin
                Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'P';
                DBComboBox_TipoMarca.ItemIndex := 0;
              end
              else
              begin
              	if trim(Marca.dataSet.FieldByName('TIPO_MARCA').asstring) = '' then
                begin
                  if ((pos('VEICULO', vDadosIni.vDpto) > 0)) then
                  begin
                    Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'V';
                    DBComboBox_TipoMarca.ItemIndex := 1;
                  end
                  else
                    if (vDadosIni.vSistemasUsuario.vSisVeiculos) then
                    begin
                      Marca.dataSet.FieldByName('TIPO_MARCA').AsString := 'P';
                      DBComboBox_TipoMarca.ItemIndex := 0;
                    end;
                end
                else
                begin
                  tipo_marca := Marca.dataSet.FieldByName('TIPO_MARCA').asstring[1];

                  case tipo_marca of
                    'P': DBComboBox_TipoMarca.ItemIndex := 0;
                    'V': DBComboBox_TipoMarca.ItemIndex := 1;
                  end
                end;
              end;

            end;
          end
          else
            Application.MessageBox('Este registro está na lixeira.' + chr(13) + 'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        end
        else
          Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadMarcas.SpeedButton25Click(Sender: TObject);
begin
	inherited;
  if vDadosIni.PesqPros('BAS011', 'ABRIR', '', 'MARCA_PROD', '', Marca.buscas, true) then
  begin
    if not Marca.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [BAS014]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS010]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadMarcas.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    Marca.Delete;
    vStatusLixeira := Marca.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      Marca.Cancel;
      Marca.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadMarcas.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not Marca._restauraLixeira then
    Exit;

  if Marca.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadMarcas.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if Marca.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

initialization
  RegisterClass(TFrmCadMarcas);
finalization
  UnRegisterClass(TFrmCadMarcas);

end.

