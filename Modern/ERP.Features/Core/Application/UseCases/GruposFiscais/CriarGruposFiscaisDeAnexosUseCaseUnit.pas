unit CriarGruposFiscaisDeAnexosUseCaseUnit;

interface

uses
  IGruposFiscaisRepositoryUnit,
  IDataBaseConnectionUnit,
  IAnexosRepositoryUnit,
  IEmpresasRepositoryUnit,
  TipoComunsUnit,
  GrupoFiscalEtdUnit,
  TipoTributoFiscalEnumUnit,
  CriarGruposFiscaisDeAnexosTypes;

type
  ICriarGruposFiscaisDeAnexosUseCase = interface
    ['{9EFC3EFC-4CE9-4073-80D7-04280BF7267C}']
    procedure Executar(const Input: CriarGruposFiscaisDeAnexosInput);
  end;

  CriarGruposFiscaisDeAnexosUseCase = class(TInterfacedObject, ICriarGruposFiscaisDeAnexosUseCase)
  private
    FConnection: IDataBaseConnection;
    FGrupoFiscalRepo: IGruposFiscaisRepository;
    FAnexosRepo: IAnexosRepository;
    FEmpresasRepo: IEmpresasRepository;
    function CriarGrupo(const Anexo: string; TipoTribFiscal: TipoTributoFiscalEnum; EmpresasIds: TArrayInteger): GrupoFiscalEtd;
  public
    constructor Create(
      const GrupoFiscalRepo: IGruposFiscaisRepository;
      const AnexosRepo: IAnexosRepository;
      const EmpresasRepo: IEmpresasRepository
    );
    procedure Executar(const Input: CriarGruposFiscaisDeAnexosInput);
  end;


implementation

uses
  SysUtils,
  Classes,
  Contnrs,
  AnexosServiceUnit,
  ITransactionUnit,
  GuidServiceUnit,
  StringNullableUnit,
  EmpresaEtdUnit,
  TiposTributosServiceUnit;

{ CriarGruposFiscaisDeAnexosUseCase }

constructor CriarGruposFiscaisDeAnexosUseCase.Create(
  const GrupoFiscalRepo: IGruposFiscaisRepository;
  const AnexosRepo: IAnexosRepository;
  const EmpresasRepo: IEmpresasRepository
);
begin
  FGrupoFiscalRepo := GrupoFiscalRepo;
  FAnexosRepo := AnexosRepo;
  FEmpresasRepo := EmpresasRepo;
end;

function CriarGruposFiscaisDeAnexosUseCase.CriarGrupo(
  const Anexo: string;
  TipoTribFiscal: TipoTributoFiscalEnum;
  EmpresasIds: TArrayInteger
): GrupoFiscalEtd;
begin
  Result := GrupoFiscalEtd.Create(
    'ANEXO ' + Anexo,
    TipoTribFiscal,
    True,
    StringNullable.Create(Anexo),
    EmpresasIds
  );
end;

procedure CriarGruposFiscaisDeAnexosUseCase.Executar(const Input: CriarGruposFiscaisDeAnexosInput);
var
  anexosList: TStrings;
  anexos: TArrayString;
  grupos: GruposFiscaisEtd;
  G: GrupoFiscalEtd;
  Anexo: string;
  T: ITransaction;
  I, Count: Integer;
  Existe: Boolean;
  EmpresasIds: TArrayInteger;
begin

  SetLength(anexos, 0);

  {$REGION 'obtendo anexos'}

  anexosList := TStringList.Create;
  try
    anexos := AnexosSerice.Agrupar( FAnexosRepo.ListarAnexos(
      TiposTributosService.FiscalToRtcSet(Input.TipoTributo),
      Input.Data
    ));
    for Anexo in anexos do
      anexosList.Add(Anexo);

    SetLength(anexos, Length(Input.Anexos));
    Count := 0;
    for Anexo in Input.Anexos do
      if anexosList.IndexOf(Anexo) > -1 then
      begin
        Inc(Count);
        anexos[Count - 1] := Anexo;
      end;
    SetLength(anexos, Count);
  finally
    anexosList.Free();
  end;

//  if Input.CriarTodos then
//  begin
//    if Input.TipoTributo then
//      anexosIbsCbs := AnexosSerice.Agrupar(
//        FAnexosRepo.ListarAnexosIbsCbs()
//      );
//    if Input.GruposImpostoSeletivo then
//      anexosISel := AnexosSerice.Agrupar(
//        FAnexosRepo.ListarAnexosImpostoSeletivo()
//      );
//  end
//  else // anexos compativeis com estoque
//  begin
//    if Input.GruposIbsCbs then
//      anexosIbsCbs := AnexosSerice.Agrupar(
//        FAnexosRepo.ListarAnexosIbsCbsCompativeisComEstoque()
//      );
//    if Input.GruposImpostoSeletivo then
//      anexosISel := AnexosSerice.Agrupar(
//        FAnexosRepo.ListarAnexosImpostoSeletivoCompativeisComEstoque()
//      );
//  end;
  
  {$ENDREGION}

  {$REGION 'Obtendo todas empresa'}
  
  with FEmpresasRepo.ListarTodas() do
  try
    SetLength(EmpresasIds, Count);
    for I := 0 to Count - 1 do
      EmpresasIds[I] := EmpresaEtd(Items[I]).Id;
  finally
    Free();
  end;
  
  {$ENDREGION}

  grupos := FGrupoFiscalRepo.ListarComAnexoVinculado();
  try

    {$REGION 'Trantando Anexos'}

    for Anexo in anexos do
    begin
      Existe := False;
      for I := 0 to grupos.Count - 1 do
      begin
        G := (grupos.Items[I] as GrupoFiscalEtd);
        if not G.Anexo.IsNull and (g.Anexo.Value = Anexo) and (g.TipoTributo = Input.TipoTributo) then
        begin
          Existe := True;
          Break;
        end;
      end;

      if not Existe then
      begin
        G := CriarGrupo( Anexo, tfIBSCBS, EmpresasIds );
        try
           with FGrupoFiscalRepo.Post( G ) do
             Free();
        finally
          G.Free();
        end;
      end;
    end;
    {$ENDREGION}

  finally
    grupos.Free();
  end;
end;

end.
