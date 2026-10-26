unit uCadRotasEntrega_Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Mask, ExtCtrls, uClassesRotasEntrega,
  DB, Buttons, DBClient;

type
  TDBGrid = class(DBGrids.TDBGrid)
  public
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  end;

  Tmove = (mvUp, mvDown, mvFirst, mvLast);

  TfrmCadRotasEntrega_Clientes = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edcod_rota: TMaskEdit;
    edrota: TMaskEdit;
    eddescricao: TMaskEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    grid_rotas: TDBGrid;
    Splitter1: TSplitter;
    Panel6: TPanel;
    dsrotas: TDataSource;
    dsclientes: TDataSource;
    BitBtn1: TBitBtn;
    Panel8: TPanel;
    Panel9: TPanel;
    grid_clientes: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    pn_filtro: TPanel;
    ed_filtro: TMaskEdit;
    SpeedButton7: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure grid_clientesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure ed_filtroChange(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ed_filtroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_rotasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid_rotasTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure grid_rotasDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure grid_rotasDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    Frotas_cl: TRotas_Clientes;
    procedure move(Amove: Tmove);
  public
    { Public declarations }
    property rotas_cl: TRotas_Clientes read Frotas_cl write Frotas_cl;
  end;

var
  frmCadRotasEntrega_Clientes: TfrmCadRotasEntrega_Clientes;

implementation

uses
  vw_clientes_dest_class, udtmativo;

{$R *.dfm}

{ TDBGrid }

procedure TDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  Coordenadas: TGridCoord;
begin
  if Button = mbLeft then
    if (Self.Name = 'grid_rotas') or (Self.Name = 'grid_clientes') then
    begin
      Coordenadas := TDBGrid(Self).MouseCoord(X, Y);
      if Coordenadas.Y > 0 then
        BeginDrag(True);
    end;
  inherited;
end;

procedure TfrmCadRotasEntrega_Clientes.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if Frotas_cl.SalvarRotas then
      ModalResult := IDOK;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadRotasEntrega_Clientes.ed_filtroChange(Sender: TObject);
begin
  inherited;
  grid_rotas.Repaint;
  grid_clientes.Repaint;
end;

procedure TfrmCadRotasEntrega_Clientes.ed_filtroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Ads: TClientDataSet;
  Arn, Apos, I: Integer;
begin
  inherited;
  if (Key = VK_F3) or (Key = VK_F4) then
  begin
    if (Key = VK_F3) then
      Ads := TClientDataSet(grid_rotas.DataSource.DataSet)
    else if (Key = VK_F4) then
      Ads := TClientDataSet(grid_clientes.DataSource.DataSet);

    if Ads.IsEmpty then
      Exit;

    Arn := Ads.RecNo;

    try
      Ads.DisableControls;
      if Ads.RecordCount = Ads.RecNo then
        Ads.First
      else
        Ads.Next;
      Apos := Ads.RecNo;

      while Arn <> Apos do
      begin

        for I := 0 to Pred(Ads.Fields.Count) do
          if Pos(ed_filtro.Text, Ads.Fields[I].AsString) > 0 then
            Exit;

        if Ads.Eof then
          Ads.First
        else
          Ads.Next;
        Apos := Ads.RecNo;              
      end;

    finally
      Ads.EnableControls;
      grid_rotas.Repaint;
      grid_clientes.Repaint;
    end;  
  end;
end;

procedure TfrmCadRotasEntrega_Clientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _GravaConfiguracoesBoolean('NomeFantasiaAtivo', grid_rotas.DataSource.DataSet.FieldByName('nome_cliente').Visible);

  Action := caFree;
  frmCadRotasEntrega_Clientes := nil;
end;

procedure TfrmCadRotasEntrega_Clientes.FormShow(Sender: TObject);
begin
  inherited;
  grid_rotas.DataSource.DataSet.FieldByName('nome_cliente').Visible := _LerConfiguracoesRegistroBoolean('NomeFantasiaAtivo');
  grid_rotas.DataSource.DataSet.FieldByName('razao').Visible        := not grid_rotas.DataSource.DataSet.FieldByName('nome_cliente').Visible;

  grid_clientes.DataSource.DataSet.FieldByName('nome_cliente').Visible := grid_rotas.DataSource.DataSet.FieldByName('nome_cliente').Visible;
  grid_clientes.DataSource.DataSet.FieldByName('razao').Visible        := not grid_clientes.DataSource.DataSet.FieldByName('nome_cliente').Visible;
end;

procedure TfrmCadRotasEntrega_Clientes.grid_clientesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;
  if not pn_filtro.Visible then
    Exit;

  if Trim(ed_filtro.Text) = '' then
    Exit;
  
  if Pos(ed_filtro.Text, Column.Field.Text) = 0 then
    Exit;

  Agrid := TDBGrid(Sender);
  if (gdFocused in State) then
    Agrid.Canvas.Font.Color := clWhite
  else
    Agrid.Canvas.Brush.Color := clGradientInactiveCaption;

  Agrid.Canvas.FillRect(Rect);
  Agrid.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmCadRotasEntrega_Clientes.grid_rotasDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  Coordenadas: TGridCoord;
  Acopy: TVw_clientes_dest_class;
begin
  inherited;
  Acopy := TVw_clientes_dest_class.Create;
  try
    Acopy.SetValuesFrom(TDBGrid(Source).DataSource.DataSet);
    TDBGrid(Source).DataSource.DataSet.Delete;

    Coordenadas := TDBGrid(Sender).MouseCoord(X,Y);
    if (Coordenadas.X >= 0) and (Coordenadas.Y > 0) then
      TDBGrid(Sender).DataSource.DataSet.MoveBy(Coordenadas.Y - TDBGrid(Sender).Row);

    Acopy.SetValuesFromIn(TClientDataSet(TDBGrid(Sender).DataSource.DataSet),
                          True,
                          (Coordenadas.Y <> -1),
                          (Coordenadas.Y = -1)
                          );

  finally
    FreeAndNil(Acopy);
  end;
end;

procedure TfrmCadRotasEntrega_Clientes.grid_rotasDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  if ((Source = grid_rotas) or (Source = grid_clientes)) then
    Accept := (not TDBGrid(Source).DataSource.DataSet.IsEmpty)
  else
    Accept := False
end;

procedure TfrmCadRotasEntrega_Clientes.grid_rotasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;
  if not pn_filtro.Visible then
    Exit;

  if Trim(ed_filtro.Text) = '' then
    Exit;
  
  if Pos(ed_filtro.Text, Column.Field.Text) = 0 then
    Exit;

  Agrid := TDBGrid(Sender);
  if (gdFocused in State) then
    Agrid.Canvas.Font.Color := clWhite
  else
    Agrid.Canvas.Brush.Color := clGradientInactiveCaption;

  Agrid.Canvas.FillRect(Rect);
  Agrid.DefaultDrawDataCell(Rect, Column.Field, State);

end;

procedure TfrmCadRotasEntrega_Clientes.grid_rotasTitleClick(Column: TColumn);
begin
  inherited;
  if vDadosIni.strIn(Column.FieldName, ['NOME_CLIENTE', 'RAZAO']) then
  begin
    grid_rotas.DataSource.DataSet.FieldByName('nome_cliente').Visible := Column.FieldName = 'RAZAO';
    grid_rotas.DataSource.DataSet.FieldByName('razao').Visible        := not grid_rotas.DataSource.DataSet.FieldByName('nome_cliente').Visible;

    grid_clientes.DataSource.DataSet.FieldByName('nome_cliente').Visible := grid_rotas.DataSource.DataSet.FieldByName('nome_cliente').Visible;
    grid_clientes.DataSource.DataSet.FieldByName('razao').Visible        := not grid_clientes.DataSource.DataSet.FieldByName('nome_cliente').Visible;
  end;
end;

procedure TfrmCadRotasEntrega_Clientes.move(Amove: Tmove);
var
  Acopy: TVw_clientes_dest_class;
  AinLast: Boolean;
begin
  inherited;
  Acopy := TVw_clientes_dest_class.Create;
  try
    Acopy.SetValuesFrom(grid_rotas.DataSource.DataSet);

    if (Amove = mvDown) and (grid_rotas.DataSource.DataSet.RecordCount = grid_rotas.DataSource.DataSet.RecNo + 1) then
      Amove := mvLast;
    AinLast := grid_rotas.DataSource.DataSet.RecordCount = grid_rotas.DataSource.DataSet.RecNo;

    grid_rotas.DataSource.DataSet.Delete;
    if Amove = mvFirst then
      grid_rotas.DataSource.DataSet.First
    else if (Amove = mvUp) and (not AinLast) then
      grid_rotas.DataSource.DataSet.Prior
    else if Amove = mvDown then
      grid_rotas.DataSource.DataSet.Next;

    Acopy.SetValuesFromIn(TClientDataSet(grid_rotas.DataSource.DataSet),
                          True,
                          Amove <> mvLast,
                          Amove = mvLast);

  finally
    FreeAndNil(Acopy);
  end;
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton10Click(Sender: TObject);
var
  Acopy: TVw_clientes_dest_class;
begin
  inherited;
  if grid_clientes.DataSource.DataSet.IsEmpty then
    Exit;
  Acopy := TVw_clientes_dest_class.Create;
  try
    Acopy.SetValuesFrom(grid_clientes.DataSource.DataSet);
    Acopy.SetValuesFromIn(TClientDataSet(grid_rotas.DataSource.DataSet), True, False, True);

    grid_clientes.DataSource.DataSet.Delete;
  finally
    FreeAndNil(Acopy);
  end;
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if grid_rotas.DataSource.DataSet.Name = '' then
    grid_rotas.DataSource.DataSet.Name := 'dt_gridrotas';
  vDadosIni.montarExcel(grid_rotas, Format('Rota %s %s %s', [edcod_rota.Text, edrota.Text, eddescricao.Text]), '');
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  move(mvFirst);
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  move(mvUp);
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  move(mvDown);
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  move(mvLast);
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton5Click(Sender: TObject);
var
  Acopy: TVw_clientes_dest_class;
  AinLast: Boolean;
begin
  inherited;
  Acopy := TVw_clientes_dest_class.Create;
  try
    grid_clientes.DataSource.DataSet.DisableControls;
    while not grid_clientes.DataSource.DataSet.IsEmpty do
    begin
      grid_clientes.DataSource.DataSet.First;
      Acopy.SetValuesFrom(grid_clientes.DataSource.DataSet);
      Acopy.SetValuesFromIn(TClientDataSet(grid_rotas.DataSource.DataSet),
                            True, False, True);
      grid_clientes.DataSource.DataSet.Delete;
    end;
  finally
    FreeAndNil(Acopy);
    grid_clientes.DataSource.DataSet.EnableControls;
  end;
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  ed_filtro.Clear;
  pn_filtro.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (ed_filtro.CanFocus) then
  	ed_filtro.SetFocus;
  grid_rotas.Repaint;
  grid_clientes.Repaint;
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (grid_rotas.CanFocus) then
  	grid_rotas.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (grid_clientes.CanFocus) then
  	grid_clientes.SetFocus;
  pn_filtro.Visible := False;  
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton8Click(Sender: TObject);
var
  Acopy: TVw_clientes_dest_class;
begin
  inherited;
  if grid_clientes.DataSource.DataSet.IsEmpty then
    Exit;
  Acopy := TVw_clientes_dest_class.Create;
  try
    grid_rotas.DataSource.DataSet.First;

    Acopy.SetValuesFrom(grid_clientes.DataSource.DataSet);
    Acopy.SetValuesFromIn(TClientDataSet(grid_rotas.DataSource.DataSet), True);

    grid_clientes.DataSource.DataSet.Delete;
  finally
    FreeAndNil(Acopy);
  end;
end;

procedure TfrmCadRotasEntrega_Clientes.SpeedButton9Click(Sender: TObject);
var
  Acopy: TVw_clientes_dest_class;
begin
  inherited;
  if grid_clientes.DataSource.DataSet.IsEmpty then
    Exit;
  Acopy := TVw_clientes_dest_class.Create;
  try
    Acopy.SetValuesFrom(grid_clientes.DataSource.DataSet);
    Acopy.SetValuesFromIn(TClientDataSet(grid_rotas.DataSource.DataSet), True);

    grid_clientes.DataSource.DataSet.Delete;
    grid_rotas.DataSource.DataSet.Next;
  finally
    FreeAndNil(Acopy);
  end;
end;

end.
