unit uCheckCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, UClassesClientes, uDadosIni, 
  uDtmAtivo, uDtmClientes, DBCtrls;

type
  TfrmCheckCheck = class(TForm)
    pnConsultasCheckCheck: TPanel;
    pnCheckCheckBotoes: TPanel;
    btnPermitirEnvioMobile: TBitBtn;
    btnSair: TBitBtn;
    btnEfetuarConsulta: TBitBtn;
    gbCheckCheckConsultas: TGroupBox;
    DBGridConsultasCheckCheck: TDBGrid;
    pnMemo: TPanel;
    spSairGrid: TSpeedButton;
    listGrid: TListBox;
    pnTipoConsulta: TPanel;
    gbTipoConsulta: TGroupBox;
    pnBotaoTipoConsulta: TPanel;
    btnOK: TBitBtn;
    cbTipoConsulta: TDBLookupComboBox;
    procedure listGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure DBGridConsultasCheckCheckColEnter(Sender: TObject);
    procedure spSairGridClick(Sender: TObject);
    procedure DBGridConsultasCheckCheckEditButtonClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPermitirEnvioMobileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEfetuarConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheckCheck: TfrmCheckCheck;

implementation

{$R *.dfm}

procedure TfrmCheckCheck.btnOKClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if vDadosIni.vPesquisaCliente = '' then
    	Exit;
      
    if Trim(cbTipoConsulta.Text) = '' then
    	Exit;

    if not(vCheckCheck.existeConfiguracao(cbTipoConsulta.Text)) then
    begin
    	Application.MessageBox('Não existe configuração para a consulta selecionada!', 'Atenção', 0 + 32);
      Exit;
    end;
    
    TfrmCheckCheck(pnTipoConsulta.Parent).ModalResult := mrOk;    
    vCheckCheck.efetuarConsultaCheckCheck(StrToIntDef(Trim(vDadosIni.vPesquisaCliente), 0), 10, cbTipoConsulta.Text);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCheckCheck.btnEfetuarConsultaClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vCheckCheck.vTipoConsulta.abreTipoConsultaCheckCheck(True);
    vDadosIni.abreForm('Escolha o tipo da consulta', pnTipoConsulta, pnConsultasCheckCheck);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCheckCheck.btnPermitirEnvioMobileClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vCheckCheck.permitirEnvioMobile;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCheckCheck.btnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmCheckCheck.DBGridConsultasCheckCheckColEnter(Sender: TObject);
begin
	if DBGridConsultasCheckCheck.SelectedField.FieldName = 'DADOS_CONSULTA' then
  	DBGridConsultasCheckCheck.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit]
  else
  	DBGridConsultasCheckCheck.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
end;

procedure TfrmCheckCheck.DBGridConsultasCheckCheckEditButtonClick(
  Sender: TObject);
var
  I: Integer;
  formMemo: TForm;
begin
  for I := 0 to DBGridConsultasCheckCheck.Columns.Count - 1 do
    if DBGridConsultasCheckCheck.Columns[I].FieldName = DBGridConsultasCheckCheck.SelectedField.FieldName then
    begin
      try
        formMemo := TForm.Create(Application);
        formMemo.Position := poScreenCenter;
        formMemo.Caption := DBGridConsultasCheckCheck.Columns[I].Title.Caption;
        pnMemo.Visible := True;
        pnMemo.Parent := formMemo;
        formMemo.AutoSize := True;
        formMemo.AutoScroll := False;
        formMemo.KeyPreview := True;
        formMemo.BorderIcons:=[biSystemMenu];

        listGrid.Clear;
        listGrid.Items.Text := DBGridConsultasCheckCheck.SelectedField.AsString;

        formMemo.ShowModal;

      finally
        pnMemo.Parent := frmCheckCheck;
        pnMemo.Visible := False;      
        formMemo.Free;
        formMemo := nil;
      end;
    end;
end;

procedure TfrmCheckCheck.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	FreeAndNil(vCheckCheck);
end;

procedure TfrmCheckCheck.FormCreate(Sender: TObject);
begin
	vCheckCheck := TCheckCheck.create;
end;

procedure TfrmCheckCheck.FormShow(Sender: TObject);
var
  I: Integer;
begin
	vCheckCheck.abreConsultas(StrToIntDef(Trim(vDadosIni.vPesquisaCliente), 0));
  if vCheckCheck.dataSet.Active then
      for I := 0 to DBGridConsultasCheckCheck.Columns.Count - 1 do
        if DBGridConsultasCheckCheck.Columns[i].FieldName = 'DADOS_CONSULTA' then
          DBGridConsultasCheckCheck.Columns[i].ButtonStyle := cbsEllipsis;
end;

procedure TfrmCheckCheck.listGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    spSairGrid.Click;
end;

procedure TfrmCheckCheck.spSairGridClick(Sender: TObject);
begin
  TForm(pnMemo.Parent).ModalResult := IDCANCEL;
end;

end.
