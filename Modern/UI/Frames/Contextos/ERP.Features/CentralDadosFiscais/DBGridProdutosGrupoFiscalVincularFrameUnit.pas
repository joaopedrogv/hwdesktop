unit DBGridProdutosGrupoFiscalVincularFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDataSet_OOP, Grids, DBGrids, ExtCtrls,
  ProdutoGrupoFiscalUpdateModelUnit, TipoTributoFiscalEnumUnit, DBGridFrameUnit;

type
  
  TDBGridProdutosGrupoFiscalVincularFrameSetup = record
  private
    FTipoTributo: TipoTributoFiscalEnum;
    FDataReferencia: TDate;
    FGridParams: TDBGridFrameSetup;
  public
    class function Create(         
      TipoTributo: TipoTributoFiscalEnum;
      DataReferencia: TDate;
      const GridParams: TDBGridFrameSetup
    ): TDBGridProdutosGrupoFiscalVincularFrameSetup; static;

    property TipoTributo: TipoTributoFiscalEnum read FTipoTributo;
    property DataReferencia: TDate read FDataReferencia;
    property GridParams: TDBGridFrameSetup read FGridParams;
  end;

  TDBGridProdutosGrupoFiscalVincularFrame = class(TFrame)
    gridProdutos: TDBGridFrame;
  private
    FProdutos: TDataSet_OOP;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Setup(const Input: TDBGridProdutosGrupoFiscalVincularFrameSetup);

    function GetSelecionados(): ProdutoGrupoFiscalUpdateModelArray;

    procedure ExecutarUmProdutoParaUmAnexo(DataRevisao: TDate);
    procedure ExecutarUmProdutoParaUmAnexoPorNCM( const NCM: string; DataRevisao: TDate);

    procedure ExecutarNProdutosParaUmAnexo(DataRevisao: TDate);
    procedure ExecutarNProdutosParaUmAnexoPorNCM( const NCM: string; DataRevisao: TDate);

    procedure ExecutarInconpativeis(DataRevisao: TDate);
    procedure ExecutarInconpativeisPorNCM( const NCM: string; DataRevisao: TDate);
  end;

implementation

uses
  uDtmAtivo,
  DB,
  DbGridConfigUtilsUnit,
  FieldsConfigUnit,
  TipoTributoEnumUnit,
  TiposTributosServiceUnit,
  StringNullableUnit,
  ParameterValueUnit;

{$R *.dfm}

type
  TProdutosVincularOOP = class(TDataSet_OOP)
  private
    FSqlWith: string;
    FDataReferencia: TDate;  
    FFieldSelecao: TField;
  public
    constructor Create();

    procedure Setup(TipoTributo: TipoTributoFiscalEnum; DataReferencia: TDate; const ACampoSelecao: string = '');

    procedure ExecutarUmProdutoParaUmAnexo( DataRevisao: TDate );
    procedure ExecutarUmProdutoParaUmAnexoPorNCM( const NCM: string; DataRevisao: TDate );

    procedure ExecutarNProdutosParaUmAnexo( DataRevisao: TDate );
    procedure ExecutarNProdutosParaUmAnexoPorNCM( const NCM: string; DataRevisao: TDate );

    procedure ExecutarInconpativeis(DataRevisao: TDate);
    procedure ExecutarInconpativeisPorNCM( const NCM: string; DataRevisao: TDate);

    function GetSelecionados(): ProdutoGrupoFiscalUpdateModelArray;
  end;

{ TProdutosVincularOOP }

constructor TProdutosVincularOOP.Create;
begin
  TableName := 'PRODUTOS';
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_prod_vinc');
end;

procedure TProdutosVincularOOP.ExecutarInconpativeis(DataRevisao: TDate);
begin
  Self.Close();
  Self.SQLClient( FSqlWith +
    'select p.grupo_prod, p.cod_prod, p.cod_empresa, p.nbm, p.descr_prod, g.id grupo_fiscal_ibscbs, ' +
    '       p.min_anexo, p.max_anexo, p.count_anexo, p.count_excecao, p.min_resolvido, ' +
    '       p.anexo_atual, g.anexo ' +
    'from prod_anx p ' +
    'inner join grupos_fiscais g on g.gerido_sistema = 1 and g.anexo = p.min_anexo ' +
    'where p.anexo <> g.anexo and p.count_excecao = 0 ' +
    '  and p.cod_empresa = :cod_empresa ' +
    'order by nbm, descr_prod ')
    .ParamValue('cod_empresa', vDadosIni.cod_empresa)
    .ParamValue('data', FDataReferencia)
    .ParamValue('datarevisao', DataRevisao)
    .Open();
end;

procedure TProdutosVincularOOP.ExecutarInconpativeisPorNCM(const NCM: string;
  DataRevisao: TDate);
begin
  Self.Close();
  Self.SQLClient( FSqlWith +
    'select p.grupo_prod, p.cod_prod, p.cod_empresa, p.nbm, p.descr_prod, g.id grupo_fiscal_ibscbs, ' +
    '       p.min_anexo, p.max_anexo, p.count_anexo, p.count_excecao, p.min_resolvido, ' +
    '       p.anexo_atual, g.anexo ' +
    'from prod_anx p ' +
    'inner join grupos_fiscais g on g.gerido_sistema = 1 and g.anexo = p.min_anexo ' +
    'where p.anexo <> g.anexo and p.count_excecao = 0 ' +
    '  and p.nbm = :ncm and p.cod_empresa = :cod_empresa ' +
    'order by nbm, descr_prod ')
    .ParamValue('cod_empresa', vDadosIni.cod_empresa)
    .ParamValue('data', FDataReferencia)
    .ParamValue('datarevisao', DataRevisao)
    .ParamValue('ncm', NCM)
    .Open();
end;

procedure TProdutosVincularOOP.ExecutarNProdutosParaUmAnexo(DataRevisao: TDate);
begin
  Self.Close();
  Self.SQLClient( FSqlWith +
    'select p.grupo_prod, p.cod_prod, p.cod_empresa, p.nbm, p.descr_prod, g.id grupo_fiscal_ibscbs, ' +
    '       p.min_anexo, p.max_anexo, p.count_anexo, p.count_excecao, p.min_resolvido, ' +
    '       p.anexo_atual, g.anexo ' +
    'from prod_anx p ' +
    'inner join grupos_fiscais g on g.gerido_sistema = 1 and g.anexo = p.min_anexo ' +
    'where p.count_anexo > 1 and p.count_excecao = 0 ' +
    '  and p.cod_empresa = :cod_empresa ' +
    'order by nbm, descr_prod ')
    .ParamValue('cod_empresa', vDadosIni.cod_empresa)
    .ParamValue('data', FDataReferencia)
    .ParamValue('datarevisao', DataRevisao)
    .Open();
end;

procedure TProdutosVincularOOP.ExecutarNProdutosParaUmAnexoPorNCM(
  const NCM: string; DataRevisao: TDate);
begin
  Self.Close();
  Self.SQLClient( FSqlWith +
    'select p.grupo_prod, p.cod_prod, p.cod_empresa, p.nbm, p.descr_prod, g.id grupo_fiscal_ibscbs, ' +
    '       p.min_anexo, p.max_anexo, p.count_anexo, p.count_excecao, p.min_resolvido, ' +
    '       p.anexo_atual, g.anexo ' +
    'from prod_anx p ' +
    'inner join grupos_fiscais g on g.gerido_sistema = 1 and g.anexo = p.min_anexo ' +
    'where p.count_anexo > 1 and p.count_excecao = 0 ' +
    '  and p.nbm = :ncm and p.cod_empresa = :cod_empresa ' +
    'order by nbm, descr_prod ')
    .ParamValue('cod_empresa', vDadosIni.cod_empresa)
    .ParamValue('data', FDataReferencia)
    .ParamValue('datarevisao', DataRevisao)
    .ParamValue('ncm', NCM)
    .Open();
end;

procedure TProdutosVincularOOP.ExecutarUmProdutoParaUmAnexo( DataRevisao: TDate );
begin
  Self.Close();
  Self.SQLClient( FSqlWith +
    'select p.grupo_prod, p.cod_prod, p.cod_empresa, p.nbm, p.descr_prod, g.id grupo_fiscal_ibscbs, ' +
    '       p.min_anexo, p.max_anexo, p.count_anexo, p.count_excecao, p.min_resolvido, ' +
    '       p.anexo_atual, g.anexo ' +
    'from prod_anx p ' +
    'inner join grupos_fiscais g on g.gerido_sistema = 1 and g.anexo = p.min_anexo ' +
    'where p.count_anexo = 1 and p.count_excecao = 0 ' +
    '  and p.cod_empresa = :cod_empresa ' +
    'order by nbm, descr_prod ')
    .ParamValue('cod_empresa', vDadosIni.cod_empresa)
    .ParamValue('data', FDataReferencia)
    .ParamValue('datarevisao', DataRevisao)
    .Open();
end;

procedure TProdutosVincularOOP.ExecutarUmProdutoParaUmAnexoPorNCM(
  const NCM: string; DataRevisao: TDate);
begin
  Self.Close();
  Self.SQLClient( FSqlWith +
    'select p.grupo_prod, p.cod_prod, p.cod_empresa, p.nbm, p.descr_prod, g.id grupo_fiscal_ibscbs, ' +
    '       p.min_anexo, p.max_anexo, p.count_anexo, p.count_excecao, p.min_resolvido, ' +
    '       p.anexo_atual, g.anexo ' +
    'from prod_anx p ' +
    'inner join grupos_fiscais g on g.gerido_sistema = 1 and g.anexo = p.min_anexo ' +
    'where p.count_anexo = 1 and p.count_excecao = 0 ' +
    '  and p.nbm = :ncm and p.cod_empresa = :cod_empresa ' +
    'order by nbm, descr_prod ')
    .ParamValue('cod_empresa', vDadosIni.cod_empresa)
    .ParamValue('data', FDataReferencia)
    .ParamValue('datarevisao', DataRevisao)
    .ParamValue('ncm', NCM)
    .Open();
end;

function TProdutosVincularOOP.GetSelecionados: ProdutoGrupoFiscalUpdateModelArray;
var
  Count: Integer;
begin
  Self.prepare_loop();
  try
    Count := 0;
    SetLength(Result, dataSet.RecordCount);
    while not Self.Eof do
    begin
      if Count >= Length(Result) then
        SetLength(Result, Length(Result) + 32);

      Inc(Count);

      if not Assigned(FFieldSelecao) or FFieldSelecao.AsBoolean then
        Result[Count - 1] := ProdutoGrupoFiscalUpdateModel.Create(
          fint('grupo_prod'),
          fstr('cod_prod'),
          fint('cod_empresa'),
          StringNullable.CreateOrNull( fstr('grupo_fiscal_ibscbs') )
        );

      Self.Next;
    end;

    SetLength(Result, Count);

  finally
    Self.prepare_loop_done();
  end;
end;

procedure TProdutosVincularOOP.Setup(
  TipoTributo: TipoTributoFiscalEnum;
  DataReferencia: TDate;
  const ACampoSelecao: string
);
var
  sTiposTrib: string;
  setTipos: TipoTributoEnumSet;
begin
  setTipos := TiposTributosService.FiscalToRtcSet( TipoTributo );
  sTiposTrib := TiposTributosService.SetToStr( setTipos );

  FDataReferencia := DataReferencia;

  FSqlWith := Format(
    'with prod_anx as ( ' +
    '  select p.grupo_prod, p.cod_prod, p.cod_empresa, p.nbm, p.descr_prod, p.grupo_fiscal_ibscbs, g.anexo, g.anexo anexo_atual, ' +
    '         min(a.anxo_numero) min_anexo, ' +
    '         max(a.anxo_numero) max_anexo, count(distinct a.anxo_numero) count_anexo, count(distinct e.encm_id) count_excecao, ' +
    '         min(p.grupo_fiscal_ibscbs_resolvid_em) min_resolvido '+ 
    '  from produtos p ' + 
    '    inner join rtc_ncm_aplicavel na on na.ncma_ncm_cd in ( ' +
    '      substr(p.nbm, 1, 8), substr(p.nbm, 1, 7), substr(p.nbm, 1, 6), substr(p.nbm, 1, 5), ' +
    '      substr(p.nbm, 1, 4), substr(p.nbm, 1, 3), substr(p.nbm, 1, 2) ' +
    '    ) ' +
    '    inner join rtc_anexo a on na.ncma_anxo_id = a.anxo_id ' +
    '    inner join rtc_classificacao_tributaria c on c.cltr_id = na.ncma_cltr_id ' +
    '    inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '    inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '    left join rtc_excecao_ncm_aplicavel e on e.encm_ncma_id = na.ncma_id ' +
    '      and p.nbm starting with e.encm_ncm_cd ' +
    '      and :data between e.encm_inicio_vigencia and coalesce(e.encm_fim_vigencia, :data) ' +
    '    left join grupos_fiscais g on g.id = p.grupo_fiscal_ibscbs '+
    '  where p.ativo <> 99 and p.cod_empresa = :cod_empresa ' +
    '    and tst.tipo_tributo in (%s) and :data between a.anxo_inicio_vigencia and coalesce(a.anxo_fim_vigencia, :data) ' +
    '    and :data between na.ncma_inicio_vigencia and coalesce(na.ncma_fim_vigencia, :data) ' + 
    '    and :data between c.cltr_inicio_vigencia and coalesce(c.cltr_fim_vigencia, :data) ' + 
    '    and :data between st.sitr_inicio_vigencia and coalesce(st.sitr_fim_vigencia, :data) ' + 
    '    and :data between tst.trst_inicio_vigencia and coalesce(tst.trst_fim_vigencia, :data) ' +
    '    and coalesce(p.grupo_fiscal_ibscbs_resolvid_em, :datarevisao) <= :datarevisao ' +
    '  group by grupo_prod, cod_prod, cod_empresa, nbm, descr_prod, grupo_fiscal_ibscbs, anexo, anexo_atual ' + 
    ') ',
    [ sTiposTrib ]
  );

  with queryCons.SQL('%s select * from prod_anx where 1=0', [ FSqlWith ]).Open() do
  try
    AssignAndCreateFieldsFrom( query );
  finally
    Close();
  end;

  if ACampoSelecao <> '' then
  begin
    AddFieldInternalCalc(ACampoSelecao, ftBoolean);
    FFieldSelecao := dataSet.FindField(ACampoSelecao);
  end;
end;

{ TDBGridProdutosGrupoFiscalVincularFrame }

constructor TDBGridProdutosGrupoFiscalVincularFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FProdutos := TProdutosVincularOOP.Create();
  
end;

destructor TDBGridProdutosGrupoFiscalVincularFrame.Destroy;
begin
  FProdutos.Free();

  inherited;
end;

procedure TDBGridProdutosGrupoFiscalVincularFrame.ExecutarInconpativeis(
  DataRevisao: TDate);
begin
  TProdutosVincularOOP(FProdutos).ExecutarInconpativeis( DataRevisao );
end;

procedure TDBGridProdutosGrupoFiscalVincularFrame.ExecutarInconpativeisPorNCM(
  const NCM: string; DataRevisao: TDate);
begin
  TProdutosVincularOOP(FProdutos).ExecutarInconpativeisPorNCM( NCM, DataRevisao );
end;

procedure TDBGridProdutosGrupoFiscalVincularFrame.ExecutarNProdutosParaUmAnexo(
  DataRevisao: TDate);
begin
  TProdutosVincularOOP(FProdutos).ExecutarNProdutosParaUmAnexo( DataRevisao );
end;

procedure TDBGridProdutosGrupoFiscalVincularFrame.ExecutarNProdutosParaUmAnexoPorNCM(
  const NCM: string; DataRevisao: TDate);
begin
  TProdutosVincularOOP(FProdutos).ExecutarNProdutosParaUmAnexoPorNCM( NCM, DataRevisao );
end;

procedure TDBGridProdutosGrupoFiscalVincularFrame.ExecutarUmProdutoParaUmAnexo(
  DataRevisao: TDate);
begin
  TProdutosVincularOOP(FProdutos).ExecutarUmProdutoParaUmAnexo( DataRevisao );
end;

procedure TDBGridProdutosGrupoFiscalVincularFrame.ExecutarUmProdutoParaUmAnexoPorNCM(
  const NCM: string;
  DataRevisao: TDate);
begin
  TProdutosVincularOOP(FProdutos).ExecutarUmProdutoParaUmAnexoPorNCM( NCM, DataRevisao );
end;

function TDBGridProdutosGrupoFiscalVincularFrame.GetSelecionados: ProdutoGrupoFiscalUpdateModelArray;
begin
  Result := TProdutosVincularOOP(FProdutos).GetSelecionados();
end;

procedure TDBGridProdutosGrupoFiscalVincularFrame.Setup(
  const Input: TDBGridProdutosGrupoFiscalVincularFrameSetup
);
var
  builder : IFieldsConfigBuilder;
begin
  builder := FieldsConfigFactory.Create();

  TProdutosVincularOOP(FProdutos).Setup( Input.TipoTributo, Input.DataReferencia, Input.GridParams.SelectionField );

  gridProdutos.Setup( Input.GridParams );
  gridProdutos.DataSource := FProdutos._dataSourceOOP;

  if Input.GridParams.SelectionField <> '' then
    builder.Add(Input.GridParams.SelectionField, '..', fvSempreVisivel);

  builder.Add('cod_empresa,grupo_fiscal_ibscbs,min_anexo,max_anexo,count_anexo,count_excecao', fvInvisivel)
      .Add('grupo_prod', 'Cod Grupo' )
      .Add('cod_prod', 'Cod Produtos')
      .Add('nbm', 'NCM', fvSempreVisivel)
      .Add('descr_prod', 'Descricao', fvSempreVisivel)
      .Add('anexo_atual', 'Anexo Atual')
      .Add('min_resolvido', 'Resolvido em', fvSempreVisivel);

  DbGridConfigUtils.ApplyToDBGrid( gridProdutos.DBGrid, builder.List );
end;

{ TDBGridProdutosGrupoFiscalVincularFrameSetup }

class function TDBGridProdutosGrupoFiscalVincularFrameSetup.Create(
  TipoTributo: TipoTributoFiscalEnum; DataReferencia: TDate;
  const GridParams: TDBGridFrameSetup): TDBGridProdutosGrupoFiscalVincularFrameSetup;
begin
  Result.FTipoTributo := TipoTributo;
  Result.FDataReferencia := DataReferencia;
  Result.FGridParams := GridParams;
end;

end.
