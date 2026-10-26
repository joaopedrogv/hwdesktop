unit uClassesGraficosFollowUp;
interface

uses
  uDataSet_OOP, StdCtrls, DBClient, Controls;

const
  NomeMes: array[1..12] of string = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');
  satisfacao: array[1..5] of string = ('Totalmente Insatisfeito', 'Insatisfeito', 'Nem Satisfeito nem Insatisfeito', 'Satisfeito', 'Totalmente Satisfeito');

type
  TGraficos = class(TDataSet_OOP)
  private
  public
    function montaTabelaMensal(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; virtual; abstract;
    function montaTabelaAnual(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; virtual; abstract;
    function selecionaValores(mes, ano: TDate; grupo, Pergunta: integer): boolean; overload; virtual;
    function selecionaValores(ano: TDate; grupo, Pergunta: integer): boolean; overload; virtual;
    function selecionaGrupoPerguntas(dtSetGP: TClientDataSet; ano: TDate): boolean; virtual;
  end;

  TTendencias = class(TGraficos)
  private
  public
    constructor create;
    function montaTabelaMensal(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; override;
  end;

  TReacoesNegativas = class(TGraficos)
  private
  public
    constructor create;
    function montaTabelaMensal(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; override;
    function montaTabelaAnual(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; override;
  end;

  TIndices = class(TGraficos)
  private
  public
    constructor create;
    function montaTabelaAnual(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; override;
    function selecionaValores(ano: TDate; grupo, Pergunta: integer): boolean; override;
  end;

implementation

uses SysUtils, db, Messages, Dialogs, uDtmFollowUpPosAtendimento, DateUtils, 
  uDtmAtivo;

{ TTendencias }

constructor TTendencias.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsGraficos);
end;

function TTendencias.montaTabelaMensal(ano: TDate; dtSet: TClientDataSet;
  grupo, Pergunta: integer): boolean;
var
  qtde, i: integer;
  porcentagem: Double;
begin
  for I := 1 to 12 do
  begin
    dtSet.Insert;
    dtSet.FieldByName('Codigo').AsInteger := i;
    dtSet.FieldByName('Mes').AsString := NomeMes[i];
    dtSet.FieldByName('Porcentagem').AsFloat := 0;
    selecionaValores(strtodate('01/' + vDadosIni.StrZero(i, 2) + '/2000'), ano, grupo, Pergunta);
    qtde := 0;
    porcentagem := 0;
    while not eof do
    begin
      if dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
      begin
        qtde := qtde + dataSet.FieldByName('qtde').AsInteger;
        if dataSet.FieldByName('nivelresposta').AsInteger = 1 then
          porcentagem := porcentagem + (100 * dataSet.FieldByName('qtde').AsInteger);
      end
      else
      begin
        qtde := qtde + dataSet.FieldByName('qtde').AsInteger;
        if dataSet.FieldByName('nivelresposta').AsInteger = 5 then
          porcentagem := porcentagem + (100 * dataSet.FieldByName('qtde').AsInteger)
        else if dataSet.FieldByName('nivelresposta').AsInteger = 4 then
          porcentagem := porcentagem + (75 * dataSet.FieldByName('qtde').AsInteger)
        else if dataSet.FieldByName('nivelresposta').AsInteger = 3 then
          porcentagem := porcentagem + (50 * dataSet.FieldByName('qtde').AsInteger)
        else if dataSet.FieldByName('nivelresposta').AsInteger = 2 then
          porcentagem := porcentagem + (25 * dataSet.FieldByName('qtde').AsInteger);
      end;
      next;
    end;
    if (porcentagem > 0) and (qtde > 0) then
      dtSet.FieldByName('Porcentagem').AsFloat := porcentagem / qtde;
    dtSet.FieldByName('Quantidade').AsInteger := qtde;
    dtSet.Post;
  end;
end;

{ TReacoesNegativas }

constructor TReacoesNegativas.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsGraficos);
end;

function TReacoesNegativas.montaTabelaAnual(ano: TDate;
  dtSet: TClientDataSet; grupo, Pergunta: integer): boolean;
begin
  result := true;
  while not dtSet.IsEmpty do
    dtSet.Delete;
  selecionaValores(ano, grupo, Pergunta);
  while not eof do
  begin
    dtSet.Insert;
    dtSet.FieldByName('Codigo').AsInteger := dataSet.FieldByName('nivelrespcompl').AsInteger;
    dtSet.FieldByName('Alternativa').AsString := dataSet.FieldByName('alternativa').AsString;
    dtSet.FieldByName('QTDE').AsFloat := dataSet.FieldByName('qtde').AsInteger;
    dtSet.Post;
    next;
  end;
  if IsEmpty then
    result := false;
end;

function TReacoesNegativas.montaTabelaMensal(ano: TDate;
  dtSet: TClientDataSet; grupo, Pergunta: integer): boolean;
var
  qtde, i, neg, posit: integer; //Neg = Negativos e Posit = Positivo
  porcentagem: Double;
begin
  while not dtSet.IsEmpty do
    dtSet.Delete;
  for I := 1 to 12 do
  begin
    dtSet.Insert;
    dtSet.FieldByName('Codigo').AsInteger := i;
    dtSet.FieldByName('Mes').AsString := NomeMes[i];
    dtSet.FieldByName('Porcentagem').AsFloat := 0;
    selecionaValores(strtodate('01/' + vDadosIni.StrZero(i, 2) + '/2000'), ano, grupo, Pergunta);
    qtde := 0;
    porcentagem := 0;
    neg := 0;
    posit := 0;
    while not eof do
    begin
      if dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
      begin
        if dataSet.FieldByName('nivelresposta').AsInteger = 1 then
          posit := posit + dataSet.FieldByName('qtde').AsInteger
        else
          neg := neg + dataSet.FieldByName('qtde').AsInteger;
      end
      else
      begin
        if dataSet.FieldByName('nivelresposta').AsInteger = 1 then
          neg := neg + dataSet.FieldByName('qtde').AsInteger
        else if dataSet.FieldByName('nivelresposta').AsInteger = 2 then
          neg := neg + dataSet.FieldByName('qtde').AsInteger
        else if dataSet.FieldByName('nivelresposta').AsInteger = 3 then
          posit := posit + dataSet.FieldByName('qtde').AsInteger
        else if dataSet.FieldByName('nivelresposta').AsInteger = 4 then
          posit := posit + dataSet.FieldByName('qtde').AsInteger
        else if dataSet.FieldByName('nivelresposta').AsInteger = 5 then
          posit := posit + dataSet.FieldByName('qtde').AsInteger;
      end;
      next;
    end;
    if (neg > 0) then
      dtSet.FieldByName('Porcentagem').AsFloat := (100 / (neg + posit)) * neg;
    dtSet.FieldByName('Quantidade').AsInteger := neg;
    dtSet.Post;
  end;
end;

{ TGraficos }

function TGraficos.selecionaGrupoPerguntas(dtSetGP: TClientDataSet;
  ano: TDate): boolean;
begin
  try
    result := true;
    dtSetGP.close;
    dtSetGP.CommandText := 'select g.codgrupo,g.descricao_grup,p.codpergunta,p.pergunta,p.complemento from resposta r' +
      ' inner join pergunta p on p.codpergunta = r.codpergunta' +
      ' inner join grupo g on g.codgrupo = p.codgrupo' +
      ' inner join pesquisa pq on pq.codpesquisa = r.codpesquisa and pq.codempresa = r.codempresa' +
      ' where r.codempresa = ' + vDadosIni.codEmpresa + ' and pq.datafechamento >= :dataIni and pq.datafechamento <= :dataFim' +
      ' group by g.codgrupo,g.descricao_grup,p.codpergunta,p.pergunta,p.complemento';
    dtSetGP.Params[0].AsDate := StartOfTheYear(ano);
    dtSetGP.Params[1].AsDate := EndOfTheYear(ano);
    dtSetGP.Open;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg(e.Message, mtInformation, [mbOK], 0);
    end;
  end;
end;

function TGraficos.selecionaValores(mes, ano: TDate; grupo,
  Pergunta: integer): boolean;
var
  inicioMes, fimMes: TDate;
begin
  inicioMes := StartOfTheMonth(StrToDate('01/' + FormatDateTime('mm', mes) + '/' + FormatDateTime('yyy', ano)));
  fimMes := endOfTheMonth(StrToDate('02/' + FormatDateTime('mm', mes) + '/' + FormatDateTime('yyy', ano)));
  if montaSelect('select g.codgrupo,p.codpergunta,p.simnaonivel,r.nivelresposta,' +
    ' count(r.codpesquisa) as QTDE from resposta r' +
    ' inner join pergunta p on p.codpergunta = r.codpergunta' +
    ' inner join grupo g on g.codgrupo = p.codgrupo' +
    ' inner join pesquisa pq on pq.codpesquisa = r.codpesquisa and pq.codempresa = r.codempresa' +
    ' where r.codempresa = ' + vDadosIni.codEmpresa + ' and pq.datafechamento >= :dataIni and pq.datafechamento <= :dataFim' +
    ' and p.codpergunta = ' + IntToStr(Pergunta) + ' and p.codgrupo = ' + IntToStr(grupo) +
    ' group by g.codgrupo,p.codpergunta,p.simnaonivel,r.nivelresposta', inicioMes, fimMes) then
    result := true
  else
    result := false;
end;

function TGraficos.selecionaValores(ano: TDate; grupo,
  Pergunta: integer): boolean;
var
  inicioAno, fimAno: TDate;
begin
  inicioAno := StartOfTheYear(ano);
  fimAno := EndOfTheYear(ano);
  if montaSelect('select pc.alternativa,rc.nivelrespcompl,count(rc.codpesquisa) as qtde' +
    ' from respostacomplemento  rc' +
    ' inner join perguntacomplemento pc on pc.codpergcompl = rc.nivelrespcompl' +
    ' inner join pergunta p on p.codpergunta = rc.codpergunta' +
    ' inner join pesquisa pq on pq.codpesquisa = rc.codpesquisa and pq.codempresa = rc.codempresa' +
    ' where rc.codempresa = ' + vDadosIni.codEmpresa + ' and pq.datafechamento >= :dataIni and pq.datafechamento <= :dataFim' +
    ' and p.codpergunta = ' + IntToStr(Pergunta) + ' and p.codgrupo = ' + IntToStr(grupo) +
    ' group by pc.alternativa,rc.nivelrespcompl', inicioAno, fimAno) then
    result := true
  else
    result := false;
end;

{ TIndices }

constructor TIndices.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsGraficos);
end;

function TIndices.montaTabelaAnual(ano: TDate; dtSet: TClientDataSet; grupo,
  Pergunta: integer): boolean;
var
  total, i: integer;
begin
  result := true;
  while not dtSet.IsEmpty do
    dtSet.Delete;
  Self.selecionaValores(ano, grupo, Pergunta);
  total := 0;
  First;
  while not eof do
  begin
    if dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
      total := total + dataSet.FieldByName('qtde').AsInteger
    else
    begin
      if (dataSet.FieldByName('nivelresposta').AsInteger > 0) and (dataSet.FieldByName('nivelresposta').AsInteger < 6) then
        total := total + dataSet.FieldByName('qtde').AsInteger;
    end;
    next;
  end;
  First;
  if dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
  begin
    dtSet.Append;
    dtSet.FieldByName('Codigo').AsInteger := 0;
    dtSet.FieldByName('Alternativa').AsString := 'Não';
    dtSet.FieldByName('QTDE').AsFloat := 0;
    dtSet.Post;
    dtSet.Insert;
    dtSet.FieldByName('Codigo').AsInteger := 1;
    dtSet.FieldByName('Alternativa').AsString := 'Sim';
    dtSet.FieldByName('QTDE').AsFloat := 0;
    dtSet.Post;
    First;
    while not eof do
    begin
      dtSet.First;
      while not dtSet.Eof do
      begin
        dtSet.Edit;
        if dataSet.FieldByName('nivelresposta').AsInteger = dtSet.FieldByName('codigo').AsInteger then
          dtSet.FieldByName('QTDE').AsFloat := (100 / total) * dataSet.FieldByName('qtde').AsInteger;
        dtSet.Post;
        dtSet.Next;
      end;
      Next;
    end;
  end
  else
  begin
    for I := 1 to 5 do
    begin
      dtSet.Append;
      dtSet.FieldByName('Codigo').AsInteger := i;
      dtSet.FieldByName('Alternativa').AsString := satisfacao[i];
      dtSet.FieldByName('QTDE').AsFloat := 0;
      dtSet.Post;
    end;
    First;
    while not eof do
    begin
      dtSet.First;
      while not dtSet.Eof do
      begin
        dtSet.Edit;
        if dataSet.FieldByName('nivelresposta').AsInteger = dtSet.FieldByName('codigo').AsInteger then
          dtSet.FieldByName('QTDE').AsFloat := (100 / total) * dataSet.FieldByName('qtde').AsInteger;
        dtSet.Post;
        dtSet.Next;
      end;
      Next;
    end;
  end;
  if IsEmpty then
    result := false;
end;

function TIndices.selecionaValores(ano: TDate; grupo,
  Pergunta: integer): boolean;
var
  inicioAno, fimAno: TDate;
begin
  inicioAno := StartOfTheYear(ano);
  fimAno := EndOfTheYear(ano);
  if montaSelect('select r.nivelresposta,p.simnaonivel,count(pq.codpesquisa) as qtde' +
    ' from resposta r' +
    ' inner join pesquisa  pq on pq.codpesquisa = r.codpesquisa and pq.codempresa = r.codempresa' +
    ' inner join pergunta p on p.codpergunta = r.codpergunta' +
    ' where pq.codempresa = ' + vDadosIni.codEmpresa + ' and pq.datafechamento >= :dataIni and pq.datafechamento <= :dataFim' +
    ' and p.codpergunta = ' + IntToStr(Pergunta) + ' and p.codgrupo = ' + IntToStr(grupo) +
    ' group by r.nivelresposta,p.simnaonivel', inicioAno, fimAno) then
    result := true
  else
    result := false;
end;

end.

