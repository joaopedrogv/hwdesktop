unit AvancarPendenciaSefazUseCaseUnit;

interface

uses
  SysUtils, Classes,
  INotasFiscaisRepositoryUnit, SituacaoNFeEnumUnit, AvancarPendenciaSefazInputUnit, NotaFiscalPendenciaSefEtdUnit,
  ITributosDFeRepositoryUnit;

type

  IAvancarPendenciaSefazUseCase = interface
    ['{82630348-6BD6-4E75-938E-608F79AFD3B1}']
    function Executar(const Input: AvancarPendenciaSefazInput): NotaFiscalPendenciaSefEtd;
  end;

  AvancarPendenciaSefazUseCase = class(TInterfacedObject, IAvancarPendenciaSefazUseCase)
  public
    FNotasRepo: INotasFiscaisRepository;
    FTributosRtcRepo: ITributosDFeRepository;
  public
    constructor Create(NotasRepo: INotasFiscaisRepository; TributosRtcRepo: ITributosDFeRepository);
    function Executar(const Input: AvancarPendenciaSefazInput): NotaFiscalPendenciaSefEtd;
  end;

implementation

uses
  UpdatePendenciaSefazAvancoCommandUnit, StatusResolucaoNFeSefEnumUnit, NotaFiscalItemContextoRtcModelUnit,
  TributoDFeContextEtdUnit, GuidServiceUnit, UpdateNotaFiscalItemContextoRtcCommandUnit, StringNullableUnit,
  EValidacaoNegocioUnit;

{ AvancarPendenciaSefazUseCase }

constructor AvancarPendenciaSefazUseCase.Create(
  NotasRepo: INotasFiscaisRepository; TributosRtcRepo: ITributosDFeRepository
);
begin
  FNotasRepo := NotasRepo;
  FTributosRtcRepo := TributosRtcRepo;
end;

function AvancarPendenciaSefazUseCase.Executar(const Input: AvancarPendenciaSefazInput): NotaFiscalPendenciaSefEtd;
var
  ItensNF: NotaFiscalItemContextoRtcModelList;
  ItensTrib: TributoDFeContextEtdList;
  ItemNF: NotaFiscalItemContextoRtcModel;
  ItemTrib: TributoDFeContextEtd;
  I: Integer;
begin

  case Input.SituacaoNfContingencia of
    // Situacoes finalizadas
    stAutorizada, stCancelada, stDenegada, stInutilizada:
      begin
        case Input.SituacaoNfPendente of

          stAutorizada, stCancelada, stDenegada, stInutilizada:
            Result := FNotasRepo.AtualizarAvancoPendenciaSEFAZ(UpdatePendenciaSefazAvancoCommand.Create(
              Input.NfContigenciaId, Input.EmpresaId, srsResolvida
            ));

          else
            raise EValidacaoNegocio.Create(
              'O sistema não conseguiu resolver o cStat da resposta da SEFAZ para a NF Pendente para uma NFe em Contingência Finalizada'
            );
        end;
      end;

    else
    begin

      case Input.SituacaoNfPendente of
        stVazio, stRejeitada, stAInutilizar:
          begin
            Result := FNotasRepo.AtualizarAvancoPendenciaSEFAZ(UpdatePendenciaSefazAvancoCommand.Create(
              Input.NfContigenciaId, Input.EmpresaId, srsAInutilizar
            ));
          end;

        stAutorizada:
          begin
            FNotasRepo.CompletarNFePendenteAutorizada(
              Input.NfContigenciaId, Input.NfPendenteId, Input.EmpresaId
            );

            ItensNF := FNotasRepo.ObterItensContextoRtc(Input.NfContigenciaId, Input.EmpresaId);
            ItensTrib := FTributosRtcRepo.ListarPofNF(Input.NfContigenciaId, Input.EmpresaId);
            try
              for I := 0 to ItensNF.Count - 1 do
              begin
                ItemNF := ItensNF.Items[I];
                ItemTrib := ItensTrib.GetById(ItemNF.DfeTribId.Value);
                if ItemTrib <> nil then
                begin
                  ItemTrib.Id := UpperCase(GuidService.New);
                  FTributosRtcRepo.Post(ItemTrib);

                  FNotasRepo.AtualizarItemContextoRtc(UpdateNotaFiscalItemContextoRtcCommand.Create(
                    Input.NfPendenteId,
                    Input.EmpresaId,
                    ItemNF.Nitem,
                    StringNullable.Create(ItemTrib.Id)
                  ));
                end;

              end;
            finally
              ItensNF.Free();
              ItensTrib.Free();
            end;

            Result := FNotasRepo.AtualizarAvancoPendenciaSEFAZ(UpdatePendenciaSefazAvancoCommand.Create(
              Input.NfContigenciaId, Input.EmpresaId, srsACancelar
            ));
          end;

        stCancelada, stDenegada:
          begin
            Result := FNotasRepo.AtualizarAvancoPendenciaSEFAZ(UpdatePendenciaSefazAvancoCommand.Create(
              Input.NfContigenciaId, Input.EmpresaId, srsACancelar
            ));
          end;

        stEmProcessamento:
          raise EValidacaoNegocio.Create('A NF Pendente está "Em Processamento" na SEFAZ, é necessário aguardar');

        else
          raise EValidacaoNegocio.Create('O sistema não conseguiu resolver o cStat da resposta da SEFAZ para a NF Pendente');
      end;
    end;
  end;
end;

end.
