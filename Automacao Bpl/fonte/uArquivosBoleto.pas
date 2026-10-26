unit uArquivosBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UClassesBoleto, DBCtrls;

type
  TfrmArquivosBoleto = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    DBMemo1: TDBMemo;
    Panel7: TPanel;
    Panel8: TPanel;
    Label10: TLabel;
    bnExportarArquivo: TSpeedButton;
    btVoltar: TBitBtn;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    ckbRetorno: TCheckBox;
    ckbRemessa: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btVoltarClick(Sender: TObject);
    procedure bnExportarArquivoClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArquivosBoleto: TfrmArquivosBoleto;
  ArqBoleto: TArqBoleto;

implementation

uses
  uDtmAtivo, udtmBoleto, uDataSet_OOP, uDadosIni, StrUtils;

{$R *.dfm}

procedure TfrmArquivosBoleto.BitBtn1Click(Sender: TObject);
var
  I: Integer;
  vSqlAdicional: string;
begin
  try
    Screen.Cursor := crHourGlass;
    
    if not vDadosIni.PesqPros('COB012', 'PESQUISAR', '', 'ARQ_BOLETO', '', ArqBoleto.buscas, true) then
     exit;

    vSqlAdicional := '';
    if (ckbRemessa.Checked <> ckbRetorno.Checked) then
    begin
      if ckbRemessa.Checked then
        vSqlAdicional := ' ARQ_BOLETO.TIPO = ''REMESSA'' '
      else if ckbRetorno.Checked then
        vSqlAdicional := ' ARQ_BOLETO.TIPO = ''RETORNO'' ';
    end;

    inherited;
    if MaskEdit2.Visible then
    begin
      if not ArqBoleto.ConsultaCampos('ARQ_BOLETO', ComboBox1.Text,
        ' ARQ_BOLETO.SEQID', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        ' ARQ_BOLETO.*, COBREBEM.BANCO, COBREBEM.CODIGOAGENCIA, COBREBEM.NUMEROCONTACORRENTE, COBREBEM.CODIGOCEDENTE, COBREBEM.DESCRICAO ',
        ' LEFT JOIN COBREBEM ON ARQ_BOLETO.COD_COBREBEM = COBREBEM.COD_COBREBEM AND ARQ_BOLETO.COD_EMPRESA = COBREBEM.COD_EMP_MULT ',
        vSqlAdicional) then
           if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus;
    end
    else
      if not ArqBoleto.ConsultaCampos('ARQ_BOLETO', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, 'ARQ_BOLETO.SEQID', true, vDadosIni.codEmpresa,
        ' ARQ_BOLETO.*, COBREBEM.BANCO, COBREBEM.CODIGOAGENCIA, COBREBEM.NUMEROCONTACORRENTE, COBREBEM.CODIGOCEDENTE, COBREBEM.DESCRICAO ',
        ' LEFT JOIN COBREBEM ON ARQ_BOLETO.COD_COBREBEM = COBREBEM.COD_COBREBEM AND ARQ_BOLETO.COD_EMPRESA = COBREBEM.COD_EMP_MULT ',
        vSqlAdicional) then
           if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              ComboBox1.setfocus;

    if ArqBoleto.dataSet.Active then
        for I := 0 to DBGrid1.Columns.Count - 1 do
          if (DBGrid1.Columns[i].FieldName = 'DOC') then
            DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  finally
    _GravaConfiguracoesBoolean(ckbRemessa.Name, ckbRemessa.Checked);	
    _GravaConfiguracoesBoolean(ckbRetorno.Name, ckbRetorno.Checked);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmArquivosBoleto.BitBtn5Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
end;

procedure TfrmArquivosBoleto.bnExportarArquivoClick(Sender: TObject);
var
	txt: textfile;
  saveDialog: TSaveDialog;
begin
	if not vDadosIni.PesqPros('COB013', 'EXPORTAR', '',
  	'ARQ_BOLETO', ArqBoleto.dataSet.FieldByName('COD_COBREBEM').asString, ArqBoleto.buscas, true) then
	  	exit;
      
	//Salvar arquivo no computador
  if trim(ArqBoleto.dataSet.FieldByName('DOC').asString) <> '' then
  begin
  	if Application.MessageBox('Deseja exportar arquivo para o seu computador?',
      'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
      	exit;
    try
      saveDialog := TSaveDialog.Create(nil);
      saveDialog.FileName := ExtractFileName(trim(ArqBoleto.dataSet.FieldByName('DESCRICAO_ARQ').asString));
//      saveDialog.DefaultExt := ExtractFileExt(vARQUIVOLICENCA);
      saveDialog.Filter := ExtractFileExt(trim(ArqBoleto.dataSet.FieldByName('DESCRICAO_ARQ').asString));

      if not saveDialog.Execute then
        exit;

      if (FileExists(PChar(saveDialog.FileName))) then
        DeleteFile(PChar(saveDialog.FileName));

      try
        AssignFile(txt,
        	saveDialog.FileName);
        Rewrite(txt,
        	saveDialog.FileName);
				Append(txt);
        Write(txt, trim(ArqBoleto.dataSet.FieldByName('DOC').asString));

      	vDadosIni.GravaAuditoria('COB013', 'EXPORTAR', 'SUCESSO - ' + ExtractFileName(trim(ArqBoleto.dataSet.FieldByName('DESCRICAO_ARQ').asString)),
        	'ARQ_BOLETO', ArqBoleto.dataSet.FieldByName('COD_COBREBEM').asString, ArqBoleto.buscas);
      finally
        CloseFile(txt);
      end;
    finally
      if Assigned(saveDialog) then
      	saveDialog.Free;
    end;
  end;
end;

procedure TfrmArquivosBoleto.btVoltarClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
end;

procedure TfrmArquivosBoleto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	SpeedButton11Click(Sender);
end;

procedure TfrmArquivosBoleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (ArqBoleto <> nil) then
    ArqBoleto.Cancel;
  ArqBoleto.free;

  Action := caFree;
  if (frmArquivosBoleto <> nil) then
    frmArquivosBoleto := nil;
end;

procedure TfrmArquivosBoleto.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;
	ArqBoleto := TArqBoleto.create;
  tsCadastro.TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmArquivosBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F6) and (ckbRemessa.Enabled) then
    ckbRemessa.Checked := not ckbRemessa.Checked
  else if (Key = VK_F7) and (ckbRetorno.Enabled) then
    ckbRetorno.Checked := not ckbRetorno.Checked
end;

procedure TfrmArquivosBoleto.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmBoletos.dsArquivosBoleto;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  ckbRemessa.Checked := _LerConfiguracoesRegistroBoolean(ckbRemessa.Name);
  ckbRetorno.Checked := _LerConfiguracoesRegistroBoolean(ckbRetorno.Name);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmArquivosBoleto.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if ArqBoleto.dataSet.IsEmpty then
  	exit;
    
	PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tsCadastro;
end;

end.
