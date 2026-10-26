unit plano_pag_class;

interface

uses
{$IFDEF VER310}
  System.Classes,
  System.Contnrs,
  Data.DB;
{$ELSE}
  Classes,
  Contnrs,
  DB;
{$ENDIF}

type
  TPlano_pag_class = class(TObject)
  private
    Fseqplano     : Integer;
    Fcod_empresa  : Integer;
    Fnrequisicao  : Integer;
    Ftipdoc       : string;
    Fcod_controle : Integer;
    Fcod_cliente  : Integer;
    Fhistorico    : string;
    Fdata_mov     : TDateTime;
    Fvalordoc     : Double;
    Ftpdocs       : string;
    Fdata_venc    : TDateTime;
    Foperador     : Integer;
    Ftip_cnt      : string;
    Ftexto_plano  : TStrings;
    Fativo        : Integer;
    Fnome_ctrl    : string;
    Fentrvalor    : string;
    Fvaloroperacao: Double;
    Fvalor_real   : Double;
    Fvalor_nf     : Double;
    Fn_os_retorno : Integer;
    Fchassiv      : string;
    Fcod_estmoto  : Integer;
    Falterado     : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property seqplano     : Integer   read Fseqplano      write Fseqplano;
    property cod_empresa  : Integer   read Fcod_empresa   write Fcod_empresa;
    property nrequisicao  : Integer   read Fnrequisicao   write Fnrequisicao;
    property tipdoc       : string    read Ftipdoc        write Ftipdoc;
    property cod_controle : Integer   read Fcod_controle  write Fcod_controle;
    property cod_cliente  : Integer   read Fcod_cliente   write Fcod_cliente;
    property historico    : string    read Fhistorico     write Fhistorico;
    property data_mov     : TDateTime read Fdata_mov      write Fdata_mov;
    property valordoc     : Double    read Fvalordoc      write Fvalordoc;
    property tpdocs       : string    read Ftpdocs        write Ftpdocs;
    property data_venc    : TDateTime read Fdata_venc     write Fdata_venc;
    property operador     : Integer   read Foperador      write Foperador;
    property tip_cnt      : string    read Ftip_cnt       write Ftip_cnt;
    property texto_plano  : TStrings  read Ftexto_plano   write Ftexto_plano;
    property ativo        : Integer   read Fativo         write Fativo;
    property nome_ctrl    : string    read Fnome_ctrl     write Fnome_ctrl;
    property entrvalor    : string    read Fentrvalor     write Fentrvalor;
    property valoroperacao: Double    read Fvaloroperacao write Fvaloroperacao;
    property valor_real   : Double    read Fvalor_real    write Fvalor_real;
    property valor_nf     : Double    read Fvalor_nf      write Fvalor_nf;
    property n_os_retorno : Integer   read Fn_os_retorno  write Fn_os_retorno;
    property chassiv      : string    read Fchassiv       write Fchassiv;
    property cod_estmoto  : Integer   read Fcod_estmoto   write Fcod_estmoto;
    property alterado     : string    read Falterado      write Falterado;
  end;

  TPlano_pag_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TPlano_pag_class;
    procedure SetItem(Index: Integer; const Value: TPlano_pag_class);
  public
    function New: TPlano_pag_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TPlano_pag_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TPlano_pag_class }

constructor TPlano_pag_class.Create;
begin
  Ftexto_plano := TStringList.Create;
  Fativo       := 1;
end;

destructor TPlano_pag_class.Destroy;
begin
  if Assigned(Ftexto_plano) then
    FreeAndNil(Ftexto_plano);
  inherited;
end;

class function TPlano_pag_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@seqplano, @cod_empresa, @nrequisicao, @tipdoc, @cod_controle, @cod_cliente, @historico, @data_mov,' +
            ' @valordoc, @tpdocs, @data_venc, @operador, @tip_cnt, @texto_plano, @ativo, @nome_ctrl, @entrvalor,' +
            ' @valoroperacao, @valor_real, @valor_nf, @n_os_retorno, @chassiv, @cod_estmoto, @alterado';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPlano_pag_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fseqplano         := ADataSet.FieldByName('SEQPLANO').AsInteger;
    Fcod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fnrequisicao      := ADataSet.FieldByName('NREQUISICAO').AsInteger;
    Ftipdoc           := Trim(ADataSet.FieldByName('TIPDOC').AsString);
    Fcod_controle     := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    Fcod_cliente      := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    Fhistorico        := Trim(ADataSet.FieldByName('HISTORICO').AsString);
    Fdata_mov         := ADataSet.FieldByName('DATA_MOV').AsDateTime;
    Fvalordoc         := ADataSet.FieldByName('VALORDOC').AsFloat;
    Ftpdocs           := Trim(ADataSet.FieldByName('TPDOCS').AsString);
    Fdata_venc        := ADataSet.FieldByName('DATA_VENC').AsDateTime;
    Foperador         := ADataSet.FieldByName('OPERADOR').AsInteger;
    Ftip_cnt          := Trim(ADataSet.FieldByName('TIP_CNT').AsString);
    Ftexto_plano.Text := Trim(ADataSet.FieldByName('TEXTO_PLANO').AsString);
    Fativo            := ADataSet.FieldByName('ATIVO').AsInteger;
    Fnome_ctrl        := Trim(ADataSet.FieldByName('NOME_CTRL').AsString);
    Fentrvalor        := Trim(ADataSet.FieldByName('ENTRVALOR').AsString);
    Fvaloroperacao    := ADataSet.FieldByName('VALOROPERACAO').AsFloat;
    Fvalor_real       := ADataSet.FieldByName('VALOR_REAL').AsFloat;
    Fvalor_nf         := ADataSet.FieldByName('VALOR_NF').AsFloat;
    Fn_os_retorno     := ADataSet.FieldByName('N_OS_RETORNO').AsInteger;
    Fchassiv          := Trim(ADataSet.FieldByName('CHASSIV').AsString);
    Fcod_estmoto      := ADataSet.FieldByName('COD_ESTMOTO').AsInteger;
    Falterado         := Trim(ADataSet.FieldByName('ALTERADO').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('SEQPLANO'     )) then Fseqplano         := ADataSet.FieldByName('SEQPLANO').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'  )) then Fcod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('NREQUISICAO'  )) then Fnrequisicao      := ADataSet.FieldByName('NREQUISICAO').AsInteger;
    if Assigned(ADataSet.FindField('TIPDOC'       )) then Ftipdoc           := Trim(ADataSet.FieldByName('TIPDOC').AsString);
    if Assigned(ADataSet.FindField('COD_CONTROLE' )) then Fcod_controle     := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    if Assigned(ADataSet.FindField('COD_CLIENTE'  )) then Fcod_cliente      := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('HISTORICO'    )) then Fhistorico        := Trim(ADataSet.FieldByName('HISTORICO').AsString);
    if Assigned(ADataSet.FindField('DATA_MOV'     )) then Fdata_mov         := ADataSet.FieldByName('DATA_MOV').AsDateTime;
    if Assigned(ADataSet.FindField('VALORDOC'     )) then Fvalordoc         := ADataSet.FieldByName('VALORDOC').AsFloat;
    if Assigned(ADataSet.FindField('TPDOCS'       )) then Ftpdocs           := Trim(ADataSet.FieldByName('TPDOCS').AsString);
    if Assigned(ADataSet.FindField('DATA_VENC'    )) then Fdata_venc        := ADataSet.FieldByName('DATA_VENC').AsDateTime;
    if Assigned(ADataSet.FindField('OPERADOR'     )) then Foperador         := ADataSet.FieldByName('OPERADOR').AsInteger;
    if Assigned(ADataSet.FindField('TIP_CNT'      )) then Ftip_cnt          := Trim(ADataSet.FieldByName('TIP_CNT').AsString);
    if Assigned(ADataSet.FindField('TEXTO_PLANO'  )) then Ftexto_plano.Text := Trim(ADataSet.FieldByName('TEXTO_PLANO').AsString);
    if Assigned(ADataSet.FindField('ATIVO'        )) then Fativo            := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('NOME_CTRL'    )) then Fnome_ctrl        := Trim(ADataSet.FieldByName('NOME_CTRL').AsString);
    if Assigned(ADataSet.FindField('ENTRVALOR'    )) then Fentrvalor        := Trim(ADataSet.FieldByName('ENTRVALOR').AsString);
    if Assigned(ADataSet.FindField('VALOROPERACAO')) then Fvaloroperacao    := ADataSet.FieldByName('VALOROPERACAO').AsFloat;
    if Assigned(ADataSet.FindField('VALOR_REAL'   )) then Fvalor_real       := ADataSet.FieldByName('VALOR_REAL').AsFloat;
    if Assigned(ADataSet.FindField('VALOR_NF'     )) then Fvalor_nf         := ADataSet.FieldByName('VALOR_NF').AsFloat;
    if Assigned(ADataSet.FindField('N_OS_RETORNO' )) then Fn_os_retorno     := ADataSet.FieldByName('N_OS_RETORNO').AsInteger;
    if Assigned(ADataSet.FindField('CHASSIV'      )) then Fchassiv          := Trim(ADataSet.FieldByName('CHASSIV').AsString);
    if Assigned(ADataSet.FindField('COD_ESTMOTO'  )) then Fcod_estmoto      := ADataSet.FieldByName('COD_ESTMOTO').AsInteger;
    if Assigned(ADataSet.FindField('ALTERADO'     )) then Falterado         := Trim(ADataSet.FieldByName('ALTERADO').AsString);
  end;
end;

{ TPlano_pag_classList }

function TPlano_pag_classList.GetItem(Index: Integer): TPlano_pag_class;
begin
  Result := TPlano_pag_class(inherited Items[Index]);
end;

function TPlano_pag_classList.New: TPlano_pag_class;
begin
  Result := TPlano_pag_class.Create;
  Add(Result);
end;

procedure TPlano_pag_classList.SetItem(Index: Integer; const Value: TPlano_pag_class);
begin
  Put(Index, Value);
end;

procedure TPlano_pag_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
