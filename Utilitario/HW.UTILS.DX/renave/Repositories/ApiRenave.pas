unit ApiRenave;

interface

uses
  System.Net.URLClient,
  BaseApiRenave,
  BaseSingleton,
  ClienteAutenticadoModel,
  VeiculoZeroKmPendenteEntradaEstoqueModel,
  VeiculoEstoqueModel,
  SolicitacaoEntradaEstoqueZeroModel,
  SolicitacaoCancelamentoEntradaZeroKmModel,
  SolicitacaoSaidaEstoqueZeroModel,
  SolicitacaoCancelamentoSaidaZeroKmModel,
  SolicitacaoDevolucaoMontadoraZeroKmModel,
  SolicitacaoRejeicaoZeroKmModel,
  MunicipioRenaveModel,
  PdfAtpvModel;

type

  TApiRenave = class(TBaseApiRenave)
  public
    function GetClienteAutenticado(): TClienteAutenticadoModel;

    //Veiculos
    function GetVeiculoZeroKmPendenteEntradaEstoque(chassi: string = ''): TArray<TVeiculoZeroKmPendenteEntradaEstoqueModel>;
    function GetVeiculoEstoque(chassi: string = ''; estadoEstoque: string = ''; placa: string = ''): TArray<TVeiculoEstoqueModel>;
    function GetMunicipiosRenave(nome: string = ''; uf: string = ''): TArray<TMunicipioRenaveModel>;
    function GetPdfAtpv(chassi: string): TPdfAtpvModel;

    function PostEntradaEstoqueZeroKm(payload: TSolicitacaoEntradaEstoqueZeroModel): TVeiculoEstoqueModel;
    function PostCancelamentoEntradaEstoqueZeroKm(payload: TSolicitacaoCancelamentoEntradaZeroKmModel): TVeiculoEstoqueModel;
    function PostSaidaEstoqueZeroKm(payload: TSolicitacaoSaidaEstoqueZeroModel): TVeiculoEstoqueModel;
    function PostCancelamentoSaidaEstoqueZeroKm(payload: TSolicitacaoCancelamentoSaidaZeroKmModel): TVeiculoEstoqueModel;
    function PostDevolucaoMontadoraVeiculoZeroKm(payload: TSolicitacaoDevolucaoMontadoraZeroKmModel): TVeiculoEstoqueModel;
    function PostRejeicaoZeroKm(payload: TSolicitacaoRejeicaoZeroKmModel): Boolean;
    function PostCancelamentoRejeicaoZeroKm(payload: TSolicitacaoCancelamentoRejeicaoZeroKmModel): Boolean;

    // account, auth
//    function GetLoginToken(): TLoginByToken;
//    function PostNewUser(payload: TNewAccountModel): TIntegrationModel;
//    function PostAccountLoginByToken(): TLoginByToken;
//    function GetIntegration(email: string): TIntegrationModel;

    // revisions
//    function GetRevisions(pageNumber, pageSize: Integer): TArray<TRevisionModel>;
//    function GetRevision(id: string): TRevisionModel;

    // tags
//    function GetDefaultsTags(): TStrings;

    // documents

//    function GetDocuments(pageNumber, pageSize: Integer; externalCode: string): TArray<TDocument>;



  end;

  TApiRenaveSingleton = TSingleton<TApiRenave>;

implementation

uses
  hw_utils,
  HW.Json,
  System.SysUtils,
  System.StrUtils;

{ TApiRenave }

function TApiRenave.GetClienteAutenticado: TClienteAutenticadoModel;
begin
  Result := nil;
  with GetT<TClienteAutenticadoModel>(TReq.New('cliente-autenticado')) do
    if isSuccess then
      Result := TJsonHw.ToObject< TClienteAutenticadoModel >(data);
end;

function TApiRenave.GetMunicipiosRenave(nome,
  uf: string): TArray<TMunicipioRenaveModel>;
begin
  Result := [];

  uf := IfThen(not uf.IsEmpty, 'uf=' + uf);
  nome := IfThen(not nome.IsEmpty, 'nome=' + nome);

  with Get(TReq.New('municipios', [], [uf, nome])) do
    if isSuccess then
      Result := TJsonHw.ToArrayObject< TMunicipioRenaveModel >(data);
end;

function TApiRenave.GetPdfAtpv(chassi: string): TPdfAtpvModel;
begin
  Result := nil;
  chassi := IfThen(not chassi.IsEmpty, 'chassi=' + chassi);
  with Get(TReq.New('pdf-atpv', [], [chassi])) do
    if isSuccess then
      Result := TJsonHw.ToObject<TPdfAtpvModel>(data);
end;

function TApiRenave.GetVeiculoEstoque(chassi, estadoEstoque,
  placa: string): TArray<TVeiculoEstoqueModel>;
begin
  Result := [];

  estadoEstoque := IfThen(not estadoEstoque.IsEmpty, 'estadoEstoque=' + estadoEstoque);
  chassi := IfThen(not chassi.IsEmpty, 'chassi=' + chassi);
  placa := IfThen(not placa.IsEmpty, 'placa=' + placa);

  with GetT<TVeiculoEstoqueModel>(TReq.New('estoques', [], [chassi, estadoEstoque, placa])) do
    if isSuccess then
      Result := TJsonHw.ToArrayObject< TVeiculoEstoqueModel >(data);
end;

function TApiRenave.GetVeiculoZeroKmPendenteEntradaEstoque(
  chassi: string): TArray<TVeiculoZeroKmPendenteEntradaEstoqueModel>;
begin
  Result := [];

  chassi := IfThen(not chassi.IsEmpty, 'chassi=' + chassi);

  with Get(TReq.New('veiculos-zero-km-pendentes-entrada-estoque', chassi)) do
    if isSuccess then
      Result := TJsonHw.ToArrayObject< TVeiculoZeroKmPendenteEntradaEstoqueModel >(data);
end;

function TApiRenave.PostCancelamentoEntradaEstoqueZeroKm(
  payload: TSolicitacaoCancelamentoEntradaZeroKmModel): TVeiculoEstoqueModel;
begin
  Result := nil;
  with Call(TReq.New('cancelamentos-entrada-estoque-zero-km', '', TJsonHw.ToJsonString(payload)), rmPost) do
    if isSuccess then
      Result := TJsonHw.ToObject<TVeiculoEstoqueModel>(data);
end;

function TApiRenave.PostCancelamentoRejeicaoZeroKm(
  payload: TSolicitacaoCancelamentoRejeicaoZeroKmModel): Boolean;
begin
  Result := False;
  with Call(TReq.New('cancelamentos-rejeicoes-veiculo-zero-km', '', TJsonHw.ToJsonString(payload)), rmPost) do
    Result := isSuccess;
end;

function TApiRenave.PostCancelamentoSaidaEstoqueZeroKm(
  payload: TSolicitacaoCancelamentoSaidaZeroKmModel): TVeiculoEstoqueModel;
begin
  Result := nil;
  with Call(TReq.New('cancelamentos-saida-estoque-zero-km', '', TJsonHw.ToJsonString(payload)), rmPost) do
    if isSuccess then
      Result := TJsonHw.ToObject<TVeiculoEstoqueModel>(data);
end;

function TApiRenave.PostDevolucaoMontadoraVeiculoZeroKm(
  payload: TSolicitacaoDevolucaoMontadoraZeroKmModel): TVeiculoEstoqueModel;
begin
  Result := nil;
  with Call(TReq.New('devolucoes-montadora-veiculo-zero-km', '', TJsonHw.ToJsonString(payload)), rmPost) do
    if isSuccess then
      Result := TJsonHw.ToObject<TVeiculoEstoqueModel>(data);
end;

function TApiRenave.PostEntradaEstoqueZeroKm(
  payload: TSolicitacaoEntradaEstoqueZeroModel): TVeiculoEstoqueModel;
begin
  Result := nil;
  with Call(TReq.New('entradas-estoque-zero-km', '', TJsonHw.ToJsonString(payload)), rmPost) do
    if isSuccess then
      Result := TJsonHw.ToObject<TVeiculoEstoqueModel>(data);
end;

function TApiRenave.PostRejeicaoZeroKm(
  payload: TSolicitacaoRejeicaoZeroKmModel): Boolean;
begin
  Result := False;
  with Call(TReq.New('rejeicoes-zero-km', '', TJsonHw.ToJsonString(payload)), rmPost) do
    Result := isSuccess;
end;

function TApiRenave.PostSaidaEstoqueZeroKm(
  payload: TSolicitacaoSaidaEstoqueZeroModel): TVeiculoEstoqueModel;
begin
  Result := nil;
  with Call(TReq.New('saidas-estoque-veiculo-zero-km', '', TJsonHw.ToJsonString(payload)), rmPost) do
    if isSuccess then
      Result := TJsonHw.ToObject<TVeiculoEstoqueModel>(data);
end;

end.
