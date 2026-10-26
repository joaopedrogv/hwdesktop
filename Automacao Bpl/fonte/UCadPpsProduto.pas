unit UCadPpsProduto;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadraoModal, DBCtrls, ExtCtrls, Menus,
  ComCtrls, Buttons, Grids, DBGrids, Controls, StdCtrls, Mask, Forms, Classes,
  AppEvnts, Graphics;

type
  TFrmCadPpsProduto = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPpsProduto: TFrmCadPpsProduto;
  PPS : TPPSProduto;
implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TFrmCadPpsProduto.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if MaskEdit2.Visible then
  begin
    if not PPS.ConsultaCampos('PPS_PRODUTOS', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if PPS.ConsultaCampos('PPS_PRODUTOS', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmCadPpsProduto.BitBtn3Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS022', '', PPS.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      TabSheet3.Show;
      if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      	DBEdit1.SetFocus;
      if PPS.Insert then
      begin
        PPS.PreencheCampos;
        TabSheet3.Caption := 'Cadastrando um novo PPS para Produto';
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

end;

procedure TFrmCadPpsProduto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TFrmCadPpsProduto.FormShow(Sender: TObject);
begin
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadPpsProduto.SpeedButton1Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS023', PPS.dataSet.FieldByName('COD_PPS').AsString, PPS.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if not PPS.dataSet.IsEmpty then
      begin
        if PPS.dataSet.FieldByName('ATIVO').AsInteger = 1 then
        begin
          PageControl1.ActivePage := TabSheet1;
          TabSheet3.TabVisible := true;
          PageControl3.ActivePage := TabSheet3;
          TabSheet3.Show;
          if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          	DBEdit1.SetFocus;
          if PPS.Edit then
          begin
            PPS.PreencheCampos;
            TabSheet3.Caption := 'Alterando PPS do Produto';
          end;
        end
        else
          Application.MessageBox('Este registro está na lixeira.' + chr(13) + 'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      end
      else
        Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    finally
      Screen.Cursor := crDefault;
    end;
  end;

end;

end.
