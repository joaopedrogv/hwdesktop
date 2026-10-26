unit USelGradeProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, DB, uEditMoeda, ExtCtrls;

type
  TFrmSelGradeProd = class(TfrmPadrao)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    EditMoeda1: TEditMoeda;
    DBGrid1: TDBGrid;
    procedure EditMoeda1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelGradeProd: TFrmSelGradeProd;

implementation

{$R *.dfm}

procedure TFrmSelGradeProd.BitBtn1Click(Sender: TObject);
begin
  inherited;
  {if (EditMoeda1.Valor<=0) then
  begin
    Application.MessageBox('Quantidade para baixar deve ser maior que zero!','Informação', MB_ICONWARNING + MB_OK);
    EditMoeda1.SetFocus;
  end
  else}
  {if (EditMoeda1.Valor>DBGrid1.DataSource.DataSet.FieldByName('qtd_item_disponivel').AsFloat) then
  begin
    Application.MessageBox('Quantidade informada maior que o estoque disponível da grade selecionada!','Informação', MB_ICONWARNING + MB_OK);
    EditMoeda1.SetFocus;
  end
  else ModalResult:=mrOk; }
  ModalResult:=mrOk;
end;

procedure TFrmSelGradeProd.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
//  EditMoeda1.SetFocus;
  ModalResult:=mrOk;
end;

procedure TFrmSelGradeProd.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    ModalResult:=mrOk
  else if key = VK_TAB then
    BitBtn1.SetFocus;
//    EditMoeda1.SetFocus;
end;

procedure TFrmSelGradeProd.EditMoeda1Enter(Sender: TObject);
begin
  inherited;
  Label1.Caption:='Informe a quantidade a baixar da grade '+DBGrid1.DataSource.DataSet.FieldByName('cod_grade').AsString+': ';
end;

procedure TFrmSelGradeProd.FormShow(Sender: TObject);
begin
  inherited;
  ActiveControl := DBGrid1;
  Label1.Caption:='';
end;

end.
