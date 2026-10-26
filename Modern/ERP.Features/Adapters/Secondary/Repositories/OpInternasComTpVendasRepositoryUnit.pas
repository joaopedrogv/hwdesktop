unit OpInternasComTpVendasRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  IOpInternasComTpVendasRepositoryUnit,
  OpInternaComTpVendaEtdUnit,
  TipoComunsUnit,
  ParameterValueUnit,
  OpInternaTpVendaVinculoModelUnit,
  QueryResultUnit;

type                                                                                                               
  {$IFDEF INTF_ON}
  OpInternasComTpVendasRepository = class(CacheableRepository, IOpInternasComTpVendasRepository)
  {$ELSE}                                                                                       
  OpInternasComTpVendasRepository = class(IOpInternasComTpVendasRepository)
  {$ENDIF}
  private
    function CreateItemFromQuery(Q: QueryResult): OpInternaComTpVendaEtd;
    function ObterPorSQL(const SQL: string; const Params: ParametersValues): OpInternasComTpVendasEtd;
  public
    function ListarPorTpVenda(CodTpVenda: Integer; const TipoTpVenda: string): OpInternasComTpVendasEtd; override;
    function ListarPorOpInterna(const OpInternaId: string): OpInternasComTpVendasEtd; override;
    function ListarPorVenda(const TipoVenda, TipoSigla: string; EmpresaId: Integer): OpInternasComTpVendasEtd; override;
    // aqui seta o padrao, pois vem do tipos vendas
    procedure VincularOperacoesInternasATipoVenda(const TipoVenda: OpInternaTpVendaVinculoModel; const OpInternas: OpInternaTpVendaVinculoModelArray); override;
    // aqui nao
    procedure VincularTiposVendasAOperacaoInterna(const OpInternaId: string; const TiposVendas: OpInternaTpVendaVinculoModelArray); override;
  end;

implementation

uses
  Classes,
  Contnrs,
  SysUtils,
  Math,
  OperacaoInternaEtdUnit,
  StatusRegistroEnumUnit,
  TipoVendaEtdUnit, ITransactionUnit, StringServiceUnit;

{ OpInternasComTpVendasRepository }

function OpInternasComTpVendasRepository.ListarPorTpVenda(
  CodTpVenda: Integer;
  const TipoTpVenda: string
): OpInternasComTpVendasEtd;
begin
  Result := ObterPorSQL(
    'select o.op_interna_id, o.cod_tipo, o.tipo, o.padrao, o.data_cadastro, ' +
    '       op.id op_id, op.seqid op_seqid, op.descricao op_descricao, op.ativo op_ativo, ' +
    '       op.data_cadastro op_data_cadastro, op.data_alteracao op_data_alteracao, ' +
    '       tv.cod_tipo tv_cod_tipo, tv.tipo tv_tipo, tv.descricao tv_descricao, ' +
    '       tv.tipo_os tv_tipo_os, tv.sigla tv_sigla, tv.venda tv_venda, tv.ativo tv_ativo ' +
    'from op_internas_tpvendas o ' +
    'left join op_internas op on op.id = o.op_interna_id ' +
    'left join tipo_vendas tv on tv.cod_tipo = o.cod_tipo and tv.tipo = o.tipo ' +
    'where o.cod_tipo = :cod_tipo and o.tipo = :tipo ' +
    'order by op.descricao',
    ParametersBuilder.Create(2)
      .ByName('cod_tipo', CodTpVenda )
      .ByName('tipo', TipoTpVenda )
      .Build()
  );
end;

function OpInternasComTpVendasRepository.ListarPorOpInterna(
  const OpInternaId: string
): OpInternasComTpVendasEtd;
begin
  Result := ObterPorSQL(
    'select o.op_interna_id, o.cod_tipo, o.tipo, o.padrao, o.data_cadastro, ' +
    '       op.id op_id, op.seqid op_seqid, op.descricao op_descricao, op.ativo op_ativo, ' +
    '       op.data_cadastro op_data_cadastro, op.data_alteracao op_data_alteracao, ' +
    '       tv.cod_tipo tv_cod_tipo, tv.tipo tv_tipo, tv.descricao tv_descricao, ' +
    '       tv.tipo_os tv_tipo_os, tv.sigla tv_sigla, tv.venda tv_venda, tv.ativo tv_ativo ' +
    'from op_internas_tpvendas o ' +
    'left join op_internas op on op.id = o.op_interna_id ' +
    'left join tipo_vendas tv on tv.cod_tipo = o.cod_tipo and tv.tipo = o.tipo ' +
    'where o.op_interna_id = :op_interna_id ' +
    'order by tv.tipo, tv.descricao',
    ParametersBuilder.Create(1)
      .Add( OpInternaId )
      .Build()
  );
end;

function OpInternasComTpVendasRepository.CreateItemFromQuery(Q: QueryResult): OpInternaComTpVendaEtd;
var
  EVazio: TArrayInteger;
begin
  SetLength(EVazio, 0);

  Result := OpInternaComTpVendaEtd.Create(
    Q.FieldAsString('OP_INTERNA_ID'),
    Q.FieldAsInteger('COD_TIPO'),
    Q.FieldAsString('TIPO'),
    Q.FieldAreEquals('PADRAO', 1),
    Q.FieldAsDate('DATA_CADASTRO'),
    OperacaoInternaEtd.Create(
      Q.FieldAsString('OP_ID'),
      Q.FieldAsInteger('OP_SEQID'),
      Q.FieldAsString('OP_DESCRICAO'),
      Q.FieldAsDateTime('OP_DATA_CADASTRO'),
      Q.FieldAsDateTime('OP_DATA_ALTERACAO'),
      StatusRegistroEnum( Q.FieldAsInteger('OP_ATIVO') ),
      EVazio
    ),
    TipoVendaEtd.Create(
      Q.FieldAsInteger('TV_COD_TIPO'),
      Q.FieldAsString('TV_TIPO'),
      Q.FieldAsString('TV_DESCRICAO'),
      Q.FieldAsString('TV_TIPO_OS'),
      Q.FieldAsString('TV_SIGLA'),
      Q.FieldAreEquals('TV_VENDA', 'S'),
      StatusRegistroEnum( Q.FieldAsInteger('TV_ATIVO') )
    )
  );
end;

function OpInternasComTpVendasRepository.ObterPorSQL(const SQL: string;
  const Params: ParametersValues
): OpInternasComTpVendasEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery( SQL, Params );
  try
    Result := OpInternasComTpVendasEtd.Create();

    while not Q.Eof do
    begin
      Result.Add( CreateItemFromQuery( Q ) );
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function OpInternasComTpVendasRepository.ListarPorVenda(
  const TipoVenda, TipoSigla: string;
  EmpresaId: Integer
): OpInternasComTpVendasEtd;
begin
  Result := ObterPorSQL(
    'select o.op_interna_id, o.cod_tipo, o.tipo, o.padrao, o.data_cadastro, ' +
    '       op.id op_id, op.seqid op_seqid, op.descricao op_descricao, op.ativo op_ativo, ' +
    '       op.data_cadastro op_data_cadastro, op.data_alteracao op_data_alteracao, ' +
    '       tv.cod_tipo tv_cod_tipo, tv.tipo tv_tipo, tv.descricao tv_descricao, ' +
    '       tv.tipo_os tv_tipo_os, tv.sigla tv_sigla, tv.venda tv_venda, tv.ativo tv_ativo ' +
    ' from tipo_vendas tv ' +
    ' inner join op_internas_tpvendas o on tv.cod_tipo = o.cod_tipo and tv.tipo = o.tipo ' +
    ' inner join op_internas_emp oe on oe.op_interna_id = o.op_interna_id and oe.cod_empresa = :cod_empresa ' +
    ' inner join op_internas op on op.id = oe.op_interna_id ' +
    ' where tv.tipo = :tipo ' +
    ' and ( ' +
    '   (tv.tipo = ''OS'' and tv.tipo_os = :tipo_os) ' +
    '   or ' +
    '   (tv.tipo <> ''OS'' and tv.sigla = :sigla ) ' +
    ' ) ' +
    ' order by op.descricao ',
    ParametersBuilder.Create(4)
      .ByName('cod_empresa', EmpresaId )
      .ByName('tipo', TipoVenda )
      .ByName('tipo_os', TipoSigla )
      .ByName('sigla', Copy(TipoSigla, 1, 1) )
      .Build()
  );
end;

procedure OpInternasComTpVendasRepository.VincularOperacoesInternasATipoVenda(
  const TipoVenda: OpInternaTpVendaVinculoModel; const OpInternas: OpInternaTpVendaVinculoModelArray);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  transacao: ITransaction;
  Ids: TArrayString;
begin
  transacao := FConnection.BeginTransaction();

  try
    if Length(OpInternas) = 0 then
      FConnection.ExecuteCommand(
        'DELETE FROM OP_INTERNAS_TPVENDAS ' +
        'WHERE COD_TIPO = :COD_TIPO AND TIPO = :TIPO ',
        ParametersBuilder.Create(2)
          .Add( TipoVenda.CodTpVenda )
          .Add( TipoVenda.TipoTpVenda )
          .Build()
      )
    else
    begin
      SetLength(ParamsList, Length(OpInternas));
      SetLength(Ids, Length(OpInternas));
      for I := Low(OpInternas) to High(OpInternas) do
      begin
        Ids[I] := QuotedStr(OpInternas[I].OpInternaId);

        ParamsList[I] := ParametersBuilder.Create(3)
          .ByName('OP_INTERNA_ID', OpInternas[I].OpInternaId)
          .ByName('COD_TIPO', TipoVenda.CodTpVenda)
          .ByName('TIPO', TipoVenda.TipoTpVenda)
          //.ByName('PADRAO', IfThen( OpInternas[I].Padrao, 1) )
          .Build();
      end;

      FConnection.ExecuteCommand(
        Format(
          'DELETE FROM OP_INTERNAS_TPVENDAS ' +
          'WHERE COD_TIPO = :COD_TIPO AND TIPO = :TIPO ' +
          //'AND (COD_TIPO || TIPO) NOT IN (%s)',
          'AND OP_INTERNA_ID NOT IN (%s)',
          [ StringService.Join(',', Ids) ]
        ),
        ParametersBuilder.Create(2)
          .Add( TipoVenda.CodTpVenda )
          .Add( TipoVenda.TipoTpVenda )
          .Build()
      );

      FConnection.ExecuteBatch(
        'INSERT INTO OP_INTERNAS_TPVENDAS (OP_INTERNA_ID, COD_TIPO, TIPO, PADRAO)' +
        ' SELECT COALESCE(S.OP_INTERNA_ID, :OP_INTERNA_ID) OP_INTERNA_ID, COALESCE(S.COD_TIPO, :COD_TIPO) COD_TIPO,' +
        '        COALESCE(S.TIPO, :TIPO) TIPO, 0' +
        ' FROM RDB$DATABASE' +
        ' LEFT JOIN OP_INTERNAS_TPVENDAS S ON S.OP_INTERNA_ID = :OP_INTERNA_ID AND' +
        '   S.COD_TIPO = :COD_TIPO AND S.TIPO = :TIPO' +
        ' WHERE S.OP_INTERNA_ID IS NULL',
        ParamsList
      );
    end;

    transacao.Commit();
    {$IFNDEF INTF_ON} transacao.Free(); {$ENDIF}

  except on E: Exception do
    begin
      transacao.Rollback();
      {$IFNDEF INTF_ON} transacao.Free(); {$ENDIF}
      raise;
    end;
  end;

end;

procedure OpInternasComTpVendasRepository.VincularTiposVendasAOperacaoInterna(const OpInternaId: string;
  const TiposVendas: OpInternaTpVendaVinculoModelArray);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  transacao: ITransaction;
  Ids: TArrayString;
begin
  transacao := FConnection.BeginTransaction();

  try
    if Length(TiposVendas) = 0 then
      FConnection.ExecuteCommand(
        'DELETE FROM OP_INTERNAS_TPVENDAS ' +
        'WHERE OP_INTERNA_ID = :OP_INTERNA_ID',
        ParametersBuilder.Create(1)
          .Add( OpInternaId )
          .Build()
      )
    else
    begin
      SetLength(ParamsList, Length(TiposVendas));
      SetLength(Ids, Length(TiposVendas));
      for I := Low(TiposVendas) to High(TiposVendas) do
      begin
        Ids[I] := QuotedStr(IntToStr(TiposVendas[I].CodTpVenda) + TiposVendas[I].TipoTpVenda);

        ParamsList[I] := ParametersBuilder.Create(3)
          .ByName('OP_INTERNA_ID', OpInternaId)
          .ByName('COD_TIPO', TiposVendas[I].CodTpVenda)
          .ByName('TIPO', TiposVendas[I].TipoTpVenda)
          .Build();
      end;

      FConnection.ExecuteCommand(
        Format(
          'DELETE FROM OP_INTERNAS_TPVENDAS ' +
          'WHERE OP_INTERNA_ID = :OP_INTERNA_ID ' +
          'AND (COD_TIPO || TIPO) NOT IN (%s)',
          [ StringService.Join(',', Ids) ]
        ),
        ParametersBuilder.Create(1)
          .Add( OpInternaId )
          .Build()
      );

      FConnection.ExecuteBatch(
        'INSERT INTO OP_INTERNAS_TPVENDAS (OP_INTERNA_ID, COD_TIPO, TIPO, PADRAO)' +
        ' SELECT COALESCE(S.OP_INTERNA_ID, :OP_INTERNA_ID) OP_INTERNA_ID, COALESCE(S.COD_TIPO, :COD_TIPO) COD_TIPO,' +
        '        COALESCE(S.TIPO, :TIPO) TIPO, 0' +
        ' FROM RDB$DATABASE' +
        ' LEFT JOIN OP_INTERNAS_TPVENDAS S ON S.OP_INTERNA_ID = :OP_INTERNA_ID AND' +
        '   S.COD_TIPO = :COD_TIPO AND S.TIPO = :TIPO' +
        ' WHERE S.OP_INTERNA_ID IS NULL',
        ParamsList
      );
    end;

    transacao.Commit();
    {$IFNDEF INTF_ON} transacao.Free(); {$ENDIF}

  except on E: Exception do
    begin
      transacao.Rollback();
      {$IFNDEF INTF_ON} transacao.Free(); {$ENDIF}
      raise;
    end;
  end;
end;

end.
