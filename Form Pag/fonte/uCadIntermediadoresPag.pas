unit uCadIntermediadoresPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uClasseFP;

type
  TfrmCadIntermediadoresPag = class(TfrmCadPadraoM)
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadIntermediadoresPag: TfrmCadIntermediadoresPag;
  vIntermPag: TIntermPag;


implementation

uses uDtmFormPag, uDtmAtivo, uDadosIni, DB, uDataSet_OOP, StrUtils;

{$R *.dfm}

procedure TfrmCadIntermediadoresPag.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('FPG048', 'CONSULTA', '', 'INTERMEDIADOR_CONTROLE_EC', '',
      vIntermPag.buscas, true) then
      Exit;

    vIntermPag.rConsultas.vCampo := ComboBox1.Text;
    vIntermPag.rConsultas.vCondicao := ComboBox3.Text;
    vIntermPag.rConsultas.vValor := trim(MaskEdit3.Text);
    vIntermPag._defineSqlAdicional;

    inherited;
    if MaskEdit2.Visible then
    begin
      if not vIntermPag.ConsultaCampos('INTERMEDIADOR_CONTROLE_EC', ComboBox1.Text,
        'INTERMEDIADOR_CONTROLE_EC.SEQID', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        'INTERMEDIADOR_CONTROLE_EC.*, CONTROLES.NOME_CTRL, COND_PAG.DESC_COND_PAG ',
        'LEFT JOIN CONTROLES ON CONTROLES.CODIGO_CTRL = INTERMEDIADOR_CONTROLE_EC.CODIGO_CTRL ' +
        '		AND CONTROLES.CODIGO_EMP = INTERMEDIADOR_CONTROLE_EC.COD_EMPRESA ' +
        'LEFT JOIN COND_PAG ON COND_PAG.COD_COND_PAG = INTERMEDIADOR_CONTROLE_EC.COD_COND_PAG ',
        vIntermPag.rConsultas.vSqlAdicional + IfThen(trim(vIntermPag.rConsultas.vSqlAdicional) <> '', ' AND ', '') +
         ' INTERMEDIADOR_CONTROLE_EC.SEQID > 0 ') then
         	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not vIntermPag.ConsultaCampos('INTERMEDIADOR_CONTROLE_EC', vIntermPag.rConsultas.vValor, ComboBox1.Text,
      combobox3.Text, 'INTERMEDIADOR_CONTROLE_EC.SEQID', true, vDadosIni.codEmpresa,
       'INTERMEDIADOR_CONTROLE_EC.*, CONTROLES.NOME_CTRL, COND_PAG.DESC_COND_PAG ',
       'LEFT JOIN CONTROLES ON CONTROLES.CODIGO_CTRL = INTERMEDIADOR_CONTROLE_EC.CODIGO_CTRL ' +
       '		AND CONTROLES.CODIGO_EMP = INTERMEDIADOR_CONTROLE_EC.COD_EMPRESA ' +
       'LEFT JOIN COND_PAG ON COND_PAG.COD_COND_PAG = INTERMEDIADOR_CONTROLE_EC.COD_COND_PAG ',
       vIntermPag.rConsultas.vSqlAdicional + IfThen(trim(vIntermPag.rConsultas.vSqlAdicional) <> '', ' AND ', '') +
       	' INTERMEDIADOR_CONTROLE_EC.SEQID > 0 ') then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      			ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadIntermediadoresPag.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender);
end;

procedure TfrmCadIntermediadoresPag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

   if (vIntermPag <> nil) then
    vIntermPag.Cancel;

  vIntermPag.free;
  vIntermPag := nil;

  Action := caFree;
  if (frmCadIntermediadoresPag <> nil) then
    frmCadIntermediadoresPag := nil;
end;

procedure TfrmCadIntermediadoresPag.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  vIntermPag := TIntermPag.create;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadIntermediadoresPag.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmFP.dsIntermediadorPag;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    vIntermPag._abreIntermPag;
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadIntermediadoresPag.SpeedButton1Click(Sender: TObject);
begin
	vDadosIni.vPesquisaLocalVenda := vIntermPag.dataSet.FieldByName('LOCAL_VENDA').AsString;
  vDadosIni.vPesquisaInterPag := vIntermPag.dataSet.FieldByName('INTERMEDIADOR').AsString;
  vDadosIni.vPesquisaMetodoId := vIntermPag.dataSet.FieldByName('METODO_PAG_ID').AsInteger;
  vIntermPag.vVincIntermPag._cadVincIntermPag(1, vIntermPag.fstr('idcadinttran'));                                         
  vIntermPag.dataSet.Refresh;
end;

end.
