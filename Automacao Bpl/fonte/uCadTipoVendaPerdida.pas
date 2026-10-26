unit uCadTipoVendaPerdida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, uClassesVendaPerdida, DBCtrls, AppEvnts;

type
  TfrmCadTipoVendaPerdida = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoVendaPerdida: TfrmCadTipoVendaPerdida;
  obTipVp:TTipoVendaPerdida;

implementation

uses
  uDtmVendaPerdida, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadTipoVendaPerdida.BitBtn1Click(Sender: TObject);
begin
  //  if not vDadosIni.PesqPros('PRO041', '', Grupo.buscas, true) then
  //    Exit;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [VND113]';
  if not vDadosIni.PesqPros('VND109', 'PESQUISAR', '', 'TIPOVP', '', obTipVp.buscas, true) then
    Exit;
  inherited;
  if MaskEdit2.Visible then
  begin
    if not obTipVp.ConsultaCampos('TIPOVP', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if obTipVp.ConsultaCampos('TIPOVP', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadTipoVendaPerdida.BitBtn2Click(Sender: TObject);
begin
  obTipVp.Cancel;
    inherited;
end;

procedure TfrmCadTipoVendaPerdida.BitBtn3Click(Sender: TObject);
begin
  //  if not vDadosIni.PesqPros('PRO042', '', obTipVp.buscas, true) then
  //    exit;
  if not vDadosIni.PesqPros('VND110', 'PESQUISAR', '', 'TIPOVP', '', obTipVp.buscas, true) then
    Exit;

  if not obTipVp.Insert then
    exit;
//  ActiveControl := BitBtn3;
  inherited;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmCadTipoVendaPerdida.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VND111', 'CONFIRMAR', '', 'TIPOVP', '', obTipVp.buscas, true) then
    Exit;

  if not obTipVp.Post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obTipVp.vNomeCampoErro, obTipVp.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obTipVp.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadTipoVendaPerdida.BitBtn5Click(Sender: TObject);
begin
  obTipVp.Cancel;
  inherited;     
end;

procedure TfrmCadTipoVendaPerdida.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if (key = VK_RETURN) then
    SpeedButton1Click(Sender);
  if key = VK_DELETE then
    SpeedButton2Click(Sender);
end;

procedure TfrmCadTipoVendaPerdida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obTipVp.Free;
  obTipVp := nil;
  frmCadTipoVendaPerdida := nil;
end;

procedure TfrmCadTipoVendaPerdida.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obTipVp := TTipoVendaPerdida.Create;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadTipoVendaPerdida.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (obTipVp.dataSet.State in[dsEdit,dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadTipoVendaPerdida.FormShow(Sender: TObject);
begin
	if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmVendaPerdida.dsTipVP;
    CheckBox3.Enabled := false;
    CheckBox1.Enabled := false;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not obTipVp._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadTipoVendaPerdida.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  //  if vDadosIni.PesqPros('PRO043', obTipVp.dataSet.FieldByName('cod_grade').AsString, obTipVp.buscas, true) then
//  exit;
  if not vDadosIni.PesqPros('VND112', 'EDITAR', '', 'TIPOVP', obTipVp.dataSet.FieldByName('CODIGO_VP').AsString, obTipVp.buscas, true) then
    Exit;

  if obTipVp.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    Exit;
  PageControl3.ActivePage := TabSheet3;
  if obTipVp.Edit then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
end;

procedure TfrmCadTipoVendaPerdida.SpeedButton25Click(Sender: TObject);
begin
//  if not vDadosIni.PesqPros('PRO047', '', obTipVp.buscas, true) then
//    exit;
  if not vDadosIni.PesqPros('VND114', 'EDITAR', '', 'TIPOVP', obTipVp.dataSet.FieldByName('CODIGO_VP').AsString, obTipVp.buscas, true) then
    Exit;
  if not obTipVp.AbrirLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [VND113]';
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [VND113]';
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
  end;
end;

procedure TfrmCadTipoVendaPerdida.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND113', 'EXCLUIR', '', 'TIPOVP', obTipVp.dataSet.FieldByName('CODIGO_VP').AsString, obTipVp.buscas, true) then
    Exit;
  if not obTipVp.dataSet.IsEmpty then
    if obTipVp.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    begin
      if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
        //        if not vDadosIni.PesqPros('PRO044', obTipVp.dataSet.FieldByName('CODIGO_GRUP').AsString,
        //          obTipVp.buscas, true) then
        //          exit;
        if obTipVp.Delete then
          if obTipVp.Apply then
            if obTipVp.emTransacao then
              obTipVp.CommitaTransacao;
    end
    else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      //      if vDadosIni.PesqPros('PRO045', obTipVp.dataSet.FieldByName('CODIGO_GRUP').AsString,
      //        obTipVp.buscas, true) then
      //        exit;
      if obTipVp.Edit then
      begin
        obTipVp.dataSet.FieldByName('ATIVO').asinteger := 0;
        if obTipVp.Post then
          if obTipVp.Apply then
            if obTipVp.emTransacao then
              obTipVp.CommitaTransacao;
      end;
    end;
  obTipVp.Refresh;
  lixeiraVazia(not obTipVp._lixeiraCheia);
end;

procedure TfrmCadTipoVendaPerdida.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND114', 'EDITAR', '', 'TIPOVP', '',obTipVp.buscas, true) then
    Exit;
  if not obTipVp.AbrirLixeira then
  begin
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end
  else
  begin
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
  end;
end;

procedure TfrmCadTipoVendaPerdida.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND115', 'RESTAURAR', '', 'TIPOVP', obTipVp.dataSet.FieldByName('CODIGO_VP').AsString, obTipVp.buscas, true) then
    Exit;

  if not obTipVp.dataSet.IsEmpty then
    if obTipVp.dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      begin
        //        if not vDadosIni.PesqPros('PRO046', obTipVp.dataSet.FieldByName('CODIGO_GRUP').AsString, obTipVp.buscas, true) then
        //          exit;
        if obTipVp.Edit then
        begin
          obTipVp.dataSet.FieldByName('ATIVO').asinteger := 1;
          if obTipVp.Post then
            if obTipVp.Apply then
                obTipVp.CommitaTransacao;
        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + chr(13) +
        'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
  obTipVp.Refresh;
  lixeiraVazia(not obTipVp._lixeiraCheia);
end;

end.
