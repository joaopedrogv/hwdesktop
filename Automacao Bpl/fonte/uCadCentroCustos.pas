unit uCadCentroCustos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DB, DBCtrls, uClassesCIAP, AppEvnts;

type
  TfrmCadCentroCustos = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCentroCustos: TfrmCadCentroCustos;
  obCCusto: TCentroCustos;

implementation

uses uDtmCIAP, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadCentroCustos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED058]';
  
  if not vDadosIni.PesqPros('SPED054','CONSULTA','','CENTRO_CUSTOS','',obCCusto.buscas,False) then
    Exit;
  if MaskEdit2.Visible then
  begin
    if not obCCusto.ConsultaCampos('CENTRO_CUSTOS', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if obCCusto.ConsultaCampos('CENTRO_CUSTOS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadCentroCustos.BitBtn3Click(Sender: TObject);
begin
  ActiveControl := BitBtn3;
  if not obCCusto.Insert then
    exit;
  inherited;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadCentroCustos.BitBtn4Click(Sender: TObject);
begin
  if not obCCusto.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obCCusto.vNomeCampoErro);
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
      if obCCusto.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadCentroCustos.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obCCusto.Cancel;
  if TelaCadastro = 2 then
  begin
    BitBtn6.Click;
    Exit;
  end;
end;

procedure TfrmCadCentroCustos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  SpeedButton1.Click;
end;

procedure TfrmCadCentroCustos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
  	SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
  	BitBtn3Click(Sender);
end;

procedure TfrmCadCentroCustos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obCCusto.Free;
  obCCusto := nil;
  Action := caFree;
  frmCadCentroCustos := nil;
end;

procedure TfrmCadCentroCustos.FormCreate(Sender: TObject);
begin       
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obCCusto := TCentroCustos.Create;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadCentroCustos.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
  DBGrid1.DataSource := dtmCIAP.dsCCusto;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;

  inherited;

  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if obCCusto.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadCentroCustos.SpeedButton1Click(Sender: TObject);
begin
  if obCCusto.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;
  inherited;
  if not obCCusto.Edit then
    exit;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadCentroCustos.SpeedButton25Click(Sender: TObject);
begin
 if not vDadosIni.PesqPros('SPED053', 'ABRIR A LIXEIRA', '', 'CENTRO_CUSTOS',
    '', obCCusto.buscas, true) then
    Exit;

  inherited;
  if not obCCusto.AbrirLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED058]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
   SpeedButton2.Hint := 'Excluir registro permanentemente -  [SPED057]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadCentroCustos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obCCusto.Delete then
  begin
    if obCCusto.StatusLixeira then
      lixeiraVazia(false)
    else
      lixeiraVazia(true);
  end;
end;

procedure TfrmCadCentroCustos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if obCCusto.restauraLixeira then
  begin
    if obCCusto.StatusLixeira then
      lixeiraVazia(false)
    else
      lixeiraVazia(true);
  end;
end;

end.

