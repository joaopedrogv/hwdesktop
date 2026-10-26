unit uClassesInterventor_ECF;

interface

uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls,
  IBStoredProc, IBQuery, RDPrint, StdCtrls;

const
  lado1: array[1..20] of string = ('Ordem de Operação (COO)', 'Reinício de Operação (CRO)',
    'Redução Z (CRZ)', 'Contador N PVC ou BP', 'Totalizador Geral (GT)', 'Venda Bruta Diária',
    'Cancelamento de ICMS', 'Desconto de ICMS', 'Acréscimo de ICMS', 'Cancelamento de ISSQN',
    'Desconto de ISSQN', 'Acréscimo de ISSQN', 'ISENTO (I) de ICMS', 'ISENTO (I) de ICMS',
    'ISENTO (I) de ICMS', 'Subst. Trib. (F) de ICMS', 'Subst. Trib. (F) de ICMS',
    'Subst. Trib. (F) de ICMS', 'Não-Incidência (N) ICMS', 'Não-Incidência (N) ICMS');
  lado2: array[1..20] of string = ('Não-Incidência (N) ICMS', 'Isento (IS) de ISSQN',
    'Isento (IS) de ISSQN', 'Isento (IS) de ISSQN', 'Subst. Trib. (PS) de ISS',
    'Subst. Trib. (PS) de ISS', 'Subst. Trib. (PS) de ISS', 'Não-Incidência (N) ISSQN',
    'Não-Incidência (N) ISSQN', 'Não-Incidência (N) ISSQN', 'S Tributado a ', 'S Tributado a ',
    'S Tributado a ', 'S Tributado a ', 'T Tributado a ', 'T Tributado a ', 'T Tributado a ',
    'T Tributado a ', 'T Tributado a ', 'T Tributado a ');
type
  TAtestado_ECF = class;
  TImpressoras_CNIEE_ATEST = class;

  TImpressoras_CNIEE_ATEST = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaImpCNIEE(CNIEE: string): boolean;
  end;

  TAtestado_ECF = class(TDataSet_OOP)
  private
    FcodEquip: integer;
    FnOS: integer;
    FcodCNIEE: string;
    procedure atribuirDadosAoFormulario;
    procedure atribuirDadosAosAtributos;
    function insert: boolean; override;
  public
    destructor Destroy; override;
    constructor create;
    procedure cadAtestado_ECF(n_os, cod_equip: integer);
    procedure confirmarAtestado(n_os, cod_equip: integer);
    function abreAtestadoManutencao: boolean;
    procedure limpar;
    function post: boolean; override;
    property nOS: integer read FnOS write FnOS;
    property codEquip: integer read FcodEquip write FcodEquip;
    property codCNIEE: string read FcodCNIEE write FcodCNIEE;
  var
    vImpCNIEE: TImpressoras_CNIEE_ATEST;
  end;

implementation

uses uDtmInterventor, IBDatabase, SysUtils, uAtestado_ECF, Classes, uDadosIni,
  Mask;

{ TAtestado_ECF }

function TAtestado_ECF.abreAtestadoManutencao: boolean;
begin
  Result := montaSelect('select * from atestado_ecf where' +
    ' n_os = ' + IntToStr(nOS) + ' and tipo = ' + QuotedStr('OS'));
  //    ' and cod_equip = ' + IntToStr(codEquip));
  //  FcodCNIEE := retornaValor('select equipamento.identificacao as valor' +
  //    ' from equipamento where equipamento.cod_equip = ' + IntToStr(codEquip));
  //  vImpCNIEE.selecionaImpCNIEE(FcodCNIEE);
  if dataSet.IsEmpty then
  begin
    Result := Insert;
  end
  else
    Result := Edit;
  atribuirDadosAoFormulario;
end;

procedure TAtestado_ECF.atribuirDadosAoFormulario;
var
  I: Integer;
  lista, lista2: TStringList;
begin
  if frmAtestado_ECF = nil then
    Exit;
  frmAtestado_ECF.MaskEdit1.Text := retornaValor('select equipamento.n_serie_fab as valor' +
    ' from equipamento where equipamento.cod_equip = ' + IntToStr(codEquip));

  //Valor Registrado ou Acumulado
  frmAtestado_ECF.StringGrid1.Cells[0, 0] := 'Contadores e Totalizadores';
  frmAtestado_ECF.StringGrid2.Cells[0, 0] := 'Totalizadores';
  frmAtestado_ECF.StringGrid1.Cells[1, 0] := 'Antes da Intervenção';
  frmAtestado_ECF.StringGrid2.Cells[1, 0] := 'Antes da Intervenção';
  frmAtestado_ECF.StringGrid1.Cells[2, 0] := 'Após a Intervenção';
  frmAtestado_ECF.StringGrid2.Cells[2, 0] := 'Após a Intervenção';

  for I := 1 to 20 do
  begin
    frmAtestado_ECF.StringGrid1.Cells[0, I] := lado1[I];
    frmAtestado_ECF.StringGrid2.Cells[0, I] := lado2[I];
  end;

  lista := TStringList.Create;
  lista2 := TStringList.Create;
  lista.Clear;
  lista2.Clear;
  lista.Text := dataSet.FieldByName('acumulados_antes').AsString;
  lista2.Text := dataSet.FieldByName('acumulados_depois').AsString;
  while lista.Count < 40 do
    lista.Add('');
  while lista2.Count < 40 do
    lista2.Add('');
  for I := 1 to 20 do
  begin
    frmAtestado_ECF.StringGrid1.Cells[1, I] := lista[I - 1];
    frmAtestado_ECF.StringGrid2.Cells[1, I] := lista[I - 1 + 20];
    frmAtestado_ECF.StringGrid1.Cells[2, I] := lista2[I - 1];
    frmAtestado_ECF.StringGrid2.Cells[2, I] := lista2[I - 1 + 20];
  end;

  lista.Clear;
  lista.Text := dataSet.FieldByName('totalizadores').AsString;
  while lista.Count < 10 do
    lista.Add('');
  for I := 0 to 9 do
    tmaskedit(frmAtestado_ECF.FindComponent('edTot' + IntToStr(I + 1))).text := lista[i];
  //Fim Valor Registrado ou Acumulado

  //Lacre

  frmAtestado_ECF.StringGrid4.Cells[0, 0] := 'Número';
  frmAtestado_ECF.StringGrid4.Cells[0, 1] := 'Cor Predominante';
  frmAtestado_ECF.StringGrid6.Cells[0, 0] := 'Número';
  frmAtestado_ECF.StringGrid6.Cells[0, 1] := 'Cor Predominante';

  lista.Clear;
  lista2.Clear;
  lista.Text := dataSet.FieldByName('lacreretirado').AsString;
  lista2.Text := dataSet.FieldByName('corretirado').AsString;
  while lista.Count < 3 do
    lista.Add('');
  while lista2.Count < 3 do
    lista2.Add('');
  for I := 1 to 3 do
  begin
    frmAtestado_ECF.StringGrid4.Cells[I, 0] := lista[I - 1];
    frmAtestado_ECF.StringGrid4.Cells[I, 1] := lista2[I - 1];
  end;

  lista.Clear;
  lista2.Clear;
  lista.Text := dataSet.FieldByName('lacreaplicado').AsString;
  lista2.Text := dataSet.FieldByName('coraplicado').AsString;
  while lista.Count < 3 do
    lista.Add('');
  while lista2.Count < 3 do
    lista2.Add('');
  for I := 1 to 3 do
  begin
    frmAtestado_ECF.StringGrid4.Cells[3 + I, 0] := lista[I - 1];
    frmAtestado_ECF.StringGrid4.Cells[3 + I, 1] := lista2[I - 1];
  end;

  lista.Clear;
  lista2.Clear;
  lista.Text := dataSet.FieldByName('lacreutil').AsString;
  lista2.Text := dataSet.FieldByName('corutil').AsString;
  while lista.Count < 6 do
    lista.Add('');
  while lista2.Count < 6 do
    lista2.Add('');
  for I := 1 to 6 do
  begin
    frmAtestado_ECF.StringGrid6.Cells[I, 0] := lista[I - 1];
    frmAtestado_ECF.StringGrid6.Cells[I, 1] := lista2[I - 1];
  end;
  //Fim Lacre

  //Servicos
  lista.Clear;
  frmAtestado_ECF.ListBox2.Items.Clear;
  lista.Text := dataSet.FieldByName('servicos').AsString;
  for I := 0 to lista.Count - 1 do
    frmAtestado_ECF.ListBox2.Items.Add(lista[i]);
  //Fim Serviços
end;

procedure TAtestado_ECF.atribuirDadosAosAtributos;
var
  I: Integer;
  lista, lista2: TStringList;
  vComponent: TComponent;
  vNomeComponent: string;
begin
  if frmAtestado_ECF = nil then
    Exit;

  lista := TStringList.Create;
  lista2 := TStringList.Create;
  lista.Clear;
  lista2.Clear;
  //Valor Registrado ou Acumulado
  for I := 1 to 20 do
  begin
    lista.Add(frmAtestado_ECF.StringGrid1.Cells[1, I]);
    lista2.Add(frmAtestado_ECF.StringGrid1.Cells[2, I]);
  end;
  for I := 1 to 20 do
  begin
    lista.Add(frmAtestado_ECF.StringGrid2.Cells[1, I]);
    lista2.Add(frmAtestado_ECF.StringGrid2.Cells[2, I]);
  end;
  dataSet.FieldByName('acumulados_antes').AsString := lista.Text;
  dataSet.FieldByName('acumulados_depois').AsString := lista2.Text;

  lista.Clear;
  for I := 0 to 9 do
    lista.Add(tmaskedit(frmAtestado_ECF.FindComponent('edTot' + IntToStr(I + 1))).text);
  dataSet.FieldByName('totalizadores').AsString := lista.Text;
  //Fim Valor Registrado ou Acumulado

  //Lacre
  lista.Clear;
  lista2.Clear;
  for I := 1 to 3 do
  begin
    lista.Add(frmAtestado_ECF.StringGrid4.Cells[I, 0]);
    lista2.Add(frmAtestado_ECF.StringGrid4.Cells[I, 1]);
  end;
  dataSet.FieldByName('lacreretirado').AsString := lista.Text;
  dataSet.FieldByName('corretirado').AsString := lista2.Text;

  lista.Clear;
  lista2.Clear;
  for I := 1 to 3 do
  begin
    lista.Add(frmAtestado_ECF.StringGrid4.Cells[3 + I, 0]);
    lista2.Add(frmAtestado_ECF.StringGrid4.Cells[3 + I, 1]);
  end;
  dataSet.FieldByName('lacreaplicado').AsString := lista.Text;
  dataSet.FieldByName('coraplicado').AsString := lista2.Text;

  lista.Clear;
  lista2.Clear;
  for I := 1 to 6 do
  begin
    lista.add(frmAtestado_ECF.StringGrid6.Cells[I, 0]); //:= lista[I-1];
    lista2.Add(frmAtestado_ECF.StringGrid6.Cells[I, 1]); // := lista2[I-1];
  end;
  dataSet.FieldByName('lacreutil').AsString := lista.Text;
  dataSet.FieldByName('corutil').AsString := lista2.Text;
  //Fim Lacre

  //Servicos
  dataSet.FieldByName('servicos').AsString :=
    frmAtestado_ECF.ListBox2.Items.Text;
  //Fim Serviços

end;

procedure TAtestado_ECF.cadAtestado_ECF(n_os, cod_equip: integer);
begin
  if frmAtestado_ECF = nil then
    Application.CreateForm(TfrmAtestado_ECF, frmAtestado_ECF);
  obAtestado.codEquip := cod_equip;
  obAtestado.codCNIEE := obAtestado.retornaValor('select equipamento.identificacao as valor' +
    ' from equipamento where equipamento.cod_equip = ' + IntToStr(obAtestado.codEquip));
  obAtestado.vImpCNIEE.selecionaImpCNIEE(obAtestado.codCNIEE);
  frmAtestado_ECF.MaskEdit1.Text := obAtestado.retornaValor('select equipamento.n_serie_fab as valor'
    +
    ' from equipamento where equipamento.cod_equip = ' + IntToStr(obAtestado.codEquip));
  if (n_OS <> obAtestado.nOS) then
  begin
    obAtestado.nOS := n_os;
    if not obAtestado.abreAtestadoManutencao then
    begin
      obAtestado.codEquip := 0;
      obAtestado.nOS := 0;
      Application.MessageBox('Não foi possivel abrir o atestado', 'Atenção', MB_OK +
        MB_ICONWARNING);
      exit;
    end;
  end
  else
  begin
    if not obAtestado.Active then
      obAtestado.abreAtestadoManutencao
    else if not (obAtestado.dataSet.State in [dsInsert, dsEdit]) then
    begin
      if obAtestado.dataSet.IsEmpty then
      begin
        obAtestado.Insert;
      end
      else
        obAtestado.Edit;
    end;
  end;
  frmAtestado_ECF.ShowModal;
end;

procedure TAtestado_ECF.confirmarAtestado(n_os, cod_equip: integer);
begin
  if obAtestado = nil then
    exit;
  if obAtestado.dataSet.ChangeCount > 0 then
  begin
    if not obAtestado.dataSet.Isempty then
    begin
      obAtestado.dataSet.edit;
      obAtestado.dataSet.FieldByName('N_OS').AsInteger := n_os;
      obAtestado.dataSet.FieldByName('cod_equip').AsInteger := cod_equip;
      obAtestado.dataSet.post;
    end;
    obAtestado.Apply;
  end;
  obAtestado.CommitaTransacao;
end;

constructor TAtestado_ECF.create;
begin
  if dtmInterventor = nil then
    dtmInterventor := TdtmInterventor.Create(dtmInterventor);
  dataSet := TClientDataSet(dtmInterventor.cdsAtestado);
  buscas := TIBQuery(dtmInterventor.qrBuscas);
  transacao := TIBTransaction(dtmInterventor.transacao);
  vImpCNIEE := TImpressoras_CNIEE_ATEST.create;
end;

destructor TAtestado_ECF.Destroy;
begin
  vImpCNIEE.Free;
  vImpCNIEE := nil;
  inherited;
end;

function TAtestado_ECF.insert: boolean;
begin
  if inherited insert then
  begin
    dataSet.FieldByName('n_os').AsInteger := nOS;
    dataSet.FieldByName('tipo').AsString := 'OS';
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('cod_equip').AsInteger := codEquip;
    dataSet.FieldByName('localintervencao').AsString := 'I';
    dataSet.FieldByName('perdadados_mt').AsString := 'N';
    dataSet.FieldByName('motivo_intervencao').AsString := 'L';
    dataSet.FieldByName('substituicao_sb').AsString := 'N';
    dataSet.FieldByName('datainicio').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('datafinal').AsDateTime := dataSet.FieldByName('datainicio').AsDateTime;
    dataSet.FieldByName('tipo_dispositivo').AsString := 'L';
    Result := true;
  end;
end;

procedure TAtestado_ECF.limpar;
begin
  dataSet.Cancel;
  while not dataSet.IsEmpty do
    dataSet.Delete;
  Insert;
  atribuirDadosAoFormulario;
end;

function TAtestado_ECF.post: boolean;
begin
  atribuirDadosAosAtributos;
  if dataSet.FieldByName('SUBSTITUICAO_SB').AsString = 'N' then
  begin
    dataSet.FieldByName('VERSAO_SB_ANT').AsString := '';
    dataSet.FieldByName('VERSAO_SB_ATUAL').AsString := '';
    dataSet.FieldByName('NUM_DISP_SB_ANT').AsString := '';
    dataSet.FieldByName('NUM_DISP_SB_ATUAL').AsString := '';
    dataSet.FieldByName('NUM_LACRE_SB_RET').AsString := '';
    dataSet.FieldByName('NUM_LACRE_SB_COLOCADO').AsString := '';
  end;
  dataSet.Post;
end;

{ TImpressoras_CNIEE_ATEST }

constructor TImpressoras_CNIEE_ATEST.create;
begin
  if dtmInterventor = nil then
    dtmInterventor := TdtmInterventor.Create(dtmInterventor);
  dataSet := TClientDataSet(dtmInterventor.cdsImpCNIEE);
  buscas := TIBQuery(dtmInterventor.qrBuscas);
  transacao := TIBTransaction(dtmInterventor.transacao);
end;

function TImpressoras_CNIEE_ATEST.selecionaImpCNIEE(CNIEE: string): boolean;
begin
  Result := montaSelect('select * from impressoras_cniee where identificacao = ' +
    QuotedStr(CNIEE));
end;

end.

