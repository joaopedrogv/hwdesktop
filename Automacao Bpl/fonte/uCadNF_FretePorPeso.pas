unit uCadNF_FretePorPeso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, uDataSet_OOP,
  uEditHw, uClassesNotasFiscais_itens_cadastros, DB, DBClient;

const
  CAMPOS_ALTERAVEIS: array[1..2] of string = ('FRETEPR', 'PESO');

type

  LastProd = record
    frete, peso: Double;
    grupo: Integer;
    codigo, unidade: string;
  end;

  TDataSetNF = class(TDataSet_OOP)
  private
    lastP: LastProd;
    frete: TFretePorPesoModel;
    procedure DataSetAfterPost(DataSet: TDataSet);
    procedure DataSetBeforePost(DataSet: TDataSet);
  public
    function GetProduto(payload: TFretePorPesoModel): Boolean;
    function SaveProdutos: Boolean;

    function Calcular(): Double;

    procedure AtivarAfterPost;
  end;

  TfrmCadNFFretePorPeso = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edFreteCalculado: TEditHw;
    lbAlerta: TLabel;
    ClientDataSet1: TClientDataSet;
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    edFreteAjustado: TEditHw;
    ckAjustarFrete: TCheckBox;
    procedure ckAjustarFreteClick(Sender: TObject);
    procedure DBGrid1MouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure DBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ClientDataSet1BeforePost(DataSet: TDataSet);
    procedure ClientDataSet1BeforeScroll(DataSet: TDataSet);
    procedure DBGrid1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
  private
    FfreteModel: TFretePorPesoModel;
    dataNF: TDataSetNF;

    colunaAnterior: string;
    procedure Inicializar;
    procedure Calcular;

  public
    property freteModel: TFretePorPesoModel read FfreteModel write FfreteModel;
  end;

var
  frmCadNFFretePorPeso: TfrmCadNFFretePorPeso;

implementation

uses
  uDtmAtivo,
  produtos_frete_peso_class,
  hw_utils,
  hw_win_utils,
  uDadosIni,
  Math,
  StrUtils, Contnrs;

{$R *.dfm}

{ TfrmCadNFFretePorPeso }

procedure TfrmCadNFFretePorPeso.BitBtn1Click(Sender: TObject);
begin
  inherited;
  dataNF.SaveProdutos;
end;

procedure TfrmCadNFFretePorPeso.BitBtn2Click(Sender: TObject);   
var
  item: TItensFreteModel;
  totalCalculado, totalAjustado, soma: Double;
begin
  inherited;
  if (ckAjustarFrete.Checked) and (edFreteAjustado.AsValue <= 0) then
  begin
    ShowAtencao('Valor para ajuste inválido');
    Exit;
  end;

  dataNF.prepare_loop();
  try

    while not dataNF.Eof do
    begin

      for item in freteModel.items do
        if dataNF.fequals('nitem', item.nitem) and
           dataNF.fequals('grupo_prod', item.grupo) and
           dataNF.fequals('cod_prod', item.codprod) then
        begin
          item.frete := dataNF.ffloat('fretenf', -2);
          Break;
        end;

      dataNF.Next;
    end;

  finally
    dataNF.prepare_loop_done();
  end;

  if (ckAjustarFrete.Checked) and (edFreteAjustado.AsValue <> edFreteCalculado.AsValue) then
  begin
    totalCalculado := RoundTo(edFreteCalculado.AsValue, -2);
    totalAjustado  := RoundTo(edFreteAjustado.AsValue, -2);
    soma := 0;
    for item in freteModel.items do
      if item.frete > 0 then
      begin
        item.frete := RoundTo(item.frete / totalCalculado * totalAjustado, -2);
        soma := soma + item.frete;
      end;

    if RoundTo(Abs(totalAjustado - soma), -2) > 0 then
      for item in freteModel.items do
        if (item.frete > 0) and (RoundTo(item.frete + (totalAjustado - soma), -2) > 0) then
        begin
          item.frete := RoundTo(item.frete + (totalAjustado - soma), -2);
          Break;
        end;
  end;

  ModalResult := IDOK;

end;

procedure TfrmCadNFFretePorPeso.Calcular;
var
  freteCalculado: Double;
begin

  dataNF.prepare_loop();
  try

    freteCalculado := 0;

    while not dataNF.Eof do
    begin
      dataNF.dataSet.Edit;

      dataNF.dataSet.FieldByName('fretenf').AsFloat :=
        dataNF.ffloat('fretepr') * dataNF.ffloat('peso') * dataNF.ffloat('quantidade');

      freteCalculado := freteCalculado + dataNF.ffloat('fretenf', -2);

      dataNF.Post;

      dataNF.Next;
    end;

    edFreteCalculado.AsValue := freteCalculado;

  finally
    dataNF.prepare_loop_done();
  end;
end;

procedure TfrmCadNFFretePorPeso.ckAjustarFreteClick(Sender: TObject);
begin
  inherited;

  edFreteAjustado.Enabled := ckAjustarFrete.Checked;

  if not edFreteAjustado.Enabled then
    edFreteAjustado.AsValue := 0
  else if edFreteAjustado.AsValue = 0 then
    edFreteAjustado.AsValue := edFreteCalculado.AsValue;

  if (Self.Enabled) and (Self.Visible) and (edFreteAjustado.CanFocus) then
    edFreteAjustado.SetFocus;
end;

procedure TfrmCadNFFretePorPeso.ClientDataSet1BeforePost(DataSet: TDataSet);
begin
  inherited;
  if dataNF.dataSet.State in [dsEdit] then
    ShowMessage('BeforePost');
end;

procedure TfrmCadNFFretePorPeso.ClientDataSet1BeforeScroll(DataSet: TDataSet);
begin
  inherited;
  if dataNF.dataSet.State in [dsEdit] then
    ShowMessage('BeforeScroll');
end;

procedure TfrmCadNFFretePorPeso.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;

//  ShowAtencao('Entrrou' + DBGrid1.SelectedField.FieldName);

  //campo atual e alteror alteravel então não precisa fazer novamente
//  if MatchText(DBGrid1.SelectedField.FieldName, CAMPOS_ALTERAVEIS) and
//     MatchText(colunaAnterior, CAMPOS_ALTERAVEIS) then
//    Exit;
  if (dataNF.dataSet.State in [dsEdit]) then
    dataNF.dataSet.Cancel;

//  if MatchText(colunaAnterior, CAMPOS_ALTERAVEIS) and
//    (dataNF.dataSet.State in [dsEdit]) then
//    edFreteCalculado.AsValue := dataNF.Calcular;

  if MatchText(DBGrid1.SelectedField.FieldName, CAMPOS_ALTERAVEIS) then
  begin
    DBGrid1.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
    DBGrid1.DataSource.AutoEdit := True;
//    dataNF.AtivarAfterPost;
  end
  else
  begin
    DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
    DBGrid1.DataSource.AutoEdit := False;
  end;

  colunaAnterior := DBGrid1.SelectedField.FieldName;
end;

procedure TfrmCadNFFretePorPeso.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  if (dataNF.dataSet.State in [dsEdit]) then
    dataNF.dataSet.Cancel;

//  if MatchText(DBGrid1.SelectedField.FieldName, CAMPOS_ALTERAVEIS) and
//    (dataNF.dataSet.State in [dsEdit]) then
//    edFreteCalculado.AsValue := dataNF.Calcular;

//  if (MatchText(DBGrid1.SelectedField.FieldName, CAMPOS_ALTERAVEIS)) and
//    (dataNF.dataSet.State in [dsEdit]) then
//    Calcular;

//  ShowAtencao('Saiu ' + DBGrid1.SelectedField.FieldName);

//  if (not MatchText(DBGrid1.SelectedField.FieldName, CAMPOS_ALTERAVEIS)) and
//     (not MatchText(colunaAnterior, CAMPOS_ALTERAVEIS)) then
//    Exit;


//  if DBGrid1.SelectedField.FieldName = 'FRETEPR' then
//  if (not MatchText(DBGrid1.SelectedField.FieldName, CAMPOS_ALTERAVEIS)) then
//  begin
//    DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
//    Calcular;
//    DBGrid1.DataSource.AutoEdit := False;
//  end;
end;

procedure TfrmCadNFFretePorPeso.DBGrid1Exit(Sender: TObject);
begin
  inherited;
  if MatchText(DBGrid1.SelectedField.FieldName, CAMPOS_ALTERAVEIS) and
    (dataNF.dataSet.State in [dsEdit]) then
    edFreteCalculado.AsValue := dataNF.Calcular;
end;

procedure TfrmCadNFFretePorPeso.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if (MatchText(DBGrid1.SelectedField.FieldName, CAMPOS_ALTERAVEIS)) and
       (dataNF.dataSet.State in [dsEdit]) then
       edFreteCalculado.AsValue := dataNF.Calcular
    else
      dataNF.Cancel;
  end
  else if (key = VK_UP) or (key = VK_DOWN) then
  begin
    if (MatchText(DBGrid1.SelectedField.FieldName, CAMPOS_ALTERAVEIS)) and
       (dataNF.dataSet.State in [dsEdit]) then
       edFreteCalculado.AsValue := dataNF.Calcular
    else
      dataNF.Cancel;
  end;
end;

procedure TfrmCadNFFretePorPeso.DBGrid1MouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  inherited;

  if (dataNF.dataSet.State in [dsEdit]) then
    dataNF.dataSet.Cancel;
end;

procedure TfrmCadNFFretePorPeso.DBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

    if (dataNF.dataSet.State in [dsEdit]) then
    dataNF.dataSet.Cancel;
end;

procedure TfrmCadNFFretePorPeso.FormCreate(Sender: TObject);
begin
  inherited;
  dataNF := TDataSetNF.Create(dtmAtivo.bancoHw);
end;

procedure TfrmCadNFFretePorPeso.FormDestroy(Sender: TObject);
begin
  inherited;
  dataNF.Free;
end;

procedure TfrmCadNFFretePorPeso.FormShow(Sender: TObject);
begin
  inherited;

  ckAjustarFrete.Checked := False;
  edFreteAjustado.Enabled := False;
  edFreteAjustado.AsValue := 0;

  lbAlerta.Visible := freteModel.freteEmDespPF;

  Inicializar;
end;

procedure TfrmCadNFFretePorPeso.Inicializar;
var
  item: TItensFreteModel;
begin
  {
  dataNF.SqlExec('delete from produtos_tmp pt where pt.id_tmp = ''NF%d'' and pt.cod_empresa = %d ',
                 [freteModel.notafiscalId, vDadosIni.cod_empresa]);

  for item in freteModel.items do
    dataNF.SqlExec('insert into produtos_tmp (id_tmp, seqid, cod_empresa, grupo_prod, cod_prod)' +
                   ' values (''NF%d'', %d, %d, %d, ''%s'')',
                   [freteModel.notafiscalId, item.nitem, vDadosIni.cod_empresa, item.grupo, item.codprod]);




  dataNF.ClientOpen('select seqid nitem, pf.valor fretepr, 0.00 fretenf, pr.num_fab_prod,' +
                    ' pr.descr_prod, pr.grupo_prod, pr.cod_prod, 0.00 valor_total, 0.000 quantidade,' +
                    ' pf.unidade, pr.peso_liq_prod, pf.id, pf.cod_cliente ' +
                    ' from produtos_tmp pt' +
                    ' inner join produtos p on p.grupo_prod = pt.grupo_prod' +
                    '   and p.cod_prod = pt.cod_prod and p.cod_empresa = pt.cod_empresa' +
                    ' left join produtos_frete_peso pf on pf.grupo_prod = pt.grupo_prod' +
                    '   and pf.cod_prod = pt.cod_prod and pf.cod_empresa = pt.cod_empresa' +
                    '   and pf.cod_cliente = %d and pf.unidade = ' +
                    ' where pt.id_tmp = ''NF%d'' and pt.cod_empresa = %d ' +
                    ' order by pt.seqid',
                    [freteModel.clienteId, freteModel.notafiscalId, vDadosIni.cod_empresa]);

  dataNF.prepare_loop();
  try

    while not dataNF.Eof do
    begin
      dataNF.dataSet.Edit;

      for item in freteModel.items do
        if dataNF.fequals('nitem', item.nitem) and
           dataNF.fequals('grupo_prod', item.grupo) and
           dataNF.fequals('cod_prod', item.codprod) then
        begin
          dataNF.dataSet.FieldByName('fretenf').AsFloat := item.frete;
          dataNF.dataSet.FieldByName('valor_total').AsFloat := item.valor;
          dataNF.dataSet.FieldByName('unidade').AsString := item.unidade;
        end;

      dataNF.Post;

      dataNF.Next;
    end;

  finally
    dataNF.prepare_loop_done();
  end;

  }
  dataNF.GetProduto(freteModel);

  edFreteCalculado.AsValue := dataNF.Calcular();

  DBGrid1.DataSource := dataNF._dataSourceOOP;
end;

{ TDataSetNF }

procedure TDataSetNF.AtivarAfterPost;
begin
  dataSet.AfterPost := DataSetAfterPost;
  dataSet.BeforePost := DataSetAfterPost;
end;

function TDataSetNF.Calcular(): Double;
var
  frete, peso: Double;
  freteCalculado: Double;
  grupo: Integer;
  codigo, unidade: string;
begin

  if dataSet.State = dsEdit then
  begin
    dataSet.Post;
    frete := ffloat('fretepr', -3);
    peso := ffloat('peso', -3);
    grupo := fint('grupo_prod');
    codigo := fstr('cod_prod');
    unidade := fstr('unidade');
  end
  else
  begin
    grupo := 0;
    codigo := '';
  end;

  prepare_loop();
  try

    freteCalculado := 0;

    while not dataSet.Eof do
    begin
      dataSet.Edit;

      if (fint('grupo_prod') = grupo) and
         (fequals('cod_prod', codigo)) then
      begin
        dataSet.FieldByName('fretepr').AsFloat := frete;
        dataSet.FieldByName('peso').AsFloat := peso;
        dataSet.FieldByName('unidade').AsString := unidade;
      end;

      dataSet.FieldByName('fretenf').AsFloat := ffloat('fretepr') * ffloat('peso') * ffloat('quantidade');

      freteCalculado := freteCalculado + ffloat('fretenf', -2);

      dataSet.Post;

      dataSet.Next;
    end;

    Result := freteCalculado;

  finally
    prepare_loop_done();
  end;
end;

procedure TDataSetNF.DataSetAfterPost(DataSet: TDataSet);
//var
//  frete, peso: Double;
//  grupo: Integer;
//  codigo, unidade: string;
begin
//  DataSet.AfterPost := nil;
//  DataSet.BeforeOpen := nil;
end;

procedure TDataSetNF.DataSetBeforePost(DataSet: TDataSet);
begin
//  dataSet.AfterPost := DataSetAfterPost;
end;

function TDataSetNF.GetProduto(payload: TFretePorPesoModel): Boolean;
var
  item: TItensFreteModel;
  sql: string;
  jaIncluido: Boolean;
begin
  frete := payload;

  SqlExec('delete from produtos_tmp pt where pt.id_tmp = ''NF%d'' and pt.cod_empresa = %d ',
          [payload.notafiscalId, vDadosIni.cod_empresa]);

  for item in frete.items do
    SqlExec('insert into produtos_tmp (id_tmp, seqid, cod_empresa, grupo_prod, cod_prod)' +
            ' values (''NF%d'', %d, %d, %d, ''%s'')',
            [frete.notafiscalId, item.nitem, vDadosIni.cod_empresa, item.grupo, item.codprod]);

  ClientOpen('select pt.seqid nitem, 0.000 fretepr, 0.00 fretenf, pr.num_fab_prod,' +
                ' pr.descr_prod, pr.grupo_prod, pr.cod_prod, 0.00 valor_total, 0.000 quantidade,' +
                ' ''      '' unidade, 0.000 peso, pr.peso_liq_prod, 0 id, 0 cod_cliente, 0.000 freteoriginal ' +
                ' from produtos_tmp pt' +
                ' inner join produtos pr on pr.grupo_prod = pt.grupo_prod' +
                '   and pr.cod_prod = pt.cod_prod and pr.cod_empresa = pt.cod_empresa' +
                ' where pt.id_tmp = ''NF%d'' and pt.cod_empresa = %d ' +
                ' order by pt.seqid',
                [frete.notafiscalId, vDadosIni.cod_empresa]);

  SqlOpen('select pt.seqid nitem, pf.valor fretepr, 0.00 fretenf, pr.num_fab_prod,' +
                ' pr.descr_prod, pr.grupo_prod, pr.cod_prod, 0.00 valor_total, 0.000 quantidade,' +
                ' pf.unidade, pf.peso, pr.peso_liq_prod, pf.id, pf.cod_cliente, pf.valor freteoriginal ' +
                ' from produtos_tmp pt' +
                ' inner join produtos pr on pr.grupo_prod = pt.grupo_prod' +
                '   and pr.cod_prod = pt.cod_prod and pr.cod_empresa = pt.cod_empresa' +
                ' inner join produtos_frete_peso pf on pf.grupo_prod = pt.grupo_prod' +
                '   and pf.cod_prod = pt.cod_prod and pf.cod_empresa = pt.cod_empresa' +
                '   and pf.cod_cliente = %d' +
                ' where pt.id_tmp = ''NF%d'' and pt.cod_empresa = %d ' +
                ' order by pt.seqid',
                [frete.clienteId, frete.notafiscalId, vDadosIni.cod_empresa]);

//  ClientOpen(sql, [0, frete.notafiscalId, vDadosIni.cod_empresa]);
//
//  SqlOpen(sql, [frete.notafiscalId, frete.notafiscalId, vDadosIni.cod_empresa]);

  prepare_loop();
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      for item in frete.items do
        if fequals('nitem', item.nitem) and
           fequals('grupo_prod', item.grupo) and
           fequals('cod_prod', item.codprod) then
        begin     
          dataSet.Edit;        
          dataSet.FieldByName('cod_cliente').AsInteger := frete.clienteId;
          dataSet.FieldByName('fretenf').AsFloat := item.frete;
          dataSet.FieldByName('valor_total').AsFloat := item.valor;
          dataSet.FieldByName('quantidade').AsFloat := item.quantidade;
          dataSet.FieldByName('quantidade').AsFloat := item.quantidade;
          dataSet.FieldByName('unidade').AsString := item.unidade;
          dataSet.Post;
        end;

      dataSet.Next;
    end;


    buscas.First;
    while not buscas.Eof do
    begin
      
      for item in frete.items do
        if //(not item.jaIncluido) and
           (buscas.FieldByName('nitem').AsInteger = item.nitem) and
           (buscas.FieldByName('grupo_prod').AsInteger = item.grupo) and
           (Trim(buscas.FieldByName('cod_prod').AsString) = Trim(item.codprod)) and
           (Trim(buscas.FieldByName('unidade').AsString) = Trim(item.unidade)) and
           (dataSet.Locate('NITEM', buscas.FieldByName('nitem').AsInteger, [])) then
//        if dataSet.Locate('NITEM', [buscas.FieldByName('nitem').AsInteger]) then
        begin
          dataSet.Edit;
//          dataSet.FieldByName('nitem').AsInteger := buscas.FieldByName('nitem').AsInteger;
//          dataSet.FieldByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
//          dataSet.FieldByName('cod_prod').AsString := Trim(buscas.FieldByName('cod_prod').AsString);
//          dataSet.FieldByName('unidade').AsString := Trim(buscas.FieldByName('unidade').AsString);
//          dataSet.FieldByName('num_fab_prod').AsString := Trim(buscas.FieldByName('num_fab_prod').AsString);
//          dataSet.FieldByName('peso_liq_prod').AsFloat := buscas.FieldByName('peso_liq_prod').AsFloat;
          dataSet.FieldByName('id').AsInteger := buscas.FieldByName('id').AsInteger;
//          dataSet.FieldByName('cod_cliente').AsInteger := buscas.FieldByName('cod_cliente').AsInteger;
          dataSet.FieldByName('fretepr').AsFloat       := buscas.FieldByName('fretepr').AsFloat;
          dataSet.FieldByName('freteoriginal').AsFloat := buscas.FieldByName('freteoriginal').AsFloat;
          dataSet.FieldByName('peso').AsFloat := buscas.FieldByName('peso').AsFloat;

//          dataSet.FieldByName('fretenf').AsFloat := item.frete;
//          dataSet.FieldByName('valor_total').AsFloat := item.valor;
//          dataSet.FieldByName('quantidade').AsFloat := item.quantidade;
          dataSet.Post;

          item.jaIncluido := True;
        end;

      buscas.Next;
    end;

  finally
    prepare_loop_done();
  end;
end;

function TDataSetNF.SaveProdutos: Boolean;
var
  registro: TProdutos_frete_peso_class;
begin
  
  if not vDadosIni.PesqPros('NF0226', 'SALVAR', '',
    'PRODUTOS_FRETE_PESO', '', buscas, True) then
    Exit;

  try

    prepare_loop();
    try

      dataSet.First;
      while not dataSet.Eof do
      begin

        if ((fint('id') = 0) and (ffloat('fretepr', -3) > 0)) or
           (ffloat('fretepr', -3) <> ffloat('freteoriginal', -3))or
           (ffloat('fretepr', -3) <> ffloat('freteoriginal', -3)) then
        begin
          registro := TProdutos_frete_peso_class.Create;
          registro.CopyFrom(
            SqlOpen('select * from produtos_frete_peso' +
                    ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d' +
                    ' and cod_cliente = %d and unidade = %s',
                    [fint('grupo_prod'), fstrq('cod_prod'), vDadosIni.cod_empresa, frete.clienteId, fstrq('unidade')]));

          if registro.id = 0 then
          begin
            registro := TProdutos_frete_peso_class.Create;//.CopyFrom(dataSet);
            registro.grupo_prod := fint('grupo_prod');
            registro.cod_prod := fstr('cod_prod');  
            registro.unidade := fstr('unidade');
            registro.cod_cliente := frete.clienteId;
            registro.cod_empresa := vDadosIni.cod_empresa;
            registro.valor := ffloat('fretepr', -3);
            registro.peso  := ffloat('peso', -3);
          end
          else
          begin
            registro.valor := ffloat('fretepr', -3);
            registro.peso  := ffloat('peso', -3);
          end;

          if registro.FoundChanges then
            if registro.id = 0 then
              SqlExec(registro.SQLMotor('id').SQLInsertAutoInc)
            else
              SqlExec(registro.SQLMotor('id').SQLUpdate);
        end;

        dataSet.Next;
      end;

    finally
      prepare_loop_done();
    end;

    if transacao.InTransaction then
      transacao.Commit;
      
    Result := True;

  except on E: Exception do
    begin              
      if transacao.InTransaction then
        transacao.Rollback;

      Result := False;

      ShowErro('Erro ao salvar dados do frete por produto. Erro: ' + sLineBreak + e.Message);
      LogApp.Error('TDataSetNF.SaveProdutos %s', [e.Message]);
    end;
  end;
end;

end.
