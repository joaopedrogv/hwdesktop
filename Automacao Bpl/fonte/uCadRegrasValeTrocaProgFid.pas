unit uCadRegrasValeTrocaProgFid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UClassesConfig, DBCtrls, Math;

type
  TfrmCadRegrasValeTrocaProgFid = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    Panel4: TPanel;
    DBComboBox1: TDBComboBox;
    Label6: TLabel;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel6: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    RadioGroup3: TRadioGroup;
    SpeedButton19: TSpeedButton;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure atualizarCampo;
    procedure atualizarGrid;
    function _mdiAberto(pNomeFormMDI: string): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRegrasValeTrocaProgFid: TfrmCadRegrasValeTrocaProgFid;
  vRegrasValeTrocaProgFid: TRegrasValeTrocaProgFid;

implementation

uses
  uDtmAtivo, UDtmConfig, uDadosIni, uDataSet_OOP, DB;

{$R *.dfm}

procedure TfrmCadRegrasValeTrocaProgFid.atualizarCampo;
begin
//  Panel5.Visible := (trim(vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString) = 'RESGATE')
//  	 or (trim(vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString) = '');
//  DBComboBox1.Enabled := vRegrasValeTrocaProgFid.dataSet.State = dsInsert;
  if (trim(vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString) = 'TROCA') then
    DBEdit3.Enabled := vRegrasValeTrocaProgFid.dataSet.State = dsInsert;

  DBComboBox1.ItemIndex := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 0, 1);
  Panel6.Visible := (trim(vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString) = 'TROCA');
end;

procedure TfrmCadRegrasValeTrocaProgFid.atualizarGrid;
var
  I: Integer;
begin
  for I := 0 to DBGrid1.FieldCount - 1 do
  begin
    if (DBGrid1.Columns[I].FieldName = 'NUM_FAB_PROD')
      or (DBGrid1.Columns[I].FieldName = 'GRUPO_PROD')
      or (DBGrid1.Columns[I].FieldName = 'COD_PROD')
      or (DBGrid1.Columns[I].FieldName = 'COD_GRADE')
      or (DBGrid1.Columns[I].FieldName = 'DESCR_PROD') then
      DBGrid1.Columns[I].Visible := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, false, true);
  end;
  DBGrid1.DataSource.dataSet.FieldByName('NUM_FAB_PROD').Tag := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 1, 0);
  DBGrid1.DataSource.dataSet.FieldByName('GRUPO_PROD').Tag := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 1, 0);
  DBGrid1.DataSource.dataSet.FieldByName('COD_PROD').Tag := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 1, 0);
  DBGrid1.DataSource.dataSet.FieldByName('COD_GRADE').Tag := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 1, 0);
  DBGrid1.DataSource.dataSet.FieldByName('DESCR_PROD').Tag := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 1, 0);

  DBGrid1.DataSource.dataSet.FieldByName('NUM_FAB_PROD').Visible := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, false, true);
  DBGrid1.DataSource.dataSet.FieldByName('GRUPO_PROD').Visible := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, false, true);
  DBGrid1.DataSource.dataSet.FieldByName('COD_PROD').Visible := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, false, true);
  DBGrid1.DataSource.dataSet.FieldByName('COD_GRADE').Visible := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, false, true);
  DBGrid1.DataSource.dataSet.FieldByName('DESCR_PROD').Visible := vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, false, true);
end;

procedure TfrmCadRegrasValeTrocaProgFid.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('FID017', 'CONSULTA', '', 'REGRAS_VALE_TROCA_PROG_FID', '',
      vRegrasValeTrocaProgFid.buscas, true) then
      Exit;

    inherited;
    if MaskEdit2.Visible then
    begin
      if not vRegrasValeTrocaProgFid.ConsultaCampos('REGRAS_VALE_TROCA_PROG_FID', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        'REGRAS_VALE_TROCA_PROG_FID.* ', '',
        vDadosIni.IfThen(RadioGroup3.ItemIndex = 0,
           ' TIPO = ''RESGATE'' ', ' TIPO = ''TROCA'' ')) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not vRegrasValeTrocaProgFid.ConsultaCampos('REGRAS_VALE_TROCA_PROG_FID', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
      'REGRAS_VALE_TROCA_PROG_FID.* ', '',
      vDadosIni.IfThen(RadioGroup3.ItemIndex = 0,
        ' TIPO = ''RESGATE'' ', ' TIPO = ''TROCA'' ')) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;

    TFloatField(vRegrasValeTrocaProgFid.dataSet.FieldByName('PONTOS')).DisplayFormat := '#,##0';
    TFloatField(vRegrasValeTrocaProgFid.dataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
    TFloatField(vRegrasValeTrocaProgFid.dataSet.FieldByName('VALOR')).currency := true;
  finally
    _GravaConfiguracoesInteger('RadioGroup3', RadioGroup3.ItemIndex);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [FID023]';
    RadioGroup3.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadRegrasValeTrocaProgFid.BitBtn3Click(Sender: TObject);
begin
  try
  	if vDadosIni.vEmp.vConfFormPagamento <> 'PED' then
    begin
      Application.MessageBox('Sistema deve estar configurado para usar forma de pagamento do pedido (REQ, OS, MOT)!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;

    if not vDadosIni.vProgFid.vHabilitarProgFid then
    begin
      Application.MessageBox('Programa de fidelidade desabilitado!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;

    if RadioGroup3.ItemIndex <> 0 then
    begin
      if _mdiAberto('TFrmCadPedVenda') then
        Exit;
    end;
      
    if not vRegrasValeTrocaProgFid.Insert then
      exit;

    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString :=
      vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'RESGATE', 'TROCA');
    atualizarCampo;
//    SpeedButton19.Visible := trim(vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString) <> 'RESGATE';

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;    

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      vRegrasValeTrocaProgFid.Cancel;
      vRegrasValeTrocaProgFid.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadRegrasValeTrocaProgFid.BitBtn4Click(Sender: TObject);
begin
  if not vRegrasValeTrocaProgFid.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(vRegrasValeTrocaProgFid.vNomeCampoErro, vRegrasValeTrocaProgFid.vMensagemErro);
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
      if vRegrasValeTrocaProgFid.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString :=
          vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'RESGATE', 'TROCA');
        atualizarCampo;
        if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
          DBComboBox1.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
          DBEdit3.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          DBEdit1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadRegrasValeTrocaProgFid.BitBtn5Click(Sender: TObject);
begin
  inherited;
  vRegrasValeTrocaProgFid.Cancel;
  vRegrasValeTrocaProgFid.RollBackTransacao;
end;

procedure TfrmCadRegrasValeTrocaProgFid.DBComboBox1Exit(Sender: TObject);
begin
  atualizarCampo;
  if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    DBEdit3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadRegrasValeTrocaProgFid.DBEdit1Exit(Sender: TObject);
var
  vPontos: string;
begin
  vRegrasValeTrocaProgFid.dataSet.FieldByName('PONTOS').AsInteger := Round(vRegrasValeTrocaProgFid.dataSet.FieldByName('PONTOS').AsFloat);
  if vRegrasValeTrocaProgFid.dataSet.FieldByName('PONTOS').AsFloat > 0 then
  begin
    //Atualizar percentual de conversão
    vRegrasValeTrocaProgFid.atualizarTaxaConv;
    vPontos := StringReplace(FloatToStr(vRegrasValeTrocaProgFid.dataSet.FieldByName('PONTOS').AsFloat), '.', '', [rfReplaceAll]);
    vRegrasValeTrocaProgFid.dataSet.FieldByName('VALOR').AsFloat :=
       RoundTo(StrToFloat(vPontos) * vRegrasValeTrocaProgFid.vTaxaConv, -2);
  end;
end;

procedure TfrmCadRegrasValeTrocaProgFid.DBEdit3Exit(Sender: TObject);
var
 vOK: boolean;
 vPontos: string;
begin
   vOK := true;
   try
     if (ActiveControl = BitBtn5) then
       Exit;

     if trim(vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString) = 'RESGATE' then
     begin
       //Atualizar percentual de conversão
       vRegrasValeTrocaProgFid.atualizarTaxaConv;
       vPontos := StringReplace(FloatToStr(vRegrasValeTrocaProgFid.dataSet.FieldByName('PONTOS').AsFloat), '.', '', [rfReplaceAll]);

       vRegrasValeTrocaProgFid.dataSet.FieldByName('VALOR').AsFloat :=
          (StrToFloat(vPontos) * vRegrasValeTrocaProgFid.vTaxaConv);
       exit;
     end;

     if trim(vRegrasValeTrocaProgFid.dataSet.FieldByName('NUM_FAB_PROD').AsString) = '' then
     begin
       vOK := false;
       exit;
     end;

     if not vDadosIni.buscarProduto(
       vRegrasValeTrocaProgFid.dataSet.FieldByName('NUM_FAB_PROD').AsString,
       vRegrasValeTrocaProgFid.dataSet.FieldByName('GRUPO_PROD').AsInteger,
       vRegrasValeTrocaProgFid.dataSet.FieldByName('COD_PROD').AsString,
       vRegrasValeTrocaProgFid.dataSet.FieldByName('COD_GRADE').AsInteger,
       vRegrasValeTrocaProgFid.dataSet.FieldByName('DESCR_PROD').AsString) then
     begin
       vOK := false;
       if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
         DBEdit3.SetFocus;
       exit;
     end;

     vRegrasValeTrocaProgFid.dataSet.FieldByName('NUM_FAB_PROD').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1);
     vRegrasValeTrocaProgFid.dataSet.FieldByName('GRUPO_PROD').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
     vRegrasValeTrocaProgFid.dataSet.FieldByName('COD_PROD').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
     vRegrasValeTrocaProgFid.dataSet.FieldByName('COD_GRADE').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4);
     vRegrasValeTrocaProgFid.dataSet.FieldByName('DESCR_PROD').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 5);
     vRegrasValeTrocaProgFid.dataSet.FieldByName('VALOR').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 6);
     //Atualizar percentual de conversão
     vRegrasValeTrocaProgFid.atualizarTaxaConv;
     vRegrasValeTrocaProgFid.dataSet.FieldByName('PONTOS').AsFloat :=
       (vRegrasValeTrocaProgFid.dataSet.FieldByName('VALOR').AsFloat / vRegrasValeTrocaProgFid.vTaxaConv);
   finally
     if not vOK then
     begin
       vRegrasValeTrocaProgFid.dataSet.FieldByName('GRUPO_PROD').AsInteger := 0;
       vRegrasValeTrocaProgFid.dataSet.FieldByName('COD_PROD').AsString := '';
       vRegrasValeTrocaProgFid.dataSet.FieldByName('COD_GRADE').AsInteger := 0;
       vRegrasValeTrocaProgFid.dataSet.FieldByName('DESCR_PROD').AsString := '';
       vRegrasValeTrocaProgFid.dataSet.FieldByName('VALOR').AsFloat := 0;
       vRegrasValeTrocaProgFid.dataSet.FieldByName('PONTOS').AsFloat := 0;
     end;
   end;
end;

procedure TfrmCadRegrasValeTrocaProgFid.DBEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;

      vRegrasValeTrocaProgFid.dataSet.FieldByName('NUM_FAB_PROD').AsString := vDadosIni.vPesquisa;

    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadRegrasValeTrocaProgFid.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadRegrasValeTrocaProgFid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if (vRegrasValeTrocaProgFid <> nil) then
    vRegrasValeTrocaProgFid.Cancel;

  vRegrasValeTrocaProgFid.free;
  vRegrasValeTrocaProgFid := nil;

  Action := caFree;
  if (frmCadRegrasValeTrocaProgFid <> nil) then
    frmCadRegrasValeTrocaProgFid := nil;
end;

procedure TfrmCadRegrasValeTrocaProgFid.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  vRegrasValeTrocaProgFid := TRegrasValeTrocaProgFid.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  tsCadastro.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadRegrasValeTrocaProgFid.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dsRegrasValeTrocaProgFid;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  RadioGroup3.ItemIndex := vDadosIni.IfThen(
    (_LerConfiguracoesRegistroInteger('RadioGroup3') <> 0) and (_LerConfiguracoesRegistroInteger('RadioGroup3') <> 1),
     0, _LerConfiguracoesRegistroInteger('RadioGroup3'));

  atualizarGrid;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
    lixeiraVazia(not vRegrasValeTrocaProgFid._lixeiraCheia(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'RESGATE', 'TROCA')));
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadRegrasValeTrocaProgFid.RadioGroup3Click(Sender: TObject);
begin
 atualizarGrid;
 lixeiraVazia(not vRegrasValeTrocaProgFid._lixeiraCheia(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'RESGATE', 'TROCA')));
 // setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
 //   vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'VALE', 'TROCA'));
//  configuraShow;
  BitBtn1Click(Sender);
end;

procedure TfrmCadRegrasValeTrocaProgFid.SpeedButton19Click(Sender: TObject);
begin
  vRegrasValeTrocaProgFid.vNumFab := '';
  DBEdit3Exit(Sender);
end;

procedure TfrmCadRegrasValeTrocaProgFid.SpeedButton1Click(Sender: TObject);
begin
  try
  	if vDadosIni.vEmp.vConfFormPagamento <> 'PED' then
    begin
      Application.MessageBox('Sistema deve estar configurado para usar forma de pagamento do pedido (REQ, OS, MOT)!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;

    if not vDadosIni.vProgFid.vHabilitarProgFid then
    begin
      Application.MessageBox('Programa de fidelidade desabilitado!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;
    
    if vRegrasValeTrocaProgFid.dataSet.IsEmpty then
      Exit;

    if not vRegrasValeTrocaProgFid.Edit then
      Exit;
      
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if trim(vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString) = 'RESGATE' then
      DBComboBox1.ItemIndex := 0
    else
      DBComboBox1.ItemIndex := 1;
    DBComboBox1Exit(Sender);  
//    SpeedButton19.Visible := trim(vRegrasValeTrocaProgFid.dataSet.FieldByName('TIPO').AsString) <> 'RESGATE';

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;   

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      vRegrasValeTrocaProgFid.Cancel;
      vRegrasValeTrocaProgFid.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadRegrasValeTrocaProgFid.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('FID022', 'ABRIR A LIXEIRA', '', 'REGRAS_VALE_TROCA_PROG_FID',
    '', vRegrasValeTrocaProgFid.buscas, true) then
    Exit;

  inherited;

  if not vRegrasValeTrocaProgFid._abrelixeira(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'RESGATE', 'TROCA')) then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [FID023]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    RadioGroup3.Enabled := true;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [FID019]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
    RadioGroup3.Enabled := false;
  end;
end;

procedure TfrmCadRegrasValeTrocaProgFid.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    vRegrasValeTrocaProgFid.Delete;
    lixeiraVazia(not vRegrasValeTrocaProgFid._lixeiraCheia(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'RESGATE', 'TROCA')));

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      vRegrasValeTrocaProgFid.Cancel;
      vRegrasValeTrocaProgFid.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadRegrasValeTrocaProgFid.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('FID024', 'RESTAURAR', '', 'REGRAS_VALE_TROCA_PROG_FID', '', vRegrasValeTrocaProgFid.buscas, false) then
    if vRegrasValeTrocaProgFid._restauraLixeira then
      lixeiraVazia(not vRegrasValeTrocaProgFid._lixeiraCheia(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'RESGATE', 'TROCA')));
end;

function TfrmCadRegrasValeTrocaProgFid._mdiAberto(
  pNomeFormMDI: string): Boolean;
var
  x: Byte;
begin
  Result := False;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := True;
        Application.MessageBox('Venda ja esta aberta, feche a janela da venda para utilizar esta funcionalidade', 'Atenção', 64);
        Exit;
      end;
end;

end.
