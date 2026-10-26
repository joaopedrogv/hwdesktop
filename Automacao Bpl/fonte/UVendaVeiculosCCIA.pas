unit UVendaVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, TabNotBk, ImgList, uClassesVeiculosCCIA, DB, AppEvnts;

type
  TfrmVendaVeiculosCCIA = class(TfrmCadPadrao)
    TabSheet_DadosdaNota: TTabSheet;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ScrollBox4: TScrollBox;
    GroupBox21: TGroupBox;
    Label40: TLabel;
    DBEdit24: TDBEdit;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    DBEdit26: TDBEdit;
    Label42: TLabel;
    DBEdit27: TDBEdit;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit28: TDBEdit;
    Label45: TLabel;
    DBEdit29: TDBEdit;
    Label46: TLabel;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    Label47: TLabel;
    DBEdit32: TDBEdit;
    Label48: TLabel;
    DBEdit33: TDBEdit;
    Label49: TLabel;
    DBEdit34: TDBEdit;
    Label50: TLabel;
    DBEdit35: TDBEdit;
    Label51: TLabel;
    DBEdit36: TDBEdit;
    Label52: TLabel;
    DBLookupComboBox9: TDBLookupComboBox;
    Label53: TLabel;
    DBLookupComboBox10: TDBLookupComboBox;
    Label54: TLabel;
    DBEdit55: TDBEdit;
    Label79: TLabel;
    TabSheet_Escolha: TTabSheet;
    pnEscolhaVenda: TPanel;
    ListView_EscolhaVenda: TListView;
    Panel79: TPanel;
    SpeedButton21: TSpeedButton;
    BitBtn62: TBitBtn;
    BitBtn66: TBitBtn;
    GroupBox_Imprimir: TGroupBox;
    GroupBox17: TGroupBox;
    Label_Intermediador: TLabel;
    Label35: TLabel;
    Label_ClienteVendedor: TLabel;
    Label_Concessionaria: TLabel;
    DBEdit_Intermediador: TDBEdit;
    DBLookupComboBox_Intermediador: TDBLookupComboBox;
    BitBtn_Intermediador_Editar: TBitBtn;
    BitBtn_Intermediador_Novo: TBitBtn;
    DBEdit20: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    BitBtn10: TBitBtn;
    BitBtn13: TBitBtn;
    DBEdit_ClienteVendedor: TDBEdit;
    DBLookupComboBox_ClienteVendedor: TDBLookupComboBox;
    BitBtn_ClienteVendedor_Edit: TBitBtn;
    BitBtn_ClienteVendedor_Novo: TBitBtn;
    DBEdit_Concessionaria: TDBEdit;
    DBLookupComboBox_Concessionaria: TDBLookupComboBox;
    BitBtn_Concessionaria_Edit: TBitBtn;
    BitBtn_Concessionaria_Novo: TBitBtn;
    GroupBox25: TGroupBox;
    DBLookupComboBox15: TDBLookupComboBox;
    Label80: TLabel;
    Label_Gerente: TLabel;
    DBLookupComboBox_Gerente: TDBLookupComboBox;
    TabSheet_Consignado: TTabSheet;
    ScrollBox6: TScrollBox;
    GroupBox16: TGroupBox;
    Label34: TLabel;
    DBEdit15: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    DBEdit16: TDBEdit;
    BitBtn14: TBitBtn;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit17: TDBEdit;
    Label81: TLabel;
    DBEdit18: TDBEdit;
    GroupBox19: TGroupBox;
    GroupBox26: TGroupBox;
    DBEdit19: TDBEdit;
    Label82: TLabel;
    Label83: TLabel;
    DBEdit21: TDBEdit;
    Label84: TLabel;
    DBEdit22: TDBEdit;
    chw: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    Edit1: TEdit;
    GroupBox18: TGroupBox;
    Label29: TLabel;
    Label14: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    BitBtn8: TBitBtn;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    BitBtn15: TBitBtn;
    CheckBox_VeiculoRodando: TCheckBox;
    DBEdit_DataVenda: TDBEdit;
    Label_DataVenda: TLabel;
    GroupBox20: TGroupBox;
    Label28: TLabel;
    Label30: TLabel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit13: TDBEdit;
    Memo8: TMemo;
    GroupBox_Informacoes: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label38: TLabel;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo3: TMemo;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label39: TLabel;
    TabSheet_Venda: TTabSheet;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    ScrollBox7: TScrollBox;
    BitBtn30: TBitBtn;
    GroupBox23: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    DBEdit10: TDBEdit;
    Label18: TLabel;
    GroupBox22: TGroupBox;
    Label58: TLabel;
    DBEdit40: TDBEdit;
    GroupBox24: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    DBLookupComboBox11: TDBLookupComboBox;
    DBLookupComboBox12: TDBLookupComboBox;
    DBLookupComboBox13: TDBLookupComboBox;
    DBLookupComboBox14: TDBLookupComboBox;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    GroupBox_Venda: TGroupBox;
    GroupBox_Troca: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    BitBtn17: TBitBtn;
    BitBtn22: TBitBtn;
    DBEdit7: TDBEdit;
    Memo9: TMemo;
    GroupBox_NomesVenda: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    DBEdit9: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    GroupBox_Dados: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    BitBtn16: TBitBtn;
    DBEdit6: TDBEdit;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label20: TLabel;
    DBEdit11: TDBEdit;
    BitBtn31: TBitBtn;
    DBEdit14: TDBEdit;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn62Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure _HabilitaCamposVenda(ValorFormulario : Integer);
  end;

var
  frmVendaVeiculosCCIA: TfrmVendaVeiculosCCIA;
  Veiculos :  TVeiculosCCIA;
implementation
                       uses
                       uDtmAtivo, uDadosReaisVeiculosCCIA;
{$R *.dfm}

procedure TfrmVendaVeiculosCCIA.BitBtn11Click(Sender: TObject);
begin
  inherited;
//Pegar cadastros básicos de veículo
end;

procedure TfrmVendaVeiculosCCIA.BitBtn12Click(Sender: TObject);
begin
  inherited;
//Pegar cadastros básicos de veículo
end;

procedure TfrmVendaVeiculosCCIA.BitBtn15Click(Sender: TObject);
begin
  inherited;
{1- Preencher campo Valor a receber
 2- Se o veículo tiver despesa perguntar se deseja aproveitar os dados
das despessas do veículo na condição de pagamento.
}
end;

procedure TfrmVendaVeiculosCCIA.BitBtn3Click(Sender: TObject);
begin
{
     Verificar se tem Contratos para impressão dos formulários
}

  //inherited;
  try
    Screen.Cursor := crHourGlass;
   Veiculos._AbreFormVendaVeiculos(9);
    if(TelaCadastro = 0)  then
    statusBar(panelCadastro,'');
  finally                        
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVendaVeiculosCCIA.BitBtn4Click(Sender: TObject);

//CondicaoPagamento : TfrmCondicaoPagamentoCCIA;
begin
//Pegar veículos em posição estoque e transito e não estiver em demonstração
//nem vendido
//Perguntar depois de concluir se for novo registro para imprimir: declaração,
//contrato, contrato com reserva de dominio
//Atualizar data da venda no cadastro do veículo
//Se tive informado o CFOP no cadastro de veículo pegar, e atualizar o CFOP,
// preço de venda, data da venda aliquota ICMS acordo com a venda.
  inherited;
  //Application.CreateForm(TfrmCondicaoPagamentoCCIA,CondicaoPagamento);
  //CondicaoPagamento.ShowModal;
end;

procedure TfrmVendaVeiculosCCIA.BitBtn62Click(Sender: TObject);
begin
  inherited;
  {
     Verificar se tem Contratos para impressão dos formulários
}

            TForm(pnEscolhaVenda.Parent).ModalResult := IDOK;
end;

procedure TfrmVendaVeiculosCCIA.BitBtn8Click(Sender: TObject);
begin
  inherited;
(*1 - Pegar veículos em posição estoque e transito e não estiver em demonstração
nem vendido
2 - Ao vender veículo verificar PEPS(Primeiro que saí primeiro que entra)
*)
end;

procedure TfrmVendaVeiculosCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
if Veiculos.dataSet.State = dsEdit then
  begin
    Veiculos.Post;
    if Veiculos.confirmaAlteracao then
    begin
      if Veiculos.Apply then
        Veiculos.CommitaTransacao;
    end
    else if Veiculos.emTransacao then
    begin
      Veiculos.Cancel;
      Veiculos.RollBackTransacao;
    end;
  end
  else
  begin
    Veiculos.Cancel;
    Veiculos.RollBackTransacao;
  end;
  Veiculos.Destroy;
  Action := caFree;
  frmVendaVeiculosCCIA := nil;
end;

procedure TfrmVendaVeiculosCCIA.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Veiculos := TVeiculosCCIA.create;
  Veiculos.abreVeiculos('');
end;

procedure TfrmVendaVeiculosCCIA.FormShow(Sender: TObject);
begin
TabSheet_Escolha.TabVisible := false;
MaskEdit1.Visible :=false;
MaskEdit2.Visible :=false;
CheckBox1.visible := false;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

if(TelaCadastro = 1) then
BitBtn3Click(Sender);

end;

procedure TfrmVendaVeiculosCCIA.Label14Click(Sender: TObject);
begin
  inherited;
(*Ao vender veículo verificar PEPS(Primeiro que saí primeiro que entra)
*)
end;

procedure TfrmVendaVeiculosCCIA.SpeedButton6Click(Sender: TObject);
begin
  inherited;
{
Se for só contrato o botão de voltar para o estoque funciona,
se for NF ele volta pelo estoque pelo cancelamento da nota
ou pela nota de devolução.
}
end;

procedure TfrmVendaVeiculosCCIA.SpeedButton7Click(Sender: TObject);
begin
  inherited;
//Quando selecionar um tipo diferente do tipo venda habilitar botão
Veiculos._AbreFormVendaVeiculos(0);

end;

procedure TfrmVendaVeiculosCCIA.SpeedButton8Click(Sender: TObject);
var
DadosReais : TfrmDadosReaisVeiculosCCIA;
begin
  inherited;
  Application.CreateForm(TfrmDadosReaisVeiculosCCIA,DadosReais);
  DadosReais.ShowModal;


end;

procedure TfrmVendaVeiculosCCIA._HabilitaCamposVenda(ValorFormulario: Integer);
begin

//Habilita campos
             GroupBox_Informacoes.Visible := true;
             GroupBox_Imprimir.Visible := true;
             Label_ClienteVendedor.Visible := true;
             DBEdit_ClienteVendedor.Visible := true;
             DBLookupComboBox_ClienteVendedor.Visible := true;
             BitBtn_ClienteVendedor_Edit.Visible := true;
             BitBtn_ClienteVendedor_Novo.Visible := true;
             Label_Concessionaria.Visible := true;
             DBEdit_Concessionaria.Visible := true;
             DBLookupComboBox_Concessionaria.Visible := true;
             BitBtn_Concessionaria_Edit.Visible :=true;
             BitBtn_Concessionaria_Novo.Visible := true;
             Label_Gerente.Visible := true;
             DBLookupComboBox_Gerente.Visible := true;
             CheckBox_VeiculoRodando.Visible := true;
             Label_DataVenda.Visible := true;
             DBEdit_DataVenda.Visible := true;
             Label_Intermediador.Visible := true;
             DBEdit_Intermediador.Visible := true;
             DBLookupComboBox_Intermediador.Visible :=true;
             BitBtn_Intermediador_Editar.Visible :=true;
             BitBtn_Intermediador_Novo.Visible := true;

             Label_Intermediador.Visible := true;
             DBEdit_Intermediador.Visible := true;
             DBLookupComboBox_Intermediador.Visible :=true;
             BitBtn_Intermediador_Editar.Visible :=true;
             BitBtn_Intermediador_Novo.Visible := true;

             TabSheet_DadosdaNota.TabVisible := true;
             TabSheet_Escolha.TabVisible := true;
             TabSheet3.TabVisible := true;
             TabSheet_Consignado.tabVisible := true;
             TabSheet_Venda.tabVisible := true;


case ValorFormulario of
    0: begin //Venda
//             GroupBox_Informacoes.Visible := false;
//             GroupBox_Imprimir.Visible := false;
//             Label_ClienteVendedor.Visible := false;
//             DBEdit_ClienteVendedor.Visible := false;
//             DBLookupComboBox_ClienteVendedor.Visible := false;
//             BitBtn_ClienteVendedor_Edit.Visible := false;
//             BitBtn_ClienteVendedor_Novo.Visible := false;
//             Label_Concessionaria.Visible := false;
//             DBEdit_Concessionaria.Visible := false;
//             DBLookupComboBox_Concessionaria.Visible := false;
//             BitBtn_Concessionaria_Edit.Visible :=false;
//             BitBtn_Concessionaria_Novo.Visible := false;
//             Label_Gerente.Visible := false;
//             DBLookupComboBox_Gerente.Visible := false;
//             CheckBox_VeiculoRodando.Visible := false;
//             Label_DataVenda.Visible := false;
//             DBEdit_DataVenda.Visible := false;
             TabSheet_Consignado.TabVisible := false;
             TabSheet3.tabVisible := false;


             TabSheet_Escolha.TabVisible := false;
             PageControl3.ActivePage := TabSheet_Venda;
             TabSheet_Venda.Show;
             GroupBox_Venda.Caption := 'Venda de Veículos';
        end;

    1: begin //Contrato
             Label_Intermediador.Visible := false;
             DBEdit_Intermediador.Visible := false;
             DBLookupComboBox_Intermediador.Visible :=false;
             BitBtn_Intermediador_Editar.Visible :=false;
             BitBtn_Intermediador_Novo.Visible := false;
             TabSheet_DadosdaNota.TabVisible := false;
             TabSheet_Escolha.TabVisible := false;
             TabSheet_Consignado.TabVisible := false;
             TabSheet_Venda.tabVisible := false;
             CheckBox_VeiculoRodando.Visible := false;

             TabSheet3.TabVisible := false;
             PageControl3.ActivePage := TabSheet3;
             TabSheet3.Show;
             GroupBox1.Caption := 'Contrato de Venda';

       end;

       2:begin //Consignado
                   TabSheet_DadosdaNota.TabVisible := false;
                   TabSheet_Escolha.TabVisible := false;
                   TabSheet3.TabVisible := false;
                   TabSheet_Consignado.TabVisible := false;
                   TabSheet_Venda.tabVisible := false;
                   PageControl3.ActivePage := TabSheet_Consignado;
                   TabSheet_Consignado.Show;
        end;
    3: begin //Intermediação
             TabSheet_DadosdaNota.TabVisible := false;
             TabSheet_Escolha.TabVisible := false;
             TabSheet_Consignado.TabVisible := false;
             TabSheet_Venda.tabVisible := false;

             TabSheet3.TabVisible := false;
             PageControl3.ActivePage := TabSheet3;
             TabSheet3.Show;

             GroupBox1.Caption := 'Intermediação';



        end;

end;

end;


end.
