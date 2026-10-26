unit uBaixaGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, ExtCtrls, uEditMoeda, Buttons;

type
  TfrmBaixaGrade = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    lbDisponivel: TLabel;
    Label3: TLabel;
    lbPendente: TLabel;
    Label5: TLabel;
    lbConfirmado: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditMoeda1: TEditMoeda;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaGrade: TfrmBaixaGrade;

implementation

uses uDtmPedVenda, uclassespedvenda;

{$R *.dfm}

procedure TfrmBaixaGrade.BitBtn1Click(Sender: TObject);
begin
  inherited;
//  CadPedVenda.vItProd.vGrade.inserirGrade(CadPedVenda.vItProd,EditMoeda1.Valor);
//  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//  	DBGrid1.SetFocus;
//  if CadPedVenda.vItProd.vGrade.vQtdePendente = 0 then
//    ModalResult := mrOk;
end;

procedure TfrmBaixaGrade.BitBtn2Click(Sender: TObject);
begin
  inherited;
//  CadPedVenda.vItProd.vGrade.removerGrade(CadPedVenda.vItProd);
//  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//    DBGrid1.SetFocus;
end;

procedure TfrmBaixaGrade.BitBtn6Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmBaixaGrade.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (EditMoeda1.CanFocus) then
  	EditMoeda1.SetFocus;
end;

procedure TfrmBaixaGrade.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    DBGrid1DblClick(DBGrid1);
end;

procedure TfrmBaixaGrade.FormShow(Sender: TObject);
begin
  inherited;
  DBGrid1.DataSource.DataSet.First;
end;

end.
