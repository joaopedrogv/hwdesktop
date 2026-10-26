unit NCMsCDFDataSet;

interface

uses
  DataSetGrid, DB, TipoComunsUnit;

type
  TNCMsCDFDataSetChange = procedure(const NCM: string) of object;

  TNCMsCDFDataSetQuery = (
    ncmQryNone,                   // Indica que nao foi inicializada 
  	ncmQryIrregulares,            // Lista de ncms Inexistentes ou Extindos
    ncmQryRegularLikeNCM,         // Listar NCMs que começam com o valor informado e dentro da data de vigencia
    ncmQryRegularLikeDescricao,   // Listar NCMs que começam com o valor informado e dentro da data de vigencia
    ncmQryRegularPorAtoInicio,    // Listar NCMs pelo ato de início data de vigencia
    ncmQryNcmArvore               // Listar arvore de NCMs que tenham o mesmo codigo
  );

  TNCMsCDFDataSetSetup = record
  private
    Query: TNCMsCDFDataSetQuery;
    SelectionField: string;
  public
    class function Create(
      Query: TNCMsCDFDataSetQuery;
      SelectionField: string
    ): TNCMsCDFDataSetSetup; static;
  end;

  TNCMsCDFDataSet = class(TDataSetGrid)
  private
    FQuery: TNCMsCDFDataSetQuery;
    FOnChange: TNCMsCDFDataSetChange;
    procedure SetOnChange(const Value: TNCMsCDFDataSetChange);
    procedure NCMsDataSetAfterScroll(DataSet: TDataSet);
  public
    procedure Setup(const Input: TNCMsCDFDataSetSetup);
    procedure ListarIrregulares();
    procedure Executar(const Termo: string; const Data: TDate);

    function GetCodigosNCMsSelecionados(): TArrayString;

    property OnChange: TNCMsCDFDataSetChange write SetOnChange;
    property Query: TNCMsCDFDataSetQuery read FQuery;
  end;

implementation

uses
  SysUtils, uDataSet_OOP;

{ TNCMsCDFDataSetSetup }

class function TNCMsCDFDataSetSetup.Create(
  Query: TNCMsCDFDataSetQuery;
  SelectionField: string
): TNCMsCDFDataSetSetup;
begin
  Result.Query := Query;
  Result.SelectionField := SelectionField;
end;

{ TNCMsCDFDataSet }

procedure TNCMsCDFDataSet.Executar(const Termo: string; const Data: TDate);
var
  rAfterScroll: TDataSetNotifyEvent;
  CacheKey: string;
begin
  CacheKey := Format('%d_%s_%s', [ Ord(FQuery), Termo, DateToStr(Data)]);

  rAfterScroll := dataSet.AfterScroll;
  dataSet.AfterScroll := nil;
  try
    if TryGetFromCache(CacheKey) then
      Exit;

    Self.Close();
    Self.SQLClient( SQLText );

    case FQuery of
      ncmQryRegularLikeNCM,
      ncmQryRegularLikeDescricao,
      ncmQryRegularPorAtoInicio,
      ncmQryNcmArvore:
        Self.ParamValue('termo', Termo)
          .ParamValue('data', Data);
    else
      raise Exception.Create('TNCMsCDFDataSet.Executar > Query não configurada para utilizar esse método');
    end;

    Self.Open();

    AddToCache(CacheKey, 5);

  finally
    if Assigned(rAfterScroll) then
      rAfterScroll(Self.DataSet);

    dataSet.AfterScroll := rAfterScroll;
  end;
end;

function TNCMsCDFDataSet.GetCodigosNCMsSelecionados: TArrayString;
var
  Count: Integer;
begin
  SetLength(Result, dataSet.RecordCount);
  Count := 0;
  prepare_loop();
  try
    while not dataSet.Eof do
    begin
      if SelectionField.AsBoolean then
      begin
        Inc(Count);

        if Count > Length(Result) then
          SetLength(Result, Count + 32);

        Result[Count - 1] := fstr('ncm');
      end;

      dataSet.Next;
    end;

    SetLength(Result, Count);

  finally
    prepare_loop_done();
  end;
end;

procedure TNCMsCDFDataSet.ListarIrregulares;
var
  rAfterScroll: TDataSetNotifyEvent;
begin
  rAfterScroll := dataSet.AfterScroll;
  dataSet.AfterScroll := nil;
  try
    Self.Close();
    Self.SQLClient( SQLText )
      .ParamValue('cod_empresa', EmpresaId)
      .Open();

    if Assigned(rAfterScroll) then
      rAfterScroll(Self.DataSet);

  finally
    dataSet.AfterScroll := rAfterScroll;
  end;
end;

procedure TNCMsCDFDataSet.NCMsDataSetAfterScroll(DataSet: TDataSet);
begin
  if Assigned(FOnChange) then
    FOnChange( fstr('ncm') );
end;

procedure TNCMsCDFDataSet.SetOnChange(const Value: TNCMsCDFDataSetChange);
begin
  FOnChange := Value;

  if Assigned(FOnChange) then
    dataSet.AfterScroll := NCMsDataSetAfterScroll
  else
    dataSet.AfterScroll := nil;
end;

procedure TNCMsCDFDataSet.Setup(const Input: TNCMsCDFDataSetSetup);
begin
  FQuery := Input.Query;

  case FQuery of
    ncmQryIrregulares:
      SQLText :=
        'select ncm, qtde_prod, situacao from ( ' +
        '  select ' +
        '    p.nbm ncm, count(*) qtde_prod, ''Inexistente'' situacao ' +
        '  from produtos p ' +
        '  where p.cod_empresa = :cod_empresa ' +
        '    and p.ativo <> 99 ' +
        '    and not exists ( ' +
        '      select 1 from ncm n where n.codigo = p.nbm ' +
        '    ) ' +
        '  group by ncm ' +
        '  union all ' +
        '  select  ' +
        '    p.nbm ncm, count(*) qtde_prod, ''Extintos'' situacao ' +
        '  from produtos p ' +
        '  where p.cod_empresa = :cod_empresa ' +
        '    and p.ativo <> 99 ' +
        '    and exists ( ' +
        '      select 1 from ncm n1  ' +
        '      where n1.codigo = p.nbm and n1.data_fim is not null ' +
        '    ) ' +
        '    and not exists ( ' +
        '      select 1 from ncm n2  ' +
        '      where n2.codigo = p.nbm and n2.data_fim is null ' +
        '    ) ' +
        '  group by ncm ' +
        ') ' +
        'order by ncm ';

    ncmQryRegularLikeNCM:      
      SQLText :=
        'select distinct ' +
        '  n8.codigo ncm, ' +
        '  n8.descricao ' +
        'from ncm n_agrupador ' +
        'inner join ncm n8 ' +
        '  on n8.codigo starting with n_agrupador.codigo ' +
        '  and char_length(n8.codigo) = 8 ' +
        'where ' +
        '  n_agrupador.codigo starting with :termo ' +
        '  and char_length(n_agrupador.codigo) between 2 and 8 ' +
        '  and :data between n_agrupador.data_inicio and coalesce(n_agrupador.data_fim, :data) ' +
        '  and :data between n8.data_inicio and coalesce(n8.data_fim, :data) ' +
        'order by n8.codigo ';

    ncmQryRegularLikeDescricao:
      SQLText :=
        'select distinct ' +
        '  n8.codigo ncm, ' +
        '  n8.descricao ' +
        'from ncm n_agrupador ' +
        'inner join ncm n8 ' +
        '  on n8.codigo starting with n_agrupador.codigo ' +
        '  and char_length(n8.codigo) = 8 ' +
        'where  ' +
        '  n_agrupador.descricao containing :termo ' +
        '  and char_length(n_agrupador.codigo) between 2 and 8 ' +
        '  and :data between n_agrupador.data_inicio and coalesce(n_agrupador.data_fim, :data) ' +
        '  and :data between n8.data_inicio and coalesce(n8.data_fim, :data) ' +
        'order by n8.codigo ';

    ncmQryRegularPorAtoInicio: // Esse SQL poderia ser direto sem join
      SQLText :=
        'select distinct ' +
        '  n8.codigo ncm, ' +
        '  n8.descricao ' +
        'from ncm n_agrupador ' +
        'inner join ncm n8 ' +
        '  on n8.codigo starting with n_agrupador.codigo ' +
        '  and char_length(n8.codigo) = 8 ' +
        'where  ' +
        '  n_agrupador.numero_ato_ini = :termo ' +
        //'  and char_length(n_agrupador.codigo) between 2 and 8 ' +
        '  and :data between n_agrupador.data_inicio and coalesce(n_agrupador.data_fim, :data) ' +
        '  and :data between n8.data_inicio and coalesce(n8.data_fim, :data) ' +
        'order by n8.codigo ';

    ncmQryNcmArvore:
      SQLText :=
        'select distinct nc.codigo ncm, nc.descricao from ( ' +
        '  select cast(:termo as varchar(8)) ncm from rdb$database ' +
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
        'order by char_length(nc.codigo) ';
  end;

  case FQuery of
    ncmQryIrregulares:
      CreateFieldsBySQL(
        'select ''00000000'' ncm, 1 qtde_prod, ''Inexistente'' situacao ' +
        'from rdb$database where 1=0'
      );

    ncmQryRegularLikeNCM,
    ncmQryRegularLikeDescricao,
    ncmQryRegularPorAtoInicio,
    ncmQryNcmArvore:
      CreateFieldsBySQL('select codigo ncm, descricao from ncm where 1=0');
  end;

  if Input.SelectionField <> '' then
    CreateSelectionField(Input.SelectionField);
end;

end.
