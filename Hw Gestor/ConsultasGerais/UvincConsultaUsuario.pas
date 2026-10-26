unit UvincConsultaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, IBQuery,
  UClassesConsGeral;

type
  TFrmvincUsuario = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cadDadCons: TRelConsGeral;
    vdesccons: string;
    vcodcons: integer;
  end;

var
  FrmvincUsuario: TFrmvincUsuario;

implementation

uses
  UdtmConsGeral;


{$R *.dfm}

procedure TFrmvincUsuario.BitBtn1Click(Sender: TObject);
begin
  cadDadCons.Buscas.close;
  cadDadCons.Buscas.SQL.Text := 'SELECT * FROM USER_CONSULTASDIV WHERE COD_CONSULTA = ' + inttostr(vcodcons) + ' AND COD_EMPRESA = ' + cadDadCons.cod_empresa + ' and USUARIO = ''' + cadDadCons.vtbsenha.FieldByName('USUARIO').AsString + '''';
  cadDadCons.Buscas.Open;
  if not cadDadCons.Buscas.IsEmpty then
  begin
    messagedlg('Consulta já existe para este usuário', mtinformation, [mbOK], 0);
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end
  else
  begin
    cadDadCons.vcadvincs.Append;
    cadDadCons.vcadvincs.FieldByName('COD_CONSULTA').AsInteger := vcodcons;
    cadDadCons.vcadvincs.FieldByName('COD_EMPRESA').AsInteger := strtoint(cadDadCons.cod_empresa);
    cadDadCons.vcadvincs.FieldByName('USUARIO').AsString := cadDadCons.vtbsenha.FieldByName('USUARIO').AsString;
    cadDadCons.vcadvincs.FieldByName('COD_USUARIO').AsInteger := cadDadCons.vcodus;
    cadDadCons.vcadvincs.Post;
    cadDadCons.vcadvincs.ApplyUpdates(-1);
  end;
end;

procedure TFrmvincUsuario.BitBtn2Click(Sender: TObject);
begin
  if application.messagebox('Tem certeza que deseja Deletar este registro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
  begin
    cadDadCons.vcadvincs.Delete;
    cadDadCons.vcadvincs.ApplyUpdates(-1);
  end;
end;

procedure TFrmvincUsuario.BitBtn3Click(Sender: TObject);
begin
  cadDadCons.abresenhas(2);
  cadDadCons.vcadvincs.close;
  CLOSE;
end;

procedure TFrmvincUsuario.FormShow(Sender: TObject);
begin
  Label1.Caption := vdesccons;
  vcodcons := cadDadCons.buscacodconsulta(vdesccons);
  cadDadCons.abresenhas(1);
  dbgrid1.DataSource := DtmConsGeral.Dtsenhas;
  DBGrid2.DataSource := DtmConsGeral.DtSenhavinc;
  cadDadCons.vcadvincs.Close;
  cadDadCons.vcadvincs.CommandText := 'select v.cod_consulta,v.usuario,v.cod_usuario,' + 'v.cod_empresa from user_consultasdiv v,sqlconsultasdiv sq where v.cod_consulta = ' + 'sq.cod_consulta and v.cod_empresa = sq.cod_empresa and v.cod_consulta = ' + inttostr(vcodcons) + ' and v.cod_empresa = ' + cadDadCons.cod_empresa;
  cadDadCons.vcadvincs.open;
end;

end.

