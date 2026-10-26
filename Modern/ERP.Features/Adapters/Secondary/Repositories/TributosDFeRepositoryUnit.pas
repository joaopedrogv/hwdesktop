unit TributosDFeRepositoryUnit;

interface

uses
  ITributosDFeRepositoryUnit,
  BaseRepositoryUnit,
  TributoDFeContextEtdUnit,
  TipoComunsUnit,
  TributoDFeOrigemEnumUnit;

type
                                                              
  {$IFDEF INTF_ON}
  TributosDFeRepository = class(BaseRepository, ITributosDFeRepository)
  {$ELSE}                                                              
  TributosDFeRepository = class(ITributosDFeRepository)
  {$ENDIF}
  private
    function GetCamposSQL(): string;
  public
    procedure Delete(const Ids: TArrayString; Origem: TributoDFeOrigemEnum); override;
    function GetById(const Id: string; Origem: TributoDFeOrigemEnum): TributoDFeContextEtd; override;
    function Post(Input: TributoDFeContextEtd): TributoDFeContextEtd; override;
    function ListarPofNF(NotaFiscalId, EmpresaId: Integer): TributoDFeContextEtdList; overload; override;
    function ListarPofNF(NotaFiscalId, EmpresaId, NItem: Integer): TributoDFeContextEtdList; overload; override;
    function ListarPofNFCe(NFCeId, EmpresaId: Integer): TributoDFeContextEtdList; override;
  end;

implementation

uses
  SysUtils, Math, StrUtils,
  QueryResultUnit,
  ParameterValueUnit,
  TributoDFeImpostoSeletivoEtdUnit,
  TributoDFeIbsCbsEtdUnit,
  ITransactionUnit, TributoDFeGrupoIbsCbsEtdUnit, TributoDFeAjusteCompetIbsCbsEtdUnit,
  TributoDFeCredPresOpIbsCbsEtdUnit, TributoDFeCredPresZfmIbsCbsEtdUnit,
  TributoDFeIbsCbsCompraGovEtdUnit, TributoDFeIbsCbsTribRegEtdUnit,
  TributoDFeMonofasiaIbsCbsEtdUnit, TributoDFeTransfCredIbsCbsEtdUnit, Contnrs,
  StringServiceUnit, TipoRegraTributoDFeEnumUnit;

{ TributosDFeRepository }

function CreateIS(Q: QueryResult): TributoDFeImpostoSeletivoEtd;
begin
  if Q.FieldIsNull('I_ID') then
    Result := nil
  else
    Result := TributoDFeImpostoSeletivoEtd.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsString('CSTIS'),
      Q.FieldAsString('CCLASSTRIBIS'),
      Q.FieldAsDoubleNullable('VBCIS'),
      Q.FieldAsDoubleNullable('PIS'),
      Q.FieldAsDoubleNullable('PISESPEC'),
      Q.FieldAsString('UTRIB'),
      Q.FieldAsDoubleNullable('QTRIB'),
      Q.FieldAsDoubleNullable('VIS')
    );
end;

function CreateGIBSCBSTribRegular(Q: QueryResult): TributoDFeIbsCbsTribRegEtd;
begin
  if Q.FieldIsNull('TR_ID') then
    Result := nil
  else
    Result := TributoDFeIbsCbsTribRegEtd.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsString('CSTREG'),
      Q.FieldAsString('CCLASSTRIBREG'),
      Q.FieldAsDouble('PALIQEFETREGIBSUF'),
      Q.FieldAsDouble('VTRIBREGIBSUF'),
      Q.FieldAsDouble('PALIQEFETREGIBSMUN'),
      Q.FieldAsDouble('VTRIBREGIBSMUN'),
      Q.FieldAsDouble('PALIQEFETREGCBS'),
      Q.FieldAsDouble('VTRIBREGCBS')
    );
end;

function CreateGIBSCBSCompraGov(Q: QueryResult): TributoDFeIbsCbsCompraGovEtd;
begin       
  if Q.FieldIsNull('GV_ID') then
    Result := nil
  else
    Result := TributoDFeIbsCbsCompraGovEtd.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsDouble('PALIQIBSUF'),
      Q.FieldAsDouble('VTRIBIBSUF'),
      Q.FieldAsDouble('PALIQIBSMUN'),
      Q.FieldAsDouble('VTRIBIBSMUN'),
      Q.FieldAsDouble('PALIQCBS'),
      Q.FieldAsDouble('VTRIBCBS')
    );
end;

function CreateGIBSCBS(Q: QueryResult): TributoDFeGrupoIbsCbsEtd;
begin
  if Q.FieldIsNull('G_ID') then
    Result := nil
  else
    Result := TributoDFeGrupoIbsCbsEtd.Create(
      Q.FieldAsString('Id'),
      Q.FieldAsDouble('vBc'),
      Q.FieldAsDouble('PIbsUf'),
      Q.FieldAsDoubleNullable('IBSUF_PDIF'),
      Q.FieldAsDoubleNullable('IBSUF_VDIF'),
      Q.FieldAsDoubleNullable('IBSUF_VDEVTRIB'),
      Q.FieldAsDoubleNullable('IBSUF_PREDALIQ'),
      Q.FieldAsDoubleNullable('IBSUF_ALIQEFET'),
      Q.FieldAsDouble('VIBSUF'),
      Q.FieldAsDouble('PIBSMUN'),
      Q.FieldAsDoubleNullable('IBSMUN_PDIF'),
      Q.FieldAsDoubleNullable('IBSMUN_VDIF'),
      Q.FieldAsDoubleNullable('IBSMUN_VDEVTRIB'),
      Q.FieldAsDoubleNullable('IBSMUN_PREDALIQ'),
      Q.FieldAsDoubleNullable('IBSMUN_ALIQEFET'),
      Q.FieldAsDouble('VIBSMUN'),
      Q.FieldAsDouble('VIBS'),
      Q.FieldAsDouble('PCBS'),
      Q.FieldAsDoubleNullable('CBS_PDIF'),
      Q.FieldAsDoubleNullable('CBS_VDIF'),
      Q.FieldAsDoubleNullable('CBS_VDEVTRIB'),
      Q.FieldAsDoubleNullable('CBS_PREDALIQ'),
      Q.FieldAsDoubleNullable('CBS_ALIQEFET'),
      Q.FieldAsDouble('VCBS'),
      CreateGIBSCBSTribRegular( Q ),
      CreateGIBSCBSCompraGov( Q )
    );
end;

function CreateIBSCBSMonofasia(Q: QueryResult): TributoDFeMonofasiaIbsCbsEtd;
begin
  if Q.FieldIsNull('M_ID') then
    Result := nil
  else
    Result := TributoDFeMonofasiaIbsCbsEtd.Create(
      Q.FieldAsString('Id'),
      Q.FieldAsDoubleNullable('QBCMONO'),
      Q.FieldAsDoubleNullable('ADREMIBS'),
      Q.FieldAsDoubleNullable('VIBSMONO'),
      Q.FieldAsDoubleNullable('ADREMCBS'),
      Q.FieldAsDoubleNullable('VCBSMONO'),
      Q.FieldAsDoubleNullable('QBCMONORETEN'),
      Q.FieldAsDoubleNullable('ADREMIBSRETEN'),
      Q.FieldAsDoubleNullable('VIBSMONORETEN'),
      Q.FieldAsDoubleNullable('ADREMCBSRETEN'),
      Q.FieldAsDoubleNullable('VCBSMONORETEN'),
      Q.FieldAsDoubleNullable('QBCMONORET'),
      Q.FieldAsDoubleNullable('ADREMIBSRET'),
      Q.FieldAsDoubleNullable('VIBSMONORET'),
      Q.FieldAsDoubleNullable('ADREMCBSRET'),
      Q.FieldAsDoubleNullable('VCBSMONORET'),
      Q.FieldAsDoubleNullable('PDIFIBS'),
      Q.FieldAsDoubleNullable('VIBSMONODIF'),
      Q.FieldAsDoubleNullable('PDIFCBS'),
      Q.FieldAsDoubleNullable('VCBSMONODIF'),
      Q.FieldAsDouble('VTOTIBSMONOITEM'),
      Q.FieldAsDouble('VTOTCBSMONOITEM')
    );
end;

function CreateIBSCBSTransfCred(Q: QueryResult): TributoDFeTransfCredIbsCbsEtd;
begin
  if Q.FieldIsNull('TC_ID') then
    Result := nil
  else
    Result := TributoDFeTransfCredIbsCbsEtd.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsDouble('TC_VIBS'),
      Q.FieldAsDouble('TC_VCBS')
    );
end;

function CreateIBSCBSAjusteCompetencia(Q: QueryResult): TributoDFeAjusteCompetIbsCbsEtd;
begin
  if Q.FieldIsNull('AC_ID') then
    Result := nil
  else
    Result := TributoDFeAjusteCompetIbsCbsEtd.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsString('AC_COMPETAPUR'),
      Q.FieldAsDouble('AC_VIBS'),
      Q.FieldAsDouble('AC_VCBS')
    );
end;      

function CreateIBSCBSCredPresumidoOperacao(Q: QueryResult): TributoDFeCredPresOpIbsCbsEtd;
begin
  if Q.FieldIsNull('CP_ID') then
    Result := nil
  else
    Result := TributoDFeCredPresOpIbsCbsEtd.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsDouble('VBCCREDPRES'),
      Q.FieldAsString('CCREDPRES'),
      Q.FieldAsDoubleNullable('IBS_PCREDPRES'),
      Q.FieldAsDoubleNullable('IBS_VCREDPRES'),
      Q.FieldAsDoubleNullable('IBS_VCREDPRESCONDSUS'),
      Q.FieldAsDoubleNullable('CBS_PCREDPRES'),
      Q.FieldAsDoubleNullable('CBS_VCREDPRES'),
      Q.FieldAsDoubleNullable('CBS_VCREDPRESCONDSUS')
    );
end;            

function CreateIBSCBSCredPresumidoZFM(Q: QueryResult): TributoDFeCredPresZfmIbsCbsEtd;
begin
  if Q.FieldIsNull('CZ_ID') then
    Result := nil
  else
    Result := TributoDFeCredPresZfmIbsCbsEtd.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsString('COMPETAPUR'),
      Q.FieldAsInteger('TPCREDPRESIBSZFM'),
      Q.FieldAsDouble('VCREDPRESIBSZFM')
    );
end;

function CreateIBSCBS(Q: QueryResult): TributoDFeIbsCbsEtd;
begin
  if Q.FieldIsNull('IC_ID') then
    Result := nil
  else
    Result := TributoDFeIbsCbsEtd.Create(
      Q.FieldAsString('ID'),
      Q.FieldAsStringNullable('REGRA_FISCAL_ID'),
      TipoRegraTributoDFeEnum(Q.FieldAsInteger('TIPO_REGRA_FISCAL')),
      Q.FieldAsString('CST'),
      Q.FieldAsString('CCLASSTRIB'),
      Q.FieldAreEquals('INDDOACAO', 1),
      Q.FieldAsDoubleNullable('VIBSESTCRED'),
      Q.FieldAsDoubleNullable('VCBSESTCRED'),
      CreateGIBSCBS( Q ),
      CreateIBSCBSMonofasia( Q ),
      CreateIBSCBSTransfCred( Q ),
      CreateIBSCBSAjusteCompetencia( Q ),
      CreateIBSCBSCredPresumidoOperacao( Q ),
      CreateIBSCBSCredPresumidoZFM( Q )
    );
end;

function CreateContextoFromQuery(Q: QueryResult): TributoDFeContextEtd;
begin
  Result := TributoDFeContextEtd.Create(
    Q.FieldAsString('ID'),
    TributoDFeOrigemEnum(Q.FieldAsInteger('ORIGEM')),
    CreateIS(Q),
    CreateIBSCBS(Q)
  );
end;

procedure TributosDFeRepository.Delete(const Ids: TArrayString; Origem: TributoDFeOrigemEnum);
var
  AIds: TArrayString;
  I: Integer;
begin
  I := Length(Ids);
  if I <= 0 then
    Exit;

  SetLength(AIds, I);
  for I := Low(Ids) to High(Ids) do
    AIds[I] := QuotedStr( Ids[I] );

  with FConnection.CreateQuery(
    'delete from dfe_trib_contexto ' +
    ' where id in (%s) ' +
    ' and origem = %d',
    [ StringService.Join(',', AIds), Ord(Origem)]
  ) do
    FreeQueryResult();
end;

function TributosDFeRepository.GetById(
  const Id: string;
  Origem: TributoDFeOrigemEnum
): TributoDFeContextEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' + GetCamposSQL +
    'from dfe_trib_contexto c ' +
    'left join dfe_trib_is i on i.id = c.id ' +
    'left join dfe_trib_ibscbs ic on ic.id = c.id ' +
    'left join dfe_trib_gibscbs g on g.id = ic.id ' +
    'left join dfe_trib_gibscbs_cmprgov gv on gv.id = g.id ' +
    'left join dfe_trib_gibscbs_tribreg tr on tr.id = g.id ' +
    'left join dfe_trib_monofasia m on m.id = ic.id ' +
    'left join dfe_trib_credpres_op cp on cp.id = ic.id ' +
    'left join dfe_trib_credpres_zfm cz on cz.id = ic.id ' +
    'left join dfe_trib_ajustecompet ac on ac.id = ic.id ' +
    'left join dfe_trib_transfcred tc on tc.id = ic.id ' +
    ' where c.id = %s and c.origem = %d',
    [ QuotedStr(Id), Ord(Origem) ]
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateContextoFromQuery( Q );

  finally
    Q.Free();
  end;
end;

function TributosDFeRepository.GetCamposSQL: string;
begin
  Result := 
    '    c.id, c.origem, ' +
    '    i.id i_id, i.cstis, i.cclasstribis, i.vbcis, i.pis, i.pisespec, i.utrib, i.qtrib, i.vis, ' +
    '    ic.id ic_id, ic.regra_fiscal_id, ic.tipo_regra_fiscal, ic.cst, ic.cclasstrib, ic.inddoacao, ' +
    '    ic.vibsestcred, ic.vcbsestcred, ' +
    '    g.id g_id, g.vbc, g.pibsuf, g.ibsuf_pdif, g.ibsuf_vdif, g.ibsuf_vdevtrib, g.ibsuf_predaliq, ' +
    '    g.ibsuf_aliqefet, g.vibsuf, g.pibsmun, g.ibsmun_pdif, g.ibsmun_vdif, g.ibsmun_vdevtrib, ' +
    '    g.ibsmun_predaliq, g.ibsmun_aliqefet, g.vibsmun, g.vibs, g.pcbs, g.cbs_pdif, g.cbs_vdif, ' +
    '    g.cbs_vdevtrib, g.cbs_predaliq, g.cbs_aliqefet, g.vcbs, ' +
    '    gv.id gv_id, gv.paliqibsuf, gv.vtribibsuf, gv.paliqibsmun, gv.vtribibsmun, gv.paliqcbs, gv.vtribcbs, ' +
    '    tr.id tr_id, tr.cstreg, tr.cclasstribreg, tr.paliqefetregibsuf, tr.vtribregibsuf, ' +
    '    tr.paliqefetregibsmun, tr.vtribregibsmun, tr.paliqefetregcbs, tr.vtribregcbs, ' +
    '    m.id m_id, m.qbcmono, m.adremibs, m.adremcbs, m.vibsmono, m.vcbsmono, m.qbcmonoreten, m.adremibsreten, ' +
    '    m.vibsmonoreten, m.adremcbsreten, m.vcbsmonoreten, m.qbcmonoret, m.adremibsret, ' +
    '    m.vibsmonoret, m.adremcbsret, m.vcbsmonoret, m.pdifibs, m.vibsmonodif, m.pdifcbs, ' +
    '    m.vcbsmonodif, m.vtotibsmonoitem, m.vtotcbsmonoitem, ' +
    '    cp.id cp_id, cp.vbccredpres, cp.ccredpres, cp.ibs_pcredpres, cp.ibs_vcredpres, cp.ibs_vcredprescondsus, ' +
    '    cp.cbs_pcredpres, cp.cbs_vcredpres, cp.cbs_vcredprescondsus, ' +
    '    cz.id cz_id, cz.competapur, cz.tpcredpresibszfm, cz.vcredpresibszfm, ' +
    '    ac.id ac_id, ac.competapur ac_competapur, ac.vibs ac_vibs, ac.vcbs ac_vcbs, ' +
    '    tc.id tc_id, tc.vibs tc_vibs, tc.vcbs tc_vcbs ';
end;

function TributosDFeRepository.ListarPofNF(NotaFiscalId,
  EmpresaId: Integer): TributoDFeContextEtdList;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' + GetCamposSQL +
    'from notafiscal_item ni ' +
    'inner join dfe_trib_contexto c on (c.id = ni.dfe_trib_id and c.origem = %d) ' +
    '  or (c.id = ni.dfe_trib_id_xml and c.origem = %d) ' +
    'left join dfe_trib_is i on i.id = c.id ' +
    'left join dfe_trib_ibscbs ic on ic.id = c.id ' +
    'left join dfe_trib_gibscbs g on g.id = ic.id ' +
    'left join dfe_trib_gibscbs_cmprgov gv on gv.id = g.id ' +
    'left join dfe_trib_gibscbs_tribreg tr on tr.id = g.id ' +
    'left join dfe_trib_monofasia m on m.id = ic.id ' +
    'left join dfe_trib_credpres_op cp on cp.id = ic.id ' +
    'left join dfe_trib_credpres_zfm cz on cz.id = ic.id ' +
    'left join dfe_trib_ajustecompet ac on ac.id = ic.id ' +
    'left join dfe_trib_transfcred tc on tc.id = ic.id ' +
    ' where ni.cod_nf = %d and ni.cod_empresa = %d ',
    [ Ord(tdfoNotaFiscal), Ord(tdfoNFeXmlEntrada), NotaFiscalId, EmpresaId ]
  );
  try
    Result := TributoDFeContextEtdList.Create();

    if Q.IsEmpty then
      Exit;
    while not Q.Eof do
    begin
      Result.Add( CreateContextoFromQuery( Q ));
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function TributosDFeRepository.ListarPofNF(NotaFiscalId, EmpresaId,
  NItem: Integer): TributoDFeContextEtdList;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' + GetCamposSQL +
    'from notafiscal_item ni ' +
    'inner join dfe_trib_contexto c on (c.id = ni.dfe_trib_id and c.origem = %d) ' +
    '  or (c.id = ni.dfe_trib_id_xml and c.origem = %d) ' +
    'left join dfe_trib_is i on i.id = c.id ' +
    'left join dfe_trib_ibscbs ic on ic.id = c.id ' +
    'left join dfe_trib_gibscbs g on g.id = ic.id ' +
    'left join dfe_trib_gibscbs_cmprgov gv on gv.id = g.id ' +
    'left join dfe_trib_gibscbs_tribreg tr on tr.id = g.id ' +
    'left join dfe_trib_monofasia m on m.id = ic.id ' +
    'left join dfe_trib_credpres_op cp on cp.id = ic.id ' +
    'left join dfe_trib_credpres_zfm cz on cz.id = ic.id ' +
    'left join dfe_trib_ajustecompet ac on ac.id = ic.id ' +
    'left join dfe_trib_transfcred tc on tc.id = ic.id ' +
    ' where ni.cod_nf = %d and ni.cod_empresa = %d and ni.nitem = %d',
    [ Ord(tdfoNotaFiscal), Ord(tdfoNFeXmlEntrada), NotaFiscalId, EmpresaId, NItem ]
  );
  try
    Result := TributoDFeContextEtdList.Create();

    if Q.IsEmpty then
      Exit;
    while not Q.Eof do
    begin
      Result.Add( CreateContextoFromQuery( Q ));
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function TributosDFeRepository.ListarPofNFCe(NFCeId, EmpresaId: Integer): TributoDFeContextEtdList;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select ' + GetCamposSQL +
    'from nfce_item ni ' +
    'inner join dfe_trib_contexto c on c.id = ni.dfe_trib_id ' +
    'left join dfe_trib_is i on i.id = c.id ' +
    'left join dfe_trib_ibscbs ic on ic.id = c.id ' +
    'left join dfe_trib_gibscbs g on g.id = ic.id ' +
    'left join dfe_trib_gibscbs_cmprgov gv on gv.id = g.id ' +
    'left join dfe_trib_gibscbs_tribreg tr on tr.id = g.id ' +
    'left join dfe_trib_monofasia m on m.id = ic.id ' +
    'left join dfe_trib_credpres_op cp on cp.id = ic.id ' +
    'left join dfe_trib_credpres_zfm cz on cz.id = ic.id ' +
    'left join dfe_trib_ajustecompet ac on ac.id = ic.id ' +
    'left join dfe_trib_transfcred tc on tc.id = ic.id ' +
    ' where ni.cod_nfce = %d and ni.cod_empresa = %d ' +
    ' and c.origem = %d ',
    [ NFCeId, EmpresaId, Ord(tdfoNFCe) ]
  );
  try
    Result := TributoDFeContextEtdList.Create();

    if Q.IsEmpty then
      Exit;
    while not Q.Eof do
    begin
      Result.Add( CreateContextoFromQuery( Q ));
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function TributosDFeRepository.Post(
  Input: TributoDFeContextEtd): TributoDFeContextEtd;
var
  Params: ParametersValues;
  transacao: ITransaction;
begin
  Params := ParametersBuilder.Create(2)
      .ByName('ID', Input.Id )
      .ByName('ORIGEM', Ord(Input.Origem) )
      .Build();

  {$REGION 'Contexto apenas para usar como FK e agrupar IS e IBSCBS'}

  FConnection.ExecuteCommand(
    'UPDATE OR INSERT INTO DFE_TRIB_CONTEXTO ' +
    ' (ID, ORIGEM) ' +
    ' VALUES ' +
    '(:ID, :ORIGEM)' +
    ' MATCHING (ID, ORIGEM)',
    Params
  );

  {$ENDREGION}

  {$REGION 'Imposto Seletivo'}

  if Input.ImpostoSeletivo = nil then
    //FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_IS WHERE ID = %s', [ QuotedStr(Input.Id) ] )
  else
  begin
    //insert;
  end;

  {$ENDREGION}

  {$REGION 'IBS e CBS'}

  if Input.IbsCbs = nil then
    FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_IBSCBS WHERE ID = %s', [ QuotedStr(Input.Id) ] )
  else
  begin
    FConnection.ExecuteCommand(
      'UPDATE OR INSERT INTO DFE_TRIB_IBSCBS' +
      ' (ID, REGRA_FISCAL_ID, TIPO_REGRA_FISCAL, CST, CCLASSTRIB, INDDOACAO, VIBSESTCRED, VCBSESTCRED)' +
      ' VALUES' +
      ' (:ID, :REGRA_FISCAL_ID, :TIPO_REGRA_FISCAL, :CST, :CCLASSTRIB, :INDDOACAO, :VIBSESTCRED, :VCBSESTCRED)' +
      ' MATCHING (ID)',
      ParametersBuilder.Create(8)
        .Add( Input.Id )
        .Add( Input.IbsCbs.RegraFiscalId )
        .Add( Ord(Input.IbsCbs.TipoRegra) )
        .Add( Input.IbsCbs.Cst )
        .Add( Input.IbsCbs.CClasstrib )
        .Add( IfThen(Input.IbsCbs.Inddoacao, 1) )
        .Add( Input.IbsCbs.VIbsEstCred )
        .Add( Input.IbsCbs.VCbsEstCred )
        .Build()
    );

    {$REGION 'Grupo IBSCBS'}
      
    if Input.IbsCbs.GIbsCbs = nil then
      FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_GIBSCBS WHERE ID = %s', [ QuotedStr(Input.Id) ] )
    else
    begin
      FConnection.ExecuteCommand(
        'UPDATE OR INSERT INTO DFE_TRIB_GIBSCBS' +
        ' (ID, VBC, PIBSUF, IBSUF_PDIF, IBSUF_VDIF, IBSUF_VDEVTRIB, IBSUF_PREDALIQ, IBSUF_ALIQEFET,' +
        '  VIBSUF, PIBSMUN, IBSMUN_PDIF, IBSMUN_VDIF, IBSMUN_VDEVTRIB, IBSMUN_PREDALIQ, IBSMUN_ALIQEFET,' +
        '  VIBSMUN, VIBS, PCBS, CBS_PDIF, CBS_VDIF, CBS_VDEVTRIB, CBS_PREDALIQ, CBS_ALIQEFET, VCBS)' +
        ' VALUES' +
        ' (:ID, :VBC, :PIBSUF, :IBSUF_PDIF, :IBSUF_VDIF, :IBSUF_VDEVTRIB, :IBSUF_PREDALIQ, :IBSUF_ALIQEFET,' +
        '  :VIBSUF, :PIBSMUN, :IBSMUN_PDIF, :IBSMUN_VDIF, :IBSMUN_VDEVTRIB, :IBSMUN_PREDALIQ, :IBSMUN_ALIQEFET,' +
        '  :VIBSMUN, :VIBS, :PCBS, :CBS_PDIF, :CBS_VDIF, :CBS_VDEVTRIB, :CBS_PREDALIQ, :CBS_ALIQEFET, :VCBS)' +
        ' MATCHING (ID)',
        ParametersBuilder.Create(24)
        .Add( Input.Id )
        .AddFloat( Input.IbsCbs.GIbsCbs.VBc )
        .AddFloat( Input.IbsCbs.GIbsCbs.PIbsUf )
        .Add(  Input.IbsCbs.GIbsCbs.IbsUfPdif )
        .Add(  Input.IbsCbs.GIbsCbs.IbsUfVdif )
        .Add(  Input.IbsCbs.GIbsCbs.IbsUfVDevTrib )
        .Add(  Input.IbsCbs.GIbsCbs.IbsUfPredAliq )
        .Add(  Input.IbsCbs.GIbsCbs.IbsUfAliqEfet )
        .AddFloat( Input.IbsCbs.GIbsCbs.VIbsUf )
        .AddFloat( Input.IbsCbs.GIbsCbs.Pibsmun )
        .Add(  Input.IbsCbs.GIbsCbs.IbsMunPdif )
        .Add(  Input.IbsCbs.GIbsCbs.IbsMunVdif )
        .Add(  Input.IbsCbs.GIbsCbs.IbsMunVDevTrib )
        .Add(  Input.IbsCbs.GIbsCbs.IbsMunPredAliq )
        .Add(  Input.IbsCbs.GIbsCbs.IbsMunAliqEfet )
        .AddFloat( Input.IbsCbs.GIbsCbs.VIbsmun )
        .AddFloat( Input.IbsCbs.GIbsCbs.VIbs )
        .AddFloat(  Input.IbsCbs.GIbsCbs.PCbs )
        .Add(  Input.IbsCbs.GIbsCbs.CbsPdif )
        .Add(  Input.IbsCbs.GIbsCbs.CbsVdif )
        .Add(  Input.IbsCbs.GIbsCbs.CbsVDevTrib )
        .Add(  Input.IbsCbs.GIbsCbs.CbsPredAliq )
        .Add(  Input.IbsCbs.GIbsCbs.CbsAliqEfet )
        .AddFloat( Input.IbsCbs.GIbsCbs.VCbs )
        .Build()
      );

      {$REGION 'Tributacao Regular'}

      if Input.IbsCbs.GIbsCbs.TribRegular = nil then
        FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_GIBSCBS_TRIBREG WHERE ID = %s', [ QuotedStr(Input.Id) ] )
      else
        FConnection.ExecuteCommand(
          'UPDATE OR INSERT INTO DFE_TRIB_GIBSCBS_TRIBREG' +
          ' (ID, CSTREG, CCLASSTRIBREG, PALIQEFETREGIBSUF, VTRIBREGIBSUF, PALIQEFETREGIBSMUN, VTRIBREGIBSMUN,' +
          '  PALIQEFETREGCBS, VTRIBREGCBS)' +
          ' VALUES' +
          ' (:ID, :CSTREG, :CCLASSTRIBREG, :PALIQEFETREGIBSUF, :VTRIBREGIBSUF, :PALIQEFETREGIBSMUN, :VTRIBREGIBSMUN,' +
          '  :PALIQEFETREGCBS, :VTRIBREGCBS)' +
          ' MATCHING (ID)',
          ParametersBuilder.Create(9)
            .Add( Input.Id )
            .Add( Input.IbsCbs.GIbsCbs.TribRegular.Cstreg )
            .Add( Input.IbsCbs.GIbsCbs.TribRegular.CClasstribreg )
            .AddFloat( Input.IbsCbs.GIbsCbs.TribRegular.Paliqefetregibsuf )
            .AddFloat( Input.IbsCbs.GIbsCbs.TribRegular.Vtribregibsuf )
            .AddFloat( Input.IbsCbs.GIbsCbs.TribRegular.Paliqefetregibsmun )
            .AddFloat( Input.IbsCbs.GIbsCbs.TribRegular.Vtribregibsmun )
            .AddFloat( Input.IbsCbs.GIbsCbs.TribRegular.Paliqefetregcbs )
            .AddFloat( Input.IbsCbs.GIbsCbs.TribRegular.Vtribregcbs )
            .Build()
        );                                    

      {$ENDREGION}

      {$REGION 'Compra Governamental'}

      if Input.IbsCbs.GIbsCbs.CompraGov = nil then
        FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_GIBSCBS_CMPRGOV WHERE ID = %s', [ QuotedStr(Input.Id) ] )
      else
        FConnection.ExecuteCommand(
          'UPDATE OR INSERT INTO DFE_TRIB_GIBSCBS_CMPRGOV' +
          ' (ID, PALIQIBSUF, VTRIBIBSUF, PALIQIBSMUN, VTRIBIBSMUN, PALIQCBS, VTRIBCBS)' +
          ' VALUES' +
          ' (:ID, :PALIQIBSUF, :VTRIBIBSUF, :PALIQIBSMUN, :VTRIBIBSMUN, :PALIQCBS, :VTRIBCBS)' +
          ' MATCHING (ID)',
          ParametersBuilder.Create(7)
            .Add( Input.Id )
            .AddFloat( Input.IbsCbs.GIbsCbs.CompraGov.Paliqibsuf )
            .AddFloat( Input.IbsCbs.GIbsCbs.CompraGov.Vtribibsuf )
            .AddFloat( Input.IbsCbs.GIbsCbs.CompraGov.Paliqibsmun )
            .AddFloat( Input.IbsCbs.GIbsCbs.CompraGov.Vtribibsmun )
            .AddFloat( Input.IbsCbs.GIbsCbs.CompraGov.Paliqcbs )
            .AddFloat( Input.IbsCbs.GIbsCbs.CompraGov.Vtribcbs )
            .Build()
        );

      {$ENDREGION}

    end;     
    {$ENDREGION}

    {$REGION 'Monofasia'}
      
    if Input.IbsCbs.Monofasia = nil then
      FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_MONOFASIA WHERE ID = %s', [ QuotedStr(Input.Id) ] )
    else
    begin
      FConnection.ExecuteCommand(
        'UPDATE OR INSERT INTO DFE_TRIB_MONOFASIA' +
        ' (ID, QBCMONO, ADREMIBS, ADREMCBS, VIBSMONO, VCBSMONO, QBCMONORETEN, ADREMIBSRETEN, VIBSMONORETEN,' +
        '  ADREMCBSRETEN, VCBSMONORETEN, QBCMONORET, ADREMIBSRET, VIBSMONORET, ADREMCBSRET, VCBSMONORET, PDIFIBS,' +
        '  VIBSMONODIF, PDIFCBS, VCBSMONODIF, VTOTIBSMONOITEM, VTOTCBSMONOITEM)' +
        ' VALUES' +
        ' (:ID, :QBCMONO, :ADREMIBS, :ADREMCBS, :VIBSMONO, :VCBSMONO, :QBCMONORETEN, :ADREMIBSRETEN, :VIBSMONORETEN,' +
        '  :ADREMCBSRETEN, :VCBSMONORETEN, :QBCMONORET, :ADREMIBSRET, :VIBSMONORET, :ADREMCBSRET, :VCBSMONORET, :PDIFIBS,' +
        '  :VIBSMONODIF, :PDIFCBS, :VCBSMONODIF, :VTOTIBSMONOITEM, :VTOTCBSMONOITEM)' +
        ' MATCHING (ID)',
        ParametersBuilder.Create(22)
          .Add( Input.Id )
          .Add(  Input.IbsCbs.Monofasia.Qbcmono )
          .Add(  Input.IbsCbs.Monofasia.Adremibs )
          .Add(  Input.IbsCbs.Monofasia.Adremcbs )
          .Add(  Input.IbsCbs.Monofasia.Vibsmono )
          .Add(  Input.IbsCbs.Monofasia.Vcbsmono )
          .Add(  Input.IbsCbs.Monofasia.Qbcmonoreten )
          .Add(  Input.IbsCbs.Monofasia.Adremibsreten )
          .Add(  Input.IbsCbs.Monofasia.Vibsmonoreten )
          .Add(  Input.IbsCbs.Monofasia.Adremcbsreten )
          .Add(  Input.IbsCbs.Monofasia.Vcbsmonoreten )
          .Add(  Input.IbsCbs.Monofasia.Qbcmonoret )
          .Add(  Input.IbsCbs.Monofasia.Adremibsret )
          .Add(  Input.IbsCbs.Monofasia.Vibsmonoret )
          .Add(  Input.IbsCbs.Monofasia.Adremcbsret )
          .Add(  Input.IbsCbs.Monofasia.Vcbsmonoret )
          .Add(  Input.IbsCbs.Monofasia.Pdifibs )
          .Add(  Input.IbsCbs.Monofasia.Vibsmonodif )
          .Add(  Input.IbsCbs.Monofasia.Pdifcbs )
          .Add(  Input.IbsCbs.Monofasia.Vcbsmonodif )
          .AddFloat( Input.IbsCbs.Monofasia.Vtotibsmonoitem )
          .AddFloat( Input.IbsCbs.Monofasia.Vtotcbsmonoitem )
          .Build()
      );

    end;

    {$ENDREGION}

    {$REGION 'Transferencia de credito'}

    if Input.IbsCbs.TransfCred = nil then
      FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_TRANSFCRED WHERE ID = %s', [ QuotedStr(Input.Id) ] )
    else
    begin
      FConnection.ExecuteCommand(
        'UPDATE OR INSERT INTO DFE_TRIB_TRANSFCRED' +
        ' (ID, vIBS, vCBS)' +
        ' VALUES' +
        ' (:ID, :vIBS, :vCBS)' +
        ' MATCHING (ID)',
        ParametersBuilder.Create(3)
          .Add( Input.Id )
          .AddFloat( Input.IbsCbs.TransfCred.Vibs )
          .AddFloat( Input.IbsCbs.TransfCred.Vcbs )
          .Build()
      );

    end;

    {$ENDREGION}

    {$REGION 'Ajuste de competencia'}

    if Input.IbsCbs.AjusteCompet = nil then
      FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_AJUSTECOMPET WHERE ID = %s', [ QuotedStr(Input.Id) ] )
    else
    begin
      FConnection.ExecuteCommand(
        'UPDATE OR INSERT INTO DFE_TRIB_AJUSTECOMPET' +
        ' (ID, COMPETAPUR, vIBS, vCBS)' +
        ' VALUES' +
        ' (:ID, :COMPETAPUR, :vIBS, :vCBS)' +
        ' MATCHING (ID)',
        ParametersBuilder.Create(4)
          .Add( Input.Id )
          .Add( Input.IbsCbs.AjusteCompet.Competapur )
          .AddFloat( Input.IbsCbs.AjusteCompet.Vibs )
          .AddFloat( Input.IbsCbs.AjusteCompet.Vcbs )
          .Build()
      );

    end;

    {$ENDREGION}

    {$REGION 'Credito Presumido da Operacao'}

    if Input.IbsCbs.CredPresOp = nil then
      FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_AJUSTECOMPET WHERE ID = %s', [ QuotedStr(Input.Id) ] )
    else
    begin
      FConnection.ExecuteCommand(
        'UPDATE OR INSERT INTO DFE_TRIB_AJUSTECOMPET' +
        ' (ID, VBCCREDPRES, CCREDPRES, IBS_PCREDPRES, IBS_VCREDPRES, IBS_VCREDPRESCONDSUS,' +
        '  CBS_PCREDPRES, CBS_VCREDPRES, CBS_VCREDPRESCONDSUS)' +
        ' VALUES' +
        ' (:ID, :VBCCREDPRES, :CCREDPRES, :IBS_PCREDPRES, :IBS_VCREDPRES, :IBS_VCREDPRESCONDSUS,' +
        '  :CBS_PCREDPRES, :CBS_VCREDPRES, :CBS_VCREDPRESCONDSUS)' +
        ' MATCHING (ID)',
        ParametersBuilder.Create(9)
          .Add( Input.Id )
          .AddFloat( Input.IbsCbs.CredPresOp.Vbccredpres )
          .Add( Input.IbsCbs.CredPresOp.Ccredpres )
          .Add( Input.IbsCbs.CredPresOp.IbsPcredpres )
          .Add( Input.IbsCbs.CredPresOp.IbsVcredpres )
          .Add( Input.IbsCbs.CredPresOp.IbsVcredprescondsus )
          .Add( Input.IbsCbs.CredPresOp.CbsPcredpres )
          .Add( Input.IbsCbs.CredPresOp.CbsVcredpres )
          .Add( Input.IbsCbs.CredPresOp.CbsVcredprescondsus )
          .Build()
      );

    end;

    {$ENDREGION}
      
    {$REGION 'Credito Presumido ZFM'}

    if Input.IbsCbs.CredPresZFM = nil then
      FConnection.ExecuteCommand( 'DELETE FROM DFE_TRIB_CREDPRES_ZFM WHERE ID = %s', [ QuotedStr(Input.Id) ] )
    else
    begin
      FConnection.ExecuteCommand(
        'UPDATE OR INSERT INTO DFE_TRIB_CREDPRES_ZFM' +
        ' (ID, COMPETAPUR, TPCREDPRESIBSZFM, VCREDPRESIBSZFM)' +
        ' VALUES' +
        ' (:ID, :COMPETAPUR, :TPCREDPRESIBSZFM, :VCREDPRESIBSZFM)' +
        ' MATCHING (ID)',
        ParametersBuilder.Create(4)
          .Add( Input.Id )
          .Add( Input.IbsCbs.CredPresZFM.Competapur )
          .AddFloat( Input.IbsCbs.CredPresZFM.Tpcredpresibszfm )
          .AddFloat( Input.IbsCbs.CredPresZFM.Vcredpresibszfm )
          .Build()
      );

    end;

    {$ENDREGION}

  end;
      
  {$ENDREGION}

  Result := GetById( Input.Id, Input.Origem );
end;

end.
