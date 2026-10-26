unit NotasConsumidorRepositoryUnit;

interface

uses
  INotasConsumidorRepositoryUnit,
  TipoComunsUnit, QueryResultUnit,
  ContextoDocTribPcModelUnit, UpdateDFeRedBenefPcCalcCommandsUnit, PeriodoEmpresaVOUnit;

type
  NotasConsumidorRepository = class(INotasConsumidorRepository)
  private
    function CreateDocFromQuery(Q: QueryResult): ContextoDocTribPcModel;
  public
    function ObterContextoTribPISCOFINS(const ChaveNFe: string; EmpresaId: Integer): ContextoDocTribPcModel; overload; override;
    function ObterContextoTribPISCOFINS(const Input: PeriodoEmpresaVO): ContextoDocTribPcModelList; overload; override;
    procedure AtualizarRedBenefPcCalculado(const Input: UpdateDFeRedBenefPcCalcCommands); override;
  end;

implementation

uses
  SysUtils,
  StringServiceUnit, ArrayServiceUnit, ParameterValueUnit, ModelosDFeEnumUnit;

{ NotasConsumidorRepository }

procedure NotasConsumidorRepository.AtualizarRedBenefPcCalculado(const Input: UpdateDFeRedBenefPcCalcCommands);
begin
  FConnection.ExecuteCommand(
    'UPDATE NFCE SET ' +
    'REDBENEFPC_CALC = :REDBENEFPC_CALC ' +
    'WHERE COD_NFCE = :COD_NFCE AND COD_EMPRESA = :COD_EMPRESA ',
    ParametersBuilder.Create(3)
      .ByName('COD_NFCE', Input.DFeId )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .ByName('REDBENEFPC_CALC', Ord(Input.RedBenefCalculado))
      .Build()
  );
end;

function NotasConsumidorRepository.ObterContextoTribPISCOFINS(const ChaveNFe: string;
  EmpresaId: Integer): ContextoDocTribPcModel;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' +
    '  n.cod_nfce, n.cod_empresa, n.chave_nfce, n.data_lanc, n.modelo, n.redbenefpc_calc, ' +
    '  ni.pis_cst, ni.nat_rec, ni.ncm, ' +
    '  sum( ' +
    '    ni.vprod - ni.vdesc + ni.vseg + ni.voutro + ni.vfrete ' +
    '  ) valor_liquido, ' +
    '  0 valor_ipi, ' +
    '  sum(ni.icm_vicms) valor_icms ' +
    'from nfce n ' +
    'inner join nfce_item ni on ni.cod_nfce = n.cod_nfce and ni.cod_empresa = n.cod_empresa ' +
    'where n.chave_nfce = :chave_nfce and n.cod_empresa = :cod_empresa ' +
    'group by cod_nfce, cod_empresa, chave_nfce, data_lanc, modelo, redbenefpc_calc , pis_cst, nat_rec, ncm ',
    ParametersBuilder.Create(2)
      .ByName('CHAVE_NFCE', ChaveNFe)
      .ByName('COD_EMPRESA', EmpresaId)
      .Build()
  );
  try
    if Q.IsEmpty then
    begin
      Result := nil;
      Exit;
    end;

    Result := CreateDocFromQuery(Q);

    while not Q.Eof do
    begin
      Result.SomaPorCstNcmNatRec(
        Q.FieldAsString('pis_cst'),
        Q.FieldAsString('ncm'),
        Q.FieldAsString('nat_rec'),
        Q.FieldAsCurrency('valor_liquido'),
        Q.FieldAsCurrency('valor_ipi'),
        Q.FieldAsCurrency('valor_icms')
      );
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function NotasConsumidorRepository.CreateDocFromQuery(Q: QueryResult): ContextoDocTribPcModel;
begin
  Result := ContextoDocTribPcModel.Create(
      Q.FieldAsString('chave_nfce'),
      Q.FieldAsDate('data_lanc'),
      Q.FieldAsInteger('cod_empresa'),
      mdNFCe,
      Q.FieldAsInteger('cod_nfce'),
      Q.FieldAreEquals('redbenefpc_calc', Ord(ynYes))
    );
end;

function NotasConsumidorRepository.ObterContextoTribPISCOFINS(
  const Input: PeriodoEmpresaVO
): ContextoDocTribPcModelList;
var
  Q: QueryResult;
  R: ContextoDocTribPcModel;
  C: Integer;
begin
  Q := FConnection.CreateQuery(
    'select ' +
    '  n.cod_nfce, n.cod_empresa, n.chave_nfce, n.data_lanc, n.modelo, n.redbenefpc_calc, ' +
    '  ni.pis_cst, ni.nat_rec, ni.ncm, ' +
    '  sum( ' +
    '    ni.vprod - ni.vdesc + ni.vseg + ni.voutro + ni.vfrete ' +
    '  ) valor_liquido, ' +
    '  0 valor_ipi, ' +
    '  sum(ni.icm_vicms) valor_icms ' +
    'from nfce n ' +
    'inner join nfce_item ni on ni.cod_nfce = n.cod_nfce and ni.cod_empresa = n.cod_empresa ' +
    'where n.situacao_nfce = ''Autorizada'' ' +
    'and n.cod_empresa = :cod_empresa ' +
    'and n.data_lanc between :dataini and :datafim ' +
    'group by cod_nfce, cod_empresa, chave_nfce, data_lanc, modelo, redbenefpc_calc , pis_cst, nat_rec, ncm ',
    ParametersBuilder.Create(3)
      .ByName('DATAINI', Input.DataInicial)
      .ByName('DATAFIM', Input.DataFinal)
      .ByName('COD_EMPRESA', Input.EmpresaId)
      .Build()
  );
  try
    Result := ContextoDocTribPcModelList.Create();

    C := -1;
    R := nil;
    while not Q.Eof do
    begin
      if C <> Q.FieldAsInteger('cod_nfce') then
      begin
        R := CreateDocFromQuery(Q);
        C := R.CodigoDoc;
        Result.Add(R);
      end;

      R.SomaPorCstNcmNatRec(
        Q.FieldAsString('pis_cst'),
        Q.FieldAsString('ncm'),
        Q.FieldAsString('nat_rec'),
        Q.FieldAsCurrency('valor_liquido'),
        Q.FieldAsCurrency('valor_ipi'),
        Q.FieldAsCurrency('valor_icms')
      );

      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

end.

