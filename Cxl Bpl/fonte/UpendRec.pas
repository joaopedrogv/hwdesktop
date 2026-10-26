unit UpendRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, Grids, DBGrids, UClassesPend, StdCtrls,
  Menus, DBClient, IBDatabase;

type
  TFrmPendRec = class(TfrmPadrao)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    imgInformation: TImage;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    PopupMenu1: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    SpeedButton25: TSpeedButton;
    procedure SpeedButton25Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    hrPesquisa, HrFormpag: THandle;
  public
    { Public declarations }
  end;

var
  FrmPendRec: TFrmPendRec;
  Cadpendrec: TPendRecV;

  PrimeiraPesquisa: Boolean;
  TemColunasComPosicaoAlteradas: Boolean;
  vConfigColuna : boolean;
  campoPesquisa: string;
  cdsColunas: TClientDataSet;

  cdsGrid: TClientDataSet;
  GridCfg: TDBGrid;
  ListGridsAndDataSets: TStrings;
  ListPositions: TStrings;

  trans: TIBTransaction;
  vTabela, vCampoPadrao: string;
  fReset, vCtrlClick, vShiftClick: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt,vAlterarNomeDtSet, usuario: string;
  vCamposPadraoRegistro: Boolean;
  
implementation

uses UDtmBalcao, funcoes, uDtmFormPag, uClasseFP, uDadosIni, uDtmAtivo,
  ConsultasUCxl, UPesqCXL, DB, Clipbrd;

{$R *.dfm}

procedure TFrmPendRec.Configurarcolunas1Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas, DBGrid1, GridCfg, cdsGrid, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
end;

procedure TFrmPendRec.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TFrmPendRec.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg, cdsGrid,
    cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  TemColunasComPosicaoAlteradas := True;
end;

procedure TFrmPendRec.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TDBGrid(sender).canvas.Font.color := clWindowText;
  if not (gdFocused in State) then
    if Trim(Cadpendrec.dataSet.FieldByName('STATUS_CXL_RQ').AsString) = 'R' then
    begin
      TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen; // define uma cor de fundo //$00FFD9B3
      TDBGrid(sender).Canvas.FillRect(Rect); // pinta a célula
      TDBGrid(sender).DefaultDrawDataCell(Rect,Column.Field, state); // pinta o texto padrão
    end;
end;

procedure TFrmPendRec.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1Click(Sender);
end;

procedure TFrmPendRec.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
 vDadosIni.DBGridOnTitleClick(DBGrid1,Column);
end;

procedure TFrmPendRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not Assigned(DBGrid1.DataSource) then
    Exit;
  if not Assigned(DBGrid1.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg, cdsGrid,
      cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);

  if TemColunasComPosicaoAlteradas then
  	vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid1, GridCfg, true, ListPositions, cdsGrid);
  //  UnloadPackage(HrFormpag);
  //  UnloadPackage(hrPesquisa);
  action := caFree;
  FrmPendRec := nil;
  Cadpendrec.Free;
end;

procedure TFrmPendRec.FormCreate(Sender: TObject);
begin
  inherited;
  Cadpendrec := TPendRecV.create;
  TemColunasComPosicaoAlteradas := False;
  //  CadPendReq.Open;
  //  CarregaPacote('pkFormPag', HrFormpag);
  //  CarregaPacote('pkativos',hrpesquisa);
  //  if dtmFP = nil then
  //  begin
  //    dtmFP := TdtmFP.Create(Self);
  //    dtmFP.criaDtm;
  //  end;
end;

procedure TFrmPendRec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vShiftClick := Key = VK_SHIFT;
    if Key = VK_RETURN then
    begin
      if ActiveControl <> DBGrid1 then
      	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        	DBGrid1.SetFocus;
    end
    else if key = VK_F2 then
      SpeedButton2Click(SpeedButton2)
    else if key = VK_F3 then
      SpeedButton3Click(SpeedButton3)
    else if key = VK_F4 then
      SpeedButton4Click(SpeedButton4)
    else if key = VK_F5 then
      SpeedButton5Click(SpeedButton5)
    else if key = VK_F6 then
      SpeedButton6Click(SpeedButton6)
    else if key = VK_F7 then
      SpeedButton7Click(SpeedButton7)
    else if key = VK_F9 then	
    	SpeedButton25Click(SpeedButton25);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendRec.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TFrmPendRec.FormShow(Sender: TObject);
var
 I: Integer;
begin
//  DBGrid1.DataSource := DtmBalcao.DtPendRec;
  vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet, GridCfg, DBGrid1, cdsGrid, cdsColunas, trans, ListGridsAndDataSets,
      ListPositions, nomeDTSEt, PrimeiraPesquisa, vCamposPadraoRegistro, usuario);

  inherited;
  Cadpendrec.abrePendRec;
  if not vDadosIni.vRecibo.HabRecPorDepart then
  begin
    Cadpendrec.dataSet.FieldByName('NUM_REC_DEP').Visible := false;
    Cadpendrec.dataSet.FieldByName('NUM_REC_DEP').Tag := 1;
  end
  else
  begin
    Cadpendrec.dataSet.FieldByName('NRECIBO').Visible := false;
    Cadpendrec.dataSet.FieldByName('NRECIBO').Tag := 1;
  end;

  for I := 0 to DBGrid1.FieldCount - 1 do
  begin
    if not vDadosIni.vRecibo.HabRecPorDepart then
    begin
    	if (DBGrid1.Columns[I].FieldName = 'NUM_REC_DEP') then
        DBGrid1.Columns[I].Visible := false;
    end
    else
    begin
    	if (DBGrid1.Columns[I].FieldName = 'NRECIBO') then
        DBGrid1.Columns[I].Visible := false;
    end;
	end;

  Cadpendrec.vTestarDtFechcomDtCaixa := vDadosIni.PesqPros('CXL078','TESTAR','','PEDVENDA', '', Cadpendrec.Buscas, True, False, True);
  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
    'Click no nome da coluna para Ordernar'+ #13 +
    'Shift + Click no nome da coluna para Ordernar por mais de uma coluna' + #13 + #13 +
    'Processo "CXL079" PERMITIR RECEBER DOCUMENTOS COM DATA FECHAMENTO DIFERENTE DA DATA DO CXL' + #13 +
    'Processo "CXL085" PERMITIR REEBER DOCUMENTOS VALOR MENOR CXL';
  if PrimeiraPesquisa then
  begin
    PrimeiraPesquisa := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid1, GridCfg, cdsGrid, cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  end;                  
end;

procedure TFrmPendRec.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid1);
end;

procedure TFrmPendRec.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid1, GridCfg, cdsColunas, cdsGrid, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets, false, ListPositions);
end;

procedure TFrmPendRec.SalvardadosnoExcel1Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid1, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmPendRec.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmPendRec.Somarvaloresdacoluna1Click(Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid1, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmPendRec.SpeedButton1Click(Sender: TObject);
var
//  vFp2: TFormPag2;
  codcondpag, codcliente,codvendedor: integer;
  vFp2: TComunicacaoFormaPagamento;
begin
  inherited;
  try
   if Cadpendrec.ultdiaCXL then
    Exit;
   if Cadpendrec.IsEmpty then
   exit;
   if vDadosIni.PesqPros('CXL036','INICIAR',Cadpendrec.dataSet.fieldbyname('NRECIBO').AsString,
   'RECIBOS',Cadpendrec.dataSet.fieldbyname('NRECIBO').AsString,Cadpendrec.Buscas,True) then
//   if vDadosIni.PesqPros('CXL036', Cadpendrec.dataSet.fieldbyname('NRECIBO').AsString,Cadpendrec.Buscas, True) then
   begin
    Screen.Cursor := crHourGlass;
    codcondpag := 0;

    if not Cadpendrec.verificarRecibo then
     exit;
    if Cadpendrec.dataSet.FieldByName('cod_devedor').asinteger = 0 then
    begin
     messagedlg('Recibo sem o código do cliente informado ',mtinformation,[mbOK],0);
     exit;
    end
    else
    begin
     codcliente := Cadpendrec.dataSet.FieldByName('cod_devedor').AsInteger;
//    codcondpag := Cadpendrec.dataSet.FieldByName('cod_cond_pag').AsInteger;
//    codcliente := Cadpendrec.dataSet.FieldByName('cod_cliente').AsInteger;
     codvendedor := Cadpendrec.dataSet.FieldByName('cod_us').AsInteger;
    end;
    if Cadpendrec.recebendo then
    begin
      if Cadpendrec.marcaRec(1) then
      begin
        vFp2 := TComunicacaoFormaPagamento.Create;
        if vFp2.iniciaFormaPagamento(Cadpendrec.dataSet.FieldByName('NRECIBO').AsInteger,
        codcondpag,0,codcliente,codvendedor,'REC',
        Cadpendrec.dataSet.FieldByName('VALOR_ORIG').AsFloat) then

//        if dtmFP.iniciaFormaPagamento(Cadpendrec.dataSet.FieldByName('NRECIBO').AsInteger,
//          codcondpag, 1, codcliente, vDadosIni.vCodUsuario, 'REC',
//          Cadpendrec.dataSet.FieldByName('VALOR').Value) then
        begin
          // Fazer um teste se gravado, ok senão desfazer a operação....
          Cadpendrec.confirmarecebimento(Cadpendrec.dataSet.FieldByName('VALOR_ORIG').AsFloat);
        end
        else
          Cadpendrec.marcaRec(2);
        vFp2.Free;
      end;
    end
    else
      messagedlg('Documento sendo recebido por outro usuário', mtinformation, [mbOK], 0);
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendRec.SpeedButton25Click(Sender: TObject);
begin
  inherited;
	try
    if Cadpendrec.ultdiaCXL then
      Exit;
    if vDadosIni.PesqPros('CXL088','INICIAR','','','',Cadpendrec.Buscas,True) then
    begin
      Screen.Cursor := crHourGlass;

      vDadosIni.abrirRecibo(1);
      SpeedButton5Click(Sender);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendRec.SpeedButton2Click(Sender: TObject);
var
  vsmrec, vsmnrec: currency;
begin
  inherited;
  try
    if Cadpendrec.ultdiaCXL then
      Exit;
    if vDadosIni.PesqPros('CXL037','SOMAR','','RECIBOS','',Cadpendrec.Buscas,True) then
    begin
      Screen.Cursor := crHourGlass;
      vsmrec := 0.00;
      vsmnrec := 0.00;
      Cadpendrec.first;
      while not Cadpendrec.Eof do
      begin
        if Cadpendrec.dataSet.FieldByName('VL_RQ_PG_CXL').IsNull or
          (Cadpendrec.dataSet.FieldByName('VL_RQ_PG_CXL').AsFloat = 0) then
          vsmnrec := vsmnrec + Cadpendrec.dataSet.FieldByName('VALOR_ORIG').AsFloat
        else
          vsmrec := vsmrec + Cadpendrec.dataSet.FieldByName('VL_RQ_PG_CXL').AsFloat;
        Cadpendrec.next;
      end;
      messagedlg('Valores Recebidos....: ' + format('%n', [vsmrec]) + #13 +
        'Valores Não Recebidos: ' + format('%n', [vsmnrec]), mtinformation, [mbOK], 0);
      Cadpendrec.First;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendRec.SpeedButton3Click(Sender: TObject);
var
  obFp2: TFormPag2;
begin
  inherited;
  try
   if Cadpendrec.ultdiaCXL then
     Exit;
   if not Cadpendrec.verificarRecibo then
     Exit;
   if vDadosIni.PesqPros('CXL038','DETALHAR',Cadpendrec.dataSet.fieldbyname('NRECIBO').AsString,'RECIBOS',
   Cadpendrec.dataSet.fieldbyname('NRECIBO').AsString,Cadpendrec.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    obFp2 := TFormPag2.create;
    obFp2.detalhamentoVenda(Cadpendrec.dataSet.FieldByName('NRECIBO').AsInteger,'','REC');
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendRec.SpeedButton4Click(Sender: TObject);
var
  lconsultaPendRec: TConsultaPendRec;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if Cadpendrec.ultdiaCXL then
      Exit;
    lconsultaPendRec := TConsultaPendrec.Create;
    Application.CreateForm(TFrmPesqCxl, FrmPesqCxl);

    FrmPesqCxl.Caption := 'Consulta de Recibos...';
    FrmPesqCxl.Consulta := lconsultaPendRec;
    FrmPesqCxl.Consulta.CdsPesq := Cadpendrec.dataSet;
    FrmPesqCxl.showmodal;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendRec.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  try
   if Cadpendrec.ultdiaCXL then
    Exit;

    Screen.Cursor := crHourGlass;
    Cadpendrec.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendRec.SpeedButton6Click(Sender: TObject);
var
  obFp: TFormPag2;
begin
  inherited;
  try
   if Cadpendrec.ultdiaCXL then
    Exit;
   if not Cadpendrec.verificarRecibo then
    Exit; 
   if vDadosIni.PesqPros('CXL039','CANCELAR',Cadpendrec.dataSet.fieldbyname('NRECIBO').AsString,'RECIBOS',
   Cadpendrec.dataSet.fieldbyname('NRECIBO').AsString,Cadpendrec.Buscas,True) then
//   if vDadosIni.PesqPros('CXL039', Cadpendrec.dataSet.fieldbyname('NRECIBO').AsString,Cadpendrec.Buscas, True) then
   begin
    Screen.Cursor := crHourGlass;
    obFp := TFormPag2.create;
    if Application.MessageBox('Deseja realmente Cancelar recebimento desta Documento?',
      'Confirmação', MB_YESNO + MB_DEFBUTTON2) = mrYES then
    begin
      if obFp.cancelaVenda(Cadpendrec.dataSet.FieldByName('NRECIBO').AsInteger, 'REC') then
      begin
        Cadpendrec.marcaRec(2);
      end;
    end;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendRec.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendRec.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

