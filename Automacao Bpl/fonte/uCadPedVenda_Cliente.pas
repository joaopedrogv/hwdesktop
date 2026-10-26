unit uCadPedVenda_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Mask, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  ComCtrls, UClassesPedVenda;

type
  TfrmCadPedVendaCliente = class(TfrmPadrao)
    page_cliente: TPageControl;
    ts_cliente_enderecos_add: TTabSheet;
    pn_cliente_dests: TPanel;
    Panel74: TPanel;
    grid_cliente_dests: TDBGrid;
    group_cliente_enddoc_minuta: TGroupBox;
    DBMemo9: TDBMemo;
    Panel75: TPanel;
    Label237: TLabel;
    Label238: TLabel;
    bt_cliente_dests_utilizar_principal: TBitBtn;
    BitBtn115: TBitBtn;
    bt_cliente_dests_utilizar_entrega: TBitBtn;
    Panel73: TPanel;
    Panel76: TPanel;
    ts_cliente_emissao_nfe: TTabSheet;
    Panel1: TPanel;
    Label393: TLabel;
    edCodCliFat: TDBEdit;
    lbClienteFaturamento: TLabel;
    editCodCliFatBtn: TSpeedButton;
    saveCodCliFatBtn: TSpeedButton;
    procedure edCodCliFatEnter(Sender: TObject);
    procedure saveCodCliFatBtnClick(Sender: TObject);
    procedure editCodCliFatBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edCodCliFatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodCliFatExit(Sender: TObject);
    procedure bt_cliente_dests_utilizar_entregaClick(Sender: TObject);
    procedure bt_cliente_dests_utilizar_principalClick(Sender: TObject);
    procedure grid_cliente_destsExit(Sender: TObject);
    procedure grid_cliente_destsEnter(Sender: TObject);
    procedure grid_cliente_destsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    FPedVenda: TPedVenda;

    procedure pedvenda_cliente_endadd_scroll;
  public
    property PedVenda: TPedVenda read FPedVenda write FPedVenda;
  end;

var
  frmCadPedVendaCliente: TfrmCadPedVendaCliente;

implementation

uses
  DB,
  uDtmAtivo,
  uDtmPedVenda, uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadPedVendaCliente.bt_cliente_dests_utilizar_entregaClick(
  Sender: TObject);
begin
  inherited;
  PedVenda.vCliente.endAdic.utilizarEndereco_entrega;
  grid_cliente_dests.Repaint;
  pedvenda_cliente_endadd_scroll;
end;

procedure TfrmCadPedVendaCliente.bt_cliente_dests_utilizar_principalClick(
  Sender: TObject);
begin
  inherited;
  if PedVenda.vCliente.endAdic.utilizarEndereco_principal then
    bt_cliente_dests_utilizar_principal.Tag := 1;
  grid_cliente_dests.Repaint;
  pedvenda_cliente_endadd_scroll;
end;

procedure TfrmCadPedVendaCliente.edCodCliFatEnter(Sender: TObject);
begin
  inherited;
  saveCodCliFatBtn.Visible := True;
  editCodCliFatBtn.Visible := False;
end;

procedure TfrmCadPedVendaCliente.edCodCliFatExit(Sender: TObject);
begin
  inherited;
  lbClienteFaturamento.Caption := PedVenda.ChangeClienteFaturamento(PedVenda.fint('cod_cli_fat'));

  if edCodCliFat.Tag <> PedVenda.fint('cod_cli_fat') then
    vDadosIni.GravaAuditoria('VND264', 'EDITAR',
      Format('Cliente: %d Emissão NFe: %d para %d', [PedVenda.fint('cod_cliente'), edCodCliFat.Tag, PedVenda.fint('cod_cli_fat')]),
      'PEDVENDA', PedVenda.fstr('TIPO') + ' ' + PedVenda.fstr('NPED'), PedVenda.buscas);

  edCodCliFat.Tag := PedVenda.fint('cod_cli_fat');

  saveCodCliFatBtn.Visible := False;
  editCodCliFatBtn.Visible := True;
  edCodCliFat.Enabled := False;

end;

procedure TfrmCadPedVendaCliente.edCodCliFatKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  iCod: Integer;
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');

    if TryStrToInt(vDadosIni.vPesquisa, iCod) then
    begin
      lbClienteFaturamento.Caption := PedVenda.ChangeClienteFaturamento(iCod);

      if edCodCliFat.Tag <> PedVenda.fint('cod_cli_fat') then
        vDadosIni.GravaAuditoria('VND264', 'EDITAR',
          Format('Cliente: %d Emissão NFe: %d para %d', [PedVenda.fint('cod_cliente'), edCodCliFat.Tag, PedVenda.fint('cod_cli_fat')]),
          'PEDVENDA', PedVenda.fstr('TIPO') + ' ' + PedVenda.fstr('NPED'), PedVenda.buscas);

      edCodCliFat.Tag := PedVenda.fint('cod_cli_fat');
    end;
  end;
end;

procedure TfrmCadPedVendaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadPedVendaCliente := nil;
end;

procedure TfrmCadPedVendaCliente.FormShow(Sender: TObject);
begin
  inherited;
  edCodCliFat.Enabled := False;
  bt_cliente_dests_utilizar_principal.Tag     := 0;
  bt_cliente_dests_utilizar_principal.Enabled := PedVenda.dataSet.State in [dsEdit, dsInsert];
  bt_cliente_dests_utilizar_entrega.Enabled   := bt_cliente_dests_utilizar_principal.Enabled;
  grid_cliente_dests.DataSource               := PedVenda.vCliente.endAdic._dataSourceOOP;
  pedvenda_cliente_endadd_scroll;

  ts_cliente_enderecos_add.TabVisible := False;
  ts_cliente_emissao_nfe.TabVisible := False;

  page_cliente.ActivePage := ts_cliente_enderecos_add;
  lbClienteFaturamento.Caption := PedVenda.ChangeClienteFaturamento(PedVenda.fint('cod_cli_fat'));
end;

procedure TfrmCadPedVendaCliente.grid_cliente_destsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if PedVenda.vCliente.endAdic.dataSet.IsEmpty then
    Exit;

 if (PedVenda.vCliente.endAdic.f_int('dest_seqid') = PedVenda.f_int('dest_seqid')) then
     TDBGrid(Sender).Canvas.Brush.Color := $00C1C1FF;

 if not PedVenda.dataSet.FieldByName('dest_seqid_entrg').IsNull then
   if (PedVenda.vCliente.endAdic.f_int('dest_seqid') = PedVenda.f_int('dest_seqid_entrg')) then
     TDBGrid(Sender).Canvas.Brush.Color := $00AEFF93;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadPedVendaCliente.grid_cliente_destsEnter(Sender: TObject);
begin
  inherited;
  if PedVenda.vCliente.endAdic.dataSet.IsEmpty then
  begin
    group_cliente_enddoc_minuta.Visible := False;
    Exit;
  end;
  PedVenda.vCliente.endAdic.onAfterScroll := pedvenda_cliente_endadd_scroll;
end;

procedure TfrmCadPedVendaCliente.grid_cliente_destsExit(Sender: TObject);
begin
  inherited;
  PedVenda.vCliente.endAdic.onAfterScroll := nil;
end;

procedure TfrmCadPedVendaCliente.pedvenda_cliente_endadd_scroll;
begin
  group_cliente_enddoc_minuta.Visible := (not PedVenda.dataSet.FieldByName('dest_seqid_entrg').IsNull) and
                                         (PedVenda.vCliente.endAdic.f_int('dest_seqid') = PedVenda.f_int('dest_seqid_entrg'));
end;

procedure TfrmCadPedVendaCliente.saveCodCliFatBtnClick(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadPedVendaCliente.editCodCliFatBtnClick(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('VND264', 'HABILITAR', 'Cliente: ' + PedVenda.fstr('cod_cliente') + ' Emissao NFe: ' + PedVenda.fstr('cod_cli_fat'),
    'PEDVENDA', PedVenda.fstr('TIPO') + ' ' + PedVenda.fstr('NPED'), PedVenda.buscas, true) then
    Exit;

  edCodCliFat.Tag := PedVenda.fint('cod_cli_fat');

  edCodCliFat.Enabled := True;

  if (Self.Enabled) and (Self.Visible) and (edCodCliFat.CanFocus) then
  	edCodCliFat.SetFocus;
end;

end.



