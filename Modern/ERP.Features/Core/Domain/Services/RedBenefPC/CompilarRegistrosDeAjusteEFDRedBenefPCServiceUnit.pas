unit CompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit;

interface

uses
  ICompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit, PeriodoMultiEmpresaVOUnit, RegistroAjusteEFDPCVOUnit,
  IAjustesRedBenefPcRepositoryUnit;

type
  CompilarRegistrosDeAjusteEFDRedBenefPCService = class(TInterfacedObject, ICompilarRegistrosDeAjusteEFDRedBenefPCService)
  private
    FAjustesRedBenefRepo: IAjustesRedBenefPcRepository;
  public
    constructor Create(AjustesRedBenefRepo: IAjustesRedBenefPcRepository);

    function Executar(Input: PeriodoMultiEmpresaVO): CompilarRegistrosDeAjusteEFDRedBenefPCServiceResult;
  end;

implementation

uses
  SysUtils,
  AjusteRedBenefPcModelUnit, RegistroAjusteDetalheEFDPCVOUnit;

{ CompilarRegistrosDeAjusteEFDRedBenefPCService }

constructor CompilarRegistrosDeAjusteEFDRedBenefPCService.Create(AjustesRedBenefRepo: IAjustesRedBenefPcRepository);
begin
  FAjustesRedBenefRepo := AjustesRedBenefRepo;
end;

function CompilarRegistrosDeAjusteEFDRedBenefPCService.Executar(
  Input: PeriodoMultiEmpresaVO): CompilarRegistrosDeAjusteEFDRedBenefPCServiceResult;
var
  ajustes: AjusteRedBenefPcModelList;
  lastM220, lastM620: RegistroAjusteEFDPCVO;
  I: Integer;
begin
  Result := CompilarRegistrosDeAjusteEFDRedBenefPCServiceResult.Create(
    RegistroAjusteEFDPCVOList.Create(),
    RegistroAjusteEFDPCVOList.Create()
  );

  lastM220 := nil;
  lastM620 := nil;
  ajustes := FAjustesRedBenefRepo.ListarPorPeriodo(Input);
  try
    for I := 0 to ajustes.Count - 1 do
      if (ajustes.Items[I].DocFiscalReferenciado = nil)
        or ajustes.Items[I].DocFiscalReferenciado.Regular then
      begin
        {$REGION 'Registro PIS'}

        lastM220 := Result.RegistrosM220.Obter(
          ajustes.Items[I].IndAj,
          IntToStr(ajustes.Items[I].CodAj),
          ajustes.Items[I].ChaveDfe,
          ajustes.Items[I].DescricaoAjuste
        );
        if lastM220 = nil then
        begin
          lastM220 := RegistroAjusteEFDPCVO.Create(
            ajustes.Items[I].IndAj,
            ajustes.Items[I].VPisAj,
            IntToStr(ajustes.Items[I].CodAj),
            ajustes.Items[I].ChaveDfe,
            ajustes.Items[I].DescricaoAjuste,
            ajustes.Items[I].DataRef
          );
          Result.RegistrosM220.Add(lastM220);
        end
        else
          lastM220.AddValue(ajustes.Items[I].VPisAj);

        lastM220.Detalhes.Add(RegistroAjusteDetalheEFDPCVO.Create(
          ajustes.Items[I].VPisAj,
          ajustes.Items[I].Cst,
          ajustes.Items[I].VBC,
          ajustes.Items[I].PPisAj,
          ajustes.Items[I].DataRef,
          ajustes.Items[I].ChaveDfe, // Conforme NT
          ajustes.Items[I].CodContaContabil,
          ajustes.Items[I].InfComplementar
        ));

        {$ENDREGION}

        {$REGION 'Registro COFINS'}

        lastM620 := Result.RegistrosM620.Obter(
          ajustes.Items[I].IndAj,
          IntToStr(ajustes.Items[I].CodAj),
          ajustes.Items[I].ChaveDfe,
          ajustes.Items[I].DescricaoAjuste
        );
        if lastM620 = nil then
        begin
          lastM620 := RegistroAjusteEFDPCVO.Create(
            ajustes.Items[I].IndAj,
            ajustes.Items[I].VCofinsAj,
            IntToStr(ajustes.Items[I].CodAj),
            ajustes.Items[I].ChaveDfe,
            ajustes.Items[I].DescricaoAjuste,
            ajustes.Items[I].DataRef
          );
          Result.RegistrosM620.Add(lastM620);
        end
        else
          lastM620.AddValue(ajustes.Items[I].VCofinsAj);

        lastM620.Detalhes.Add(RegistroAjusteDetalheEFDPCVO.Create(
          ajustes.Items[I].VCofinsAj,
          ajustes.Items[I].Cst,
          ajustes.Items[I].VBC,
          ajustes.Items[I].PCofinsAj,
          ajustes.Items[I].DataRef,
          ajustes.Items[I].ChaveDfe, // Conforme NT
          ajustes.Items[I].CodContaContabil,
          ajustes.Items[I].InfComplementar
        ));

        {$ENDREGION}
      end;

  finally
    ajustes.Free();
  end;
end;

end.
