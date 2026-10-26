unit uCadOcorrenciaAdm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadOcorrenciaAdm = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadOcorrenciaAdm: TfrmCadOcorrenciaAdm;

implementation

uses UClassesCadastrosBasicosCx, UDtmCadastrosBasicosCx, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadOcorrenciaAdm.BitBtn1Click(Sender: TObject);
var
  vTemp: string;
begin
  if not vDadosIni.PesqPros('CXG098', 'CONSULTA', '', 'OCORRENCIA_ADM', '',
    cadOcorrAdm.buscas, true) then
    Exit;

  inherited;

  if MaskEdit2.Visible then
    vTemp := '*D*A*T*A*'
  else
    vTemp := MaskEdit3.Text;
  if cadOcorrAdm._pesquisa(ComboBox1.Text, ComboBox3.Text,vTemp, MaskEdit1.Text, MaskEdit2.Text ) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end
  else
    ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  SpeedButton6.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadOcorrenciaAdm.BitBtn3Click(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
    if not cadOcorrAdm.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOcorrenciaAdm.BitBtn4Click(Sender: TObject);
begin
	if not cadOcorrAdm.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(cadOcorrAdm.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if cadOcorrAdm.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadOcorrenciaAdm.BitBtn5Click(Sender: TObject);
begin
  cadOcorrAdm.Cancel;
  inherited;
end;

procedure TfrmCadOcorrenciaAdm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadOcorrenciaAdm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 	cadOcorrAdm.Free;
  cadOcorrAdm := nil;

  Action := caFree;
  frmCadOcorrenciaAdm := nil;
end;

procedure TfrmCadOcorrenciaAdm.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  cadOcorrAdm := TOcorrenciaAdm.create;

  TabSheet3.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadOcorrenciaAdm.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (cadOcorrAdm.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadOcorrenciaAdm.FormShow(Sender: TObject);
begin
 if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicosCx.dsOcorrenciaAdm;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CXG093]';
    CheckBox1.Visible := False;
    CheckBox3.Visible := False;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(cadOcorrAdm._lixeiraVazia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadOcorrenciaAdm.SpeedButton1Click(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
    if not cadOcorrAdm.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOcorrenciaAdm.SpeedButton25Click(Sender: TObject);
begin
	if not cadOcorrAdm._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CXG093]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    SpeedButton6.Visible := True;    
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [CXG094]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
    SpeedButton6.Visible := False;
  end;
end;

procedure TfrmCadOcorrenciaAdm.SpeedButton2Click(Sender: TObject);
begin
try
    Screen.Cursor := crHourGlass;
    cadOcorrAdm.Delete;
    lixeiraVazia( cadOcorrAdm._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOcorrenciaAdm.SpeedButton5Click(Sender: TObject);
begin
  if cadOcorrAdm._restaurarRegistroDaLixeira then
    lixeiraVazia(cadOcorrAdm._lixeiraVazia);
end;

end.
