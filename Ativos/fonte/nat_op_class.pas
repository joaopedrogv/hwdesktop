unit nat_op_class;

interface

uses
  Contnrs,
  DB;

type
  TNat_op_class = class(TObject)
  private
    Fcodigo_nop         : Double;
    Fdescricao_nop      : string;
    Fprecc              : string;
    Fcomimp             : string;
    Fsem_imposto        : string;
    Fcalc_custo         : string;
    Faliq_int_said      : Double;
    Fativo              : Integer;
    Falt_est            : string;
    Fmostrar_rel_compras: string;
    Fcfop_conv          : Double;
    Fnat_bc_cred        : string;
    Fcredito_pis_cofins : string;
    Freceita_pis_cofins : string;
    Fdevolucao          : string;
    Ftipv               : string;
    Fcod_inf            : Integer;
    Ffaturamento        : string;
    Ftipv_veiculo       : string;
    Fusa_bx_retorno_fin : string;
    Fordemexibicao      : Integer;
    Fdevolucao_sped     : string;
    Ftipo_operacao      : string;
    Fcompra             : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property codigo_nop         : Double  read Fcodigo_nop          write Fcodigo_nop;
    property descricao_nop      : string  read Fdescricao_nop       write Fdescricao_nop;
    property precc              : string  read Fprecc               write Fprecc;
    property comimp             : string  read Fcomimp              write Fcomimp;
    property sem_imposto        : string  read Fsem_imposto         write Fsem_imposto;
    property calc_custo         : string  read Fcalc_custo          write Fcalc_custo;
    property aliq_int_said      : Double  read Faliq_int_said       write Faliq_int_said;
    property ativo              : Integer read Fativo               write Fativo;
    property alt_est            : string  read Falt_est             write Falt_est;
    property mostrar_rel_compras: string  read Fmostrar_rel_compras write Fmostrar_rel_compras;
    property cfop_conv          : Double  read Fcfop_conv           write Fcfop_conv;
    property nat_bc_cred        : string  read Fnat_bc_cred         write Fnat_bc_cred;
    property credito_pis_cofins : string  read Fcredito_pis_cofins  write Fcredito_pis_cofins;
    property receita_pis_cofins : string  read Freceita_pis_cofins  write Freceita_pis_cofins;
    property devolucao          : string  read Fdevolucao           write Fdevolucao;
    property tipv               : string  read Ftipv                write Ftipv;
    property cod_inf            : Integer read Fcod_inf             write Fcod_inf;
    property faturamento        : string  read Ffaturamento         write Ffaturamento;
    property tipv_veiculo       : string  read Ftipv_veiculo        write Ftipv_veiculo;
    property usa_bx_retorno_fin : string  read Fusa_bx_retorno_fin  write Fusa_bx_retorno_fin;
    property ordemexibicao      : Integer read Fordemexibicao       write Fordemexibicao;
    property devolucao_sped     : string  read Fdevolucao_sped      write Fdevolucao_sped;
    property tipo_operacao      : string  read Ftipo_operacao       write Ftipo_operacao;
    property compra             : string  read Fcompra              write Fcompra;
  end;

  TNat_op_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNat_op_class;
    procedure SetItem(Index: Integer; const Value: TNat_op_class);
  public
    function New: TNat_op_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNat_op_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TNat_op_class }

constructor TNat_op_class.Create;
begin
  Fativo := 1;
end;

destructor TNat_op_class.Destroy;
begin
  inherited;
end;

class function TNat_op_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@codigo_nop, @descricao_nop, @precc, @comimp, @sem_imposto, @calc_custo, @aliq_int_said, @ativo, @alt_est,' +
            ' @mostrar_rel_compras, @cfop_conv, @nat_bc_cred, @credito_pis_cofins, @receita_pis_cofins, @devolucao, @tipv,' +
            ' @cod_inf, @faturamento, @tipv_veiculo, @usa_bx_retorno_fin, @ordemexibicao, @devolucao_sped,' +
            ' @tipo_operacao, @compra';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNat_op_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcodigo_nop          := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    Fdescricao_nop       := Trim(ADataSet.FieldByName('DESCRICAO_NOP').AsString);
    Fprecc               := Trim(ADataSet.FieldByName('PRECC').AsString);
    Fcomimp              := Trim(ADataSet.FieldByName('COMIMP').AsString);
    Fsem_imposto         := Trim(ADataSet.FieldByName('SEM_IMPOSTO').AsString);
    Fcalc_custo          := Trim(ADataSet.FieldByName('CALC_CUSTO').AsString);
    Faliq_int_said       := ADataSet.FieldByName('ALIQ_INT_SAID').AsFloat;
    Fativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    Falt_est             := Trim(ADataSet.FieldByName('ALT_EST').AsString);
    Fmostrar_rel_compras := Trim(ADataSet.FieldByName('MOSTRAR_REL_COMPRAS').AsString);
    Fcfop_conv           := ADataSet.FieldByName('CFOP_CONV').AsFloat;
    Fnat_bc_cred         := Trim(ADataSet.FieldByName('NAT_BC_CRED').AsString);
    Fcredito_pis_cofins  := Trim(ADataSet.FieldByName('CREDITO_PIS_COFINS').AsString);
    Freceita_pis_cofins  := Trim(ADataSet.FieldByName('RECEITA_PIS_COFINS').AsString);
    Fdevolucao           := Trim(ADataSet.FieldByName('DEVOLUCAO').AsString);
    Ftipv                := Trim(ADataSet.FieldByName('TIPV').AsString);
    Fcod_inf             := ADataSet.FieldByName('COD_INF').AsInteger;
    Ffaturamento         := Trim(ADataSet.FieldByName('FATURAMENTO').AsString);
    Ftipv_veiculo        := Trim(ADataSet.FieldByName('TIPV_VEICULO').AsString);
    Fusa_bx_retorno_fin  := Trim(ADataSet.FieldByName('USA_BX_RETORNO_FIN').AsString);
    Fordemexibicao       := ADataSet.FieldByName('ORDEMEXIBICAO').AsInteger;
    Fdevolucao_sped      := Trim(ADataSet.FieldByName('DEVOLUCAO_SPED').AsString);
    Ftipo_operacao       := Trim(ADataSet.FieldByName('TIPO_OPERACAO').AsString);
    Fcompra              := Trim(ADataSet.FieldByName('COMPRA').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('CODIGO_NOP'         )) then Fcodigo_nop          := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    if Assigned(ADataSet.FindField('DESCRICAO_NOP'      )) then Fdescricao_nop       := Trim(ADataSet.FieldByName('DESCRICAO_NOP').AsString);
    if Assigned(ADataSet.FindField('PRECC'              )) then Fprecc               := Trim(ADataSet.FieldByName('PRECC').AsString);
    if Assigned(ADataSet.FindField('COMIMP'             )) then Fcomimp              := Trim(ADataSet.FieldByName('COMIMP').AsString);
    if Assigned(ADataSet.FindField('SEM_IMPOSTO'        )) then Fsem_imposto         := Trim(ADataSet.FieldByName('SEM_IMPOSTO').AsString);
    if Assigned(ADataSet.FindField('CALC_CUSTO'         )) then Fcalc_custo          := Trim(ADataSet.FieldByName('CALC_CUSTO').AsString);
    if Assigned(ADataSet.FindField('ALIQ_INT_SAID'      )) then Faliq_int_said       := ADataSet.FieldByName('ALIQ_INT_SAID').AsFloat;
    if Assigned(ADataSet.FindField('ATIVO'              )) then Fativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('ALT_EST'            )) then Falt_est             := Trim(ADataSet.FieldByName('ALT_EST').AsString);
    if Assigned(ADataSet.FindField('MOSTRAR_REL_COMPRAS')) then Fmostrar_rel_compras := Trim(ADataSet.FieldByName('MOSTRAR_REL_COMPRAS').AsString);
    if Assigned(ADataSet.FindField('CFOP_CONV'          )) then Fcfop_conv           := ADataSet.FieldByName('CFOP_CONV').AsFloat;
    if Assigned(ADataSet.FindField('NAT_BC_CRED'        )) then Fnat_bc_cred         := Trim(ADataSet.FieldByName('NAT_BC_CRED').AsString);
    if Assigned(ADataSet.FindField('CREDITO_PIS_COFINS' )) then Fcredito_pis_cofins  := Trim(ADataSet.FieldByName('CREDITO_PIS_COFINS').AsString);
    if Assigned(ADataSet.FindField('RECEITA_PIS_COFINS' )) then Freceita_pis_cofins  := Trim(ADataSet.FieldByName('RECEITA_PIS_COFINS').AsString);
    if Assigned(ADataSet.FindField('DEVOLUCAO'          )) then Fdevolucao           := Trim(ADataSet.FieldByName('DEVOLUCAO').AsString);
    if Assigned(ADataSet.FindField('TIPV'               )) then Ftipv                := Trim(ADataSet.FieldByName('TIPV').AsString);
    if Assigned(ADataSet.FindField('COD_INF'            )) then Fcod_inf             := ADataSet.FieldByName('COD_INF').AsInteger;
    if Assigned(ADataSet.FindField('FATURAMENTO'        )) then Ffaturamento         := Trim(ADataSet.FieldByName('FATURAMENTO').AsString);
    if Assigned(ADataSet.FindField('TIPV_VEICULO'       )) then Ftipv_veiculo        := Trim(ADataSet.FieldByName('TIPV_VEICULO').AsString);
    if Assigned(ADataSet.FindField('USA_BX_RETORNO_FIN' )) then Fusa_bx_retorno_fin  := Trim(ADataSet.FieldByName('USA_BX_RETORNO_FIN').AsString);
    if Assigned(ADataSet.FindField('ORDEMEXIBICAO'      )) then Fordemexibicao       := ADataSet.FieldByName('ORDEMEXIBICAO').AsInteger;
    if Assigned(ADataSet.FindField('DEVOLUCAO_SPED'     )) then Fdevolucao_sped      := Trim(ADataSet.FieldByName('DEVOLUCAO_SPED').AsString);
    if Assigned(ADataSet.FindField('TIPO_OPERACAO'      )) then Ftipo_operacao       := Trim(ADataSet.FieldByName('TIPO_OPERACAO').AsString);
    if Assigned(ADataSet.FindField('COMPRA'             )) then Fcompra              := Trim(ADataSet.FieldByName('COMPRA').AsString);
  end;
end;

{ TNat_op_classList }

function TNat_op_classList.GetItem(Index: Integer): TNat_op_class;
begin
  Result := TNat_op_class(inherited Items[Index]);
end;

function TNat_op_classList.New: TNat_op_class;
begin
  Result := TNat_op_class.Create;
  Add(Result);
end;

procedure TNat_op_classList.SetItem(Index: Integer; const Value: TNat_op_class);
begin
  Put(Index, Value);
end;
procedure TNat_op_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
