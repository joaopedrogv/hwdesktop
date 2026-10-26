unit conferencia_cega_class;

interface

uses
  Classes,
  Contnrs,
  DB;

type
  TConferencia_cega_class = class(TObject)
  private
    Fcod_conferencia              : Integer;
    Fcod_empresa                  : Integer;
    Fcod_cliente                  : Integer;
    Ftipo_conferencia             : string;
    Fstatus                       : string;
    Fdata_fechamento              : TDateTime;
    Fdata_hora_fechamento         : TDateTime;
    Fcontagem                     : string;
    Fstatus_contagem_atual        : string;
    Fdata_fechamento_primeira     : TDateTime;
    Fdata_hora_fechamento_primeira: TDateTime;
    Fdata_fechamento_segunda      : TDateTime;
    Fdata_hora_fechamento_segunda : TDateTime;
    Fdata_fechamento_terceira     : TDateTime;
    Fdata_hora_fechamento_terceira: TDateTime;
    Fnum_doc                      : Integer;
    Fdata_doc                     : TDateTime;
    Fdata_inclusao                : TDateTime;
    Fdata_hora_inclusao           : TDateTime;
    Fcod_usuario                  : Integer;
    Fcod_usuario_primeira         : Integer;
    Fcod_usuario_segunda          : Integer;
    Fcod_usuario_terceira         : Integer;
    Fativo                        : Integer;
    Fobservacao                   : TStrings;
    Fcontar_divergentes           : string;
    Fidentificacao                : string;
    Fconferindo                   : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TConferencia_cega_class; virtual;

    property cod_conferencia              : Integer   read Fcod_conferencia               write Fcod_conferencia;
    property cod_empresa                  : Integer   read Fcod_empresa                   write Fcod_empresa;
    property cod_cliente                  : Integer   read Fcod_cliente                   write Fcod_cliente;
    property tipo_conferencia             : string    read Ftipo_conferencia              write Ftipo_conferencia;
    property status                       : string    read Fstatus                        write Fstatus;
    property data_fechamento              : TDateTime read Fdata_fechamento               write Fdata_fechamento;
    property data_hora_fechamento         : TDateTime read Fdata_hora_fechamento          write Fdata_hora_fechamento;
    property contagem                     : string    read Fcontagem                      write Fcontagem;
    property status_contagem_atual        : string    read Fstatus_contagem_atual         write Fstatus_contagem_atual;
    property data_fechamento_primeira     : TDateTime read Fdata_fechamento_primeira      write Fdata_fechamento_primeira;
    property data_hora_fechamento_primeira: TDateTime read Fdata_hora_fechamento_primeira write Fdata_hora_fechamento_primeira;
    property data_fechamento_segunda      : TDateTime read Fdata_fechamento_segunda       write Fdata_fechamento_segunda;
    property data_hora_fechamento_segunda : TDateTime read Fdata_hora_fechamento_segunda  write Fdata_hora_fechamento_segunda;
    property data_fechamento_terceira     : TDateTime read Fdata_fechamento_terceira      write Fdata_fechamento_terceira;
    property data_hora_fechamento_terceira: TDateTime read Fdata_hora_fechamento_terceira write Fdata_hora_fechamento_terceira;
    property num_doc                      : Integer   read Fnum_doc                       write Fnum_doc;
    property data_doc                     : TDateTime read Fdata_doc                      write Fdata_doc;
    property data_inclusao                : TDateTime read Fdata_inclusao                 write Fdata_inclusao;
    property data_hora_inclusao           : TDateTime read Fdata_hora_inclusao            write Fdata_hora_inclusao;
    property cod_usuario                  : Integer   read Fcod_usuario                   write Fcod_usuario;
    property cod_usuario_primeira         : Integer   read Fcod_usuario_primeira          write Fcod_usuario_primeira;
    property cod_usuario_segunda          : Integer   read Fcod_usuario_segunda           write Fcod_usuario_segunda;
    property cod_usuario_terceira         : Integer   read Fcod_usuario_terceira          write Fcod_usuario_terceira;
    property ativo                        : Integer   read Fativo                         write Fativo;
    property observacao                   : TStrings  read Fobservacao                    write Fobservacao;
    property contar_divergentes           : string    read Fcontar_divergentes            write Fcontar_divergentes;
    property identificacao                : string    read Fidentificacao                 write Fidentificacao;
    property conferindo                   : string    read Fconferindo                    write Fconferindo;
  end;

  TConferencia_cega_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TConferencia_cega_class;
    procedure SetItem(Index: Integer; const Value: TConferencia_cega_class);
  public
    function New: TConferencia_cega_class;

    property Items[Index: Integer]: TConferencia_cega_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TConferencia_cega_class }

constructor TConferencia_cega_class.Create;
begin
  Fativo      := 1;
  Fobservacao := TStringList.Create;
end;

destructor TConferencia_cega_class.Destroy;
begin
  if Assigned(Fobservacao) then
    FreeAndNil(Fobservacao);
  inherited;
end;

function TConferencia_cega_class.Clone: TConferencia_cega_class;
begin
  if not Assigned(Result) then
  Result                               := TConferencia_cega_class.Create;
  Result.cod_conferencia               := Self.cod_conferencia;
  Result.cod_empresa                   := Self.cod_empresa;
  Result.cod_cliente                   := Self.cod_cliente;
  Result.tipo_conferencia              := Self.tipo_conferencia;
  Result.status                        := Self.status;
  Result.data_fechamento               := Self.data_fechamento;
  Result.data_hora_fechamento          := Self.data_hora_fechamento;
  Result.contagem                      := Self.contagem;
  Result.status_contagem_atual         := Self.status_contagem_atual;
  Result.data_fechamento_primeira      := Self.data_fechamento_primeira;
  Result.data_hora_fechamento_primeira := Self.data_hora_fechamento_primeira;
  Result.data_fechamento_segunda       := Self.data_fechamento_segunda;
  Result.data_hora_fechamento_segunda  := Self.data_hora_fechamento_segunda;
  Result.data_fechamento_terceira      := Self.data_fechamento_terceira;
  Result.data_hora_fechamento_terceira := Self.data_hora_fechamento_terceira;
  Result.num_doc                       := Self.num_doc;
  Result.data_doc                      := Self.data_doc;
  Result.data_inclusao                 := Self.data_inclusao;
  Result.data_hora_inclusao            := Self.data_hora_inclusao;
  Result.cod_usuario                   := Self.cod_usuario;
  Result.cod_usuario_primeira          := Self.cod_usuario_primeira;
  Result.cod_usuario_segunda           := Self.cod_usuario_segunda;
  Result.cod_usuario_terceira          := Self.cod_usuario_terceira;
  Result.ativo                         := Self.ativo;
  Result.observacao.Text               := Self.observacao.Text;
  Result.contar_divergentes            := Self.contar_divergentes;
  Result.identificacao                 := Self.identificacao;
  Result.conferindo                    := Self.conferindo;
end;

class function TConferencia_cega_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_conferencia, @cod_empresa, @cod_cliente, @tipo_conferencia, @status, @data_fechamento,' +
            ' @data_hora_fechamento, @contagem, @status_contagem_atual, @data_fechamento_primeira,' +
            ' @data_hora_fechamento_primeira, @data_fechamento_segunda, @data_hora_fechamento_segunda,' +
            ' @data_fechamento_terceira, @data_hora_fechamento_terceira, @num_doc, @data_doc, @data_inclusao,' +
            ' @data_hora_inclusao, @cod_usuario, @cod_usuario_primeira, @cod_usuario_segunda, @cod_usuario_terceira,' +
            ' @ativo, @observacao, @contar_divergentes, @identificacao, @conferindo';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TConferencia_cega_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_conferencia               := ADataSet.FieldByName('COD_CONFERENCIA').AsInteger;
  Fcod_empresa                   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fcod_cliente                   := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
  Ftipo_conferencia              := Trim(ADataSet.FieldByName('TIPO_CONFERENCIA').AsString);
  Fstatus                        := Trim(ADataSet.FieldByName('STATUS').AsString);
  Fdata_fechamento               := ADataSet.FieldByName('DATA_FECHAMENTO').AsDateTime;
  Fdata_hora_fechamento          := ADataSet.FieldByName('DATA_HORA_FECHAMENTO').AsDateTime;
  Fcontagem                      := Trim(ADataSet.FieldByName('CONTAGEM').AsString);
  Fstatus_contagem_atual         := Trim(ADataSet.FieldByName('STATUS_CONTAGEM_ATUAL').AsString);
  Fdata_fechamento_primeira      := ADataSet.FieldByName('DATA_FECHAMENTO_PRIMEIRA').AsDateTime;
  Fdata_hora_fechamento_primeira := ADataSet.FieldByName('DATA_HORA_FECHAMENTO_PRIMEIRA').AsDateTime;
  Fdata_fechamento_segunda       := ADataSet.FieldByName('DATA_FECHAMENTO_SEGUNDA').AsDateTime;
  Fdata_hora_fechamento_segunda  := ADataSet.FieldByName('DATA_HORA_FECHAMENTO_SEGUNDA').AsDateTime;
  Fdata_fechamento_terceira      := ADataSet.FieldByName('DATA_FECHAMENTO_TERCEIRA').AsDateTime;
  Fdata_hora_fechamento_terceira := ADataSet.FieldByName('DATA_HORA_FECHAMENTO_TERCEIRA').AsDateTime;
  Fnum_doc                       := ADataSet.FieldByName('NUM_DOC').AsInteger;
  Fdata_doc                      := ADataSet.FieldByName('DATA_DOC').AsDateTime;
  Fdata_inclusao                 := ADataSet.FieldByName('DATA_INCLUSAO').AsDateTime;
  Fdata_hora_inclusao            := ADataSet.FieldByName('DATA_HORA_INCLUSAO').AsDateTime;
  Fcod_usuario                   := ADataSet.FieldByName('COD_USUARIO').AsInteger;
  Fcod_usuario_primeira          := ADataSet.FieldByName('COD_USUARIO_PRIMEIRA').AsInteger;
  Fcod_usuario_segunda           := ADataSet.FieldByName('COD_USUARIO_SEGUNDA').AsInteger;
  Fcod_usuario_terceira          := ADataSet.FieldByName('COD_USUARIO_TERCEIRA').AsInteger;
  Fativo                         := ADataSet.FieldByName('ATIVO').AsInteger;
  Fobservacao.Text               := Trim(ADataSet.FieldByName('OBSERVACAO').AsString);
  Fcontar_divergentes            := Trim(ADataSet.FieldByName('CONTAR_DIVERGENTES').AsString);
  Fidentificacao                 := Trim(ADataSet.FieldByName('IDENTIFICACAO').AsString);
  Fconferindo                    := Trim(ADataSet.FieldByName('CONFERINDO').AsString);
end;

{ TConferencia_cega_classList }

function TConferencia_cega_classList.GetItem(Index: Integer): TConferencia_cega_class;
begin
  Result := TConferencia_cega_class(inherited Items[Index]);
end;

function TConferencia_cega_classList.New: TConferencia_cega_class;
begin
  Result := TConferencia_cega_class.Create;
  Add(Result);
end;

procedure TConferencia_cega_classList.SetItem(Index: Integer; const Value: TConferencia_cega_class);
begin
  Put(Index, Value);
end;

end.
