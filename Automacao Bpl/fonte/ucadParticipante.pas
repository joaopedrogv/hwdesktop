unit ucadParticipante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, StdCtrls, DBCtrls, AppEvnts, ExtCtrls, Menus,
  ComCtrls, Buttons, Grids, DBGrids, Mask, UclassesColaborador, QRCtrls,
  QuickRpt;

type
  TfrmCadParticipante = class(TfrmCadPadraoM)
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label44: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    SpeedButton15: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBMemo1: TDBMemo;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit38: TDBEdit;
    TabSheet4: TTabSheet;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRSysData2: TQRSysData;
    SummaryBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodosParticipantesClick: TMenuItem;
    DesmarcarTodosParticipantesClick: TMenuItem;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DesmarcarTodosParticipantesClickClick(Sender: TObject);
    procedure MarcarTodosParticipantesClickClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox3DropDown(Sender: TObject);
    procedure DBEdit38KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit38Exit(Sender: TObject);
    procedure DBLookupComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox4DropDown(Sender: TObject);
    procedure DBEdit34KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit34Exit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParticipante: TfrmCadParticipante;
  obParticipante: TParticipante;

implementation

uses uDtmAtivo, uDtmColaborador, UClassesCadastrosBasicos, uDadosIni;

{$R *.dfm}


procedure TfrmCadParticipante.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS396]';
  if vDadosIni.PesqPros('BAS393', '', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not obParticipante.ConsultaCampos('PARTICIPANTE', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not obParticipante.ConsultaCampos('PARTICIPANTE', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if obParticipante.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    obParticipante.ultimasql := obParticipante.dataSet.CommandText;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadParticipante.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS394', '', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
  	exit;

  if not obParticipante.Insert then
    exit;

  ActiveControl := BitBtn3;
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;

  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TfrmCadParticipante.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS399', '', '', 'PARTICIPANTE', obParticipante.dataSet.FieldByName('COD_PARTICIPANTE').AsString, obParticipante.buscas, true) then
  	exit;

  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not obParticipante.Post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obParticipante.vNomeCampoErro, obParticipante.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obParticipante.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadParticipante.BitBtn5Click(Sender: TObject);
begin
  obParticipante.Cancel;
  obParticipante.RollBackTransacao;
  inherited;
end;

procedure TfrmCadParticipante.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obParticipante._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadParticipante.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obParticipante._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadParticipante.DBEdit34Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obParticipante.vCidades.abreCidade;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
        	DBLookupComboBox4.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
  	DBLookupComboBox4.SetFocus;
end;

procedure TfrmCadParticipante.DBEdit34KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vBairros: TBairros;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS402', 'PESQUISAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obParticipante.vBairro.abreBairro;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
        	DBLookupComboBox4.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('BAS403', 'CADASTRAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vBairros.CadBairro(1);
        obParticipante.vBairro.abreBairro;
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadParticipante.DBEdit38Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obParticipante.vCidades.abreCidade;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
        	DBLookupComboBox3.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
  	DBLookupComboBox3.SetFocus;
end;

procedure TfrmCadParticipante.DBEdit38KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCidade: TCidades;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS404', 'PESQUISAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obParticipante.vCidades.abreCidade;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);

        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
        	DBLookupComboBox3.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('BAS405', 'CADASTRAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vCidade.CadCidade(1);
        obParticipante.vCidades.abreCidade;
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadParticipante.DBEdit3Exit(Sender: TObject);
var
  ListaCep : TStringList;
  CEPs : TCEP;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if ((obParticipante.dataSet.FieldByName('END_PARTICIPANTE').IsNull) and
     (obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').IsNull)) then
    begin
      Application.MessageBox(PChar('Endereço do ' + vDadosIni.vPedVnd.descricaoParticipante + ' não informado' + chr(13) +
        'Campo Requerido.'), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);

      if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      	DBEdit3.SetFocus;
    end
    else
    begin
      if (obParticipante.dataSet.FieldByName('COD_BAIRRO').IsNull
        or obParticipante.dataSet.FieldByName('COD_CIDADE').IsNull
        or obParticipante.dataSet.FieldByName('CODIGO_UF').IsNull
        or obParticipante.dataSet.FieldByName('END_PARTICIPANTE').IsNull) then
      begin

        ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString);

        if ListaCep[0] <> '' then
        begin
          if obParticipante.dataSet.FieldByName('COD_BAIRRO').IsNull then
            obParticipante.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
          if obParticipante.dataSet.FieldByName('COD_CIDADE').IsNull then
            obParticipante.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
          if obParticipante.dataSet.FieldByName('CODIGO_UF').IsNull then
            obParticipante.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
          if obParticipante.dataSet.FieldByName('END_PARTICIPANTE').IsNull then
            obParticipante.dataSet.FieldByName('END_PARTICIPANTE').asstring := ListaCep[3];
        end;
      end;

    end;
end;

procedure TfrmCadParticipante.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ListaCEP : TStringList;
  CEPs: TCEP;
  Antes,Depois : string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._AbreCEP;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CEP');
      if vDadosIni.vPesquisa <> '' then
      begin
       antes :=  Copy(vDadosIni.vPesquisa,0,5) + '-';
       depois := Copy(vDadosIni.vPesquisa,6,8);
        obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString := antes+depois;

         ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString);

        if ListaCep[0] <> '' then
        begin
            obParticipante.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
            obParticipante.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
            obParticipante.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
            obParticipante.dataSet.FieldByName('END_PARTICIPANTE').asstring := ListaCep[3];
        end;
      end;

      //	if (Self.Enabled) and (Self.Visible) and (DBEdit34.CanFocus) then
      //		DBEdit34.SetFocus;
    finally
      CEPs.Cancel;
      CEPs.Free;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
    CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._CadCEP(1);
      CEPs._AbreCEP;
      if vDadosIni.vPesquisa <> '' then
      begin
       antes :=  Copy(vDadosIni.vPesquisa,0,5) + '-';
       depois := Copy(vDadosIni.vPesquisa,6,8);
        obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString := antes+depois;

         ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString);

        if ListaCep[0] <> '' then
        begin
            obParticipante.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
            obParticipante.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
            obParticipante.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
            obParticipante.dataSet.FieldByName('END_PARTICIPANTE').asstring := ListaCep[3];
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadParticipante.DBEdit4Exit(Sender: TObject);
var
ListaCep : TStringList;
CEPs : TCEP;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').IsNull then
    begin
      //Application.MessageBox('CEP de cobrança do Colaborador não informado' + chr(13) +
      //  'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      //	if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      //		DBEdit4.SetFocus;
      obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString := '00000-000';
    end
    else
    if obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString <> '00000-000'  then
    begin
      if (obParticipante.dataSet.FieldByName('COD_BAIRRO').IsNull
        or obParticipante.dataSet.FieldByName('COD_CIDADE').IsNull
        or obParticipante.dataSet.FieldByName('CODIGO_UF').IsNull
        or obParticipante.dataSet.FieldByName('END_PARTICIPANTE').IsNull) then
      begin

        ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString);

        if ListaCep[0] <> '' then
        begin
          if obParticipante.dataSet.FieldByName('COD_BAIRRO').IsNull then
            obParticipante.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
          if obParticipante.dataSet.FieldByName('COD_CIDADE').IsNull then
            obParticipante.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
          if obParticipante.dataSet.FieldByName('CODIGO_UF').IsNull then
            obParticipante.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
          if obParticipante.dataSet.FieldByName('END_PARTICIPANTE').IsNull then
            obParticipante.dataSet.FieldByName('END_PARTICIPANTE').asstring := ListaCep[3];
        end;
      end;
    end;
end;

procedure TfrmCadParticipante.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ListaCEP : TStringList;
  CEPs: TCEP;
  Antes,Depois : string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._AbreCEP;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CEP');
      if vDadosIni.vPesquisa <> '' then
      begin
       antes :=  Copy(vDadosIni.vPesquisa,0,5) + '-';
       depois := Copy(vDadosIni.vPesquisa,6,8);
        obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString := antes+depois;

         ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString);

        if ListaCep[0] <> '' then
        begin
            obParticipante.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
            obParticipante.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
            obParticipante.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
            obParticipante.dataSet.FieldByName('END_PARTICIPANTE').asstring := ListaCep[3];
        end;
      end;

      //	if (Self.Enabled) and (Self.Visible) and (DBEdit34.CanFocus) then
      //		DBEdit34.SetFocus;
    finally
      CEPs.Cancel;
      CEPs.Free;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
    CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._CadCEP(1);
      CEPs._AbreCEP;
      if vDadosIni.vPesquisa <> '' then
      begin
       antes :=  Copy(vDadosIni.vPesquisa,0,5) + '-';
       depois := Copy(vDadosIni.vPesquisa,6,8);
        obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString := antes+depois;

         ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString);

        if ListaCep[0] <> '' then
        begin
            obParticipante.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
            obParticipante.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
            obParticipante.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
            obParticipante.dataSet.FieldByName('END_PARTICIPANTE').asstring := ListaCep[3];
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadParticipante.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not obParticipante.Cpf(DBEdit8.text) then
  begin
    Application.MessageBox('CPF Inválido', 'Atenção', MB_ICONWARNING + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
    	DBEdit8.SetFocus
  end;
end;

procedure TfrmCadParticipante.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    obParticipante._marcaDesmarcaLinha;
end;

procedure TfrmCadParticipante.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmCadParticipante.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    if not obParticipante.dataSet.IsEmpty then
      obParticipante._marcaDesmarcaLinha;
end;

procedure TfrmCadParticipante.DBLookupComboBox3DropDown(Sender: TObject);
begin
  inherited;
  obParticipante.vCidades.abreCidade;
end;

procedure TfrmCadParticipante.DBLookupComboBox3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vCidade: TCidades;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS404', 'PESQUISAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obParticipante.vCidades.abreCidade;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
        	DBLookupComboBox3.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('BAS405', 'CADASTRAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vCidade.CadCidade(1);
        obParticipante.vCidades.abreCidade;
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadParticipante.DBLookupComboBox4DropDown(Sender: TObject);
begin
  inherited;
  obParticipante.vBairro.abreBairro;
end;

procedure TfrmCadParticipante.DBLookupComboBox4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vBairros: TBairros;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS402', 'PESQUISAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obParticipante.vBairro.abreBairro;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
        	DBLookupComboBox4.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('BAS403', 'CADASTRAR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vBairros.CadBairro(1);
        obParticipante.vBairro.abreBairro;
        if vDadosIni.vPesquisa <> '' then
          obParticipante.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadParticipante.DesmarcarTodosParticipantesClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obParticipante._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadParticipante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (obParticipante <> nil) then
    obParticipante.Cancel;
  obParticipante.free;

  Action := caFree;
  if (frmCadParticipante <> nil) then
    frmCadParticipante := nil;
end;

procedure TfrmCadParticipante.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  obParticipante := TParticipante.create;
  frmCadParticipante.Caption := vDadosIni.vPedVnd.descricaoParticipante;
  GroupBox1.Caption := 'Dados do ' + vDadosIni.vPedVnd.descricaoParticipante;
  QRLabel1.Caption := 'RELATÓRIO DE ' + UpperCase(vDadosIni.vPedVnd.descricaoParticipante);
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadParticipante.FormShow(Sender: TObject);
  var
  I: Integer;
begin

  DBGrid1.DataSource := dtmColaborador.dsParticipante;
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;
  TabSheet3.Visible := true;
  TabSheet4.TabVisible := false;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to self.ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).CharCase := ecUpperCase;

  end;
  DBEdit14.CharCase := ecLowerCase;
  Label15.Visible := vDadosIni.vPedVnd.comissaoPorVenda;
  DBEdit10.Visible := vDadosIni.vPedVnd.comissaoPorVenda;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "BAS402" PESQUISAR BAIRRO' + #13 +
    'Processo "BAS403" CADASTRAR BAIRRO' + #13 +
    'Processo "BAS404" PESQUISAR CIDADE' + #13 +
    'Processo "BAS405" CADASTRAR CIDADE';
end;

procedure TfrmCadParticipante.MarcarTodosParticipantesClickClick(
  Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obParticipante._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadParticipante.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Participantes');
end;

procedure TfrmCadParticipante.SpeedButton15Click(Sender: TObject);
var
  CEPs: TCEP;
  ListaCep: TStringList;
  Bairros: TListaBairros1;
  Cidades: TListaCidades1;
  Estado: TListaEtados1;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
  	DBEdit3.SetFocus;
  ListaCep := CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(
    obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString);
  //  if(CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(
  //  obColaborador.dataSet.FieldByName('CEP').AsString)[0] = '') then
  if (ListaCep[0] = '') then
  begin
    if (CEPs._ConsultarWebService(obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString)) then
    begin
      ListaCep :=
        CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obParticipante.dataSet.FieldByName('CEP_PARTICIPANTE').AsString);
      if (ListaCep[0] <> '') then
      begin
        Bairros := TListaBairros1.create;
        Bairros.buscas.Close;
        Bairros.buscas.Open;
        Cidades := TListaCidades1.create;
        Cidades.buscas.Close;
        Cidades.buscas.Open;
        Estado := TListaEtados1.create;
        Estado.buscas.Close;
        Estado.buscas.Open;
        obParticipante.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
        obParticipante.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
        obParticipante.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
        obParticipante.dataSet.FieldByName('END_PARTICIPANTE').asstring := ListaCep[3];
        Bairros.Free;
        Bairros := nil;
        Cidades.Free;
        Cidades := nil;
        Estado.Free;
        Estado := nil;
      end;
    end;
  end else if ListaCep[0] <> '' then
  begin
    //    if obColaborador.dataSet.FieldByName('COD_BAIRRO').IsNull then
    obParticipante.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
    //    if obColaborador.dataSet.FieldByName('COD_CIDADE').IsNull then
    obParticipante.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
    //    if obColaborador.dataSet.FieldByName('CODIGO_UF').IsNull then
    obParticipante.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
    //    if obColaborador.dataSet.FieldByName('ENDERECO').IsNull then
    obParticipante.dataSet.FieldByName('END_PARTICIPANTE').asstring := ListaCep[3];
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus;
end;

procedure TfrmCadParticipante.SpeedButton1Click(Sender: TObject);
begin
  if (obParticipante.dataSet.FieldByName('ATIVO').AsInteger <> 1) then
    exit;

  if not vDadosIni.PesqPros('BAS395', 'EDITAR', '', 'PARTICIPANTE', obParticipante.dataSet.FieldByName('COD_PARTICIPANTE').AsString, obParticipante.buscas, true) then
  	Exit;

  if not obParticipante.Edit then
  	Exit;
    
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;

  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmCadParticipante.SpeedButton25Click(Sender: TObject);
begin
	if vDadosIni.PesqPros('BAS400', 'ABRIR A LIXEIRA', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
  begin
    inherited;
    if not obParticipante.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [BAS396]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS397]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;

    obParticipante.ultimasql := obParticipante.dataSet.CommandText;
  end;
end;

procedure TfrmCadParticipante.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    inherited;
    if not obParticipante.Delete then
      Exit;

    vStatusLixeira := obParticipante.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obParticipante.Cancel;
      obParticipante.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadParticipante.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS401', 'IMPRIMIR', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
  begin
    inherited;
    QuickRep1.Preview;
  end;
end;

procedure TfrmCadParticipante.SpeedButton4Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS400', 'ABRIR A LIXEIRA', '', 'PARTICIPANTE', '', obParticipante.buscas, true) then
  begin
    inherited;
    if not obParticipante.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [BAS396]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS397]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TfrmCadParticipante.SpeedButton5Click(Sender: TObject);
begin
	if not obParticipante.restaurarLixeira then
  	Exit;

  if obParticipante.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

end.
