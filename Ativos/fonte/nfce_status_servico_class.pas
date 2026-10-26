unit nfce_status_servico_class;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type
  TNfce_status_servico_class = class(TBaseFb_class)
  private
    Fid         : Integer;
    Fcod_empresa: Integer;
    Fcod_emissor: Integer;
    Fservico    : string;
    Fmensagem   : string;
    Fdatahora   : Variant;
    Fstatus     : Integer;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id         : Integer read Fid          write Fid;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_emissor: Integer read Fcod_emissor write Fcod_emissor;
    property servico    : string  read Fservico     write Fservico;
    property mensagem   : string  read Fmensagem    write Fmensagem;
    property datahora   : Variant read Fdatahora    write Fdatahora;
    property status     : Integer read Fstatus      write Fstatus;
  end;

  TNfce_status_servicos_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TNfce_status_servico_class;
    procedure SetItem(Index: Integer; const Value: TNfce_status_servico_class);
  public
    function New: TNfce_status_servico_class;

    property Items[Index: Integer]: TNfce_status_servico_class read GetItem write SetItem;
  end;

implementation

{ TNfce_status_servico_class }

procedure TNfce_status_servico_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('NFCE_STATUS_SERVICO');
  with FTable.Fields do
  begin
    AddField('ID'         , fkInteger , 0  , False, True);
    AddField('COD_EMPRESA', fkInteger , 0  , False      );
    AddField('COD_EMISSOR', fkInteger , 0  , False      );
    AddField('SERVICO'    , fkString  , 64              );
    AddField('MENSAGEM'   , fkString  , 256             );
    AddField('DATAHORA'   , fkDateTime                  );
    AddField('STATUS'     , fkInteger , 0  , False      );
  end;
end;

constructor TNfce_status_servico_class.Create;
begin
  InitializeObjects;
end;

{ TNfce_status_servicos_class }

function TNfce_status_servicos_class.GetItem(Index: Integer): TNfce_status_servico_class;
begin
  Result := TNfce_status_servico_class(inherited Items[Index]);
end;

function TNfce_status_servicos_class.New: TNfce_status_servico_class;
begin
  Result := TNfce_status_servico_class.Create;
  Add(Result);
end;

procedure TNfce_status_servicos_class.SetItem(Index: Integer; const Value: TNfce_status_servico_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TNfce_status_servico_class);
finalization
  UnRegisterClass(TNfce_status_servico_class);

end.
