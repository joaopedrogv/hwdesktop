unit uSugestaoServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmSugestaoServico = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    SpeedButton13: TSpeedButton;
    tsSugestaoServico: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    CheckBox2: TCheckBox;
    ScrollBox5: TScrollBox;
    GroupBox5: TGroupBox;
    CheckBox4: TCheckBox;
    Panel11: TPanel;
    Label83: TLabel;
    Panel8: TPanel;
    Label14: TLabel;
    ckPendentes: TCheckBox;
    ckFinalizadas: TCheckBox;
    ckCanceladas: TCheckBox;
    BitBtn7: TBitBtn;
    TabSheet5: TTabSheet;
    ScrollBox6: TScrollBox;
    pnSugestaoServ: TPanel;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox8: TGroupBox;
    pnOcorrencias: TPanel;
    Panel10: TPanel;
    Label15: TLabel;
    lbTipo2: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lbChassi2: TLabel;
    lbPlaca2: TLabel;
    lbCodigo2: TLabel;
    Label22: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBTextCodigo2: TDBText;
    DBTextTipo2: TDBText;
    DBTextChassi2: TDBText;
    DBTextPlaca2: TDBText;
    GroupBox17: TGroupBox;
    BitBtn_Novo_Ocorrencia: TBitBtn;
    BitBtn_Alterar_Ocorrencia: TBitBtn;
    BitBtn_Salvar_Ocorrencia: TBitBtn;
    BitBtn_Cancelar_Ocorrencia: TBitBtn;
    BitBtn_Excluir_Ocorrencia: TBitBtn;
    Panel12: TPanel;
    GroupBox7: TGroupBox;
    Panel9: TPanel;
    DBGrid3: TDBGrid;
    Label7: TLabel;
    DBText5: TDBText;
    GroupBox9: TGroupBox;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    BitBtn12: TBitBtn;
    DBText16: TDBText;
    Label23: TLabel;
    Label25: TLabel;
    DBText18: TDBText;
    Label24: TLabel;
    DBText17: TDBText;
    Panel7: TPanel;
    Label6: TLabel;
    lbTipo: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbChassi: TLabel;
    lbPlaca: TLabel;
    lbCodigo: TLabel;
    Label13: TLabel;
    Label211: TLabel;
    Label212: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBTextCodigo: TDBText;
    DBText6: TDBText;
    DBTextChassi: TDBText;
    DBTextPlaca: TDBText;
    Label10: TLabel;
    DBText7: TDBText;
    Label16: TLabel;
    DBText8: TDBText;
    Label21: TLabel;
    DBText15: TDBText;
    DBText13: TDBText;
    Label19: TLabel;
    Panel13: TPanel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    GroupBox10: TGroupBox;
    Panel14: TPanel;
    BitBtn10: TBitBtn;
    DBGrid4: TDBGrid;
    BitBtn20: TBitBtn;
    Label20: TLabel;
    DBText14: TDBText;
    Label26: TLabel;
    DBText19: TDBText;
    Panel15: TPanel;
    Label27: TLabel;
    Panel16: TPanel;
    Label28: TLabel;
    groupAdicional: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    SpeedButton55: TSpeedButton;
    SpeedButton9: TSpeedButton;
    procedure SpeedButton55Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure groupAdicionalExit(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure BitBtn_Cancelar_OcorrenciaClick(Sender: TObject);
    procedure BitBtn_Salvar_OcorrenciaClick(Sender: TObject);
    procedure BitBtn_Alterar_OcorrenciaClick(Sender: TObject);
    procedure BitBtn_Excluir_OcorrenciaClick(Sender: TObject);
    procedure BitBtn_Novo_OcorrenciaClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AlterarTela(pTipo: Integer);
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
  private
    { Private declarations }
    vDtDia: TDate;
  public
    { Public declarations }
  end;

var
  frmSugestaoServico: TfrmSugestaoServico;
  vTelaCadastro: Integer;
  vTempCodCliente: integer;
  vTempData: string;
  vTempCodigo: integer;
  vTempChassi: string;
  vTempPlaca: string;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;


implementation

uses UDtmCadastrosBasicos, uDtmAtivo, uDadosIni, uDataSet_OOP, 
  UClassesCadastrosBasicos, DBClient, DB;

{$R *.dfm}

procedure TfrmSugestaoServico.AlterarTela(pTipo: Integer);
begin
 try
    if pTipo = 0 then
    begin
      Panel1.Parent := TabSheet2;
      Panel2.Parent := Panel1;
      PageControl1.ActivePage := TabSheet2;
      Panel1.Visible := False;
      SpeedButton24.Visible := false;
    end
    else
    begin
      PageControl1.ActivePage := tsSugestaoServico;
      Panel1.Visible := true;
      Panel1.Parent := Panel6;
      Panel2.Parent := Panel5;
      Panel1.Visible := True;
      SpeedButton24.Visible := true;
    end;
  finally
     if pTipo = 0 then
     begin
       if PageControl1.ActivePage = TabSheet2 then
    	   CheckBox2.Checked := false;
     end
     else
     begin
        if PageControl1.ActivePage = tsSugestaoServico then
			    CheckBox4.Checked := false;
     end;
  end;
end;

procedure TfrmSugestaoServico.BitBtn10Click(Sender: TObject);
begin
  TForm(pnOcorrencias.Parent).ModalResult := IDOK;
end;

procedure TfrmSugestaoServico.BitBtn11Click(Sender: TObject);
begin
  TForm(pnOcorrencias.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmSugestaoServico.BitBtn12Click(Sender: TObject);
begin
  TForm(pnOcorrencias.Parent).ModalResult := IDOK;
end;

procedure TfrmSugestaoServico.BitBtn1Click(Sender: TObject);
var
  vSqlAdc: string;
begin
  try
    if vDadosIni.PesqPros('BAS377', 'PESQUISAR', '', 'SUGESTAOSERVICO', '', SugestaoServico.buscas, true) then
    begin
      inherited;
      Screen.Cursor := crHourGlass;

      SugestaoServico.rSugServico.vCampo := ComboBox1.Text;
      SugestaoServico.rSugServico.vCondicao := ComboBox3.Text;
      SugestaoServico.rSugServico.vValor := trim(MaskEdit3.Text);
      SugestaoServico.rSugServico.vCampoAd := ComboBox11.Text;
      SugestaoServico.rSugServico.vValorAd := trim(MaskEdit7.Text);
      SugestaoServico.rSugServico.vDataIni := MaskEdit1.Text;
      SugestaoServico.rSugServico.vDataFim := MaskEdit2.Text;
      SugestaoServico.rSugServico.vDataIniAd := MaskEdit9.Text;
      SugestaoServico.rSugServico.vDataFimAd := MaskEdit8.Text;
      SugestaoServico.rSugServico.vCondicaoAd := ComboBox12.Text;
      SugestaoServico.rSugServico.vPorDataAd := MaskEdit9.Visible;
      SugestaoServico.rSugServico.vAdicional := CheckBox1.Checked;
      SugestaoServico._defineSqlAdicional;

      vSqlAdc := '';
      if (not ckPendentes.Checked) and (not ckFinalizadas.Checked) and (not ckCanceladas.Checked) then
       ckPendentes.Checked := true;

      if (not ckPendentes.Checked) and (ckFinalizadas.Checked) and (ckCanceladas.Checked) then
        vSqlAdc := ' (TRIM(SUGESTAOSERVICO.STATUS) IN (''FINALIZADA'', ''CANCELADA'')) '
      else if (ckPendentes.Checked) and (ckFinalizadas.Checked) and (not ckCanceladas.Checked) then
        vSqlAdc := ' (TRIM(COALESCE(SUGESTAOSERVICO.STATUS, '''')) IN ('''', ''FINALIZADA'')) '
      else if (ckPendentes.Checked) and (not ckFinalizadas.Checked) and (ckCanceladas.Checked) then
        vSqlAdc := ' (TRIM(COALESCE(SUGESTAOSERVICO.STATUS, '''')) IN ('''', ''CANCELADA'')) '
      else if (ckPendentes.Checked) and (not ckFinalizadas.Checked) and (not ckCanceladas.Checked) then
        vSqlAdc := ' (TRIM(COALESCE(SUGESTAOSERVICO.STATUS, '''')) IN ('''')) '
      else if (not ckPendentes.Checked) and (ckFinalizadas.Checked) and (not ckCanceladas.Checked) then
        vSqlAdc := ' (TRIM(SUGESTAOSERVICO.STATUS) IN (''FINALIZADA'')) '
      else if (not ckPendentes.Checked) and (not ckFinalizadas.Checked) and (ckCanceladas.Checked) then
        vSqlAdc := ' (TRIM(SUGESTAOSERVICO.STATUS) IN (''CANCELADA'')) ';

      if MaskEdit2.Visible then
      begin
        if not SugestaoServico.ConsultaCampos('SUGESTAOSERVICO', ComboBox1.Text,
          'SUGESTAOSERVICO.DATA', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
          ' DISTINCT SUGESTAOSERVICO.COD_EMPRESA, SUGESTAOSERVICO.COD_EQUIP, ' +
          ' SUGESTAOSERVICO.COD_VEIC, SUGESTAOSERVICO.CHASSI, SUGESTAOSERVICO.PLACA, ' +
          ' VEICULOS.ANOFAB, VEICULOS.ANOMOD, SUGESTAOSERVICO.NDOC_ANT, SUGESTAOSERVICO.TPDOC_ANT, ' +
          ' SUGESTAOSERVICO.DATA_ULT_SERV, SUGESTAOSERVICO.KM_ULT_SERV, ' +
          ' CASE WHEN (SUGESTAOSERVICO.COD_EQUIP > 0) THEN EQUIPAMENTO.DAT_CAD_EQUI ELSE VEICULOS.DATA_CAD END DATA_CAD_TIPO, ' +
          ' SUGESTAOSERVICO.DATA, SUGESTAOSERVICO.COD_CLIENTE, ' +

          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.CODIGO_UF ELSE CLIENTES.CODIGO_UF END CODIGO_UF, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN EST.SIGLA_UF ELSE ESTADOS.SIGLA_UF END SIGLA_UF, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.COD_CIDADE ELSE CLIENTES.COD_CIDADE END COD_CIDADE, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN CID.NOME_CIDADE ELSE CIDADES.NOME_CIDADE END NOME_CIDADE, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.COD_BAIRRO ELSE CLIENTES.COD_BAIRRO END COD_BAIRRO, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN BAI.NOME_BAIRRO ELSE BAIRROS.NOME_BAIRRO END NOME_BAIRRO, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COLABORADOR.CEP_VENDEDOR ELSE CLIENTES.CEP END CEP, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COLABORADOR.END_VENDEDOR ELSE CLIENTES.ENDERECO END ENDERECO, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN 0 ELSE CLIENTES.NUM_END_CLIENTE END NUM_END_CLIENTE, ' +
          ' CASE WHEN (SUGESTAOSERVICO.COD_EQUIP > 0) THEN EQUIPAMENTO.NOM_EQUIP ELSE VEICULOS.DESCMODELO END DESCRICAO_TP, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.NOME_VENDEDOR ELSE CLIENTES.NOME_CLIENTE END NOME_CLIENTE, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.NOME_VENDEDOR ELSE CLIENTES.RAZAO END RAZAO, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.FONE_VENDEDOR ELSE CLIENTES.FONE_CLIENTE END FONE_CLIENTE, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.EMAIL ELSE CLIENTES.EMAIL END EMAIL, ' +

          ' SUGESTAOSERVICO.ULT_ATD, COLABORADOR.NOME_VENDEDOR, SUGESTAOSERVICO.ATIVO, ' +
          ' SUGESTAOSERVICO.COD_AGENDA, SUGESTAOSERVICO.STATUS, SUGESTAOSERVICO.NDOC, SUGESTAOSERVICO.TPDOC, ' +
          ' SUGESTAOSERVICO.US_CAD, SUGESTAOSERVICO.DATA_CAD, SUGESTAOSERVICO.HORA_CAD ',
          ' LEFT JOIN EQUIPAMENTO ON EQUIPAMENTO.COD_EQUIP = SUGESTAOSERVICO.COD_EQUIP AND EQUIPAMENTO.COD_EMPRESA = SUGESTAOSERVICO.COD_EMPRESA ' +
          ' LEFT JOIN VEICULOS ON VEICULOS.CODIGO = SUGESTAOSERVICO.COD_VEIC AND VEICULOS.CHASSI = SUGESTAOSERVICO.CHASSI AND VEICULOS.PLACA = SUGESTAOSERVICO.PLACA ' +
          ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = SUGESTAOSERVICO.COD_CLIENTE AND COL.COD_EMPRESA = SUGESTAOSERVICO.COD_EMPRESA ' +
			    ' LEFT JOIN ESTADOS EST ON COL.CODIGO_UF = EST.CODIGO_UF ' +
    			' LEFT JOIN CIDADES CID ON COL.COD_CIDADE = CID.COD_CIDADE ' +
    			' LEFT JOIN BAIRROS BAI ON COL.COD_BAIRRO = BAI.COD_BAIRRO ' +
          ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = SUGESTAOSERVICO.COD_CLIENTE AND CLIENTES.COD_EMPRESA = SUGESTAOSERVICO.COD_EMPRESA ' +
          ' LEFT JOIN ESTADOS ON CLIENTES.CODIGO_UF = ESTADOS.CODIGO_UF ' +
					' LEFT JOIN CIDADES ON CLIENTES.COD_CIDADE = CIDADES.COD_CIDADE ' +
          ' LEFT JOIN BAIRROS ON CLIENTES.COD_BAIRRO = BAIRROS.COD_BAIRRO ' +
          ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = SUGESTAOSERVICO.ULT_ATD AND COLABORADOR.COD_EMPRESA = SUGESTAOSERVICO.COD_EMPRESA ',
          vDadosIni.IfThen(trim(SugestaoServico.rSugServico.vsqlAdicional) <> '',
          SugestaoServico.rSugServico.vsqlAdicional + vDadosIni.IfThen(trim(vSqlAdc) <> '', ' AND ' + vSqlAdc, ''), vSqlAdc)) then
           //vSqlAdc) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            combobox1.setfocus;
      end
      else if not SugestaoServico.ConsultaCampos('SUGESTAOSERVICO', SugestaoServico.rSugServico.vValor, ComboBox1.Text,
        combobox3.Text, 'SUGESTAOSERVICO.DATA', true, vDadosIni.codEmpresa,
          ' DISTINCT SUGESTAOSERVICO.COD_EMPRESA, SUGESTAOSERVICO.COD_EQUIP, ' +
          ' SUGESTAOSERVICO.COD_VEIC, SUGESTAOSERVICO.CHASSI, SUGESTAOSERVICO.PLACA, ' +
          ' VEICULOS.ANOFAB, VEICULOS.ANOMOD, SUGESTAOSERVICO.NDOC_ANT, SUGESTAOSERVICO.TPDOC_ANT, ' +
          ' SUGESTAOSERVICO.DATA_ULT_SERV, SUGESTAOSERVICO.KM_ULT_SERV, ' +
          ' CASE WHEN (SUGESTAOSERVICO.COD_EQUIP > 0) THEN EQUIPAMENTO.DAT_CAD_EQUI ELSE VEICULOS.DATA_CAD END DATA_CAD_TIPO, ' +
          ' SUGESTAOSERVICO.DATA, SUGESTAOSERVICO.COD_CLIENTE, ' +

          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.CODIGO_UF ELSE CLIENTES.CODIGO_UF END CODIGO_UF, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN EST.SIGLA_UF ELSE ESTADOS.SIGLA_UF END SIGLA_UF, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.COD_CIDADE ELSE CLIENTES.COD_CIDADE END COD_CIDADE, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN CID.NOME_CIDADE ELSE CIDADES.NOME_CIDADE END NOME_CIDADE, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.COD_BAIRRO ELSE CLIENTES.COD_BAIRRO END COD_BAIRRO, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN BAI.NOME_BAIRRO ELSE BAIRROS.NOME_BAIRRO END NOME_BAIRRO, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COLABORADOR.CEP_VENDEDOR ELSE CLIENTES.CEP END CEP, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COLABORADOR.END_VENDEDOR ELSE CLIENTES.ENDERECO END ENDERECO, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN 0 ELSE CLIENTES.NUM_END_CLIENTE END NUM_END_CLIENTE, ' +
          ' CASE WHEN (SUGESTAOSERVICO.COD_EQUIP > 0) THEN EQUIPAMENTO.NOM_EQUIP ELSE VEICULOS.DESCMODELO END DESCRICAO_TP, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.NOME_VENDEDOR ELSE CLIENTES.NOME_CLIENTE END NOME_CLIENTE, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.NOME_VENDEDOR ELSE CLIENTES.RAZAO END RAZAO, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.FONE_VENDEDOR ELSE CLIENTES.FONE_CLIENTE END FONE_CLIENTE, ' +
          ' CASE WHEN ((SUGESTAOSERVICO.COD_EQUIP > 0) AND (EQUIPAMENTO.TIP_EQUIP = ''I'')) THEN COL.EMAIL ELSE CLIENTES.EMAIL END EMAIL, ' +

          ' SUGESTAOSERVICO.ULT_ATD, COLABORADOR.NOME_VENDEDOR, SUGESTAOSERVICO.ATIVO, ' +
          ' SUGESTAOSERVICO.COD_AGENDA, SUGESTAOSERVICO.STATUS, SUGESTAOSERVICO.NDOC, SUGESTAOSERVICO.TPDOC, ' +
          ' SUGESTAOSERVICO.US_CAD, SUGESTAOSERVICO.DATA_CAD, SUGESTAOSERVICO.HORA_CAD ',
          ' LEFT JOIN EQUIPAMENTO ON EQUIPAMENTO.COD_EQUIP = SUGESTAOSERVICO.COD_EQUIP AND EQUIPAMENTO.COD_EMPRESA = SUGESTAOSERVICO.COD_EMPRESA ' +
          ' LEFT JOIN VEICULOS ON VEICULOS.CODIGO = SUGESTAOSERVICO.COD_VEIC AND VEICULOS.CHASSI = SUGESTAOSERVICO.CHASSI AND VEICULOS.PLACA = SUGESTAOSERVICO.PLACA ' +
        	' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = SUGESTAOSERVICO.COD_CLIENTE AND COL.COD_EMPRESA = SUGESTAOSERVICO.COD_EMPRESA ' +
			    ' LEFT JOIN ESTADOS EST ON COL.CODIGO_UF = EST.CODIGO_UF ' +
    			' LEFT JOIN CIDADES CID ON COL.COD_CIDADE = CID.COD_CIDADE ' +
    			' LEFT JOIN BAIRROS BAI ON COL.COD_BAIRRO = BAI.COD_BAIRRO ' +
          ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = SUGESTAOSERVICO.COD_CLIENTE AND CLIENTES.COD_EMPRESA = SUGESTAOSERVICO.COD_EMPRESA ' +
          ' LEFT JOIN ESTADOS ON CLIENTES.CODIGO_UF = ESTADOS.CODIGO_UF ' +
					' LEFT JOIN CIDADES ON CLIENTES.COD_CIDADE = CIDADES.COD_CIDADE ' +
          ' LEFT JOIN BAIRROS ON CLIENTES.COD_BAIRRO = BAIRROS.COD_BAIRRO ' +
          ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = SUGESTAOSERVICO.ULT_ATD AND COLABORADOR.COD_EMPRESA = SUGESTAOSERVICO.COD_EMPRESA ',
          vDadosIni.IfThen(trim(SugestaoServico.rSugServico.vsqlAdicional) <> '',
          SugestaoServico.rSugServico.vsqlAdicional + vDadosIni.IfThen(trim(vSqlAdc) <> '', ' AND ' + vSqlAdc, ''), vSqlAdc)) then
          //vSqlAdc) then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          ComboBox1.SetFocus;
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        DBGrid1.SetFocus;
    end;
  finally
  	SugestaoServico.ultimasql := SugestaoServico.dataSet.CommandText;
    _GravaConfiguracoesBoolean('ckPendentes', ckPendentes.Checked);
    _GravaConfiguracoesBoolean('ckFinalizadas', ckFinalizadas.Checked);
    _GravaConfiguracoesBoolean('ckCanceladas', ckCanceladas.Checked);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSugestaoServico.BitBtn20Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if SugestaoServico.vOrdemServicoSugestaoServico.dataSet.IsEmpty then
    	exit;
    vDadosIni.vPesquisa := 'PEDVENDA_FICHAPRODUTO|OS|' + IntToStr(DBGrid4.DataSource.DataSet.FieldByName('NPED').AsInteger) + '|';
    vDadosIni.vNomeForm := 'FrmCadPedVenda';
    vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Pedido de Venda ou Ordem de Serviço já aberto. Feche que tente novamente');
  finally
    vDadosIni.vPesquisa := '';
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSugestaoServico.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if (vTelaCadastro = 1) then
  	AlterarTela(1);
end;

procedure TfrmSugestaoServico.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if (vTelaCadastro = 1) then
  begin
  	AlterarTela(1);
	  SugestaoServico.Cancel;
  	SugestaoServico.RollBackTransacao;
  end;
end;

procedure TfrmSugestaoServico.BitBtn8Click(Sender: TObject);
begin
  try
    if not SugestaoServico.vSugestaoServicoItens.dataSet.IsEmpty then
    begin
      SugestaoServico.vSugestaoServicoItens.dataSet.Filter := 'SEL =''S'' ';
      SugestaoServico.vSugestaoServicoItens.dataSet.Filtered := true;
    end;

    if SugestaoServico.vSugestaoServicoItens.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhuma serviço selecionado!', 'Atenção', MB_ICONWARNING + MB_OK);
    	exit;
    end;
  	TForm(pnSugestaoServ.Parent).ModalResult := IDOK;
  finally
    SugestaoServico.vSugestaoServicoItens.dataSet.Filtered := false;
    if not SugestaoServico.vSugestaoServicoItens.dataSet.IsEmpty then
	    SugestaoServico.vSugestaoServicoItens.dataSet.First;
  end;
end;

procedure TfrmSugestaoServico.BitBtn9Click(Sender: TObject);
begin
  TForm(pnSugestaoServ.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmSugestaoServico.BitBtn_Alterar_OcorrenciaClick(Sender: TObject);
begin
  if not SugestaoServico.vOcorrenciaSugestaoServico.Edit then
  	exit;

  DBMemo1.Enabled := true;
  BitBtn_Novo_Ocorrencia.Enabled := false;
  BitBtn_Alterar_Ocorrencia.Enabled := false;
  BitBtn_Excluir_Ocorrencia.Enabled := false;
  BitBtn_Salvar_Ocorrencia.Enabled := true;
  BitBtn_Cancelar_Ocorrencia.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
    DBMemo1.SetFocus;
end;

procedure TfrmSugestaoServico.BitBtn_Cancelar_OcorrenciaClick(Sender: TObject);
begin
  SugestaoServico.vOcorrenciaSugestaoServico.Cancel;
  SugestaoServico.vOcorrenciaSugestaoServico.RollBackTransacao;
  DBMemo1.Enabled := false;
  BitBtn_Novo_Ocorrencia.Enabled := true;
  BitBtn_Alterar_Ocorrencia.Enabled := true;
  BitBtn_Excluir_Ocorrencia.Enabled := true;
  BitBtn_Salvar_Ocorrencia.Enabled := false;
  BitBtn_Cancelar_Ocorrencia.Enabled := false;
end;

procedure TfrmSugestaoServico.BitBtn_Excluir_OcorrenciaClick(Sender: TObject);
begin
  SugestaoServico.vOcorrenciaSugestaoServico.Delete;
end;

procedure TfrmSugestaoServico.BitBtn_Novo_OcorrenciaClick(Sender: TObject);
begin
  if not SugestaoServico.vOcorrenciaSugestaoServico.Insert(SugestaoServico.dataSet) then
  	exit;

  DBMemo1.Enabled := true;
  BitBtn_Novo_Ocorrencia.Enabled := false;
  BitBtn_Alterar_Ocorrencia.Enabled := false;
  BitBtn_Excluir_Ocorrencia.Enabled := false;
  BitBtn_Salvar_Ocorrencia.Enabled := true;
  BitBtn_Cancelar_Ocorrencia.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
    DBMemo1.SetFocus;
end;

procedure TfrmSugestaoServico.BitBtn_Salvar_OcorrenciaClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn_Salvar_Ocorrencia.CanFocus) then
  	BitBtn_Salvar_Ocorrencia.SetFocus;

  if not SugestaoServico.vOcorrenciaSugestaoServico.Post then
  begin
  	setFocusCampoErro(SugestaoServico.vOcorrenciaSugestaoServico.vNomeCampoErro, SugestaoServico.vOcorrenciaSugestaoServico.vMensagemErro);
  	exit;
  end;

  DBMemo1.Enabled := false;

  BitBtn_Novo_Ocorrencia.Enabled := true;
  BitBtn_Alterar_Ocorrencia.Enabled := true;
  BitBtn_Excluir_Ocorrencia.Enabled := true;
  BitBtn_Salvar_Ocorrencia.Enabled := false;
  BitBtn_Cancelar_Ocorrencia.Enabled := false;
end;

procedure TfrmSugestaoServico.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
    groupAdicional.Visible := CheckBox1.Checked
  else
    groupAdicional.Visible := not CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;

  if (Self.Enabled) and (Self.Visible) and (combobox11.CanFocus) then
  	ComboBox11.SetFocus;
end;

procedure TfrmSugestaoServico.CheckBox2Click(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    AlterarTela(0);
  finally
  	vTelaCadastro := 0;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSugestaoServico.CheckBox4Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    SugestaoServico.abreSugServ;
    AlterarTela(1);
  finally
  	vTelaCadastro := 1;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSugestaoServico.ComboBox11Exit(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
    if ComboBox11.ItemIndex<0 then
      ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
  	  ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        vCampoAdcional := DBGrid1.DataSource.dataSet.Fields.Fields[i].FieldName;

        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TfrmSugestaoServico.Configurarcolunas1Click(Sender: TObject);
begin
  inherited;
  if vTelaCadastro = 1 then
  begin
	  AlterarTela(1);
    vTelaCadastro := 1;
  end;
end;

procedure TfrmSugestaoServico.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (SugestaoServico.dataSet.FieldByName('STATUS').AsString = 'CANCELADA') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($007D7DFF);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (SugestaoServico.dataSet.FieldByName('STATUS').AsString = 'FINALIZADA') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FF8484);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (SugestaoServico.dataSet.FieldByName('COD_AGENDA').AsInteger > 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($009BFFB5);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;
  if (Column.FieldName = 'DATA') and (SugestaoServico.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
	  and (SugestaoServico.dataSet.FieldByName('DATA').AsDateTime < vDtDia)
  	and (Trim(SugestaoServico.dataSet.FieldByName('STATUS').AsString) <> 'CANCELADA')
    and (Trim(SugestaoServico.dataSet.FieldByName('STATUS').AsString) <> 'FINALIZADA') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmSugestaoServico.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) then
  	SpeedButton26Click(Sender);
end;

procedure TfrmSugestaoServico.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if not SugestaoServico.vSugestaoServicoItens.IsEmpty then
      SugestaoServico.vSugestaoServicoItens._marcaDesmarcaLinha;
end;

procedure TfrmSugestaoServico.DBGrid2DblClick(Sender: TObject);
begin
  if not SugestaoServico.vSugestaoServicoItens.IsEmpty then
   	SugestaoServico.vSugestaoServicoItens._marcaDesmarcaLinha;
end;

procedure TfrmSugestaoServico.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

	if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end; 
end;

procedure TfrmSugestaoServico.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
		SugestaoServico.vSugestaoServicoItens._marcaDesmarcaLinha
  else if Key = VK_F2 then
  	SugestaoServico.vSugestaoServicoItens._marcarLinha
  else if Key = VK_F3 then
  	SugestaoServico.vSugestaoServicoItens._desmarcarLinha;
end;

procedure TfrmSugestaoServico.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmSugestaoServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (SugestaoServico <> nil) then
    SugestaoServico.Cancel;

  SugestaoServico.free;
  SugestaoServico := nil;

  Action := caFree;
  if (frmSugestaoServico <> nil) then
    frmSugestaoServico := nil;
end;

procedure TfrmSugestaoServico.FormCreate(Sender: TObject);
begin
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'SUG_SERV_VISUALIZAR' then
  begin
    vTempCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    vTempData := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    vTempCodigo := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4));
    if (vDadosIni.vEmp.vUsarAparelho <> 'S') then
    begin
      vTempPlaca := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 5);
      vTempChassi := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 6);
    end;
    if DtmCadBasicos = nil then
      DtmCadBasicos := TDtmCadBasicos.Create(DtmCadBasicos);
    vDadosIni.vTipoForm := 3;
    vDadosIni.vModalOuChild := 'M';
    frmSugestaoServico := TfrmSugestaoServico(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  SugestaoServico := TSugestaoServico.create;
  vDtDia := vDadosIni.getDataBanco(SugestaoServico.buscas);
  tsSugestaoServico.TabVisible := False;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;
  PageControl1.ActivePage := tsSugestaoServico;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmSugestaoServico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;
    if (Key = vk_f10) and (PageControl1.ActivePage = TabSheet2) then
    	ckPendentes.Checked := not ckPendentes.Checked
    else if (Key = vk_f11) and (PageControl1.ActivePage = TabSheet2) then
    	ckFinalizadas.Checked := not ckFinalizadas.Checked
    else if (Key = vk_f12) and (PageControl1.ActivePage = TabSheet2) then
    	ckCanceladas.Checked := not ckCanceladas.Checked
    else if (Key = VK_F5) and (SpeedButton24.Visible) and (PageControl1.ActivePage = tsSugestaoServico) then
      SpeedButton24Click(Sender);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSugestaoServico.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsSugestaoServ;
    inherited;
    AlterarTela(1);
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    //SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS367]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not SugestaoServico._lixeiraCheia);
  end;

  if (TelaCadastro = 3) then
  begin
    if (vDadosIni.vEmp.vUsarAparelho = 'S') then
    begin
      if not SugestaoServico.abreSugServ(vTempCodCliente, vTempData, vTempCodigo) then
      begin
        SugestaoServico.dataSet.Cancel;
        frmSugestaoServico.fechar := True;
        PostMessage(frmSugestaoServico.Handle, WM_CLOSE, 0, 0);
        exit;
      end;
    end
    else
    begin
      if not SugestaoServico.abreSugServ(vTempCodCliente, vTempData, vTempCodigo, vTempPlaca, vTempChassi) then
      begin
        SugestaoServico.dataSet.Cancel;
        frmSugestaoServico.fechar := True;
        PostMessage(frmSugestaoServico.Handle, WM_CLOSE, 0, 0);
        exit;
      end;
    end;
    SpeedButton26Click(Sender);
    frmSugestaoServico.fechar := True;
    PostMessage(frmSugestaoServico.Handle, WM_CLOSE, 0, 0);
    exit;
  end;

  SugestaoServico.abreSugServ;
  vTelaCadastro := 1;
  configurarGridPeloConfigColunas(DBGrid1);

  ckPendentes.Checked := _LerConfiguracoesRegistroBoolean('ckPendentes');
  ckFinalizadas.Checked := _LerConfiguracoesRegistroBoolean('ckFinalizadas');
  ckCanceladas.Checked := _LerConfiguracoesRegistroBoolean('ckCanceladas');
  SpeedButton3.Visible := vDadosIni.vEmp.vAgendaOficina = 'S';
  SpeedButton7.Visible := vDadosIni.vEmp.vAgendaOficina = 'S';
  SpeedButton6.Visible := vDadosIni.vEmp.vAgendaOficina = 'S';
  Panel15.Visible := vDadosIni.vEmp.vAgendaOficina = 'S';
  Label27.Visible := vDadosIni.vEmp.vAgendaOficina = 'S';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmSugestaoServico.groupAdicionalExit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmSugestaoServico.SpeedButton11Click(Sender: TObject);
begin
	try
    SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
    SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;

    if (SugestaoServico.dataSet.FieldByName('TPDOC').AsString = 'OS')
      and (SugestaoServico.dataSet.FieldByName('NDOC').AsInteger > 0) then
    begin
      Application.MessageBox('Sugestão de serviço já possui ordem de serviço!', 'Atenção', 0 + 64);
      exit;
    end;

    if not SugestaoServico.AlterarStatusSugestaoServico('CANCELAR', false) then
    begin
      SugestaoServico.RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS390', 'CANCELAR', 'FALHA', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
      exit;
    end;

    if not SugestaoServico.ReabrirCancelarSugestao(SugestaoServico.dataset.FieldByName('TPDOC').AsString, SugestaoServico.dataset.FieldByName('NDOC').AsInteger) then
    begin
      SugestaoServico.RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS390', 'CANCELAR', 'FALHA', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
      exit;
    end;

    SugestaoServico.CommitaTransacao;
    vDadosIni.GravaAuditoria('BAS390', 'CANCELAR', 'SUCESSO', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
  finally
    SugestaoServico.montaSelect(SugestaoServico.ultimasql);
    SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
    if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
      SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
  end;
end;

procedure TfrmSugestaoServico.SpeedButton12Click(Sender: TObject);
begin
  try
    SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
    SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;

    if (SugestaoServico.dataSet.FieldByName('TPDOC').AsString = 'OS')
      and (SugestaoServico.dataSet.FieldByName('NDOC').AsInteger > 0) then
    begin
      Application.MessageBox('Sugestão de serviço já possui ordem de serviço!', 'Atenção', 0 + 64);
      exit;
    end;

    if not SugestaoServico.AlterarStatusSugestaoServico('REABRIR', false) then
    begin
      SugestaoServico.RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS391', 'REABRIR', 'FALHA', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
      exit;
    end;

    if not SugestaoServico.ReabrirCancelarSugestao(SugestaoServico.dataset.FieldByName('TPDOC').AsString, SugestaoServico.dataset.FieldByName('NDOC').AsInteger) then
    begin
      SugestaoServico.RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS391', 'REABRIR', 'FALHA', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
      exit;
    end;

    SugestaoServico.CommitaTransacao;
    vDadosIni.GravaAuditoria('BAS391', 'REABRIR', 'SUCESSO', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
  finally
    SugestaoServico.montaSelect(SugestaoServico.ultimasql);
    SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
    if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
      SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
  end;
end;

procedure TfrmSugestaoServico.SpeedButton1Click(Sender: TObject);
begin
  try
    if SugestaoServico.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('BAS379', 'VISUALIZAR OCORRENCIAS', '', 'OCORRENCIA_SUG',  '', SugestaoServico.buscas, false) then
    	Exit;

    SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
	  SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;

    if not SugestaoServico.abreFormOcorrencias then
    	exit;

    SugestaoServico.montaSelect(SugestaoServico.ultimasql);
  	SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
    if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
		  SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      SugestaoServico.Cancel;
      SugestaoServico.RollBackTransacao;
    end;
  end;
end;

procedure TfrmSugestaoServico.SpeedButton23Click(Sender: TObject);
var
  vMensagem: string;
begin
  try
    SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
    SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;

    if (SugestaoServico.dataSet.FieldByName('TPDOC').AsString = 'OS')
      and (SugestaoServico.dataSet.FieldByName('NDOC').AsInteger > 0) then
    begin
      vDadosIni.GravaAuditoria('BAS389', 'FINALIZAR', 'FALHA', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
      Application.MessageBox('Sugestão de serviço já possui ordem de serviço!', 'Atenção', 0 + 64);
      exit;
    end;

    if not SugestaoServico.AlterarStatusSugestaoServico('FINALIZAR', false) then
    begin
      SugestaoServico.RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS389', 'FINALIZAR', 'FALHA', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
      exit;
    end;

    SugestaoServico.dataSet.RefreshRecord;
    if not vDadosIni.verificarSugestaoServico(SugestaoServico.buscas, DtmCadBasicos.SpIncCodigo, SugestaoServico.dataset.FieldByName('TPDOC').AsString,
      SugestaoServico.dataset.FieldByName('ULT_ATD').AsInteger, SugestaoServico.dataset.FieldByName('COD_CLIENTE').AsInteger,
      SugestaoServico.dataset.FieldByName('COD_EQUIP').AsInteger, SugestaoServico.dataset.FieldByName('COD_VEIC').AsInteger,
      SugestaoServico.dataset.FieldByName('CHASSI').AsString, SugestaoServico.dataset.FieldByName('PLACA').AsString,
      SugestaoServico.dataset.FieldByName('NDOC').AsInteger, SugestaoServico.dataSet.FieldByName('KM_ULT_SERV').AsInteger,
      vMensagem) then
    begin
      SugestaoServico.RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS389', 'FINALIZAR', 'FALHA', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
      Application.MessageBox(pchar(vMensagem), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
    SugestaoServico.CommitaTransacao;
    vDadosIni.GravaAuditoria('BAS389', 'FINALIZAR', 'SUCESSO', 'SUGESTAOSERVICO', '', SugestaoServico.buscas);
  finally
    SugestaoServico.montaSelect(SugestaoServico.ultimasql);
    SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
    if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
      SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
  end;
end;

procedure TfrmSugestaoServico.SpeedButton24Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
  	SugestaoServico.montaSelect(SugestaoServico.ultimasql);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSugestaoServico.SpeedButton26Click(Sender: TObject);
begin
  try
    if SugestaoServico.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('BAS378', 'VISUALIZAR SERVICO', '', 'SUGESTAOSERVICO',  '', SugestaoServico.buscas, false) then
    	Exit;

    SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
	  SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;

    if not SugestaoServico.abreFormServicoSug then
    	exit;

    SugestaoServico.montaSelect(SugestaoServico.ultimasql);
  	SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
    if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
		  SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      SugestaoServico.Cancel;
      SugestaoServico.RollBackTransacao;
    end;
  end;
end;

procedure TfrmSugestaoServico.SpeedButton2Click(Sender: TObject);
begin
	if not vDadosIni.PesqPros('BAS384', 'ENVIAR EMAIL', '', 'SUGESTAOSERVICO',  '', SugestaoServico.buscas, false) then
	 	Exit;

  SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
  SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;

  if not _mdiAberto('TFrmCadClientes', 'O Formulário do Cliente se encontra aberto!') then
      exit;

  if not SugestaoServico.enviarEmail then
  	exit;

  SugestaoServico.montaSelect(SugestaoServico.ultimasql);
  SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
  if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
	  SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
end;

procedure TfrmSugestaoServico.SpeedButton3Click(Sender: TObject);
begin
	SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
  SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;

  if vDadosIni.vEmp.vAgendaOficina <> 'S' then
  begin
    Application.MessageBox('Empresa não configurada para usar Agenda Oficina!', 'Atenção', 0 + 64);
    Exit;
  end;

  if not _mdiAberto('TfrmCadAgenda', 'O Formulário Agenda Oficina se encontra aberto!') then
    exit;

  if (SugestaoServico.dataSet.FieldByName('COD_AGENDA').AsInteger > 0) then
  begin
  	Application.MessageBox('Sugestão de serviço já possui agendamento!', 'Atenção', 0 + 64);
    exit;
  end;

  if (SugestaoServico.dataSet.FieldByName('TPDOC').AsString = 'OS')
  	and (SugestaoServico.dataSet.FieldByName('NDOC').AsInteger > 0) then
  begin
  	Application.MessageBox('Sugestão de serviço já possui ordem de serviço!', 'Atenção', 0 + 64);
    exit;
  end;

  if not SugestaoServico.AbrirAgendaOficina(0) then
  	exit;

  SugestaoServico.montaSelect(SugestaoServico.ultimasql);
  SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
  if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
  	SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
end;

procedure TfrmSugestaoServico.SpeedButton55Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('sug_serv_%', SugestaoServico.buscas);
end;

procedure TfrmSugestaoServico.SpeedButton6Click(Sender: TObject);
begin
	SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
  SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;
  if vDadosIni.vEmp.vAgendaOficina <> 'S' then
  begin
    Application.MessageBox('Empresa não configurada para usar Agenda Oficina!', 'Atenção', 0 + 64);
    Exit;
  end;

  if not _mdiAberto('TfrmCadAgenda', 'O Formulário Agenda Oficina se encontra aberto!') then
      exit;

  if (SugestaoServico.dataSet.FieldByName('COD_AGENDA').AsInteger <= 0) then
  begin
  	Application.MessageBox('Sugestão de serviço sem agendamento!', 'Atenção', 0 + 64);
    exit;
  end;

  if (SugestaoServico.dataSet.FieldByName('TPDOC').AsString = 'OS')
  	and (SugestaoServico.dataSet.FieldByName('NDOC').AsInteger > 0) then
  begin
  	Application.MessageBox('Sugestão de serviço já possui ordem de serviço!', 'Atenção', 0 + 64);
    exit;
  end;

  if not SugestaoServico.AbrirAgendaOficina(SugestaoServico.dataSet.FieldByName('COD_AGENDA').AsInteger, true) then
  	exit;
    
  SugestaoServico.montaSelect(SugestaoServico.ultimasql);
  SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
  if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
	  SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
end;

procedure TfrmSugestaoServico.SpeedButton7Click(Sender: TObject);
begin
	SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
  SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;
  if vDadosIni.vEmp.vAgendaOficina <> 'S' then
  begin
    Application.MessageBox('Empresa não configurada para usar Agenda Oficina!', 'Atenção', 0 + 64);
    Exit;
  end;

  if not _mdiAberto('TfrmCadAgenda', 'O Formulário Agenda Oficina se encontra aberto!') then
    exit;

  if (SugestaoServico.dataSet.FieldByName('COD_AGENDA').AsInteger <= 0) then
  begin
  	Application.MessageBox('Sugestão de serviço sem agendamento!', 'Atenção', 0 + 64);
    exit;
  end;

  if (SugestaoServico.dataSet.FieldByName('TPDOC').AsString = 'OS')
  	and (SugestaoServico.dataSet.FieldByName('NDOC').AsInteger > 0) then
  begin
  	Application.MessageBox('Sugestão de serviço já possui ordem de serviço!', 'Atenção', 0 + 64);
    exit;
  end;

  if not SugestaoServico.AbrirAgendaOficina(SugestaoServico.dataSet.FieldByName('COD_AGENDA').AsInteger) then
  	exit;
    
  SugestaoServico.montaSelect(SugestaoServico.ultimasql);
  SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
  if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
	  SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
end;

procedure TfrmSugestaoServico.SpeedButton8Click(Sender: TObject);
begin
  SugestaoServico.vIndex := SugestaoServico.dataSet.IndexName;
  SugestaoServico.vRecNo := SugestaoServico.dataSet.RecNo;

  if (SugestaoServico.dataSet.FieldByName('TPDOC').AsString = 'OS')
  	and (SugestaoServico.dataSet.FieldByName('NDOC').AsInteger > 0) then
  begin
  	Application.MessageBox('Sugestão de serviço já possui ordem de serviço!', 'Atenção', 0 + 64);
    exit;
  end;

  if not SugestaoServico.AdiarSugestaoServico then
  	exit;

  SugestaoServico.montaSelect(SugestaoServico.ultimasql);
  SugestaoServico.dataSet.IndexName := SugestaoServico.vIndex;
  if SugestaoServico.dataSet.RecordCount >= SugestaoServico.vRecNo then
	  SugestaoServico.dataSet.RecNo := SugestaoServico.vRecNo;
end;

function TfrmSugestaoServico._mdiAberto(pNomeFormMDI,
  pMensagem: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> ''  then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

initialization
  RegisterClass(TfrmSugestaoServico);
finalization
  UnRegisterClass(TfrmSugestaoServico);


end.
