{******************************************************************************}
{ Projeto: REST HW                                                             }
{  Biblioteca para ser usada em maior parte para consumir a api da HW Sistemas }
{ outras apis também são podem ser consumidas utilizando esta biblioteca       }
{                                                                              }
{ Direitos Autorais Reservados (c) 2017   Hw Sistemas e Computadores           }
{                                                                              }
{ Autor: João Pedro Rodrigues Costa                                            }
{                                                                              }
{            HW Sistemas e Computadores Ltda - www.hwsistemas.com.br           }
{    Rua Mogno, 236, Santo Agostinho - Governador Valadares - MG - 35.065-019  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 23/02/2017: João Pedro
|*  - Criação e distribuição da Primeira Versao
*******************************************************************************}

unit HW.Utils.Classes.IBPT;

interface

uses
  uClasseConexao, Windows, System.SysUtils, HW.Utils.Classes.Registros_DX;

type
  THW_IBPT_Produto = class
  private
    Fcnpj: string;
    Fuf: string;
    Fncm: string;
    Fex: Integer;
    procedure Setcnpj(const Value: string);
    procedure Setex(const Value: Integer);
    procedure Setncm(const Value: string);
    procedure Setuf(const Value: string);
  public
    property cnpj: string read Fcnpj write Setcnpj;
    property ncm: string read Fncm write Setncm;
    property uf: string read Fuf write Setuf;
    property ex: Integer read Fex write Setex;
  end;

  THW_IBPT = class(TConexao)
  private
    FProduto: THW_IBPT_Produto;
    FCodEmpresa: Integer;
    FDataBaseName: string;
    FPassWord: string;
    FUserName: string;
    procedure SetCodEmpresa(const Value: Integer);
    procedure SetDataBaseName(const Value: string);
    procedure SetPassWord(const Value: string);
    procedure SetProduto(const Value: THW_IBPT_Produto);
    procedure SetUserName(const Value: string);

    function ConsumirApiIBPTporNCM: TIBPTProdutoNCM;
  public
    destructor Destroy; override;
    constructor create;

    function ConsultaIBPTporNCM: Boolean;
    //metodo para consutar no web service, e se for o caso gravar
    //olhar la a questado da estatistica da empresa fisica

    property DataBaseName: string read FDataBaseName write SetDataBaseName;
    property UserName: string read FUserName write SetUserName;
    property PassWord: string read FPassWord write SetPassWord;
    property CodEmpresa: Integer read FCodEmpresa write SetCodEmpresa;

    property Produto: THW_IBPT_Produto read FProduto write SetProduto;
  end;

implementation

{ THW_IBPT_Produto }

uses
  HW.Utils.Classes.Rest_DX,
  REST.Types,
  HW.Utils.Classes.Funcoes_DX,
  System.DateUtils, HW.Utils.Classes.Rtti, Data.DB;

procedure THW_IBPT_Produto.Setcnpj(const Value: string);
begin
  Fcnpj := Value;
end;

procedure THW_IBPT_Produto.Setex(const Value: Integer);
begin
  Fex := Value;
end;

procedure THW_IBPT_Produto.Setncm(const Value: string);
begin
  Fncm := Value.PadLeft(8, '0');
end;

procedure THW_IBPT_Produto.Setuf(const Value: string);
begin
  Fuf := Value;
end;

{ THW_IBPT }

function THW_IBPT.ConsultaIBPTporNCM: Boolean;
var
  apiRespIBPT, localRespIBPT: TIBPTProdutoNCM;
  //localIBPT: TArray<TIBPTProdutoNCM>;
  DataHoraAtual, DataVigenIni, DataConsulta: TDateTime;
begin

  Result := False;
// aqui nao precisa pois a api consumida é da do ibpt
//  if THwUtilsClass.ComputadorDaRedeHwSistemas then
//    Exit;
  try
    if (FDataBaseName <> '') and (FUserName <> '') and (FPassWord <> '') then
    begin
      Banco.DataBaseName := FDataBaseName;
      Banco.Params.Clear;
      Banco.Params.Add('user_name=' + FUserName);
      Banco.Params.Add('password=' + FPassWord);

      if not conectar then
        Exit;
    end
    else if not conectar(False) then
      Exit;

    try

      QrAux.Close;
      QrAux.SQL.Text := 'select current_ts as datahora from sp_current_ts';
      QrAux.Open;

      DataHoraAtual := QrAux.FieldByName('datahora').AsDateTime;

      QrAux.Close;
      QrAux.SQL.Text := THwRttiConverter.ClassToSqlSelect(TIBPTProdutoNCM, [], ['codigo', 'uf', 'ex']);
      QrAux.ParamByName('codigo').AsString := Produto.ncm;
      QrAux.ParamByName('uf').AsString := Produto.uf;
      QrAux.ParamByName('ex').AsInteger := Produto.ex;
      QrAux.Open;

      localRespIBPT := nil;
      if (not QrAux.IsEmpty) then
        localRespIBPT := THwDbConverter.DataSetRowToObject<TIBPTProdutoNCM>(QrAux);
        //localIBPT := TIBPTProdutoNCM.DataSetToObject<TIBPTProdutoNCM>(QrAux);

      if Assigned(localRespIBPT) then
      begin
        DataVigenIni := StrToDateTime(localRespIBPT.VigenciaFim, THwUtilsClass.GetFormatSettings());
        DataConsulta := localRespIBPT.dataconsulta;
        if DateOf(DataConsulta) = DateOf(DataHoraAtual) then
          Exit;

        if DateOf(DataVigenIni) >= DateOf(DataHoraAtual) then
          Exit;
      end;

      apiRespIBPT := ConsumirApiIBPTporNCM;

      if not Assigned(apiRespIBPT) then
        Exit;

      if Assigned(localRespIBPT) then
        if apiRespIBPT.Codigo <> localRespIBPT.Codigo then
          Exit;

      apiRespIBPT.dataconsulta := DataHoraAtual;

      QrAux.Close;
      QrAux.SQL.Text := THwRttiConverter.ClassToSqlUpdateOrInsert( apiRespIBPT.ClassType, []);

      apiRespIBPT.SetObjectToDataSetParams(QrAux.Params);

      QrAux.ExecSQL;

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

    except
      on E: Exception do
      begin
        Result := False;
        registraErro(E.Message);
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Rollback;
      end;
    end;

  finally
    desconectar;
  end;
end;

function THW_IBPT.ConsumirApiIBPTporNCM: TIBPTProdutoNCM;
var
  rest: TRestHW;
  respIBPT: TIBPTProdutoNCM;
begin
  Result := nil;
  try
    try
      {
      rest := TRestHW.create('http://iws.ibpt.org.br/api/', 'Produtos');

      rest.AddParametro('token', 'i40mysF2j-tW_FEqxsVLRTyua_qUKopG7mivofAaOdx5F1M7XYJ8OgF06xnAJ1NK', pkGETorPOST, [] );
      rest.AddParametro('cnpj', Produto.cnpj, pkGETorPOST, [] );
      rest.AddParametro('codigo', Produto.ncm, pkGETorPOST, [] );
      rest.AddParametro('uf', Produto.uf, pkGETorPOST, [] );
      rest.AddParametro('ex', IntToStr(Produto.ex), pkGETorPOST, [] );
      }
      rest := TRestHW.create('https://apidoni.ibpt.org.br/api/v1/', 'produtos');

      rest.AddParametro('token', 'i40mysF2j-tW_FEqxsVLRTyua_qUKopG7mivofAaOdx5F1M7XYJ8OgF06xnAJ1NK', pkGETorPOST, [] );
      rest.AddParametro('cnpj', Produto.cnpj, pkGETorPOST, [] );
      rest.AddParametro('codigo', Produto.ncm, pkGETorPOST, [] );
      rest.AddParametro('uf', Produto.uf, pkGETorPOST, [] );
      rest.AddParametro('ex', IntToStr(Produto.ex), pkGETorPOST, [] );
      rest.AddParametro('codigoInterno', '', pkGETorPOST, [] );
      rest.AddParametro('descricao', '', pkGETorPOST, [] );
      rest.AddParametro('unidadeMedida', '', pkGETorPOST, [] );
      rest.AddParametro('valor', '0', pkGETorPOST, [] );
      rest.AddParametro('gtin', '', pkGETorPOST, [] );
      rest.ExecutarGET();

      if rest.restResponse.StatusCode = 200 then
      begin
        respIBPT := TIBPTProdutoNCM.FromJsonString(rest.restResponse.JSONValue.ToJSON);

        respIBPT.Codigo := respIBPT.Codigo.PadLeft(8, '0');

        if (respIBPT.Codigo = '00000000') and
           (respIBPT.UF = '') and
           (respIBPT.Descricao = '') then
        begin
          respIBPT.Codigo := Produto.ncm;
          respIBPT.UF := Produto.uf;
          respIBPT.EX := Produto.ex;
          respIBPT.Descricao := 'Ncm não encontrado na api';
          respIBPT.VigenciaInicio := FormatDateTime('dd/mm/yyyy', Date);
          respIBPT.VigenciaFim    := FormatDateTime('dd/mm/yyyy', Date + 1);
        end;

        if respIBPT.Codigo <> Produto.ncm then
          raise Exception.Create('NCM Resposta difere do pedido. Pedido: ' + Produto.ncm + ' Resposta: ' + respIBPT.Codigo);

        Result := respIBPT;

      end
      else
        raise Exception.Create(rest.GetLastError);
    except
      on E: Exception do
      begin
        registraErro(E.Message);
      end;
    end;
  finally
    FreeAndNil(rest);
  end;
end;

constructor THW_IBPT.create;
begin
  inherited;
  FProduto := THW_IBPT_Produto.Create;
end;

destructor THW_IBPT.Destroy;
begin
  FreeAndNil(FProduto);
  inherited;
end;

procedure THW_IBPT.SetCodEmpresa(const Value: Integer);
begin
  FCodEmpresa := Value;
end;

procedure THW_IBPT.SetDataBaseName(const Value: string);
begin
  FDataBaseName := Value;
end;

procedure THW_IBPT.SetPassWord(const Value: string);
begin
  FPassWord := Value;
end;

procedure THW_IBPT.SetProduto(const Value: THW_IBPT_Produto);
begin
  FProduto := Value;
end;

procedure THW_IBPT.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

end.
