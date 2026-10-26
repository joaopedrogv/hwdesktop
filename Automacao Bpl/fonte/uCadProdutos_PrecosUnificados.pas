unit uCadprodutos_PrecosUnificados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, uDataSet_OOP,
  Menus;

type
  TfrmCadProdutosPrecosUnificados = class(TfrmPadrao)
    pnPrecosUnificados: TPanel;
    GridPanel2: TGridPanel;
    Label510: TLabel;
    Label511: TLabel;
    Label512: TLabel;
    Label513: TLabel;
    Label514: TLabel;
    Label515: TLabel;
    Label516: TLabel;
    Label517: TLabel;
    Label519: TLabel;
    Label521: TLabel;
    Label522: TLabel;
    Label523: TLabel;
    Label526: TLabel;
    Label527: TLabel;
    DBEdit219: TDBEdit;
    DBEdit220: TDBEdit;
    GridPanel1: TGridPanel;
    DBEdit238: TDBEdit;
    DBEdit239: TDBEdit;
    DBEdit240: TDBEdit;
    DBEdit241: TDBEdit;
    DBEdit242: TDBEdit;
    DBEdit243: TDBEdit;
    GridPanel3: TGridPanel;
    DBEdit244: TDBEdit;
    DBEdit245: TDBEdit;
    DBEdit246: TDBEdit;
    DBEdit247: TDBEdit;
    DBEdit248: TDBEdit;
    DBEdit249: TDBEdit;
    DBEdit221: TDBEdit;
    DBEdit222: TDBEdit;
    DBEdit223: TDBEdit;
    DBEdit224: TDBEdit;
    DBEdit225: TDBEdit;
    DBEdit226: TDBEdit;
    DBEdit227: TDBEdit;
    DBEdit228: TDBEdit;
    DBEdit229: TDBEdit;
    DBEdit230: TDBEdit;
    DBEdit231: TDBEdit;
    DBEdit232: TDBEdit;
    DBEdit233: TDBEdit;
    DBEdit234: TDBEdit;
    DBEdit235: TDBEdit;
    DBEdit236: TDBEdit;
    DBEdit237: TDBEdit;
    Panel120: TPanel;
    SpeedButton57: TSpeedButton;
    Label528: TLabel;
    DBEdit250: TDBEdit;
    DBEdit251: TDBEdit;
    Label520: TLabel;
    DBEdit252: TDBEdit;
    Panel126: TPanel;
    BitBtn136: TBitBtn;
    GridPanel5: TGridPanel;
    lbPrecoMarkupProporcional: TLabel;
    Label530: TLabel;
    DBText76: TDBText;
    Panel1: TPanel;
    Label518: TLabel;
    SpeedButton60: TSpeedButton;
    popPromocao: TPopupMenu;
    AtivarDesativarPrecoPromo: TMenuItem;
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    procedure SpeedButton57Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton60Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit219Exit(Sender: TObject);
  private
    FProduto: TDataSet_OOP;
    FcustoVisivel: Boolean;
    { Private declarations }
  public
    property Produto: TDataSet_OOP read FProduto write FProduto;
    property custoVisivel: Boolean read FcustoVisivel write FcustoVisivel;
  end;

var
  frmCadProdutosPrecosUnificados: TfrmCadProdutosPrecosUnificados;

implementation

uses
  UClassesProdutos,
  config_sistema_class,
  StrUtils,
  UDtmProdutos,
  uDtmAtivo;

{$R *.dfm}

procedure TfrmCadProdutosPrecosUnificados.DBEdit219Exit(Sender: TObject);
begin
  inherited;
  (Produto as TProdutos).HandleAlteracaoPreco((Sender as TDBEdit).DataField);
end;

procedure TfrmCadProdutosPrecosUnificados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadProdutosPrecosUnificados := nil;
end;

procedure TfrmCadProdutosPrecosUnificados.FormShow(Sender: TObject);
begin
  inherited;
  lbPrecoMarkupProporcional.Caption := IfThen(vDadosIni.vProduto.Precos.ManterPrecoMarkupProporcional, 'SIM', 'NAO');
  DBText76.Visible := Self.custoVisivel;
  DBEdit237.Enabled := False;
  DBCheckBox1.Enabled := False;
end;

procedure TfrmCadProdutosPrecosUnificados.SpeedButton57Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO020', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
  begin
    DBEdit237.Enabled := false;
    DBCheckBox1.Enabled := false;
  end
  else
  begin
    DBEdit237.Enabled := true;
    DBCheckBox1.Enabled := true;
  end;
end;

procedure TfrmCadProdutosPrecosUnificados.SpeedButton60Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('prod_precos', Produto.buscas);
  vDadosIni.vProduto.Precos.Config(TConfig_sistema_class.getConf('prod_precos', Produto.buscas, vDadosIni.cod_empresa));
//  (Produto as TProdutos).Confs.Reload := True;

  lbPrecoMarkupProporcional.Caption := IfThen(vDadosIni.vProduto.Precos.ManterPrecoMarkupProporcional, 'SIM', 'NAO');
  //lbDescontoPreco30noVarejo.Caption := IfThen((Produto as TProdutos).Confs.Precos.VarejoComDesconto30Dias, 'SIM', 'NAO');
  //lbAdicionalPreco3060e90.Caption := IfThen((Produto as TProdutos).Confs.Precos.PreferirAdicional306090, 'SIM', 'NAO');
end;

end.

entrada de nota
alteração de precos
esconder preços que o cliente nao usa
desabilitar markup ou margem na entrada da nota quando não quiser (talvez uns atalhos para a=habilitar se quiser)
