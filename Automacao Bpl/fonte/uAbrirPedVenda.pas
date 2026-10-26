unit uAbrirPedVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmAbrirPedVenda = class(TForm)
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    function _mdiAberto(pNomeFormMDI: string): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbrirPedVenda: TfrmAbrirPedVenda;

implementation

uses UClassesPedVenda, uDadosIni, uDtmAtivo, funcoes, uCadPedVenda, uDtmPedVenda;
{$R *.dfm}

procedure TfrmAbrirPedVenda.FormShow(Sender: TObject);
var
  vPedVendaEstMoto: TPedVenda;
  vFrmCadPedVenda: TFrmCadPedVenda;
begin
 Timer2.Enabled := false;
// if _mdiAberto('TfrmImpPedVenda') then
 begin
   if vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'PEDVENDAIMPESTMOTO' then
   begin
    try
     Screen.Cursor := crHourGlass;
     vDadosIni.vtpVenda := trim(vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString);
     vPedVendaEstMoto := TPedVenda.create(dtmPedVenda);
     vDadosIni.vModalOuChild := 'M';
     Application.CreateForm(TFrmCadPedVenda, vFrmCadPedVenda);
     vFrmCadPedVenda.Visible := False;
//     vFrmCadPedVenda.Height := 0;
//     vFrmCadPedVenda.Width := 0;
//     vFrmCadPedVenda.Position := poMainFormCenter;
     vPedVendaEstMoto.FrmCadPed := vFrmCadPedVenda;

     vPedVendaEstMoto.abrePedVenda(vDadosIni.vDtSetTmp.FieldByName('NPED').AsInteger, vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString);
     vPedVendaEstMoto.imprimirDocumento;
     vPedVendaEstMoto.Free;
     vFrmCadPedVenda.Close;
     vFrmCadPedVenda.Free;
     vFrmCadPedVenda := nil;
    finally
      Screen.Cursor := crDefault;
      Timer2.Enabled := true;
      vDadosIni.vPesquisa := '';
    end;
   end;
 end;
end;

procedure TfrmAbrirPedVenda.Timer2Timer(Sender: TObject);
begin
 Close;
end;

function TfrmAbrirPedVenda._mdiAberto(pNomeFormMDI: string): Boolean;
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
        Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;

end;

initialization
  RegisterClass(TfrmAbrirPedVenda);
finalization
  UnRegisterClass(TfrmAbrirPedVenda);

end.
