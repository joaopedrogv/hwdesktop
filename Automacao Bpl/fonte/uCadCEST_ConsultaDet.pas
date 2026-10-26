unit uCadCEST_ConsultaDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Grids, DBGrids, Mask, Buttons, ExtCtrls, DBClient,
  DBCtrls, uEditHw;

type
  THackMaskEdit = class(TMaskEdit);
  TfrmCadCEST_ConsultaDet = class(TfrmPadrao)
    pn_consulta_det: TPanel;
    pn_consulta_det_top: TPanel;
    bt_tipo_consulta: TSpeedButton;
    ed_consulta: TMaskEdit;
    pn_consulta_det_client: TPanel;
    grid_cest: TDBGrid;
    pn_consulta_det_right: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Splitter1: TSplitter;
    grid_mva: TStringGrid;
    grid_mvaaj: TStringGrid;
    lb_info_ncm: TLabel;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    bt_selecionar_cest: TBitBtn;
    procedure bt_selecionar_cestClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ed_consultaExit(Sender: TObject);
    procedure ed_consultaEnter(Sender: TObject);
    procedure ed_consultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_cestDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grid_mvaajDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure grid_mvaDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_consultaChange(Sender: TObject);
    procedure bt_tipo_consultaClick(Sender: TObject);
  private
    { Private declarations }
    Fmvas: TClientDataSet;
    FCestSelecionado: string;
    FModoSelecaoCEST: Boolean;
    FNcmModoSelecao: string;
    procedure cest_scroll(Sender: TObject);

    procedure Inicializar;
  public
    { Public declarations }
    property CestSelecionado: string  read FCestSelecionado;
    property ModoSelecaoCEST: Boolean read FModoSelecaoCEST write FModoSelecaoCEST;
    property NcmModoSelecao : string  read FNcmModoSelecao  write FNcmModoSelecao;
  end;

var
  frmCadCEST_ConsultaDet: TfrmCadCEST_ConsultaDet;

implementation

uses
  uDtmAtivo,
  uClassesCEST,
  DB,
  CestMvaVariante_Model,
  StrUtils,
  Math,
  hw_utils, uDataSet_OOP;

{$R *.dfm}

{ TfrmCadCEST_ConsultaDet }

procedure TfrmCadCEST_ConsultaDet.cest_scroll(Sender: TObject);
var
  Row, Col: Integer;
  MVAs: TCestMvaVariantes_Model;
begin
  if Sender is TCestMvaVariantes_Model then
  begin
    MVAs := TCestMvaVariantes_Model(Sender);

    for Row := 0 to grid_mva.RowCount - 1 do
      for Col := 0 to grid_mva.RowCount - 1 do
        grid_mva.Cells[Col, Row] := '';

    for Row := 1 to grid_mvaaj.RowCount - 1 do
      for Col := 0 to grid_mvaaj.RowCount - 1 do
        grid_mvaaj.Cells[Col, Row] := '';

    grid_mva.RowCount    := MVAs.Count;
//    grid_mvaaj.FixedRows := IfThen(MVAs.Count > 1, 1);
    grid_mvaaj.RowCount  := MVAs.Count + 1;

    for Row := 0 to MVAs.Count - 1 do
    begin
      grid_mva.Cells[0, Row] := Format('%n ', [MVAs.Items[Row].mva]);
      grid_mva.Cells[1, Row] := MVAs.Items[Row].variante;

      grid_mvaaj.Cells[0, Row + 1] := Format('%n ', [MVAs.Items[Row].mva]);
      grid_mvaaj.Cells[1, Row + 1] := Format('%n ', [MVAs.Items[Row].mva_12_18]);
      grid_mvaaj.Cells[2, Row + 1] := Format('%n ', [MVAs.Items[Row].mva_7_17]);
      grid_mvaaj.Cells[3, Row + 1] := Format('%n ', [MVAs.Items[Row].mva_4_17]);
      grid_mvaaj.Cells[4, Row + 1] := Format('%n ', [MVAs.Items[Row].mva_4_18]);
    end;
  end;
end;

procedure TfrmCadCEST_ConsultaDet.ed_consultaChange(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    Consulta.Filtrar(ed_consulta.Text);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadCEST_ConsultaDet.ed_consultaEnter(Sender: TObject);
begin
  inherited;
  vDadosIni.enterTela.Enabled := False;
end;

procedure TfrmCadCEST_ConsultaDet.ed_consultaExit(Sender: TObject);
begin
  inherited;
  vDadosIni.enterTela.Enabled := True;
end;

procedure TfrmCadCEST_ConsultaDet.ed_consultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    Screen.Cursor := crHourGlass;
    try
        if (Trim(ed_consulta.Text) <> '') and (Consulta.TipoFiltro = 'NCM') then
          Consulta.Iniciar(ed_consulta.Text);

        if (Self.Enabled) and (Self.Visible) and (ed_consulta.CanFocus) then
          ed_consulta.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadCEST_ConsultaDet.FormCreate(Sender: TObject);
begin
  inherited;
  Consulta := TCest_Consulta.Create;
  FModoSelecaoCEST := False;  
end;

procedure TfrmCadCEST_ConsultaDet.FormDestroy(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesString(ed_consulta.Name, ed_consulta.Name + '_' + ed_consulta.Text);
  FreeAndNil(Consulta);
end;

procedure TfrmCadCEST_ConsultaDet.FormShow(Sender: TObject);
begin
  inherited;
  Inicializar;
end;

procedure TfrmCadCEST_ConsultaDet.grid_cestDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  Cor: array[1..3] of Integer = ($00A6CAF0, $00B3D3D8, clMoneyGreen);
var
  R: TRect;

begin
  if IndexText(Column.FieldName, ['NCM', 'CEST', 'AMBITO']) >= 0 then
  begin
    TDBGrid(sender).Canvas.Brush.Color :=  Cor[IndexText(Column.FieldName, ['NCM', 'CEST', 'AMBITO']) + 1];// clSkyBlue $00A6CAF0;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCadCEST_ConsultaDet.grid_mvaDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Str: string;
  Format: Integer;
begin
  if ACol = 0 then
  begin
    Str := TStringGrid(Sender).Cells[ACol, ARow];
    TStringGrid(Sender).Canvas.FillRect(Rect);
    DrawText(TStringGrid(Sender).Canvas.Handle, PChar(Str), -1, Rect, DT_RIGHT);
  end;
end;

procedure TfrmCadCEST_ConsultaDet.grid_mvaajDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Str: string;
  Format: Integer;
begin
  if ARow >= 0 then
  begin
    Str := TStringGrid(Sender).Cells[ACol, ARow];
    TStringGrid(Sender).Canvas.FillRect(Rect);
    if ARow > 0 then
      DrawText(TStringGrid(Sender).Canvas.Handle, PChar(Str), -1, Rect, DT_RIGHT)
    else
      DrawText(TStringGrid(Sender).Canvas.Handle, PChar(Str), -1, Rect, DT_CENTER);
  end;
end;

procedure TfrmCadCEST_ConsultaDet.Inicializar;
begin
  grid_mva.RowCount := 1;
  grid_mva.ColCount := 2;
  grid_mvaaj.RowCount := 2;
  grid_mvaaj.ColCount := 5;

  grid_mvaaj.Cells[0, 0] := '  MVA ';
  grid_mvaaj.Cells[1, 0] := '12->18';
  grid_mvaaj.Cells[2, 0] := ' 7->17';
  grid_mvaaj.Cells[3, 0] := ' 4->18';
  grid_mvaaj.Cells[4, 0] := ' 4->17';

  Consulta.OnChangeMVA := cest_scroll;

  if FModoSelecaoCEST then
  begin
    Consulta.TipoFiltro        := 'NCM';
    bt_tipo_consulta.Caption   := Consulta.TipoFiltro;
    lb_info_ncm.Visible        := Consulta.TipoFiltro = 'NCM';
    ed_consulta.Text           := FNcmModoSelecao;
  end
  else
  begin
    Consulta.TipoFiltro      := _LerConfiguracoesRegistroString(bt_tipo_consulta.Name, 'CEST');
    bt_tipo_consulta.Caption := Consulta.TipoFiltro;
    lb_info_ncm.Visible      := Consulta.TipoFiltro = 'NCM';
  end;
  bt_selecionar_cest.Visible := FModoSelecaoCEST;

  Consulta.Iniciar( IfThen(Consulta.TipoFiltro = 'NCM', ed_consulta.Text) );

  DBMemo1.DataSource   := Consulta._dataSourceOOP;
  DBMemo2.DataSource   := Consulta._dataSourceOOP;
  DBMemo3.DataSource   := Consulta._dataSourceOOP;
  DBEdit1.DataSource   := Consulta._dataSourceOOP;
  grid_cest.DataSource := Consulta._dataSourceOOP;
end;

procedure TfrmCadCEST_ConsultaDet.bt_selecionar_cestClick(Sender: TObject);
begin
  inherited;
  if Consulta.dataSet.IsEmpty then
  begin
    ShowAtencao('Nenhum registro selecionado');
    Exit;
  end;

  FCestSelecionado := Consulta.fstr('cest');
  ModalResult := IDOK;
end;

procedure TfrmCadCEST_ConsultaDet.bt_tipo_consultaClick(Sender: TObject);
begin
  inherited;

  _GravaConfiguracoesString(ed_consulta.Name + '_' + ed_consulta.Text, ed_consulta.Text);

  // cest -> descricao -> ncm -> cest
  if bt_tipo_consulta.Caption = 'CEST' then
    bt_tipo_consulta.Caption := 'Descrição'
  else if bt_tipo_consulta.Caption = 'Descrição' then
    bt_tipo_consulta.Caption := 'NCM'
  else
    bt_tipo_consulta.Caption := 'CEST';

  Consulta.TipoFiltro := bt_tipo_consulta.Caption;
  lb_info_ncm.Visible := Consulta.TipoFiltro = 'NCM';
  ed_consulta.Text    := _LerConfiguracoesRegistroString(ed_consulta.Name + '_' + ed_consulta.Text);

  if Consulta.TipoFiltro = 'CEST' then // sempre que chega no cest abre todos novamente
    Consulta.Iniciar('');
  Consulta.Filtrar(ed_consulta.Text);

  _GravaConfiguracoesString(bt_tipo_consulta.Name, bt_tipo_consulta.Caption);
end;

end.
