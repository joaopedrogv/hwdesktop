unit uDataSetEntrada;

interface

uses
  DBClient, StdCtrls, SysUtils, Classes, Controls;

type
  // Clsse TDataSet_Fiscal, implementação de metodos e eventos na classe.
  TDataSet_Entrada = class(TObject)
  private
    FDataSet: TClientDataSet;
    function GetIndexFieldNames: string;
    procedure SetIndexFieldNames(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    function Active: Boolean;
    function Apply: Boolean; virtual;
    function Cancel: Boolean; virtual;
    function CancelUpdates: Boolean; virtual;
    function Close: Boolean; virtual;
    function Refresh: Boolean; virtual;
    function Delete: Boolean; virtual;
    function Edit: Boolean; virtual;
    function Insert: Boolean; virtual;
    function Next: Boolean; virtual;
    function Open: Boolean; virtual;
    function Post: Boolean; virtual;
    function Prior: Boolean; virtual;
    function First: Boolean; virtual;
    function Last: Boolean; virtual;
    function Bof: Boolean; virtual;
    function Eof: Boolean; virtual;
    function IsEmpty: Boolean; virtual;
    procedure FindNearest(const KeyValues: array of const);
    property DataSet: TClientDataSet read FDataSet write FDataSet;
    property IndexFieldNames: string read GetIndexFieldNames write SetIndexFieldNames;

    function Gencodigo(Tabela: string): integer;
    function Cpf(Num: string): boolean;
    function cgc(Num: string): boolean;
    function montaSelect(sqlComandos: string): boolean; overload;
    function montaSelect(sqlComandos: string; dataIni, dataFim: TDate): boolean; overload;
    function ExecutaComandosSql(comandosSql: string): boolean;
    function retornaValor(comandosSql: string): string;
    function emTransacao:boolean;
    function IniciaTransacao: boolean;
    function CommitaTransacao: Boolean;
    procedure RollBackTransacao;
    procedure RetornaAtributos(Vcomb: Tcombobox; vcombord: TCombobox);
    function ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem: string; constante:
      boolean): boolean; overload;
    function ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim: string): boolean; overload;
    procedure registraErro(vMenserro: string);

  end;

implementation

uses
  Forms, Dialogs,  DB, IniFiles, uDtmEntrada;

constructor TDataSet_Entrada.Create;
begin
  //
end;

destructor TDataSet_Entrada.Destroy;
begin
  if dataset.Active then
    DataSet.close;
end;

function TDataSet_Entrada.Apply: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := true;
  try
    if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
    begin
      if DataSet.ApplyUpdates(0) > 0 then
      begin
        Result := false;
        raise Exception.Create('Alguns dados não foram salvos');
      end;
    end;
  except
    on E: Exception do
    begin
      MessageDlg('EFPG0001 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EFPG0001 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDataSet_Entrada.Cancel: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Cancel
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.CancelUpdates: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
      DataSet.CancelUpdates
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.Close: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Close
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.Delete: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := False;
  try
    if (DataSet <> nil) and (DataSet.Active) then
    begin
      if (DataSet.RecordCount > 0) then
      begin
        DataSet.Delete;
        Result := True;
      end;
    end;
  except
    on E: Exception do
    begin
      MessageDlg('EFPG0002 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EFPG0002 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDataSet_Entrada.Edit: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Edit
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.emTransacao: boolean;
begin
  if dtmEnt.bancoFiscal.Connected then
    Result := dtmEnt.transacaoFiscal.InTransaction
  else if dtmEnt.bancoHw.Connected then
    Result := dtmEnt.transacaoHw.InTransaction;
end;

function TDataSet_Entrada.Insert: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Insert
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.IsEmpty: Boolean;
begin
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      Result := DataSet.IsEmpty
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.Next: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Next
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.Open: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (not DataSet.Active) then
      DataSet.Open
    else
      Result := False;
  except
    on E: Exception do
    begin
      MessageDlg('EFPG0003 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EFPG0003 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDataSet_Entrada.Post: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  try
    Result := True;
    if (DataSet <> nil) and (DataSet.State in [dsInsert, dsEdit]) then
      DataSet.Post
    else
      result := false;
  except
    on E: Exception do
    begin
      MessageDlg('EFPG0004 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EFPG0004 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDataSet_Entrada.Prior: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Prior
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.Refresh: Boolean;
begin
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Refresh
    else
      Result := False;
  except
    Result := False;
  end;
end;

procedure TDataSet_Entrada.registraErro(vMenserro: string);
var
  Arq: TextFile;
  NomeArq: string;
  auxstr: string;
begin
  if vDadosIniEnt.vGravaErros = 'S' then
  begin
    Nomearq := ExtractFilePath(Application.Exename) + 'errosFPG.log';
    AssignFile(Arq, NomeArq);
    if not FileExists(NomeArq) then
      Rewrite(arq)
    else
      append(arq);
    auxstr := 'ERRO: ' + vmenserro + ' Dia: ' + datetostr(date) +
      ' Hora: ' + timetostr(time) + ' FISCAL';
    WriteLn(arq, auxstr);
    closeFile(arq);
  end;
end;

function TDataSet_Entrada.Last: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Last
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.montaSelect(sqlComandos: string; dataIni,
  dataFim: TDate): boolean;
begin
  try
    Close;
    dataSet.CommandText := sqlComandos;
    dataSet.Params[0].AsDate := dataIni;
    dataSet.Params[1].AsDate := dataFim;
    Open;
    result := true;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('EFPG0014 Erro ao executar comandos sql.' + #13 + 'Comandos: ' + sqlComandos + #13
        +
        'Erro: ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EFPG0014 ' + sqlComandos + ' ' + e.Message);
    end;
  end;
end;

function TDataSet_Entrada.montaSelect(sqlComandos: string): boolean;
begin
  try
    Close;
    dataSet.CommandText := sqlComandos;
    Open;
    result := true;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('EFPG0013 Erro ao executar comandos sql.' + #13 + 'Comandos: ' + sqlComandos + #13
        +
        'Erro: ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EFPG0013 ' + sqlComandos + ' ' + e.Message);
    end;
  end;
end;

procedure TDataSet_Entrada.FindNearest(const KeyValues: array of const);
begin
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.FindNearest(KeyValues);
  except
  end;
end;

function TDataSet_Entrada.First: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.First
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.Bof: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      Result := DataSet.Bof
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.Eof: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      Result := DataSet.Eof
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.ExecutaComandosSql(comandosSql: string): boolean;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
    dtmEnt.qrBuscas.close;
    dtmEnt.qrBuscas.sql.text := comandosSql;
    dtmEnt.qrBuscas.Open;
    if dtmEnt.qrBuscas.IsEmpty then
      Result := false
    else
      Result := true;
    dtmEnt.qrBuscas.close;
  except
    on E: Exception do
    begin
      result := false;
      MessageDlg('EFPG0006 ' + 'Erro ao ler executar comandos sql: ' + comandosSql, mtinformation,
        [mbOK], 0);
      registraErro('EFPG0006 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

function TDataSet_Entrada.Active: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) then
      Result := DataSet.Active
  except
    Result := False;
  end;
end;

function TDataSet_Entrada.Gencodigo(Tabela: string): integer;
begin
  while true do
  begin
    try
      dtmEnt.SpIncCodigo.Close;
      dtmEnt.SPIncCodigo.ParamByName('VCOD_EMPRESA').Text := vDadosIniEnt.codEmpresa;
      dtmEnt.SPIncCodigo.ParamByName('VTABELA').Text := Tabela;
      dtmEnt.SPIncCodigo.ExecProc;
      Result := dtmEnt.SPIncCodigo.ParamByName('COD').Value;
      dtmEnt.SPIncCodigo.Close;
      exit;
    except
      on E: Exception do
      begin
        MessageDlg('EFPG0005 ' + 'Erro ao gravar dados na tabela: ' + Tabela +
          '. Operação será repetida' + #13 +
          'Se o processo ficar repetitivo procure o Suporte', mtinformation, [mbOK], 0);
        registraErro('EFPG0005 ' + e.Message + ' ' + Tabela);
        //     Result := False;
      end;
    end;
  end;
end;

function TDataSet_Entrada.GetIndexFieldNames: string;
begin
  Result := DataSet.IndexFieldNames;
end;

function TDataSet_Entrada.Cpf(Num: string): boolean;
var
  N1, n2, n3, n4, n5, n6, n7, n8, n9: integer;
  D1, d2: integer;
  Digitado, calculado: string;
begin
  try
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then d1 := 0;
    d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then d2 := 0;
    calculado := inttostr(d1) + inttostr(d2);
    digitado := num[10] + num[11];
    if calculado = digitado then
      cpf := true
    else
      cpf := false;
  except
    cpf := false;
  end;
end;

function TDataSet_Entrada.cgc(Num: string): boolean;
var
  N1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: integer;
  D1, d2: integer;
  Digitado, calculado: string;
begin
  try
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    n10 := StrToInt(num[10]);
    n11 := StrToInt(num[11]);
    n12 := StrToInt(num[12]);

    d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3
      + n2 * 4 + n1 * 5;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then d1 := 0;
    d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3
      + n3 * 4 + n2 * 5 + n1 * 6;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then d2 := 0;
    Calculado := inttostr(d1) + inttostr(d2);
    digitado := num[13] + num[14];
    if calculado = digitado then
      cgc := true
    else
      cgc := false;
  except
    cgc := false;
  end;
end;

function TDataSet_Entrada.IniciaTransacao: boolean;
begin
    if not emTransacao then
  begin
    try
      if dtmEnt.bancoFiscal.Connected then
        dtmEnt.transacaoFiscal.StartTransaction
      else if dtmEnt.bancoHw.Connected then
        dtmEnt.transacaoHw.StartTransaction;
      result := true;
    except
      on e: exception do
      begin
        Result := False;
        MessageDlg('EF0007 ' + e.Message, mtInformation, [mbOK], 0);
        registraErro('EF0007 ' + e.Message);
      end;
    end;
  end;
end;

function TDataSet_Entrada.CommitaTransacao: Boolean;
begin
  if emTransacao then
  begin
    try
      if dtmEnt.bancoFiscal.Connected then
        dtmEnt.transacaoFiscal.Commit
      else if dtmEnt.bancoHw.Connected then
        dtmEnt.transacaoHw.Commit;
      result := true;
    except
      on e: exception do
      begin
        RollBackTransacao;
        Result := False;
        MessageDlg('EF0008 ' + e.Message, mtInformation, [mbOK], 0);
        registraErro('EF0008 ' + e.Message);
      end;
    end;
  end;
end;

function TDataSet_Entrada.ConsultaCampos(tabela, valorConsulta, Campo, condicao,
  ordem: string; constante: boolean): boolean;
var
  I: integer;
  possuiCodEmpresa: boolean;
  tipo: string; // F (Integer, Float); S String; D Data; I Indefinido
begin
  result := false;
  if valorConsulta <> '' then
  begin
    try
      if condicao = 'Igual' then
        condicao := '='
      else if condicao = 'Maior' then
        condicao := '>'
      else if condicao = 'Menor' then
        condicao := '<'
      else if condicao = 'Esta contido' then
        condicao := 'like'
      else
        condicao := '=';
      for I := 0 to DataSet.FieldCount - 1 do
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          Campo := DataSet.Fields[I].FieldName;

        if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          ordem := DataSet.Fields[I].FieldName;

        if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
          possuiCodEmpresa := true;

        if (Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
          (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField) then
          tipo := 'F'
        else if DataSet.Fields[i] is TStringField then
          tipo := 'S'
        else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          tipo := 'D'
        else
          tipo := 'I';
      end;
      DataSet.Close;
      if tipo = 'F' then
      begin
        if condicao = 'like' then
          condicao := '=';
        DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' ' + condicao + ' '
          +
          valorConsulta;
      end
      else if (tipo = 'S') or (tipo = 'I') then
      begin
        if condicao = 'like' then
          DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' like ' +
            QuotedStr('%' + valorConsulta + '%')
        else
          DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' ' + condicao + ' '
            + QuotedStr(valorConsulta);
      end;

      if possuiCodEmpresa then
        DataSet.CommandText := DataSet.CommandText + ' and cod_empresa = ' + vDadosIniEnt.codEmpresa;
      DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
      DataSet.Open;
      Result := true;
    except
      on e: exception do
      begin
        Result := false;
        MessageDlg('EFPG0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
          mtInformation, [mbOK], 0);
        registraErro('EFPG0009 ' + e.Message + DataSet.CommandText);
      end;
    end;
  end
  else
  begin
    try
      for I := 0 to DataSet.FieldCount - 1 do
        if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
        begin
          possuiCodEmpresa := true;
          Break;
        end;
      DataSet.close;
      DataSet.CommandText := 'select * from ' + tabela;
      if possuiCodEmpresa then
        DataSet.CommandText := DataSet.CommandText + ' where cod_empresa = ' + vDadosIniEnt.codEmpresa;
      DataSet.Open;
    except
      on e: exception do
      begin
        Result := false;
        MessageDlg('EFPG0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
          mtInformation, [mbOK], 0);
        registraErro('EFPG0010 ' + e.Message + DataSet.CommandText);
      end;
    end;
  end;
end;

function TDataSet_Entrada.ConsultaCampos(tabela, Campo, ordem, dataIni,
  dataFim: string): boolean;
var
  I: integer;
  possuiCodEmpresa: boolean;
  condicao: string;
begin
  result := false;
  if (dataIni <> '  /  /   ') or (dataFim <> '  /  /   ') then
  begin
    try
      for I := 0 to DataSet.FieldCount - 1 do
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          Campo := DataSet.Fields[I].FieldName;

        if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          ordem := DataSet.Fields[I].FieldName;

        if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
          possuiCodEmpresa := true;
      end;
      DataSet.Close;
      if (dataIni <> '  /  /   ') and (dataFim <> '  /  /   ') then
        condicao := ' where ' + Campo + ' >= :dataIni and ' + Campo + ' <= :dataFim'
      else if (dataIni <> '  /  /   ') and (dataFim = '  /  /   ') then
        condicao := ' where ' + Campo + ' >= :dataIni'
      else if (dataIni = '  /  /   ') and (dataFim <> '  /  /   ') then
        condicao := ' where ' + Campo + ' <= :dataFim';
      DataSet.CommandText := 'select * from ' + tabela + condicao;
      if possuiCodEmpresa then
        DataSet.CommandText := DataSet.CommandText + ' and cod_empresa = ' + vDadosIniEnt.codEmpresa;
      DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
      if (dataIni <> '  /  /   ') and (dataFim <> '  /  /   ') then
      begin
        DataSet.Params[0].AsDate := StrToDate(dataIni);
        DataSet.Params[1].AsDate := StrToDate(dataFim);
      end
      else if (dataIni <> '  /  /   ') and (dataFim = '  /  /   ') then
        DataSet.Params[0].AsDate := StrToDate(dataIni)
      else if (dataIni = '  /  /   ') and (dataFim <> '  /  /   ') then
        DataSet.Params[0].AsDate := StrToDate(dataFim);
      DataSet.Open;
      Result := true;
    except
      on e: exception do
      begin
        Result := false;
        MessageDlg('EFPG0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
          mtInformation, [mbOK], 0);
        registraErro('EFPG0011 ' + e.Message + DataSet.CommandText);
      end;
    end;
  end
  else
  begin
    try
      for I := 0 to DataSet.FieldCount - 1 do
        if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
        begin
          possuiCodEmpresa := true;
          Break;
        end;
      DataSet.close;
      DataSet.CommandText := 'select * from ' + tabela;
      if possuiCodEmpresa then
        DataSet.CommandText := DataSet.CommandText + ' where cod_empresa = ' + vDadosIniEnt.codEmpresa;
      DataSet.Open;
    except
      on e: exception do
      begin
        Result := false;
        MessageDlg('EFPG0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
          mtInformation, [mbOK], 0);
        registraErro('EFPG0012 ' + e.Message + DataSet.CommandText);
      end;
    end;
  end;
end;

procedure TDataSet_Entrada.RollBackTransacao;
begin
  if dtmEnt.bancoFiscal.Connected then
    dtmEnt.transacaoFiscal.Rollback
  else if dtmEnt.bancoHw.Connected then
    dtmEnt.transacaoHw.Rollback;
end;

procedure TDataSet_Entrada.SetIndexFieldNames(const Value: string);
begin
  DataSet.IndexFieldNames := Value;
end;

procedure TDataSet_Entrada.RetornaAtributos(Vcomb: Tcombobox; vcombord: TCombobox);
var
  I: Integer;
begin
  try
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      Vcomb.Items.Add(DataSet.Fields[I].DisplayName);
      vcombord.Items.Add(DataSet.Fields[I].DisplayName);
    end;
    Vcomb.Items.Add('TODOS');
  except
    on E: EListError do
      raise EListError.Create('Error na Montagem da Lista');
    on Exception do
      raise Exception.Create('Erro Interno com a Pesquisa');
  end; // Try...Except
end;

function TDataSet_Entrada.retornaValor(comandosSql: string): string;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
    dtmEnt.qrBuscas.close;
    dtmEnt.qrBuscas.SQL.Text := comandosSql;
    dtmEnt.qrBuscas.Open;
    if dtmEnt.qrBuscas.IsEmpty then
      Result := ''
    else
      Result := dtmEnt.qrBuscas.FieldByName('valor').AsString;
    dtmEnt.qrBuscas.close;
  except
    on E: Exception do
    begin
      result := '';
      MessageDlg('EFPG0017 ' + 'Erro ao ler executar comandos sql: ' + comandosSql, mtinformation,
        [mbOK], 0);
      registraErro('EFPG0017 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

end.

