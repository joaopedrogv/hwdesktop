unit DbGridNcmsGrupoFiscalVincularFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDataSet_OOP, Grids, DBGrids, ExtCtrls,
  ProdutoNcmGrupoFiscalUpdateModelUnit, TipoTributoFiscalEnumUnit,
  DBGridFrameUnit;

type
  TDbGridNcmsGrupoFiscalVincularFrameChange = procedure(const NCM: string) of object;

  TDbGridNcmsGrupoFiscalVincularFrameSetup = record
  private
    FTipoTributo: TipoTributoFiscalEnum;
    FDataReferencia: TDate;
    FGridParams: TDBGridFrameSetup;
    FEnableGridAnexos: Boolean;
  public
    class function Create(         
      TipoTributo: TipoTributoFiscalEnum;
      DataReferencia: TDate;
      const GridParams: TDBGridFrameSetup;
      EnableGridAnexos: Boolean
    ): TDbGridNcmsGrupoFiscalVincularFrameSetup; static;

    property TipoTributo: TipoTributoFiscalEnum read FTipoTributo;
    property DataReferencia: TDate read FDataReferencia;
    property GridParams: TDBGridFrameSetup read FGridParams;
    property EnableGridAnexos: Boolean read FEnableGridAnexos;
  end; 

  TDbGridNcmsGrupoFiscalVincularFrame = class(TFrame)
    gridRaiz: TDBGrid;
    SplitterNcms: TSplitter;
    pnNcm: TPanel;
    pnRaiz: TPanel;
    gridNcm: TDBGridFrame;
    pnAnexos: TPanel;
    gridAnexos: TDBGrid;
  private
    FTimerNcmChange: TTimer;
    FNcm: TDataSet_OOP;
    FOnChange: TDbGridNcmsGrupoFiscalVincularFrameChange;

    procedure TimerNcmChangeTimer(Sender: TObject);
    procedure DoNcmChange(const NCM: string);
    procedure SetOnChange(const Value: TDbGridNcmsGrupoFiscalVincularFrameChange);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Setup(const Input: TDbGridNcmsGrupoFiscalVincularFrameSetup);

    procedure ExecutarUmParaUm(DataRevisao: TDate);
    procedure ExecutarNParaUm(DataRevisao: TDate);
    procedure ExecutarInconpativeis(DataRevisao: TDate);

    function GetSelecionados(): ProdutoNcmGrupoFiscalUpdateModelArray;
    function GetSelecionado(): ProdutoNcmGrupoFiscalUpdateModel;

    property OnChange: TDbGridNcmsGrupoFiscalVincularFrameChange write SetOnChange;
  end;

implementation

{$R *.dfm}

uses
  uDtmAtivo,
  DB,
  FieldsConfigUnit,
  DbGridConfigUtilsUnit,
  TipoTributoEnumUnit,
  TiposTributosServiceUnit, StringNullableUnit;

type

  TNcmsRaizOOP = class(TDataSet_OOP)
  public
    constructor Create();
    procedure ExecutarUmParaUm(const NCM: string; DataReferencia: TDate);
  end;

  TNcmsAnexosOOP = class(TDataSet_OOP)
  private
    FDataReferencia: TDate;
  public
    constructor Create();
    procedure Setup(TipoTributo: TipoTributoFiscalEnum; DataReferencia: TDate);
    procedure Executar(const NCM: string);
  end;

  TNcmsProdutosOOP = class(TDataSet_OOP)
  private
    FSqlWith: string;
    FFieldSelecao: TField;
    FRaiz: TNcmsRaizOOP;
    FAnexos: TNcmsAnexosOOP;
    FDataReferencia: TDate;
    FOnChange: TDbGridNcmsGrupoFiscalVincularFrameChange;
    FLastNCM: string;

    procedure NCMProdutosOOPAfterScroll(DataSet: TDataSet);

    property LastNCM: string read FLastNCM;
  public
    constructor Create();
    destructor Destroy; override;

    procedure Setup(TipoTributo: TipoTributoFiscalEnum; DataReferencia: TDate; const ACampoSelecao: string = '');

    procedure ExecutarUmNcmParaUmAnexo( DataRevisao: TDate );
    procedure ExecutarMaisDeUmNcmParaUmAnexo( DataRevisao: TDate );
    procedure ExecutarInconpativeis( DataRevisao: TDate );

    function GetSelecionados(): ProdutoNcmGrupoFiscalUpdateModelArray;
    function GetSelecionado(): ProdutoNcmGrupoFiscalUpdateModel;

    property OnChange: TDbGridNcmsGrupoFiscalVincularFrameChange write FOnChange;
  end;

{ TNcmsRaizOOP }

constructor TNcmsRaizOOP.Create;
begin
  TableName := 'NCMS';
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_ncm_anexo_raiz');

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('codigo', 'NCM', fvSempreVisivel)
      .Add('descricao', 'Descricao', fvSempreVisivel)
  );

  ClientOpen(
    'select distinct nc.codigo, nc.descricao from ncm nc where 1=0'
  );
end;

procedure TNcmsRaizOOP.ExecutarUmParaUm(const NCM: string; DataReferencia: TDate);
begin
  Self.Close();
  Self.SQLClient( Format(
    'select distinct nc.codigo, nc.descricao from ( ' +
    '  select  %s ncm from rdb$database ' +
    ') as c ' +
    'inner join ncm nc on nc.codigo in ( ' +
    '  substr(c.ncm, 1, 8), ' +
    '  substr(c.ncm, 1, 7), ' +
    '  substr(c.ncm, 1, 6), ' +
    '  substr(c.ncm, 1, 5), ' +
    '  substr(c.ncm, 1, 4), ' +
    '  substr(c.ncm, 1, 3), ' +
    '  substr(c.ncm, 1, 2) ' +
    ') ' +
    'where :data between nc.data_inicio and coalesce(nc.data_fim, :data) ' +
    'order by char_length(nc.codigo) ',
    [ QuotedStr(NCM) ]))
    .ParamValue('data', DataReferencia)
    .Open();
end;

{ TNcmsProdutosOOP }

constructor TNcmsProdutosOOP.Create;
begin
  TableName := 'NCM';
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_ncm_anexo');

  FRaiz := TNcmsRaizOOP.Create();
  FAnexos := TNcmsAnexosOOP.Create();

  FLastNCM := '';

  dataSet.AfterScroll := NCMProdutosOOPAfterScroll;
end;

destructor TNcmsProdutosOOP.Destroy;
begin
  FRaiz.Free();
  FAnexos.Free();
  inherited;
end;

procedure TNcmsProdutosOOP.ExecutarInconpativeis(DataRevisao: TDate);
begin
  dataSet.AfterScroll := nil;
  try
    Self.Close();
    Self.SQLClient( FSqlWith +
      'select n.codigo, n.descricao, n.min_anexo, n.max_anexo, ' +
      '       n.min_resolvido, n.max_resolvido, g.id grupo_fiscal_ibscbs, '' '' anexo, ' +
      '       min(n.count_anexo) count_anexo, cast(sum(n.count_produto) as integer) count_produto, ' +
      '       min(n.count_excecao) count_excecao ' +
      'from ncm_anx n ' +
      'inner join grupos_fiscais g on g.gerido_sistema = 1 and g.anexo = n.min_anexo ' +
      'where n.anexo <> g.anexo and n.count_excecao = 0 ' +
      'group by 1,2,3,4,5,6,7 ' +
      'order by codigo, descricao ')
      .ParamValue('cod_empresa', vDadosIni.cod_empresa)
      .ParamValue('data', FDataReferencia)
      .ParamValue('datarevisao', DataRevisao)
      .Open();

    NCMProdutosOOPAfterScroll(FRaiz.DataSet);

  finally
    dataSet.AfterScroll := NCMProdutosOOPAfterScroll;
  end;
end;

procedure TNcmsProdutosOOP.ExecutarMaisDeUmNcmParaUmAnexo(DataRevisao: TDate);
begin
  dataSet.AfterScroll := nil;
  try
    Self.Close();
    Self.SQLClient( FSqlWith +
      'select n.codigo, n.descricao, n.min_anexo, n.max_anexo, n.count_anexo, n.count_produto, ' +
      '       n.count_excecao, n.min_resolvido, n.max_resolvido, g.id grupo_fiscal_ibscbs, n.anexo ' +
      'from ncm_anx n ' +
      'inner join grupos_fiscais g on g.gerido_sistema = 1 and g.anexo = n.min_anexo ' +
      'where n.count_anexo > 1 and n.count_excecao = 0 ' +
      'order by codigo, descricao ')
      .ParamValue('cod_empresa', vDadosIni.cod_empresa)
      .ParamValue('data', FDataReferencia)
      .ParamValue('datarevisao', DataRevisao)
      .Open();

    NCMProdutosOOPAfterScroll(FRaiz.DataSet);

  finally
    dataSet.AfterScroll := NCMProdutosOOPAfterScroll;
  end;
end;

procedure TNcmsProdutosOOP.ExecutarUmNcmParaUmAnexo(
  DataRevisao: TDate
);
begin
  dataSet.AfterScroll := nil;
  try
    Self.Close();
    Self.SQLClient( FSqlWith +
      'select n.codigo, n.descricao, n.min_anexo, n.max_anexo, n.count_anexo, n.count_produto, ' +
      '       n.count_excecao, n.min_resolvido, n.max_resolvido, g.id grupo_fiscal_ibscbs, n.anexo ' +
      'from ncm_anx n ' +
      'inner join grupos_fiscais g on g.gerido_sistema = 1 and g.anexo = n.min_anexo ' +
      'where n.count_anexo = 1 and n.count_excecao = 0 ' +
      'order by codigo, descricao ')
      .ParamValue('cod_empresa', vDadosIni.cod_empresa)
      .ParamValue('data', FDataReferencia)
      .ParamValue('datarevisao', DataRevisao)
      .Open();

    NCMProdutosOOPAfterScroll(FRaiz.DataSet);

  finally
    dataSet.AfterScroll := NCMProdutosOOPAfterScroll;
  end;
end;

function TNcmsProdutosOOP.GetSelecionado: ProdutoNcmGrupoFiscalUpdateModel;
begin
  Result := ProdutoNcmGrupoFiscalUpdateModel.Create(
    fstr('codigo'),
    vDadosIni.cod_empresa,
    StringNullable.CreateOrNull( fstr('grupo_fiscal_ibscbs') )
  );
end;

function TNcmsProdutosOOP.GetSelecionados: ProdutoNcmGrupoFiscalUpdateModelArray;
var
  Count: Integer;
begin
  dataSet.AfterScroll := nil;
  Self.prepare_loop();
  try
    Count := 0;
    SetLength(Result, dataSet.RecordCount);
    while not Self.Eof do
    begin
      if Count >= Length(Result) then
        SetLength(Result, Length(Result) + 32);

      Inc(Count);
      Result[Count - 1] := ProdutoNcmGrupoFiscalUpdateModel.Create(
        fstr('codigo'),
        vDadosIni.cod_empresa,
        StringNullable.CreateOrNull( fstr('grupo_fiscal_ibscbs') )
      );

      Self.Next;
    end;

    SetLength(Result, Count);

  finally
    Self.prepare_loop_done();
    dataSet.AfterScroll := NCMProdutosOOPAfterScroll;
  end;
end;

procedure TNcmsProdutosOOP.NCMProdutosOOPAfterScroll(DataSet: TDataSet);
begin
  FLastNCM := fstr('codigo');
  if Assigned(FOnChange) then
    FOnChange( FLastNCM );
end;

procedure TNcmsProdutosOOP.Setup(
  TipoTributo: TipoTributoFiscalEnum;
  DataReferencia: TDate;
  const ACampoSelecao: string
);
var
  sTiposTrib: string;
  setTipos: TipoTributoEnumSet;
begin
  FDataReferencia := DataReferencia;

  FFieldSelecao := nil;

  setTipos := TiposTributosService.FiscalToRtcSet(TipoTributo);
  sTiposTrib := TiposTributosService.SetToStr( setTipos );

  FSqlWith := Format(
    'with ncm_anx as ( ' +
    '  select distinct ' +
    '    ncm.codigo, ncm.descricao, cast(null as CHAR(36)) grupo_fiscal_ibscbs, g.anexo, ' +
    '    min(a.anxo_numero) min_anexo, max(a.anxo_numero) max_anexo, count(distinct a.anxo_numero) count_anexo, ' +
    '    count(distinct p.cod_prod) count_produto, count(distinct e.encm_id) count_excecao, ' +
    '    min(p.grupo_fiscal_ibscbs_resolvid_em) min_resolvido, max(p.grupo_fiscal_ibscbs_resolvid_em) max_resolvido '+
    '  from produtos p ' +
    '  inner join ncm on ncm.codigo = p.nbm ' +
    '  inner join rtc_ncm_aplicavel na on na.ncma_ncm_cd in ( ' + 
    '    substr(p.nbm, 1, 8), substr(p.nbm, 1, 7), substr(p.nbm, 1, 6), substr(p.nbm, 1, 5), ' +
    '    substr(p.nbm, 1, 4), substr(p.nbm, 1, 3), substr(p.nbm, 1, 2) ' + 
    '  ) ' +
    '  inner join rtc_anexo a on na.ncma_anxo_id = a.anxo_id ' + 
    '  inner join rtc_classificacao_tributaria c on c.cltr_id = na.ncma_cltr_id ' +
    '  inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '  inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '  left join rtc_excecao_ncm_aplicavel e on e.encm_ncma_id = na.ncma_id ' +
    '    and p.nbm starting with e.encm_ncm_cd ' +
    '    and :data between e.encm_inicio_vigencia and coalesce(e.encm_fim_vigencia, :data) ' +
    '  left join grupos_fiscais g on g.id = p.grupo_fiscal_ibscbs ' +
    '  where p.ativo <> 99 and p.cod_empresa = :cod_empresa ' +
    '    and :data between ncm.data_inicio and coalesce(ncm.data_fim, :data) ' + 
    '    and tst.tipo_tributo in (%s) and :data between a.anxo_inicio_vigencia and coalesce(a.anxo_fim_vigencia, :data) ' +
    '    and :data between na.ncma_inicio_vigencia and coalesce(na.ncma_fim_vigencia, :data) ' + 
    '    and :data between c.cltr_inicio_vigencia and coalesce(c.cltr_fim_vigencia, :data) ' + 
    '    and :data between st.sitr_inicio_vigencia and coalesce(st.sitr_fim_vigencia, :data) ' + 
    '    and :data between tst.trst_inicio_vigencia and coalesce(tst.trst_fim_vigencia, :data) ' +
    '    and coalesce(p.grupo_fiscal_ibscbs_resolvid_em, :datarevisao) <= :datarevisao ' +
    '  group by codigo, descricao, anexo ' +
    ') ',
    [ sTiposTrib ]
  );

  with queryCons.SQL('%s select * from ncm_anx where 1=0', [ FSqlWith ]).Open() do
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

{ TDbGridNcmsProdutosFrame }

constructor TDbGridNcmsGrupoFiscalVincularFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FTimerNcmChange := TTimer.Create(Self);
  FTimerNcmChange.Enabled := False;
  FTimerNcmChange.Interval := 200;
  FTimerNcmChange.OnTimer := TimerNcmChangeTimer;

  FNcm := TNcmsProdutosOOP.Create();
  TNcmsProdutosOOP(FNcm).OnChange := DoNcmChange;
end;

destructor TDbGridNcmsGrupoFiscalVincularFrame.Destroy;
begin
  FNcm.Free();
  inherited Destroy;
end;

procedure TDbGridNcmsGrupoFiscalVincularFrame.DoNcmChange(const NCM: string);
begin
  FTimerNcmChange.Enabled := False;
  FTimerNcmChange.Enabled := True;
end;

procedure TDbGridNcmsGrupoFiscalVincularFrame.ExecutarInconpativeis(
  DataRevisao: TDate);
begin
  TNcmsProdutosOOP(FNcm).ExecutarInconpativeis( DataRevisao );
end;

procedure TDbGridNcmsGrupoFiscalVincularFrame.ExecutarNParaUm(
  DataRevisao: TDate);
begin
  TNcmsProdutosOOP(FNcm).ExecutarMaisDeUmNcmParaUmAnexo( DataRevisao );
end;

procedure TDbGridNcmsGrupoFiscalVincularFrame.ExecutarUmParaUm(DataRevisao: TDate);
begin
  TNcmsProdutosOOP(FNcm).ExecutarUmNcmParaUmAnexo( DataRevisao );
end;

function TDbGridNcmsGrupoFiscalVincularFrame.GetSelecionado: ProdutoNcmGrupoFiscalUpdateModel;
begin
  Result := TNcmsProdutosOOP(FNcm).GetSelecionado();
end;

function TDbGridNcmsGrupoFiscalVincularFrame.GetSelecionados: ProdutoNcmGrupoFiscalUpdateModelArray;
begin
  Result := TNcmsProdutosOOP(FNcm).GetSelecionados();
end;

procedure TDbGridNcmsGrupoFiscalVincularFrame.SetOnChange(
  const Value: TDbGridNcmsGrupoFiscalVincularFrameChange);
begin
  FOnChange := Value;
end;

procedure TDbGridNcmsGrupoFiscalVincularFrame.Setup(
  const Input: TDbGridNcmsGrupoFiscalVincularFrameSetup
);
var
  builder : IFieldsConfigBuilder;
begin
  builder := FieldsConfigFactory.Create();

  TNcmsProdutosOOP(FNcm).Setup( Input.TipoTributo, Input.DataReferencia, Input.GridParams.SelectionField );
  TNcmsProdutosOOP(FNcm).FAnexos.Setup( Input.TipoTributo, Input.DataReferencia );

  gridNcm.Setup(Input.GridParams);
  gridNcm.DataSource := FNcm._dataSourceOOP;
  gridRaiz.DataSource := TNcmsProdutosOOP(FNcm).FRaiz._dataSourceOOP;
  gridAnexos.DataSource := TNcmsProdutosOOP(FNcm).FAnexos._dataSourceOOP;

  pnAnexos.Visible := Input.EnableGridAnexos;

  if Input.GridParams.SelectionField <> '' then
    builder.Add(Input.GridParams.SelectionField, '..', fvSempreVisivel);

  builder.Add('cod_empresa,grupo_fiscal_ibscbs,count_excecao', fvInvisivel)
    .Add('codigo', 'NCM', fvSempreVisivel)
    .Add('descricao', 'Descrição', fvInvisivel)
    .Add('count_produto', 'Produtos', fvSempreVisivel);

  if Input.EnableGridAnexos then
  begin
    builder.Add('min_anexo', fvInvisivel)
      .Add('count_anexo', 'Anexos').Width(40)
  end
  else
  begin
    builder.Add('count_anexo', fvInvisivel)
      .Add('min_anexo', 'Anexo').Width(40);
  end;

  DbGridConfigUtils.ApplyToDBGrid( gridNcm.DBGrid, builder.List );
end;

procedure TDbGridNcmsGrupoFiscalVincularFrame.TimerNcmChangeTimer(
  Sender: TObject);
var
  Ncm: string;
begin
  FTimerNcmChange.Enabled := False;

  Ncm := TNcmsProdutosOOP(FNcm).LastNCM;

  TNcmsProdutosOOP(FNcm).FRaiz.ExecutarUmParaUm(
    Ncm,
    TNcmsProdutosOOP(FNcm).FDataReferencia
  );

  if pnAnexos.Visible then
    TNcmsProdutosOOP(FNcm).FAnexos.Executar( Ncm );

  if Assigned(FOnChange) then
    FOnChange(Ncm);
end;

{ TDbGridNcmsGrupoFiscalVincularFrameSetup }

class function TDbGridNcmsGrupoFiscalVincularFrameSetup.Create(
  TipoTributo: TipoTributoFiscalEnum;
  DataReferencia: TDate;
  const GridParams: TDBGridFrameSetup;
  EnableGridAnexos: Boolean
): TDbGridNcmsGrupoFiscalVincularFrameSetup;
begin
  Result.FTipoTributo := TipoTributo;
  Result.FDataReferencia := DataReferencia;
  Result.FGridParams := GridParams;
  Result.FEnableGridAnexos := EnableGridAnexos;
end;

{ TNcmsAnexosOOP }

constructor TNcmsAnexosOOP.Create;
begin
  TableName := 'RTC_ANEXO';
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_ncm_anexo_anexos');

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('anxo_numero', 'Anexo', fvSempreVisivel)
  );

  ClientOpen(
    'select distinct a.anxo_numero from rtc_anexo a where 1=0'
  );

end;

procedure TNcmsAnexosOOP.Executar(const NCM: string);
begin
  Self.Close();
  Self.ParamValue('data', FDataReferencia)
    .ParamValue('ncm', NCM)
    .Open;
end;

procedure TNcmsAnexosOOP.Setup(TipoTributo: TipoTributoFiscalEnum;
  DataReferencia: TDate);
var

  sTiposTrib: string;
  setTipos: TipoTributoEnumSet;
begin
  FDataReferencia := DataReferencia;

  setTipos := TiposTributosService.FiscalToRtcSet(TipoTributo);
  sTiposTrib := TiposTributosService.SetToStr( setTipos );

  dataSet.CommandText := Format(
    '  select distinct a.anxo_numero' +
    '  from ncm n' +
    '  inner join rtc_ncm_aplicavel na on na.ncma_ncm_cd in ( ' +
    '    substr(n.codigo, 1, 8), substr(n.codigo, 1, 7), substr(n.codigo, 1, 6), substr(n.codigo, 1, 5), ' +
    '    substr(n.codigo, 1, 4), substr(n.codigo, 1, 3), substr(n.codigo, 1, 2) ' +
    '  ) ' +
    '  inner join rtc_anexo a on na.ncma_anxo_id = a.anxo_id ' +
    '    inner join rtc_classificacao_tributaria c on c.cltr_id = na.ncma_cltr_id ' +
    '    inner join rtc_situacao_tributaria st on st.sitr_id = c.cltr_sitr_id ' +
    '    inner join rtc_tributo_situacao_tributaria tst on tst.trst_sitr_id = st.sitr_id ' +
    '    left join rtc_excecao_ncm_aplicavel e on e.encm_ncma_id = na.ncma_id ' +
    '      and n.codigo starting with e.encm_ncm_cd ' +
    '      and :data between e.encm_inicio_vigencia and coalesce(e.encm_fim_vigencia, :data) ' +
    '  where n.codigo = :ncm ' +
    '    and :data between n.data_inicio and coalesce(n.data_fim, :data) ' +
    '    and tst.tipo_tributo in (%s) and :data between a.anxo_inicio_vigencia and coalesce(a.anxo_fim_vigencia, :data) ' +
    '    and :data between na.ncma_inicio_vigencia and coalesce(na.ncma_fim_vigencia, :data) ' +
    '    and :data between c.cltr_inicio_vigencia and coalesce(c.cltr_fim_vigencia, :data) ' +
    '    and :data between st.sitr_inicio_vigencia and coalesce(st.sitr_fim_vigencia, :data) ' +
    '    and :data between tst.trst_inicio_vigencia and coalesce(tst.trst_fim_vigencia, :data) ',
    [ sTiposTrib ]);
end;

end.
