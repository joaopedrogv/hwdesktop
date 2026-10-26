unit hw_auditoria_class;

interface

uses
  Classes,
{$IFNDEF VER180}
  System.Contnrs;
{$ELSE}
  Contnrs;
{$ENDIF}

type
  THw_auditoria_class = class(TObject)
  private
    Fcod_processo : string;
    Facao         : string;
    Fmensagem     : string;
    Ftabela       : string;
    Fcodigo       : string;
    Fgravar       : Boolean;
    Fusuario      : string;
    Fusuario_lib  : string;
    Fstatus       : string;
    Fnome_processo: string;
    Fid           : Integer;
  public
    function Clone: THw_auditoria_class; virtual;

    property cod_processo : string  read Fcod_processo  write Fcod_processo;
    property acao         : string  read Facao          write Facao;
    property mensagem     : string  read Fmensagem      write Fmensagem;
    property tabela       : string  read Ftabela        write Ftabela;
    property codigo       : string  read Fcodigo        write Fcodigo;
    property gravar       : Boolean read Fgravar        write Fgravar;
    property usuario      : string  read Fusuario       write Fusuario;
    property usuario_lib  : string  read Fusuario_lib   write Fusuario_lib;
    property status       : string  read Fstatus        write Fstatus;
    property nome_processo: string  read Fnome_processo write Fnome_processo;
    property id           : Integer read Fid            write Fid;
  end;

  THw_auditoria_classList = class(TObjectList)
  private
    Ftable: string;
    FMensagem: TStrings;
    function GetLast: THw_auditoria_class;
    function GetItem(Index: Integer): THw_auditoria_class;
    procedure SetItem(Index: Integer; const Value: THw_auditoria_class);
  public
    constructor Create(table: string = '');
    destructor Destroy; override;

    function New: THw_auditoria_class; overload;
    function New(Acod_processo, Aacao, Amensagem, Atabela, Acodigo: string; Anome_processo: string = ''): THw_auditoria_class; overload;
    function NewRemove(Acod_processo, Amensagem, Atabela, Acodigo: string; Anome_processo: string = ''): THw_auditoria_class;
    function NewCancel(Acod_processo, Amensagem, Atabela, Acodigo: string; Anome_processo: string = ''): THw_auditoria_class;
    function NewValidate(Acod_processo, Amensagem, Atabela, Acodigo: string; Anome_processo: string = ''): THw_auditoria_class;

    function ProcessosNaoPermitidosToStr(): string;

    property Items[Index: Integer]: THw_auditoria_class read GetItem write SetItem;
    property Last: THw_auditoria_class read GetLast;
    property Mensagem: TStrings read FMensagem write FMensagem;
  end;

implementation

uses
  SysUtils,
  StrUtils;

function THw_auditoria_class.Clone: THw_auditoria_class;
begin
  Result               := THw_auditoria_class.Create;
  Result.cod_processo  := Self.cod_processo;
  Result.acao          := Self.acao;
  Result.mensagem      := Self.mensagem;
  Result.tabela        := Self.tabela;
  Result.codigo        := Self.codigo;
  Result.gravar        := Self.gravar;
  Result.usuario       := Self.usuario;
  Result.usuario_lib   := Self.usuario_lib;
  Result.status        := Self.status;
  Result.nome_processo := Self.nome_processo;
  Result.id            := Self.id;
end;

{ THw_auditoria_classList }

constructor THw_auditoria_classList.Create(table: string);
begin
  inherited Create;
  Ftable := table;
  FMensagem := TStringList.Create;
end;

destructor THw_auditoria_classList.Destroy;
begin
  FMensagem.Free;
  inherited;
end;

function THw_auditoria_classList.GetItem(Index: Integer): THw_auditoria_class;
begin
  Result := THw_auditoria_class(inherited Items[Index]);
end;

function THw_auditoria_classList.GetLast: THw_auditoria_class;
begin
  Result := nil;
  if Self.Count > 0 then
    Result := Self.Items[Self.Count - 1];
end;

function THw_auditoria_classList.New: THw_auditoria_class;
begin
  Result        := THw_auditoria_class.Create;
  Result.gravar := True;
  Add(Result);
end;

function THw_auditoria_classList.New(Acod_processo, Aacao, Amensagem, Atabela,
  Acodigo, Anome_processo: string): THw_auditoria_class;
begin
  Result := New;
  with Result do
  begin
    cod_processo  := Acod_processo;
    acao          := Aacao;
    mensagem      := Amensagem;
    tabela        := IfThen(Atabela <> '', Atabela, Ftable);
    codigo        := Acodigo;
    nome_processo := Anome_processo;
  end;
end;

function THw_auditoria_classList.NewCancel(Acod_processo, Amensagem, Atabela,
  Acodigo, Anome_processo: string): THw_auditoria_class;
begin
  Result := New;
  with Result do
  begin
    cod_processo  := Acod_processo;
    acao          := 'CANCELAR';
    mensagem      := Amensagem;
    tabela        := IfThen(Atabela <> '', Atabela, Ftable);
    codigo        := Acodigo;
    nome_processo := Anome_processo;
  end;
end;

function THw_auditoria_classList.NewRemove(Acod_processo, Amensagem, Atabela,
  Acodigo, Anome_processo: string): THw_auditoria_class;
begin
  Result := New;
  with Result do
  begin
    cod_processo  := Acod_processo;
    acao          := 'EXCLUIR';
    mensagem      := Amensagem;
    tabela        := IfThen(Atabela <> '', Atabela, Ftable);
    codigo        := Acodigo;
    nome_processo := Anome_processo;
  end;
end;

function THw_auditoria_classList.NewValidate(Acod_processo, Amensagem, Atabela,
  Acodigo, Anome_processo: string): THw_auditoria_class;
begin
  Result := New;
  with Result do
  begin
    cod_processo  := Acod_processo;
    acao          := 'VALIDAR';
    mensagem      := Amensagem;
    tabela        := IfThen(Atabela <> '', Atabela, Ftable);
    codigo        := Acodigo;
    nome_processo := Anome_processo;
  end;
end;

procedure THw_auditoria_classList.SetItem(Index: Integer; const Value: THw_auditoria_class);
begin
  Put(Index, Value);
end;

function THw_auditoria_classList.ProcessosNaoPermitidosToStr: string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Self.Count - 1 do
    if Self.Items[I].status <> 'Liberado' then
      Result := Result + IfThen(Result <> '', sLineBreak + '--' + sLineBreak) +
                Format('Processo: %s - %s', [Self.Items[I].cod_processo, Self.Items[I].nome_processo]) + sLineBreak +
                IfThen(Self.Items[I].mensagem <> '', 'Detalhes: ' + Self.Items[I].mensagem + sLineBreak) +
                Format('Status: %s', [IfThen(Self.Items[I].status = '', 'Não cadastrado', Self.Items[I].status)]);

  Result := IfThen(Result <> '', 'Não é possível continuar, existe(m) processo(s) não liberado(s)' + sLineBreak + sLineBreak + Result);
end;

end.
