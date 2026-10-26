unit uPesqPros_lote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, Buttons, ExtCtrls, Contnrs,
  hw_auditoria_class,
  tabela_processos_class,
  hw_lote_liberacao_class;

type
  TLote_liberacao_class = class(TObject)
  private
    Fcod_processo: string;
    Faudit       : THw_auditoria_classList;
    Fprocesso    :  TTabela_processos_class;
  public
    constructor Create;
    destructor Destroy; override;

    property cod_processo: string                   read Fcod_processo write Fcod_processo;
    property audit       : THw_auditoria_classList  read Faudit        write Faudit;
    property processo    :  TTabela_processos_class read Fprocesso     write Fprocesso;
  end;

  TLote_liberacao_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TLote_liberacao_class;
    procedure SetItem(Index: Integer; const Value: TLote_liberacao_class);
  public
    function New: TLote_liberacao_class;
    procedure popular(Aaudits: THw_auditoria_classList; Aprocessos: TTabela_processos_classList);

    property Items[Index: Integer]: TLote_liberacao_class read GetItem write SetItem;
  end;

  TLote_liberacoes = class(THw_lote_processos_classList)
  public
    procedure popular(Aaudits: THw_auditoria_classList; Aprocessos: TTabela_processos_classList);
  end;

  TfrmPesqPros_lote = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    lb_lote: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tv_lote: TTreeView;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ed_user: TMaskEdit;
    ed_pass: TMaskEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FloteLib: THw_lote_processos_classList;//TLote_liberacao_classList;
    Fmodal_origem: string;

    procedure treeview_popular;
  public
    property loteLib      : THw_lote_processos_classList read FloteLib      write FloteLib;
    property modal_origem: string                        read Fmodal_origem write Fmodal_origem;
  end;

var
  frmPesqPros_lote: TfrmPesqPros_lote;

implementation

uses
  StrUtils;

{$R *.dfm}

procedure TfrmPesqPros_lote.BitBtn1Click(Sender: TObject);
begin
  modal_origem := 'OK';
end;

procedure TfrmPesqPros_lote.BitBtn3Click(Sender: TObject);
begin
  modal_origem := 'LIB';
end;

procedure TfrmPesqPros_lote.FormCreate(Sender: TObject);
begin
  inherited;
  modal_origem := '';

  if not Assigned(FloteLib) then
    FloteLib := THw_lote_processos_classList.Create;//TLote_liberacao_classList.Create;
end;

procedure TfrmPesqPros_lote.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FloteLib) then
    FreeAndNil(FloteLib);
end;

procedure TfrmPesqPros_lote.FormShow(Sender: TObject);
begin
  inherited;

  treeview_popular();

  if ed_user.CanFocus then
    ed_user.SetFocus;
end;

procedure TfrmPesqPros_lote.treeview_popular;
var
  Anode: TTreeNode;
  I, J: Integer;
begin
  tv_lote.Items.Clear;
  if not Assigned(FloteLib) then
  begin
    tv_lote.Items.AddChild(nil, 'Sem processos para validar');
    Exit;
  end;

  for I := 0 to Pred(FloteLib.Count) do with FloteLib.Items[I] do
  begin
    Anode := tv_lote.Items.AddChild(nil, Format('%s - %s', [processo.cod_processo, processo.nome_processo]));
    tv_lote.Items.AddChild(Anode, Format('Nivel requerido: %d', [processo.nivel_processo]));
    //tv_lote.Items.AddChild(Anode, Format('Requer senha: %s: ', [IfThen(processo.senha_gerente = 'S', 'Sim', 'Nao')]);
    for J := 0 to Pred(audit.Count) do with audit.Items[J] do
      tv_lote.Items.AddChild(Anode, Format('%s: %s - %s - %s', [acao, mensagem, tabela, codigo]));
  end;
end;

{ TLote_liberacao_class }

constructor TLote_liberacao_class.Create;
begin
  Faudit    := THw_auditoria_classList.Create;
end;

destructor TLote_liberacao_class.Destroy;
begin
  if Assigned(Faudit) then
    FreeAndNil(Faudit);
  if Assigned(Fprocesso) then
    FreeAndNil(Fprocesso);
  inherited;
end;

{ TLote_liberacao_classList }

function TLote_liberacao_classList.GetItem(Index: Integer): TLote_liberacao_class;
begin
  Result := TLote_liberacao_class(inherited Items[Index]);
end;

function TLote_liberacao_classList.New: TLote_liberacao_class;
begin
  Result := TLote_liberacao_class.Create;
  Add(Result);
end;

procedure TLote_liberacao_classList.popular(Aaudits: THw_auditoria_classList;
  Aprocessos: TTabela_processos_classList);
var
  Aitem: TLote_liberacao_class;
  Aproceed: Boolean;
  I, J: Integer;
begin
  Self.Clear;
  for I := 0 to Pred(Aaudits.Count) do
  begin
    Aproceed := True;
    for J := 0 to Pred(Self.Count) do
      if Self.Items[J].cod_processo = Aaudits.Items[I].cod_processo then
      begin
        Aproceed := False;
        Self.Items[J].audit.Add(Aaudits.Items[I].Clone);
        Break;
      end;

    if Aproceed then
    begin
      Aitem := Self.New;
      Aitem.cod_processo := Aaudits.Items[I].cod_processo;
      Aitem.audit.Add(Aaudits.Items[I].Clone);

      for J := 0 to Pred(Aprocessos.Count) do
        if Aprocessos.Items[J].cod_processo = Aitem.cod_processo then
        begin
          Aitem.processo := Aprocessos.Items[J].Clone;
          Break;
        end;

      if not Assigned(Aitem.processo) then
      begin
        Aitem.processo := TTabela_processos_class.Create;
        Aitem.processo.cod_processo  := Aitem.cod_processo;
        Aitem.processo.nome_processo := 'PROCESSO NÃO ENCONTRADO NO CADASTRO';
      end;
    end;
  end;

end;

procedure TLote_liberacao_classList.SetItem(Index: Integer; const Value: TLote_liberacao_class);
begin
  Put(Index, Value);
end;

{ TLote_liberacoes }

procedure TLote_liberacoes.popular(Aaudits: THw_auditoria_classList;
  Aprocessos: TTabela_processos_classList);
var
  Aitem: THw_lote_processos_class;
  Aproceed: Boolean;
  I, J: Integer;
begin
  Self.Clear;
  for I := 0 to Pred(Aaudits.Count) do
  begin
    Aproceed := True;
    for J := 0 to Pred(Self.Count) do
      if Self.Items[J].cod_processo = Aaudits.Items[I].cod_processo then
      begin
        Aproceed := False;
        Self.Items[J].audit.Add(Aaudits.Items[I].Clone);
        Break;
      end;

    if Aproceed then
    begin
      Aitem := Self.New;
      Aitem.cod_processo := Aaudits.Items[I].cod_processo;
      Aitem.audit.Add(Aaudits.Items[I].Clone);

      for J := 0 to Pred(Aprocessos.Count) do
        if Aprocessos.Items[J].cod_processo = Aitem.cod_processo then
        begin
          Aitem.processo := Aprocessos.Items[J].Clone;
          Break;
        end;

      if not Assigned(Aitem.processo) then
      begin
        Aitem.processo := TTabela_processos_class.Create;
        Aitem.processo.cod_processo  := Aitem.cod_processo;
        Aitem.processo.nome_processo := 'PROCESSO NÃO ENCONTRADO NO CADASTRO';
      end;
    end;
  end;
end;

end.
