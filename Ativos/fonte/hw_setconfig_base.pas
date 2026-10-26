unit hw_setconfig_base;

interface

uses
  config_sistema_class,
  Query_OOP;

type
  TSetConfigBase = class
  private
    FUltimaVersaoApplicada: Double;
    FLastError: string;
  protected
    ConfVersao: TConfig_sistema_class;
    EmpresaId: Integer;
    ChaveConfigVersao: string;
    ValorVersaoDB: Double;
    ConfList: TConfig_sistema_classList;
    QueryCons: TQuery_OOP;

    function New(const Chave, Display: string): TConfig_sistema_class; overload;

//    procedure setConfSisStr(Chave: string; Valor: string; Display: string = ''; Strings: TStrings = nil; ATrim: Boolean = True); overload;
//    procedure setConfSisStr(Chave: string; Valor: string; Display: string = ''; Strings: string = ''; ATrim: Boolean = True); overload;
//    procedure setConfSisInt(Chave: string; Valor: integer; Display: string = ''; Strings: TStrings = nil); overload;
    function New(const Chave, Display: string; const Valor: Integer): TConfig_sistema_class; overload;
    function New(const Chave, Display: string; const Valor: Boolean): TConfig_sistema_class; overload;
//    procedure setConfSisBool(Chave: string; Valor: Boolean; Display: string = ''; Strings: TStrings = nil); overload;
//    procedure setConfSisBool(Chave: string; Valor: Boolean; Display: string = ''; Strings: string = ''); overload;
//    procedure setConfSisFloat(Chave: string; Valor: Double; Display: string = ''; Strings: TStrings = nil); overload;
//    procedure setConfSisFloat(Chave: string; Valor: Double; Display: string = ''; Strings: string = ''); overload;
//    procedure setConfSisBlob(Chave: string; Display: string = ''; Valor: TStrings = nil); overload;
//    procedure setConfSisBlob(Chave: string; Display: string = ''; Valor: string = ''); overload;
//    procedure setConfSisObj(Aconf: TConfig_sistema_class);

    function VersaoBancoMenor(NovaVersao: Double): Boolean; //Checar e star a versao nova

    // Chamar esse metodo ao final para salvar
    procedure ExecuteDone;

  public
    constructor Create(const AChaveConfigVersao: string; const AEmpresaId: Integer; AqueryCons: TQuery_OOP);
    destructor Destroy; override;

    function Execute(): Boolean; virtual; abstract;

    property UltimaVersaoApplicada: Double read FUltimaVersaoApplicada write FUltimaVersaoApplicada;
    property LastError: string read FLastError write FLastError;
  end;


implementation

uses
  SysUtils,
  Math;

{ TSetConfigBase }

constructor TSetConfigBase.Create(const AChaveConfigVersao: string;
  const AEmpresaId: Integer; AqueryCons: TQuery_OOP);
begin
  EmpresaId := AEmpresaId;
  QueryCons := AqueryCons;
  ConfList  := TConfig_sistema_classList.Create;
  ChaveConfigVersao := AChaveConfigVersao;

  ConfVersao := TConfig_sistema_class.getConf(ChaveConfigVersao, QueryCons.query, EmpresaId);

  ValorVersaoDB := ConfVersao.AsFloat;
//  ValorVersaoDB := QueryCons
//    .Table('config_sistema', '*')
//    .Equals('chave', ChaveConfigVersao)
//    .Equals('cod_empresa', EmpresaId)
//    .Scalar().AsFloat;
end;

destructor TSetConfigBase.Destroy;
begin
  ConfList.Clear;
  FreeAndNil(ConfList);

  if Assigned(ConfVersao) then
    FreeAndNil(ConfVersao);

  inherited;
end;

procedure TSetConfigBase.ExecuteDone;
var
  I: Integer;
begin

  try

    try

      for I := 0 to ConfList.Count - 1 do
        ConfList.Items[I].SaveConfDB(QueryCons.query);

      if UltimaVersaoApplicada > ValorVersaoDB then // versao do programa maior que a versao salva no banco
      begin
        QueryCons.SQL('update config_sistema set value1_f = :value1_f')
          .Equals('chave', ChaveConfigVersao)
          .Equals('cod_empresa', EmpresaId)
          .ParamAsFloat('value1_f', UltimaVersaoApplicada)
          .ExecSQL();
      end;

      if QueryCons.query.Transaction.InTransaction then
        QueryCons.query.Transaction.Commit;

    except on E: Exception do
      begin
        if QueryCons.query.Transaction.InTransaction then
          QueryCons.query.Transaction.Rollback;
        raise e;
      end;
    end;

  finally
    QueryCons.query.Close;
  end;
end;

function TSetConfigBase.New(const Chave, Display: string;
  const Valor: Integer): TConfig_sistema_class;
begin
  Result := Self.New(Chave, Display);

  if Result = nil then
    Exit;

  Result.value1_f := Valor;
  Result.type1_   := typeInt;
end;

function TSetConfigBase.New(const Chave,
  Display: string): TConfig_sistema_class;
var
  I: Integer;
begin
  Result := nil;

  if Trim(Chave) = '' then
    Exit;

  for I := 0 to ConfList.Count - 1 do
    if Trim(ConfList.Items[I].chave) = Trim(Chave) then
      Exit;

  if Trim(QueryCons
    .Table('config_sistema', 'chave')
    .Equals('chave', Chave)
    .Equals('cod_empresa', EmpresaId)
    .Scalar().AsString) = Trim(Chave) then
    Exit;

  Result             := ConfList.New;
  Result.cod_empresa := EmpresaId;
  Result.chave       := Chave;
  Result.display_    := Display;
end;

function TSetConfigBase.VersaoBancoMenor(NovaVersao: Double): Boolean;
begin
  //Checar e star a versao nova
  Result := RoundTo(ValorVersaoDB, -3) < RoundTo(NovaVersao, -3);
  if Result then
    FUltimaVersaoApplicada := NovaVersao;
end;

function TSetConfigBase.New(const Chave, Display: string;
  const Valor: Boolean): TConfig_sistema_class;
begin
  Result := Self.New(Chave, Display);

  if Result = nil then
    Exit;

  Result.value1_f := IfThen(Valor, 1);
  Result.type1_   := typeBool;
end;

end.
