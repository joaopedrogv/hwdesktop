unit leitura_balanca_peso;

interface

uses
  Classes, config_sistema_class;

type
  // Legenda para a mascara = C: codigo; 0: nao significativo; T: Total; P ou Q: Quantidade ou Peso
  // Outras mascaras
  //2CCCC0TTTTTTDV
  //2CCCC00PPPPPDV
  //2CCCC00QQQQQDV
  //2CCCCCTTTTTTDV
  //2CCCCC0PPPPPDV
  //2CCCCCCPPPPPDV
  TLeituraPesoBalanca_Conf = class
  private
    Fmascara: string;
    FativoNoPAF: Boolean;
    FdigitosPesoOuValor: Smallint;
    FPesquisarNoCodProd: Boolean;
  public                                                                                     
    property mascara: string read Fmascara write Fmascara; // padrao 2CCCC00TTTTTDV
    property digitosPesoOuValor: Smallint read FdigitosPesoOuValor write FdigitosPesoOuValor;
    property pesquisarNoCodProd: Boolean  read FPesquisarNoCodProd write FPesquisarNoCodProd;
    property ativoNoPAF: Boolean read FativoNoPAF write FativoNoPAF;
  end;

  TLeituraPesoBalanca_valores = class
  private
    Fpeso: Double;
    Fpreco: Double;
    Fcodigo: string;
    Fmsg: string;
  public
    property codigo: string read Fcodigo write Fcodigo;
    property peso: Double read Fpeso write Fpeso;
    property preco: Double read Fpreco write Fpreco;
    property msg: string read Fmsg write Fmsg;
  end;

  TLeituraPesoBalanca = class
  private
    Fconf: TLeituraPesoBalanca_Conf;
    Fvals: TLeituraPesoBalanca_valores;
  public
    constructor Create(Aconf: TConfig_sistema_class);
    destructor Destroy; override;

    procedure SetConf(Aconf: TConfig_sistema_class);
    procedure resetVals;
    function leitura_executar(AEAN13: string): TLeituraPesoBalanca;


    property conf: TLeituraPesoBalanca_Conf read Fconf write Fconf;
    property vals: TLeituraPesoBalanca_valores read Fvals write Fvals;


  end;


implementation

uses
  StrUtils, SysUtils, Math;

{ TLeituraPesoBalanca }

constructor TLeituraPesoBalanca.Create(Aconf: TConfig_sistema_class);
begin
  Fconf := TLeituraPesoBalanca_Conf.Create;
  Fvals := TLeituraPesoBalanca_valores.Create;
  if Assigned(Aconf) then  
    SetConf(Aconf);
end;

destructor TLeituraPesoBalanca.Destroy;
begin
  FreeAndNil(Fconf);
  FreeAndNil(Fvals);
  inherited;
end;

function TLeituraPesoBalanca.leitura_executar(
  AEAN13: string): TLeituraPesoBalanca;
var
  Acount: Integer;
  I: Integer;
  Atipo, Astr: string;
  //2CCCC00TTTTTDV
  //2CCCC00PPPPPDV
begin
  Result := Self;
  Fvals.msg := 'VALIDO';
  Fvals.peso := 0;
  Fvals.preco := 0;

  AEAN13 := Trim(AEAN13);
  if (Length(AEAN13) <> 13) or (AEAN13[1] <> '2') then
  begin
    Fvals.msg := 'INVALIDO';
    Exit;
  end;

  try
    Acount := 0;
    for I := 1 to Length(Fconf.mascara) do if Fconf.mascara[I] = 'C' then Inc(Acount);

    Fvals.codigo := Copy(AEAN13, Pos('C', Fconf.mascara), Acount);

    Atipo := IfThen(Pos('P', Fconf.mascara) > 0, 'P', 'T');
    // Exemplo de conversão aplicada
    // 01325 = | Count - dig(2) | 5-2 = 3 |  013,25
    //001325 = | Count - dig(3) | 6-3 = 3 | 001,325

    Acount := 0;
    for I := 1 to Length(Fconf.mascara) do if Fconf.mascara[I] = Atipo then Inc(Acount);

    Astr        := Copy(AEAN13, Pos(Atipo, Fconf.mascara), Acount) + '00';
    Insert(',', Astr, Acount - Fconf.digitosPesoOuValor + 1);
    Fvals.peso  := IfThen(Atipo = 'P', StrToFloat(Astr));
    Fvals.preco := IfThen(Atipo = 'T', StrToFloat(Astr));

    if (Fvals.codigo = '') or ((Fvals.preco = 0) and (Fvals.peso= 0)) then
      Fvals.msg := 'INVALIDO';

  except on E: Exception do
    begin
      Fvals.msg := 'Erro ao ler codigo EAN, erro: ' + e.Message;
    end;
  end;
end;

procedure TLeituraPesoBalanca.resetVals;
begin
  Fvals.peso   := 0;
  Fvals.preco  := 0;
  Fvals.codigo := '';
  Fvals.msg    := '';
end;

procedure TLeituraPesoBalanca.SetConf(Aconf: TConfig_sistema_class);
begin
  Fconf.mascara            := Aconf.ReadString( 'Conf', 'Mascara'           , '2CCCCC0TTTTTDV');
  Fconf.digitosPesoOuValor := Aconf.ReadInteger('Conf', 'DigitosPesoOuValor', 2);
  Fconf.pesquisarNoCodProd := Aconf.ReadString( 'Conf', 'PesquisarNoCodProd', 'N') = 'S';
  Fconf.ativoNoPAF         := Aconf.ReadString( 'Conf', 'AtivarNoPAFECF'    , 'N') = 'S';
  Fconf.mascara            := UpperCase(StringReplace(Fconf.mascara, 'Q', 'P', [rfIgnoreCase, rfIgnoreCase]));
end;

end.
