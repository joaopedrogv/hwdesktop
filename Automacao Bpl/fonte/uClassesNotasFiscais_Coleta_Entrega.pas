unit uClassesNotasFiscais_Coleta_Entrega;

interface

uses
  uDataSet_OOP;

type
  TNF_Tipo_Coleta_Entrega = (tceColeta, tceEntrega);

  TNFCab_Coleta_Entrega = class(TDataSet_OOP)
  private
    Ftipo: TNF_Tipo_Coleta_Entrega;
    Ftipostr: string;
    FOwner: TDataSet_OOP;
  public
    constructor create(AOwner: TDataSet_OOP; Atipo: TNF_Tipo_Coleta_Entrega);
    destructor Destroy; override;
    function Insert: Boolean; override;
    function Clear: Boolean;
//    function Edit: Boolean; override;
    function Post: Boolean; override;
    function Apply: Boolean; override;

    function selecionaColEnt: TNFCab_Coleta_Entrega;
    procedure ConsultaCEP(Awebservice: Boolean);
//    function delete: Boolean;
  end;

implementation

uses uClassesNotasFiscais, TypInfo, SysUtils, uDtmAtivo, UClassesCadastrosBasicos,
  cep_class, DB;

{ TNFCab_Coleta_Entrega }

function TNFCab_Coleta_Entrega.Apply: Boolean;
begin

  if dataSet.State in [dsEdit, dsInsert] then
    if not Post then
      Exit;

  if dataSet.RecordCount > 0 then
    if fint('cod_nf') = 0 then
    begin
      dataSet.Edit;
      dataSet.FieldByName('cod_nf').AsInteger      := TNFCab(FOwner).fint('cod_nf');
      dataSet.FieldByName('cod_empresa').AsInteger := TNFCab(FOwner).fint('cod_empresa');
      dataSet.Post;
    end;

  if dataSet.ChangeCount > 0 then
  begin
    Result := inherited Apply;
    selecionaColEnt;
    dataSet.Refresh;
  end
  else
    Result := True;
end;

function TNFCab_Coleta_Entrega.Clear: Boolean;
begin
  if dataSet.State in [dsEdit, dsInsert] then
    dataSet.Cancel;

  if dataSet.RecordCount > 0 then
    Delete;
end;

procedure TNFCab_Coleta_Entrega.ConsultaCEP(Awebservice: Boolean);
var
  Acep: TCEP;
  AretCEP: TCep_class;
begin
  if Trim(dataSet.FieldByName('cep').AsString) = '' then
    Exit;

  Acep := TCEP.create;
  try
    AretCEP := Acep.GetCEP(dataSet.FieldByName('cep').AsString);

    if (not Assigned(AretCEP)) and (Awebservice) then
      if Acep._ConsultarWebService(dataSet.FieldByName('cep').AsString) then
        AretCEP := Acep.GetCEP(dataSet.FieldByName('cep').AsString);

    if Assigned(AretCEP) then
    begin
      dataSet.FieldByName('XLGR').AsString        := AretCEP.endereco;
      dataSet.FieldByName('XBAIRRO').AsString     := AretCEP.bairro;
      dataSet.FieldByName('CMUN').AsInteger       := SqlOpen('select ibge_cod_cidade from cidades where cod_cidade = ' + IntToStr(AretCEP.cod_cidade)).FieldByName('ibge_cod_cidade').AsInteger;
      dataSet.FieldByName('XMUN').AsString        := AretCEP.cidade;
      dataSet.FieldByName('UF').AsString          := AretCEP.sigla_estado;
      dataSet.FieldByName('CPAIS').AsInteger      := 1058;
      dataSet.FieldByName('XPAIS').AsString       := 'BRASIL';
    end;
  finally
    FreeAndNil(Acep);
  end;
end;

constructor TNFCab_Coleta_Entrega.create(AOwner: TDataSet_OOP;
  Atipo: TNF_Tipo_Coleta_Entrega);

begin             
  FOwner   := TNFCab(AOwner);
  Ftipo    := Atipo;

  Sleep(10);
  inherited Create(TNFCab(FOwner).buscas.Database, TNFCab(FOwner).buscas.Transaction, True, GetEnumName(TypeInfo(TNF_Tipo_Coleta_Entrega), Integer(Ftipo)) +
                   vDadosIni.apenasNumeros(FormatDateTime('DD/MM/YYYY hh:mm:ss zzz', Now)));

  Ftipostr := GetEnumName(TypeInfo(TNF_Tipo_Coleta_Entrega), Integer(Ftipo));
  Ftipostr := Copy(Ftipostr, 4, Length(Ftipostr));

//  dataSet     := TClientDataSet(DtmNF.cdsNFPag);
//  transacao   := TIBTransaction(FOwner.transacao);
//  buscas      := TIBQuery(DtmNF.qrBuscasNF);
//  Fformas     := TNFCab_Pag_Forma.create;
//  FlkBandeira := TDadosLookUp_OOP.create;

//  dataSet.FieldByName('tpag').OnGetText  := dataSetPagamentosGetText;
//  dataSet.FieldByName('tband').OnGetText := dataSetPagamentosGetText;
end;

destructor TNFCab_Coleta_Entrega.Destroy;
begin
  inherited;
  FreeDbComponents(True);
end;

function TNFCab_Coleta_Entrega.Insert: Boolean;
begin
  if dataSet.RecordCount = 1 then
  begin
    Result := Edit;
    Exit;
  end;

  Result := inherited insert;
  if Result then
  begin
    dataSet.FieldByName('cod_nf').AsInteger      := TNFCab(FOwner).fint('cod_nf');
    dataSet.FieldByName('cod_empresa').AsInteger := TNFCab(FOwner).fint('cod_empresa');
    dataSet.FieldByName('tipo').AsInteger        := Ord(Ftipo);
  end;
end;

function TNFCab_Coleta_Entrega.Post: Boolean;
begin
  Result := False;
  try

    checkFieldEmpty('cpfcnpj', 'CPF ou CNPJ não preenchido', '');
    checkFieldEmpty('xlgr'   , 'Logradouro não preenchido', '');
    checkFieldEmpty('nro'    , 'Número não preenchido', '');
    checkFieldEmpty('xbairro', 'Bairro não preenchido', '');
    checkFieldEmpty('cmun'   , 'Município não preenchido', '');
    checkFieldEmpty('uf'     , 'UF não preenchida', '');

    case Length(fstr('cpfcnpj')) of
      11 :
        if not Cpf(fstr('cpfcnpj')) then
          raiseExceptionCreate('CPF inválido');
      14 :
        if not cgc(fstr('cpfcnpj')) then
          raiseExceptionCreate('CNPJ inválido');
      else
        raiseExceptionCreate('CPF ou CNPJ inválido');
    end;    

    Result := inherited Post;

  except on E: Exception do
    begin
      registraErro('TNFCab_Coleta_Entrega.Post Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar dados da ' + Ftipostr + #13 + #13 + E.Message);
    end;
  end;
end;

function TNFCab_Coleta_Entrega.selecionaColEnt: TNFCab_Coleta_Entrega;
begin
  Result := Self;

  montaSelect('select * from notafiscal_coleta_entrega' +
              ' where cod_nf = %d and cod_empresa = %d and tipo = %d',
              [FOwner.fint('cod_nf'), FOwner.fint('cod_empresa'), Ord(Ftipo)]);
end;

end.
