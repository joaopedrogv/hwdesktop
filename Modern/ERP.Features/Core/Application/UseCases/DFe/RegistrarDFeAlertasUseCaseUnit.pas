unit RegistrarDFeAlertasUseCaseUnit;

interface

uses
  System.Generics.Collections,
  IDataBaseConnectionUnit, IDFeAlertasRepositoryUnit, RegistrarDFeAlertasInputUnit;

type
  IRegistrarDFeAlertasUseCase = interface
    ['{E15DE8D7-986B-4EA9-8CFF-426521C11683}']
    procedure Executar(const Input: RegistrarDFeAlertasInput);
  end;

  RegistrarDFeAlertasUseCase = class(TInterfacedObject, IRegistrarDFeAlertasUseCase)
  private
    FConnection: IDataBaseConnection;
    FDFeAlertasRepo: IDFeAlertasRepository;
  public
    constructor Create( AConnection: IDataBaseConnection; ADFeAlertasRepo: IDFeAlertasRepository);

    procedure Executar(const Input: RegistrarDFeAlertasInput);
  end;

implementation

uses
  SysUtils,
  ITransactionUnit, DFeAlertaEdtUnit, IntegerNullableUnit;

{ RegistrarDFeAlertasUseCase }

constructor RegistrarDFeAlertasUseCase.Create(AConnection: IDataBaseConnection; ADFeAlertasRepo: IDFeAlertasRepository);
begin
  FConnection := AConnection;
  FDFeAlertasRepo := ADFeAlertasRepo;
end;

procedure RegistrarDFeAlertasUseCase.Executar(const Input: RegistrarDFeAlertasInput);
var
  alertas: DFeAlertaEdtList;
  msg: TPair<Integer,string>;
  transaction: ITransaction;
begin

  alertas := nil;
  transaction := FConnection.BeginTransaction();
  try try

    if FDFeAlertasRepo.ExisteAlertaPelodDFe(Input.ChaveDFe) then
      Exit;

    alertas := DFeAlertaEdtList.Create();

    for msg in Input.Mensangens do
      alertas.Add(DFeAlertaEdt.Create('', Input.ChaveDFe, IntegerNullable.CreateOrNull(msg.Key), msg.Value));

    FDFeAlertasRepo.Incluir(alertas);

    transaction.Commit();

  except
    transaction.Rollback();
    raise;
  end;
  finally
    transaction.FreeTransaction();
    alertas.Free();
  end;
end;

end.
