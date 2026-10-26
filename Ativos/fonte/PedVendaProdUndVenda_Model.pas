unit PedVendaProdUndVenda_Model;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  PedVendaProd_Model,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  PedVendaProd_Model,
  System.Variants;
{$ENDIF}

type
  TPedVendaProdUndVenda_Model = class(TPedVendaProd_Model)
  private
    Fqcom      : Double;
    Fvuncom    : Double;
    Fvprod     : Double;
    Fucom      : string;
    Fuvnd      : string;
    Fuvnd_fator: Double;
    Fqvnd      : Double;
    Fvvnd      : Double;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;

    class function GetFieldsSql(Aalias: string = ''): string; override;

  published
    property qcom      : Double read Fqcom       write Fqcom;
    property vuncom    : Double read Fvuncom     write Fvuncom;
    property vprod     : Double read Fvprod      write Fvprod;
    property ucom      : string read Fucom       write Fucom;
    property uvnd      : string read Fuvnd       write Fuvnd;
    property uvnd_fator: Double read Fuvnd_fator write Fuvnd_fator;
    property qvnd      : Double read Fqvnd       write Fqvnd;
    property vvnd      : Double read Fvvnd       write Fvvnd;
  end;

  TPedVendaProdUndVendas_Model = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TPedVendaProdUndVenda_Model;
    procedure SetItem(Index: Integer; const Value: TPedVendaProdUndVenda_Model);
  public
    function New: TPedVendaProdUndVenda_Model;

    property Items[Index: Integer]: TPedVendaProdUndVenda_Model read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TPedVendaProdUndVenda_Model }

procedure TPedVendaProdUndVenda_Model.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
end;

constructor TPedVendaProdUndVenda_Model.Create;
begin
  InitializeObjects;
end;

class function TPedVendaProdUndVenda_Model.GetFieldsSql(Aalias: string): string;
begin
  Result := '@qcom, @vuncom, @vprod, @ucom, @uvnd, @uvnd_fator, @qvnd, @vvnd';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := TPedVendaProd_Model.GetFieldsSql(Aalias) + ', ' + StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

{ TPedVendaProdUndVendas_Model }

function TPedVendaProdUndVendas_Model.GetItem(Index: Integer): TPedVendaProdUndVenda_Model;
begin
  Result := TPedVendaProdUndVenda_Model(inherited Items[Index]);
end;

function TPedVendaProdUndVendas_Model.New: TPedVendaProdUndVenda_Model;
begin
  Result := TPedVendaProdUndVenda_Model.Create;
  Add(Result);
end;

procedure TPedVendaProdUndVendas_Model.SetItem(Index: Integer; const Value: TPedVendaProdUndVenda_Model);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TPedVendaProdUndVenda_Model);
finalization
  UnRegisterClass(TPedVendaProdUndVenda_Model);

end.
