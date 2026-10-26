unit uReestrutura_Versao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    sqlFiscal: TMemo;
    sqlHwauto: TMemo;
    sqlHWF: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    function GerVersionFromClass: Integer;
  protected
    FBuild: Smallint;
    FVersao: Smallint;
    procedure SetBuild(const Value: Smallint);
    procedure SetVersao(const Value: Smallint);
  public
    property Build: Smallint read FBuild write SetBuild;
    property Versao: Smallint read FVersao write SetVersao;
  end;

var
  frmReestruturaVersao: TfrmReestruturaVersao;

implementation

{$R *.dfm}

{ TfrmReestruturaVersao }

procedure TfrmReestruturaVersao.FormCreate(Sender: TObject);
begin
  FBuild := 0;
  FVersao := GerVersionFromClass;
end;

function TfrmReestruturaVersao.GerVersionFromClass: Integer;
var
  ClassName, Number: string;
  I: Integer;
begin
  ClassName := Self.Name;

  Number := '';
  for I := 1 to (Length(ClassName)) do
    if Pos(ClassName[I], '0123456789') > 0 then
      Number := Number + ClassName[I];

  Result := StrToIntDef(Number, 0);
end;

procedure TfrmReestruturaVersao.SetBuild(const Value: Smallint);
begin
  FBuild := Value;
end;

procedure TfrmReestruturaVersao.SetVersao(const Value: Smallint);
begin
  FVersao := Value;
end;

end.
