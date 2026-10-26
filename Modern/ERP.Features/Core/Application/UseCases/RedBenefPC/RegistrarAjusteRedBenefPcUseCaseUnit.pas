unit RegistrarAjusteRedBenefPcUseCaseUnit;

interface

uses
  SysUtils, Classes,
  IRegistrarAjusteRedBenefPcUseCaseUnit, IConsolidadorContextoFiscalPcServiceUnit, ICalcularAjusteRedBenefPcServiceUnit,
  IAjustesRedBenefPcRepositoryUnit, IDataBaseConnectionUnit;

type

  RegistrarAjusteRedBenefPcUseCase = class(TInterfacedObject, IRegistrarAjusteRedBenefPcUseCase)
  private
    FConnection: IDataBaseConnection;
    FAjusteRepo: IAjustesRedBenefPcRepository;
    FConsolidador: IConsolidadorContextoFiscalPcService;
    FCalculadorAjuste: ICalcularAjusteRedBenefPcService;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      AjusteRepo: IAjustesRedBenefPcRepository;
      Consolidador: IConsolidadorContextoFiscalPcService;
      CalculadorAjuste: ICalcularAjusteRedBenefPcService
    );
    procedure Executar(const Input: RegistrarAjusteRedBenefPcUseCaseInput);
  end;

implementation

uses
  EValidacaoNegocioUnit, ContextoDocTribPcModelUnit, ITransactionUnit, AjusteRedBenefPcModelUnit;

{ RegistrarAjusteRedBenefPcUseCase }

constructor RegistrarAjusteRedBenefPcUseCase.Create(
  Connection: IDataBaseConnection;
  AjusteRepo: IAjustesRedBenefPcRepository;
  Consolidador: IConsolidadorContextoFiscalPcService;
  CalculadorAjuste: ICalcularAjusteRedBenefPcService
);
begin
  FConnection := Connection;
  FAjusteRepo := AjusteRepo;
  FConsolidador := Consolidador;
  FCalculadorAjuste := CalculadorAjuste;
end;

procedure RegistrarAjusteRedBenefPcUseCase.Executar(const Input: RegistrarAjusteRedBenefPcUseCaseInput);
var
  docDFe: ContextoDocTribPcModel;
  ajustesNovos, ajustesDB: AjusteRedBenefPcModelList;
  ajuste, ajusteResult: AjusteRedBenefPcModel;
  transaction: ITransaction;
  N: Integer;
begin
  if Input.ChaveDFe = '' then
    raise EValidacaoNegocio.Create('Documento informado se chave DFe');

  ajustesNovos := nil;
  ajustesDB    := nil;
  docDFe       := FConsolidador.ObterDocumentoConsolidado(Input.ChaveDFe, Input.EmpresaId);
  try
    if (docDFe = nil) or docDFe.RedBenefCalculado or (Length(docDFe.Itens) = 0) then
      Exit;

    ajustesNovos := FCalculadorAjuste.Calcular( docDFe );
    ajustesDB    := FAjusteRepo.ListarPorDFe(Input.ChaveDFe, Input.EmpresaId);

    transaction := FConnection.BeginTransaction();
    try

      for N := 0 to ajustesNovos.Count - 1 do
      begin
        ajuste := ajustesDB.ObterDistinto(
          ajustesNovos.Items[N].Cst,
          ajustesNovos.Items[N].IndAj,
          ajustesNovos.Items[N].CodAj,
          ajustesNovos.Items[N].ChaveDfe,
          ajustesNovos.Items[N].DescricaoAjuste,
          ajustesNovos.Items[N].InfComplementar
          );

        ajusteResult := nil;
        try
          if ajuste = nil then
            ajusteResult := FAjusteRepo.Incluir( ajustesNovos.Items[N] )

          else if not ajuste.Automatico then
            ajustesDB.Remove( ajuste ) // Ajuste criado ou alterado pelo usuário, fica como está

          else
          begin
            ajustesNovos.Items[N].Id := ajuste.Id;
            ajustesDB.Remove( ajuste );

            ajusteResult := FAjusteRepo.Alterar( ajustesNovos.Items[N] );
          end;
        finally
          FreeAndNil(ajusteResult);
        end;
      end;

      for N := 0 to ajustesDB.Count - 1 do
        FAjusteRepo.Excluir(ajustesDB.Items[N].Id, ajustesDB.Items[N].CodEmpresa);

      FConsolidador.MarcarDocumentoComoCalculado( docDFe );

      transaction.Commit();

    except
      transaction.Rollback();
      raise;
    end;
  finally
    ajustesNovos.Free();
    ajustesDB.Free();
    docDFe.Free();
  end;
end;

end.
