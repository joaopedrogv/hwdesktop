unit uCadProdutos_nfe_dados_entrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, uEditHw, ExtCtrls, produtos_class;

type
  TfrmCadProdutos_nfe_dados_entrada = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    EditHw1: TEditHw;
    Label2: TLabel;
    EditHw2: TEditHw;
    Label3: TLabel;
    EditHw3: TEditHw;
    Label4: TLabel;
    EditHw4: TEditHw;
    Label5: TLabel;
    EditHw5: TEditHw;
    Label6: TLabel;
    EditHw6: TEditHw;
    Label7: TLabel;
    EditHw7: TEditHw;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EditHw8: TEditHw;
    Label12: TLabel;
    EditHw9: TEditHw;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Fproduto: TProdutos_class;
    { Private declarations }
  public
    { Public declarations }
    property produto: TProdutos_class read Fproduto write Fproduto;
  end;

var
  frmCadProdutos_nfe_dados_entrada: TfrmCadProdutos_nfe_dados_entrada;

implementation

{$R *.dfm}

procedure TfrmCadProdutos_nfe_dados_entrada.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Fproduto.baseicmant_sub      := EditHw1.AsValue;
  Fproduto.ant_pst             := EditHw2.AsValue;
  Fproduto.ant_vicmssubstituto := EditHw3.AsValue;
  Fproduto.icmant_sub          := EditHw4.AsValue;
  Fproduto.fcp_vbcfcpstret     := EditHw5.AsValue;
  Fproduto.fcp_pfcpstret       := EditHw6.AsValue;
  Fproduto.fcp_vfcpstret       := EditHw7.AsValue;

  Fproduto.vicmsmonoret        := EditHw8.AsValue;
  Fproduto.adremicmsret        := EditHw9.AsValue;

  ModalResult := IDOK;
end;

procedure TfrmCadProdutos_nfe_dados_entrada.FormShow(Sender: TObject);
begin
  inherited;
  EditHw1.AsValue := Fproduto.baseicmant_sub;
  EditHw2.AsValue := Fproduto.ant_pst;
  EditHw3.AsValue := Fproduto.ant_vicmssubstituto;
  EditHw4.AsValue := Fproduto.icmant_sub;
  EditHw5.AsValue := Fproduto.fcp_vbcfcpstret;
  EditHw6.AsValue := Fproduto.fcp_pfcpstret;
  EditHw7.AsValue := Fproduto.fcp_vfcpstret;

  EditHw8.AsValue := Fproduto.vicmsmonoret;
  EditHw9.AsValue := Fproduto.adremicmsret;
end;

end.
