unit UTipoSaidaCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFrmTipoSaidaCCIA = class(TForm)
    PageControl1: TPageControl;
    tsCFT: TTabSheet;
    tsContrato: TTabSheet;
    tsDemonstr: TTabSheet;
    Panel1: TPanel;
    btnCFTDemos: TBitBtn;
    btnCFTRDemons: TBitBtn;
    BitBtn9: TBitBtn;
    Panel2: TPanel;
    btnCFTVenda: TBitBtn;
    btnCFTCons: TBitBtn;
    btnCFTInter: TBitBtn;
    BitBtn11: TBitBtn;
    Panel3: TPanel;
    btnCtrVenda: TBitBtn;
    btnCtrCons: TBitBtn;
    btnCtrReservDom: TBitBtn;
    btnCtrInterm: TBitBtn;
    BitBtn12: TBitBtn;
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCFTInterClick(Sender: TObject);
    procedure btnCFTConsClick(Sender: TObject);
    procedure btnCFTVendaClick(Sender: TObject);
    procedure btnCtrIntermClick(Sender: TObject);
    procedure btnCtrReservDomClick(Sender: TObject);
    procedure btnCtrConsClick(Sender: TObject);
    procedure btnCtrVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCFTRDemonsClick(Sender: TObject);
    procedure btnCFTDemosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTipoSaidaCCIA: TFrmTipoSaidaCCIA;
  vModCFT, vModCFTv, vTipoVenda: string;
  vEstoque, vComFat, vMorto, vEditar: boolean;
  vNumNota, vNumNotaV: Integer;
implementation

uses
  uDtmAtivo, DB;

{$R *.dfm}

procedure TFrmTipoSaidaCCIA.btnCFTRDemonsClick(Sender: TObject);
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
      vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Comando Faturamento';
      vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
      vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'R';
      vDadosIni.vDtSetTmp.Post;
    end;
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTipoSaidaCCIA.btnCFTVendaClick(Sender: TObject);
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
     vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'V';
     vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Comando de Venda';
     vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'S';
     vDadosIni.vDtSetTmp.Post;
   end;
   ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTipoSaidaCCIA.btnCtrConsClick(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.vDtSetTmp.IsEmpty then
    begin
      if vDadosIni.vDtSetTmp.State <> dsEdit then
       vDadosIni.vDtSetTmp.Edit;
      vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CTR';
      vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'S';
      vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CTRVNDCONS';
      vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'C';
      vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Contrato de Saída para Venda em Consignação';
      vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
      vDadosIni.vDtSetTmp.Post;
    end;
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTipoSaidaCCIA.btnCtrIntermClick(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.vDtSetTmp.IsEmpty then
    begin
      if vDadosIni.vDtSetTmp.State <> dsEdit then
       vDadosIni.vDtSetTmp.Edit;
      vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CTR';
      vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'S';
      vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CTRINTERM';
      vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'I';
      vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Contrato de Intermediação';
      vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
      vDadosIni.vDtSetTmp.Post;
    end;
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTipoSaidaCCIA.btnCtrReservDomClick(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.vDtSetTmp.IsEmpty then
    begin
      if vDadosIni.vDtSetTmp.State <> dsEdit then
       vDadosIni.vDtSetTmp.Edit;
      vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CTR';
      vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'S';
      vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CTRRESDOM';
      vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'V';
      vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Contrato Reserva de Domínio';
      vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'S';
      vDadosIni.vDtSetTmp.Post;
    end;
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTipoSaidaCCIA.btnCtrVendaClick(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.vDtSetTmp.IsEmpty then
    begin
      if vDadosIni.vDtSetTmp.State <> dsEdit then
       vDadosIni.vDtSetTmp.Edit;
      vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CTR';
      vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'S';
      vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CTRVND';
      vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'V';
      vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Contrato de Venda';
      vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'S';
      vDadosIni.vDtSetTmp.Post;
    end;
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTipoSaidaCCIA.BitBtn11Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmTipoSaidaCCIA.BitBtn12Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmTipoSaidaCCIA.BitBtn9Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmTipoSaidaCCIA.btnCFTConsClick(Sender: TObject);
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
     vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'C';
     vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Comando de Saída para Venda em Consignação';
     vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
     vDadosIni.vDtSetTmp.Post;
   end;
   ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTipoSaidaCCIA.btnCFTDemosClick(Sender: TObject);
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
      vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Comando Faturamento';
      vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
      vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'D';
      vDadosIni.vDtSetTmp.Post;
    end;
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTipoSaidaCCIA.btnCFTInterClick(Sender: TObject);
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
     vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'I';
     vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Comando de Intermediação';
     vDadosIni.vDtSetTmp.FieldByName('ALTERA_ESTOQUE_CFOP').AsString := 'N';
     vDadosIni.vDtSetTmp.Post;
   end;
   ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTipoSaidaCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
  BitBtn11Click(Sender);
end;

procedure TFrmTipoSaidaCCIA.FormShow(Sender: TObject);
begin
  tsContrato.TabVisible := False;
  tsDemonstr.TabVisible := False;
  tsCFT.TabVisible := False;

  if trim(vDadosIni.vPesquisaPlaca) = 'CFT' then
  begin
   FrmTipoSaidaCCIA.Caption := 'Comando de Faturamento (Veículos)';
   PageControl1.ActivePage := tsCFT;
   tsCFT.Show;
  end
  else if trim(vDadosIni.vPesquisaPlaca) = 'CTR' then
  begin
   FrmTipoSaidaCCIA.Caption := 'Contratos de Venda (Veículos)';
   PageControl1.ActivePage := tsContrato;
   tsContrato.Show;
  end
  else if trim(vDadosIni.vPesquisaPlaca) = 'DEMONSTRACAO' then
  begin
   FrmTipoSaidaCCIA.Caption := 'Demonstração (Veículos)';
   PageControl1.ActivePage := tsDemonstr;
   tsDemonstr.Show;
  end;
  vModCFT := vDadosIni.vDtSetTmp.FieldByName('MODELO_CFT').AsString;
  vModCFTv := vDadosIni.vDtSetTmp.FieldByName('MODELO_CFTV').AsString;
  vEstoque := vDadosIni.vDtSetTmp.FieldByName('STATUS_ESTOQUE').AsString = 'S';
  vMorto := trim(vDadosIni.vDtSetTmp.FieldByName('POSICAO').AsString) = 'MORTO';
  vNumNota := vDadosIni.vDtSetTmp.FieldByName('NUM_NOTA').AsInteger;
  vNumNotaV := vDadosIni.vDtSetTmp.FieldByName('NUM_NOTAV').AsInteger;
  vComFat := vDadosIni.vDtSetTmp.FieldByName('COMFAT').Value = true;
  vTipoVenda := trim(vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString);
  vEditar := vDadosIni.vDtSetTmp.FieldByName('EDITAR').Value = true;

  btnCFTVenda.Enabled := True;
  btnCFTCons.Enabled := True;
  btnCFTInter.Enabled := True;

  btnCtrVenda.Enabled := True;
  btnCtrCons.Enabled := True;
  btnCtrReservDom.Enabled := True;
  btnCtrInterm.Enabled := True;

  btnCFTDemos.Enabled := True;
  btnCFTRDemons.Enabled := True;
  BitBtn9.Enabled := True;
  BitBtn11.Enabled := True;
  BitBtn12.Enabled := True;

  if not vComFat then
  begin
    btnCFTVenda.Enabled := (vTipoVenda <> '') and (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A')
       and (not vMorto) and (vEstoque) and ((vModCFT = '') or (vModCFT = 'CTRCOMPRA'))
       and ((vTipoVenda = 'V') or (vTipoVenda = 'D') or (vTipoVenda = 'T') or (vTipoVenda = 'R') or (vTipoVenda = 'E'))
       and (vNumNota > 0);

    btnCFTCons.Enabled := (vTipoVenda <> '') and (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A')
       and (not vMorto) and (not vEstoque) and ((vModCFT = '') or (vModCFT = 'CTRENTCONS'))
       and (vTipoVenda = 'C') and (vNumNota > 0);

    btnCFTInter.Enabled := (vTipoVenda <> '') and (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A')
       and (not vMorto) and (not vEstoque) and (vTipoVenda = 'I') and (vNumNota = 0);

    btnCtrVenda.Enabled := (vTipoVenda <> '') and (vDadosIni.vEmp.vTipoEmpVeiculos = 'A')
       and (not vMorto) and (vEstoque) and ((vModCFT = '') or (vModCFT = 'CTRCOMPRA'))
       and ((vTipoVenda = 'V') or (vTipoVenda = 'D') or (vTipoVenda = 'T') or (vTipoVenda = 'R') or (vTipoVenda = 'E'))
       and (vNumNota > 0);

    btnCtrCons.Enabled := (vTipoVenda <> '') and (vDadosIni.vEmp.vTipoEmpVeiculos = 'A')
       and (not vMorto) and (not vEstoque) and ((vModCFT = '') or (vModCFT = 'CTRENTCONS'))
       and (vTipoVenda = 'C') and (vNumNota > 0);

    btnCtrReservDom.Enabled := (vTipoVenda <> '') and (vDadosIni.vEmp.vTipoEmpVeiculos = 'A')
       and (not vMorto) and (vEstoque) and ((vModCFT = '') or (vModCFT = 'CTRCOMPRA'))
       and ((vTipoVenda = 'V') or (vTipoVenda = 'D') or (vTipoVenda = 'T') or (vTipoVenda = 'R') or (vTipoVenda = 'E'))
       and (vNumNota > 0);

    btnCtrInterm.Enabled := (vTipoVenda <> '') and (vDadosIni.vEmp.vTipoEmpVeiculos = 'A')
       and (not vMorto) and (not vEstoque) and (vTipoVenda = 'I') and (vNumNota = 0);

    btnCFTDemos.Enabled := (vTipoVenda <> '') and (not vMorto) and (vEstoque)
      and ((vTipoVenda = 'V') or (vTipoVenda = 'T') or (vTipoVenda = 'C')
           or (vTipoVenda = 'R') or (vTipoVenda = 'E') or (vTipoVenda = 'D'));
      
    btnCFTRDemons.Enabled := (vTipoVenda <> '') and (not vMorto) and (not vEstoque) and (vTipoVenda = 'D');
  end
  else
  begin
    if vEditar then
    begin
      btnCFTVenda.Enabled := vTipoVenda = 'V';
      btnCFTCons.Enabled := vTipoVenda = 'C';
      btnCFTInter.Enabled := vTipoVenda = 'I';

      btnCtrVenda.Enabled := vTipoVenda = 'V';
      btnCtrCons.Enabled := vTipoVenda = 'C';
      btnCtrReservDom.Enabled := vTipoVenda = 'V';
      btnCtrInterm.Enabled := vTipoVenda = 'I';

      btnCFTDemos.Enabled := vTipoVenda = 'D';
      btnCFTRDemons.Enabled := vTipoVenda = 'R';
    end
    else
    begin
      btnCFTVenda.Enabled := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A');
      btnCFTCons.Enabled := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A');
      btnCFTInter.Enabled := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A');

      btnCtrVenda.Enabled := (vDadosIni.vEmp.vTipoEmpVeiculos = 'A');
      btnCtrCons.Enabled := (vDadosIni.vEmp.vTipoEmpVeiculos = 'A');
      btnCtrReservDom.Enabled := (vDadosIni.vEmp.vTipoEmpVeiculos = 'A');
      btnCtrInterm.Enabled := (vDadosIni.vEmp.vTipoEmpVeiculos = 'A');
    end;
  end;

  if (PageControl1.ActivePage = tsCFT) then
  begin
    if (Self.Enabled) and (Self.Visible) and (btnCFTVenda.CanFocus) then
      btnCFTVenda.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (btnCFTCons.CanFocus) then
      btnCFTCons.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (btnCFTInter.CanFocus) then
      btnCFTInter.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn11.CanFocus) then
      BitBtn11.SetFocus;
  end
  else if (PageControl1.ActivePage = tsContrato) then
  begin
    if (Self.Enabled) and (Self.Visible) and (btnCtrVenda.CanFocus) then
      btnCtrVenda.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (btnCtrCons.CanFocus) then
      btnCtrCons.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (btnCtrReservDom.CanFocus) then
      btnCtrReservDom.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (btnCtrInterm.CanFocus) then
      btnCtrInterm.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn12.CanFocus) then
      BitBtn12.SetFocus;
  end
  else if (PageControl1.ActivePage = tsDemonstr) then
  begin
    if (Self.Enabled) and (Self.Visible) and (btnCFTDemos.CanFocus) then
      btnCFTDemos.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (btnCFTRDemons.CanFocus) then
      btnCFTRDemons.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn9.CanFocus) then
      BitBtn9.SetFocus;
  end;
  vDadosIni.fechaStatusProcessamento;
end;

end.
