unit UListaCamposSql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, UClassesCadastrosBasicos, uPadrao;

type
  TfrmListarCamposSql = class(TfrmPadrao)
    DBGrid_Listar: TDBGrid;
    Panel_Listar: TPanel;
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid_ListarKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_ListarDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //Dado que será resgatado
    _Registro: string;
    //Nome da tabela a ser listada
    _Id_: string;
  end;

var
  frmListarCamposSql: TfrmListarCamposSql;
  CamposConsultasSQL: TCamposConsultasSQL;

implementation

uses UDtmCadastrosBasicos, DB;

{$R *.dfm}

procedure TfrmListarCamposSql.DBGrid_ListarDblClick(Sender: TObject);
begin
	inherited;
	_Registro := trim(DBGrid_Listar.DataSource.DataSet.FieldByName('CAMPO').AsString);

  Close;
end;

procedure TfrmListarCamposSql.DBGrid_ListarKeyPress(Sender: TObject;
  var Key: Char);
begin
	inherited;
	if Key = #13 then
  begin
    DBGrid_ListarDblClick(Sender); // executa duploClik no grid
    Key := #0;
  end
end;

procedure TfrmListarCamposSql.FormDestroy(Sender: TObject);
begin
  inherited;
  CamposConsultasSQL.free;
  CamposConsultasSQL := nil;
end;

procedure TfrmListarCamposSql.FormShow(Sender: TObject);
begin
	inherited;
  try
    CamposConsultasSQL := TCamposConsultasSQL.Create;
    CamposConsultasSQL.abreCamposConsultasSQL(_Id_);
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  end;
end;

end.
