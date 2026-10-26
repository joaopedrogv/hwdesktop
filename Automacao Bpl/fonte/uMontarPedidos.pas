unit uMontarPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, uEditHw, ExtCtrls, Buttons, UClassesPedVenda;

type
  TFrmMontarPedidos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lbCliente: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    EditHwCodCliente: TEditHw;
    EditHwCodVendedor: TEditHw;
    ComboBoxTipoVenda: TComboBox;
    EditHwQtdeMaxItens: TEditHw;
    EditHwPrecoVenda: TEditHw;
    RadioGroupUtilizarEstoque: TRadioGroup;
    EditNomeCliente: TEdit;
    EditNomeVendedor: TEdit;
    RadioGroupOrdenarItens: TRadioGroup;
    Panel1: TPanel;
    BitBtnGerarPedidos: TBitBtn;
    BitBtnSair: TBitBtn;
    Label5: TLabel;
    EditHwCodCondPag: TEditHw;
    EditDescricaoCondPag: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EditHwCodCondPagExit(Sender: TObject);
    procedure EditHwCodVendedorExit(Sender: TObject);
    procedure EditHwCodClienteExit(Sender: TObject);
    procedure EditHwCodVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwCodCondPagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtnSairClick(Sender: TObject);
    procedure BitBtnGerarPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMontarPedidos: TFrmMontarPedidos;
  vMontarPedido: TMontarPedido;

implementation

uses
  uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TFrmMontarPedidos.BitBtnGerarPedidosClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
  	EditHwCodCliente.Enabled := False;
    EditHwCodVendedor.Enabled := False;
    ComboBoxTipoVenda.Enabled := False;
    EditHwQtdeMaxItens.Enabled := False;
    EditHwPrecoVenda.Enabled := False;
    RadioGroupUtilizarEstoque.Enabled := False;
    RadioGroupOrdenarItens.Enabled := False;

    if EditHwCodCliente.AsValue <= 0 then
    begin
    	Application.MessageBox('Cliente não informado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (EditHwCodCliente.CanFocus) then
        EditHwCodCliente.SetFocus;
      exit;
    end;

    if trim(vMontarPedido.buscarCliente(Trunc(EditHwCodCliente.AsValue))) = '' then
    begin
    	Application.MessageBox('Cliente não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (EditHwCodCliente.CanFocus) then
        EditHwCodCliente.SetFocus;
      exit;
    end;

    if EditHwCodVendedor.AsValue <= 0 then
    begin
    	Application.MessageBox('Vendedor não informado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (EditHwCodVendedor.CanFocus) then
        EditHwCodVendedor.SetFocus;
      exit;
    end;

    if trim(vMontarPedido.buscarVendedor(Trunc(EditHwCodVendedor.AsValue))) = '' then
    begin
    	Application.MessageBox('Vendedor não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (EditHwCodVendedor.CanFocus) then
        EditHwCodVendedor.SetFocus;
      exit;
    end;

    if EditHwCodCondPag.AsValue <= 0 then
    begin
    	Application.MessageBox('Condição de Pagamento não informado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (EditHwCodCondPag.CanFocus) then
        EditHwCodCondPag.SetFocus;
      exit;
    end;

    if trim(vMontarPedido.buscarCondPag(Trunc(EditHwCodCondPag.AsValue))) = '' then
    begin
    	Application.MessageBox('Condição de Pagamento não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (EditHwCodCondPag.CanFocus) then
        EditHwCodCondPag.SetFocus;
      exit;
    end;

    if ComboBoxTipoVenda.ItemIndex < 0 then
    begin
      Application.MessageBox('Tipo de Venda não informado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (ComboBoxTipoVenda.CanFocus) then
        ComboBoxTipoVenda.SetFocus;
      exit;
    end;

    if EditHwQtdeMaxItens.AsValue <= 0 then
    begin
      Application.MessageBox('Quantidade máxima de itens por pedido não informada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (EditHwQtdeMaxItens.CanFocus) then
        EditHwQtdeMaxItens.SetFocus;
      exit;
    end;

    if EditHwQtdeMaxItens.AsValue > 899 then
    begin
      Application.MessageBox('Quantidade máxima de itens por pedido não pode ser maior que 899!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (EditHwQtdeMaxItens.CanFocus) then
        EditHwQtdeMaxItens.SetFocus;
      exit;
    end;    
    
    ProgressBar1.Position := 0;
    ProgressBar1.Visible := True;
    vMontarPedido.vCodCliente := Trunc(EditHwCodCliente.AsValue);
    vMontarPedido.vCodVendedor := Trunc(EditHwCodVendedor.AsValue);
    vMontarPedido.vCodCondPag := Trunc(EditHwCodCondPag.AsValue);
    vMontarPedido.vTipoVenda := Copy(trim(ComboBoxTipoVenda.Items[ComboBoxTipoVenda.ItemIndex]), 1, 1);
  	vMontarPedido.vUtilizarEstoque := vDadosIni.IfThen(RadioGroupUtilizarEstoque.ItemIndex = 1,
    	'DISPONIVEL', 'FISICO');
  	vMontarPedido.vOrdenarItensPor := vDadosIni.IfThen(RadioGroupOrdenarItens.ItemIndex = 1,
    	'NUM FAB PROD', 'DESCRICAO');
    vMontarPedido.vQtdeMaxItensPed := Trunc(EditHwQtdeMaxItens.AsValue);
    vMontarPedido.vValorItensProdSemPreco := EditHwPrecoVenda.AsValue;

    if not vMontarPedido.montarPedido(ProgressBar1) then
      exit;
	finally
    EditHwCodCliente.Enabled := True;
    EditHwCodVendedor.Enabled := True;
    ComboBoxTipoVenda.Enabled := True;
    EditHwQtdeMaxItens.Enabled := True;
    EditHwPrecoVenda.Enabled := True;
    RadioGroupUtilizarEstoque.Enabled := True;
    RadioGroupOrdenarItens.Enabled := True;
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
	end;
end;

procedure TFrmMontarPedidos.BitBtnSairClick(Sender: TObject);
begin
	try
  	EditHwCodCliente.Enabled := False;
    EditHwCodVendedor.Enabled := False;
    ComboBoxTipoVenda.Enabled := False;
    EditHwQtdeMaxItens.Enabled := False;
    EditHwPrecoVenda.Enabled := False;
    RadioGroupUtilizarEstoque.Enabled := False;
    RadioGroupOrdenarItens.Enabled := False;

    ModalResult := IDCANCEL;
	finally
    EditHwCodCliente.Enabled := True;
    EditHwCodVendedor.Enabled := True;
    ComboBoxTipoVenda.Enabled := True;
    EditHwQtdeMaxItens.Enabled := True;
    EditHwPrecoVenda.Enabled := True;
    RadioGroupUtilizarEstoque.Enabled := True;
    RadioGroupOrdenarItens.Enabled := True;
	end;
end;

procedure TFrmMontarPedidos.EditHwCodClienteExit(Sender: TObject);
begin
	if EditHwCodCliente.AsValue <= 0 then
  begin
  	EditNomeCliente.Text := '';
    Exit;
  end;

  EditNomeCliente.Text := vMontarPedido.buscarCliente(Trunc(EditHwCodCliente.AsValue));
	if trim(EditNomeCliente.Text) = '' then
  begin
  	Application.MessageBox('Cliente não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (EditNomeCliente.CanFocus) then
      EditNomeCliente.SetFocus;
    exit;
  end;
end;

procedure TFrmMontarPedidos.EditHwCodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
      if trim(vDadosIni.vPesquisa) <> '' then
      begin
      	EditHwCodCliente.AsValue := StrToFloat(trim(vDadosIni.vPesquisa));

        EditNomeCliente.Text := vMontarPedido.buscarCliente(Trunc(EditHwCodCliente.AsValue));
        if trim(EditNomeCliente.Text) = '' then
        begin
          Application.MessageBox('Cliente não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
          if (Self.Enabled) and (Self.Visible) and (EditNomeCliente.CanFocus) then
            EditNomeCliente.SetFocus;
          exit;
        end;
      end;
    finally
    	vDadosIni.vPesquisa := '';
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmMontarPedidos.EditHwCodCondPagExit(Sender: TObject);
begin
	if EditHwCodCondPag.AsValue <= 0 then
  begin
  	EditNomeCliente.Text := '';
    Exit;
  end;

  EditDescricaoCondPag.Text := vMontarPedido.buscarCondPag(Trunc(EditHwCodCondPag.AsValue));
	if trim(EditDescricaoCondPag.Text) = '' then
  begin
  	Application.MessageBox('Condição de Pagamento não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (EditHwCodCondPag.CanFocus) then
      EditHwCodCondPag.SetFocus;
    exit;
  end;
end;

procedure TFrmMontarPedidos.EditHwCodCondPagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COND_PAG');
      if trim(vDadosIni.vPesquisa) <> '' then
      begin
      	EditHwCodCondPag.AsValue := StrToFloat(trim(vDadosIni.vPesquisa));

        EditDescricaoCondPag.Text := vMontarPedido.buscarCondPag(Trunc(EditHwCodCondPag.AsValue));
        if trim(EditDescricaoCondPag.Text) = '' then
        begin
          Application.MessageBox('Condição de Pagamento não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
          if (Self.Enabled) and (Self.Visible) and (EditHwCodCondPag.CanFocus) then
            EditHwCodCondPag.SetFocus;
          exit;
        end;
      end;
    finally
    	vDadosIni.vPesquisa := '';
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmMontarPedidos.EditHwCodVendedorExit(Sender: TObject);
begin
	if EditHwCodVendedor.AsValue <= 0 then
  begin
  	EditNomeCliente.Text := '';
    Exit;
  end;

  EditNomeVendedor.Text := vMontarPedido.buscarVendedor(Trunc(EditHwCodVendedor.AsValue));
	if trim(EditNomeVendedor.Text) = '' then
  begin
  	Application.MessageBox('Vendedor não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (EditHwCodVendedor.CanFocus) then
      EditHwCodVendedor.SetFocus;
    exit;
  end;
end;

procedure TFrmMontarPedidos.EditHwCodVendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR');
      if trim(vDadosIni.vPesquisa) <> '' then
      begin
      	EditHwCodVendedor.AsValue := StrToFloat(trim(vDadosIni.vPesquisa));

        EditNomeVendedor.Text := vMontarPedido.buscarVendedor(Trunc(EditHwCodVendedor.AsValue));
        if trim(EditNomeVendedor.Text) = '' then
        begin
          Application.MessageBox('Vendedor não encontrado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
          if (Self.Enabled) and (Self.Visible) and (EditHwCodVendedor.CanFocus) then
            EditHwCodVendedor.SetFocus;
          exit;
        end;
      end;
    finally
    	vDadosIni.vPesquisa := '';
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmMontarPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	vMontarPedido.Cancel;
  vMontarPedido.RollBackTransacao;
  vMontarPedido.free;
  vMontarPedido := nil;

  if (FrmMontarPedidos <> nil) then
    FrmMontarPedidos := nil;
end;

procedure TFrmMontarPedidos.FormCreate(Sender: TObject);
begin
	vMontarPedido := TMontarPedido.create;
end;

procedure TFrmMontarPedidos.FormShow(Sender: TObject);
begin
	ProgressBar1.Visible := False;
	EditNomeCliente.Text  := '';
  EditNomeVendedor.Text := '';
  EditDescricaoCondPag.Text := '';

  EditHwCodVendedor.AsValue := vDadosIni.vCodUsuario;
  EditNomeVendedor.Text     := vMontarPedido.buscarVendedor(vDadosIni.vCodUsuario);

  EditHwCodCondPag.AsValue  := 1;
  EditDescricaoCondPag.Text := vMontarPedido.buscarCondPag(1);

  vMontarPedido.carregarTipoVenda(ComboBoxTipoVenda);

  vDadosIni.fechaStatusProcessamento;
end;

end.
