unit hw_processo_class;

interface

uses
  Contnrs;

type
  THw_processo_class = class(TObject)
  private
    Fprocesso: string;
    Facao    : string;
    Fmensagem: string;
    Ftabela  : string;
    Fcodigo  : string;
    Fgravar  : Boolean;
  public
    property processo: string  read Fprocesso write Fprocesso;
    property acao    : string  read Facao     write Facao;
    property mensagem: string  read Fmensagem write Fmensagem;
    property tabela  : string  read Ftabela   write Ftabela;
    property codigo  : string  read Fcodigo   write Fcodigo;
    property gravar  : Boolean read Fgravar   write Fgravar;
  end;

  THw_processo_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): THw_processo_class;
    procedure SetItem(Index: Integer; const Value: THw_processo_class);
  public
    function New: THw_processo_class;

    property Items[Index: Integer]: THw_processo_class read GetItem write SetItem;
  end;

implementation

{ THw_processo_classList }

function THw_processo_classList.GetItem(Index: Integer): THw_processo_class;
begin
  Result := THw_processo_class(inherited Items[Index]);
end;

function THw_processo_classList.New: THw_processo_class;
begin
  Result := THw_processo_class.Create;
  Add(Result);
end;

procedure THw_processo_classList.SetItem(Index: Integer; const Value: THw_processo_class);
begin
  Put(Index, Value);
end;

end.
