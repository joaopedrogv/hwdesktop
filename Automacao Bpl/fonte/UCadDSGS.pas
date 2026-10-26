unit UCadDSGS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, Buttons, Grids, DBGrids, StdCtrls, Mask,
  ComCtrls, UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo, DBCtrls, DB,
  AppEvnts;

type
  TFrmCadDSGS = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    procedure BitBtn6Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadDSGS: TFrmCadDSGS;
  DSGS: TDsgs;

implementation

{$R *.dfm}

procedure TFrmCadDSGS.BitBtn1Click(Sender: TObject);
begin
 SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO036]';
//  if vDadosIni.PesqPros('PRO032', '', Dsgs.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not DSGS.ConsultaCampos('G_DSGS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if DSGS.ConsultaCampos('G_DSGS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadDSGS.BitBtn3Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('PRO033', '', Dsgs.buscas, true) then
  begin
    inherited;
    TabSheet3.TabVisible := true;
    PageControl3.ActivePage := TabSheet3;
    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
    if DSGS.Insert then
      DSGS.PreencheCampos;
  end;
end;

procedure TFrmCadDSGS.BitBtn4Click(Sender: TObject);
begin
  if Dsgs.dataSet.State = dsEdit then
    statusDataset := 'E'
  else
    statusDataset := 'I';
  if not DSGS.ChecaDsgs then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
    exit;
  end;

  inherited;

  if not DSGS.Post then
    Application.MessageBox('Erro ao gravar o DSGS.' + chr(13) + 'Tente novamente.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  if DSGS.Apply then
  begin
    if DSGS.CommitaTransacao then
    begin
      if statusDataset = 'E' then
//        vDadosIni.GravaAuditoria('PRO039', 'ALTEREÇÃO CONFIRMADA ' + Dsgs.dataSet.FieldByName('COD_DSGS').asstring, Dsgs.buscas)
      else if statusDataset = 'I' then
//        vDadosIni.GravaAuditoria('PRO039', 'INCLUSÃO CONFIRMADA ' + Dsgs.dataSet.FieldByName('COD_DSGS').asstring, Dsgs.buscas);
    end
    else
    begin
      if statusDataset = 'E' then
//        vDadosIni.GravaAuditoria('PRO039', 'ALTEREÇÃO NÃO CONFIRMADA ' + Dsgs.dataSet.FieldByName('COD_DSGS').asstring, Dsgs.buscas)
      else if statusDataset = 'I' then
//        vDadosIni.GravaAuditoria('PRO039', 'INCLUSÃO NÃO CONFIRMADA ' + Dsgs.dataSet.FieldByName('COD_DSGS').asstring, Dsgs.buscas);
    end;
  end
  else
  begin
    DSGS.Cancel;
    DSGS.RollBackTransacao;
    if statusDataset = 'E' then
//      vDadosIni.GravaAuditoria('PRO039', 'ALTEREÇÃO NÃO CONFIRMADA ' + Dsgs.dataSet.FieldByName('COD_DSGS').asstring, Dsgs.buscas)
    else if statusDataset = 'I' then
//      vDadosIni.GravaAuditoria('PRO039', 'INCLUSÃO NÃO CONFIRMADA ' + Dsgs.dataSet.FieldByName('COD_DSGS').asstring, Dsgs.buscas);
  end;
  DSGS.Refresh;
  if CheckCadSeq.Checked then
    BitBtn3Click(Sender);
end;

procedure TFrmCadDSGS.BitBtn5Click(Sender: TObject);
begin
  ActiveControl := BitBtn5;
  inherited;
  PageControl1.ActivePage := TabSheet2;
//  if vDadosIni.PesqPros('PRO040', '', Dsgs.buscas, true) then
  begin
    DSGS.Cancel;
    DSGS.RollBackTransacao;
  end;
end;

procedure TFrmCadDSGS.BitBtn6Exit(Sender: TObject);
begin
  inherited;
  if PageControl3.ActivePage = TabSheet3 then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
end;

procedure TFrmCadDSGS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {if (key = VK_RETURN) and (TelaCadastro = 1) then
  begin
    vDadosIni.vPesquisa := DSGS.dataSet.FieldByName('COD_DSGS').AsString;
    FrmCadDSGS.Close;
  end
  else}
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TFrmCadDSGS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DSGS.Cancel;
  DSGS.RollBackTransacao;
  DSGS.Destroy;
  Action := caFree;
  FrmCadDSGS := nil;
end;

procedure TFrmCadDSGS.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  DSGS := TDSGS.Create;
  DSGS.abreDsGs('');

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadDSGS.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (DSGS.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TFrmCadDSGS.FormShow(Sender: TObject);
begin
	if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsDSGS;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadDSGS.SpeedButton1Click(Sender: TObject);
begin
  inherited;
//  if vDadosIni.PesqPros('PRO034', Dsgs.dataSet.FieldByName('COD_DSGS').AsString, Dsgs.buscas, true) then
  begin
    if not DSGS.dataSet.IsEmpty then
    begin
      if DSGS.dataSet.FieldByName('ATIVO').AsInteger = 1 then
      begin
        PageControl1.ActivePage := TabSheet1;
        TabSheet3.TabVisible := true;
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
        if DSGS.Edit then
          DSGS.PreencheCampos;
      end
      else
        Application.MessageBox('Este registro está na lixeira.' + chr(13) + 'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    end
    else
      Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

procedure TFrmCadDSGS.SpeedButton25Click(Sender: TObject);
begin
  inherited;
//  if vDadosIni.PesqPros('PRO038', '', Dsgs.buscas, true) then
  begin
    if not DSGS.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO036]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [PRO035]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadDSGS.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not DSGS.dataSet.IsEmpty then
    if DSGS.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    begin
      if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
//        if vDadosIni.PesqPros('PRO035', Dsgs.dataSet.FieldByName('COD_DSGS').AsString, Dsgs.buscas, true) then
        begin
          if DSGS.Delete then
            if DSGS.Apply then
              if DSGS.emTransacao then
                DSGS.CommitaTransacao;
        end;
    end
    else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
//      if vDadosIni.PesqPros('PRO036', Dsgs.dataSet.FieldByName('COD_DSGS').AsString, Dsgs.buscas, true) then
      begin
        if DSGS.Edit then
        begin
          DSGS.dataSet.FieldByName('ATIVO').asinteger := 0;
          if DSGS.Post then
            if DSGS.Apply then
              if DSGS.emTransacao then
                DSGS.CommitaTransacao;
        end;
      end;
    end;
  DSGS.Refresh;
  TabSheet2Show(Sender);
end;

procedure TFrmCadDSGS.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not DSGS.dataSet.IsEmpty then
    if DSGS.dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?', 'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      begin
//        if vDadosIni.PesqPros('PRO037', Dsgs.dataSet.FieldByName('COD_DSGS').AsString, Dsgs.buscas, true) then
        begin
          if DSGS.Edit then
          begin
            DSGS.dataSet.FieldByName('ATIVO').asinteger := 1;
            if DSGS.Post then
              if DSGS.Apply then
                if DSGS.emTransacao then
                  DSGS.CommitaTransacao;
          end;
        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + chr(13) + 'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  DSGS.Refresh;
  TabSheet2Show(Sender);
end;

procedure TFrmCadDSGS.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if DSGS.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

end.

