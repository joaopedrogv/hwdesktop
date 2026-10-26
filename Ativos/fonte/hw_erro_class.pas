unit hw_erro_class;

interface

uses
  Contnrs,
  Classes;

type
  THw_erro_class     = class;
  THw_erro_classList = class;

  THw_erro_class = class(TObject)
  private
    FOwnerSinc: THw_erro_class;
    Ferro     : string;
    Fdetalhe  : string;
    Fdatahora: TDateTime;
    procedure Setdetalhe(const Value: string);
    procedure Seterro(const Value: string);
  public
    constructor Create; overload;
    constructor Create(AOwnerSinc: THw_erro_class); overload;

    function Clone: THw_erro_class;
    function detalhe_fmt(Adetalhe: string; Args: array of const): THw_erro_class;

    property erro   : string  read Ferro    write Seterro;
    property detalhe: string  read Fdetalhe write Setdetalhe;
    property datahora: TDateTime read Fdatahora write Fdatahora;
  end;

  THw_erro_classList = class(TObjectList)
  private
    FOwnerSinc    : THw_erro_classList;
    Fidentificador: string;
    FPrintDate: Boolean;

    function GetItem(Index: Integer): THw_erro_class;
    procedure SetItem(Index: Integer; const Value: THw_erro_class);
  public
    constructor Create(AOwnerSinc: THw_erro_classList); overload;

    procedure Clear; override;

    function New(Aerro: string = ''): THw_erro_class; overload;
    function New(Aerro: string; Args: array of const): THw_erro_class; overload;

    function formato_string(Aqtde_linhas: Integer = 0): string;
    function formato_TStrings: TStrings;

    property Items[Index: Integer]: THw_erro_class read GetItem write SetItem;
    property identificador: string read Fidentificador write Fidentificador;
    property PrintDate: Boolean read FPrintDate write FPrintDate;
  end;

implementation

uses
  SysUtils,
  StrUtils;

{ THw_erro_classList }

procedure THw_erro_classList.Clear;
begin
  Fidentificador := '';
  inherited;
end;

constructor THw_erro_classList.Create(AOwnerSinc: THw_erro_classList);
begin
  inherited Create;
  FOwnerSinc := AOwnerSinc;
end;

function THw_erro_classList.formato_string(Aqtde_linhas: Integer): string;
var
  I: Integer;
  Alist: TStrings;
  Atext: string;
begin
  Result := '';
  try
    Alist := TStringList.Create;
    for I := 0 to Pred(Self.Count) do with Self.Items[I] do
    begin
      Atext := IfThen(FPrintDate, FormatDateTime('DD/MM/YYYY hh:mm:ss', datahora) + ' ') + Format('Mensagem: %s', [erro]) + '!@#';
      if detalhe <> '' then
        Atext := Atext + StringReplace(detalhe, sLineBreak, '!@#', [rfReplaceAll]) + '!@#';
      if I < Pred(Self.Count) then
        Atext := Atext + '!@#';

      while Atext <> '' do
      begin
        Alist.Add(Copy(Atext, 1, Pos('!@#', Atext) - 1));
        Atext := Copy(Atext, Pos('!@#', Atext) + 3, Length(Atext));
      end;
    end;

    for I := 0 to Pred(Alist.Count) do
      if (Succ(I) > Aqtde_linhas) and (Aqtde_linhas > 0) then
      begin
        Result := Result + sLineBreak + 'mais...';
        Break;
      end
      else
        Result := Result + Alist[I] + sLineBreak;
  finally
    FreeAndNil(Alist);
  end;
end;

function THw_erro_classList.formato_TStrings: TStrings;
begin
  Result := TStringList.Create;
  Result.Text := formato_string;
end;

function THw_erro_classList.GetItem(Index: Integer): THw_erro_class;
begin
  Result := THw_erro_class(inherited Items[Index]);
end;

function THw_erro_classList.New(Aerro: string): THw_erro_class;
var
  I: Integer;
begin
  if Fidentificador <> '' then
    Aerro := Format('[%s] %s', [Fidentificador, Aerro]);

  for I := 0 to Self.Count - 1 do
    if Self.Items[I].erro = Aerro then
    begin
      Result := Self.Items[I];
      Exit;
    end;    
    
  if Assigned(FOwnerSinc) then
  begin
    Result := THw_erro_class.Create(FOwnerSinc.New())
  end
  else
    Result := THw_erro_class.Create;
  Result.erro := Aerro;
  Add(Result);
end;

function THw_erro_classList.New(Aerro: string;
  Args: array of const): THw_erro_class;
begin
  Result := New(Format(Aerro, Args));
end;

procedure THw_erro_classList.SetItem(Index: Integer; const Value: THw_erro_class);
begin
  Put(Index, Value);
end;

{ THw_erro_class }

function THw_erro_class.Clone: THw_erro_class;
begin
  Result          := THw_erro_class.Create;
  Result.erro     := Self.erro;
  Result.detalhe  := Self.detalhe;
  Result.datahora := Self.datahora;
end;

constructor THw_erro_class.Create(AOwnerSinc: THw_erro_class);
begin
  inherited Create;
  FOwnerSinc := AOwnerSinc;
end;

procedure THw_erro_class.Setdetalhe(const Value: string);
begin
  Fdetalhe := Value;
  if Assigned(FOwnerSinc) then FOwnerSinc.detalhe := Value;  
end;

constructor THw_erro_class.Create;
begin
  Fdatahora := Now;
end;

function THw_erro_class.detalhe_fmt(Adetalhe: string;
  Args: array of const): THw_erro_class;
begin
  detalhe := Format(Adetalhe, Args);
  Result := Self;
end;

procedure THw_erro_class.Seterro(const Value: string);
begin
  Ferro := Value;
  if Assigned(FOwnerSinc) then FOwnerSinc.erro := Value;
end;

end.
