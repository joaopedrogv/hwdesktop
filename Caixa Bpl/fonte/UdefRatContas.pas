unit UdefRatContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, Mask,
  DBCtrls, uEditHw, IBCustomDataSet, IBQuery;

type
  TFrmRatContas = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbQtdeEmp: TLabel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label13: TLabel;
    EditHwFornec: TEditHw;
    EditFornec: TEdit;
    EditHwValor: TEditHw;
    Label1: TLabel;
    EditHwValorContabil: TEditHw;
    IBQuery1: TIBQuery;
    lbCPF: TLabel;
    Label2: TLabel;
    EditHwControle: TEditHw;
    DBLookupComboBoxControle: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    procedure EditHwControleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBoxControleExit(Sender: TObject);
    procedure EditHwControleExit(Sender: TObject);
    procedure EditHwFornecExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditHwFornecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwValorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRatContas: TFrmRatContas;

implementation

uses uDtmAtivo, uDtmContasAPagar, uDadosIni;

{$R *.dfm}

procedure TFrmRatContas.BitBtn1Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
		BitBtn1.SetFocus;
	if GroupBox1.Visible then
  begin
    if (EditHwFornec.AsValue <= 0) and (trim(EditFornec.Text) = '') then
    begin
    	Application.MessageBox(PChar('Fornecedor não informado'), 'Atenção', MB_ICONWARNING + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (EditFornec.CanFocus) then
      	EditFornec.SetFocus;
      exit;
    end;

    if EditHwValor.AsValue <= 0 then
    begin
    	Application.MessageBox(PChar('Valor não informado'), 'Atenção', MB_ICONWARNING + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (EditHwValor.CanFocus) then
      	EditHwValor.SetFocus;
      exit;
    end;

    if EditHwControle.AsValue <= 0 then
    begin
    	Application.MessageBox(PChar('Controle não informado'), 'Atenção', MB_ICONWARNING + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (EditHwControle.CanFocus) then
      	EditHwControle.SetFocus;
      exit;
    end;
  end;
  ModalResult := mrOK;
end;

procedure TFrmRatContas.BitBtn2Click(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TFrmRatContas.DBLookupComboBoxControleExit(Sender: TObject);
begin
  inherited;
	EditHwControle.AsValue := DBLookupComboBoxControle.KeyValue;
end;

procedure TFrmRatContas.EditHwControleExit(Sender: TObject);
begin
  inherited;
  if EditHwControle.AsValue <= 0 then
  begin
  	try
      vDadosIni.vPesquisaCodEmpresa := vDadosIni.cod_empresa;
      vDadosIni.codEmpresa := IntToStr(FrmRatContas.Tag);
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CONTROLES', ' and (coalesce(controle_visivel, ''S'') = ''S'') ', 'Consulta de Controles ');
    finally
    	vDadosIni.codEmpresa := IntToStr(vDadosIni.vPesquisaCodEmpresa);
      vDadosIni.vPesquisaCodEmpresa := 0;
    end;
    if (Trim(vDadosIni.vPesquisa) = '') then
    	vDadosIni.vPesquisa := '0';
    EditHwControle.AsValue := StrToInt(vDadosIni.vPesquisa);
  end;
  
  if EditHwControle.AsValue > 0 then
  begin
    IBQuery1.Close;
    IBQuery1.SQL.Text := 'select codigo_ctrl from controles' +
      ' where codigo_ctrl = :codigo_ctrl ' +
      ' and codigo_emp = :codigo_emp ' +
      ' and ativo = 1 ' +
      ' and (coalesce(controle_visivel, ''S'') = ''S'') ';
    IBQuery1.ParamByName('codigo_ctrl').AsInteger := Trunc(EditHwControle.AsValue);
    IBQuery1.ParamByName('codigo_emp').AsInteger := FrmRatContas.Tag;
    IBQuery1.Open;

    if IBQuery1.IsEmpty then
    begin
    	Application.MessageBox(PChar('Controle não encontrado'), 'Atenção', MB_ICONWARNING + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (EditHwControle.CanFocus) then
      	EditHwControle.SetFocus;
      exit;
    end;
  end;

	DBLookupComboBoxControle.KeyValue := EditHwControle.AsValue;
end;

procedure TFrmRatContas.EditHwControleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
  	try
      vDadosIni.vPesquisaCodEmpresa := vDadosIni.cod_empresa;
      vDadosIni.codEmpresa := IntToStr(FrmRatContas.Tag);
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CONTROLES', ' and (coalesce(controle_visivel, ''S'') = ''S'') ', 'Consulta de Controles ');
    finally
    	vDadosIni.codEmpresa := IntToStr(vDadosIni.vPesquisaCodEmpresa);
      vDadosIni.vPesquisaCodEmpresa := 0;
    end;
    if (Trim(vDadosIni.vPesquisa) = '') then
    	vDadosIni.vPesquisa := '0';
    EditHwControle.AsValue := StrToInt(vDadosIni.vPesquisa);
  end
end;

procedure TFrmRatContas.EditHwFornecExit(Sender: TObject);
begin
  inherited;
	if EditHwFornec.AsValue <= 0 then
  begin
    try
      Screen.Cursor := crHourGlass;
      try
        vDadosIni.vPesquisaCodEmpresa := vDadosIni.cod_empresa;
        vDadosIni.codEmpresa := IntToStr(FrmRatContas.Tag);
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ', 'Consulta de Fornecedores');
      finally
      	vDadosIni.codEmpresa := IntToStr(vDadosIni.vPesquisaCodEmpresa);
        vDadosIni.vPesquisaCodEmpresa := 0;
      end;
      if (Trim(vDadosIni.vPesquisa) = '') then
        vDadosIni.vPesquisa := '0';
      EditHwFornec.AsValue := StrToInt(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  if EditHwFornec.AsValue > 0 then
  begin
  	IBQuery1.Close;
    IBQuery1.SQL.Text := 'select cod_cliente,cod_empresa,NOME_CLIENTE, RAZAO,cpfcgc from clientes ' +
      ' where cod_cliente = ' + IntToStr(Trunc(EditHwFornec.AsValue)) +
      ' and (tipo=''F'' or tipo=''A'') ' +
      ' and ativo=1 and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
     IntToStr(FrmRatContas.Tag) , vDadosIni.codEmpresa);
    IBQuery1.Open;
    if IBQuery1.IsEmpty then
    begin
      if Application.MessageBox(Pchar('Fornecedor não encontrado.' + chr(13) + 'Deseja continuar?'),
      	'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrNo then
      begin
      	if (Self.Enabled) and (Self.Visible) and (EditHwFornec.CanFocus) then
        	EditHwFornec.SetFocus;
        exit;
      end
      else if trim(EditFornec.Text) = '' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (EditFornec.CanFocus) then
        	EditFornec.SetFocus;
        exit;
      end;
    end
    else
    begin
      EditFornec.Text := IBQuery1.FieldByName('RAZAO').AsString;
    end;
  end
  else
  begin
    if Application.MessageBox(Pchar('Fornecedor não encontrado.' + chr(13) + 'Deseja continuar?'),
     	'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrNo then
    begin
    	if (Self.Enabled) and (Self.Visible) and (EditHwFornec.CanFocus) then
      	EditHwFornec.SetFocus;
      exit;
    end
    else if trim(EditFornec.Text) = '' then
    begin
      if (Self.Enabled) and (Self.Visible) and (EditFornec.CanFocus) then
        EditFornec.SetFocus;
      exit;
    end;
  end;
end;

procedure TFrmRatContas.EditHwFornecKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	try
    if key = VK_F3 then
    begin
      Screen.Cursor := crHourGlass;
      try
        vDadosIni.vPesquisaCodEmpresa := vDadosIni.cod_empresa;
        vDadosIni.codEmpresa := IntToStr(FrmRatContas.Tag);
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ', 'Consulta de Fornecedores');
      finally
      	vDadosIni.codEmpresa := IntToStr(vDadosIni.vPesquisaCodEmpresa);
        vDadosIni.vPesquisaCodEmpresa := 0;
      end;
      if (Trim(vDadosIni.vPesquisa) <> '') then
        EditHwFornec.AsValue := strtoint(vDadosIni.vPesquisa);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmRatContas.EditHwValorExit(Sender: TObject);
begin
	if not DBGrid1.Visible then
  	exit;
    
	DBGrid1.DataSource.DataSet.First;
  while not DBGrid1.DataSource.DataSet.Eof do
  begin
		DBGrid1.DataSource.DataSet.Edit;
    if EditHwValor.AsValue <= 0 then
      DBGrid1.DataSource.DataSet.FieldByName('VALORDESTINO').Value    := 0
    else
	  	DBGrid1.DataSource.DataSet.FieldByName('VALORDESTINO').Value    := (DBGrid1.DataSource.DataSet.FieldByName('PERCORIGEM').Value/100) * EditHwValor.AsValue;

    if EditHwValor.AsValue <= 0 then
    	DBGrid1.DataSource.DataSet.FieldByName('VALORDESTINOCNT').Value := 0
    else
		  DBGrid1.DataSource.DataSet.FieldByName('VALORDESTINOCNT').Value := (DBGrid1.DataSource.DataSet.FieldByName('PERCORIGEM').Value/100) * EditHwValor.AsValue;
  	DBGrid1.DataSource.DataSet.Post;

    DBGrid1.DataSource.DataSet.Next;
  end;
  DBGrid1.DataSource.DataSet.First;

  EditHwValorContabil.AsValue := EditHwValor.AsValue;
  EditHwValor.AsValue := EditHwValorContabil.AsValue;
end;

end.
