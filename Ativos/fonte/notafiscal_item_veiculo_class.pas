unit notafiscal_item_veiculo_class;

interface

uses
  Contnrs, DB, Classes;

type
  TNotafiscal_item_veiculo_class = class(TObject)
  private
    Fcod_nf          : Integer;
    Fcod_empresa     : Integer;
    Fnitem           : Integer;
    Fchassi          : string;
    Fmarca           : string;
    Fversao          : Integer;
    Fdescricao_versao: string;
    Fano_fab         : Integer;
    Fano_mod         : Integer;
    Fcor             : string;
    Fcilindros       : Integer;
    Fcombustivel     : string;
    Fcilindrada      : Double;
    Fhp              : Double;
    Flotacao         : string;
    Ftipo            : string;
    Frenavam         : string;
    Fpreco_tab       : Double;
    Ffrete_aquisicao : Double;
    Ffrete_venda     : Double;
    Fobs_item        : string;
    Fmotor           : string;
    Fplaca           : string;
    Fcertificado     : string;
    Fdata_certificado: TDateTime;
    Fcategoria       : string;
    Fnf_aq           : Integer;
    Fserie_aq        : string;
    Fcod_forn_aq     : Integer;
    Fdata_aq         : TDateTime;
    Fcodigo          : Integer;
    Fdat_cadm        : TDateTime;
    Fprecocompra     : Double;
    Fprecovenda      : Double;
    Ftipo_venda      : string;
    Festoque         : string;
    Fnserie          : string;
    Ftip_pintura     : string;
    Fcod_cor         : Integer;
    Fcom_ent         : Integer;
    Fsituacao        : string;
    Fred_lucro       : string;
    Fdados_v         : TStrings;
    Ftipo_comando    : string;
    Fn_comando       : Integer;
    Fpiscofins       : Double;
    Fativo           : Integer;
    Ftipo_item       : string;
    Ftpcomb          : string;
    Ftprest          : string;
    Fcodfisc         : string;
    Fpreco_custo     : Double;
    Fcod_marca       : Integer;
    Fcod_combustivel : Integer;
    Fcod_tipo_esp    : Integer;
    Ftipv_veiculo    : string;
    Fcod_estmoto     : Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    property cod_nf          : Integer   read Fcod_nf           write Fcod_nf;
    property cod_empresa     : Integer   read Fcod_empresa      write Fcod_empresa;
    property nitem           : Integer   read Fnitem            write Fnitem;
    property chassi          : string    read Fchassi           write Fchassi;
    property marca           : string    read Fmarca            write Fmarca;
    property versao          : Integer   read Fversao           write Fversao;
    property descricao_versao: string    read Fdescricao_versao write Fdescricao_versao;
    property ano_fab         : Integer   read Fano_fab          write Fano_fab;
    property ano_mod         : Integer   read Fano_mod          write Fano_mod;
    property cor             : string    read Fcor              write Fcor;
    property cilindros       : Integer   read Fcilindros        write Fcilindros;
    property combustivel     : string    read Fcombustivel      write Fcombustivel;
    property cilindrada      : Double    read Fcilindrada       write Fcilindrada;
    property hp              : Double    read Fhp               write Fhp;
    property lotacao         : string    read Flotacao          write Flotacao;
    property tipo            : string    read Ftipo             write Ftipo;
    property renavam         : string    read Frenavam          write Frenavam;
    property preco_tab       : Double    read Fpreco_tab        write Fpreco_tab;
    property frete_aquisicao : Double    read Ffrete_aquisicao  write Ffrete_aquisicao;
    property frete_venda     : Double    read Ffrete_venda      write Ffrete_venda;
    property obs_item        : string    read Fobs_item         write Fobs_item;
    property motor           : string    read Fmotor            write Fmotor;
    property placa           : string    read Fplaca            write Fplaca;
    property certificado     : string    read Fcertificado      write Fcertificado;
    property data_certificado: TDateTime read Fdata_certificado write Fdata_certificado;
    property categoria       : string    read Fcategoria        write Fcategoria;
    property nf_aq           : Integer   read Fnf_aq            write Fnf_aq;
    property serie_aq        : string    read Fserie_aq         write Fserie_aq;
    property cod_forn_aq     : Integer   read Fcod_forn_aq      write Fcod_forn_aq;
    property data_aq         : TDateTime read Fdata_aq          write Fdata_aq;
    property codigo          : Integer   read Fcodigo           write Fcodigo;
    property dat_cadm        : TDateTime read Fdat_cadm         write Fdat_cadm;
    property precocompra     : Double    read Fprecocompra      write Fprecocompra;
    property precovenda      : Double    read Fprecovenda       write Fprecovenda;
    property tipo_venda      : string    read Ftipo_venda       write Ftipo_venda;
    property estoque         : string    read Festoque          write Festoque;
    property nserie          : string    read Fnserie           write Fnserie;
    property tip_pintura     : string    read Ftip_pintura      write Ftip_pintura;
    property cod_cor         : Integer   read Fcod_cor          write Fcod_cor;
    property com_ent         : Integer   read Fcom_ent          write Fcom_ent;
    property situacao        : string    read Fsituacao         write Fsituacao;
    property red_lucro       : string    read Fred_lucro        write Fred_lucro;
    property dados_v         : TStrings  read Fdados_v          write Fdados_v;
    property tipo_comando    : string    read Ftipo_comando     write Ftipo_comando;
    property n_comando       : Integer   read Fn_comando        write Fn_comando;
    property piscofins       : Double    read Fpiscofins        write Fpiscofins;
    property ativo           : Integer   read Fativo            write Fativo;
    property tipo_item       : string    read Ftipo_item        write Ftipo_item;
    property tpcomb          : string    read Ftpcomb           write Ftpcomb;
    property tprest          : string    read Ftprest           write Ftprest;
    property codfisc         : string    read Fcodfisc          write Fcodfisc;
    property preco_custo     : Double    read Fpreco_custo      write Fpreco_custo;
    property cod_marca       : Integer   read Fcod_marca        write Fcod_marca;
    property cod_combustivel : Integer   read Fcod_combustivel  write Fcod_combustivel;
    property cod_tipo_esp    : Integer   read Fcod_tipo_esp     write Fcod_tipo_esp;
    property tipv_veiculo    : string    read Ftipv_veiculo     write Ftipv_veiculo;
    property cod_estmoto     : Integer   read Fcod_estmoto      write Fcod_estmoto;
  end;

  TNotafiscal_item_veiculo_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_item_veiculo_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_item_veiculo_class);
  public
    function New: TNotafiscal_item_veiculo_class;

    property Items[Index: Integer]: TNotafiscal_item_veiculo_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{TNotafiscal_item_veiculo_class}

constructor TNotafiscal_item_veiculo_class.Create;
begin
  Fdados_v := TStringList.Create;
  Fativo   := 1;
end;

destructor TNotafiscal_item_veiculo_class.Destroy;
begin
  if Assigned(Fdados_v) then
    FreeAndNil(Fdados_v);
  inherited;
end;

procedure TNotafiscal_item_veiculo_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_nf           := ADataSet.FieldByName('COD_NF').AsInteger;
  Fcod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fnitem            := ADataSet.FieldByName('NITEM').AsInteger;
  Fchassi           := Trim(ADataSet.FieldByName('CHASSI').AsString);
  Fmarca            := Trim(ADataSet.FieldByName('MARCA').AsString);
  Fversao           := ADataSet.FieldByName('VERSAO').AsInteger;
  Fdescricao_versao := Trim(ADataSet.FieldByName('DESCRICAO_VERSAO').AsString);
  Fano_fab          := ADataSet.FieldByName('ANO_FAB').AsInteger;
  Fano_mod          := ADataSet.FieldByName('ANO_MOD').AsInteger;
  Fcor              := Trim(ADataSet.FieldByName('COR').AsString);
  Fcilindros        := ADataSet.FieldByName('CILINDROS').AsInteger;
  Fcombustivel      := Trim(ADataSet.FieldByName('COMBUSTIVEL').AsString);
  Fcilindrada       := ADataSet.FieldByName('CILINDRADA').AsFloat;
  Fhp               := ADataSet.FieldByName('HP').AsFloat;
  Flotacao          := Trim(ADataSet.FieldByName('LOTACAO').AsString);
  Ftipo             := Trim(ADataSet.FieldByName('TIPO').AsString);
  Frenavam          := Trim(ADataSet.FieldByName('RENAVAM').AsString);
  Fpreco_tab        := ADataSet.FieldByName('PRECO_TAB').AsFloat;
  Ffrete_aquisicao  := ADataSet.FieldByName('FRETE_AQUISICAO').AsFloat;
  Ffrete_venda      := ADataSet.FieldByName('FRETE_VENDA').AsFloat;
  Fobs_item         := Trim(ADataSet.FieldByName('OBS_ITEM').AsString);
  Fmotor            := Trim(ADataSet.FieldByName('MOTOR').AsString);
  Fplaca            := Trim(ADataSet.FieldByName('PLACA').AsString);
  Fcertificado      := Trim(ADataSet.FieldByName('CERTIFICADO').AsString);
  Fdata_certificado := ADataSet.FieldByName('DATA_CERTIFICADO').AsDateTime;
  Fcategoria        := Trim(ADataSet.FieldByName('CATEGORIA').AsString);
  Fnf_aq            := ADataSet.FieldByName('NF_AQ').AsInteger;
  Fserie_aq         := Trim(ADataSet.FieldByName('SERIE_AQ').AsString);
  Fcod_forn_aq      := ADataSet.FieldByName('COD_FORN_AQ').AsInteger;
  Fdata_aq          := ADataSet.FieldByName('DATA_AQ').AsDateTime;
  Fcodigo           := ADataSet.FieldByName('CODIGO').AsInteger;
  Fdat_cadm         := ADataSet.FieldByName('DAT_CADM').AsDateTime;
  Fprecocompra      := ADataSet.FieldByName('PRECOCOMPRA').AsFloat;
  Fprecovenda       := ADataSet.FieldByName('PRECOVENDA').AsFloat;
  Ftipo_venda       := Trim(ADataSet.FieldByName('TIPO_VENDA').AsString);
  Festoque          := Trim(ADataSet.FieldByName('ESTOQUE').AsString);
  Fnserie           := Trim(ADataSet.FieldByName('NSERIE').AsString);
  Ftip_pintura      := Trim(ADataSet.FieldByName('TIP_PINTURA').AsString);
  Fcod_cor          := ADataSet.FieldByName('COD_COR').AsInteger;
  Fcom_ent          := ADataSet.FieldByName('COM_ENT').AsInteger;
  Fsituacao         := Trim(ADataSet.FieldByName('SITUACAO').AsString);
  Fred_lucro        := Trim(ADataSet.FieldByName('RED_LUCRO').AsString);
  Fdados_v.Text     := Trim(ADataSet.FieldByName('DADOS_V').AsString);
  Ftipo_comando     := Trim(ADataSet.FieldByName('TIPO_COMANDO').AsString);
  Fn_comando        := ADataSet.FieldByName('N_COMANDO').AsInteger;
  Fpiscofins        := ADataSet.FieldByName('PISCOFINS').AsFloat;
  Fativo            := ADataSet.FieldByName('ATIVO').AsInteger;
  Ftipo_item        := Trim(ADataSet.FieldByName('TIPO_ITEM').AsString);
  Ftpcomb           := Trim(ADataSet.FieldByName('TPCOMB').AsString);
  Ftprest           := Trim(ADataSet.FieldByName('TPREST').AsString);
  Fcodfisc          := Trim(ADataSet.FieldByName('CODFISC').AsString);
  Fpreco_custo      := ADataSet.FieldByName('PRECO_CUSTO').AsFloat;
  Fcod_marca        := ADataSet.FieldByName('COD_MARCA').AsInteger;
  Fcod_combustivel  := ADataSet.FieldByName('COD_COMBUSTIVEL').AsInteger;
  Fcod_tipo_esp     := ADataSet.FieldByName('COD_TIPO_ESP').AsInteger;
  Ftipv_veiculo     := Trim(ADataSet.FieldByName('TIPV_VEICULO').AsString);
  Fcod_estmoto      := ADataSet.FieldByName('COD_ESTMOTO').AsInteger;
end;

{TNotafiscal_item_veiculo_classList}

function TNotafiscal_item_veiculo_classList.GetItem(Index: Integer): TNotafiscal_item_veiculo_class;
begin
  Result := TNotafiscal_item_veiculo_class(inherited Items[Index]);
end;

function TNotafiscal_item_veiculo_classList.New: TNotafiscal_item_veiculo_class;
begin
  Result := TNotafiscal_item_veiculo_class.Create;
  Add(Result);
end;

procedure TNotafiscal_item_veiculo_classList.SetItem(Index: Integer; const Value: TNotafiscal_item_veiculo_class);
begin
  Put(Index, Value);
end;

end.
