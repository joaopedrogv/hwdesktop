unit rnv_estoque_class;

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
  TRnv_estoque_class = class(TBaseFb_class)
  private
    Fid                      : Int64;
    Fcod_empresa             : Integer;
    Fchassi                  : string;
    Fcodigosegurancacrv      : string;
    Fdatahoramedicaohodometro: Variant;
    Festado                  : string;
    Fnumerocrv               : string;
    Fplaca                   : string;
    Fquilometragemhodometro  : Variant;
    Frenavam                 : string;
    Ftipocrv                 : string;
    Fidestoqueorigemporcanc  : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id                      : Int64   read Fid                       write Fid;
    property cod_empresa             : Integer read Fcod_empresa              write Fcod_empresa;
    property chassi                  : string  read Fchassi                   write Fchassi;
    property codigosegurancacrv      : string  read Fcodigosegurancacrv       write Fcodigosegurancacrv;
    property datahoramedicaohodometro: Variant read Fdatahoramedicaohodometro write Fdatahoramedicaohodometro;
    property estado                  : string  read Festado                   write Festado;
    property numerocrv               : string  read Fnumerocrv                write Fnumerocrv;
    property placa                   : string  read Fplaca                    write Fplaca;
    property quilometragemhodometro  : Variant read Fquilometragemhodometro   write Fquilometragemhodometro;
    property renavam                 : string  read Frenavam                  write Frenavam;
    property tipocrv                 : string  read Ftipocrv                  write Ftipocrv;
    property idestoqueorigemporcanc  : Variant read Fidestoqueorigemporcanc   write Fidestoqueorigemporcanc;
  end;

  TRnv_estoques_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TRnv_estoque_class;
    procedure SetItem(Index: Integer; const Value: TRnv_estoque_class);
  public
    function New: TRnv_estoque_class;

    property Items[Index: Integer]: TRnv_estoque_class read GetItem write SetItem;
  end;

implementation

{ TRnv_estoque_class }

procedure TRnv_estoque_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('RNV_ESTOQUE');
  with FTable.Fields do
  begin
    AddField('ID'                      , fkInteger , 0 , False, True);
    AddField('COD_EMPRESA'             , fkInteger , 0 , False, True);
    AddField('CHASSI'                  , fkString  , 21             );
    AddField('CODIGOSEGURANCACRV'      , fkString  , 32             );
    AddField('DATAHORAMEDICAOHODOMETRO', fkDateTime                 );
    AddField('ESTADO'                  , fkString  , 12             );
    AddField('NUMEROCRV'               , fkString  , 32             );
    AddField('PLACA'                   , fkString  , 7              );
    AddField('QUILOMETRAGEMHODOMETRO'  , fkInteger                  );
    AddField('RENAVAM'                 , fkString  , 32             );
    AddField('TIPOCRV'                 , fkString  , 8              );
    AddField('IDESTOQUEORIGEMPORCANC'  , fkInteger                  );
  end;
end;

constructor TRnv_estoque_class.Create;
begin
  InitializeObjects;
end;

{ TRnv_estoques_class }

function TRnv_estoques_class.GetItem(Index: Integer): TRnv_estoque_class;
begin
  Result := TRnv_estoque_class(inherited Items[Index]);
end;

function TRnv_estoques_class.New: TRnv_estoque_class;
begin
  Result := TRnv_estoque_class.Create;
  Add(Result);
end;

procedure TRnv_estoques_class.SetItem(Index: Integer; const Value: TRnv_estoque_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TRnv_estoque_class);
finalization
  UnRegisterClass(TRnv_estoque_class);

end.
