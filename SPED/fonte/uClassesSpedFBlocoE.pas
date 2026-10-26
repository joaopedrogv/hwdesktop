unit uClassesSpedFBlocoE;

interface

uses
  uDataSet_OOP, DB, DBClient, StdCtrls, IBQuery;

type
  TIcmsInterDifal                     = class;
  TIcmsInterDifalAjustes              = class;
  TIcmsInterDifalAjustes_InfAd        = class;
  TIcmsInterDifalAjustes_InfDoc       = class;
  TIcmsInterDifalAjustes_InfDoc_NF    = class;
  TIcmsInterDifalAjustes_InfDoc_NF_It = class;
  TIcmsInterDifalObrigacoesDifal      = class;

  TIcmsInterDifal = class(TDataSet_OOP)
  protected
    fIcmAj: TIcmsInterDifalAjustes;
    procedure blobGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure setIcmsAJ(pIcmsAj: TIcmsInterDifalAjustes);
  public
    property IcmAj: TIcmsInterDifalAjustes read fIcmAj write fIcmAj;
  end;

  TIcmsInterDifalAjustes_InfDoc_NF_It = class(TIcmsInterDifal)
  private
    fDados: TIBQuery;
    fCampos: string;
    fDataS: TDataSource;
  public
    destructor Destroy; override;
    constructor create;
    procedure selecionarRegistros;
    procedure pesquisarRegistros;

    property dados: TIBQuery read fDados write fDados;
    property dataS: TDataSource read fDataS write fDataS;
  end;

  TIcmsInterDifalAjustes_InfDoc_NF = class(TIcmsInterDifal)
  private
    fDados: TIBQuery;
    fItens: TIcmsInterDifalAjustes_InfDoc_NF_It;
    fCampos: string;
    fDataS: TDataSource;
  public
    destructor Destroy; override;
    constructor create;
    procedure selecionarRegistros;
    procedure pesquisarRegistros(pDataIni, pDadaFim: string; pNumNF: Integer);

    property dados: TIBQuery read fDados write fDados;
    property dataS: TDataSource read fDataS write fDataS;
    property itens: TIcmsInterDifalAjustes_InfDoc_NF_It read fItens write fItens;
  end;

  TIcmsInterDifalAjustes_InfDoc = class(TIcmsInterDifal)
  private
    fDataSetView: TClientDataSet;
    fContadorInsert: Integer;
    fContadorEdit: Integer;
    fNotas: TIcmsInterDifalAjustes_InfDoc_NF;

  public
    destructor Destroy; override;
    constructor create;
    function insert: boolean; override;

    function editar: Boolean;
    function inserir: Boolean;
    function salvar: Boolean;
    function excluir: Boolean;
    function cancela: Boolean;

    procedure selecionarRegistros;
    procedure setDadosNF;
    procedure setDadosNFItens;
    procedure clearDadosNFItens;

    property notas: TIcmsInterDifalAjustes_InfDoc_NF read fNotas write fNotas;
    property DataSetView: TClientDataSet read fDataSetView write fDataSetView;
  end;

  TIcmsInterDifalAjustes_InfAd = class(TIcmsInterDifal)
  private
    fContadorInsert: Integer;
    fIndProc: TDadosLookUp_OOP;
  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; override;
    function insert: boolean; override;
    procedure selecionarRegistros;

    property indProc: TDadosLookUp_OOP read fIndProc write fIndProc;
  end;

  TIcmsInterDifalAjustes = class(TIcmsInterDifal)
  private
    fInfAd: TIcmsInterDifalAjustes_InfAd;
    fInfDoc: TIcmsInterDifalAjustes_InfDoc;
    fEstado: TDadosLookUp_OOP;
  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; override;
    function delete: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;

    procedure abreForm(pTipoForm: Integer = 0);

    property infAd :  TIcmsInterDifalAjustes_InfAd read fInfAd  write fInfAd;
    property infDoc: TIcmsInterDifalAjustes_InfDoc read fInfDoc write fInfDoc;
    property estado: TDadosLookUp_OOP              read fEstado write fEstado;
  end;

  TIcmsInterDifalObrigacoesDifal = class(TIcmsInterDifal)
  private
    fIndProc: TDadosLookUp_OOP;
    fCodOR: TDadosLookUp_OOP;
    fEstado: TDadosLookUp_OOP;
  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; override;
    function delete: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;

    procedure abreForm(pTipoForm: Integer = 0);

    property estado: TDadosLookUp_OOP read fEstado write fEstado;
    property indProc: TDadosLookUp_OOP read fIndProc write fIndProc;
    property codOR: TDadosLookUp_OOP read fCodOR write fCodOR;
  end;

var
  vIcmInterAj: TIcmsInterDifalAjustes;
  vIcmInterOb: TIcmsInterDifalObrigacoesDifal;

implementation

uses uDtmSPED, uDtmAtivo, IBDatabase, Forms, Windows, SysUtils,
  uCadSpedFIcmsInterAjustes, Variants, uDadosIni, Classes, IBCustomDataSet, 
  uCadSpedFObrigacoesDIFAL;


{ TIcmsInterDifal }

procedure TIcmsInterDifal.blobGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 64);
end;

procedure TIcmsInterDifal.setIcmsAJ(pIcmsAj: TIcmsInterDifalAjustes);
begin
  fIcmAj := TIcmsInterDifalAjustes(pIcmsAj);
end;

{ TIcmsInterDifalAjustes }

procedure TIcmsInterDifalAjustes.abreForm(pTipoForm: Integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Ajustes / Beneficio / Incentivo Difal...');
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('SPED094', 'CONSULTA', '', 'SPED_F_ICMINTER_AJ', '',
    dtmSPED.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmSpedFIcmsInterAjustes = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmSpedFIcmsInterAjustes, frmSpedFIcmsInterAjustes);
  end;

  if (pTipoForm > 0) and (not frmSpedFIcmsInterAjustes.Visible) then
    frmSpedFIcmsInterAjustes.ShowModal
  else if (not frmSpedFIcmsInterAjustes.Visible) then
    frmSpedFIcmsInterAjustes.Show
  else if frmSpedFIcmsInterAjustes.FormStyle = fsMDIChild then
    frmSpedFIcmsInterAjustes.Show
  else
    frmSpedFIcmsInterAjustes.ShowModal;
end;

constructor TIcmsInterDifalAjustes.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsICMInterAJ);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);

  infAd := TIcmsInterDifalAjustes_InfAd.Create;
  infDoc := TIcmsInterDifalAjustes_InfDoc.Create;
  infAd.setIcmsAJ(TIcmsInterDifalAjustes(Self));
  infDoc.setIcmsAJ(TIcmsInterDifalAjustes(Self));
  infDoc.notas.setIcmsAJ(TIcmsInterDifalAjustes(Self));
  infDoc.notas.itens.setIcmsAJ(TIcmsInterDifalAjustes(Self));
  fEstado := TDadosLookUp_OOP.create;
end;

function TIcmsInterDifalAjustes.delete: boolean;
var
  vRno: integer;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED099', 'EXCLUIR', 'UF/CODAJ ' + dataSet.FieldByName('UF').AsString + dataSet.FieldByName('COD_AJ_APUR').AsString,
    'SPED_F_ICMINTER_AJ', dataSet.FieldByName('SEQID').AsString, buscas) then
    exit;

  if Application.MessageBox('Deseja mesmo excluir definitivamente o registro?', 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) <> ID_YES then
    Exit;
  try
    buscas.Close;
    buscas.SQL.Text := 'delete from SPED_F_ICMINTER_AJ' +
      ' where seqid = ' + IntToStr(dataSet.FieldByName('seqid').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('SPED099', 'EXCLUIR', 'SUCESSO', 'SPED_F_ICMINTER_AJ', '', buscas);

    vRno := dataSet.RecNo;
    dataSet.Close;
    dataSet.Open;

    if dataSet.RecordCount >=  vRno then
      dataSet.RecNo := vRno;

  except
    on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao excluir registro. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TIcmsInterDifalAjustes.delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TIcmsInterDifalAjustes.Destroy;
begin
  FreeAndNil(fInfAd);
  FreeAndNil(fInfDoc);
  FreeAndNil(fEstado);
  inherited;
end;

function TIcmsInterDifalAjustes.edit: boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED097', 'ALTERAR', 'UF/CODAJ ' + dataSet.FieldByName('UF').AsString + dataSet.FieldByName('COD_AJ_APUR').AsString,
    'SPED_F_ICMINTER_AJ', dataSet.FieldByName('SEQID').AsString, buscas) then
    exit;

  result := inherited edit;
  if Result then
  begin
    infAd.selecionarRegistros;
    infDoc.selecionarRegistros;
  end;
end;

function TIcmsInterDifalAjustes.insert: boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('SPED096', 'INSERIR', '',
    'SPED_F_ICMINTER_AJ', '', buscas) then
    exit;

  if not dataSet.Active then
    montaSelect('select * from SPED_F_ICMINTER_AJ where seqid = 0 and cod_empresa = ' + vDadosIni.codEmpresa);

  result := inherited insert;
  if Result then
  begin
    infAd.selecionarRegistros;
    infDoc.selecionarRegistros;
  end;
end;

function TIcmsInterDifalAjustes.post: boolean;
var
  acao: string;
begin
  try

    Result := false;
    acao := vDadosIni.IfThen(dataSet.State = dsInsert, 'INSERIR', 'EDITAR');

    if not vDadosIni.PesqPros('SPED098', acao, 'UF/CODAJ ' + dataSet.FieldByName('UF').AsString + dataSet.FieldByName('COD_AJ_APUR').AsString,
      'SPED_F_ICMINTER_AJ', dataSet.FieldByName('SEQID').AsString, buscas) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    checkFieldEmpty('uf',          'Campo UF de preenchimento obrigatorio',               'DBLookupComboBox2');
    checkFieldEmpty('cod_aj_apur', 'Campo Codigo de ajuste de preenchimento obrigatorio', 'DBEdit1');
    checkFieldEmpty('vl_aj_apur',  'Campo Valor de ajuste de preenchimento obrigatorio',  'DBEdit3');
    checkFieldEmpty('data_lanc',   'Campo Data de preenchimento obrigatorio',             'DBEdit18');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('seqid').AsInteger := Gencodigo('SPED_F_ICMINTER_AJ', buscas, vDadosIni.codEmpresa);
      dataSet.FieldByName('data_cad').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);

      infAd.dataSet.First;
      while not infAd.dataSet.Eof do
      begin
        infAd.dataSet.Edit;
        infAd.dataSet.FieldByName('seqid_aj').AsInteger := dataSet.FieldByName('seqid').AsInteger;
        infAd.dataSet.Post;
        infAd.dataSet.Next;
      end;

      infDoc.dataSet.First;
      while not infDoc.dataSet.Eof do
      begin
        infDoc.dataSet.Edit;
        infDoc.dataSet.FieldByName('seqid_aj').AsInteger := dataSet.FieldByName('seqid').AsInteger;
        infDoc.dataSet.Post;
        infDoc.dataSet.Next;
      end;
    end;

    try
      infAd.dataSet.DisableControls;
      infDoc.dataSet.DisableControls;

      infAd.dataSet.Filter := 'seqid <= 0';
      infAd.dataSet.Filtered := True;
      infAd.dataSet.First;
      while not infAd.dataSet.IsEmpty do
      begin
        infAd.dataSet.Edit;
        infAd.dataSet.FieldByName('seqid').AsInteger := Gencodigo('SPED_F_ICMINTER_AJ_INF_AD', buscas, vDadosIni.codEmpresa);
        infAd.dataSet.Post;
      end;

      infDoc.dataSet.Filter := 'seqid <= 0';
      infDoc.dataSet.Filtered := True;
      infDoc.dataSet.First;
      while not infDoc.dataSet.IsEmpty do
      begin
        infDoc.dataSet.Edit;
        infDoc.dataSet.FieldByName('seqid').AsInteger := Gencodigo('SPED_F_ICMINTER_AJ_INF_DOC', buscas, vDadosIni.codEmpresa);
        infDoc.dataSet.Post;
      end;
    finally
      infAd.dataSet.Filtered := False;
      infDoc.dataSet.Filtered := False;
      infAd.dataSet.EnableControls;
      infDoc.dataSet.EnableControls;
    end;

    dataSet.Post;

    if (dataSet.ChangeCount = 0) and (infAd.dataSet.ChangeCount = 0) and (infDoc.dataSet.ChangeCount = 0) then
    begin
      Result := True;
      exit;
    end;

    Result := True;

    if (Result) and (dataSet.ChangeCount > 0) then Result := Apply;
    if (Result) and (infAd.dataSet.ChangeCount > 0) then Result := infAd.Apply;
    if (Result) and (infDoc.dataSet.ChangeCount > 0) then Result := infDoc.Apply;

    if not Result then
      Exit;

    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED098', acao, 'SUCESSO', 'SPED_F_ICMINTER_AJ', '', buscas);

    Refresh;
  except
    on E: Exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao excluir registro. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TIcmsInterDifalAjustes.delete Erro: ' + e.Message);
    end;
  end;
end;

{ TIcmsInterDifalAjustes_InfAd }

constructor TIcmsInterDifalAjustes_InfAd.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsICMInterAJ_Inf);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);

  fIndProc := TDadosLookUp_OOP.create;

  dataSet.FieldByName('PROC').OnGetText := blobGetText;
  dataSet.FieldByName('TXT_COMPL').OnGetText := blobGetText;
  dataSet.IndexFieldNames := 'SEQID';
end;

destructor TIcmsInterDifalAjustes_InfAd.Destroy;
begin
  FreeAndNil(fIndProc);
  inherited;
end;

function TIcmsInterDifalAjustes_InfAd.insert: boolean;
begin
  Result := False;
  if not dataSet.Active then
    selecionarRegistros;

  Result := inherited insert;

  if Result then
  begin
    fContadorInsert := fContadorInsert + 1;
    dataSet.FieldByName('seqid_aj').AsInteger := fIcmAj.dataSet.FieldByName('seqid').AsInteger;
    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('seqid').AsInteger := fContadorInsert; // antes de gravar no banco vai setar o seqid correto
  end;
end;

function TIcmsInterDifalAjustes_InfAd.post: boolean;
begin
  Result := False;
//    if not vDadosIni.PesqPros('SPED027', acao, 'COD REC OU CRED ' + dataSet.FieldByName('COD_REC_CRED').AsString,
//      'SPED_OUTRAS_RECEITAS_CREDITOS', '', buscas, True) then
//      exit;
  Result := inherited Post;
  dataSet.IndexFieldNames := 'SEQID';
end;

procedure TIcmsInterDifalAjustes_InfAd.selecionarRegistros;
begin
  montaSelect('select * from SPED_F_ICMINTER_AJ_INF_AD' +
    ' where seqid_aj = ' + IntToStr(fIcmAj.dataSet.FieldByName('seqid').AsInteger) +
    ' and cod_empresa = ' + IntToStr(fIcmAj.dataSet.FieldByName('cod_empresa').AsInteger));

  fContadorInsert := -999999;
end;

{ TIcmsInterDifalAjustes_InfDoc }

function TIcmsInterDifalAjustes_InfDoc.cancela: Boolean;
begin
  fDataSetView.Cancel;
  Result := True;
end;

procedure TIcmsInterDifalAjustes_InfDoc.clearDadosNFItens;
begin
  fDataSetView.FieldByName('nitem_nf').Value       := Null;
  fDataSetView.FieldByName('tipo_item').Value      := Null;
  fDataSetView.FieldByName('num_fab_prod').Value   := Null;
  fDataSetView.FieldByName('descricao_item').Value := Null;
end;

constructor TIcmsInterDifalAjustes_InfDoc.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsICMInterAJ_Doc);
  fDataSetView := TClientDataSet(dtmSPED.cdsICMInterAJ_DocV);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);

  fNotas := TIcmsInterDifalAjustes_InfDoc_NF.create;

  if not fDataSetView.Active then
    fDataSetView.CreateDataSet;
end;

destructor TIcmsInterDifalAjustes_InfDoc.Destroy;
begin
  FreeAndNil(fNotas);
  inherited;
end;

function TIcmsInterDifalAjustes_InfDoc.editar: Boolean;
begin
  Result := False;
  if fDataSetView.IsEmpty then
    Exit;

  fDataSetView.Edit;
  fContadorEdit := fDataSetView.FieldByName('seqid').AsInteger;
  Result := True;
end;

function TIcmsInterDifalAjustes_InfDoc.excluir: Boolean;
begin
  Result := False;
  if fDataSetView.IsEmpty then
    Exit;

  fContadorEdit := fDataSetView.FieldByName('seqid').AsInteger;

  if not dataSet.Locate('SEQID', fContadorEdit, []) then
    raiseExceptionCreate('Nao foi possivel encotrar o registro', '');

  dataSet.Delete;
  fDataSetView.Delete;

  Result := True;
end;

function TIcmsInterDifalAjustes_InfDoc.inserir: Boolean;
begin
  fDataSetView.Append;
  Result := True;
end;

function TIcmsInterDifalAjustes_InfDoc.insert: boolean;
begin
  Result := False;
  if not dataSet.Active then
    selecionarRegistros;

  Result := inherited insert;

  if Result then
  begin
    fContadorInsert := fContadorInsert + 1;
    dataSet.FieldByName('seqid_aj').AsInteger := fIcmAj.dataSet.FieldByName('seqid').AsInteger;
    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('seqid').AsInteger := fContadorInsert; // antes de gravar no banco vai setar o seqid correto
  end;
end;

function TIcmsInterDifalAjustes_InfDoc.salvar: Boolean;
var
  acao: string;
begin
  Result := False;
  try
    acao := vDadosIni.IfThen(fDataSetView.State = dsInsert, 'INSERIR', 'EDITAR');

    checkFieldEmpty('cod_nf', 'Nota Fiscal deve ser informada', '', TDataSet(fDataSetView));
    checkFieldEmpty('vl_aj_item', 'Valor do ajuste deve ser informado', '', TDataSet(fDataSetView));

    if acao = 'INSERIR' then
      Result := insert
    else
    begin
      if dataSet.Locate('SEQID', fContadorEdit, []) then
        Result := Edit
      else
        raiseExceptionCreate('Nao foi possivel encotrar o registro', '');
    end;
    fDataSetView.FieldByName('seqid').AsInteger := dataset.FieldByName('seqid').AsInteger;

    if Result then
    begin
      dataSet.FieldByName('cod_nf').AsInteger := fDataSetView.FieldByName('cod_nf').AsInteger;
      dataSet.FieldByName('nitem_nf').Value := fDataSetView.FieldByName('nitem_nf').Value;
      dataSet.FieldByName('vl_aj_item').AsFloat := fDataSetView.FieldByName('vl_aj_item').AsFloat;
      dataSet.Post;
    end;
    fDataSetView.Post;

    Result := True;

  except
    on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao savar registro. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TIcmsInterDifalAjustes_InfDoc.salvar Erro: ' + e.Message);
    end;
  end;
end;

procedure TIcmsInterDifalAjustes_InfDoc.selecionarRegistros;
begin
  montaSelect('select * from SPED_F_ICMINTER_AJ_INF_DOC' +
    ' where seqid_aj = ' + IntToStr(fIcmAj.dataSet.FieldByName('seqid').AsInteger) +
    ' and cod_empresa = ' + IntToStr(fIcmAj.dataSet.FieldByName('cod_empresa').AsInteger));

  fDataSetView.EmptyDataSet;
  dataSet.First;
  while not dataSet.Eof do
  begin
    notas.selecionarRegistros;

    fDataSetView.Append;
    setDadosNF;
    setDadosNFItens;

    fDataSetView.FieldByName('seqid').AsInteger := dataset.FieldByName('seqid').AsInteger;
    fDataSetView.FieldByName('vl_aj_item').AsFloat := dataset.FieldByName('vl_aj_item').AsFloat;
    fDataSetView.Post;
    dataSet.Next;
  end;
  fDataSetView.IndexFieldNames := 'seqid';
  fContadorInsert := -99999;
  fContadorEdit := 0;
end;

procedure TIcmsInterDifalAjustes_InfDoc.setDadosNF;
begin
  if fDataSetView.FieldByName('cod_nf').AsInteger <> notas.dados.FieldByName('codnf').AsInteger then
    clearDadosNFItens;
  fDataSetView.FieldByName('cod_nf').AsInteger      := notas.dados.FieldByName('codnf').AsInteger;
  fDataSetView.FieldByName('cod_cliente').AsInteger := notas.dados.FieldByName('codcli').AsInteger;
  fDataSetView.FieldByName('num_nf').AsInteger      := notas.dados.FieldByName('num nf').AsInteger;
  fDataSetView.FieldByName('modelo_nf').AsString    := vDadosIni.Right(Trim(notas.dados.FieldByName('modelo').AsString), 2);
  fDataSetView.FieldByName('serie').AsString        := notas.dados.FieldByName('serie').AsString;
  fDataSetView.FieldByName('subserie').AsString     := notas.dados.FieldByName('subserie').AsString;
  fDataSetView.FieldByName('nome_cliente').AsString := notas.dados.FieldByName('cliente').AsString;
  fDataSetView.FieldByName('razao').AsString        := notas.dados.FieldByName('Cliente Razao Social').AsString;
  fDataSetView.FieldByName('chave_nfe').AsString    := notas.dados.FieldByName('Chave NFe').AsString;
  fDataSetView.FieldByName('data_lanc').AsDateTime  := notas.dados.FieldByName('data doc').AsDateTime;
end;

procedure TIcmsInterDifalAjustes_InfDoc.setDadosNFItens;
begin
  fDataSetView.FieldByName('nitem_nf').Value       := notas.itens.dados.FieldByName('n item').Value;
  fDataSetView.FieldByName('tipo_item').Value      := notas.itens.dados.FieldByName('tp it').Value;
  fDataSetView.FieldByName('num_fab_prod').Value   := notas.itens.dados.FieldByName('Codigo Item').Value;
  fDataSetView.FieldByName('descricao_item').Value := notas.itens.dados.FieldByName('Descricao Item').Value;
end;

{ TIcmsInterDifalAjustes_InfDoc_NF }

constructor TIcmsInterDifalAjustes_InfDoc_NF.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);
  buscas := TIBQuery(dtmSPED.qrBuscas);
  fDados := TIBQuery.Create(Application);
  fDados.Database := buscas.Database;
  fDados.Transaction := buscas.Transaction;
  fItens := TIcmsInterDifalAjustes_InfDoc_NF_It.create;
  fDataS := TDataSource.Create(Application);
  fDataS.AutoEdit := False;
  fDataS.DataSet := fDados;

  fCampos :=
    ' nf.num_nf "Num NF", nf.data_lanc "Data Doc", nf.valor_total "Vl Total",' +
    ' cl.nome_cliente "Cliente", cl.razao "Cliente Razao Social",' +
    ' nf.modelo_nf "Modelo", nf.serie "Serie", nf.subserie "Subserie", nf.chave_nfe "Chave NFe",' +
    ' nf.cod_nf "CodNf", nf.cod_cliente "CodCli"';
end;

destructor TIcmsInterDifalAjustes_InfDoc_NF.Destroy;
begin
  FreeAndNil(fItens);
  FreeAndNil(fDados);
  FreeAndNil(fDataS);
  inherited;
end;

procedure TIcmsInterDifalAjustes_InfDoc_NF.pesquisarRegistros(pDataIni, pDadaFim: string; pNumNF: Integer);
var
  I: Integer;
begin
  dados.Close;
  dados.SQL.Text := 'select ' + fCampos +
    ' from notafiscal nf' +
    ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
    ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim ' +
    ' and nf.emissao_propria = ''S'' and nf.situacao_nfe = ''Autorizada'' and nf.nfe_iddest = 2' +
    ' and nf.cod_empresa = ' + vDadosIni.codEmpresa;
  if pNumNF > 0 then
    dados.SQL.Text := dados.SQL.Text + ' and nf.num_nf = ' + IntToStr(pNumNF);
  dados.SQL.Text := dados.SQL.Text + ' order by nf.data_lanc, nf.num_nf';
  dados.ParamByName('dataIni').AsDate := StrToDate(pDataIni);
  dados.ParamByName('dataFim').AsDate := StrToDate(pDadaFim);
  dados.Open;
  
  for I := 0 to dados.Fields.Count - 1 do
    if dados.Fields[i] is TFloatField then
      TFloatField(dados.Fields[i]).DisplayFormat := '##0.00';
end;

procedure TIcmsInterDifalAjustes_InfDoc_NF.selecionarRegistros;
begin
  dados.Close;
  dados.SQL.Text := 'select ' + fCampos +
    ' from notafiscal nf' +
    ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
    ' where nf.cod_nf = ' + IntToStr(IcmAj.infDoc.dataSet.FieldByName('cod_nf').AsInteger) +
    ' and nf.cod_empresa = ' + IntToStr(IcmAj.infDoc.dataSet.FieldByName('cod_empresa').AsInteger) +
    ' order by nf.data_lanc, nf.num_nf';
  dados.Open;

  itens.selecionarRegistros;
end;

{ TIcmsInterDifalAjustes_InfDoc_NF_It }

constructor TIcmsInterDifalAjustes_InfDoc_NF_It.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);
  buscas := TIBQuery(dtmSPED.qrBuscas);
  fDados := TIBQuery.Create(Application);
  fDados.Database := buscas.Database;
  fDados.Transaction := buscas.Transaction;
  fDataS := TDataSource.Create(Application);
  fDataS.AutoEdit := False;
  fDataS.DataSet := fDados;
  

  fCampos :=
    ' nfi.nitem "N Item", nfi.tipo_item "Tp It", nfi.num_fab_prod "Codigo Item",' +
    ' case when nfi.tipo_item = ''O'' then cast(substring(nfi.descricao_item_outras from 1 for 75) as varchar(75)) else nfi.descricao_item end "Descricao Item",' +
    ' nfi.quantidade "Qtde", nfi.valor_unitario "Vl Unit", nfi.valor_total "Vl Total",' +
    ' nfi.cst "CST ICMS", nfi.csosn, nfi.codigo_nop "CFOP", nfi.base_icm "Base ICMS", nfi.aliq_icm "Aliq ICMS",nfi.valor_icm "Valor ICMS",' +
    ' nfi.VBCUFDEST "BC UF Dest", nfi.PFCPUFDEST "Perc FCP", nfi.PICMSUFDEST "Perc ICMS UF Dest", nfi.PICMSINTER "Perc ICMS UF Inter",' +
    ' nfi.PICMSINTERPART "Per ICMS Partilha", nfi.VFCPUFDEST "Vl FCO", nfi.VICMSUFDEST "Vl ICMS UF Dest",' +
    ' nfi.VICMSUFREMET "Vl ICMS UF Remetente"';
end;

destructor TIcmsInterDifalAjustes_InfDoc_NF_It.Destroy;
begin
  FreeAndNil(fDados);
  FreeAndNil(fDataS);
  inherited;
end;

procedure TIcmsInterDifalAjustes_InfDoc_NF_It.pesquisarRegistros;
var
  I: Integer;
begin
  dados.Close;
  dados.SQL.Text := 'select ' + fCampos +
    ' from notafiscal_item nfi' +
    ' where cod_nf = ' + IntToStr(fIcmAj.infDoc.DataSetView.FieldByName('cod_nf').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  dados.Open;

  for I := 0 to dados.Fields.Count - 1 do
    if dados.Fields[i] is TFloatField then
      TFloatField(dados.Fields[i]).DisplayFormat := '##0.00';
end;

procedure TIcmsInterDifalAjustes_InfDoc_NF_It.selecionarRegistros;
begin
  dados.Close;
  dados.SQL.Text := 'select ' + fCampos +
    ' from notafiscal_item nfi' +
    ' where cod_nf = ' + IntToStr(IcmAj.infDoc.dataSet.FieldByName('cod_nf').AsInteger) +
    ' and nitem = ' + IntToStr(IcmAj.infDoc.dataSet.FieldByName('nitem_nf').AsInteger) +
    ' and cod_empresa = ' + IntToStr(IcmAj.infDoc.dataSet.FieldByName('cod_empresa').AsInteger);
  dados.Open;
end;

{ TIcmsInterDifalObrigacoesDifal }

procedure TIcmsInterDifalObrigacoesDifal.abreForm(pTipoForm: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Obrigãções do ICMS Recolhido ou a Recolher - DIFAL...');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('SPED100', 'CONSULTA', '', 'SPED_F_ICMINTER_OB_DIFAL', '',
      dtmSPED.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadSpedFObrigacoesDIFAL = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadSpedFObrigacoesDIFAL, frmCadSpedFObrigacoesDIFAL);
    end;

    if (pTipoForm > 0) and (not frmCadSpedFObrigacoesDIFAL.Visible) then
      frmCadSpedFObrigacoesDIFAL.ShowModal
    else if (not frmCadSpedFObrigacoesDIFAL.Visible) then
      frmCadSpedFObrigacoesDIFAL.Show
    else if frmCadSpedFObrigacoesDIFAL.FormStyle = fsMDIChild then
      frmCadSpedFObrigacoesDIFAL.Show
    else
      frmCadSpedFObrigacoesDIFAL.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TIcmsInterDifalObrigacoesDifal.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsICMInterOb);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);

  indProc := TDadosLookUp_OOP.create;
  fCodOR := TDadosLookUp_OOP.create;
  fEstado := TDadosLookUp_OOP.create;

  dataSet.FieldByName('PROC').OnGetText := blobGetText;
  dataSet.FieldByName('TXT_COMPL').OnGetText := blobGetText;
end;

function TIcmsInterDifalObrigacoesDifal.delete: boolean;
var
  vRno: integer;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED105', 'EXCLUIR', 'UF/COD_OR ' + dataSet.FieldByName('UF').AsString + dataSet.FieldByName('COD_OR').AsString,
    'SPED_F_ICMINTER_OB_DIFAL', dataSet.FieldByName('SEQID').AsString, buscas) then
    exit;

  if Application.MessageBox('Deseja mesmo excluir definitivamente o registro?', 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) <> ID_YES then
    Exit;
  try
    buscas.Close;
    buscas.SQL.Text := 'delete from SPED_F_ICMINTER_OB_DIFAL' +
      ' where seqid = ' + IntToStr(dataSet.FieldByName('seqid').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('SPED105', 'EXCLUIR', 'SUCESSO', 'SPED_F_ICMINTER_OB_DIFAL', '', buscas);

    vRno := dataSet.RecNo;
    dataSet.Close;
    dataSet.Open;

    if dataSet.RecordCount >=  vRno then
      dataSet.RecNo := vRno;

  except
    on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao excluir registro. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TIcmsInterDifalObrigaccoesDifal.delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TIcmsInterDifalObrigacoesDifal.Destroy;
begin
  FreeAndNil(fCodOR);
  FreeAndNil(fEstado);
  FreeAndNil(fIndProc);
  inherited;
end;

function TIcmsInterDifalObrigacoesDifal.edit: boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED103', 'ALTERAR', 'UF/CODOR ' + dataSet.FieldByName('UF').AsString + dataSet.FieldByName('COD_OR').AsString,
    'SPED_F_ICMINTER_OB_DIFAL', dataSet.FieldByName('SEQID').AsString, buscas) then
    exit;

  result := inherited edit;
end;

function TIcmsInterDifalObrigacoesDifal.insert: boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('SPED102', 'INSERIR', '',
    'SPED_F_ICMINTER_OB_DIFAL', '', buscas) then
    exit;

  if not dataSet.Active then
    montaSelect('select * from SPED_F_ICMINTER_OB_DIFAL where seqid = 0 and cod_empresa = ' + vDadosIni.codEmpresa);

  result := inherited insert;
end;

function TIcmsInterDifalObrigacoesDifal.post: boolean;
var
  acao: string;
begin
  try

    Result := false;
    acao := vDadosIni.IfThen(dataSet.State = dsInsert, 'INSERIR', 'EDITAR');

    if not vDadosIni.PesqPros('SPED104', acao, 'UF/CODOR ' + dataSet.FieldByName('UF').AsString + dataSet.FieldByName('COD_OR').AsString,
      'SPED_F_ICMINTER_OB_DIFAL', dataSet.FieldByName('SEQID').AsString, buscas) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

   checkFieldEmpty('uf', 'Campo UF de preenchimento obrigatorio', 'DBLookupComboBox3');
   checkFieldEmpty('cod_or', 'Campo Codigo da obrigacao recolhida ou a recolher de preenchimento obrigatorio', 'DBLookupComboBox1');
   checkFieldEmpty('dt_vcto', 'Campo Data de vencimento de preenchimento obrigatorio', 'DBEdit2');   
   checkFieldEmpty('mes_ref', 'Campo Ano de referencia de preenchimento obrigatorio', 'DBEdit5');
   checkFieldEmpty('ano_ref', 'Campo Mes de referencia de preenchimento obrigatorio', 'DBEdit6');
   checkFieldEmpty('data_lanc', 'Campo Data para Apuracao de preenchimento obrigatorio', 'DBEdit7');

   if (dataSet.FieldByName('mes_ref').AsInteger < 1) or (dataSet.FieldByName('mes_ref').AsInteger > 12)  then
     raiseExceptionCreate('Mes de referencia invalido', 'DBEdit5');

   if (dataSet.FieldByName('ano_ref').AsInteger < 2000) or (dataSet.FieldByName('mes_ref').AsInteger > 2050)  then
     raiseExceptionCreate('Ano de referencia invalido', 'DBEdit6');   

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('seqid').AsInteger := Gencodigo('SPED_F_ICMINTER_OB_DIFAL', buscas, vDadosIni.codEmpresa);
      dataSet.FieldByName('data_cad').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    end;

    dataSet.Post;

    if (dataSet.ChangeCount = 0) then
    begin
      Result := True;
      exit;
    end;

    Result := Apply;

    if not Result then
      Exit;

    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED104', acao, 'SUCESSO', 'SPED_F_ICMINTER_OB_DIFAL', '', buscas);

    Refresh;
  except
    on E: Exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao excluir registro. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TIcmsInterDifalObrigacoesDifal.delete Erro: ' + e.Message);
    end;
  end;
end;

end.
