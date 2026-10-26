unit SalvarNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  INFSeRepositoryUnit,
  NFSeModelUnit,
  ITributosDFeRepositoryUnit,
  ResultadoNFSeOutputUnit;

type
  ISalvarNFSeUseCase = interface
    ['{9E2C65A9-7BFA-4D04-8A90-5DA7DB350482}']
    function Executar(const Input: NFSeModel): ResultadoNFSeOutput;
  end;

  SalvarNFSeUseCase = class(TInterfacedBaseUseCase, ISalvarNFSeUseCase)
  private
    FNFSeRepo: INFSeRepository;
    FTributosDFeRepo: ITributosDFeRepository;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository
    );
    function Executar(const Input: NFSeModel): ResultadoNFSeOutput;
  end;

implementation

uses
  SysUtils,
  NumberServiceUnit, NFSeEtdUnit,
  IEntityValidatorUnit, EntityValidatorFactoryUnit, NFSeTypesUnit, StringServiceUnit, ValidacaoNFSeFactoryUnit,
  ITransactionUnit, TributoDFeOrigemEnumUnit, TributoDFeContextEtdUnit, NFSeIbsCbsFactoryUnit;

{ SalvarNFSeUseCase }

constructor SalvarNFSeUseCase.Create(
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository
);
begin
  FConnection := Connection;
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
end;

function SalvarNFSeUseCase.Executar(const Input: NFSeModel): ResultadoNFSeOutput;
var
  transaction: ITransaction;
  validator: IEntityValidator;
  nf: NFSeEtd;
  trib: TributoDFeContextEtd;
begin
  validator := ValidacaoNFSeFactory.BuildSalvarRascunho( Input.NFSe );

  if not validator.IsValid() then
  begin
    Result := ResultadoNFSeOutput.Create( validator.Result() );
    Exit;
  end;

  transaction := FConnection.BeginTransaction();
  try
    nf := nil;
    trib := nil;

    if Input.NFSe.Id = '' then
    begin
      if Input.NFSe.NaturezaEmissao = nemtPrestadorWS then
        nf := FNFSeRepo.CriarNFSeParaEmissao( Input.NFSe )
      else
        nf := FNFSeRepo.CriarNFSeEmitidaNoPortal( Input.NFSe );

      if Input.Tributo <> nil then
      begin
        Input.Tributo.Id := nf.Id;
        Input.Tributo.Origem := tdfoNFSe;

        trib := FTributosDFeRepo.Post( Input.Tributo );
      end;
    end
    else
    begin
      if Input.NFSe.NaturezaEmissao = nemtPrestadorWS then
        nf := FNFSeRepo.AlterarNFSeParaEmissao( Input.NFSe )
      else
        nf := FNFSeRepo.AlterarNFSeEmitidaNoPortal( Input.NFSe );

      if Input.Tributo <> nil then
        trib := FTributosDFeRepo.Post( Input.Tributo )
      else
        FTributosDFeRepo.Delete( StringService.Split([','], Input.NFSe.Id), tdfoNFSe );
    end;

    Result := ResultadoNFSeOutput.Create( NFSeModel.Create( nf, trib ));

    transaction.Commit();

  except //on E: Exception do
    begin
      transaction.Rollback();
      nf.Free();
      trib.Free();
      raise;
    end;
  end;
end;

end.
