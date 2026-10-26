unit UCadServicoTransporte;

interface

uses
  Windows, uCadPadraoModal, StdCtrls, DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons,
  Grids, DBGrids, Controls, Mask, Forms, Classes, uDataSet_OOP,
  uEditMoeda, AppEvnts, Graphics;

type
  TfrmCadServicoTransporte = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit13: TDBEdit;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    Label23: TLabel;
    Label25: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    tsNotas: TTabSheet;
    GroupBox4: TGroupBox;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    Label9: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    EditMoeda1: TEditMoeda;
    EditMoeda2: TEditMoeda;
    EditMoeda3: TEditMoeda;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn38: TBitBtn;
    DBListBox1: TListBox;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label21: TLabel;
    DBEdit6: TDBEdit;
    Label24: TLabel;
    DBEdit9: TDBEdit;
    tsContasAPagarCadastro: TTabSheet;
    pnCPCad: TPanel;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    MaskEdit4: TMaskEdit;
    Label26: TLabel;
    Label27: TLabel;
    MaskEdit5: TMaskEdit;
    Label28: TLabel;
    MaskEdit6: TMaskEdit;
    CheckBox2: TCheckBox;
    Panel6: TPanel;
    BitBtn29: TBitBtn;
    BitBtn34: TBitBtn;
    tsSPED: TTabSheet;
    pnDadosSPED: TPanel;
    Panel4: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBComboBox4: TDBComboBox;
    DBComboBox14: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Panel8: TPanel;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    Label38: TLabel;
    DBEdit21: TDBEdit;
    lbChaveOperation: TLabel;
    altDadosTrBtn: TSpeedButton;
    chaveOperationSearchBtn: TSpeedButton;
    Label39: TLabel;
    lkCidadeOrigem: TDBLookupComboBox;
    lkCidadeDestino: TDBLookupComboBox;
    Label40: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label41: TLabel;
    lkTpCTe: TDBLookupComboBox;
    SpeedButton13: TSpeedButton;
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure altDadosTrBtnClick(Sender: TObject);
    procedure chaveOperationSearchBtnClick(Sender: TObject);
    procedure lbChaveOperationClick(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GroupBox1Enter(Sender: TObject);
    procedure pnDadosSPEDEnter(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure DBComboBox5Exit(Sender: TObject);
    procedure DBComboBox14Exit(Sender: TObject);
    procedure DBComboBox4Exit(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure EditMoeda3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure EditMoeda3Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure campoEnterPerform(Sender: TObject);
  private
    cidadeIBGE: TDadosLookUp_OOP;
    tpcte: TDadosLookUp_OOP;
    procedure MontarCadastro(isNew: Boolean);
  public
    { Public declarations }
    constructor Create2(AOwner: TComponent; pSsubSerie, pEntSaida: string;
    pNumNota, pCodClFor: integer);
  end;

var
  frmCadServicoTransporte: TfrmCadServicoTransporte;

implementation

uses
  uDadosIni, uDtmAtivo, SysUtils, Variants, uDtmNF, DB, Messages, uClassesNotasFiscais_ServTransporte,
  StrUtils, hw_utils, Clipbrd, hw_win_utils, Dialogs, uCadServicoTr_LancD195D197;

{$R *.dfm}

procedure cadservtransp_show(Amodal: Boolean);
begin
  vDadosIni.vTipoForm := 0;
  if not Assigned(frmCadServicoTransporte) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm(TfrmCadServicoTransporte, frmCadServicoTransporte);
  end;
  if frmCadServicoTransporte.FormStyle = fsMDIChild then
    frmCadServicoTransporte.Show
  else
    frmCadServicoTransporte.ShowModal;
end;

exports
  cadservtransp_show;

procedure TfrmCadServicoTransporte.altDadosTrBtnClick(Sender: TObject);
begin
  inherited;
  if not obServTransporte.Auditor.Alterar
    .Processo('NF0228')
    .Msg('COD TR: %d - NUM DOC: %d', [obServTransporte.fint('cod_transportador'), obServTransporte.fint('num_documento')])
    .Permitido() then
    exit;

  DBEdit2.OnEnter  := nil;
  DBEdit8.OnEnter  := nil;
  DBLookupComboBox1.ReadOnly := False;
  chaveOperationSearchBtn.Visible := True;

  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TfrmCadServicoTransporte.BitBtn10Click(Sender: TObject);
begin
  inherited;
  obServTransporte.delNotaFiscal(DBListBox1.ItemIndex, DBListBox1);
end;

procedure TfrmCadServicoTransporte.BitBtn1Click(Sender: TObject);
begin

  if not vDadosIni.PesqPros('NF0124', 'CONSULTA', '', 'SERVICO_TRANSPORTE', '', obServTransporte.buscas, false) then
    exit;

  inherited;

  if MaskEdit2.Visible then
  begin
    if not obServTransporte.ConsultaCampos('Servico_Transporte', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if obServTransporte.ConsultaCampos('Servico_Transporte', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadServicoTransporte.BitBtn20Click(Sender: TObject);
begin
  inherited;
  if obServTransporte._salvarDadosSPED then
    TForm(pnDadosSPED.Parent).ModalResult := IDOK;
end;

procedure TfrmCadServicoTransporte.BitBtn21Click(Sender: TObject);
begin
  inherited;
  TForm(pnDadosSPED.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadServicoTransporte.BitBtn29Click(Sender: TObject);
begin
  inherited;
  TForm(pnCPCad.Parent).ModalResult := IDOK;
end;

procedure TfrmCadServicoTransporte.BitBtn2Click(Sender: TObject);
begin
  obServTransporte.Cancel;
  inherited;
end;

procedure TfrmCadServicoTransporte.BitBtn34Click(Sender: TObject);
begin
  inherited;
  TForm(pnCPCad.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadServicoTransporte.BitBtn38Click(Sender: TObject);
begin
  inherited;
  PageControl3.ActivePage := TabSheet3;
end;

procedure TfrmCadServicoTransporte.BitBtn3Click(Sender: TObject);
var
  chave: string;
begin
  ActiveControl := BitBtn3;
  if not obServTransporte.Insert then
    exit;
  inherited;

  MontarCadastro(True);
  Exit;


  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  DBEdit2.OnEnter  := nil;
  DBEdit7.OnEnter  := nil;
  DBEdit8.OnEnter  := nil;
  DBLookupComboBox1.ReadOnly := False;
  DBListBox1.Items.Text := obServTransporte.dataSet.FieldByName('notas_fiscais').AsString;
  DBComboBox1.Enabled := Trim(obServTransporte.dataSet.FieldByName('tipo').AsString)  = '';
  if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    DBComboBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
     DBEdit2.SetFocus;
  DBRadioGroup1.ItemIndex := 0;

  if obServTransporte.ClipBoardHasChaveCte then
  begin
    lbChaveOperation.Visible := True;
    lbChaveOperation.Caption := Format('Emitente: %s Numero: %d Emissao: %s/20%s',
      [obServTransporte.CTeClipBoard.cnpj,
       obServTransporte.CTeClipBoard.numero,
       Copy(obServTransporte.CTeClipBoard.emissao, 3, 2),
       Copy(obServTransporte.CTeClipBoard.emissao, 1, 2)]);
  end
  else
    lbChaveOperation.Visible := False;
end;

procedure TfrmCadServicoTransporte.BitBtn4Click(Sender: TObject);
begin
  if not obServTransporte.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus;
  end
  else
  begin
    if TelaCadastro = 2 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if obServTransporte.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
          DBComboBox1.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
          DBComboBox2.SetFocus;
        MudaCor;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadServicoTransporte.BitBtn5Click(Sender: TObject);
begin
  obServTransporte.Cancel;
  if TelaCadastro = 2 then
  begin
    BitBtn6.Click;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadServicoTransporte.BitBtn7Click(Sender: TObject);
begin
  inherited;
  PageControl3.ActivePage := tsNotas;
end;

procedure TfrmCadServicoTransporte.BitBtn9Click(Sender: TObject);
begin
  inherited;
  obServTransporte.addNotaFiscal(Trunc(EditMoeda1.Valor), Trunc(EditMoeda2.Valor),
    Trunc(EditMoeda3.Valor), DBListBox1);
end;

procedure TfrmCadServicoTransporte.campoEnterPerform(Sender: TObject);
begin
//NAO APAGAR, ESTA LIGADO A VARIOS COMPONENTES
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadServicoTransporte.DBComboBox14Exit(Sender: TObject);
begin
  inherited;
  DBComboBox14.Text :=  DBComboBox14.Items[DBComboBox14.ItemIndex];
end;

procedure TfrmCadServicoTransporte.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
//  TDBComboBox(Sender).Text := TDBComboBox(Sender).Items[TDBComboBox(Sender).ItemIndex];
  DBEdit21.Enabled := copy(obServTransporte.dataSet.FieldByName('MODELO').AsString,1,2) = '57';
  lkTpCTe.Enabled := copy(obServTransporte.dataSet.FieldByName('MODELO').AsString,1,2) = '57';  
end;

procedure TfrmCadServicoTransporte.DBComboBox4Exit(Sender: TObject);
begin
  inherited;
  DBComboBox4.Text :=  DBComboBox4.Items[DBComboBox4.ItemIndex];
end;

procedure TfrmCadServicoTransporte.DBComboBox5Exit(Sender: TObject);
begin
  inherited;
  DBComboBox5.Text :=  DBComboBox5.Items[DBComboBox5.ItemIndex];
end;

procedure TfrmCadServicoTransporte.DBEdit17Exit(Sender: TObject);
begin
  inherited;
  obServTransporte.calulcarPISCOFINS;
end;

procedure TfrmCadServicoTransporte.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if DBEdit2.Text <> '' then
    DBLookupComboBox1.KeyValue := DBEdit2.Text;

end;

procedure TfrmCadServicoTransporte.DBEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('TRANSPORTADOR');
    if Trim(vDadosIni.vPesquisa) <> '' then    
      if obServTransporte.dataSet.State in [dsInsert, dsedit] then
        obServTransporte.dataSet.FieldByName('COD_TRANSPORTADOR').AsString := vDadosIni.vPesquisa;
  end;
end;

procedure TfrmCadServicoTransporte.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if DBEdit3.Text <> '' then
    DBLookupComboBox2.KeyValue := DBEdit3.Text
  else if not obServTransporte.validaCFOP then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
  		DBEdit3.SetFocus;
end;

procedure TfrmCadServicoTransporte.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  if obServTransporte.dataSet.FieldByName('aliq_icm').AsFloat > 0 then
  begin
    if obServTransporte.dataSet.FieldByName('BASE_CALC_ICMS').AsFloat = 0 then
      obServTransporte.dataSet.FieldByName('BASE_CALC_ICMS').AsFloat :=
        obServTransporte.dataSet.FieldByName('valor_total').AsFloat;
      obServTransporte.dataSet.FieldByName('valor_icms').AsFloat :=
        vDadosIni.StrToFloatFormat(obServTransporte.dataSet.FieldByName('BASE_CALC_ICMS').AsFloat*
        obServTransporte.dataSet.FieldByName('aliq_icm').AsFloat /100,2);
  end
  else
  begin
    obServTransporte.dataSet.FieldByName('BASE_CALC_ICMS').AsFloat := 0;
    obServTransporte.dataSet.FieldByName('valor_icms').AsFloat := 0;
    obServTransporte.dataSet.FieldByName('aliq_icm').AsFloat := 0;
  end;   
end;

procedure TfrmCadServicoTransporte.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  if obServTransporte.existeFreteCadastrado then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
      
    if obServTransporte.dataSet.State = dsEdit then
    begin
      DBEdit2.OnEnter  := campoEnterPerform;
      DBEdit7.OnEnter  := nil;
      DBEdit8.OnEnter  := campoEnterPerform;
      DBLookupComboBox1.ReadOnly := true;
    end;
  end;
  try
    if (obServTransporte.dataSet.State in [dsEdit, dsInsert]) and
      (trim(obServTransporte.dataSet.FieldByName('SUB_SERIE').AsString) <> '') then
      if StrToIntDef(Trim(obServTransporte.dataSet.FieldByName('SUB_SERIE').AsString), -99) <> -99 then
        obServTransporte.dataSet.FieldByName('SUB_SERIE').AsString :=
          vDadosIni.StrZero(StrToInt(trim(obServTransporte.dataSet.FieldByName('SUB_SERIE').AsString)), 2);
  except
  end;
end;

procedure TfrmCadServicoTransporte.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton1Click(sender);

  if (key = VK_DELETE) then
    SpeedButton2Click(sender);

  if key = VK_INSERT then
    BitBtn3Click(sender);

end;

procedure TfrmCadServicoTransporte.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox1.KeyValue = Null then
  begin
    Application.MessageBox('Transportador não pode ser vazio.', 'Atenção',
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
    exit;
  end
  else
    DBEdit2.Text := DBLookupComboBox1.KeyValue;
end;

procedure TfrmCadServicoTransporte.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if not obServTransporte.validaCFOP then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;
end;

procedure TfrmCadServicoTransporte.EditMoeda3Exit(Sender: TObject);
begin
  inherited;
  if EditMoeda3.Valor <= 0 then
    EditMoeda3.Text := vDadosIni.pesquisaRapida('CLIENTES');
end;

procedure TfrmCadServicoTransporte.EditMoeda3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    EditMoeda3.Text := vDadosIni.pesquisaRapida('CLIENTES');
end;

procedure TfrmCadServicoTransporte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cidadeIBGE.Free;
  tpcte.Free;
  Action := caFree;
  frmCadServicoTransporte := nil;
end;

constructor TfrmCadServicoTransporte.Create2(AOwner: TComponent; pSsubSerie,
  pEntSaida: string; pNumNota, pCodClFor: integer);
begin
  inherited Create(AOwner);
  TelaCadastro := vDadosIni.vTipoForm;
  obServTransporte := TServTransporte.create(pSsubSerie,pEntSaida,pNumNota,pCodClFor);
end;

procedure TfrmCadServicoTransporte.FormCreate(Sender: TObject);
begin
  inherited;
  if (vDadosIni.vModalOuChild <> 'M') then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := '';
  TelaCadastro := vDadosIni.vTipoForm;
  if obServTransporte = nil then
    obServTransporte := TServTransporte.create;

  cidadeIBGE := TDadosLookUp_OOP.create;
  tpcte := TDadosLookUp_OOP.create;
end;

procedure TfrmCadServicoTransporte.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_ESCAPE then
    BitBtn5Click(Sender);
end;

procedure TfrmCadServicoTransporte.FormShow(Sender: TObject);
var
  I: Integer;
begin

//  obServTransporte.abreServTransporte;
  DBGrid1.DataSource := DtmNF.dsServTransporte;
  tsNotas.TabVisible := False;
  TabSheet3.TabVisible := false;
  tsContasAPagarCadastro.TabVisible := False;
  tsSPED.TabVisible := False;
  inherited;

  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Components[I].Tag = 0 then
    begin
      if Components[I] is TDBEdit then
        TDBEdit(Components[I]).CharCase := ecUpperCase;
      if Components[I] is TDBComboBox then
        TDBComboBox(Components[I]).CharCase := ecUpperCase;
      if Components[I] is TEdit then
        TEdit(Components[I]).CharCase := ecUpperCase;
    end;
  end;

  if obServTransporte.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);

//  if vDadosIni.vEmp.vRegime = 'SIMPLES' then
//  begin
//    Label10.Caption := 'Data Lançamento';
//    Label24.Visible := False;
//    DBEdit9.Visible := False;
//  end
//  else
//  begin
//    Label10.Caption := 'Data Emissão';
//    Label24.Visible := True;
//    DBEdit9.Visible := True;
//  end;

//  SpeedButton6.Visible := (Pos('SIMPLES', vDadosIni.vEmp.vRegime) = 0) and
//    (vDadosIni.vEmp.vGerarSpedPISCOFINS = 'S') and
//    (vDadosIni.vEmp.vSpedIncidTribPISCOFINS <> '2');
  DBComboBox2.Style := csSimple;

  if TelaCadastro = 2 then
    SpeedButton1Click(SpeedButton1)
  else if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else if TelaCadastro = 3 then
    TelaCadastro := 0;
end;

procedure TfrmCadServicoTransporte.GroupBox1Enter(Sender: TObject);
begin
  inherited;
  DBEdit21.Enabled := obServTransporte.dataSet.FieldByName('MODELO').AsString = '57';
end;

procedure TfrmCadServicoTransporte.lbChaveOperationClick(Sender: TObject);
begin
  inherited;
  obServTransporte.CopyCteFromClipboard;
end;

procedure TfrmCadServicoTransporte.MontarCadastro(isNew: Boolean);
var
  isEdit: Boolean;
  dsCidades: TDataSet;
begin
  isEdit := not isNew;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  DBListBox1.Items.Text := obServTransporte.dataSet.FieldByName('notas_fiscais').AsString;
  DBComboBox1.Enabled := Trim(obServTransporte.dataSet.FieldByName('tipo').AsString)  = '';
  altDadosTrBtn.Visible := isEdit;
  DBLookupComboBox1.ReadOnly := isEdit;

  if isNew then
  begin
    DBEdit2.OnEnter  := nil;
    DBEdit8.OnEnter  := nil;
    //DBLookupComboBox1.ReadOnly := False;
    DBRadioGroup1.ItemIndex := 0;
  end
  else
  begin
    DBEdit2.OnEnter  := campoEnterPerform;
    DBEdit8.OnEnter  := campoEnterPerform;
    //DBLookupComboBox1.ReadOnly := true;
  end;

  if isNew and obServTransporte.ClipBoardHasChaveCte then
  begin
    lbChaveOperation.Visible := True;
    lbChaveOperation.Caption := Format('Emitente: %s Numero: %d Emissao: %s/20%s. Clique aqui para alterar',
      [obServTransporte.CTeClipBoard.cnpj,
       obServTransporte.CTeClipBoard.numero,
       Copy(obServTransporte.CTeClipBoard.emissao, 3, 2),
       Copy(obServTransporte.CTeClipBoard.emissao, 1, 2)]);
  end
  else
    lbChaveOperation.Visible := False;

  chaveOperationSearchBtn.Visible := isNew;//.Visible or isEdit;

  dsCidades := obServTransporte.GetCidadesIbgeDS();
  cidadeIBGE.setDadosDataSet('id', 'cidade;estado', dsCidades, lkCidadeOrigem);
  cidadeIBGE.setDBLookupComboBox(lkCidadeDestino);
  tpcte.setDadosDataSetV(ftInteger, [Null, '0', '1', '3'],
    ['', '0 - CT-e Normal', '1 - CT-e de Complemento de Valores', '3 - CT-e substituto'], lkTpCTe);

  if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    DBComboBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmCadServicoTransporte.pnDadosSPEDEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox4.CanFocus) then
  	DBComboBox4.SetFocus;
  
  for I := 0 to DBComboBox4.Items.Count - 1 do
    if DBComboBox4.Text = copy(DBComboBox4.Items[I],1,2) then
    begin
      DBComboBox4.ItemIndex := I;
      Break;
    end;

  for I := 0 to DBComboBox5.Items.Count - 1 do
    if DBComboBox5.Text = copy(DBComboBox5.Items[I],1,2) then
    begin
      DBComboBox5.ItemIndex := I;
      Break;
    end;

  for I := 0 to DBComboBox14.Items.Count - 1 do
    if DBComboBox14.Text = copy(DBComboBox14.Items[I],1,2) then
    begin
      DBComboBox14.ItemIndex := I;
      Break;
    end;
end;

procedure TfrmCadServicoTransporte.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if obServTransporte.dataSet.State in [dsInsert, dsEdit] then
    obServTransporte.dataSet.FieldByName('cod_mun_dest').AsString := '';
end;

procedure TfrmCadServicoTransporte.SpeedButton13Click(Sender: TObject);
var
  form: TfrmCadServicoTr_LancD195D197;
begin
  inherited;

  if not obServTransporte.Ajuste.Auditor
    .Processo('NF0252')
    .Visualizar
    .Permitido then
    Exit;

  try
    Screen.Cursor := crHourGlass;

    Application.CreateForm(TfrmCadServicoTr_LancD195D197, form);

    form.Init(obServTransporte);
    form.ShowModal;
    form.Release;

    obServTransporte.Refresh;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadServicoTransporte.SpeedButton1Click(Sender: TObject);
begin
  if obServTransporte.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;
  inherited;
  if not obServTransporte.Edit then
    exit;

  MontarCadastro(False);
  Exit;
  
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  DBEdit2.OnEnter  := campoEnterPerform;
  DBEdit7.OnEnter  := nil;
  DBEdit8.OnEnter  := campoEnterPerform;
  DBListBox1.Items.Text := obServTransporte.dataSet.FieldByName('notas_fiscais').AsString;
  DBComboBox1.Enabled := Trim(obServTransporte.dataSet.FieldByName('tipo').AsString)  = '';
  if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    DBComboBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
  DBLookupComboBox1.ReadOnly := true;
// 	if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then	
//  	DBComboBox1.SetFocus;
end;

procedure TfrmCadServicoTransporte.SpeedButton25Click(Sender: TObject);
begin

  inherited;
  if not obServTransporte.abrelixeira then
  begin
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;

end;

procedure TfrmCadServicoTransporte.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obServTransporte.Delete then
  begin
    if obServTransporte.StatusLixeira then
    begin
      lixeiraVazia(false);
    end
    else
      lixeiraVazia(true);
  end;
end;

procedure TfrmCadServicoTransporte.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if obServTransporte.restauraLixeira then
  begin
    if obServTransporte.StatusLixeira then
      lixeiraVazia(false)
    else
      lixeiraVazia(true);
  end;
end;

procedure TfrmCadServicoTransporte.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    obServTransporte._verificarDadosSPED;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadServicoTransporte.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if obServTransporte.dataSet.State in [dsInsert, dsEdit] then
    obServTransporte.dataSet.FieldByName('cod_mun_orig').AsString := '';
end;

procedure TfrmCadServicoTransporte.chaveOperationSearchBtnClick(Sender: TObject);
var
  chaveNFe: string;
begin
  inherited;

  chaveNFe := OnlyNumber(Clipboard.AsText);

  if Length(chaveNFe) <> 44 then
    chaveNFe := string(RegistroWin.Read(Self.Name, 'ChaveCte', chaveNFe));

  if not InputQuery('Chave CTe', 'Informe a chave do CTe', chaveNFe) then
    Exit;

  if obServTransporte.ClipBoardHasChaveCte(chaveNFe) then
     obServTransporte.CopyCteFromClipboard
  else
    ShowAtencao('Chave CTe inválida');

  lbChaveOperation.Visible := False;

end;

end.

