unit cond_pag_class;

interface

uses
{$IFDEF VER310}
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ELSE}
  Contnrs,
  DB,
  IBQuery;
{$ENDIF}

type
  TCond_pag_class = class(TObject)
  private
    Fcod_cond_pag       : Integer;
    Fdesc_cond_pag      : string;
    Fseqpreco           : string;
    Fmax_desc           : Double;
    Fativo              : Integer;
    Ffinalizador_cupom  : Integer;
    Fnatureza_cp        : string;
    Fmodalidade         : string;
    Fconsiderar_dia_util: string;
    Fparcelas_adicionais: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string;

    property cod_cond_pag       : Integer read Fcod_cond_pag        write Fcod_cond_pag;
    property desc_cond_pag      : string  read Fdesc_cond_pag       write Fdesc_cond_pag;
    property seqpreco           : string  read Fseqpreco            write Fseqpreco;
    property max_desc           : Double  read Fmax_desc            write Fmax_desc;
    property ativo              : Integer read Fativo               write Fativo;
    property finalizador_cupom  : Integer read Ffinalizador_cupom   write Ffinalizador_cupom;
    property natureza_cp        : string  read Fnatureza_cp         write Fnatureza_cp;
    property modalidade         : string  read Fmodalidade          write Fmodalidade;
    property considerar_dia_util: string  read Fconsiderar_dia_util write Fconsiderar_dia_util;
    property parcelas_adicionais: Integer read Fparcelas_adicionais write Fparcelas_adicionais;
  end;

  TCond_pag_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TCond_pag_class;
    procedure SetItem(Index: Integer; const Value: TCond_pag_class);
  public
    function New: TCond_pag_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TCond_pag_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TCond_pag_class }

constructor TCond_pag_class.Create;
begin
  Fativo := 1;
end;

destructor TCond_pag_class.Destroy;
begin
  inherited;
end;

class function TCond_pag_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_cond_pag, @desc_cond_pag, @seqpreco, @max_desc, @ativo, @finalizador_cupom, @natureza_cp, @modalidade,' +
            ' @considerar_dia_util, @parcelas_adicionais';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TCond_pag_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_cond_pag        := ADataSet.FieldByName('COD_COND_PAG').AsInteger;
    Fdesc_cond_pag       := Trim(ADataSet.FieldByName('DESC_COND_PAG').AsString);
    Fseqpreco            := Trim(ADataSet.FieldByName('SEQPRECO').AsString);
    Fmax_desc            := ADataSet.FieldByName('MAX_DESC').AsFloat;
    Fativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    Ffinalizador_cupom   := ADataSet.FieldByName('FINALIZADOR_CUPOM').AsInteger;
    Fnatureza_cp         := Trim(ADataSet.FieldByName('NATUREZA_CP').AsString);
    Fmodalidade          := Trim(ADataSet.FieldByName('MODALIDADE').AsString);
    Fconsiderar_dia_util := Trim(ADataSet.FieldByName('CONSIDERAR_DIA_UTIL').AsString);
    Fparcelas_adicionais := ADataSet.FieldByName('PARCELAS_ADICIONAIS').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_COND_PAG'       )) then Fcod_cond_pag        := ADataSet.FieldByName('COD_COND_PAG').AsInteger;
    if Assigned(ADataSet.FindField('DESC_COND_PAG'      )) then Fdesc_cond_pag       := Trim(ADataSet.FieldByName('DESC_COND_PAG').AsString);
    if Assigned(ADataSet.FindField('SEQPRECO'           )) then Fseqpreco            := Trim(ADataSet.FieldByName('SEQPRECO').AsString);
    if Assigned(ADataSet.FindField('MAX_DESC'           )) then Fmax_desc            := ADataSet.FieldByName('MAX_DESC').AsFloat;
    if Assigned(ADataSet.FindField('ATIVO'              )) then Fativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('FINALIZADOR_CUPOM'  )) then Ffinalizador_cupom   := ADataSet.FieldByName('FINALIZADOR_CUPOM').AsInteger;
    if Assigned(ADataSet.FindField('NATUREZA_CP'        )) then Fnatureza_cp         := Trim(ADataSet.FieldByName('NATUREZA_CP').AsString);
    if Assigned(ADataSet.FindField('MODALIDADE'         )) then Fmodalidade          := Trim(ADataSet.FieldByName('MODALIDADE').AsString);
    if Assigned(ADataSet.FindField('CONSIDERAR_DIA_UTIL')) then Fconsiderar_dia_util := Trim(ADataSet.FieldByName('CONSIDERAR_DIA_UTIL').AsString);
    if Assigned(ADataSet.FindField('PARCELAS_ADICIONAIS')) then Fparcelas_adicionais := ADataSet.FieldByName('PARCELAS_ADICIONAIS').AsInteger;
  end;
end;

function TCond_pag_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_COND_PAG').AsInteger        := Fcod_cond_pag;
    ADataSet.ParamByName('DESC_COND_PAG').AsString        := Copy(Fdesc_cond_pag      , 1, 30);
    ADataSet.ParamByName('SEQPRECO').AsString             := Copy(Fseqpreco           , 1, 1);
    ADataSet.ParamByName('MAX_DESC').AsFloat              := Fmax_desc;
    ADataSet.ParamByName('ATIVO').AsInteger               := Fativo;
    ADataSet.ParamByName('FINALIZADOR_CUPOM').AsInteger   := Ffinalizador_cupom;
    ADataSet.ParamByName('NATUREZA_CP').AsString          := Copy(Fnatureza_cp        , 1, 1);
    ADataSet.ParamByName('MODALIDADE').AsString           := Copy(Fmodalidade         , 1, 1);
    ADataSet.ParamByName('CONSIDERAR_DIA_UTIL').AsString  := Copy(Fconsiderar_dia_util, 1, 3);
    ADataSet.ParamByName('PARCELAS_ADICIONAIS').AsInteger := Fparcelas_adicionais;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_COND_PAG'       )) then   ADataSet.ParamByName('COD_COND_PAG').AsInteger        := Fcod_cond_pag;
    if Assigned(ADataSet.Params.FindParam('DESC_COND_PAG'      )) then   ADataSet.ParamByName('DESC_COND_PAG').AsString        := Copy(Fdesc_cond_pag      , 1, 30);
    if Assigned(ADataSet.Params.FindParam('SEQPRECO'           )) then   ADataSet.ParamByName('SEQPRECO').AsString             := Copy(Fseqpreco           , 1, 1);
    if Assigned(ADataSet.Params.FindParam('MAX_DESC'           )) then   ADataSet.ParamByName('MAX_DESC').AsFloat              := Fmax_desc;
    if Assigned(ADataSet.Params.FindParam('ATIVO'              )) then   ADataSet.ParamByName('ATIVO').AsInteger               := Fativo;
    if Assigned(ADataSet.Params.FindParam('FINALIZADOR_CUPOM'  )) then   ADataSet.ParamByName('FINALIZADOR_CUPOM').AsInteger   := Ffinalizador_cupom;
    if Assigned(ADataSet.Params.FindParam('NATUREZA_CP'        )) then   ADataSet.ParamByName('NATUREZA_CP').AsString          := Copy(Fnatureza_cp        , 1, 1);
    if Assigned(ADataSet.Params.FindParam('MODALIDADE'         )) then   ADataSet.ParamByName('MODALIDADE').AsString           := Copy(Fmodalidade         , 1, 1);
    if Assigned(ADataSet.Params.FindParam('CONSIDERAR_DIA_UTIL')) then   ADataSet.ParamByName('CONSIDERAR_DIA_UTIL').AsString  := Copy(Fconsiderar_dia_util, 1, 3);
    if Assigned(ADataSet.Params.FindParam('PARCELAS_ADICIONAIS')) then   ADataSet.ParamByName('PARCELAS_ADICIONAIS').AsInteger := Fparcelas_adicionais;
  end;
end;

{ TCond_pag_classList }

function TCond_pag_classList.GetItem(Index: Integer): TCond_pag_class;
begin
  Result := TCond_pag_class(inherited Items[Index]);
end;

function TCond_pag_classList.New: TCond_pag_class;
begin
  Result := TCond_pag_class.Create;
  Add(Result);
end;

procedure TCond_pag_classList.SetItem(Index: Integer; const Value: TCond_pag_class);
begin
  Put(Index, Value);
end;

procedure TCond_pag_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
