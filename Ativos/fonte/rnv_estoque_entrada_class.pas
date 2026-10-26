unit rnv_estoque_entrada_class;

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
  TRnv_estoque_entrada_class = class(TBaseFb_class)
  private
    Fid                            : Int64;
    Fcod_empresa                   : Integer;
    Fchavenotafiscalentrada        : string;
    Fcpfoperadorresponsavel        : string;
    Fdatahora                      : Variant;
    Fdatahoraenvionotafiscalentrada: Variant;
    Fnumerotermoentradaestoque     : Variant;
    Fvend_numerodocumento          : string;
    Fvend_tipodocumento            : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id                            : Int64   read Fid                             write Fid;
    property cod_empresa                   : Integer read Fcod_empresa                    write Fcod_empresa;
    property chavenotafiscalentrada        : string  read Fchavenotafiscalentrada         write Fchavenotafiscalentrada;
    property cpfoperadorresponsavel        : string  read Fcpfoperadorresponsavel         write Fcpfoperadorresponsavel;
    property datahora                      : Variant read Fdatahora                       write Fdatahora;
    property datahoraenvionotafiscalentrada: Variant read Fdatahoraenvionotafiscalentrada write Fdatahoraenvionotafiscalentrada;
    property numerotermoentradaestoque     : Variant read Fnumerotermoentradaestoque      write Fnumerotermoentradaestoque;
    property vend_numerodocumento          : string  read Fvend_numerodocumento           write Fvend_numerodocumento;
    property vend_tipodocumento            : string  read Fvend_tipodocumento             write Fvend_tipodocumento;
  end;

  TRnv_estoque_entradas_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TRnv_estoque_entrada_class;
    procedure SetItem(Index: Integer; const Value: TRnv_estoque_entrada_class);
  public
    function New: TRnv_estoque_entrada_class;

    property Items[Index: Integer]: TRnv_estoque_entrada_class read GetItem write SetItem;
  end;

implementation

{ TRnv_estoque_entrada_class }

procedure TRnv_estoque_entrada_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('RNV_ESTOQUE_ENTRADA');
  with FTable.Fields do
  begin
    AddField('ID'                            , fkInteger , 0 , False, True, True);
    AddField('COD_EMPRESA'                   , fkInteger , 0 , False, True, True);
    AddField('CHAVENOTAFISCALENTRADA'        , fkString  , 44                   );
    AddField('CPFOPERADORRESPONSAVEL'        , fkString  , 11                   );
    AddField('DATAHORA'                      , fkDateTime                       );
    AddField('DATAHORAENVIONOTAFISCALENTRADA', fkDateTime                       );
    AddField('NUMEROTERMOENTRADAESTOQUE'     , fkInteger                        );
    AddField('VEND_NUMERODOCUMENTO'          , fkString  , 11                   );
    AddField('VEND_TIPODOCUMENTO'            , fkString  , 4                    );
  end;
end;

constructor TRnv_estoque_entrada_class.Create;
begin
  InitializeObjects;
end;

{ TRnv_estoque_entradas_class }

function TRnv_estoque_entradas_class.GetItem(Index: Integer): TRnv_estoque_entrada_class;
begin
  Result := TRnv_estoque_entrada_class(inherited Items[Index]);
end;

function TRnv_estoque_entradas_class.New: TRnv_estoque_entrada_class;
begin
  Result := TRnv_estoque_entrada_class.Create;
  Add(Result);
end;

procedure TRnv_estoque_entradas_class.SetItem(Index: Integer; const Value: TRnv_estoque_entrada_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TRnv_estoque_entrada_class);
finalization
  UnRegisterClass(TRnv_estoque_entrada_class);

end.
