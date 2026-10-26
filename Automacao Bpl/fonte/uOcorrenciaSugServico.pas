unit uOcorrenciaSugServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DBCtrls, Mask;

type
  TfrmOcorrenciasServico = class(TForm)
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn1: TBitBtn;
    BitBtn_Novo_Pendencia: TBitBtn;
    BitBtn_Excluir_Pendencia: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn_Alterar_Pendencia: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOcorrenciasServico: TfrmOcorrenciasServico;

implementation

{$R *.dfm}

procedure TfrmOcorrenciasServico.FormShow(Sender: TObject);
begin
 TabSheet1.TabVisible := false;
 TabSheet2.TabVisible := false;

 PageControl1.ActivePage := TabSheet1;
 TabSheet1.Show;
end;

end.
