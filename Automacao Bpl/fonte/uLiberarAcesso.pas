unit uLiberarAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, UClassesProcesso,
  ComCtrls;

type
  TfrmLiberarAcesso = class(TfrmPadrao)
    pn_individua: TPanel;
    Panel1: TPanel;
    Label83: TLabel;
    BitBtn6: TBitBtn;
    BitBtn99: TBitBtn;
    BitBtn1: TBitBtn;
    Panel11: TPanel;
    pn_lote: TPanel;
    pn_individual_titulo: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    pn_lote_titulo: TPanel;
    tv_lote: TTreeView;
    procedure tv_loteCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure tv_loteDblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn99Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    procedure liberacoes_config_tela(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmLiberarAcesso: TfrmLiberarAcesso;
  obLiberarAcesso: TLiberarAcesso;

implementation

uses UDtmConfig, uDtmAtivo, uDataSet_OOP, DB, hw_lote_liberacao_class, Math, StrUtils;

{$R *.dfm}

procedure TfrmLiberarAcesso.BitBtn1Click(Sender: TObject);
begin
  obLiberarAcesso.liberarAcesso;
end;

procedure TfrmLiberarAcesso.BitBtn4Click(Sender: TObject);
var
  Aid_l, Aid_p, Aid_s: Integer;
  Aaction: TActionTipoLib;
begin
  tv_loteDblClick(tv_lote);
//  if tv_lote.Selected.Level = 2 then
//  begin
//    Aid_s := tv_lote.Selected.Index;
//    Aid_s := tv_lote.Selected.Index;
//  end;
//
//
//
//  obLiberarAcesso.liberarAcesso_lote([tl_processo], );
end;

procedure TfrmLiberarAcesso.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmLiberarAcesso.BitBtn99Click(Sender: TObject);
begin
  obLiberarAcesso.abrirLiberacaoProcesso;
end;

procedure TfrmLiberarAcesso.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not (Column.Field.Dataset.FieldbyName('USUARIO_GERENTE').IsNull)) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := Panel11.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmLiberarAcesso.DBGrid1TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TfrmLiberarAcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	inherited;
  if (obLiberarAcesso <> nil) then
    obLiberarAcesso.Cancel;
  obLiberarAcesso.free;

  Action := caFree;
  if (frmLiberarAcesso <> nil) then
    frmLiberarAcesso := nil;
end;

procedure TfrmLiberarAcesso.FormCreate(Sender: TObject);
begin
	inherited;
  obLiberarAcesso := TLiberarAcesso.create;
  obLiberarAcesso.apagarLiberacoesAntigas;
  obLiberarAcesso.abrirLiberacaoProcesso;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmLiberarAcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
    BitBtn99Click(Sender);
end;

procedure TfrmLiberarAcesso.FormShow(Sender: TObject);
begin
	inherited;
  DBGrid1.DataSource := dtmConfig.dsLiberacaoProcesso;
  if not Assigned(obLiberarAcesso.onChangeLib) then
    obLiberarAcesso.onChangeLib := liberacoes_config_tela;
  liberacoes_config_tela(obLiberarAcesso);
end;

procedure TfrmLiberarAcesso.liberacoes_config_tela(Sender: TObject);
var
  AnodeLote, AnodeProc: TTreeNode;
  I, J, K, Acount_lib, Acount_pend: Integer;
begin
  with obLiberarAcesso do
  begin
    pn_lote.Align := alTop;
    pn_lote.Height := 233;

    pn_lote.Visible      := lote_lib.Count > 0;
    pn_individua.Visible := (not dataSet.IsEmpty) or (not pn_lote.Visible);


    pn_lote_titulo.Visible       := (pn_lote.Visible) and (pn_individua.Visible);
    pn_individual_titulo.Visible := (pn_lote.Visible) and (pn_individua.Visible);

    if not pn_individual_titulo.Visible then
      pn_lote.Align := alClient;

    if pn_individua.Visible and pn_lote.Visible then
    begin
      Splitter1.Align := alBottom;
      Splitter1.Align := alTop;
    end;

    tv_lote.Items.Clear;
    if not Assigned(lote_lib) then
    begin
      tv_lote.Items.AddChild(nil, 'Sem processos para validar');
      Exit;
    end;

    for I := 0 to Pred(lote_lib.Count) do with lote_lib.Items[I] do
    begin
      Acount_lib := 0;
      Acount_pend := 0;
      for J := 0 to Pred(processos.Count) do with processos.Items[J] do
        for K := 0 to Pred(solit.Count) do with solit.Items[K] do
        begin
          Acount_lib := Acount_lib + IfThen(usuario_gerente <> '', 1);
          Acount_pend := Acount_pend + IfThen(usuario_gerente = '', 1);
        end;
      AnodeLote := tv_lote.Items.AddChild(nil, Format('Lote %d - Liberados %d - Pendentes - %d', [lote, Acount_lib, Acount_pend]));

      for J := 0 to Pred(processos.Count) do with processos.Items[J] do
      begin
        AnodeProc := tv_lote.Items.AddChild(AnodeLote, Format('%s - %s - Nivel: %d', [processo.cod_processo, processo.nome_processo, processo.nivel_processo]));
        for K := 0 to Pred(solit.Count) do with solit.Items[K] do
          tv_lote.Items.AddChild(AnodeProc, Format('%s - Usuario: %s - %s - Mensagem: %s - ID: %d', [IfThen(usuario_gerente = '', 'Pendente', 'Liberado'),
                                                   usuario_solicitante, FormatDateTime('dd/mm/yyyy hh:mm', data_solicitacao), mensagem, cod_solicitacao]));
      end;
    end;
    tv_lote.FullExpand;
  end;
end;

procedure TfrmLiberarAcesso.tv_loteCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Node.Level = 0 then
  begin
    Sender.Canvas.Font.Style := [FSBOLD];
    if not (Pos('Pendentes - 0', Node.Text) > 0) then
      Sender.Canvas.Font.Color := clRed;
  end
  else if Node.Level = 2 then
    Sender.Canvas.Font.Size := 8;

  if cdsFocused in State then
    Sender.Canvas.Font.Color := clWhite;
end;

procedure TfrmLiberarAcesso.tv_loteDblClick(Sender: TObject);
var
  Aid_l, Aid_p, Aid_s, Aidx: Integer;
  Aaction: TActionTipoLib;
begin
  try
    Aidx := tv_lote.Selected.AbsoluteIndex;
    case tv_lote.Selected.Level of
      2:
      begin
        Aaction := tl_solit;
        Aid_s   := tv_lote.Selected.Index;
        Aid_p   := tv_lote.Selected.Parent.Index;
        Aid_l   := tv_lote.Selected.Parent.Parent.Index;
      end;
      1:
      begin
        Aaction := tl_processo;
        Aid_s   := -1;
        Aid_p   := tv_lote.Selected.Index;
        Aid_l   := tv_lote.Selected.Parent.Index;
      end;
      0:
      begin
        Aaction := tl_lote;
        Aid_s   := -1;
        Aid_p   := -1;
        Aid_l   := tv_lote.Selected.Index;
      end
      else
      begin
        ShowMessage('Selecione o item que deseja liberar');
        Exit;
      end;
    end;

    obLiberarAcesso.liberarAcesso_lote(Aaction, Aid_l, Aid_p, Aid_s);
  finally
    obLiberarAcesso.abrirLiberacaoProcesso;
    if Aidx <= Pred(tv_lote.Items.Count) then
      tv_lote.Items[Aidx].Selected := True;
  end;
end;

end.
