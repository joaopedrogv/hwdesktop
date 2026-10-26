unit uComissaoPorVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls,
  DBCtrls, uEditHw;

type
  TfrmComissaoPorVenda = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edDataIni: TMaskEdit;
    edDataFim: TMaskEdit;
    btPesquisar: TBitBtn;
    rbNomeFantasia: TRadioButton;
    rbRazaoSocial: TRadioButton;
    Panel5: TPanel;
    btDefinirComissao: TBitBtn;
    btVoltar: TBitBtn;
    Panel68: TPanel;
    Splitter6: TSplitter;
    PanelTreeView: TPanel;
    gridVendas: TDBGrid;
    PanelComissaoPorVenda: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    GroupBoxVendedor: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    GroupBoxParticipante: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    rbFechada: TCheckBox;
    rbAberta: TCheckBox;
    Panel29: TPanel;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    EditHwPercVend: TEditHw;
    EditHwVlVend: TEditHw;
    Label17: TLabel;
    EditHwVlProdVend: TEditHw;
    BitBtn47: TBitBtn;
    EditHwPercPart: TEditHw;
    EditHwVlPart: TEditHw;
    Label18: TLabel;
    EditHwVlProdPart: TEditHw;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Label19: TLabel;
    DBEdit5: TDBEdit;
    Label20: TLabel;
    DBEdit6: TDBEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditHwVlPartExit(Sender: TObject);
    procedure EditHwPercPartExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure EditHwVlVendExit(Sender: TObject);
    procedure EditHwPercVendExit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure PanelComissaoPorVendaEnter(Sender: TObject);
    procedure gridVendasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn28Click(Sender: TObject);
    procedure btDefinirComissaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure rbNomeFantasiaClick(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComissaoPorVenda: TfrmComissaoPorVenda;

implementation

uses uDtmPedVenda, uDtmAtivo, UClassesPedVenda, DBTables, Clipbrd, uDadosIni,
  DB, Math, config_sistema_class;

{$R *.dfm}

procedure TfrmComissaoPorVenda.BitBtn1Click(Sender: TObject);
var
  vcodvend: Integer;
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
  	BitBtn1.SetFocus;

  vcodvend := ComissaoPorVendaCons.vComissaoVend.dataSet.FieldByName('cod_vendedor').AsInteger;

  if not ComissaoPorVendaCons.validarCampos('V') then
  begin
    setFocusCampoErro(ComissaoPorVendaCons.vNomeCampoErro, ComissaoPorVendaCons.vMensagemErro);
    exit;
  end;
  if not ComissaoPorVendaCons.atribuirComissaoPorVenda(EditHwPercVend.AsValue, EditHwVlVend.AsValue, 0, 0,
  	ComissaoPorVendaCons.vComissaoVend.dataSet.FieldByName('cod_vendedor').AsInteger, 0) then
     exit;

  ComissaoPorVendaCons.vComissaoVend.abreVend(ComissaoPorVendaCons.dataSet.FieldByName('nped').AsInteger,
  	ComissaoPorVendaCons.dataSet.FieldByName('tipo').AsString, vcodvend);
  ComissaoPorVendaCons.dataSet.RefreshRecord;  
  DBLookupComboBox1.KeyValue := vcodvend;

  BitBtn1.Enabled := false;
  BitBtn2.Enabled := true;
  EditHwPercVend.Enabled := false;
  EditHwVlVend.Enabled := false;

  Application.MessageBox(Pchar('Comissão atribuída ao vendedor'), 'Atenção', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmComissaoPorVenda.BitBtn28Click(Sender: TObject);
begin
//  TForm(PanelComissaoPorVenda.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmComissaoPorVenda.BitBtn2Click(Sender: TObject);
begin
  BitBtn1.Enabled := true;
  BitBtn2.Enabled := false;
  EditHwPercVend.Enabled := true;
  EditHwVlVend.Enabled := true;

  if (Self.Enabled) and (Self.Visible) and (EditHwPercVend.CanFocus) then
    EditHwPercVend.SetFocus;
end;

procedure TfrmComissaoPorVenda.BitBtn3Click(Sender: TObject);
var
  vcodpart: Integer;
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
  	BitBtn3.SetFocus;
  vcodpart := ComissaoPorVendaCons.vComissaoPart.dataSet.FieldByName('cod_vendedor1').AsInteger;
  if not ComissaoPorVendaCons.validarCampos('P') then
  begin
    setFocusCampoErro(ComissaoPorVendaCons.vNomeCampoErro, ComissaoPorVendaCons.vMensagemErro);
    exit;
  end;

  if not ComissaoPorVendaCons.atribuirComissaoPorVenda(0, 0, EditHwPercPart.AsValue, EditHwVlPart.AsValue,
  	0, ComissaoPorVendaCons.vComissaoPart.dataSet.FieldByName('cod_vendedor1').AsInteger) then
    exit;

  ComissaoPorVendaCons.vComissaoPart.abrePart(ComissaoPorVendaCons.dataSet.FieldByName('nped').AsInteger,
  	ComissaoPorVendaCons.dataSet.FieldByName('tipo').AsString, vcodpart);
  ComissaoPorVendaCons.dataSet.RefreshRecord;
  DBLookupComboBox2.KeyValue := vcodpart;

  BitBtn3.Enabled := false;
  BitBtn4.Enabled := true;
  EditHwPercPart.Enabled := false;
  EditHwVlPart.Enabled := false;


  Application.MessageBox(Pchar('Comissão atribuída ao ' + LowerCase(trim(vDadosIni.vPedVnd.descricaoParticipante))), 'Atenção', MB_ICONINFORMATION + MB_OK);  
end;

procedure TfrmComissaoPorVenda.BitBtn47Click(Sender: TObject);
begin
   TForm(PanelComissaoPorVenda.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmComissaoPorVenda.BitBtn4Click(Sender: TObject);
begin
  BitBtn3.Enabled := true;
  BitBtn4.Enabled := false;
  EditHwPercPart.Enabled := true;
  EditHwVlPart.Enabled := true;

  if (Self.Enabled) and (Self.Visible) and (EditHwPercPart.CanFocus) then
    EditHwPercPart.SetFocus;
end;

procedure TfrmComissaoPorVenda.btDefinirComissaoClick(Sender: TObject);
begin
  ComissaoPorVendaCons.abreFormDefComissao;
end;

procedure TfrmComissaoPorVenda.btPesquisarClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ComissaoPorVendaCons.abreComissaoPorVenda(edDataIni.Text, edDataFim.Text, rbRazaoSocial.Checked,
    	rbFechada.Checked, rbAberta.Checked);
    if (Self.Enabled) and (Self.Visible) and (gridVendas.CanFocus) then
      gridVendas.SetFocus;
  finally
    _GravaConfiguracoesBoolean(rbRazaoSocial.Name, rbRazaoSocial.Checked);
    _GravaConfiguracoesBoolean(rbFechada.Name, rbFechada.Checked);
    _GravaConfiguracoesBoolean(rbAberta.Name, rbAberta.Checked);
    _GravaConfiguracoesString(edDataIni.Name, edDataIni.Text);
    _GravaConfiguracoesString(edDataFim.Name, edDataFim.Text);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmComissaoPorVenda.btVoltarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmComissaoPorVenda.DBLookupComboBox1Exit(Sender: TObject);
begin
  EditHwVlProdVend.AsValue := ComissaoPorVendaCons.vComissaoVend.dataSet.FieldByName('valor_total').AsFloat;
  EditHwPercVend.AsValue := ComissaoPorVendaCons.vComissaoVend.dataSet.FieldByName('perc_comissao_vend').AsFloat;
  EditHwVlVend.AsValue := ComissaoPorVendaCons.vComissaoVend.dataSet.FieldByName('vl_comissao_vend').AsFloat;
end;

procedure TfrmComissaoPorVenda.DBLookupComboBox2Exit(Sender: TObject);
begin
  EditHwVlProdPart.AsValue := ComissaoPorVendaCons.vComissaoPart.dataSet.FieldByName('valor_total').AsFloat;
  EditHwPercPart.AsValue := ComissaoPorVendaCons.vComissaoPart.dataSet.FieldByName('perc_comissao_vend1').AsFloat;
  EditHwVlPart.AsValue := ComissaoPorVendaCons.vComissaoPart.dataSet.FieldByName('vl_comissao_vend1').AsFloat;
end;

procedure TfrmComissaoPorVenda.EditHwPercPartExit(Sender: TObject);
begin
  if not BitBtn3.Enabled then
   exit;

  if EditHwVlProdPart.AsValue > 0 then
    if EditHwPercPart.AsValue > 0 then
    begin
      EditHwVlPart.AsValue :=
       (0.01 *  Trunc(((EditHwVlProdPart.AsValue / 100) * EditHwPercPart.AsValue) * 100));
      EditHwVlPart.Enabled := false;
    end
    else
    begin
      EditHwPercPart.AsValue := 0;
      EditHwVlPart.AsValue := 0;
      EditHwVlPart.Enabled := true;
    end;

  if (activecontrol = bitbtn3) or (activecontrol = bitbtn47) then
    exit;

//  if EditHwVlPart.AsValue > 0 then
//  begin
    if (Self.Enabled) and (Self.Visible) and (EditHwVlPart.CanFocus) then
      EditHwVlPart.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	  BitBtn4.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
  	  BitBtn3.SetFocus;
//  end;
end;

procedure TfrmComissaoPorVenda.EditHwPercVendExit(Sender: TObject);
begin
 if not BitBtn1.Enabled then
  exit;
   
 if EditHwVlProdVend.AsValue > 0 then
    if EditHwPercVend.AsValue > 0 then
    begin
      EditHwVlVend.AsValue :=
       (0.01 *  Trunc(((EditHwVlProdVend.AsValue / 100) * EditHwPercVend.AsValue) * 100));
      EditHwVlVend.Enabled := false;
    end
    else
    begin
      EditHwPercVend.AsValue := 0;
      EditHwVlVend.AsValue := 0;
      EditHwVlVend.Enabled := true;
    end;

  if (activecontrol = bitbtn1) or (activecontrol = bitbtn47) then
    exit;

//  if EditHwVlVend.AsValue > 0 then
//  begin
    if (Self.Enabled) and (Self.Visible) and (EditHwVlVend.CanFocus) then
      EditHwVlVend.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn2.CanFocus) then
  	  BitBtn2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
     	BitBtn1.SetFocus;
//  end;
end;

procedure TfrmComissaoPorVenda.EditHwVlPartExit(Sender: TObject);
begin
 if not BitBtn3.Enabled then
  exit;

 if EditHwVlProdPart.AsValue > 0 then
  if EditHwVlPart.AsValue > 0 then
  begin
    EditHwPercPart.AsValue :=
     (0.01 *	Trunc(((EditHwVlPart.AsValue / EditHwVlProdPart.AsValue) * 100) * 100));
    EditHwPercPart.Enabled := false;
  end
  else
  begin
    EditHwPercPart.AsValue := 0;
    EditHwVlPart.AsValue := 0;
    EditHwPercPart.Enabled := true;
  end;

  if (activecontrol = bitbtn3) or (activecontrol = bitbtn47) then
    exit;

  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
  	BitBtn3.SetFocus;
end;

procedure TfrmComissaoPorVenda.EditHwVlVendExit(Sender: TObject);
begin
 if not BitBtn1.Enabled then
  exit;

 if EditHwVlProdVend.AsValue > 0 then
  if EditHwVlVend.AsValue > 0 then
  begin
    EditHwPercVend.AsValue :=
     (0.01 *	Trunc(((EditHwVlVend.AsValue / EditHwVlProdVend.AsValue) * 100) * 100));
    EditHwPercVend.Enabled := false;
  end
  else
  begin
    EditHwPercVend.AsValue := 0;
    EditHwVlVend.AsValue := 0;
    EditHwPercVend.Enabled := true;
  end;

  if (activecontrol = bitbtn1) or (activecontrol = bitbtn47) then
    exit;

  if (Self.Enabled) and (Self.Visible) and (BitBtn2.CanFocus) then
  	BitBtn2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
  	BitBtn1.SetFocus;
end;

procedure TfrmComissaoPorVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   if (ComissaoPorVendaCons <> nil) then
    ComissaoPorVendaCons.Cancel;

  ComissaoPorVendaCons.free;
  ComissaoPorVendaCons := nil;

  Action := caFree;
  if (frmComissaoPorVenda <> nil) then
    frmComissaoPorVenda := nil;
end;

procedure TfrmComissaoPorVenda.FormCreate(Sender: TObject);
begin
	if DtmPedVenda = nil then
  	DtmPedVenda := TDtmPedVenda.Create(DtmPedVenda);

  ComissaoPorVendaCons := TComissaoPorVendaCons.create(DtmPedVenda);
end;

procedure TfrmComissaoPorVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btVoltarClick(Sender);
end;

procedure TfrmComissaoPorVenda.FormShow(Sender: TObject);
var
  I: Integer;
  ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
begin
	try
  	gridVendas.DataSource := DtmPedVenda.dsComissaoPorVendaCons;
    DBGrid1.DataSource    := DtmPedVenda.dsFormasPorVenda;
    DBEdit20.DataSource   :=  DtmPedVenda.dsComissaoPorVendaCons;
    DBEdit21.DataSource   :=  DtmPedVenda.dsComissaoPorVendaCons;
    DBEdit22.DataSource   :=  DtmPedVenda.dsComissaoPorVendaCons;
    DBEdit23.DataSource   :=  DtmPedVenda.dsComissaoPorVendaCons;
    DBEdit1.DataSource    :=  DtmPedVenda.dsComissaoPorVendaCons;
    DBEdit2.DataSource    :=  DtmPedVenda.dsComissaoPorVendaCons;
    DBEdit3.DataSource    :=  DtmPedVenda.dsComissaoPorVendaCons;
    DBEdit4.DataSource    :=  DtmPedVenda.dsComissaoPorVendaCons;
    DBEdit5.DataSource    :=  DtmPedVenda.dsComissaoPorVendaCons;
    DBEdit6.DataSource    :=  DtmPedVenda.dsComissaoPorVendaCons;

    DBLookupComboBox1.ListSource := DtmPedVenda.dsComissaoVend;
    DBLookupComboBox2.ListSource := DtmPedVenda.dsComissaoPart;

  	ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', ComissaoPorVendaCons.buscas, vDadosIni.cod_empresa);
		vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

    TabSheet1.TabVisible := false;
    TabSheet2.TabVisible := false;
    PageControl1.ActivePage := TabSheet1;
    TabSheet1.Show;
    rbNomeFantasia.Checked := True;
    rbRazaoSocial.Checked := _LerConfiguracoesRegistroBoolean(rbRazaoSocial.Name);

    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.PesqPros('VND243', 'HABILITAR', '', 'PEDVENDA', '', DtmPedVenda.qrBuscas, true) then
    begin
      rbFechada.Checked := _LerConfiguracoesRegistroBoolean(rbFechada.Name);
      rbAberta.Checked := _LerConfiguracoesRegistroBoolean(rbAberta.Name);
    end
    else
    begin
      GroupBox3.Visible := false;
      rbFechada.Checked := true;
      rbAberta.Checked := false;
      Panel29.Visible := false;
    end;
    edDataIni.Text := _LerConfiguracoesRegistroString(edDataIni.Name, DateToStr(date));
    edDataFim.Text := _LerConfiguracoesRegistroString(edDataFim.Name, DateToStr(date));
    rbNomeFantasiaClick(rbNomeFantasia);
    if (vDadosIni.vPedVnd.habPartipante) then
    begin
      gridVendas.DataSource.DataSet.FieldByName('VL_COMISSAO_VEND1').DisplayLabel := 'Comissao ' + trim(vDadosIni.vPedVnd.descricaoParticipante);
      gridVendas.DataSource.DataSet.FieldByName('PERC_COMISSAO_VEND1').DisplayLabel := 'Perc Comissao ' + trim(vDadosIni.vPedVnd.descricaoParticipante);
    end;

    ComissaoPorVendaCons.abreComissaoPorVenda(edDataIni.Text, edDataFim.Text, rbRazaoSocial.Checked, rbFechada.Checked, rbAberta.Checked);
     for I := 0 to gridVendas.Columns.Count - 1 do
        if (not vDadosIni.vPedVnd.habPartipante)
         and ((gridVendas.Columns[i].FieldName = 'VL_COMISSAO_VEND1') or (gridVendas.Columns[i].FieldName = 'PERC_COMISSAO_VEND1')) then
       begin
         gridVendas.Columns[i].Visible := false;
         gridVendas.Columns[i].Width := -1;
       end
       else if (vDadosIni.vPedVnd.habPartipante) then
         gridVendas.Columns[i].DisplayName := 'Comissao ' + LowerCase(trim(vDadosIni.vPedVnd.descricaoParticipante))
       else if (vUsarControlesVenda <> 'S')
         and (gridVendas.Columns[i].FieldName = 'NOME_CTRL') then
       begin
         gridVendas.Columns[i].Visible := false;
         gridVendas.Columns[i].Width := -1;
       end;

    gridVendas.DataSource.DataSet.FieldByName('DESC_COND_PAG').Tag := 1;
    gridVendas.DataSource.DataSet.FieldByName('DESC_COND_PAG').Visible := false;
    if (Self.Enabled) and (Self.Visible) and (edDataIni.CanFocus) then
      edDataIni.SetFocus;
    vDadosIni.fechaStatusProcessamento;
  finally
  	if Assigned(ConfigPoliticaPag) then
    	FreeAndNil(ConfigPoliticaPag);
  end;
end;

procedure TfrmComissaoPorVenda.gridVendasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Column.Field.DataSet.FieldByName('NPED').AsInteger > 0)
    and (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_PED').AsString)) = '') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00898B5A);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmComissaoPorVenda.PanelComissaoPorVendaEnter(Sender: TObject);
begin
  if PanelComissaoPorVenda.Tag <> 99 then
    exit;

  PanelComissaoPorVenda.Tag := 0;  

//  if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
//    EditHw1.SetFocus
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    DBLookupComboBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwPercVend.CanFocus) then
    EditHwPercVend.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwVlVend.CanFocus) then
    EditHwVlVend.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn2.CanFocus) then
    BitBtn2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwPercPart.CanFocus) then
    EditHwPercPart.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwVlPart.CanFocus) then
    EditHwVlPart.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
end;

procedure TfrmComissaoPorVenda.rbNomeFantasiaClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if rbNomeFantasia.Checked then
    for I := 0 to gridVendas.Columns.Count - 1 do
      if gridVendas.Columns[i].FieldName = 'RAZAO' then
        gridVendas.Columns[i].FieldName := 'NOME_CLIENTE';

  if rbRazaoSocial.Checked then
    for I := 0 to gridVendas.Columns.Count - 1 do
      if gridVendas.Columns[i].FieldName = 'NOME_CLIENTE' then
        gridVendas.Columns[i].FieldName := 'RAZAO';
end;

initialization
  RegisterClass(TfrmComissaoPorVenda);
finalization
  UnRegisterClass(TfrmComissaoPorVenda);

end.
