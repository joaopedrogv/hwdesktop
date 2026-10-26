unit uMenuFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uEditHw;

type
  TfrmMenuFiscal = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Timer1: TTimer;
    Button10: TButton;
    Button14: TButton;
    EditFiscal2: TEditFiscal;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    procedure Button20Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
  private
    { Private declarations }
    procedure Clique(tag: integer);
  public
    { Public declarations }
  end;

var
  frmMenuFiscal: TfrmMenuFiscal;

implementation

uses
  uPrincipalF, uComandosPDV, UAnexoV, UAnexoIVEst, UAnexoVI, uRelPeriodo,
    uDadosIniFiscal;

{$R *.dfm}

procedure TfrmMenuFiscal.Button10Click(Sender: TObject);
begin
  vDadosIniF.tabIndiceTecnicoProducao;
end;

procedure TfrmMenuFiscal.Button11Click(Sender: TObject);
begin
  vDadosIniF.identificacaoDoPafECFMenuFiscal;
end;

procedure TfrmMenuFiscal.Button12Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMenuFiscal.Button13Click(Sender: TObject);
begin
//  vDadosIniF.estoque;
end;

procedure TfrmMenuFiscal.Button14Click(Sender: TObject);
begin
  vDadosIniF.vendasDoPeriodo;
end;

procedure TfrmMenuFiscal.Button15Click(Sender: TObject);
begin
  vDadosIniF.parametrosDeCOnfiguracao;
end;

procedure TfrmMenuFiscal.Button16Click(Sender: TObject);
begin
//  vDadosIniF.contasCLientesAbertas;
end;

procedure TfrmMenuFiscal.Button17Click(Sender: TObject);
begin
//  vDadosIniF.conferenciaContaCliente(0,0);
end;

procedure TfrmMenuFiscal.Button18Click(Sender: TObject);
begin
  vDadosIniF.lmf;
end;

procedure TfrmMenuFiscal.Button19Click(Sender: TObject);
begin
  vDadosIniF.arquivoMf;
end;

procedure TfrmMenuFiscal.Button1Click(Sender: TObject);
begin
  vDadosIniF.leituraX;
end;

procedure TfrmMenuFiscal.Button20Click(Sender: TObject);
begin
  vDadosIniF.registrosDoPAFECF;
end;

procedure TfrmMenuFiscal.Button2Click(Sender: TObject);
begin
//  vDadosIniF.lmfc;
end;

procedure TfrmMenuFiscal.Button3Click(Sender: TObject);
begin
//  vDadosIniF.lmfs;
end;

procedure TfrmMenuFiscal.Button4Click(Sender: TObject);
begin
//  vDadosIniF.espelhoMfdMF;
end;

procedure TfrmMenuFiscal.Button5Click(Sender: TObject);
begin
  vDadosIniF.arquivoMfd;
end;

procedure TfrmMenuFiscal.Button6Click(Sender: TObject);
begin
//  vDadosIniF.TabProd;
end;

procedure TfrmMenuFiscal.Button7Click(Sender: TObject);
begin
//  vDadosIniF.movimentoPorEcf;
end;

procedure TfrmMenuFiscal.Button8Click(Sender: TObject);
begin
  inherited;
//  vDadosIniF.meiosDePgto;
end;

procedure TfrmMenuFiscal.Button9Click(Sender: TObject);
begin
//  vDadosIniF.davsEmitidos;
end;

procedure TfrmMenuFiscal.Clique(tag: integer);
var
	I: Integer;
	vComandoNaoEncontrado: Boolean;
begin
  vComandoNaoEncontrado := True;
	for I := 0 to Self.ComponentCount - 1 do
	begin
    if Self.Components[i] is TButton then
    begin
      if TButton(Self.Components[i]).Tag = tag then
      begin
				if TButton(Self.Components[i]).Enabled then
				begin
				  vComandoNaoEncontrado := False;
					TButton(Self.Components[i]).Click;
				end;
        Break;
      end;
    end;
	end;
	if vComandoNaoEncontrado then
		Application.MessageBox('Comando não encontrado', 'Atenção', 0 + 64);
end;

procedure TfrmMenuFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
  end
  else if key = VK_RETURN then
  begin
    if ActiveControl = EditFiscal2 then
      try
        StrToInt(EditFiscal2.Text);
				Clique(StrToInt(EditFiscal2.Text));
				EditFiscal2.SelectAll;
      except
        Application.MessageBox('Valor informado inválido', 'Informe a opção', MB_OK +
          MB_ICONEXCLAMATION);
      end;
  end;
    EditFiscal2.SetFocus;
end;

procedure TfrmMenuFiscal.FormShow(Sender: TObject);
begin
  if EditFiscal2.CanFocus then
    EditFiscal2.SetFocus;
end;

end.

