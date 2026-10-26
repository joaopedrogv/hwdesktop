unit UCadCstMudCliente;

interface

uses
  Windows, UFormPadrao, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls,
  Menus, Buttons, Controls, Classes, ExtCtrls, Forms, UClassesClientes;

type
  TFrmCadCstMudCliente = class(TfrmInc)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox10: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn12: TBitBtn;
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    codClienteAtual: integer;
    { Public declarations }
  end;

var
  FrmCadCstMudCliente: TFrmCadCstMudCliente;
  CstMudCliente: TCSTMudCliente;

implementation
uses
  uDtmAtivo;

{$R *.dfm}

procedure TFrmCadCstMudCliente.BitBtn12Click(Sender: TObject);
begin
  inherited;
  CstMudCliente.Delete;
end;

procedure TFrmCadCstMudCliente.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if CstMudCliente.Post then
  begin
    TabSheet2.TabVisible := false;
    TabSheet1.show;
  end
  else
    setFocusCampoErro(CstMudCliente.vNomeCampoErro)
end;

procedure TFrmCadCstMudCliente.BitBtn4Click(Sender: TObject);
begin
  vDadosIni.GravaAuditoria('CLI162','CANCELAR', '','CST_MUD_CLIENTE',CstMudCliente.dataSet.FieldByName('COD_CLIENTE').AsString, CstMudCliente.buscas);
  CstMudCliente.Cancel;
  CstMudCliente.RollBackTransacao;
  TabSheet2.TabVisible := false;
  TabSheet1.show;
end;

procedure TFrmCadCstMudCliente.BitBtn6Click(Sender: TObject);
begin
  inherited;
  CstMudCliente.Cancel;
  CstMudCliente.RollBackTransacao;
  Close;
end;

procedure TFrmCadCstMudCliente.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI158', 'INSERINDO NOVO REGISTRO', '', 'CST_MUD_CLIENTE', '', CstMudCliente.buscas, true) then
    exit;
  if CstMudCliente.Insert then
  begin
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.TabVisible := true;
    TabSheet2.Caption := 'Incluindo Definição de Emissão de Nota Fiscal';
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;
  end;
end;

procedure TFrmCadCstMudCliente.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if CstMudCliente.dataSet.IsEmpty then
    exit;
  if not vDadosIni.PesqPros('CLI159', 'EDITANDO REGISTRO', '', 'CST_MUD_CLIENTE',
    'CLI:' + CstMudCliente.dataSet.FieldByName('COD_CLIENTE').asstring, CstMudCliente.buscas, true) then
    exit;
  if CstMudCliente.Edit then
  begin
    TabSheet2.show;
    TabSheet2.TabVisible := true;
    TabSheet2.Caption := 'Alterando Definição de Emissão de Nota Fiscal';
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;
  end;
end;

procedure TFrmCadCstMudCliente.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn4) and (activecontrol <> BitBtn6) then
  begin
    //    if not CstMudCliente.TestarCst(CstMudCliente.dataSet.FieldByName('CST_INTERNO').AsString) then
    //    begin
    //			if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    //        DBEdit3.SetFocus;
    // 		end
    //    else if CstMudCliente.existeCadastro(codClienteAtual, true) then
    //    begin
    //      if not CstMudCliente.existeCadastro(codClienteAtual, false) then
    //      begin
    //        if (activecontrol <> BitBtn3) then
    //					if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
    //          	DBEdit5.SetFocus;
    //      end
    //      else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    //        DBEdit3.SetFocus;
    //    end;
  end;
end;

procedure TFrmCadCstMudCliente.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn4) and (activecontrol <> BitBtn6) then
  begin
    //    if not CstMudCliente.TestarCst(CstMudCliente.dataSet.FieldByName('CST_EXTERNO').AsString) then
    //			if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
    //      	DBEdit4.SetFocus;
  end;
end;

procedure TFrmCadCstMudCliente.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn4) and (activecontrol <> BitBtn6) then
  begin
    if CstMudCliente.existeCadastro(codClienteAtual, true) then
    begin
      if not CstMudCliente.existeCadastro(codClienteAtual, false) then
      begin
        if (activecontrol <> BitBtn3) then
        	if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
          	DBEdit7.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
        DBEdit5.SetFocus;
    end;
  end;
end;

procedure TFrmCadCstMudCliente.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn4) and (activecontrol <> BitBtn6) then
  begin
    if CstMudCliente.existeCadastro(codClienteAtual, true) then
    begin
      if not CstMudCliente.existeCadastro(codClienteAtual, false) then
      begin
        if (activecontrol <> BitBtn3) then
        	if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
          	DBEdit4.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
        DBEdit7.SetFocus;
    end;
  end;
end;

procedure TFrmCadCstMudCliente.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    BitBtn9Click(Sender)
  else if key = VK_DELETE then
    BitBtn12Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn7Click(Sender);
end;

procedure TFrmCadCstMudCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CstMudCliente.Destroy;
  Action := caFree;
  FrmCadCstMudCliente := nil;
end;

procedure TFrmCadCstMudCliente.FormCreate(Sender: TObject);
begin
  inherited;
  CstMudCliente := TCSTMudCliente.create;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
end;

procedure TFrmCadCstMudCliente.FormShow(Sender: TObject);
begin
  inherited;
  TabSheet1.Show;
  CstMudCliente.abreCSTMudCliente(codClienteAtual);
end;

procedure TFrmCadCstMudCliente.TabSheet1Show(Sender: TObject);
begin
  inherited;
  BitBtn3.Visible := false;
  BitBtn4.Visible := false;
  BitBtn3.Enabled := false;
  BitBtn4.Enabled := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmCadCstMudCliente.TabSheet2Show(Sender: TObject);
begin
  inherited;
  BitBtn3.Visible := true;
  BitBtn4.Visible := true;
  BitBtn3.Enabled := true;
  BitBtn4.Enabled := true;
end;

end.

