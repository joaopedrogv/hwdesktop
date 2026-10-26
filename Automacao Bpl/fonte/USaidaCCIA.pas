unit USaidaCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UClassesVeiculosCCIA, ComCtrls;

type
  TfrmSaidaCCIA = class(TForm)
    pnSaida: TPanel;
    btnCtr: TBitBtn;
    BitBtn9: TBitBtn;
    btnCFT: TBitBtn;
    btnCFTDemons: TBitBtn;
    btnCFTTransfDep: TBitBtn;
    btnCFTOutras: TBitBtn;
    btnCFTDevol: TBitBtn;
    btnAvulsa: TBitBtn;
    btnCFTAtivo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnCFTAtivoClick(Sender: TObject);
    procedure btnCtrClick(Sender: TObject);
    procedure btnCFTClick(Sender: TObject);
    procedure btnAvulsaClick(Sender: TObject);
    procedure btnCFTDevolClick(Sender: TObject);
    procedure btnCFTOutrasClick(Sender: TObject);
    procedure btnCFTDemonsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCFTTransfDepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaidaCCIA: TfrmSaidaCCIA;
  vSing: TSing;
  vXmlNf: TXmlImport;
  vModCFT, vModCFTv, vTipoVenda: string;
  vEstoque, vComFat, vMorto, vEditar: boolean;
  vNumNota, vNumNotaV: Integer;

implementation

uses
  uDtmAtivo, DBClient, DB, UTipoSaidaCCIA;

{$R *.dfm}

procedure TfrmSaidaCCIA.btnCFTAtivoClick(Sender: TObject);
begin
 try
   Cursor := crHourGlass;
   if not vDadosIni.vDtSetTmp.IsEmpty then
   begin
     if vDadosIni.vDtSetTmp.State <> dsEdit then
      vDadosIni.vDtSetTmp.Edit;
     vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CFT';
     vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'S';
     vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CFT';
     vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'A';
     vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Comando Faturamento';
     vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
     vDadosIni.vDtSetTmp.Post;
   end;
   ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSaidaCCIA.btnCFTClick(Sender: TObject);
begin
 try
    Cursor := crHourGlass;
    Application.CreateForm(TFrmTipoSaidaCCIA, FrmTipoSaidaCCIA);
    vDadosIni.vPesquisaPlaca := 'CFT';
    if FrmTipoSaidaCCIA.showModal = mrOK then
      ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSaidaCCIA.btnCFTDemonsClick(Sender: TObject);
begin
  try
    Cursor := crHourGlass;
    Application.CreateForm(TFrmTipoSaidaCCIA, FrmTipoSaidaCCIA);
    vDadosIni.vPesquisaPlaca := 'DEMONSTRACAO';
    if FrmTipoSaidaCCIA.showModal = mrOK then
      ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSaidaCCIA.btnCFTTransfDepClick(Sender: TObject);
begin
  try
    Cursor := crHourGlass;
    if not vDadosIni.vDtSetTmp.IsEmpty then
    begin
      if vDadosIni.vDtSetTmp.State <> dsEdit then
       vDadosIni.vDtSetTmp.Edit;
      vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CFT';
      vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'S';
      vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CFT';
      vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'T';
      vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Comando Faturamento';
      vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'S';
      vDadosIni.vDtSetTmp.Post;
    end;
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSaidaCCIA.btnCtrClick(Sender: TObject);
begin
  try
    Cursor := crHourGlass;
    Application.CreateForm(TFrmTipoSaidaCCIA, FrmTipoSaidaCCIA);
    vDadosIni.vPesquisaPlaca := 'CTR';
    if FrmTipoSaidaCCIA.showModal = mrOK then
      ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSaidaCCIA.BitBtn9Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TfrmSaidaCCIA.btnCFTOutrasClick(Sender: TObject);
begin
  try
    Cursor := crHourGlass;
    if not vDadosIni.vDtSetTmp.IsEmpty then
    begin
      if vDadosIni.vDtSetTmp.State <> dsEdit then
       vDadosIni.vDtSetTmp.Edit;
      vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CFT';
      vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'S';
      vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CFT';
      vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'O';
      vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Outras Saídas';
      vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
      vDadosIni.vDtSetTmp.Post;
    end;
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSaidaCCIA.btnCFTDevolClick(Sender: TObject);
begin
 try
   Cursor := crHourGlass;
   if not vDadosIni.vDtSetTmp.IsEmpty then
   begin
     if vDadosIni.vDtSetTmp.State <> dsEdit then
      vDadosIni.vDtSetTmp.Edit;
     vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CFT';
     vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'S';
     vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CFT';
     vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'E';
     vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Comando Faturamento';
     vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'S';
     vDadosIni.vDtSetTmp.Post;
   end;
   ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSaidaCCIA.btnAvulsaClick(Sender: TObject);
begin
try
  vXmlNf.montarNfAvulsa('S');
  ModalResult := mrCancel;
 except
 end;
end;

procedure TfrmSaidaCCIA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (vXmlNf <> nil) then
    vXmlNf.Cancel;

  vXmlNf.free;
  vXmlNf := nil;
//  Action := caFree;
//  if (frmSaidaCCIA <> nil) then
//    frmSaidaCCIA := nil;
end;

procedure TfrmSaidaCCIA.FormCreate(Sender: TObject);
begin
 if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ESTMOTO_EQUIP' then
 begin
   vDadosIni.vTipoForm := 7;
   vDadosIni.vModalOuChild := 'M';
 end;
end;

procedure TfrmSaidaCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BitBtn9Click(Sender);
end;

procedure TfrmSaidaCCIA.FormShow(Sender: TObject);
begin
  if (vDadosIni.vTipoForm = 7) then
  begin
   vEditar := True;
   vComFat := True;
   vTipoVenda := 'A';
  end
  else
  begin
    vModCFT := vDadosIni.vDtSetTmp.FieldByName('MODELO_CFT').AsString;
    vModCFTv := vDadosIni.vDtSetTmp.FieldByName('MODELO_CFTV').AsString;
    vEstoque := vDadosIni.vDtSetTmp.FieldByName('STATUS_ESTOQUE').AsString = 'S';
    vMorto := (trim(vDadosIni.vDtSetTmp.FieldByName('POSICAO').AsString) = 'MORTO')
      or (trim(vDadosIni.vDtSetTmp.FieldByName('POSICAO').AsString) = 'TRANSITO');
    vNumNota := vDadosIni.vDtSetTmp.FieldByName('NUM_NOTA').AsInteger;
    vNumNotaV := vDadosIni.vDtSetTmp.FieldByName('NUM_NOTAV').AsInteger;
    vComFat := vDadosIni.vDtSetTmp.FieldByName('COMFAT').Value = true;
    vTipoVenda := trim(vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString);
    vEditar := vDadosIni.vDtSetTmp.FieldByName('EDITAR').Value = true;
  end;

  btnCFT.Enabled := True;
  btnCTR.Enabled := True;

  btnCFTDemons.Enabled := True;
  btnCFTTransfDep.Enabled := True;
  btnCFTAtivo.Enabled := True;
  btnCFTOutras.Enabled := True;
  btnCFTDevol.Enabled := True;
  btnAvulsa.Enabled := True;

  if not vComFat then
  begin
    btnCFT.Enabled := (vTipoVenda <> '') and (not vMorto) and (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A')
     and (
       (((vNumNota > 0) and (vTipoVenda <> 'D') and (vTipoVenda <> 'A')) or (vTipoVenda = 'I'))
     or
       ((vEstoque) and (vTipoVenda = 'D'))
         );

    btnCtr.Enabled := (vTipoVenda <> '') and (not vMorto) and (vDadosIni.vEmp.vTipoEmpVeiculos = 'A')
     and (
       (((vNumNota > 0) and (vTipoVenda <> 'D') and (vTipoVenda <> 'A')) or (vTipoVenda = 'I'))
     or
       ((vEstoque) and (vTipoVenda = 'D'))
         );

    btnCFTDemons.Enabled := (vTipoVenda <> '') and (not vMorto) and (vNumNota > 0)
     and (
       ((vEstoque) and ((vTipoVenda = 'V') or (vTipoVenda = 'T') or (vTipoVenda = 'C')
          or (vTipoVenda = 'R') or (vTipoVenda = 'E') or (vTipoVenda = 'D')))
     or
       ((not vEstoque) and (vTipoVenda = 'D'))
         );
         
    btnCFTTransfDep.Enabled := (vTipoVenda <> '') and (not vMorto) and (vEstoque) and (vNumNota > 0)
     and ((vTipoVenda = 'V') or (vTipoVenda = 'T') or (vTipoVenda = 'R') or (vTipoVenda = 'E') or (vTipoVenda = 'D'));

    btnCFTAtivo.Enabled := (vTipoVenda <> '') and (not vMorto) and (not vEstoque) and (vNumNota > 0)
     and (vTipoVenda = 'A');

    btnCFTDevol.Enabled := (vTipoVenda <> '') and (not vMorto) and (vNumNota > 0)
     and (vTipoVenda <> 'I') and (vTipoVenda <> 'A') ;

    btnCFTOutras.Enabled := (not vMorto)
     and (
       ((vTipoVenda <> '') and (vTipoVenda <> 'D') and (vTipoVenda <> 'C') and (vTipoVenda <> 'I') and (vTipoVenda <> 'A'))
     or  ((vTipoVenda = 'C') and (vNumNota = 0))
         );
  end
  else
  begin
    if vEditar then
    begin
      btnCFT.Enabled := ((vTipoVenda = 'V') or (vTipoVenda = 'C') or (vTipoVenda = 'I'));
      btnCtr.Enabled := ((vTipoVenda = 'V') or (vTipoVenda = 'C') or (vTipoVenda = 'I'));

      btnCFTDemons.Enabled := ((vTipoVenda = 'D') or (vTipoVenda = 'R'));
      btnCFTTransfDep.Enabled := vTipoVenda = 'T';
      btnCFTAtivo.Enabled := vTipoVenda = 'A';
      btnCFTDevol.Enabled := vTipoVenda = 'E';
      btnCFTOutras.Enabled := vTipoVenda = 'O';
      btnAvulsa.Enabled := False;
    end
    else
    begin
     btnCFT.Enabled := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A');
     btnCtr.Enabled := (vDadosIni.vEmp.vTipoEmpVeiculos = 'A');
    end;
  end;
  vDadosIni.fechaStatusProcessamento;
end;

end.
