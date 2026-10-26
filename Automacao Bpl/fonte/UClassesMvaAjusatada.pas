unit UClassesMvaAjusatada;

interface
uses uDataSet_OOP, IB, IBQuery, IBDatabase, DBClient, DB, SysUtils, Windows, Dialogs, forms;
type
  TUF = class;
  TMvaAjustada = class;

  TUF = class(TDataSet_OOP)
  public
    constructor create;
    function AbreUF: boolean;
  end;

  TMvaAjustada = class(TDataSet_OOP)
  public
    constructor create;
    function delete: boolean; override;
    function abreMvaAjustda: boolean;
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function CalcualMvaAjustada: real;
    function existeNCM(vNCM: string): boolean;
    function existeCadastroMVAAjustada(cod: string; estado: integer): boolean;
    procedure CadMvaAjustada(TipoForm: integer);
  var
    vUF: TUF;
  end;

implementation

uses UDtmMvaAjustada, uDtmAtivo, UCadMvaAjustada;

{ TUF }

function TUF.AbreUF: boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Clear;
    buscas.SQL.Add('select * from estados where ativo = 1');
    buscas.Open;
    result := true;
  except
    result := false;
  end;
end;

constructor TUF.create;
begin
  buscas := TIBQuery(dtmMvaAjustada.qrUF);
  transacao := TIBTransaction(dtmMvaAjustada.IBTransMvaAjustada);
end;

{ TMvaAjustada }

function TMvaAjustada.abreMvaAjustda: boolean;
begin
  result := montaSelect('select * from MVA_AJUSTADA_NCM');
  vUF.AbreUF;
end;

procedure TMvaAjustada.CadMvaAjustada(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmMvaAjustada = nil then
    dtmMvaAjustada := TdtmMvaAjustada.Create(dtmMvaAjustada);
  if frmCadMvaAjustada = nil then
    Application.CreateForm(TfrmCadMvaAjustada, frmCadMvaAjustada);
  if TipoForm = 10 then
  begin
    frmCadMvaAjustada.FormStyle := fsNormal;
    frmCadMvaAjustada.Visible := false;
    frmCadMvaAjustada.Refresh;
    frmCadMvaAjustada.Position := poScreenCenter;
    frmCadMvaAjustada.ShowModal;
  end
  else
  frmCadMvaAjustada.Show;
end;

function TMvaAjustada.CalcualMvaAjustada: real;
var
  A, B: real;
begin
  if (dataSet.FieldByName('ALIQ_INTER').AsString = '') or
    (dataSet.FieldByName('MVA_ST_ORIGINAL').AsString = '') or
    (dataSet.FieldByName('ALIQ_INTRA').AsString = '')
    then begin
    result := 0;
    raise Exception.Create('Para que a MVA Ajustada seja calculada os campos Aliq. interestadual,' +
      #13
      + ' Aliq. interna e MVA-ST original devem ser informados.');
  end;

  A := 1 + (dataSet.FieldByName('MVA_ST_ORIGINAL').AsFloat / 100);
  B := (1 - (dataSet.FieldByName('ALIQ_INTER').AsFloat / 100)) / (1 -
    (dataSet.FieldByName('ALIQ_INTRA').AsFloat / 100));
  result := strtofloat(FormatFloat('##0.00', ((A * B) - 1) * 100));
  dataSet.FieldByName('MVA_AJUSTADA').AsFloat := result;
end;

constructor TMvaAjustada.create;
begin
  dataSet := TClientDataSet(dtmMvaAjustada.cdsMvaAjustada);
  buscas := TIBQuery(dtmMvaAjustada.qrBuscas);
  transacao := TIBTransaction(dtmMvaAjustada.IBTransMvaAjustada);
  vUF := TUF.create;
end;

function TMvaAjustada.delete: boolean;
var
  vCodFormula: string;
begin
 Result := False;

  if dataSet.IsEmpty then
    exit;
  vCodFormula := dataSet.FieldByName('COD_NCM').AsString;

  try
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro?', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
    begin
      dataSet.Delete;
     
  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('BAS310', 'EXCLUIR', 'SUCESSO', 'MVA_AJUSTADA_NCM', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('BAS310', 'EXCLUIR', 'FALHA', 'MVA_AJUSTADA_NCM', vCodFormula, buscas);

   Result := true;
  Refresh;

    end;
  except on e: Exception do
    begin
      MessageDlg('Erro ao apagar registro: ' + pchar(e.Message), mtError, [mbok], 0);
      result := false;
    end;
  end;

end;

function TMvaAjustada.edit: boolean;
begin
 Result := False;
  if not vDadosIni.PesqPros('BAS309', 'ALTERAR', '', 'MVA_AJUSTADA_NCM',
    '', buscas, false) then
    Exit;

  if not dataSet.Active then
    abreMvaAjustda;

  if inherited Edit then
    result := true;

end;

function TMvaAjustada.insert: boolean;
begin
 if not vDadosIni.PesqPros('BAS308', 'INCLUIR', '', 'MVA_AJUSTADA_NCM',
    '', buscas, True) then
    Exit;


  if not dataSet.Active then
    abreMvaAjustda;

  if inherited Insert then
    result := true;
end;

function TMvaAjustada.post: boolean;
var
  acao: string;
begin
  try
   
    if not vDadosIni.PesqPros('BAS311', 'SALVAR', '', 'MVA_AJUSTADA_NCM',
      dataSet.FieldByName('COD_NCM').AsString, buscas, true) then
      Exit;

     if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

      if dataSet.State = dsInsert then
      if existeCadastroMVAAjustada(dataSet.FieldByName('COD_NCM').AsString,
        dataSet.FieldByName('CODIGO_UF').AsInteger) then
      raise Exception.Create('MVA ajustada já cadastrada para essa NCM e Estado.');

    if dataSet.FieldByName('COD_NCM').AsString = '' then
      raise Exception.Create('Campo código NCM não informado.');

    if dataSet.FieldByName('CODIGO_UF').AsString = '' then
      raise Exception.Create('Campo Estado não informado.');

    if dataSet.FieldByName('ALIQ_INTER').AsString = '' then
      raise Exception.Create('Campo Aliq. Inter não informado.');

    if dataSet.FieldByName('ALIQ_INTRA').AsString = '' then
      raise Exception.Create('Campo Aliq. Intra não informado.');

    if dataSet.FieldByName('MVA_ST_ORIGINAL').AsString = '' then
      raise Exception.Create('Campo MVA-ST Original não informado.');

    dataSet.FieldByName('MVA_AJUSTADA').AsFloat := CalcualMvaAjustada;

    if dataSet.FieldByName('MVA_AJUSTADA').AsInteger = 0 then
      raise Exception.Create('MVA Ajustada não pode ser calculado verifique ' + #13 +
        'se os campos foram preenchidos corretamente.');

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('BAS311', acao, 'SUCESSO', 'MVA_AJUSTADA_NCM',
        dataSet.FieldByName('COD_NCM').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('BAS311', acao, 'FALHA', 'MVA_AJUSTADA_NCM',
        dataSet.FieldByName('COD_NCM').AsString, buscas);

    if Result then
      Refresh;

  except on e: exception do
    begin
      MessageDlg('Erro ao gravar registro: ' + pchar(e.Message), mtError, [mbok], 0);
      result := false;
    end;

  end;
  Refresh;
end;

function TMvaAjustada.existeCadastroMVAAjustada(cod: string; estado: integer): boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Clear;
    buscas.SQL.Add('select COD_NCM from MVA_AJUSTADA_NCM where COD_NCM = ' + cod + ' and CODIGO_UF = ' +
      IntToStr(estado));
    buscas.Open;
    if buscas.RecordCount = 1 then
      result := true
    else
      result := false;
  except
    result := false;

  end;
end;

function TMvaAjustada.existeNCM(vNCM: string): boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Clear;
    buscas.SQL.Add('select COD_NCM from NBM where COD_NCM = ' + QuotedStr(vNCM));
    buscas.Open;
    if buscas.RecordCount = 0 then
      result := true
    else
      result := false;
  except
    result := false;

  end;
end;

end.

