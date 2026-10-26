unit rnv_estoque_saida_canc_class;

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
  TRnv_estoque_saida_canc_class = class(TBaseFb_class)
  private
    Fid                         : Int64;
    Fcod_empresa                : Integer;
    Fdhcancsaidaestoque         : Variant;
    Fidestoquegeradocancelamento: Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id                         : Int64   read Fid                          write Fid;
    property cod_empresa                : Integer read Fcod_empresa                 write Fcod_empresa;
    property dhcancsaidaestoque         : Variant read Fdhcancsaidaestoque          write Fdhcancsaidaestoque;
    property idestoquegeradocancelamento: Variant read Fidestoquegeradocancelamento write Fidestoquegeradocancelamento;
  end;

  TRnv_estoque_saida_cancs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TRnv_estoque_saida_canc_class;
    procedure SetItem(Index: Integer; const Value: TRnv_estoque_saida_canc_class);
  public
    function New: TRnv_estoque_saida_canc_class;

    property Items[Index: Integer]: TRnv_estoque_saida_canc_class read GetItem write SetItem;
  end;

implementation

{ TRnv_estoque_saida_canc_class }

procedure TRnv_estoque_saida_canc_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('RNV_ESTOQUE_SAIDA_CANC');
  with FTable.Fields do
  begin
    AddField('ID'                         , fkInteger , 0, False, True, True);
    AddField('COD_EMPRESA'                , fkInteger , 0, False, True, True);
    AddField('DHCANCSAIDAESTOQUE'         , fkDateTime                      );
    AddField('IDESTOQUEGERADOCANCELAMENTO', fkInteger                       );
  end;
end;

constructor TRnv_estoque_saida_canc_class.Create;
begin
  InitializeObjects;
end;

{ TRnv_estoque_saida_cancs_class }

function TRnv_estoque_saida_cancs_class.GetItem(Index: Integer): TRnv_estoque_saida_canc_class;
begin
  Result := TRnv_estoque_saida_canc_class(inherited Items[Index]);
end;

function TRnv_estoque_saida_cancs_class.New: TRnv_estoque_saida_canc_class;
begin
  Result := TRnv_estoque_saida_canc_class.Create;
  Add(Result);
end;

procedure TRnv_estoque_saida_cancs_class.SetItem(Index: Integer; const Value: TRnv_estoque_saida_canc_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TRnv_estoque_saida_canc_class);
finalization
  UnRegisterClass(TRnv_estoque_saida_canc_class);

end.
