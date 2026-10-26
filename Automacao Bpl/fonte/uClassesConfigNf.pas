unit uClassesConfigNf;

interface

uses
  uDataSet_OOP, DB, Classes;

type
  TCabecalhonf = class;
  TItensConfignf2 = class;
  TConfignf = class;
  TCamposNf = class;

  TItensConfignf2 = class(TDataSet_OOP)
  public
    constructor create;
    function abreItensConfignf: boolean;
    function novoItem(codigo: integer; descricao: string): boolean;
    function alteraItem(codigo: integer; descricao: string): boolean;
    function removerItem: boolean;
    procedure salvaPosicao;
  end;

  TCabecalhonf = class(TDataSet_OOP)
  private
    Fentrelinhamento, Fcondensado: string;
    function abreFormEntrelinhamento: Boolean;
  public
    constructor create;
    function abreCabecalhonf: boolean;
    function selecionaNotaFiscalEmpresa: boolean;
    function edit: boolean; override;
    function insert: boolean; override;
    function delete: boolean; override;
    function post: boolean; override;
    function cancel: boolean; override;
    function abrelixeira: boolean;
    function statuslixeira: boolean;
    function restauralixeira: boolean;
    procedure CadCabecalhonf(Tipoform: Integer);
    procedure imprimirRegua;

  end;

  TCamposNF = class(TDataSet_OOP)
  public
    constructor create;
    function abreCamposNf: boolean; overload;
    function abreCamposNf(tabela:String): boolean; overload;
    function getCamposNotaFiscal: WideString;
    function getCamposOutraTabela(tabela: string): WideString;
    function adicionaParametro(indice, CodOrdemItem: integer): boolean;
    function adicionaCampoNotaFiscal(Campo: string; CodOrdemItem: integer): boolean;
    function adicionaOutrosCampo(tabela, campo: string; CodOrdemItem: integer): boolean;
    function removerTodasConfiguracoesDoCampo(CodOrdemItem: integer):boolean;
  end;

  TConfignf = class(TDataSet_OOP)
  private
    procedure CabecalhoAfterScroll(DataSet: TDataSet);
    procedure ItensConfigAfterScroll(DataSet: TDataSet);
    procedure CamposAfterScroll(DataSet: TDataSet);
    function SelecionaConfignf(vNf, vItem: string): boolean;
  public
    destructor Destroy; override;
    constructor create;
    function edit: boolean; override;
    function insert: boolean; override;
    function delete: boolean; override;
    function post: boolean; override;
    function abreFormConfigNf: boolean;
    function abreFormItensConfig: boolean;
    function abreFormCamposNf: boolean;
    function iniciaProcessoImpressaoNF: boolean;
    function alteraOrdem: Boolean;
  var
    vCab: TCabecalhonf;
    vItem: TItensConfignf2;
    vCampos: TCamposNF;
  end;

implementation

uses
  Forms, Windows, uDtmAtivo, uDtmConfigNf, SysUtils, UCadCabecalhonf, DBClient,
  IBQuery, IBDatabase, uPadrao, Controls, uDadosIni, RDprint, ExtCtrls,
  StdCtrls, uDtmNF, Dialogs;

{ TCabecalhonf }

function TCabecalhonf.abreCabecalhonf: boolean;
begin
  result := montaSelect('select * from Cabecalho_nf where ativo = 1');
end;

function TCabecalhonf.abreFormEntrelinhamento: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poMainFormCenter;
    formulario.Caption := 'Entrelinhamento';
    frmCadCabecalhonf.pnEntrelinhamento.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    try
    except
    end;
    result := (formulario.ShowModal = mrOk); //;then
    Fentrelinhamento := frmCadCabecalhonf.cbEntrelinhamento.Text;
    Fcondensado := frmCadCabecalhonf.cbCondensado.Text;
  finally
    frmCadCabecalhonf.pnEntrelinhamento.Parent := frmCadCabecalhonf.tsEntrelinhamento;
    formulario.Free;
    formulario := nil;
  end;
end;

function TCabecalhonf.abrelixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    result := false;
  end
  else
    result := montaSelect('SELECT * FROM Cabecalho_nf WHERE ativo = 0');
end;

procedure TCabecalhonf.CadCabecalhonf(Tipoform: Integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if DtmConfigNf = nil then
    DtmConfigNf := TdtmConfigNf.Create(DtmConfigNf);

  if frmCadCabecalhonf = nil then
    Application.CreateForm(TfrmCadCabecalhonf, frmCadCabecalhonf);
  frmCadCabecalhonf.Show;
end;

function TCabecalhonf.cancel: boolean;
begin
  if (dataSet.State in [dsEdit, dsInsert]) then
  begin
    dataSet.Cancel;
    RollBackTransacao;
    result := true;
  end;
end;

constructor TCabecalhonf.create;
begin
  dataSet := TClientDataSet(DtmConfigNf.cdsCabecalhonf);
  buscas := tibquery(DtmConfigNf.qrBuscas);
  transacao := tibtransaction(DtmConfigNf.transacao);
end;

function TCabecalhonf.delete: boolean;
begin
  result := false;
  if dataSet.IsEmpty then
    exit;

  if dataSet.FieldByName('ATIVO').AsInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
      dataSet.Delete;
    if Apply then
      if CommitaTransacao then
        result := true;
  end
  else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
    if Edit then
    begin
      dataSet.FieldByName('ATIVO').asinteger := 0;
      dataSet.Post;
      if Apply then
        if CommitaTransacao then
          result := true;
    end;
  end;
  Refresh;
end;

function TCabecalhonf.edit: boolean;
begin
  if not dataSet.Active then
    montaSelect('select * from Cabecalho_nf where 1 = 0');
  if inherited Edit then
    result := true;
end;

procedure TCabecalhonf.imprimirRegua;
var
  vRdp: TRdprint;
  I, Linha, TLinha: Integer;
begin
  if Application.MessageBox(pchar('Coloque um Modelo de sua Nota Fiscal na Impressora' + chr(13) +
    'Para a impressão da Regua de Configuração'), 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES
    then
  begin
    vRdp := TRDprint(dtmConfigNf.RDPRINT1);
    abreFormEntrelinhamento;
    buscas.Close;
    buscas.sql.text :=
      'select E.TAMANHOLETRA, E.QTDE_LINHASNF, E.PORTA_IMPRESSAO from empresa e where cod_empresa = ' +
      vDadosIni.codEmpresa;
    buscas.open;
    try
      vRdp.TamanhoQteLinhas := dataSet.FieldByName('QTDELINHA').AsInteger;
      vRdp.PortaComunicacao := buscas.FieldByName('PORTA_IMPRESSAO').AsString;

      if dataSet.FieldByName('tamanhofonte').AsString = 'S05cpp' then
        vRdp.FonteTamanhoPadrao := S05cpp;

      if dataSet.FieldByName('tamanhofonte').AsString = 'S10cpp' then
        vRdp.FonteTamanhoPadrao := S10cpp;

      if dataSet.FieldByName('tamanhofonte').AsString = 'S12cpp' then
        vRdp.FonteTamanhoPadrao := S12cpp;

      if dataSet.FieldByName('tamanhofonte').AsString = 'S17cpp' then
        vRdp.FonteTamanhoPadrao := S17cpp;

      if dataSet.FieldByName('tamanhofonte').AsString = 'S20cpp' then
        vRdp.FonteTamanhoPadrao := S20cpp;
      buscas.Close;
      TLinha := vRdp.TamanhoQteLinhas;
      vRdp.Abrir;

      // Teste do Entrelinhamento
      if Fentrelinhamento = 'Linha 1/8"' then
      begin
        vRdp.Imp(1, 1, chr(27) + chr(64));
        vRdp.Imp(1, 1, chr(27) + chr(120) + '0');
        vRdp.Imp(1, 1, chr(27) + '0');
      end
      else
        if Fentrelinhamento = 'Linha 7/72"' then
          vRdp.Imp(1, 1, chr(27) + '1')
        else
          if Fentrelinhamento = 'Linha 1/6"' then
            vRdp.Imp(1, 1, chr(27) + '2')
          else
            if (Fentrelinhamento = 'NORMAL') or (Fentrelinhamento = '') then
              vRdp.Imp(1, 1, chr(27) + chr(64));
      //
      Linha := 1;
      if Fcondensado = 'SIM' then
        vRdp.Imp(Linha, 1, chr(15) +
          '1...5....1....5....2....5....3....5....4....5....5....5....6....5....7....5....8....5....9....5....1....5....1....5....2....5....3' +
          chr(18))
      else
        vRdp.Imp(Linha, 1,
          '1...5....1....5....2....5....3....5....4....5....5....5....6....5....7....5....8');
      TLinha := TLinha - Linha;
      for I := 1 to TLinha do
      begin
        Linha := Linha + 1;
        if Fcondensado = 'SIM' then
          vRdp.Imp(Linha, 1, chr(15) + IntToStr(Linha) + chr(18))
        else
          vRdp.Imp(Linha, 1, IntToStr(Linha));
      end;
      vRdp.Fechar;
    except
      Application.MessageBox(pchar('Erro ao Imprimir Regua' + chr(13) +
        'Erro com a Impressão da Regua de Configuração'), 'Erro', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;
end;

function TCabecalhonf.insert: boolean;
begin
  result := false;
  if not dataSet.Active then
    montaSelect('select * from Cabecalho_nf where 1 = 0');

  if inherited insert then
    result := true;
end;

function TCabecalhonf.post: boolean;
begin
  try
    if not (dataset.State in [dsedit, dsinsert]) then
      exit;

    if Trim(dataSet.FieldByName('NOME_NF').asString) = '' then
      raise Exception.Create('Campo Nome Nota Fiscal não pode ser vazio.');
    if Trim(dataSet.FieldByName('QTDELINHA').asString) = '' then
      raise Exception.Create('Campo Qtde Linha não pode ser vazio.');
    if Trim(dataSet.FieldByName('TAMANHOFONTE').asString) = '' then
      raise Exception.Create('Campo Tamanho da Fonte não pode ser vazio.');
    if Trim(dataSet.FieldByName('ENTRELINHAMENTO').asString) = '' then
      raise Exception.Create('Campo Entrelinhamento não pode ser vazio.');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('Codigo').asInteger := Gencodigo('CABECALHO_NF',
        DtmConfigNf.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
    begin
      if CommitaTransacao then
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := FALSE;
    end;
    Refresh;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TCabecalhonf.restauralixeira: boolean;
begin
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
      begin
        if Edit then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          DataSet.Post;
          if Apply then
            CommitaTransacao;
        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + chr(13) +
        'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);

  Refresh;
end;

function TCabecalhonf.selecionaNotaFiscalEmpresa: boolean;
begin
  result := montaSelect('select * from Cabecalho_nf where ativo = 1' +
    ' and codigo = ' + IntToStr(vDadosIni.vEmp.vNotaFiscal));
end;

function TCabecalhonf.statuslixeira: boolean;
begin
  result := ExecutaComandosSql('SELECT * FROM Cabecalho_nf where ativo = 0');
end;

{ TConfignf }

function TConfignf.abreFormCamposNf: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poMainFormCenter;
    formulario.Caption := 'Campos de Impressão';
    frmCadCabecalhonf.pnCamposNf.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    try

    except
    end;
    result := (formulario.ShowModal = mrOk); //;then
  finally
    frmCadCabecalhonf.pnCamposNf.Parent := frmCadCabecalhonf.tsCamposNf;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConfignf.abreFormConfigNf: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poMainFormCenter;
    formulario.Caption := 'Itens de Impressão da Nota Fiscal';
    frmCadCabecalhonf.pnConfigNf.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    try
      vItem.dataSet.AfterScroll := ItensConfigAfterScroll;
      vCab.dataSet.AfterScroll := CabecalhoAfterScroll;
      //      vCab.abreCabecalhonf;
      vItem.abreItensConfignf;
    except
    end;
    result := (formulario.ShowModal = mrOk); //;then
  finally
    frmCadCabecalhonf.pnConfigNf.Parent := frmCadCabecalhonf.tsConfigNf;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConfignf.abreFormItensConfig: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poMainFormCenter;
    formulario.Caption := 'Itens de Impressão da Nota Fiscal';
    frmCadCabecalhonf.pnItensConfigNf.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    try
      vItem.abreItensConfignf;
    except
    end;
    result := (formulario.ShowModal = mrOk); //;then
  finally
    frmCadCabecalhonf.pnItensConfigNf.Parent := frmCadCabecalhonf.tsItensConfigNf;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConfignf.alteraOrdem: Boolean;
var
  vOrdem: string;
begin
  if (not dataSet.Active) or (dataSet.IsEmpty) or (dataSet.State <> dsBrowse) then
    Exit;

  dataSet.Edit;

  vOrdem := IntToStr(dataSet.FieldByName('ordem_cfg').AsInteger);

  if not InputQuery('Ordem do campo', 'Informe o número de ordem do campo', vOrdem) then
    Exit;

  try
    StrToInt(vOrdem);
  except
    Exit;
  end;

  dataSet.Edit;
  dataSet.FieldByName('ordem_cfg').AsInteger := StrToInt(vOrdem);
  dataSet.Post;
  if Apply then
    CommitaTransacao
  else
    RollBackTransacao;
end;

procedure TConfignf.CabecalhoAfterScroll(DataSet: TDataSet);
begin
  SelecionaConfignf(vCab.dataSet.FieldByName('codigo').AsString,
    vItem.dataSet.FieldByName('codigo').AsString);
end;

procedure TConfignf.CamposAfterScroll(DataSet: TDataSet);
begin
  SelecionaConfignf(vCab.dataSet.FieldByName('codigo').AsString,
    vCampos.dataSet.FieldByName('nordem_camp').AsString);
end;

constructor TConfignf.create;
begin
  if DtmConfigNf = nil then
    DtmConfigNf:= TDtmConfigNf.create(DtmConfigNf);
  dataSet := TClientDataSet(DtmConfigNf.cdsConfignf);
  buscas := TIBQuery(DtmConfigNf.qrBuscas);
  transacao := TIBTransaction(DtmConfigNf.transacao);
  vCab := TCabecalhonf.create;
  vItem := TItensConfignf2.create;
  vCampos := TCamposNF.create;
end;

function TConfignf.delete: boolean;
begin
  result := false;
  if dataSet.IsEmpty then
    exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    dataSet.Delete;
  end;
  if Apply then
    if CommitaTransacao then
      result := true;

  Refresh;
end;

destructor TConfignf.Destroy;
begin
  vCab.free;
  vItem.free;
  vCampos.free;
  vCab := nil;
  vItem := nil;
  vCampos := nil;
  inherited;
end;

function TConfignf.edit: boolean;
begin
  if (not dataSet.Active) or (dataSet.IsEmpty) or (dataSet.State <> dsBrowse) then
    result := False
  else
    Result := inherited edit;
end;

function TConfignf.iniciaProcessoImpressaoNF: boolean;
begin
  vCab.dataSet.AfterScroll := nil;
  vItem.dataSet.AfterScroll := nil;
  vCampos.dataSet.AfterScroll := CamposAfterScroll;
  vCab.selecionaNotaFiscalEmpresa;
  vCampos.abreCamposNf;
  Result := ExecutaComandosSql('select first 1 cod_notafiscal from Config_nf where COD_NOTAFISCAL = ' +
    IntToStr(vCab.dataSet.FieldByName('codigo').AsInteger) + ' and Ativo = 1');
end;

function TConfignf.insert: boolean;
begin
  result := false;
  if not dataSet.Active then
    montaSelect('select * from Config_nf where 1 = 0');
  if dataSet.state = dsBrowse then
    result := inherited insert;
  if Result then
  begin
    dataSet.FieldByName('cod_item').AsInteger := vItem.dataSet.FieldByName('codigo').AsInteger;
    dataSet.FieldByName('cod_notafiscal').AsInteger := vCab.dataSet.FieldByName('codigo').AsInteger;
    dataSet.FieldByName('ordem_cfg').AsInteger := dataSet.RecordCount + 1;
    dataSet.FieldByName('condensado').AsInteger := 1;
    dataSet.FieldByName('negrito').AsInteger := 0;
  end;
end;

procedure TConfignf.ItensConfigAfterScroll(DataSet: TDataSet);
begin
  SelecionaConfignf(vCab.dataSet.FieldByName('codigo').AsString,
    vItem.dataSet.FieldByName('codigo').AsString);
end;

function TConfignf.post: boolean;
begin
  try
    if not (dataset.State in [dsedit, dsinsert]) then
      exit;

    if Trim(dataSet.FieldByName('COD_NOTAFISCAL').asString) = '' then
      raise Exception.Create('Campo Nota Fiscal não pode ser vazio.');
    //if Trim (dataSet.FieldByName('COD_ITEM').asString) = '' then
    //   raise Exception.Create('Campo Item não pode ser vazio.');
    if Trim(dataSet.FieldByName('ORDEM_CFG').asString) = '' then
      raise Exception.Create('Campo Ordem não pode ser vazio.');
    if Trim(dataSet.FieldByName('LINHA_CFG').asString) = '' then
      raise Exception.Create('Campo Linha não pode ser vazio.');
    if Trim(dataSet.FieldByName('COLUNA_CFG').asString) = '' then
      raise Exception.Create('Campo Coluna não pode ser vazio.');
    if Trim(dataSet.FieldByName('CONDENSADO').asString) = '' then
      raise Exception.Create('Campo Condensado não pode ser vazio.');
    if Trim(dataSet.FieldByName('NEGRITO').asString) = '' then
      raise Exception.Create('Campo Negrito não pode ser vazio.');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('Seqcfgnota').asInteger := Gencodigo('CONFIG_NF',
        DtmConfigNf.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    result := inherited post;
    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
    begin
      if CommitaTransacao then
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := FALSE;
    end;
    Refresh;

    //    Application.MessageBox('Configuração salva com sucesso !', 'Informação',
    //      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);

  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TConfignf.SelecionaConfignf(vnf, vItem: string): boolean;
var
  v1, v2: string;
begin
  if (vnf = '') or (vItem = '') then
    exit;
  Cancel;
  result := montaSelect('select * from Config_nf where COD_NOTAFISCAL = ' + vnf + ' and cod_item = '
    + vItem + ' and Ativo = 1 order by ordem_cfg');
end;

{ TItensConfignf2 }

function TItensConfignf2.abreItensConfignf: boolean;
begin
//  result := montaSelect('select * from Itens_Config_nf where ativo = 1 order by ordem');
  result := montaSelect('select icn.*,(select count(codigo) from camposnf  where nordem_camp = icn.codigo and tipo_nota = 10) IMP' +
                        ' from Itens_Config_nf icn' +
                        ' where ativo = 1 order by codigo');
end;

function TItensConfignf2.alteraItem(codigo: integer;
  descricao: string): boolean;
begin
  try
    if Trim(descricao) = '' then
      raise Exception.Create('Campo Descrição não pode ser vazio.');
    if codigo = 0 then
      raise Exception.Create('Campo Código deve ser informado');
    dataSet.Edit;
    dataSet.FieldByName('DESCRICAO').AsString := descricao;
    //    dataSet.FieldByName('codigo').AsInteger := codigo;
    dataset.Post;
    if Apply then
      result := CommitaTransacao
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := FALSE;
    end;
    Refresh;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

constructor TItensConfignf2.create;
begin
  dataSet := TClientDataSet(DtmConfigNf.cdsItensConfignf);
  buscas := tibquery(DtmConfigNf.qrBuscas);
  transacao := tibtransaction(DtmConfigNf.transacao);
end;

function TItensConfignf2.novoItem(codigo: integer; descricao: string): boolean;
begin
  try
    if Trim(descricao) = '' then
      raise Exception.Create('Campo Descrição não pode ser vazio.');
    if codigo = 0 then
      raise Exception.Create('Campo Código deve ser informado');
    dataSet.Insert;
    dataSet.FieldByName('DESCRICAO').AsString := descricao;
    dataSet.FieldByName('codigo').AsInteger := codigo;
    dataset.Post;
    if Apply then
      result := CommitaTransacao
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := FALSE;
    end;
    Refresh;
  except
    on e: Exception do begin
      Result := false;
      Cancel;
      if Pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Erro. Registro em Duplicidade com o mesmo código ', 'Atenção',
          MB_ICONERROR + MB_OK)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TItensConfignf2.removerItem: boolean;
begin
  try
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
      dataSet.Delete;
    if Apply then
      if CommitaTransacao then
        result := true;
    Refresh;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TItensConfignf2.salvaPosicao;
begin
  if dataSet.ChangeCount > 0 then
    if Apply then
      CommitaTransacao;
end;

{ TCamposNF }

function TCamposNF.abreCamposNf: boolean;
begin
//  Result := montaSelect('select cbf.porta_impressao, cbf.entrelinhamento,' +
//    ' cn.nordem_camp, cn.tabela, cn.descricao_camp,' +
//    ' cnf.linha_cfg,  cnf.coluna_cfg, cnf.condensado, cnf.maxlinhas, cnf.negrito,'+
//    ' cnf.tamanho_campo, cnf.ordem_cfg' +
//    ' from camposnf cn' +
//    ' inner join itens_config_nf itn on itn.ordem = cn.nordem_camp' +
//    ' inner join config_nf cnf on cnf.cod_item = itn.codigo' +
//    ' inner join cabecalho_nf cbf on cbf.codigo = cnf.cod_notafiscal' +
//    ' where cbf.codigo = ' +IntToStr(vDadosIni.vEmp.vNotaFiscal)+
//    ' and cn.tipo_nota = 10' +
//    ' order by itn.ordem, cnf.ordem_cfg');
  Result := montaSelect('select cbf.porta_impressao, cbf.entrelinhamento,' +
    ' cn.nordem_camp, cn.tabela, cn.descricao_camp,' +
    ' cnf.linha_cfg,  cnf.coluna_cfg, cnf.condensado, cnf.maxlinhas, cnf.negrito,'+
    ' cnf.tamanho_campo, cnf.ordem_cfg' +
    ' from camposnf cn' +
    ' inner join itens_config_nf itn on itn.codigo = cn.nordem_camp' +
    ' inner join config_nf cnf on cnf.cod_item = itn.codigo' +
    ' inner join cabecalho_nf cbf on cbf.codigo = cnf.cod_notafiscal' +
    ' where cbf.codigo = ' +IntToStr(vDadosIni.vEmp.vNotaFiscal)+
    ' and cn.tipo_nota = 10' +
    ' order by cn.nordem_camp, cnf.ordem_cfg');
//  Result := montaSelect('SELECT * FROM CAMPOSNF' +
//    ' WHERE TIPO_NOTA = 10 AND NORDEM_CAMP IS NOT NULL' +
//    ' ORDER BY NORDEM_CAMP');
end;

function TCamposNF.abreCamposNf(tabela: String): boolean;
begin
  Result := montaSelect('select cbf.porta_impressao, cbf.entrelinhamento,' +
    ' cn.nordem_camp, cn.tabela, cn.descricao_camp,' +
    ' cnf.linha_cfg,  cnf.coluna_cfg, cnf.condensado, cnf.maxlinhas, cnf.negrito,'+
    ' cnf.tamanho_campo, cnf.ordem_cfg' +
    ' from camposnf cn' +
    ' inner join itens_config_nf itn on itn.codigo = cn.nordem_camp' +
    ' inner join config_nf cnf on cnf.cod_item = itn.codigo' +
    ' inner join cabecalho_nf cbf on cbf.codigo = cnf.cod_notafiscal' +
    ' where cbf.codigo = ' +IntToStr(vDadosIni.vEmp.vNotaFiscal)+
    ' and cn.tipo_nota = 10' +
    ' and cn.tabela = '+QuotedStr(tabela)+
    ' order by cn.nordem_camp, cnf.ordem_cfg');
end;

function TCamposNF.adicionaCampoNotaFiscal(Campo: string; CodOrdemItem: integer): boolean;
var
  vCampo: string;
  I: Integer;
begin
  for I := 0 to dtmNF.cdsNf.FieldCount - 1 do
    if Campo = dtmNF.cdsNf.Fields[i].DisplayName then
    begin
      vCampo := dtmNF.cdsNf.Fields[i].FieldName;
      ExecutaComandosSqlExec('delete from camposnf where nordem_camp = ' + IntToStr(CodOrdemItem) +
        ' and tipo_nota = 10 and tabela = ' + QuotedStr('NOTAFISCAL') + ' and descricao_camp = '
        + QuotedStr(vCampo));
      ExecutaComandosSqlExec('insert into camposnf' +
        '(tipo_nota, descricao_camp, tabela, nordem_camp)' +
        ' values ' +
        ' ( 10, ' + QuotedStr(vCampo) + ', ' +
        QuotedStr('NOTAFISCAL') + ', ' + IntToStr(CodOrdemItem) + ');');
      CommitaTransacao;
      Break;
    end;
end;

function TCamposNF.adicionaOutrosCampo(tabela, campo: string; CodOrdemItem: integer): boolean;
var
  vCampo, vTabela: string;
  I: Integer;
  vdt: TClientDataSet;
begin
  if tabela = 'Itens da Nota Fiscal' then
  begin
    vdt := TClientDataSet(dtmNF.cdsINf);
    vTabela := 'NOTAFISCAL_ITEM';
  end
  else if tabela = 'Serviços da Nota Fiscal' then
  begin
    vdt := TClientDataSet(dtmNF.cdsINf);
    vTabela := 'NOTAFISCAL_ITEM_S';
  end
  else if tabela = 'Clientes / Fornecedor' then
  begin
    vdt := TClientDataSet(dtmNF.cdsClF);
    vTabela := 'CLIENTES';
  end
  else if tabela = 'Natureza de Operação' then
  begin
    vdt := TClientDataSet(dtmNF.cdsNatOp);
    vTabela := 'NAT_OP';
  end
  else if tabela = 'Transportador' then
  begin
    vdt := TClientDataSet(dtmNF.cdsTranspNf);
    vTabela := 'TRANSPORTADOR';
  end
  else if tabela = 'Condição de Pagamento' then
  begin
    vdt := TClientDataSet(dtmNF.cdsCPag);
    vTabela := 'COND_PAG';
  end
  else if tabela = 'Faturas' then
  begin
    vdt := TClientDataSet(dtmNF.cdsbolnf);
    vTabela := 'BOLETAS';
  end
  else
  begin
    ExecutaComandosSqlExec('delete from camposnf where nordem_camp = ' + IntToStr(CodOrdemItem) +
      ' and tipo_nota = 10 and tabela = ' + QuotedStr(UpperCase('FK_' + tabela)) + ' and descricao_camp = '
      + QuotedStr(UpperCase(Campo)));
    ExecutaComandosSqlExec('insert into camposnf' +
      '(tipo_nota, descricao_camp, tabela, nordem_camp)' +
      ' values ' +
      ' ( 10, ' + QuotedStr(UpperCase(Campo)) + ', ' +
      QuotedStr(UpperCase('FK_' + Tabela)) + ', ' + IntToStr(CodOrdemItem) + ');');
    CommitaTransacao;
    exit;
  end;
  for I := 0 to vdt.FieldCount - 1 do
    if Campo = vdt.Fields[i].DisplayName then
    begin
      vCampo := vdt.Fields[i].FieldName;
      ExecutaComandosSqlExec('delete from camposnf where nordem_camp = ' + IntToStr(CodOrdemItem) +
        ' and tipo_nota = 10 and tabela = ' + QuotedStr('FK_' + vTabela) + ' and descricao_camp = '
        + QuotedStr(vCampo));
      ExecutaComandosSqlExec('insert into camposnf' +
        '(tipo_nota, descricao_camp, tabela, nordem_camp)' +
        ' values ' +
        ' ( 10, ' + QuotedStr(vCampo) + ', ' +
        QuotedStr('FK_' + vTabela) + ', ' + IntToStr(CodOrdemItem) + ');');
      CommitaTransacao;
      Break;
    end;
end;

function TCamposNF.adicionaParametro(indice, CodOrdemItem: integer): boolean;
var
  campo: string;
begin
  if indice = 0 then
    campo := 'HORA'
  else if indice = 1 then
    campo := 'DATA'
  else if indice = 2 then
    campo := 'VALOR_EXTENSO'
  else if indice = 3 then
    campo := 'X NF SAIDA'
  else if indice = 4 then
    campo := 'X NF ENTRADA'
  else if indice = 5 then
    campo := 'CAMPOFIXO';
  ExecutaComandosSqlExec('delete from camposnf where nordem_camp = ' + IntToStr(CodOrdemItem) +
    ' and tipo_nota = 10 and tabela = ' + QuotedStr('@' + campo) + ' and descricao_camp = '
    + QuotedStr(campo));
  ExecutaComandosSqlExec('insert into camposnf' +
    '(tipo_nota, descricao_camp, tabela, nordem_camp)' +
    ' values ' +
    ' ( 10, ' + QuotedStr(campo) + ', ' +
    QuotedStr('@' + campo) + ', ' + IntToStr(CodOrdemItem) + ');');
  CommitaTransacao;
end;

constructor TCamposNF.create;
begin
  dataSet := TClientDataSet(DtmConfigNf.cdsCamposNf);
  buscas := TIBQuery(DtmConfigNf.qrBuscas);
  transacao := TIBTransaction(DtmConfigNf.transacao);
end;

function TCamposNF.getCamposNotaFiscal: WideString;
var
  vLista: TStringList;
  I: Integer;
begin
  if dtmNF = nil then
    dtmNF := TdtmNF.Create(dtmNF);
  vLista := TStringList.Create;
  try
    vLista.Clear;
    for I := 0 to dtmNF.cdsNf.FieldCount - 1 do
      vLista.Add(dtmNF.cdsNf.Fields[i].DisplayName);
    Result := vLista.Text;
  finally
    vLista.Free;
    vLista.Clear;
  end;
end;

function TCamposNF.getCamposOutraTabela(tabela: string): WideString;
var
  vLista: TStringList;
  I: Integer;
  vdt: TClientDataSet;
begin
  if dtmNF = nil then
    dtmNF := TdtmNF.Create(dtmNF);
  vLista := TStringList.Create;
  try
    vLista.Clear;
    if (tabela = 'Itens da Nota Fiscal') or (tabela = 'Serviços da Nota Fiscal') then
      vdt := TClientDataSet(dtmNF.cdsINf)
    else if tabela = 'Clientes / Fornecedor' then
      vdt := TClientDataSet(dtmNF.cdsClF)
    else if tabela = 'Natureza de Operação' then
      vdt := TClientDataSet(dtmNF.cdsNatOp)
    else if tabela = 'Transportador' then
      vdt := TClientDataSet(dtmNF.cdsTranspNF)
    else if tabela = 'Condição de Pagamento' then
      vdt := TClientDataSet(dtmNF.cdsCPag)
    else if tabela = 'Faturas' then
      vdt := TClientDataSet(dtmNF.cdsbolnf)
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select rdb$field_name from rdb$relation_fields' +
       ' where ( rdb$system_flag = 0 or rdb$system_flag is null)' +
       ' and rdb$relation_name = '+QuotedStr(UpperCase(tabela))+
       ' and rdb$field_name <> ''ATIVO'' order by 1';
      buscas.Open;
      if not buscas.IsEmpty then
        while not buscas.Eof do
        begin
          vLista.Add(Trim(buscas.Fields[0].AsString));
          buscas.Next;
        end;
        buscas.Close;
      Result := vLista.Text;
      exit;
    end;
    for I := 0 to vdt.FieldCount - 1 do
      vLista.Add(vdt.Fields[i].DisplayName);
    Result := vLista.Text;
  finally
    vLista.Free;
    vLista.Clear;
  end;
end;

function TCamposNF.removerTodasConfiguracoesDoCampo(CodOrdemItem: integer): boolean;
begin
  ExecutaComandosSqlExec('delete from camposnf where nordem_camp = ' + IntToStr(CodOrdemItem) +
        ' and tipo_nota = 10');
  CommitaTransacao;
end;

end.

