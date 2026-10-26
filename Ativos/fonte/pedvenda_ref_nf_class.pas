unit pedvenda_ref_nf_class;

interface

uses
{$IFDEF VER180}
  base_class,
  Contnrs;
{$ELSE}
  base_class,
  System.Contnrs;
{$ENDIF}

type
  TPedvenda_ref_nf_class = class(TBase_class)
  private
    Fnped       : Integer;
    Ftipo       : string;
    Fcod_empresa: Integer;
    Fcod_nf     : Integer;
    procedure Setnped(const Value: Integer);
    procedure Settipo(const Value: string);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_nf(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property nped       : Integer read Fnped        write Setnped;
    property tipo       : string  read Ftipo        write Settipo;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property cod_nf     : Integer read Fcod_nf      write Setcod_nf;
  end;

  TPedvenda_ref_nf_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TPedvenda_ref_nf_class;
    procedure SetItem(Index: Integer; const Value: TPedvenda_ref_nf_class);
  public
    function New: TPedvenda_ref_nf_class;

    property Items[Index: Integer]: TPedvenda_ref_nf_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TPedvenda_ref_nf_class }

constructor TPedvenda_ref_nf_class.Create;
begin
  Ftable := TTable_fb.Create('PEDVENDA_REF_NF',
                             'NPED, TIPO, COD_EMPRESA, COD_NF',
                             'NPED, COD_NF, TIPO, COD_EMPRESA',
                             GetFieldsSql());
end;

destructor TPedvenda_ref_nf_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  inherited;
end;

class function TPedvenda_ref_nf_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@nped, @tipo, @cod_empresa, @cod_nf';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedvenda_ref_nf_class.Setnped(const Value: Integer);
begin
  Fnped := Value;
  ChangeField('NPED', Fnped);
end;

procedure TPedvenda_ref_nf_class.Settipo(const Value: string);
begin
  Ftipo := Value;
  ChangeField('TIPO', strq(Ftipo, 3));
end;

procedure TPedvenda_ref_nf_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TPedvenda_ref_nf_class.Setcod_nf(const Value: Integer);
begin
  Fcod_nf := Value;
  ChangeField('COD_NF', Fcod_nf);
end;

{ TPedvenda_ref_nf_classList }

function TPedvenda_ref_nf_classList.GetItem(Index: Integer): TPedvenda_ref_nf_class;
begin
  Result := TPedvenda_ref_nf_class(inherited Items[Index]);
end;

function TPedvenda_ref_nf_classList.New: TPedvenda_ref_nf_class;
begin
  Result := TPedvenda_ref_nf_class.Create;
  Add(Result);
end;

procedure TPedvenda_ref_nf_classList.SetItem(Index: Integer; const Value: TPedvenda_ref_nf_class);
begin
  Put(Index, Value);
end;

end.
