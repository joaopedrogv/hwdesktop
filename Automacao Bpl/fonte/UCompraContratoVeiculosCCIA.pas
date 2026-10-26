unit UCompraContratoVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls,UClassesVeiculosCCIA,DB, AppEvnts;

type
  TFrmCompraContratoVeiculosCCIA = class(TfrmCadPadraoM)
    Edit1: TEdit;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBEdit16: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit17: TDBEdit;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    GroupBox6: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo4: TDBMemo;
    DBMemo3: TDBMemo;
    GroupBox37: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    GroupBox35: TGroupBox;
    BitBtn11: TBitBtn;
    GroupBox18: TGroupBox;
    Label29: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    BitBtn8: TBitBtn;
    CheckBox4: TCheckBox;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBMemo5: TDBMemo;
    CheckBox2: TCheckBox;
    CheckBox5: TCheckBox;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCompraContratoVeiculosCCIA: TFrmCompraContratoVeiculosCCIA;
  Veiculo : TVeiculosCCIA;

implementation
            uses
            uDtmAtivo;

{$R *.dfm}

procedure TFrmCompraContratoVeiculosCCIA.BitBtn3Click(Sender: TObject);
begin
  inherited;
  TabSheet3.Visible := true;
  PageControl3.ActivePage := TabSheet3;
  TabSheet3.show;
end;

procedure TFrmCompraContratoVeiculosCCIA.BitBtn4Click(Sender: TObject);
begin
  inherited;
//atualizar preco de compra cad. veiculo, e pegar se tiver informação
end;

procedure TFrmCompraContratoVeiculosCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
if Veiculo.dataSet.State = dsEdit then
  begin
    Veiculo.Post;
    if Veiculo.confirmaAlteracao then
    begin
      if Veiculo.Apply then
        Veiculo.CommitaTransacao;
    end
    else if Veiculo.emTransacao then
    begin
      Veiculo.Cancel;
      Veiculo.RollBackTransacao;
    end;
  end
  else
  begin
    Veiculo.Cancel;
    Veiculo.RollBackTransacao;
  end;
  Veiculo.Destroy;
  Action := caFree;
  FrmCompraContratoVeiculosCCIA := nil;
end;

procedure TFrmCompraContratoVeiculosCCIA.FormCreate(Sender: TObject);
begin
  inherited;
TelaCadastro := vDadosIni.vTipoForm;
  Veiculo := TVeiculosCCIA.create;
  Veiculo.abreVeiculos('');
end;

procedure TFrmCompraContratoVeiculosCCIA.FormShow(Sender: TObject);
begin
  inherited;
CheckBox3.Visible :=false;
CheckBox1.Visible := False;
MaskEdit2.Visible := false;
MaskEdit1.Visible := false;
end;

end.
