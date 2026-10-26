unit uCadVendaPerdida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, uClassesVendaPerdida, DB, DBCtrls, QRCtrls, QuickRpt, AppEvnts,
  uCadPadraoModal;

type
  TfrmCadVendaPerdida = class(TfrmCadPadraoM)
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    tsRelVP: TTabSheet;
    qrpVP: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    detalhes: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    lbEmpresa: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    lbTipoVP: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData4: TQRSysData;
    lbNumFab: TQRLabel;
    lbDescricao: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    DBLookupComboBox3: TDBLookupComboBox;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBComboBox1: TDBComboBox;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Label16: TLabel;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    Label17: TLabel;
    Edit3: TEdit;
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrpVPPreview(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrpVPBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function _mdiAberto(pNomeFormMDI: string): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVendaPerdida: TfrmCadVendaPerdida;
  obVP: TVendaPerdida;

implementation

uses
  uDtmAtivo, uDtmVendaPerdida, UClassesProdutos, uDadosIni{, SysInit,UClassesClientes,UclassesColaborador},
  uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadVendaPerdida.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [VND080]';
  if not vDadosIni.PesqPros('VND077', 'PESQUISAR', '', 'VENDA_PERDIDA', '', obVP.buscas, true) then
    Exit;
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if MaskEdit2.Visible then
    begin
      if not obVP.ConsultaCampos('VENDA_PERDIDA', ComboBox1.Text,ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa,1,
        ' VENDA_PERDIDA.*,clientes.nome_cliente ',
        ' left join clientes '+
        ' on VENDA_PERDIDA.cod_cliente=clientes.cod_cliente and VENDA_PERDIDA.cod_empresa=clientes.cod_empresa ','') then
      begin
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          combobox1.setfocus
      end
      else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      	DBGrid1.SetFocus;
    end
    else
    begin
      if (UpperCase(ComboBox1.text)= 'CLIENTE') then
      begin
        if not obVP.ConsultaCampos('VENDA_PERDIDA','CLIENTES', MaskEdit3.text, ComboBox1.Text, combobox3.Text, ComboBox2.text,true, vDadosIni.codEmpresa,
        ' VENDA_PERDIDA.*, clientes.nome_cliente ',
        ' left join clientes '+
        ' on VENDA_PERDIDA.cod_cliente=clientes.cod_cliente '+
        ' and VENDA_PERDIDA.cod_empresa=clientes.cod_empresa ','',true) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          	ComboBox1.SetFocus;
      end
      else if not obVP.ConsultaCampos('VENDA_PERDIDA','VENDA_PERDIDA', MaskEdit3.text, ComboBox1.Text, combobox3.Text, ComboBox2.text,true, vDadosIni.codEmpresa,
        ' VENDA_PERDIDA.*, clientes.nome_cliente ',
        ' left join clientes on VENDA_PERDIDA.cod_cliente=clientes.cod_cliente '+
        ' and VENDA_PERDIDA.cod_empresa=clientes.cod_empresa ','') then
        	if (Self.Enabled) and (Self.Visible) and (Combobox1.CanFocus) then
          	ComboBox1.SetFocus;
    end;
  finally
    Screen.Cursor := crDefault;
    obVP.ultimasql := obVP.dataset.CommandText;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if obVP.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadVendaPerdida.BitBtn2Click(Sender: TObject);
begin
  obVP.Cancel;
  inherited;
end;

procedure TfrmCadVendaPerdida.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VND076', 'INCLUIR', '', 'VENDA_PERDIDA', '', obVP.buscas, true) then
    Exit;
  if not obVP.Insert then
    exit;
  Edit1.Text := obVP.vRVP.vDescProd;
  Edit2.Text := obVP.vRVP.vDescServico;
  Edit3.Text := trim(obVP.vRVP.vNumFabProd);
  Label17.Enabled := True;
  Label8.Enabled := true;
  Label9.Enabled := true;
  Label15.Enabled := true;
  Edit3.Enabled := true;
//  DBEdit3.Enabled := true;
//  DBEdit4.Enabled := true;
  DBEdit8.Enabled := true;
  ActiveControl := BitBtn3;
  inherited;
  PageControl3.ActivePage := TabSheet3;
  obVP.vGrupoProd := 0;
	obVP.vCodProd := '';
  obVP.vCodBarra := '';
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
  	DBLookupComboBox2.SetFocus;
end;

procedure TfrmCadVendaPerdida.BitBtn4Click(Sender: TObject);
var
  vCodTipoVnd: Integer;
  vProdServ: string;
  vCodCliente: Integer;
  vCodVendedor: Integer;
begin
	 vCodTipoVnd := obVP.dataSet.FieldByName('CODIGO_VP').AsInteger;
   vProdServ := obVP.dataSet.FieldByName('TIPOVP').AsString;
   vCodCliente := obVP.dataSet.FieldByName('COD_CLIENTE').AsInteger;
   vCodVendedor := obVP.dataSet.FieldByName('COD_VENDEDOR').AsInteger;

   if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
     BitBtn4.SetFocus;
   if not vDadosIni.PesqPros('VND084', 'INCLUIR', 'COD:'+obVP.dataSet.FieldByName('CODIGO_VP').AsString+
   ' PROD:'+obVP.dataSet.FieldByName('GRUPO_PROD').AsString+
   '-'+obVP.dataSet.FieldByName('COD_PROD').AsString+
   ' DT:'+obVP.dataSet.FieldByName('DATA_VNP').AsString, 'VENDA_PERDIDA', obVP.dataSet.FieldByName('DATA_VNP').AsString, obVP.buscas, true) then
    Exit;
  if not obVP.Post then
    setFocusCampoErro(obVP.vNomeCampoErro,obVP.vMensagemErro)
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obVP.Insert then
      begin
        Edit1.Text := '';
        Edit3.Text := '';
        Edit2.Text := '';

        obVP.dataSet.FieldByName('CODIGO_VP').AsInteger := vCodTipoVnd;
   			obVP.dataSet.FieldByName('TIPOVP').AsString := vProdServ;
		   	obVP.dataSet.FieldByName('COD_CLIENTE').AsInteger := vCodCliente;
			  obVP.dataSet.FieldByName('COD_VENDEDOR').AsInteger := vCodVendedor;
        obVP.vCliVP.ListaClienteVP(obVP.dataSet.FieldByName('COD_CLIENTE').AsInteger);

        Label17.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
        Label8.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
        Label9.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
        Label15.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='S';
        Edit3.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
        //  DBEdit3.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
        //  DBEdit4.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
        DBEdit8.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='S';

        if vProdServ = 'P' then
        begin
        	if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
        		Edit3.SetFocus;
        end
        else if vProdServ = 'S' then
        begin
        	if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
        		DBEdit8.SetFocus;
        end
        else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
        	DBLookupComboBox2.SetFocus;
      end;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadVendaPerdida.BitBtn5Click(Sender: TObject);
begin
  obVP.Cancel;
  if (Self.Enabled) and (Self.Visible) and (BitBtn5.CanFocus) then
    BitBtn5.SetFocus;
  inherited;
end;

procedure TfrmCadVendaPerdida.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  Label17.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
  Label8.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
  Label9.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
  Label15.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='S';
  Edit3.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
//  DBEdit3.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
//  DBEdit4.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
  DBEdit8.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='S';
  if obVP.dataSet.FieldByName('TIPOVP').AsString='P' then
    obVP.dataSet.FieldByName('COD_SERVICO').AsVariant := null
  else begin
    obVP.dataSet.FieldByName('GRUPO_PROD').AsVariant := null;
    obVP.dataSet.FieldByName('COD_PROD').AsVariant := null;
  end;
end;

procedure TfrmCadVendaPerdida.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl=BitBtn5) or (ActiveControl=BitBtn6) then
    exit;
  if (TDbedit(sender).text = '') or (TDbedit(sender).text = '0') then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
      if (Trim(vDadosIni.vPesquisa) = '') then
        obVP.dataSet.FieldByName('COD_CLIENTE').AsVariant:=null
      else obVP.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
    finally
      obVP.vCliVP.ListaClienteVP(obVP.dataSet.FieldByName('COD_CLIENTE').AsInteger);
      Screen.Cursor := crDefault;
    end;
  end
  else
  begin
    obVP.vCliVP.ListaClienteVP(obVP.dataSet.FieldByName('COD_CLIENTE').AsInteger);
    if obVP.vCliVP.IsEmpty then
    	if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
      	TDbedit(sender).SetFocus;
  end;
end;

procedure TfrmCadVendaPerdida.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      obVP.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    try
    if not _mdiAberto('TFrmCadClientes') then
      exit;
    obVP._abrirFormCliente;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        obVP.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
        obVP.vCliVP.ListaClienteVP(obVP.dataSet.FieldByName('COD_CLIENTE').AsInteger);
      except
      end;
    end;
    finally
      vDadosIni.vPesquisa := '';
    end;
  end;
end;

procedure TfrmCadVendaPerdida.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl=BitBtn5) or (ActiveControl=BitBtn6) then
    exit;
  if TDbedit(sender).text = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR');
      if (Trim(vDadosIni.vPesquisa) = '') then
        obVP.dataSet.FieldByName('COD_VENDEDOR').AsVariant:=null
      else obVP.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadVendaPerdida.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      obVP.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.pesquisaRapida('COLABORADOR');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadcolaborador') then
      exit;
    obVP._abrirFormColaborador;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        obVP.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.vPesquisa;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end; 
end;

procedure TfrmCadVendaPerdida.DBEdit8Exit(Sender: TObject);
var
	vCodServico: Integer;
begin
  inherited;
  if (ActiveControl=BitBtn5) or (ActiveControl=BitBtn6) then
    exit;
  if obVP.dataSet.FieldByName('COD_SERVICO').AsInteger=0 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SERVICOS_EMP', ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa, 'Tipo de Serviço');
      if vDadosIni.vPesquisa<>'' then
      begin
        obVP._existeServico(StrToInt(vDadosIni.vPesquisa));
        Edit2.Text := obVP.vRVP.vDescServico;
      end
      else
      	Edit2.Text := '';
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else
  begin
  	vCodServico := obVP.dataSet.FieldByName('COD_SERVICO').AsInteger;
    if not obVP._existeServico(obVP.dataSet.FieldByName('COD_SERVICO').AsInteger) then
    begin
    	obVP.dataSet.FieldByName('COD_SERVICO').AsInteger := vCodServico;
    	Application.MessageBox(PChar('Serviço não encontrado!'), 'Atenção',  0 + 64);
      Edit2.Text := '';
      if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
      	DBEdit8.SetFocus;
    end
    else
    	Edit2.Text := obVP.vRVP.vDescServico;
  end;
end;

procedure TfrmCadVendaPerdida.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SERVICOS_EMP', ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa, 'Tipo de Serviço');
      if vDadosIni.vPesquisa<>'' then
      begin
        obVP._existeServico(StrToInt(vDadosIni.vPesquisa));
//			if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
//        DBEdit8.SetFocus;
        Edit2.Text := obVP.vRVP.vDescServico;
      end else Edit2.Text := '';
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadVendaPerdida.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if (key = VK_RETURN) then
    SpeedButton1Click(Sender);
  if key = VK_DELETE then
    SpeedButton2Click(Sender);
end;

procedure TfrmCadVendaPerdida.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl=BitBtn5) or (ActiveControl=BitBtn6) then
    exit;
  if (Dbedit5.text = '') or (Dbedit5.text = '0') then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR');
      if (Trim(vDadosIni.vPesquisa) = '') then
        obVP.dataSet.FieldByName('COD_VENDEDOR').AsVariant:=null
      else obVP.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.vPesquisa;
    finally
      if obVP.dataSet.FieldByName('COD_VENDEDOR').isnull then
      	if (Self.Enabled) and (Self.Visible) and (Dbedit5.CanFocus) then
        	Dbedit5.SetFocus;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadVendaPerdida.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl=BitBtn5) or (ActiveControl=BitBtn6) then
    exit;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    DBComboBox1.SetFocus;
end;

procedure TfrmCadVendaPerdida.DBLookupComboBox2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F4 then
    obVP.vTipoVP.CadTipoVendaPerdida(1)
  else if Key = VK_F5 then
    obVP.vTipoVP.abreTipoVendaPerdida;
end;

procedure TfrmCadVendaPerdida.Edit3Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl=BitBtn5) or (ActiveControl=BitBtn6) then
    exit;
    
  try
  	if (trim(obVP.vCodBarra) <> trim(Edit3.Text)) then
    begin
     	obVP.vGrupoProd := 0;
      obVP.vCodProd := '';
    end;

    if trim(Edit3.Text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
        begin
        	obVP.vGrupoProd := 0;
          obVP.vCodProd := '';
          if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
            obVP.vGrupoProd := StrToInt(vDadosIni.vPesquisaGrupo_prod);
          if trim(vDadosIni.vPesquisaCod_prod) <> '' then
            obVP.vCodProd := vDadosIni.vPesquisaCod_prod;

          if obVP.existeProduto(vDadosIni.vPesquisa, obVP.vGrupoProd, obVP.vCodProd) then
          begin
            Edit3.Text := trim(obVP.vRVP.vNumFabProd);
            Edit1.Text:= obVP.vRVP.vDescProd;
          end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else
    begin
      if not obVP.existeProduto(trim(Edit3.Text),
        obVP.vGrupoProd,
        obVP.vCodProd) then
      begin
        if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
          Edit3.SetFocus;
        exit;
      end
      else
      begin
        Edit3.Text := trim(obVP.vRVP.vNumFabProd);
        Edit1.Text:= obVP.vRVP.vDescProd;
      end;
    end;
	finally
  	obVP.vCodBarra := trim(Edit3.Text);
    obVP.vGrupoProd := obVP.dataSet.FieldByName('GRUPO_PROD').AsInteger;
    obVP.vCodProd := obVP.dataSet.FieldByName('COD_PROD').AsString;
  end;
end;

procedure TfrmCadVendaPerdida.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vProduto: TProdutos;
  vgrupoprod: Integer;
  vcodprod: string;
begin
  inherited;

	if TelaCadastro <> 1 then // quando = 1 quer dizer que foi chamado pelo Shift F3, sendo assim nao pode deixar abrir novamente o shift + f3
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if vDadosIni.vPesquisa <> '' then
      begin
      	if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        	vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        	vcodprod := vDadosIni.vPesquisaCod_prod;

        if obVP.existeProduto(vDadosIni.vPesquisa, vgrupoprod, vcodprod) then
        begin
          Edit3.Text := trim(obVP.vRVP.vNumFabProd);
	        Edit1.Text:= obVP.vRVP.vDescProd;
          obVP.vCodBarra := trim(Edit3.Text);
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if key = VK_F4 then
  begin
    vProduto := TProdutos.create;
    vProduto.CadProdutos(1);
    if (vDadosIni.vPesquisa <> '') then
    begin
    	if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
      if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        vcodprod := vDadosIni.vPesquisaCod_prod;

      if obVP.existeProduto(vDadosIni.vPesquisa, vgrupoprod, vcodprod) then
      begin
        Edit3.Text := trim(obVP.vNumFabProd);
        Edit1.Text := trim(obVP.vDescrProd);
        obVP.vCodBarra := trim(Edit3.Text);
      end;
    end;
  end;
end;

procedure TfrmCadVendaPerdida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadVendaPerdida := nil;
end;

procedure TfrmCadVendaPerdida.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  obVP := TVendaPerdida.Create;
  DBGrid1.DataSource := dtmVendaPerdida.dsVendaP;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadVendaPerdida.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (obVP.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadVendaPerdida.FormShow(Sender: TObject);
begin
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;
  tsRelVP.TabVisible := false;
  Edit3.Enabled := True;
//  DBEdit3.Enabled := True;
//  DBEdit4.Enabled := True;
//  Edit1.Enabled := True;
  DBComboBox1.Enabled := True;
  inherited;
  if TelaCadastro = 1 then
  begin
    BitBtn3Click(Sender);
    if pos('PESQRAPVNDPERD', vDadosIni.vPesquisa) > 0 then
    begin
      DBComboBox1Exit(DBComboBox1);
      Edit3.Enabled := False;
//      DBEdit3.Enabled := False;
//      DBEdit4.Enabled := False;
      Edit1.Enabled := False;
      DBComboBox1.Enabled := False;
      if obVP.dataSet.State = dsInsert then
      begin
        try
          obVP.vProd.buscaProduto(
          	vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2),
            StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3)),
            vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4));
          obVP.dataSet.FieldByName('grupo_prod').AsInteger := obVP.vProd.dataSet.FieldByName('grupo_prod').AsInteger;
          obVP.dataSet.FieldByName('cod_prod').AsString := obVP.vProd.dataSet.FieldByName('cod_prod').AsString;
          Edit1.Text := obVP.vProd.dataSet.FieldByName('descr_prod').AsString;
          Edit3.Text := trim(obVP.vProd.dataSet.FieldByName('num_fab_prod').AsString);
        except
          on e: Exception do
          begin
            Application.MessageBox(PChar('Não foi possível encontrar o produto. Erro: ' + e.Message), 'Atenção',  0 + 64);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadVendaPerdida.qrpVPBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadVendaPerdida.qrpVPPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Vendas Perdidas');
end;

procedure TfrmCadVendaPerdida.SpeedButton1Click(Sender: TObject);
begin
  if obVP.Edit then
  begin
    inherited;
    TabSheet3.Show;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
    	DBLookupComboBox2.SetFocus;
    Edit1.Text := obVP.vRVP.vDescProd;
    Edit2.Text := obVP.vRVP.vDescServico;
    Edit3.Text := trim(obVP.vRVP.vNumFabProd);
    Label17.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
    Label8.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
    Label9.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
    Label15.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='S';
    Edit3.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
//    DBEdit3.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
//    DBEdit4.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='P';
    DBEdit8.Enabled := obVP.dataSet.FieldByName('TIPOVP').AsString='S';
    obVP.vGrupoProd := obVP.dataSet.FieldByName('GRUPO_PROD').AsInteger;
    obVP.vCodProd := obVP.dataSet.FieldByName('COD_PROD').AsString;
    obVP.vCodBarra := trim(Edit3.Text);
  end;
end;

procedure TfrmCadVendaPerdida.SpeedButton25Click(Sender: TObject);
begin
  inherited;
   if not vDadosIni.PesqPros('VND082', 'ACESSAR', '', 'VENDA_PERDIDA', '', obVP.buscas, true) then
//    if not vDadosIni.PesqPros('VND082', '', obVP.buscas, true) then
    exit;
  if not obVP.AbrirLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [VND080]';
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [VND079]';
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
  end;

end;

procedure TfrmCadVendaPerdida.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  obVP._excluirVP;
  if obVP.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
  obVP.Refresh;
end;

procedure TfrmCadVendaPerdida.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('VND081', 'EMITIR', '', 'VENDA_PERDIDA', '', obVP.buscas, true) then
    obVP.relatorioVendasPerdidas;
end;

procedure TfrmCadVendaPerdida.SpeedButton4Click(Sender: TObject);
begin
  inherited;
SpeedButton25Click(Sender);
end;

procedure TfrmCadVendaPerdida.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if obVP._restaurarRegistro then
  begin
    if obVP.StatusLixeira then
      SpeedButton25.Visible := true
    else begin
      SpeedButton25.Visible := false;
      SpeedButton5.Visible := false;
    end;
  end;
end;

function TfrmCadVendaPerdida._mdiAberto(pNomeFormMDI: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

initialization
  RegisterClass(TfrmCadVendaPerdida);
finalization
  UnRegisterClass(TfrmCadVendaPerdida);

end.

