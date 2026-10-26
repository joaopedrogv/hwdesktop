unit uOpcoesPesquisaNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TfrmOpcoesPesquisaNFe = class(TfrmPadrao)
    p: TPanel;
    Panel1: TPanel;
    ckSemStatus: TCheckBox;
    ckEnviando: TCheckBox;
    ckEmProcessamento: TCheckBox;
    ckDuplicidade: TCheckBox;
    ckAutorizada: TCheckBox;
    ckDenegada: TCheckBox;
    ckCancelada: TCheckBox;
    ckInutilizada: TCheckBox;
    ckRejeitada: TCheckBox;
    ckAInutilizar: TCheckBox;
    ckEmEPEC: TCheckBox;
    btSituacoes: TBitBtn;
    Panel2: TPanel;
    btPendenenciasDias: TBitBtn;
    btPendenenciasQtde: TBitBtn;
    procedure btPendenenciasQtdeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btPendenenciasDiasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fsituacoes: string;
    //Fqtdedias: Integer;
    FpendentesDias: Boolean;
    FpendentesQtde: Boolean;
    { Private declarations }
  public
    { Public declarations }
    property pendentesDias: Boolean read FpendentesDias write FpendentesDias;
    property pendentesQtde: Boolean read FpendentesQtde write FpendentesQtde;
    property situacoes: string read Fsituacoes write Fsituacoes;
    //property qtdedias : Integer read Fqtdedias write Fqtdedias;
  end;

var
  frmOpcoesPesquisaNFe: TfrmOpcoesPesquisaNFe;

implementation

{$R *.dfm}

procedure TfrmOpcoesPesquisaNFe.btPendenenciasQtdeClick(Sender: TObject);
begin
  inherited;
  FpendentesQtde := True;
end;

procedure TfrmOpcoesPesquisaNFe.btPendenenciasDiasClick(Sender: TObject);
begin
  inherited;
  FpendentesDias := True;
end;

procedure TfrmOpcoesPesquisaNFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _GravaConfiguracoesBoolean(ckSemStatus.Name      , ckSemStatus.Checked);
  _GravaConfiguracoesBoolean(ckEnviando.Name       , ckEnviando.Checked);
  _GravaConfiguracoesBoolean(ckEmProcessamento.Name, ckEmProcessamento.Checked);
  _GravaConfiguracoesBoolean(ckDuplicidade.Name    , ckDuplicidade.Checked);
  _GravaConfiguracoesBoolean(ckAutorizada.Name     , ckAutorizada.Checked);
  _GravaConfiguracoesBoolean(ckDenegada.Name       , ckDenegada.Checked);
  _GravaConfiguracoesBoolean(ckCancelada.Name      , ckCancelada.Checked);
  _GravaConfiguracoesBoolean(ckInutilizada.Name    , ckInutilizada.Checked);
  _GravaConfiguracoesBoolean(ckRejeitada.Name      , ckRejeitada.Checked);
  _GravaConfiguracoesBoolean(ckAInutilizar.Name    , ckAInutilizar.Checked);
  _GravaConfiguracoesBoolean(ckEmEPEC.Name         , ckEmEPEC.Checked);
end;

procedure TfrmOpcoesPesquisaNFe.FormCreate(Sender: TObject);
begin
  inherited;
  FpendentesDias := False;
  FpendentesQtde := False;
end;

procedure TfrmOpcoesPesquisaNFe.FormShow(Sender: TObject);
begin
  inherited;
  ckSemStatus.Checked       := _LerConfiguracoesRegistroBoolean(ckSemStatus.Name      , ckSemStatus.Checked);
  ckEnviando.Checked        := _LerConfiguracoesRegistroBoolean(ckEnviando.Name       , ckEnviando.Checked);
  ckEmProcessamento.Checked := _LerConfiguracoesRegistroBoolean(ckEmProcessamento.Name, ckEmProcessamento.Checked);
  ckDuplicidade.Checked     := _LerConfiguracoesRegistroBoolean(ckDuplicidade.Name    , ckDuplicidade.Checked);
  ckAutorizada.Checked      := _LerConfiguracoesRegistroBoolean(ckAutorizada.Name     , ckAutorizada.Checked);
  ckDenegada.Checked        := _LerConfiguracoesRegistroBoolean(ckDenegada.Name       , ckDenegada.Checked);
  ckCancelada.Checked       := _LerConfiguracoesRegistroBoolean(ckCancelada.Name      , ckCancelada.Checked);
  ckInutilizada.Checked     := _LerConfiguracoesRegistroBoolean(ckInutilizada.Name    , ckInutilizada.Checked);
  ckRejeitada.Checked       := _LerConfiguracoesRegistroBoolean(ckRejeitada.Name      , ckRejeitada.Checked);
  ckAInutilizar.Checked     := _LerConfiguracoesRegistroBoolean(ckAInutilizar.Name    , ckAInutilizar.Checked);
  ckEmEPEC.Checked          := _LerConfiguracoesRegistroBoolean(ckEmEPEC.Name         , ckEmEPEC.Checked);
end;

end.
