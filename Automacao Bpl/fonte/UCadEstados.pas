unit UCadEstados;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadrao, DBCtrls, ExtCtrls, Menus,
  ComCtrls, Buttons, Grids, DBGrids, Controls, StdCtrls, Mask, Forms, Classes,
  AppEvnts,uCadpadraoModal, Graphics;

type
  TFrmCadEstados = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label453: TLabel;
    DBEdit242: TDBEdit;
    ApplicationEvents1: TApplicationEvents;
    RadioGroupMascaraTelefone: TRadioGroup;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    procedure RadioGroupMascaraTelefoneClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure retornaMascara(var radiogrupo: TRadioGroup; pTipo: Integer = 0);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadEstados: TFrmCadEstados;
  Estado: TEstados;

implementation

uses UDtmCadastrosBasicos, UMudCFOP, uCSTMudGeral, uDtmAtivo, SysUtils, DB;

{$R *.dfm}

procedure TFrmCadEstados.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS040]';
  if vDadosIni.PesqPros('BAS036', 'PESQUISAR', '', 'ESTADOS', '', Estado.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Estado.ConsultaCampos('ESTADOS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not Estado.ConsultaCampos('ESTADOS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if Estado.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    Estado.ultimasql := Estado.dataset.CommandText;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadEstados.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS037', 'INSERINDO NOVO REGISTRO', '', 'ESTADOS', '', Estado.buscas, true) then
  begin
    if Estado.Insert then
    begin
      inherited;
      TabSheet3.Caption := 'Cadastrar Estado';
      TabSheet3.TabVisible := true;
      TabSheet3.Show;
      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus;
      Estado.AbreEstadosIBGE;
      Label10.Visible := false;
      DBEdit4.Visible := false;
      RadioGroupMascaraTelefone.ItemIndex := 1;
    end;
  end;
end;

procedure TFrmCadEstados.BitBtn4Click(Sender: TObject);
begin
  retornaMascara(RadioGroupMascaraTelefone);
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
  if not Estado.Post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Estado.vNomeCampoErro, Estado.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if Estado.Insert then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end
      else
      begin
        CheckCadSeq.Checked := false;
        Estado.Cancel;
        inherited;
        exit;
      end;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadEstados.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS044','CANCELAR', '','ESTADOS',Estado.dataSet.FieldByName('SIGLA_UF').AsString, Estado.buscas, true) then
//  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    Estado.Cancel;
    Estado.RollBackTransacao;
    inherited;
//  end;
end;

procedure TFrmCadEstados.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TFrmCadEstados.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox1.Text <> '' then
  begin
    Label10.Visible := true;
    DBEdit4.Visible := true;
  end
  else
  begin
    Label10.Visible := false;
    DBEdit4.Visible := false;
  end;
end;

procedure TFrmCadEstados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  {  if Estado.dataSet.State = dsEdit then
    begin
      Estado.Post;
      if Estado.confirmaAlteracao then
      begin
        if Estado.Apply then
          Estado.CommitaTransacao;
      end
      else if Estado.emTransacao then
      begin
        Estado.Cancel;
        Estado.RollBackTransacao;
      end;
    end
    else
    begin
      Estado.Cancel;
      Estado.RollBackTransacao;
    end;
    Estado.abreEstados;
    if vDadosIni.vTipoForm <> 1 then
      Estado.Destroy;
    Action := caFree;
    FrmCadEstados := nil;}

//  if Estado.confirmaAlteracao then
//  begin
//    if not Estado.Post then
//    begin
//      Estado.Cancel;
//      Estado.RollBackTransacao;
//    end
//  end
//  else
//  begin
//    Estado.Cancel;
//    Estado.RollBackTransacao;
//  end;
  vDadosIni.atualizarVariaveisEmpresa(Estado.buscas);
  Estado.Cancel;
  Estado.RollBackTransacao;
  Estado.free;
  Action := caFree;
  FrmCadEstados := nil;
end;

procedure TFrmCadEstados.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Estado := TEstados.Create;
  DBGrid1.DataSource := DtmCadBasicos.dsEstados;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadEstados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end
end;

procedure TFrmCadEstados.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadEstados.RadioGroupMascaraTelefoneClick(Sender: TObject);
begin
  inherited;
  retornaMascara(RadioGroupMascaraTelefone, 1);
end;

procedure TFrmCadEstados.retornaMascara(var radiogrupo: TRadioGroup; pTipo: Integer = 0);
begin
 if pTipo = 1 then
 begin
   if radiogrupo.ItemIndex = 1 then
   begin
     if (Estado.dataSet.State in [dsInsert, dsEdit]) then
       Estado.dataSet.FieldByName('MASCARA_FONE').AsString := '(99) 99999-9999;0;_';
   end
   else
   begin
      if (Estado.dataSet.State in [dsInsert, dsEdit]) then
       Estado.dataSet.FieldByName('MASCARA_FONE').AsString := '(99) 9999-9999;0;_';
   end;
 end
 else
 begin
   if trim(Estado.dataSet.FieldByName('MASCARA_FONE').AsString) = '(99) 9999-9999;0;_' then
   begin
     if (Estado.dataSet.State in [dsInsert, dsEdit]) then
       Estado.dataSet.FieldByName('MASCARA_FONE').AsString := '(99) 9999-9999;0;_';
     radiogrupo.ItemIndex := 0;
   end
   else
   begin
     if (Estado.dataSet.State in [dsInsert, dsEdit]) then
       Estado.dataSet.FieldByName('MASCARA_FONE').AsString := '(99) 99999-9999;0;_';
     radiogrupo.ItemIndex := 1;
   end;
 end;
end;

procedure TFrmCadEstados.SpeedButton1Click(Sender: TObject);
begin
  if not Estado.dataSet.IsEmpty then
    if vDadosIni.PesqPros('BAS038', 'EDITANDO REGISTRO', '', 'ESTADOS', Estado.dataSet.FieldByName('SIGLA_UF').AsString, Estado.buscas, true) then
    begin
      if Estado.dataSet.FieldByName('ATIVO').AsInteger = 1 then
        if Estado.Edit then
        begin
          inherited;
          PageControl1.ActivePage := TabSheet1;
          TabSheet1.show;
          TabSheet3.Caption := 'Alterar Estado';
          TabSheet3.TabVisible := true;
          PageControl3.ActivePage := TabSheet3;
          if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;

          Estado.AbreEstadosIBGE;
          retornaMascara(RadioGroupMascaraTelefone);
          Label10.Visible := false;
          DBEdit4.Visible := false;
          Estado.PreencheCampos;
        end;
    end;
end;

procedure TFrmCadEstados.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS042', 'ABRIR A LIXEIRA', '', 'ESTADOS', '', Estado.buscas, true) then
  begin
    inherited;
    if not Estado.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS040]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS039]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadEstados.SpeedButton2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS040', 'EXCLUIR', '', 'ESTADOS', '', Estado.buscas, false) then
  begin
    inherited;
    Estado.Delete;
    if Estado.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TFrmCadEstados.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS041', 'RESTAURAR', '', 'ESTADOS', '', Estado.buscas, false) then
  begin
    inherited;
    Estado.restauraLixeira;
    if Estado.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TFrmCadEstados.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if FrmMudCFOP = nil then
  begin
    Application.CreateForm(TFrmMudCFOP, FrmMudCFOP);
  end;
  FrmMudCFOP.Show;
end;

procedure TFrmCadEstados.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FrmCSTMudGeral = nil then
  begin
    Application.CreateForm(TFrmCSTMudGeral, FrmCSTMudGeral);
  end;
  FrmCSTMudGeral.Show;
end;

end.

