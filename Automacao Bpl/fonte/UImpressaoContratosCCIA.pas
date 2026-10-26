unit UImpressaoContratosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmImpressaoContratosCCIA = class(TForm)
    pnListaContratos: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    Panel12: TPanel;
    DBGrid5: TDBGrid;
    Label1: TLabel;
    BitBtn47: TBitBtn;
    BitBtn31: TBitBtn;
    procedure BitBtn31Click(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure DBGrid5KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpressaoContratosCCIA: TfrmImpressaoContratosCCIA;

implementation

uses
  uDtmAtivo, DB, UVisualizarContratosCCIA;

{$R *.dfm}

procedure TfrmImpressaoContratosCCIA.BitBtn31Click(Sender: TObject);
begin
  if DBGrid5.DataSource.DataSet.IsEmpty then
  begin
    Application.MessageBox(Pchar('Nenhum modelo encontrado para este contrato.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    ModalResult := mrCancel;
    exit;
  end;

  vDadosIni.vPesquisa := DBGrid5.DataSource.DataSet.FieldByName('COD_CARTA').AsString;
  if vDadosIni.vListTemp.Count > 0 then
    vDadosIni.vListTemp[0] := UpperCase(Trim(DBGrid5.DataSource.DataSet.FieldByName('DESCRICAO').AsString)) + '|';
  try
    if not _mdiAberto('FrmVisualizarCartasCCIA', 'O formulário de Visualização de Contratos se encontra aberto!') then
    begin
      vDadosIni.fechaStatusProcessamento;
      exit;
    end;

     if FrmVisualizarContratosCCIA = nil then
     begin
       vDadosIni.vModalOuChild := 'M';
       vDadosIni.vTipoForm := 8;
       Application.CreateForm(TFrmVisualizarContratosCCIA, FrmVisualizarContratosCCIA);
     end;
     FrmVisualizarContratosCCIA.ShowModal
  finally
  end;

end;

procedure TfrmImpressaoContratosCCIA.BitBtn47Click(Sender: TObject);
begin
 ModalResult := mrCancel;
 Close;
end;

procedure TfrmImpressaoContratosCCIA.DBGrid5DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
  if DBGrid5.DataSource.DataSet.IsEmpty then
  begin
    Application.MessageBox(Pchar('Nenhum modelo encontrado para este contrato.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    ModalResult := mrCancel;
    exit;
  end;
end;

procedure TfrmImpressaoContratosCCIA.DBGrid5KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
  begin
    DBGrid5DblClick(Sender); // executa duploClick no grid
    Key := #0;
  end;
end;

procedure TfrmImpressaoContratosCCIA.FormShow(Sender: TObject);
begin
 vDadosIni.fechaStatusProcessamento;
end;

function TfrmImpressaoContratosCCIA._mdiAberto(pNomeFormMDI,
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
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

end.
