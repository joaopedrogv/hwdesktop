unit uCadRotasEntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DB, DBCtrls;

type
  TfrmCadRotasEntrega = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    pnCadastro: TPanel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    tsConsulta: TTabSheet;
    pnConsulta: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    btSel: TBitBtn;
    btVoltar: TBitBtn;
    edTexto_regiao: TMaskEdit;
    Panel6: TPanel;
    gridRegiao: TDBGrid;
    btRegiao: TSpeedButton;
    btCondicao: TSpeedButton;
    btCOnsultar: TBitBtn;
    grid_regiao: TStringGrid;
    btAddRegiao: TSpeedButton;
    btDelRegiao: TSpeedButton;
    btUpRegiao: TSpeedButton;
    btDownRegiao: TSpeedButton;
    procedure SpeedButton6Click(Sender: TObject);
    procedure btDownRegiaoClick(Sender: TObject);
    procedure btUpRegiaoClick(Sender: TObject);
    procedure btDelRegiaoClick(Sender: TObject);
    procedure btAddRegiaoClick(Sender: TObject);
    procedure gridRegiaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure pnConsultaExit(Sender: TObject);
    procedure btCOnsultarClick(Sender: TObject);
    procedure btCondicaoClick(Sender: TObject);
    procedure btRegiaoClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

//    procedure rotas_listas_start(Arecno: Integer);
    procedure rotas_listas_change(const Amove: Integer);
  public
    { Public declarations }
  end;

var
  frmCadRotasEntrega: TfrmCadRotasEntrega;

implementation

uses
  uClassesRotasEntrega, UDtmClientes, uDtmAtivo, uDataSet_OOP, StrUtils, uDadosIni;

{$R *.dfm}

procedure cadRotas(Amodal: Boolean);
begin
  vDadosIni.vTipoForm := 0;
  if not Assigned(frmCadRotasEntrega) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm(TfrmCadRotasEntrega, frmCadRotasEntrega);
  end;
  if frmCadRotasEntrega.FormStyle = fsMDIChild then
    frmCadRotasEntrega.Show
  else
    frmCadRotasEntrega.ShowModal;
end;

exports
  cadRotas;

procedure TfrmCadRotasEntrega.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CLI233', 'CONSULTA', '', 'ROTAS_ENTR', '', rotas.buscas, False) then
      Exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not rotas.ConsultaCampos('ROTAS_ENTR', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if rotas.ConsultaCampos('ROTAS_ENTR', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadRotasEntrega.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not rotas.Insert then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    rotas.regiaoChange := rotas_listas_change;
    rotas_listas_change(0);

    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadRotasEntrega.BitBtn4Click(Sender: TObject);
begin
  if not rotas.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(rotas.vNomeCampoErro);
  end
  else
  begin
    rotas.regiaoChange := nil;
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if rotas.Insert then
      begin
        rotas.regiaoChange := rotas_listas_change;
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        	DBEdit3.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadRotasEntrega.BitBtn5Click(Sender: TObject);
begin
  rotas.regiaoChange := nil;
  rotas.Cancel;
  inherited;
end;

procedure TfrmCadRotasEntrega.btCondicaoClick(Sender: TObject);
begin
  inherited;
  if btCondicao.Caption = 'Está contido' then
    btCondicao.Caption := 'Igual'
  else if btCondicao.Caption = 'Igual' then
    btCondicao.Caption := 'Começa'
  else
    btCondicao.Caption := 'Está contido';
end;

procedure TfrmCadRotasEntrega.btCOnsultarClick(Sender: TObject);
begin
  inherited;
  btSel.Enabled := False;
  gridRegiao.Visible := rotas.consultaRegiao(btRegiao.Caption, Trim(edTexto_regiao.Text), btCondicao.Caption);
  if (Self.Enabled) and (Self.Visible) and (gridRegiao.CanFocus) then
    gridRegiao.SetFocus;
  btSel.Enabled := rotas.buscas.RecordCount > 0;
end;

procedure TfrmCadRotasEntrega.btRegiaoClick(Sender: TObject);
begin
  inherited;
  if btRegiao.Caption = 'Localidade' then
    btRegiao.Caption := 'Setor'
  else if btRegiao.Caption = 'Setor' then
    btRegiao.Caption := 'Cidade'
  else if btRegiao.Caption = 'Cidade' then
    btRegiao.Caption := 'Localidade';
end;

procedure TfrmCadRotasEntrega.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: SpeedButton1Click(Sender);
    VK_DELETE: SpeedButton2Click(Sender);
    VK_INSERT: BitBtn3Click(Sender);
    VK_ESCAPE: if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then MaskEdit3.SetFocus;               
  end;
end;

procedure TfrmCadRotasEntrega.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadRotasEntrega := nil;

  if Assigned(rotas) then
    FreeAndNil(rotas);
end;

procedure TfrmCadRotasEntrega.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  if not Assigned(rotas) then
    rotas := TRotas.Create;

  tsCadastro.TabVisible := False;
  TabSheet1.TabVisible := False;
  tsConsulta.TabVisible := False;
//  tsCadDoc.TabVisible := False;
//  tsPesqNF.TabVisible := False;
//  tsPesqNFIt.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadRotasEntrega.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmClientes.dsRota;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  imgInformation.Hint := imgInformation.Hint + sLineBreak + sLineBreak +
   'CLI233 - BT PESQUISAR ROTAS ENTREGA' + sLineBreak +
   'CLI234 - BT INSERIR ROTAS ENTREGA' + sLineBreak +
   'CLI235 - BT ALTERAR ROTAS ENTREGA' + sLineBreak +
   'CLI236 - BT EXCLUIR ROTAS ENTREGA' + sLineBreak +
   'CLI237 - BT SALVAR ROTAS ENTREGA' + sLineBreak +
   'CLI238 - SALVAR ROTAS ENTREGA MESMA SIGLA' + sLineBreak +
   'CLI239 - BT VISUALIZAR CLIENTES ROTA' + sLineBreak +
   'CLI240 - BT SALVAR CLIENTES ROTA' + sLineBreak +
   'CLI241 - BT INCLUIR REGIAO ROTA ENTREGA' + sLineBreak +
   'CLI242 - BT EXCLUIR REGIAO ROTA ENTREGA' + sLineBreak +
   'CLI243 - EXCLUIR ROTA ENTREGA COM REGIAO VINC' + sLineBreak +
   'CLI244 - EXCLUIR ROTA ENTREGA COM CLIENTE VINC';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadRotasEntrega.gridRegiaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN : if (Self.Enabled) and (Self.Visible) and (btSel.CanFocus) then btSel.SetFocus;
    VK_ESCAPE : if (Self.Enabled) and (Self.Visible) and (edTexto_regiao.CanFocus) then edTexto_regiao.SetFocus;
  end;
end;

procedure TfrmCadRotasEntrega.pnConsultaExit(Sender: TObject);
begin
  inherited;
  btSel.Enabled := False;
end;

procedure TfrmCadRotasEntrega.rotas_listas_change(const Amove: Integer);
var
  Arow: Integer;
  I: Integer;
begin
  Arow := grid_regiao.Row + Amove;
  grid_regiao.RowCount := rotas.regioes.Count;
  if rotas.regioes.Count > 0 then
  begin
    for I := 0 to rotas.regioes.Count - 1 do
    begin
      grid_regiao.Cells[0, I] := IfThen(rotas.regioes.Items[I].cod_localidade > 0, 'Localidade', 'Cidade');
      grid_regiao.Cells[1, I] := rotas.regioes.Items[I].setor;
      grid_regiao.Cells[2, I] := rotas.regioes.Items[I].regiao;
    end;
    if (Arow > -1) and (Arow <= grid_regiao.RowCount - 1) and (grid_regiao.RowCount > 0) then
      grid_regiao.Row := Arow;
  end
  else
  begin
    grid_regiao.Cells[0, 0] := '';
    grid_regiao.Cells[1, 0] := '';
    grid_regiao.Cells[2, 0] := '';
  end;
end;

procedure TfrmCadRotasEntrega.btDownRegiaoClick(Sender: TObject);
begin
  inherited;
  rotas.MoveRegiao(grid_regiao.Row, 1);
end;

procedure TfrmCadRotasEntrega.btDelRegiaoClick(Sender: TObject);
begin
  inherited;
  if grid_regiao.Row >= 0 then
    rotas.DelRegiao(grid_regiao.Row);
end;

procedure TfrmCadRotasEntrega.btUpRegiaoClick(Sender: TObject);
begin
  inherited;
  rotas.MoveRegiao(grid_regiao.Row, -1);
end;

procedure TfrmCadRotasEntrega.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not rotas.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    rotas.regiaoChange := rotas_listas_change;
    rotas_listas_change(0);

    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadRotasEntrega.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if rotas.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if vDadosIni.ShowConfirmacao('Deseja mesmo excluir o registro') = IDYES then
      rotas.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadRotasEntrega.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CLI239', 'VISUALIZAR',
    Format('%d - %s - %s', [rotas.f_int('cod_rota'), rotas.f_str('rota'), rotas.f_str('descricao')]),
    'ROTAS_ENTR_CLIENTE', '', rotas.buscas, False) then
    Exit;

  try
    Screen.Cursor := crHourGlass;

    rotas.show_definir_rotas;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadRotasEntrega.btAddRegiaoClick(Sender: TObject);
var
  Ads: TDataSource;
begin
  inherited;

  try
    Ads := TDataSource.Create(rotas.buscas.Owner);
    Ads.AutoEdit := False;
    Ads.DataSet  := rotas.buscas;
    gridRegiao.DataSource := Ads;

    btRegiao.Caption    := _LerConfiguracoesRegistroString(btRegiao.Name      , 'Localidade');
    btCondicao.Caption  := _LerConfiguracoesRegistroString(btCondicao.Name    , btCondicao.Caption);
    edTexto_regiao.Text := _LerConfiguracoesRegistroString(edTexto_regiao.Name, '');
    gridRegiao.Visible  := False;

    if vDadosIni.abreForm('Selecione a região', pnConsulta, opFormsDefCad) then
      rotas.AddRegiao(rotas.buscas.FieldByName('cod.cidade').AsInteger,
                      rotas.buscas.FieldByName('cod.localidade').AsInteger,
                      rotas.buscas.FieldByName('regiao').AsString,
                      rotas.buscas.FieldByName('setor').AsString);

  finally
    if Assigned(Ads) then FreeAndNil(Ads);
    _GravaConfiguracoesString(btRegiao.Name      , btRegiao.Caption);
    _GravaConfiguracoesString(btCondicao.Name    , btCondicao.Caption);
    _GravaConfiguracoesString(edTexto_regiao.Name, edTexto_regiao.Text);
  end;
end;

end.
