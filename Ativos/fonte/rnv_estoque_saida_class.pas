unit rnv_estoque_saida_class;

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
  TRnv_estoque_saida_class = class(TBaseFb_class)
  private
    Fid                          : Int64;
    Fcod_empresa                 : Integer;
    Fchavenotafiscalsaida        : string;
    Fcpfoperadorresponsavel      : string;
    Fdatahora                    : Variant;
    Fdatahoraenvionotafiscalsaida: Variant;
    Fmotivo                      : string;
    Fnumerotermosaidaestoque     : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id                          : Int64   read Fid                           write Fid;
    property cod_empresa                 : Integer read Fcod_empresa                  write Fcod_empresa;
    property chavenotafiscalsaida        : string  read Fchavenotafiscalsaida         write Fchavenotafiscalsaida;
    property cpfoperadorresponsavel      : string  read Fcpfoperadorresponsavel       write Fcpfoperadorresponsavel;
    property datahora                    : Variant read Fdatahora                     write Fdatahora;
    property datahoraenvionotafiscalsaida: Variant read Fdatahoraenvionotafiscalsaida write Fdatahoraenvionotafiscalsaida;
    property motivo                      : string  read Fmotivo                       write Fmotivo;
    property numerotermosaidaestoque     : Variant read Fnumerotermosaidaestoque      write Fnumerotermosaidaestoque;
  end;

  TRnv_estoque_saidas_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TRnv_estoque_saida_class;
    procedure SetItem(Index: Integer; const Value: TRnv_estoque_saida_class);
  public
    function New: TRnv_estoque_saida_class;

    property Items[Index: Integer]: TRnv_estoque_saida_class read GetItem write SetItem;
  end;

implementation

{ TRnv_estoque_saida_class }

procedure TRnv_estoque_saida_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('RNV_ESTOQUE_SAIDA');
  with FTable.Fields do
  begin
    AddField('ID'                          , fkInteger , 0 , False, True, True);
    AddField('COD_EMPRESA'                 , fkInteger , 0 , False, True, True);
    AddField('CHAVENOTAFISCALSAIDA'        , fkString  , 44                   );
    AddField('CPFOPERADORRESPONSAVEL'      , fkString  , 11                   );
    AddField('DATAHORA'                    , fkDateTime                       );
    AddField('DATAHORAENVIONOTAFISCALSAIDA', fkDateTime                       );
    AddField('MOTIVO'                      , fkString  , 64                   );
    AddField('NUMEROTERMOSAIDAESTOQUE'     , fkInteger                        );
  end;
end;

constructor TRnv_estoque_saida_class.Create;
begin
  InitializeObjects;
end;

{ TRnv_estoque_saidas_class }

function TRnv_estoque_saidas_class.GetItem(Index: Integer): TRnv_estoque_saida_class;
begin
  Result := TRnv_estoque_saida_class(inherited Items[Index]);
end;

function TRnv_estoque_saidas_class.New: TRnv_estoque_saida_class;
begin
  Result := TRnv_estoque_saida_class.Create;
  Add(Result);
end;

procedure TRnv_estoque_saidas_class.SetItem(Index: Integer; const Value: TRnv_estoque_saida_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TRnv_estoque_saida_class);
finalization
  UnRegisterClass(TRnv_estoque_saida_class);

end.
