unit uFrameCheckListaContato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, ExtCtrls, StdCtrls, CheckLst, uDadosIni;

type
  TFrameCheckListaContato = class(TFrame)
    GroupBoxContato: TGroupBox;
    CheckListBoxContato: TCheckListBox;
    pnContato: TPanel;
    bt_contatos_pla_add: TSpeedButton;
    bt_contatos_pla_edit: TSpeedButton;
    bt_contatos_pla_del: TSpeedButton;
    btSelectAllContato: TSpeedButton;
    btUnSelectAllContato: TSpeedButton;
    bt_contatos_pla_outros_add: TSpeedButton;
    bt_contatos_pla_outros_del: TSpeedButton;
    CheckListBoxAplicativo: TCheckListBox;
    procedure CheckListBoxContatoClick(Sender: TObject);
    procedure bt_contatos_pla_outros_delClick(Sender: TObject);
    procedure bt_contatos_pla_outros_addClick(Sender: TObject);
    procedure bt_contatos_pla_delClick(Sender: TObject);
    procedure bt_contatos_pla_editClick(Sender: TObject);
    procedure bt_contatos_pla_addClick(Sender: TObject);
    procedure btUnSelectAllContatoClick(Sender: TObject);
    procedure btSelectAllContatoClick(Sender: TObject);
    procedure carregarContatoAplicativo;
    procedure _LerConfiguracoesRegistro;
    procedure _GravaConfiguracoesRegistro;
  private
    { Private declarations }
  public
    { Public declarations }
    CodCliente: Integer;
  	Origem: TOrigemEnv;
    UnicoMens: Boolean;
  end;

implementation

uses
  uDtmAtivo, uDataSet_OOP, StrUtils, hw_utils;

{$R *.dfm}

procedure TFrameCheckListaContato.carregarContatoAplicativo;
begin
	bt_contatos_pla_add.Hint  := 'Incluir contato - [' + vDadosIni.IfThen(vDadosIni.vHwCloudIA.vUsarServMensageria = 'S', 'CLI294', 'CLI260') + ']';
  bt_contatos_pla_edit.Hint := 'Alterar contato - [' + vDadosIni.IfThen(vDadosIni.vHwCloudIA.vUsarServMensageria = 'S', 'CLI295', 'CLI254') + ']';
  bt_contatos_pla_del.Hint  := 'Excluir contato - [' + vDadosIni.IfThen(vDadosIni.vHwCloudIA.vUsarServMensageria = 'S', 'CLI296', 'CLI256') + ']';

  bt_contatos_pla_add.Visible := (vDadosIni.vHwCloudIA.vUsarServMensageria = 'S') or (Origem = cContrato);
  bt_contatos_pla_edit.Visible := (vDadosIni.vHwCloudIA.vUsarServMensageria = 'S') or (Origem = cContrato);
  bt_contatos_pla_del.Visible := (vDadosIni.vHwCloudIA.vUsarServMensageria = 'S') or (Origem = cContrato);

  if Origem = cContrato then
    bt_contatos_pla_outros_add.Visible := False
  else if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
  	bt_contatos_pla_outros_add.Visible := (vDadosIni.vHwCloudIA.vSomenteContatosAceitos <> 'S') or (UnicoMens)
  else
  	bt_contatos_pla_outros_add.Visible := True;

  if Origem = cContrato then
  	bt_contatos_pla_outros_del.Visible := False
  else if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
  	bt_contatos_pla_outros_del.Visible := (vDadosIni.vHwCloudIA.vSomenteContatosAceitos <> 'S') or (UnicoMens)
  else
  	bt_contatos_pla_outros_del.Visible := True;

	if (UnicoMens) then
  	CheckListBoxAplicativo.Visible := False
  else if vDadosIni.vHwCloudIA.vUsarServMensageria <> 'S' then
  	CheckListBoxAplicativo.Visible := True
  else
		CheckListBoxAplicativo.Visible := (CodCliente <= 0) and (not UnicoMens);
  CheckListBoxContato.Visible := not CheckListBoxAplicativo.Visible;
  pnContato.Visible := not CheckListBoxAplicativo.Visible;

  if CheckListBoxAplicativo.Visible then
  begin
    GroupBoxContato.Caption := 'Formas de Envio';
    CheckListBoxContato.Align := alNone;
    CheckListBoxAplicativo.Align := alClient;

    CheckListBoxContato.Items.Clear;
    vDadosIni.retornaCheckListAplicativo(CheckListBoxAplicativo);

  	_LerConfiguracoesRegistro;
  end
  else
  begin
    GroupBoxContato.Caption := 'Contato';

    CheckListBoxAplicativo.Align := alNone;
    CheckListBoxContato.Align := alClient;

    CheckListBoxAplicativo.Items.Clear;
    vDadosIni.retornaCheckListContato(CodCliente, Origem, CheckListBoxContato);
  end;

  bt_contatos_pla_add.Enabled := (CodCliente > 0) and ((vDadosIni.vHwCloudIA.vUsarServMensageria = 'S') or (Origem = cContrato));
  bt_contatos_pla_edit.Enabled := (CodCliente > 0) and ((vDadosIni.vHwCloudIA.vUsarServMensageria = 'S') or (Origem = cContrato));
  bt_contatos_pla_del.Enabled := (CodCliente > 0) and ((vDadosIni.vHwCloudIA.vUsarServMensageria = 'S') or (Origem = cContrato));

  bt_contatos_pla_outros_add.Enabled := CheckListBoxContato.Visible;
  bt_contatos_pla_outros_del.Enabled := CheckListBoxContato.Visible;
end;

procedure TFrameCheckListaContato._GravaConfiguracoesRegistro;
var
	I: Integer;
begin
	if (CheckListBoxAplicativo.Enabled) and (CheckListBoxAplicativo.Visible) then
    for I := 0 to CheckListBoxAplicativo.Items.Count - 1 do
      vDadosIni._GravaConfiguracoesBoolean(
        CheckListBoxAplicativo.Name + CheckListBoxAplicativo.Items[I],
        CheckListBoxAplicativo.Checked[I]);
end;

procedure TFrameCheckListaContato._LerConfiguracoesRegistro;
var
	I: Integer;
begin
	if (CheckListBoxAplicativo.Enabled) and (CheckListBoxAplicativo.Visible) then
  begin
    if CheckListBoxAplicativo.Items.Count = 1 then
      CheckListBoxAplicativo.Checked[0] := True
    else
    begin
      for I := 0 to CheckListBoxAplicativo.Items.Count - 1 do
        CheckListBoxAplicativo.Checked[I] :=
          vDadosIni._LerConfiguracoesRegistroBoolean(CheckListBoxAplicativo.Name + CheckListBoxAplicativo.Items[I]);
    end;
  end;
end;

procedure TFrameCheckListaContato.btSelectAllContatoClick(Sender: TObject);
begin
	vDadosIni.selAllContatoCliente(
    CodCliente,
    Origem,
    CheckListBoxContato
  );  
end;

procedure TFrameCheckListaContato.btUnSelectAllContatoClick(Sender: TObject);
begin
  vDadosIni.unselAllContatoCliente(
    CodCliente,
    Origem,
    CheckListBoxContato
  );
end;

procedure TFrameCheckListaContato.bt_contatos_pla_addClick(Sender: TObject);
begin
  vDadosIni.addContatoCliente(
  	CodCliente,
    Origem,
    CheckListBoxContato
  );
end;

procedure TFrameCheckListaContato.bt_contatos_pla_delClick(Sender: TObject);
begin
  vDadosIni.delContatoCliente(
  	CodCliente,
    Origem,
    CheckListBoxContato
  );
end;

procedure TFrameCheckListaContato.bt_contatos_pla_editClick(Sender: TObject);
begin
  vDadosIni.editContatoCliente(
  	CodCliente,
    Origem,
    CheckListBoxContato
  );
end;

procedure TFrameCheckListaContato.bt_contatos_pla_outros_addClick(
  Sender: TObject);
begin
	vDadosIni.addOutrosContatoCliente(
  	CodCliente,
    Origem,
    CheckListBoxContato
  );
end;

procedure TFrameCheckListaContato.bt_contatos_pla_outros_delClick(
  Sender: TObject);
begin
	vDadosIni.delOutrosContatoCliente(
  	CodCliente,
    Origem,
    CheckListBoxContato
  );
end;

procedure TFrameCheckListaContato.CheckListBoxContatoClick(Sender: TObject);
begin
	vDadosIni.selUnselContatoCliente(
    CodCliente,
    Origem,
    CheckListBoxContato
  );
end;

end.
