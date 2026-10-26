unit uCadNf_AjustesFiscais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, DBCtrls, Mask, Buttons, Grids, DBGrids,
  ExtCtrls, uClassesNotasFiscais_infoadfisco, uDataSet_OOP, DBClient, DB,
  uEditHw, Spin, Menus;

type
  TSelecaoNotaFiscal = function (pCod_nf: integer): Boolean of object;
  TfrmCadNF_AjustesFiscais = class(TfrmPadrao)
    pn_principal: TPanel;
    pageprinc: TPageControl;
    tab_ajustesC197: TTabSheet;
    pnConsultaC195_C197: TPanel;
    GroupBox69: TGroupBox;
    DBGrid29: TDBGrid;
    Panel96: TPanel;
    btEspelhoCalc: TSpeedButton;
    BitBtn103: TBitBtn;
    BitBtn104: TBitBtn;
    BitBtn105: TBitBtn;
    BitBtn106: TBitBtn;
    BitBtn107: TBitBtn;
    tab_ajustes1921: TTabSheet;
    tab_itensnf: TTabSheet;
    pnItensLancF: TPanel;
    grItensLancF: TGroupBox;
    Panel97: TPanel;
    DBGrid30: TDBGrid;
    Panel99: TPanel;
    Panel91: TPanel;
    BitBtn108: TBitBtn;
    BitBtn109: TBitBtn;
    tab_espelhocalc: TTabSheet;
    Panel71: TPanel;
    pnEspelhoCalcAntSt: TPanel;
    GroupBox101: TGroupBox;
    DBGrid53: TDBGrid;
    Panel101: TPanel;
    BitBtn190: TBitBtn;
    ckMostrarApenasComST: TCheckBox;
    memo_espelho_calc: TMemo;
    DBMemo22: TDBMemo;
    tab_novosajuestesauto: TTabSheet;
    pn_ajustesauto: TPanel;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    gridC197: TDBGrid;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    grid1921: TDBGrid;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    tab_novoC197: TTabSheet;
    pnCadastroC195197: TPanel;
    Panel93: TPanel;
    Label424: TLabel;
    Label425: TLabel;
    Label426: TLabel;
    Label427: TLabel;
    Label428: TLabel;
    Label429: TLabel;
    Label430: TLabel;
    Label423: TLabel;
    Label431: TLabel;
    Label432: TLabel;
    SpeedButton32: TSpeedButton;
    SpeedButton37: TSpeedButton;
    Panel94: TPanel;
    BitBtn101: TBitBtn;
    BitBtn102: TBitBtn;
    DBEdit231: TDBEdit;
    DBEdit232: TDBEdit;
    DBEdit233: TDBEdit;
    DBEdit234: TDBEdit;
    DBEdit235: TDBEdit;
    DBLookupComboBox13: TDBLookupComboBox;
    DBComboBox13: TDBComboBox;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Panel5: TPanel;
    grid1921cad: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    tab_novo1921: TTabSheet;
    pn_novo1921: TPanel;
    Panel1: TPanel;
    Panel6: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditHw1: TEditHw;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    EditHw2: TEditHw;
    tab_lista: TTabSheet;
    pn_sumario: TPanel;
    Panel8: TPanel;
    Panel7: TPanel;
    gridSumAjustes: TDBGrid;
    Label6: TLabel;
    edMEs: TSpinEdit;
    edAnoo: TSpinEdit;
    Label7: TLabel;
    Label8: TLabel;
    edEmissao: TComboBox;
    Label9: TLabel;
    edES: TComboBox;
    Label10: TLabel;
    edNumero: TComboBox;
    Label11: TLabel;
    edCodAjC197: TComboBox;
    edCodAj1921: TComboBox;
    Label12: TLabel;
    btProcuraNotas: TSpeedButton;
    btLockProcuraNotas: TSpeedButton;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    lb_vlcontabil: TLabel;
    Label15: TLabel;
    lb_bcicms: TLabel;
    Label17: TLabel;
    lb_vlicms: TLabel;
    Label19: TLabel;
    lb_vlajc197: TLabel;
    lb_vlaj1921: TLabel;
    Label22: TLabel;
    PopupMenu1: TPopupMenu;
    Exportarparaplanilha1: TMenuItem;
    NovoajustefiscalpordocumentoC1971: TMenuItem;
    NovoajustefiscalpordocumentoC1972: TMenuItem;
    NovoajustedeSubapuraodoICMS19211: TMenuItem;
    N1: TMenuItem;
    AlterarajustefiscalC1971: TMenuItem;
    AlterarajustefiscalC1972: TMenuItem;
    N2: TMenuItem;
    Verificarajustesautomticosdodocumento1: TMenuItem;
    Verificarajustesautomticosdetodososdocumentosdalista1: TMenuItem;
    N3: TMenuItem;
    RemoverajustefiscalC1971: TMenuItem;
    Removerajus1: TMenuItem;
    RemovertodososajustesdalistaapenasosregistrosC1971: TMenuItem;
    Removertodososajustesdalistaapenasosregistros19211: TMenuItem;
    Selecionarnotafiscalparaalterarajustes1: TMenuItem;
    N4: TMenuItem;
    Selecionarregistro1: TMenuItem;
    Selecionartodos1: TMenuItem;
    Removerseleodoregistro1: TMenuItem;
    Removerseleodetodososregistro1: TMenuItem;
    N5: TMenuItem;
    Panel9: TPanel;
    Label14: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label16: TLabel;
    Label18: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    Label20: TLabel;
    Label21: TLabel;
    DBText5: TDBText;
    Panel10: TPanel;
    Label23: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    Label24: TLabel;
    Label25: TLabel;
    DBText8: TDBText;
    DBText9: TDBText;
    Label26: TLabel;
    Label27: TLabel;
    DBText10: TDBText;
    N6: TMenuItem;
    btAcoes: TSpeedButton;
    procedure btAcoesClick(Sender: TObject);
    procedure Removertodososajustesdalistaapenasosregistros19211Click(
      Sender: TObject);
    procedure RemovertodososajustesdalistaapenasosregistrosC1971Click(
      Sender: TObject);
    procedure Removerseleodetodososregistro1Click(Sender: TObject);
    procedure Removerseleodoregistro1Click(Sender: TObject);
    procedure Selecionartodos1Click(Sender: TObject);
    procedure Selecionarregistro1Click(Sender: TObject);
    procedure Selecionarnotafiscalparaalterarajustes1Click(Sender: TObject);
    procedure Verificarajustesautomticosdetodososdocumentosdalista1Click(
      Sender: TObject);
    procedure Verificarajustesautomticosdodocumento1Click(Sender: TObject);
    procedure Exportarparaplanilha1Click(Sender: TObject);
    procedure edEmissaoChange(Sender: TObject);
    procedure btProcuraNotasClick(Sender: TObject);
    procedure btLockProcuraNotasClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btEspelhoCalcClick(Sender: TObject);
    procedure DBLookupComboBox13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure ckMostrarApenasComSTClick(Sender: TObject);
    procedure BitBtn107Click(Sender: TObject);
    procedure BitBtn108Click(Sender: TObject);
    procedure BitBtn109Click(Sender: TObject);
    procedure Label431Click(Sender: TObject);
    procedure BitBtn102Click(Sender: TObject);
    procedure BitBtn101Click(Sender: TObject);
    procedure BitBtn105Click(Sender: TObject);
    procedure BitBtn104Click(Sender: TObject);
    procedure BitBtn103Click(Sender: TObject);
    procedure BitBtn106Click(Sender: TObject);
  private
    Fsped: TSpedFiscalNF;
    FitemNf: TDataSet_OOP;
    dsetC197: TClientDataSet;
    dSourceC197: TDataSource;

    dset1921: TClientDataSet;
    dSource1921: TDataSource;
    FSelecaoNotaFiscal: TSelecaoNotaFiscal;

    procedure CreateDataSetC197;
    procedure FreeDataSetC197;

    procedure CreateDataSet1921;
    procedure FreeDataSet1921;

    procedure nf_itens_espelho_calc_afterscroll(DataSet: TDataSet);

    procedure SomarAjustes();

    procedure VerificarAjustesAutomaticos(arrnf: array of integer);
  public
    procedure VerificarAjustesAutomaticosAposConfimacaoNF();

    property sped: TSpedFiscalNF read Fsped write Fsped;
    property itemNf: TDataSet_OOP read FitemNf write FitemNf;
    property OnSelecaoNotaFiscal: TSelecaoNotaFiscal read FSelecaoNotaFiscal write FSelecaoNotaFiscal;
  end;

var
  frmCadNF_AjustesFiscais: TfrmCadNF_AjustesFiscais;

implementation

uses
  ShellAPI,
  StrUtils,
  Dateutils,
  uDtmAtivo,
  uDtmNF,
  uDtmSpedNf,
  uDadosIni,
  efd_ajustes,
  efd_1921_class,
  nota_ajuste_class,
  hw_utils,
  hw_grid_utils,
  uClasseConexao, Contnrs;

{$R *.dfm}

procedure TfrmCadNF_AjustesFiscais.BitBtn101Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0102', 'SALVAR', 'NUM NF '+ sped.Owner.fstr('NUM_NF'), 'NOTAFISCAL',
    sped.Owner.fstr('COD_NF'), sped.vC195_C197.buscas, True) then
    Exit;
  if sped.vC195_C197.Post then
    TForm(pnCadastroC195197.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(sped.vC195_C197.vNomeCampoErro, sped.vC195_C197.vMensagemErro);
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn102Click(Sender: TObject);
begin
  inherited;
  sped.vC195_C197.Cancel;
  TForm(pnCadastroC195197.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn103Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL_LANCAMENTOS_FISCAIS', 'I', sped.vC195_C197.buscas) then
    Exit;
  if not vDadosIni.PesqPros('NF0103', 'INCLUIR', 'NUM NF '+ sped.Owner.fstr('NUM_NF'), 'NOTAFISCAL',
    sped.Owner.fstr('COD_NF'), sped.vC195_C197.buscas, True) then
    Exit;
  if sped.vC195_C197.incluirC195_c197(
  sped.Owner.dataSet.FieldByName('cod_nf').AsInteger, 0, 0, 0, 0, 0) then
    vDadosIni.abreForm('Lançamentos Fiscais - Para o Sped Fiscal', pnCadastroC195197, opFormsDefCad);
//    CadNf.abreFormCadastroC195_C197;
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn104Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL_LANCAMENTOS_FISCAIS', 'A', sped.vC195_C197.buscas) then
    Exit;
  if not vDadosIni.PesqPros('NF0104', 'ALTERAR', 'NUM NF '+ sped.Owner.fstr('NUM_NF'), 'NOTAFISCAL',
    sped.Owner.fstr('COD_NF'), sped.vC195_C197.buscas, True) then
    Exit;
  if sped.vC195_C197.Edit then
    vDadosIni.abreForm('Lançamentos Fiscais - Para o Sped Fiscal', pnCadastroC195197, opFormsDefCad);
//    CadNf.abreFormCadastroC195_C197;
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn105Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL_LANCAMENTOS_FISCAIS', 'E', sped.vC195_C197.buscas) then
    Exit;    

  if not vDadosIni.PesqPros('NF0230', 'EXCLUIR', 'NUM NF '+ sped.Owner.fstr('NUM_NF'), 'NOTAFISCAL',
    sped.Owner.fstr('COD_NF'), sped.Owner.buscas, True) then
    Exit;

  sped.vC195_C197.Delete;
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn106Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL_LANCAMENTOS_FISCAIS', 'I', sped.vC195_C197.buscas) then
    Exit;
  if not vDadosIni.PesqPros('NF0103', 'INCLUIR', 'NUM NF '+ sped.Owner.fstr('NUM_NF'), 'NOTAFISCAL',
    sped.Owner.fstr('COD_NF'), sped.vC195_C197.buscas, True) then
    Exit;
  //if CadNf.abreFormItensLancFiscal then
  if vDadosIni.abreForm('Lançamentos Fiscais por Item - Para o Sped Fiscal', pnItensLancF, opFormsDefCad) then

    if sped.vC195_C197.incluirC195_c197(
      sped.Owner.dataSet.FieldByName('cod_nf').AsInteger,
      itemNf.dataSet.FieldByName('nitem').AsInteger, 0, 0, 0, 0) then
      vDadosIni.abreForm('Lançamentos Fiscais - Para o Sped Fiscal', pnCadastroC195197, opFormsDefCad);
//      CadNf.abreFormCadastroC195_C197;
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn107Click(Sender: TObject);
begin
  inherited;
  TForm(pnConsultaC195_C197.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn108Click(Sender: TObject);
begin
  inherited;
  TForm(pnItensLancF.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn109Click(Sender: TObject);
begin
  inherited;
  TForm(pnItensLancF.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn1Click(Sender: TObject);
var
  resp: AjustesEfdResultArr;
  con: TConexao;
  arrnf: ArrayInt;
  I: Integer;
  J: Integer;
begin
  inherited;
  
  if not sped.sumAjustes
   .Auditor.Table('NOTAFISCAL')
   .Processo('NF0231', 'NUM NF ' + sped.Owner.fstr('NUM_NF'), sped.Owner.fstr('COD_NF'))
   .Validar.Permitido then
   Exit;

  SetLength(arrnf, 1);
  arrnf[Low(arrnf)] := sped.Owner.fint('cod_nf');

  VerificarAjustesAutomaticos(arrnf);
  {
  sped.CheckGuidNF();

  con := TConexao.Create(sped.Owner.buscas.Database);
  try
    resp := AjustesEFD.GetAjustes(arrnf, vDadosIni.cod_empresa, con);

    if Length(resp) > 0 then
    begin
      CreateDataSetC197;
      CreateDataSet1921;
      try
        for I := Low(resp) to High(resp) do
            resp[I].efdC197.CopyTo(dsetC197);

        for I := Low(resp) to High(resp) do
            resp[I].efd1921.CopyTo(dset1921);

        if vDadosIni.abreForm('Registros de Ajustes automático para o EFD ICMS IPI', pn_ajustesauto, opFormsDefCad) then
          sped.SaveRegistrosAutomaticos(resp[Low(resp)].efdC197, resp[Low(resp)].efd1921)

      finally
        FreeDataSetC197;
        FreeDataSet1921;
      end;
    end
    else
      ShowAtencao('Não houve correspondencia do documento com os parametros definidos no cadastro de Regras de Ajustes automáticos');

  finally
    con.Free;
  end;}
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn5Click(Sender: TObject);
var
  registro: TEfd1921;
begin
  inherited;   
  if not vDadosIni.PesqPros('NF0232', 'INCLUIR', 'NUM NF '+ sped.Owner.fstr('NUM_NF'), 'NOTAFISCAL',
    sped.Owner.fstr('COD_NF'), sped.vC195_C197.buscas, True) then
    Exit;

  sped.CheckGuidNF(sped.Owner.fint('cod_nf'));

  ComboBox1.Items.Text := sped.reg1921.GetListCodAjustes.Text;
  ComboBox1.Text := '';
  ComboBox1.ItemIndex := -1;

  EditHw1.AsValue := 0;
  EditHw2.AsValue := 0;
  MaskEdit1.Text := '';

  if vDadosIni.abreForm('Novo Ajuste', pn_novo1921, opFormsDefCad) then
  begin

    registro := TEfd1921.Create;
    registro.cod_empresa := vDadosIni.cod_empresa;
    registro.ref_id := sped.GetGuidNf(sped.Owner.fint('cod_nf'));

    registro.cod_ajuste := ComboBox1.Text;
    registro.valor_ajuste := EditHw1.AsValue;
    registro.aliquota_ajuste := EditHw2.AsValue;
    registro.descr_compl.Text := MaskEdit1.Text;

    sped.reg1921.Save(registro);
  end;
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn6Click(Sender: TObject);
var
  registro: TEfd1921;
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0233', 'ALTERAR', 'NUM NF '+ sped.Owner.fstr('NUM_NF'), 'NOTAFISCAL',
    sped.Owner.fstr('COD_NF'), sped.vC195_C197.buscas, True) then
    Exit;
    
  registro := sped.reg1921.GetItem(sped.reg1921.fstr('id'));

  if registro = nil then
  begin
    sped.reg1921.Refresh;
    Exit;
  end;

  ComboBox1.Items.Text := sped.reg1921.GetListCodAjustes.Text;
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(registro.cod_ajuste);
  EditHw1.AsValue := registro.valor_ajuste;
  EditHw2.AsValue := registro.aliquota_ajuste;
  MaskEdit1.Text := StringReplace(registro.descr_compl.Text, sLineBreak, '', [rfReplaceAll]);

  if vDadosIni.abreForm('Alteração de Ajuste', pn_novo1921, opFormsDefCad) then
  begin

    registro.cod_ajuste := ComboBox1.Text;
    registro.valor_ajuste := EditHw1.AsValue;
    registro.aliquota_ajuste := EditHw2.AsValue;
    registro.descr_compl.Text := MaskEdit1.Text;

    sped.reg1921.Save(registro);
  end; 
  
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0234', 'EXCLUIR', 'NUM NF '+ sped.Owner.fstr('NUM_NF'), 'NOTAFISCAL',
    sped.Owner.fstr('COD_NF'), sped.Owner.buscas, True) then
    Exit;

  sped.reg1921.RemoveItem(sped.reg1921.fstr('id'));
end;

procedure TfrmCadNF_AjustesFiscais.BitBtn9Click(Sender: TObject);
begin
  inherited;

  if (Length(Trim(ComboBox1.Text)) <> 8)
    or (Copy(Trim(ComboBox1.Text), 3, 6) <> OnlyNumber(ComboBox1.Text))
    or (Length(OnlyNumber(ComboBox1.Text)) <> 6)
  then
    ShowAtencao('Código de ajuste deve conter 8 caracteres. 2 primeiros com a sigla da UF e os demais numéricos')
  else if EditHw1.AsValue <= 0 then
    ShowAtencao('Valor do ajuste deve ser maior que zero')
  else if (Trim(MaskEdit1.Text) = '')
    and (ShowConfirmacao('Descrição complementar não preenchida. Continuar mesmo assim') <> IDYES)
  then
    Exit
  else if not vDadosIni.PesqPros('NF0235', 'SALVAR', 'NUM NF '+ sped.Owner.fstr('NUM_NF'), 'NOTAFISCAL',
    sped.Owner.fstr('COD_NF'), sped.vC195_C197.buscas, True) then
    Exit
  else
    (pn_novo1921.Parent as TForm).ModalResult := IDOK;
end;

procedure TfrmCadNF_AjustesFiscais.btEspelhoCalcClick(Sender: TObject);
var
  rescueDtSetEvent: TDataSetNotifyEvent;
  controlsDisabled: Boolean;
begin
  inherited;
  try
    controlsDisabled := itemNf.dataSet.ControlsDisabled;

    itemNf.dataSet.EnableControls;
    itemNf.dataSet.EnableControls;
    itemNf.dataSet.EnableControls;

    ckMostrarApenasComST.Checked := _LerConfiguracoesRegistroBoolean(ckMostrarApenasComST.Name);
    itemNf.dataSet.Filter := 'antec_trib = ''S''';
    itemNf.dataSet.Filtered := ckMostrarApenasComST.Checked;

    rescueDtSetEvent := itemNf.dataSet.AfterScroll;
    itemNf.dataSet.AfterScroll := nf_itens_espelho_calc_afterscroll;

    nf_itens_espelho_calc_afterscroll(itemNf.dataSet);

    vDadosIni.abreForm( 'Espelho de Cálculo do ICMS', pnEspelhoCalcAntSt, [ofAlignAllClientWinCtrl, ofEscapeExit]);
  finally
    _GravaConfiguracoesBoolean(ckMostrarApenasComST.Name, ckMostrarApenasComST.Checked);
    itemNf.dataSet.AfterScroll := rescueDtSetEvent;
    itemNf.dataSet.Filtered := False;
    itemNf.dataSet.Filter := '';
    if controlsDisabled then
      itemNf.dataSet.DisableControls;
  end;

end;

procedure TfrmCadNF_AjustesFiscais.ckMostrarApenasComSTClick(Sender: TObject);
begin
  inherited;
  itemNf.dataSet.Filtered := ckMostrarApenasComST.Checked;
end;

procedure TfrmCadNF_AjustesFiscais.CreateDataSet1921;
begin
  dset1921 := TClientDataSet.Create(nil);

  dset1921.FieldDefs.Add('cod_ajuste', ftString, 8);
  dset1921.FieldDefs.Add('descr_compl', ftString, 128);
  dset1921.FieldDefs.Add('valor_ajuste', ftFloat);
  dset1921.FieldDefs.Add('aliquota_ajuste', ftFloat);
//  dset1921.FieldDefs.Add('descr_compl_aj', ftString, 2048);

  dset1921.CreateDataSet;

  TFloatField(dset1921.FieldByName('valor_ajuste')).DisplayFormat := DisplayNumber(2);
  TFloatField(dset1921.FieldByName('aliquota_ajuste')).DisplayFormat := DisplayNumber(2);

  dSource1921 := TDataSource.Create(nil);
  dSource1921.DataSet := dset1921;
  dSource1921.AutoEdit := False;

  grid1921.DataSource := dSource1921;
//  grid1921.Options := grid1921.Options - [dgEditing];
end;

procedure TfrmCadNF_AjustesFiscais.CreateDataSetC197;
begin
  dsetC197 := TClientDataSet.Create(nil);

  dsetC197.FieldDefs.Add('nitem', ftInteger);
  dsetC197.FieldDefs.Add('cod_aj', ftString, 10);
  dsetC197.FieldDefs.Add('descr_compl_aj', ftString, 128);
  dsetC197.FieldDefs.Add('vl_bc_icms', ftFloat);
  dsetC197.FieldDefs.Add('aliq_icms', ftFloat);
  dsetC197.FieldDefs.Add('vl_icms', ftFloat);
//  dsetC197.FieldDefs.Add('descr_compl_aj', ftString, 2048);

  dsetC197.CreateDataSet;

  TFloatField(dsetC197.FieldByName('vl_bc_icms')).DisplayFormat := DisplayNumber(2);
  TFloatField(dsetC197.FieldByName('aliq_icms')).DisplayFormat := DisplayNumber(2);
  TFloatField(dsetC197.FieldByName('vl_icms')).DisplayFormat := DisplayNumber(2);

  dSourceC197 := TDataSource.Create(nil);
  dSourceC197.DataSet := dsetC197;
  dSourceC197.AutoEdit := False;

  gridC197.DataSource := dSourceC197;

end;

procedure TfrmCadNF_AjustesFiscais.DBLookupComboBox13KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_LANCAMENTO_FISCAL');
    if Trim(vDadosIni.vPesquisa) <> '' then
    begin
      sped.vC195_C197.vLancFiscal.abreLancamentosFiscais;
      if sped.vC195_C197.dataSet.State in [dsEdit, dsInsert] then
        sped.vC195_C197.dataSet.FieldByName('COD_OBS').AsString := vDadosIni.vPesquisa;
    end;
  end;
end;

procedure TfrmCadNF_AjustesFiscais.edEmissaoChange(Sender: TObject);
var
  filtro: string;
  sNf: string;
  nNf: Integer;
begin
  inherited;

  filtro := IfThen(edEmissao.ItemIndex = 1, 'emissao_propria = ''S''') +
            IfThen(edEmissao.ItemIndex = 2, 'emissao_propria = ''N''');

  filtro := filtro +
            IfThen((edES.ItemIndex > 0) and (filtro <> '') , ' and ') +
            IfThen(edES.ItemIndex = 1, ' natureza_nf = ''E'' ') +
            IfThen(edES.ItemIndex = 2, ' natureza_nf = ''S'' ');

  filtro := filtro +
            IfThen((edCodAjC197.ItemIndex > 0) and (filtro <> '') , ' and ') +
            IfThen(edCodAjC197.ItemIndex > 0, ' cod_aj_c197 = ' + QuotedStr(edCodAjC197.Text));

  filtro := filtro +
            IfThen((edCodAj1921.ItemIndex > 0) and (filtro <> '') , ' and ') +
            IfThen(edCodAj1921.ItemIndex > 0, ' cod_aj_1921 = ' + QuotedStr(edCodAj1921.Text));

  sNf := OnlyNumber(edNumero.Text);
  nNf := 0;
  if TryStrToInt(sNf, nNf) then
    sNf := IntToStr(nNf)
  else
    sNf := '';

  filtro := filtro +
            IfThen((sNf <> '') and (filtro <> '') , ' and ') +
            IfThen(sNf <> '', ' num_nf = ' + sNf);

  sped.sumAjustes.dataSet.Filter := filtro;

  if sped.sumAjustes.dataSet.Filter <> '' then
    sped.sumAjustes.dataSet.Filtered := True;

  SomarAjustes();
end;

procedure TfrmCadNF_AjustesFiscais.Exportarparaplanilha1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.criarExcel(gridSumAjustes, 'Ajustes Nota Fiscal - C197 e 1921');
end;

procedure TfrmCadNF_AjustesFiscais.FormCreate(Sender: TObject);
begin
  inherited;
  pageprinc.ActivePage := tab_ajustesC197;
end;

procedure TfrmCadNF_AjustesFiscais.FormShow(Sender: TObject);
begin
  inherited;
  tab_itensnf.TabVisible := False;
  tab_espelhocalc.TabVisible := False;
  tab_novosajuestesauto.TabVisible := False;
  tab_novoC197.TabVisible := False;
  tab_novo1921.TabVisible := False;

  THwHack_DbGrid.Create(gridSumAjustes);

  grid1921cad.DataSource := sped.reg1921._dataSourceOOP;

  edMEs.Value := MonthOf(IncMonth(Date, -1));
  edAnoo.Value := YearOf(IncMonth(Date, -1));
end;

procedure TfrmCadNF_AjustesFiscais.FreeDataSet1921;
begin
  dset1921.Close;
  dset1921.Free;
  dSource1921.Free;
end;

procedure TfrmCadNF_AjustesFiscais.FreeDataSetC197;
begin
  dsetC197.Close;
  dsetC197.Free;
  dSourceC197.Free;
end;

procedure TfrmCadNF_AjustesFiscais.Label431Click(Sender: TObject);
begin
  inherited;
  ShellExecute(Application.Handle, nil,
    PChar('http://www.fazenda.gov.br/confaz/confaz/atos/atos_cotepe/2008/ac009_08.htm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmCadNF_AjustesFiscais.nf_itens_espelho_calc_afterscroll(
  DataSet: TDataSet);
begin
  if not itemNf.fempty('espelho_calc') then
    memo_espelho_calc.Lines.Text := itemNf.fstr('espelho_calc')
  else
    memo_espelho_calc.Lines.Text := itemNf.fstr('espelho_calc_st');
end;

procedure TfrmCadNF_AjustesFiscais.Removerseleodetodososregistro1Click(
  Sender: TObject);
begin
  inherited;
  sped.sumAjustes.CheckUnCheckAllRows(False);
end;

procedure TfrmCadNF_AjustesFiscais.Removerseleodoregistro1Click(
  Sender: TObject);
begin
  inherited;
  sped.sumAjustes.CheckUnCheckRow(False);
end;

procedure TfrmCadNF_AjustesFiscais.Removertodososajustesdalistaapenasosregistros19211Click(
  Sender: TObject);
begin
  inherited;
  if not sped.sumAjustes
   .Auditor.Table('NOTAFISCAL')
   .Processo('NF0238')
   .Excluir.Permitido then
   Exit;

  sped.sumAjustes.RemoverAjustesFiltro(False, True);
end;

procedure TfrmCadNF_AjustesFiscais.RemovertodososajustesdalistaapenasosregistrosC1971Click(
  Sender: TObject);
begin
  inherited;
  if not sped.sumAjustes
   .Auditor.Table('NOTAFISCAL')
   .Processo('NF0237')
   .Excluir.Permitido then
   Exit;

  sped.sumAjustes.RemoverAjustesFiltro(True, False);
end;

procedure TfrmCadNF_AjustesFiscais.btLockProcuraNotasClick(Sender: TObject);
begin
  inherited;
  edAnoo.Enabled := True;
  edMEs.Enabled := True;
  btLockProcuraNotas.Visible := False;
  btProcuraNotas.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (edMEs.CanFocus) then
  	edMEs.SetFocus;
end;

procedure TfrmCadNF_AjustesFiscais.btProcuraNotasClick(Sender: TObject);
var
  list: TStrings;
begin
  inherited;

  sped.sumAjustes.dataSet.Filtered := False;

  sped.sumAjustes.OpenByDate(edMEs.Value, edAnoo.Value);

  sped.sumAjustes.prepare_loop().Last;

  try

    edNumero.Items.Text := sped.sumAjustes.flist('num_nf', True, False).Text;
    edNumero.Items.Insert(0, 'Todos');

    edCodAjC197.Items.Text := sped.sumAjustes.flist('cod_aj_c197', True, False).Text;
    edCodAjC197.Items.Insert(0, 'Todos');

    edCodAj1921.Items.Text := sped.sumAjustes.flist('cod_aj_1921', True, False).Text;
    edCodAj1921.Items.Insert(0, 'Todos');

    edEmissao.ItemIndex := 0;
    edES.ItemIndex := 0;
    edNumero.ItemIndex := 0;
    edCodAjC197.ItemIndex := 0;
    edCodAj1921.ItemIndex := 0;

  finally
    sped.sumAjustes.prepare_loop_done();
    sped.sumAjustes.dataSet.Filter := '';
    sped.sumAjustes.dataSet.Filtered := True;
  end;

  SomarAjustes();

  gridSumAjustes.DataSource := sped.sumAjustes._dataSourceOOP;
  gridSumAjustes.Visible := sped.sumAjustes.dataSet.RecordCount > 0;
  btAcoes.Visible := sped.sumAjustes.dataSet.RecordCount > 0;

  edAnoo.Enabled := False;
  edMEs.Enabled := False;
  btProcuraNotas.Visible := False;
  btLockProcuraNotas.Top := btProcuraNotas.Top;
  btLockProcuraNotas.Visible := True;
end;

procedure TfrmCadNF_AjustesFiscais.btAcoesClick(Sender: TObject);
begin
  inherited;
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadNF_AjustesFiscais.Selecionarnotafiscalparaalterarajustes1Click(
  Sender: TObject);
begin
  inherited;
  if Assigned(FSelecaoNotaFiscal) then
  begin
    FSelecaoNotaFiscal(sped.sumAjustes.fint('cod_nf'));
    pageprinc.ActivePage := tab_ajustesC197;
  end;
end;

procedure TfrmCadNF_AjustesFiscais.Selecionarregistro1Click(Sender: TObject);
begin
  inherited;
  sped.sumAjustes.CheckUnCheckRow(True);
end;

procedure TfrmCadNF_AjustesFiscais.Selecionartodos1Click(Sender: TObject);
begin
  inherited;
  sped.sumAjustes.CheckUnCheckAllRows(True);
end;

procedure TfrmCadNF_AjustesFiscais.SomarAjustes;
begin
  sped.sumAjustes.dataSet.DisableControls;
  sped.sumAjustes.storeRecNo;
  try
    lb_vlcontabil.Caption := Format('%0.2n', [sped.sumAjustes.fsum('valor_contabil', False)]);
    lb_bcicms.Caption := Format('%0.2n', [sped.sumAjustes.fsum('base_icms', False)]);
    lb_vlicms.Caption := Format('%0.2n', [sped.sumAjustes.fsum('valor_icms', False)]);
    lb_vlajc197.Caption := Format('%0.2n', [sped.sumAjustes.fsum('valor_aj_c197', False)]);
    lb_vlaj1921.Caption := Format('%0.2n', [sped.sumAjustes.fsum('valor_aj_1921', False)]);
  finally                                  
    sped.sumAjustes.restoreRecNo;
    sped.sumAjustes.dataSet.EnableControls;
  end;
end;

procedure TfrmCadNF_AjustesFiscais.SpeedButton32Click(Sender: TObject);
var
  vBaseICMSubResumo: Currency;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn101.CanFocus) then
  	BitBtn101.SetFocus;
  if sped.vC195_C197.dataSet.FieldByName('nitem').AsInteger = 0 then
  begin
    vBaseICMSubResumo := 0;
    itemNf.First;
    while not itemNf.dataSet.Eof do
    begin
      vBaseICMSubResumo := vBaseICMSubResumo +
        (itemNf.dataSet.FieldByName('base_icmsub_ant').AsCurrency *
          itemNf.dataSet.FieldByName('quantidade').AsFloat);
      itemNf.dataSet.Next;
    end;
    if vBaseICMSubResumo > 0 then
      sped.vC195_C197.setValorBaseICMS_ST( vBaseICMSubResumo );
  end
  else
  begin
    if itemNf.dataSet.FieldByName('base_icmsub_ant').AsCurrency > 0 then
      sped.vC195_C197.setValorBaseICMS_ST(itemNf.dataSet.FieldByName('base_icmsub_ant').AsCurrency *
        itemNf.dataSet.FieldByName('quantidade').AsFloat);
  end;
end;

procedure TfrmCadNF_AjustesFiscais.SpeedButton37Click(Sender: TObject);
var
  vValorICMSubResumo: Currency;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn101.CanFocus) then
  	BitBtn101.SetFocus;
  if sped.vC195_C197.dataSet.FieldByName('nitem').AsInteger = 0 then
  begin
    vValorICMSubResumo := 0;
    itemNf.First;
    while not itemNf.dataSet.Eof do
    begin
      vValorICMSubResumo := vValorICMSubResumo +
        (itemNf.dataSet.FieldByName('valor_icmsub_ant').AsCurrency *
        itemNf.dataSet.FieldByName('quantidade').AsFloat) ;
      itemNf.dataSet.Next;
    end;
    if vValorICMSubResumo > 0 then
      sped.vC195_C197.setValorDoICMS_ST( vValorICMSubResumo );
  end
  else
  begin
    if itemNf.dataSet.FieldByName('valor_icmsub_ant').AsCurrency > 0 then
      sped.vC195_C197.setValorDoICMS_ST( (itemNf.dataSet.FieldByName('valor_icmsub_ant').AsCurrency *
        itemNf.dataSet.FieldByName('quantidade').AsFloat));
  end;
end;

procedure TfrmCadNF_AjustesFiscais.VerificarAjustesAutomaticos(arrnf: array of integer);
var
  resp: AjustesEfdResultArr;
  con: TConexao;
  I: Integer;
  J: Integer;
  arrInt: arrayInt;
  autoC197: TNotaAjusteDbList;
  auto1921: TEfd1921List;
begin
  inherited;

  SetLength(arrInt, Length(arrnf));
  for I := Low(arrInt) to High(arrInt) do
  begin
    arrInt[I] := arrnf[I];
    sped.CheckGuidNF(arrnf[I]);
  end;

  con := TConexao.Create(sped.Owner.buscas.Database);
  try
    resp := AjustesEFD.GetAjustes(arrInt, vDadosIni.cod_empresa, con);

    if Length(resp) > 0 then
    begin
      CreateDataSetC197;
      CreateDataSet1921;
      autoC197 := TNotaAjusteDbList.Create;
      auto1921 := TEfd1921List.Create;
      try
        for I := Low(resp) to High(resp) do
            resp[I].efdC197.CopyTo(dsetC197);

        for I := Low(resp) to High(resp) do
            resp[I].efd1921.CopyTo(dset1921);

        if vDadosIni.abreForm('Registros de Ajustes automático para o EFD ICMS IPI', pn_ajustesauto, opFormsDefCad) then
        begin
           for I := Low(resp) to High(resp) do
             for J := 0 to resp[I].efdC197.Count - 1 do
               autoC197.Add(resp[I].efdC197.Items[J].Clone);

           for I := Low(resp) to High(resp) do
             for J := 0 to resp[I].efd1921.Count - 1 do
               auto1921.Add(resp[I].efd1921.Items[J].Clone);

          if sped.SaveRegistrosAutomaticos(autoC197, auto1921) then
            sped.sumAjustes.Auditor.Sucesso.GravarMensagem('')
          else
            sped.sumAjustes.Auditor.Falha.GravarMensagem('');
        end;

      finally
        FreeDataSetC197;
        FreeDataSet1921;
      end;
    end
    else
      ShowAtencao('Não houve correspondencia do documento com os parametros definidos no cadastro de Regras de Ajustes automáticos');

  finally
    con.Free;
  end;
end;

procedure TfrmCadNF_AjustesFiscais.VerificarAjustesAutomaticosAposConfimacaoNF();
var
  resp: AjustesEfdResultArr;
  con: TConexao;
  I: Integer;
  J: Integer;
  arrInt: arrayInt;
  autoC197: TNotaAjusteDbList;
  auto1921: TEfd1921List;
begin
  inherited;

  SetLength(arrInt, 1);
  arrInt[High(arrInt)] := sped.Owner.fint('COD_NF');
  
  con := TConexao.Create(sped.Owner.buscas.Database);
  try
    resp := AjustesEFD.GetAjustes(arrInt, vDadosIni.cod_empresa, con);

    if Length(resp) > 0 then
    begin    
      autoC197 := TNotaAjusteDbList.Create;
      auto1921 := TEfd1921List.Create; 
      
       for I := Low(resp) to High(resp) do
         for J := 0 to resp[I].efdC197.Count - 1 do
           if sped.vC195_C197.filterStr('cod_obs = %d and cod_aj = ''%s''',
             [resp[I].efdC197.Items[J].cod_obs, resp[I].efdC197.Items[J].cod_aj]).IsEmpty then
             autoC197.Add(resp[I].efdC197.Items[J].Clone);

       for I := Low(resp) to High(resp) do
         for J := 0 to resp[I].efd1921.Count - 1 do
           if sped.reg1921.filterStr('cod_ajuste = ''%s''',
             [resp[I].efd1921.Items[J].cod_ajuste]).IsEmpty then
             auto1921.Add(resp[I].efd1921.Items[J].Clone);

      if (autoC197.Count = 0) and (auto1921.Count = 0) then
        Exit;

      if not sped.sumAjustes
       .Auditor.Table('NOTAFISCAL')
       .Processo('NF0231', 'NUM NF ' + sped.Owner.fstr('NUM_NF'), sped.Owner.fstr('COD_NF'))
       .InibirMensagens
       .Validar.Permitido then
       Exit;

      CreateDataSetC197;
      CreateDataSet1921;
      try

        autoC197.CopyTo(dsetC197);
        auto1921.CopyTo(dset1921);

        if vDadosIni.abreForm('Registros de Ajustes automático para o EFD ICMS IPI', pn_ajustesauto, opFormsDefCad) then
        begin
          if sped.SaveRegistrosAutomaticos(autoC197, auto1921) then
            sped.sumAjustes.Auditor.Sucesso.GravarMensagem('')
          else
            sped.sumAjustes.Auditor.Falha.GravarMensagem('');
        end;

      finally
        FreeDataSetC197;
        FreeDataSet1921;
      end;
    end;

  finally
    con.Free;
    sped.vC195_C197.filterClear;
    sped.reg1921.filterClear;
  end;
end;

procedure TfrmCadNF_AjustesFiscais.Verificarajustesautomticosdetodososdocumentosdalista1Click(
  Sender: TObject);
var
  arrnf: ArrayInt;
  list: TStrings;
  codnf: Integer;
  I: Integer;
begin
  inherited;

  if not sped.sumAjustes
   .Auditor.Table('NOTAFISCAL')
   .Processo('NF0236')
   .Validar.Permitido then
   Exit;
  
  Screen.Cursor := crHourGlass;
  sped.sumAjustes.dataSet.DisableControls;
  sped.sumAjustes.storeRecNo;
  try

    list := NewStringList(True);

    sped.sumAjustes.First;
    while not sped.sumAjustes.Eof do
    begin
      if sped.sumAjustes.fequals('sel', 'S') then
      begin
        list.Add(sped.sumAjustes.fstr('cod_nf'));

        sped.sumAjustes.Auditor.SetChave(sped.sumAjustes.fstr('cod_nf'))
          .GravarMensagem('NUM NF %s', [sped.sumAjustes.fstr('num_nf')]);
      end;

      sped.sumAjustes.Next;
    end;

    //list := sped.sumAjustes.flist('cod_nf', True);
    for I := 0 to List.Count - 1 do
      if TryStrToInt(list[I], codnf) then
      begin
        SetLength(arrnf, Length(arrnf) + 1);
        arrnf[High(arrnf)] := codnf;
      end;

    VerificarAjustesAutomaticos(arrnf);

    sped.sumAjustes.CancelUpdates;
    sped.sumAjustes.Refresh;

  finally
    sped.sumAjustes.restoreRecNo;
    Screen.Cursor := crDefault;
    sped.sumAjustes.dataSet.EnableControls;
  end;
end;

procedure TfrmCadNF_AjustesFiscais.Verificarajustesautomticosdodocumento1Click(
  Sender: TObject);
var
  arrnf: ArrayInt;
begin
  inherited;

  if not sped.sumAjustes
   .Auditor.Table('NOTAFISCAL')
   .Processo('NF0231', 'NUM NF ' + sped.sumAjustes.fstr('NUM_NF'), sped.sumAjustes.fstr('COD_NF'))
   .Validar.Permitido then
   Exit;

  Screen.Cursor := crHourGlass;
  try;

    SetLength(arrnf, 1);
    arrnf[Low(arrnf)] := sped.sumAjustes.fint('cod_nf');

    VerificarAjustesAutomaticos(arrnf);

    sped.sumAjustes.Refresh;
    edEmissaoChange(edEmissao);
    sped.sumAjustes.dataSet.EnableControls ;
  finally
    Screen.Cursor := crDefault;
  end
end;

end.
