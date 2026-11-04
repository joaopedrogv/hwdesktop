unit StubOperacoesFiscaisIbsCbsRepositoryUnit;

interface

uses
  Contnrs,
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  OperacaoFiscalIbsCbsEtdUnit,
  TipoComunsUnit;

type
  TOperacoesFiscaisIbsCbsRepositoryStub = class(IOperacoesFiscaisIbsCbsRepository)
  private
    FCandidatos: TObjectList;
    FGetByIdRetorno: OperacaoFiscalIbsCbsEtd;
    FGetByIdChamado: Boolean;
    FGetByOpInternaGrupoFiscalChamado: Boolean;
    FPostChamado: Boolean;
    FPutChamado: Boolean;
    FUltimoGetById: string;
    FUltimaOperacaoInternaId: string;
    FUltimoGrupoFiscalId: string;
    FUltimaEmpresaId: Integer;
    FUltimaData: TDate;
    procedure UnexpectedCall(const AMethod: string);
  public
    constructor Create;
    destructor Destroy; override;

    function Post(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd; override;
    function Put(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd; override;
    function GetById(const Id: string): OperacaoFiscalIbsCbsEtd; override;
    function GetByOpInternaGrupoFiscal(
      const OpInternaId, GrupoFiscalId: string;
      EmpresaId: Integer;
      Data: TDate
    ): OperacaoFiscalIbsCbsEtdList; override;

    procedure AdicionarCandidato(const Candidato: OperacaoFiscalIbsCbsEtd);
    procedure LimparCandidatos;

    property GetByIdRetorno: OperacaoFiscalIbsCbsEtd
      read FGetByIdRetorno write FGetByIdRetorno;
    property GetByIdChamado: Boolean read FGetByIdChamado;
    property GetByOpInternaGrupoFiscalChamado: Boolean
      read FGetByOpInternaGrupoFiscalChamado;
    property PostChamado: Boolean read FPostChamado;
    property PutChamado: Boolean read FPutChamado;
    property UltimoGetById: string read FUltimoGetById;
    property UltimaOperacaoInternaId: string read FUltimaOperacaoInternaId;
    property UltimoGrupoFiscalId: string read FUltimoGrupoFiscalId;
    property UltimaEmpresaId: Integer read FUltimaEmpresaId;
    property UltimaData: TDate read FUltimaData;
  end;

implementation

uses
  SysUtils,
  Classes;

function ClonarCandidato(const Origem: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
begin
  Result := OperacaoFiscalIbsCbsEtd.Create(
    Origem.Id,
    Origem.OperacaoInternaId,
    Origem.RegraFiscalId,
    Origem.GrupoFiscalId,
    Origem.InicioVigencia,
    Origem.FimVigencia,
    Origem.DataCadastro,
    Origem.DataAlteracao,
    Origem.Ativo,
    Origem.EmpresasId);
  // As condicoes chegam do chamador; o stub devolve copias para que cada lista
  // de candidatos tenha posse propria.
  Result.Condicoes := Copy(Origem.Condicoes, 0, Length(Origem.Condicoes));

  // Descricoes aditivas usadas na identificacao do vinculo.
  Result.OperacaoInternaDescricao := Origem.OperacaoInternaDescricao;
  Result.GrupoFiscalDescricao := Origem.GrupoFiscalDescricao;
  Result.RegraFiscalDescricao := Origem.RegraFiscalDescricao;
end;

{ TOperacoesFiscaisIbsCbsRepositoryStub }

constructor TOperacoesFiscaisIbsCbsRepositoryStub.Create;
begin
  inherited Create(nil);
  FCandidatos := TObjectList.Create(True);
end;

destructor TOperacoesFiscaisIbsCbsRepositoryStub.Destroy;
begin
  FGetByIdRetorno.Free;
  FCandidatos.Free;
  inherited;
end;

procedure TOperacoesFiscaisIbsCbsRepositoryStub.UnexpectedCall(const AMethod: string);
begin
  raise Exception.Create('Unexpected call to TOperacoesFiscaisIbsCbsRepositoryStub.' + AMethod);
end;

function TOperacoesFiscaisIbsCbsRepositoryStub.Post(
  Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
begin
  FPostChamado := True;
  Result := Input;
end;

function TOperacoesFiscaisIbsCbsRepositoryStub.Put(
  Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
begin
  FPutChamado := True;
  Result := Input;
end;

function TOperacoesFiscaisIbsCbsRepositoryStub.GetById(
  const Id: string): OperacaoFiscalIbsCbsEtd;
begin
  FGetByIdChamado := True;
  FUltimoGetById := Id;
  if Assigned(FGetByIdRetorno) then
    Result := ClonarCandidato(FGetByIdRetorno)
  else
    Result := nil;
end;

function TOperacoesFiscaisIbsCbsRepositoryStub.GetByOpInternaGrupoFiscal(
  const OpInternaId, GrupoFiscalId: string;
  EmpresaId: Integer;
  Data: TDate): OperacaoFiscalIbsCbsEtdList;
var
  i: Integer;
begin
  FGetByOpInternaGrupoFiscalChamado := True;
  FUltimaOperacaoInternaId := OpInternaId;
  FUltimoGrupoFiscalId := GrupoFiscalId;
  FUltimaEmpresaId := EmpresaId;
  FUltimaData := Data;

  Result := OperacaoFiscalIbsCbsEtdList.Create;
  for i := 0 to FCandidatos.Count - 1 do
    Result.Add(ClonarCandidato(OperacaoFiscalIbsCbsEtd(FCandidatos[i])));
end;

procedure TOperacoesFiscaisIbsCbsRepositoryStub.AdicionarCandidato(
  const Candidato: OperacaoFiscalIbsCbsEtd);
begin
  FCandidatos.Add(Candidato);
end;

procedure TOperacoesFiscaisIbsCbsRepositoryStub.LimparCandidatos;
begin
  FCandidatos.Clear;
end;

end.
