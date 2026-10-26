unit ResolverAjustesEFDRedBenefPcUseCaseUnit;

interface

uses
  ModelosDFeEnumUnit, IDataBaseConnectionUnit,
  IAjustesRedBenefPcRepositoryUnit, IConsolidadorContextoFiscalPcServiceUnit, ICalcularAjusteRedBenefPcServiceUnit,
  ResolverAjustesEFDRedBenefPcInputUnit;

type
  IResolverAjustesEFDRedBenefPcUseCase = interface
    ['{A8AA8F53-9344-43BD-BF99-1EED9EEA2A97}']
    procedure Executar(const Input: ResolverAjustesEFDRedBenefPcInput);
  end;

  ResolverAjustesEFDRedBenefPcUseCase = class(TInterfacedObject, IResolverAjustesEFDRedBenefPcUseCase)
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
    procedure Executar(const Input: ResolverAjustesEFDRedBenefPcInput);
  end;

implementation

uses
  ContextoDocTribPcModelUnit, AjusteRedBenefPcModelUnit, ITransactionUnit, PeriodoEmpresaVOUnit, TipoComunsUnit;

{ ResolverAjustesEFDRedBenefPcUseCase }

constructor ResolverAjustesEFDRedBenefPcUseCase.Create(Connection: IDataBaseConnection;
  AjusteRepo: IAjustesRedBenefPcRepository; Consolidador: IConsolidadorContextoFiscalPcService;
  CalculadorAjuste: ICalcularAjusteRedBenefPcService);
begin
  FConnection := Connection;
  FAjusteRepo := AjusteRepo;
  FConsolidador := Consolidador;
  FCalculadorAjuste := CalculadorAjuste;
end;

procedure ResolverAjustesEFDRedBenefPcUseCase.Executar(const Input: ResolverAjustesEFDRedBenefPcInput);
var
  docsDFe: ContextoDocTribPcModelList;
  docDFe: ContextoDocTribPcModel;
  ajustesCalculados, ajustesDB, ajustesInserir, ajustesAlterar: AjusteRedBenefPcModelList;
  ajuste: AjusteRedBenefPcModel;
  transaction: ITransaction;
  ajustesExcluir: TArrayString;
  I, N, CountDel: Integer;
begin
  docsDFe := FConsolidador.ObterDocumentosConsolidados(PeriodoEmpresaVO.Create(
    Input.DataInicial, Input.DataFinal, Input.EmpresaId
  ));
  ajustesInserir    := AjusteRedBenefPcModelList.Create(False);
  ajustesAlterar    := AjusteRedBenefPcModelList.Create(False);
  ajustesCalculados := nil;
  ajustesDB         := nil;
  try
    if docsDFe.Count = 0 then
      Exit;

    transaction := FConnection.BeginTransaction();
    try
      CountDel := 0;
      SetLength(ajustesExcluir, docsDFe.Count);

      for I := 0 to docsDFe.Count - 1 do
      begin
        docDFe := docsDFe.Items[I];

        if not Input.RecalcularPC and ( docDFe.RedBenefCalculado or (Length(docDFe.Itens) = 0)) then
          Continue;

        ajustesCalculados := FCalculadorAjuste.Calcular( docDFe );
        ajustesDB         := FAjusteRepo.ListarPorDFe(docDFe.ChaveDFe, docDFe.EmpresaId);

        for N := 0 to ajustesCalculados.Count - 1 do
        begin
          ajuste := ajustesDB.ObterDistinto(
            ajustesCalculados.Items[N].Cst,
            ajustesCalculados.Items[N].IndAj,
            ajustesCalculados.Items[N].CodAj,
            ajustesCalculados.Items[N].ChaveDfe,
            ajustesCalculados.Items[N].DescricaoAjuste,
            ajustesCalculados.Items[N].InfComplementar
            );

          if ajuste = nil then
            ajustesInserir.Add( ajustesCalculados.Items[N] )
            //FAjusteRepo.Incluir( ajustesCalculados.Items[N] )
          else if not ajuste.Automatico then
            ajustesDB.Remove( ajuste ) // Ajuste criado ou alterado pelo usuário, fica como está
          else
          begin
            ajustesCalculados.Items[N].Id := ajuste.Id;
            ajustesDB.Remove( ajuste );

            //FAjusteRepo.Alterar( ajustesCalculados.Items[N] );
            ajustesAlterar.Add( ajustesCalculados.Items[N] )
          end;
        end;

        for N := 0 to ajustesDB.Count - 1 do
        begin
          //FAjusteRepo.Excluir(ajustesDB.Items[N].Id, ajustesDB.Items[N].CodEmpresa);
          if Length(ajustesExcluir) >= CountDel then
            SetLength(ajustesExcluir, Length(ajustesExcluir) + 10);

          ajustesExcluir[CountDel] := ajustesDB.Items[N].Id;
          Inc(CountDel);
        end;

        if not docDFe.RedBenefCalculado then
          FConsolidador.MarcarDocumentoComoCalculado( docDFe );
      end;

      SetLength(ajustesExcluir, CountDel);

      FAjusteRepo.Excluir(ajustesExcluir, Input.EmpresaId);
      FAjusteRepo.Alterar(ajustesAlterar);
      FAjusteRepo.Incluir(ajustesInserir);

      transaction.Commit();

    except
      transaction.Rollback();
      raise;
    end;
  finally
    ajustesInserir.Free();
    ajustesAlterar.Free();
    ajustesCalculados.Free();
    ajustesDB.Free();
    docsDFe.Free();
  end;
end;

end.
