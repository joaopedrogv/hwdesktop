unit notafiscal_guiatransito_class;

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
  TNotafiscal_guiatransito_class = class(TBaseFb_class)
  private
    Fcod_nf     : Integer;
    Fcod_empresa: Integer;
    Ftpguia     : Integer;
    Fufguia     : string;
    Fserieguia  : string;
    Fnguia      : Integer;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_nf     : Integer read Fcod_nf      write Fcod_nf;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property tpguia     : Integer read Ftpguia      write Ftpguia;
    property ufguia     : string  read Fufguia      write Fufguia;
    property serieguia  : string  read Fserieguia   write Fserieguia;
    property nguia      : Integer read Fnguia       write Fnguia;
  end;

  TNotafiscal_guiatransitos_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TNotafiscal_guiatransito_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_guiatransito_class);
  public
    function New: TNotafiscal_guiatransito_class;

    property Items[Index: Integer]: TNotafiscal_guiatransito_class read GetItem write SetItem;
  end;

implementation

{ TNotafiscal_guiatransito_class }

procedure TNotafiscal_guiatransito_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('NOTAFISCAL_GUIATRANSITO');
  with FTable.Fields do
  begin
    AddField('COD_NF'     , fkInteger, 0, False, True, True);
    AddField('COD_EMPRESA', fkInteger, 0, False, True, True);
    AddField('TPGUIA'     , fkInteger, 0, False            );
    AddField('UFGUIA'     , fkString , 2, False            );
    AddField('SERIEGUIA'  , fkString , 9                   );
    AddField('NGUIA'      , fkInteger, 0, False            );
  end;
end;

constructor TNotafiscal_guiatransito_class.Create;
begin
  InitializeObjects;
end;

{ TNotafiscal_guiatransitos_class }

function TNotafiscal_guiatransitos_class.GetItem(Index: Integer): TNotafiscal_guiatransito_class;
begin
  Result := TNotafiscal_guiatransito_class(inherited Items[Index]);
end;

function TNotafiscal_guiatransitos_class.New: TNotafiscal_guiatransito_class;
begin
  Result := TNotafiscal_guiatransito_class.Create;
  Add(Result);
end;

procedure TNotafiscal_guiatransitos_class.SetItem(Index: Integer; const Value: TNotafiscal_guiatransito_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TNotafiscal_guiatransito_class);
finalization
  UnRegisterClass(TNotafiscal_guiatransito_class);

end.
