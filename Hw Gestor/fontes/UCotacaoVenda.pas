unit UCotacaoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, CheckLst, ExtCtrls, Buttons,UClassesGestor, Grids,
  DBGrids, ComCtrls;

type
  TFrmCotacaoVenda = class(TfrmPadrao)
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    CheckListBox1: TCheckListBox;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ProgressContador: TProgressBar;
    LbContador: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cadcotacao: Tcotacao;
  end;

var
  FrmCotacaoVenda: TFrmCotacaoVenda;

implementation

uses UEnsaiosDescontos;

{$R *.dfm}

procedure TFrmCotacaoVenda.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmCotacaoVenda.BitBtn2Click(Sender: TObject);
var
 vatl: string;
begin
  inherited;
 try
 cadcotacao.vqtdediasmes:=StrToInt(Edit1.text);
 except
   Application.MessageBox('Valor dos Dias disponíveis mês informado está inválido!', 'Confirmação', MB_OK);
   exit;
 end;
 if CheckBox1.Checked then
  vatl:='R'
 else
  vatl:='';
 cadcotacao.cadCotacaoItens.cadprodutos.verificaclassesProduto(CheckListBox1);
 cadcotacao.MontacotacaoVenda(cadcotacao.cadCotacaoItens.cadprodutos.vclasses,vatl,'',LbContador,ProgressContador);
end;

procedure TFrmCotacaoVenda.BitBtn5Click(Sender: TObject);
begin
  inherited;
// chamaremos outro form com os dados de cada produto individualmente e este form
// poderá chamar o form de margem de acordo com o tipo de produto/Serviço...
end;

procedure TFrmCotacaoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  cadcotacao:=Tcotacao.create;
end;

procedure TFrmCotacaoVenda.FormShow(Sender: TObject);
begin
  inherited;
 cadcotacao.abrecotacao;
 edit1.setfocus;
end;

end.
