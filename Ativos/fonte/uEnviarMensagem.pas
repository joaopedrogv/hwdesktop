unit uEnviarMensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrameCheckListaContato, StdCtrls, Buttons, ExtCtrls, CheckLst;

type
  TFrmEnviarMensagem = class(TForm)
    Panel168: TPanel;
    BitBtn197: TBitBtn;
    btNFeEmail2: TBitBtn;
    FrameCheckListaContato: TFrameCheckListaContato;
    GroupBoxOpcoes: TGroupBox;
    CheckListBoxOpcoes: TCheckListBox;
    procedure CheckListBoxOpcoesClick(Sender: TObject);
    procedure BitBtn197Click(Sender: TObject);
    procedure btNFeEmail2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FrameCheckListaContatobt_contatos_pla_addClick(Sender: TObject);
    procedure FrameCheckListaContatobtUnSelectAllContatoClick(Sender: TObject);
    procedure FrameCheckListaContatobtSelectAllContatoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    EnvUnicaMens, AnexarEventos, AnexarPdfs, AnexarBoletos: Boolean;
  end;

var
  FrmEnviarMensagem: TFrmEnviarMensagem;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TFrmEnviarMensagem.BitBtn197Click(Sender: TObject);
begin
	Self.ModalResult := mrCancel;
end;

procedure TFrmEnviarMensagem.btNFeEmail2Click(Sender: TObject);
var
	vSel: Boolean;
	I: Integer;
begin
  vSel := False;
  if FrameCheckListaContato.CheckListBoxAplicativo.Visible then
  begin
    for I := 0 to FrameCheckListaContato.CheckListBoxAplicativo.Items.Count - 1 do
      if FrameCheckListaContato.CheckListBoxAplicativo.Checked[I] then
      begin
        vSel := True;
        Break;
      end;
  end
  else if FrameCheckListaContato.CheckListBoxContato.Visible then
  begin
    for I := 0 to FrameCheckListaContato.CheckListBoxContato.Items.Count - 1 do
      if FrameCheckListaContato.CheckListBoxContato.Checked[I] then
      begin
        vSel := True;
        Break;
      end;
  end;

  if FrameCheckListaContato.CheckListBoxAplicativo.Visible then
  begin
  	if (not vSel) then
    begin
      Application.MessageBox(PChar('Forma de envio (' + vDadosIni.retornaNomesAplicativo(FrameCheckListaContato.CheckListBoxAplicativo) + ') não informada.'),
        'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (FrameCheckListaContato.CheckListBoxAplicativo.CanFocus) then
      	FrameCheckListaContato.CheckListBoxAplicativo.SetFocus;
      exit;
    end;
  end
  else if FrameCheckListaContato.CheckListBoxContato.Visible then
  begin
    if (not vSel) then
    begin
      Application.MessageBox('Contato não informado.',
        'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (FrameCheckListaContato.CheckListBoxContato.CanFocus) then
      	FrameCheckListaContato.CheckListBoxContato.SetFocus;
      exit;
    end;
  end;

  FrameCheckListaContato._GravaConfiguracoesRegistro;

  EnvUnicaMens := False;
  AnexarEventos := False;
  AnexarPdfs := False;
  AnexarBoletos := False;
  for I := 0 to CheckListBoxOpcoes.Items.Count - 1 do
    if CheckListBoxOpcoes.Checked[I] then
    begin
      if CheckListBoxOpcoes.Items[I] = 'Enviar única mensagem' then
      begin
        EnvUnicaMens  := True;
        vDadosIni._GravaConfiguracoesBoolean(CheckListBoxOpcoes.Name + CheckListBoxOpcoes.Items[I], CheckListBoxOpcoes.Checked[I]);
      end
      else if CheckListBoxOpcoes.Items[I] = 'Anexar Eventos' then
      begin
      	AnexarEventos := True;
        vDadosIni._GravaConfiguracoesBoolean(CheckListBoxOpcoes.Name + CheckListBoxOpcoes.Items[I], CheckListBoxOpcoes.Checked[I]);
      end
      else if CheckListBoxOpcoes.Items[I] = 'Anexar PDFs' then
      begin
        AnexarPdfs    := True;
        vDadosIni._GravaConfiguracoesBoolean(CheckListBoxOpcoes.Name + CheckListBoxOpcoes.Items[I], CheckListBoxOpcoes.Checked[I]);
      end
      else if CheckListBoxOpcoes.Items[I] = 'Anexar Boletos' then
      begin
        AnexarBoletos := True;
        vDadosIni._GravaConfiguracoesBoolean(CheckListBoxOpcoes.Name + CheckListBoxOpcoes.Items[I], CheckListBoxOpcoes.Checked[I]);
      end;
    end;

  Self.ModalResult := mrOK;
end;

procedure TFrmEnviarMensagem.CheckListBoxOpcoesClick(Sender: TObject);
var
	I: Integer;
begin
	for I := 0 to CheckListBoxOpcoes.Items.Count - 1 do
  	if CheckListBoxOpcoes.Items[I] = 'Enviar única mensagem' then
    begin
  		FrameCheckListaContato.UnicoMens := CheckListBoxOpcoes.Checked[I];
      Break;
    end;

	FrameCheckListaContato.carregarContatoAplicativo;
end;

procedure TFrmEnviarMensagem.FormShow(Sender: TObject);
var
	I: Integer;
begin
	if not Assigned(vDadosIni.vListaContatoTemp) then
    vDadosIni.vListaContatoTemp := TStringList.Create;
  vDadosIni.vListaContatoTemp.Clear;

  FrameCheckListaContato._LerConfiguracoesRegistro;

  for I := 0 to CheckListBoxOpcoes.Items.Count - 1 do
  begin
    if CheckListBoxOpcoes.Items[I] = 'Enviar única mensagem' then
      CheckListBoxOpcoes.Checked[I] := vDadosIni._LerConfiguracoesRegistroBoolean(CheckListBoxOpcoes.Name + CheckListBoxOpcoes.Items[I], False)
    else if CheckListBoxOpcoes.Items[I] = 'Anexar Eventos' then
      CheckListBoxOpcoes.Checked[I] := vDadosIni._LerConfiguracoesRegistroBoolean(CheckListBoxOpcoes.Name + CheckListBoxOpcoes.Items[I], True)
    else if CheckListBoxOpcoes.Items[I] = 'Anexar PDFs' then
      CheckListBoxOpcoes.Checked[I] := vDadosIni._LerConfiguracoesRegistroBoolean(CheckListBoxOpcoes.Name + CheckListBoxOpcoes.Items[I], True)
    else if CheckListBoxOpcoes.Items[I] = 'Anexar Boletos' then
      CheckListBoxOpcoes.Checked[I] := vDadosIni._LerConfiguracoesRegistroBoolean(CheckListBoxOpcoes.Name + CheckListBoxOpcoes.Items[I], True);
  end;

  FrameCheckListaContato.carregarContatoAplicativo;
end;

procedure TFrmEnviarMensagem.FrameCheckListaContatobtSelectAllContatoClick(
  Sender: TObject);
begin
  FrameCheckListaContato.btSelectAllContatoClick(Sender);

end;

procedure TFrmEnviarMensagem.FrameCheckListaContatobtUnSelectAllContatoClick(
  Sender: TObject);
begin
  FrameCheckListaContato.btUnSelectAllContatoClick(Sender);

end;

procedure TFrmEnviarMensagem.FrameCheckListaContatobt_contatos_pla_addClick(
  Sender: TObject);
begin
  FrameCheckListaContato.bt_contatos_pla_addClick(Sender);

end;

end.
