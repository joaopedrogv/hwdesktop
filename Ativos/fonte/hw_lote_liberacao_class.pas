unit hw_lote_liberacao_class;

interface

uses
  solicitacoes_acesso_class,
{$IFNDEF VER180}
  System.Contnrs,
  hw_auditoria_class,
  tabela_processos_class, System.Generics.Collections;
{$ELSE}
  Contnrs,
  hw_auditoria_class,
  tabela_processos_class;
{$ENDIF}

type
  THw_lote_processos_class = class(TObject)
  private
    Fcod_processo: string;
    Faudit       : THw_auditoria_classList;
    Fprocesso    : TTabela_processos_class;
    Fsolit       : TSolicitacoes_acesso_classList;
    Fcount_lib   : Smallint;
    Fcount_pend  : Smallint;
  public
    constructor Create;
    destructor Destroy; override;

    function Clone: THw_lote_processos_class; virtual;

    property cod_processo: string                         read Fcod_processo write Fcod_processo;
    property count_lib   : Smallint                       read Fcount_lib    write Fcount_lib;
    property count_pend  : Smallint                       read Fcount_pend   write Fcount_pend;
    property audit       : THw_auditoria_classList        read Faudit        write Faudit;
    property solit       : TSolicitacoes_acesso_classList read Fsolit        write Fsolit;
    property processo    : TTabela_processos_class        read Fprocesso     write Fprocesso;
  end;

  THw_lote_processos_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): THw_lote_processos_class;
    procedure SetItem(Index: Integer; const Value: THw_lote_processos_class);
  public
    function New: THw_lote_processos_class;
    procedure popular(Aaudits: {$IFNDEF VER180}TObjectList<THw_auditoria_class>{$ELSE}THw_auditoria_classList{$ENDIF}; Aprocessos: TTabela_processos_classList); overload;
    procedure popular(Asolits: TSolicitacoes_acesso_classList; Aprocessos: TTabela_processos_classList); overload;

    property Items[Index: Integer]: THw_lote_processos_class read GetItem write SetItem;
  end;
  
  THw_lote_liberacao_class = class(TObject)
  private
    Flote     : Integer;
    Fprocessos: THw_lote_processos_classList;
  public
    constructor Create;
    destructor Destroy; override;

    property lote     : Integer                      read Flote      write Flote;
    property processos: THw_lote_processos_classList read Fprocessos write Fprocessos;
  end;

  THw_lote_liberacao_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): THw_lote_liberacao_class;
    procedure SetItem(Index: Integer; const Value: THw_lote_liberacao_class);
  public
    function New: THw_lote_liberacao_class;
    procedure popular(Asolits: TSolicitacoes_acesso_classList; Aprocessos: TTabela_processos_classList); overload;

    property Items[Index: Integer]: THw_lote_liberacao_class read GetItem write SetItem;
  end;

implementation

uses
{$IFNDEF VER180}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ THw_lote_processos_class }

constructor THw_lote_processos_class.Create;
begin
  Faudit    := THw_auditoria_classList.Create;
  Fsolit    := TSolicitacoes_acesso_classList.Create;
//  Fprocesso := TTabela_processos_class.Create;
end;

destructor THw_lote_processos_class.Destroy;
begin
  if Assigned(Faudit) then
    FreeAndNil(Faudit);
  if Assigned(Fsolit) then
    FreeAndNil(Fsolit);
  if Assigned(Fprocesso) then
    FreeAndNil(Fprocesso);
  inherited;
end;

function THw_lote_processos_class.Clone: THw_lote_processos_class;
begin
  Result              := THw_lote_processos_class.Create;
  Result.cod_processo := Self.cod_processo;
end;

{ THw_lote_processos_classList }

function THw_lote_processos_classList.GetItem(Index: Integer): THw_lote_processos_class;
begin
  Result := THw_lote_processos_class(inherited Items[Index]);
end;

function THw_lote_processos_classList.New: THw_lote_processos_class;
begin
  Result := THw_lote_processos_class.Create;
  Add(Result);
end;

procedure THw_lote_processos_classList.popular(
   Aaudits: {$IFNDEF VER180}TObjectList<THw_auditoria_class>{$ELSE}THw_auditoria_classList{$ENDIF};
  Aprocessos: TTabela_processos_classList);
var
  Aitem: THw_lote_processos_class;
  Aproceed: Boolean;
  I, J: Integer;
begin
  Self.Clear;
  for I := 0 to Pred(Aaudits.Count) do
  begin
    Aproceed := True;
    for J := 0 to Pred(Self.Count) do
      if Self.Items[J].cod_processo = Aaudits.Items[I].cod_processo then
      begin
        Aproceed := False;
        Self.Items[J].audit.Add(Aaudits.Items[I].Clone);
        Break;
      end;

    if Aproceed then
    begin
      Aitem := Self.New;
      Aitem.cod_processo := Aaudits.Items[I].cod_processo;
      Aitem.audit.Add(Aaudits.Items[I].Clone);

      for J := 0 to Pred(Aprocessos.Count) do
        if Aprocessos.Items[J].cod_processo = Aitem.cod_processo then
        begin
          Aitem.processo := Aprocessos.Items[J].Clone;
          Break;
        end;

      if not Assigned(Aitem.processo) then
      begin
        Aitem.processo := TTabela_processos_class.Create;
        Aitem.processo.cod_processo  := Aitem.cod_processo;
        Aitem.processo.nome_processo := 'PROCESSO NÃO ENCONTRADO NO CADASTRO';
      end;
    end;
  end;
end;

procedure THw_lote_processos_classList.popular(
  Asolits: TSolicitacoes_acesso_classList;
  Aprocessos: TTabela_processos_classList);
var
  Aitem: THw_lote_processos_class;
  Aproceed: Boolean;
  I, J: Integer;
begin
  Self.Clear;
  for I := 0 to Pred(Asolits.Count) do
  begin
    Aproceed := True;
    for J := 0 to Pred(Self.Count) do
      if Self.Items[J].cod_processo = Asolits.Items[I].processo then
      begin
        Aproceed := False;
        Self.Items[J].solit.Add(Asolits.Items[I].Clone);
        Break;
      end;

    if Aproceed then
    begin
      Aitem := Self.New;
      Aitem.cod_processo := Asolits.Items[I].processo;
      Aitem.solit.Add(Asolits.Items[I].Clone);

      for J := 0 to Pred(Aprocessos.Count) do
        if Aprocessos.Items[J].cod_processo = Aitem.cod_processo then
        begin
          Aitem.processo := Aprocessos.Items[J].Clone;
          Break;
        end;

      if not Assigned(Aitem.processo) then
      begin
        Aitem.processo := TTabela_processos_class.Create;
        Aitem.processo.cod_processo  := Aitem.cod_processo;
        Aitem.processo.nome_processo := 'PROCESSO NÃO ENCONTRADO NO CADASTRO';
      end;
    end;
  end;
  for I := 0 to Pred(Self.Count) do
  begin
    Self.Items[I].count_lib  := 0;
    Self.Items[I].count_pend := 0;

    for J := 0 to Pred(Self.Items[I].solit.Count) do
      if Self.Items[I].solit.Items[J].usuario_gerente = '' then
        Self.Items[I].count_pend := Self.Items[I].count_pend + 1
      else
        Self.Items[I].count_pend := Self.Items[I].count_pend + 1;
  end;
end;

procedure THw_lote_processos_classList.SetItem(Index: Integer; const Value: THw_lote_processos_class);
begin
  Put(Index, Value);
end;

{ THw_lote_liberacao_class }

constructor THw_lote_liberacao_class.Create;
begin
  Fprocessos := THw_lote_processos_classList.Create;
end;

destructor THw_lote_liberacao_class.Destroy;
begin
  if Assigned(Fprocessos) then
    FreeAndNil(Fprocessos);
  inherited;
end;

{ THw_lote_liberacao_classList }

function THw_lote_liberacao_classList.GetItem(Index: Integer): THw_lote_liberacao_class;
begin
  Result := THw_lote_liberacao_class(inherited Items[Index]);
end;

function THw_lote_liberacao_classList.New: THw_lote_liberacao_class;
begin
  Result := THw_lote_liberacao_class.Create;
  Add(Result);
end;

procedure THw_lote_liberacao_classList.popular(
  Asolits: TSolicitacoes_acesso_classList;
  Aprocessos: TTabela_processos_classList);
var
  I, J: Integer;
  Aprocced: Boolean;
  Asols: TSolicitacoes_acesso_classList;
begin
  Asols := TSolicitacoes_acesso_classList.Create;
  try

    for J := 0 to Asolits.Count - 1 do
    begin
      Aprocced := True;
      for I := 0 to Self.Count - 1 do
        if Asolits.Items[J].lote = Self.Items[I].lote then
        begin
          Aprocced := False;
          Break;
        end;

      if Aprocced then
        Self.New.lote := Asolits.Items[J].lote;
    end;

    for I := 0 to Self.Count - 1 do
    begin
      Asols.Clear;
      for J := 0 to Asolits.Count - 1 do
        if Asolits.Items[J].lote = Self.Items[I].lote then
          Asols.Add(Asolits.Items[J].Clone);

      Self.Items[I].processos.popular(Asols, Aprocessos);
    end;

  finally
    if Assigned(Asols) then FreeAndNil(Asols);
  end;
end;

procedure THw_lote_liberacao_classList.SetItem(Index: Integer; const Value: THw_lote_liberacao_class);
begin
  Put(Index, Value);
end;

end.
