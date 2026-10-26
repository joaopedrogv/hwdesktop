unit uFichaVeicApar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, 
  UClassesPedVenda;

type
  TfrmFichaVeicApar = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    ckOS: TCheckBox;
    ckOrc: TCheckBox;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure ckOrcClick(Sender: TObject);
    procedure ckOSClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    veicAparelho: string;
    nped: Integer;
  	tipo: string;
    chassi: string;
    placa: string;
    cod_veic: Integer;
    cod_equip: Integer;
    cadped: TPedVenda;
  end;

var
  frmFichaVeicApar: TfrmFichaVeicApar;

implementation

uses uDadosIni, uDtmPedVenda;

{$R *.dfm}

procedure TfrmFichaVeicApar.BitBtn1Click(Sender: TObject);
var
	vTipo: string;
begin
  inherited;
  try
  	if (ckOS.Checked) and (ckOrc.Checked) then
    	vTipo := 'OsOrc'
    else if (ckOS.Checked)then
    	vTipo := 'OS'
    else if (ckOrc.Checked) then
    	vTipo := 'ORC'
    else
    	vTipo := tipo;

    Screen.Cursor := crHourGlass;
    cadped.abreFichaVeiculoAparelho(
      veicAparelho,
      nped,
      vTipo,
      chassi,
      placa,
      cod_veic,
      cod_equip);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmFichaVeicApar.ckOrcClick(Sender: TObject);
begin
  inherited;
	if (not ckOS.Checked) and (not ckOrc.Checked) then
  	ckOS.Checked := True;
end;

procedure TfrmFichaVeicApar.ckOSClick(Sender: TObject);
begin
  inherited;
	if (not ckOS.Checked) and (not ckOrc.Checked) then
  	ckOrc.Checked := True;
end;

procedure TfrmFichaVeicApar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmFichaVeicApar := nil;
end;

procedure TfrmFichaVeicApar.FormShow(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crDefault;
end;

end.
