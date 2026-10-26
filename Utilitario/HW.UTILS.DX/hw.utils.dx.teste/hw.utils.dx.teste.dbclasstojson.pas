unit hw.utils.dx.teste.dbclasstojson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  uClasseConexao, Vcl.Mask;

type
  Tfrmdbtojson = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BitBtn1: TBitBtn;
    tsSaida: TTabSheet;
    memoJsonEncode: TMemo;
    Splitter1: TSplitter;
    memoJsonFormat: TMemo;
    ed_nped: TMaskEdit;
    ed_tipo: TMaskEdit;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    ed_db: TMaskEdit;
    ed_cod_empresa: TMaskEdit;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ed_dbExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    Fcon: TConexao;
  public
    { Public declarations }
  end;

var
  frmdbtojson: Tfrmdbtojson;

implementation

{$R *.dfm}

uses
  pedvenda_class,
  pedvenda_prod_class,
  REST.Json, System.Generics.Collections;

procedure Tfrmdbtojson.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrmdbtojson.BitBtn2Click(Sender: TObject);
var
  Aped: TPedvenda_class;
begin
  Aped := TPedvenda_class.Create;
  try
    Aped.SetValuesFrom(Fcon.SqlOpen('select %s from pedvenda where nped = %s and tipo = %s and cod_empresa = %s',
                                    [TPedvenda_class.GetFieldsSql(),
                                     ed_nped.Text, string(ed_tipo.Text).QuotedString, ed_cod_empresa.Text]));

    memoJsonEncode.Lines.Text := TJson.ObjectToJsonString( Aped, [joDateIsUTC, joDateFormatISO8601, joIgnoreEmptyStrings, joIgnoreEmptyArrays] );
    memoJsonFormat.Lines.Text := TJson.Format( TJson.ObjectToJsonObject(Aped) );

    PageControl1.ActivePage := tsSaida;

  finally
    FreeAndNil(Aped);
  end;
end;

procedure Tfrmdbtojson.BitBtn3Click(Sender: TObject);
var
  Apedvendaprod: TPedvenda_prod_classList;
  I: Integer;
  AobjetcList: TObjectList<TPedvenda_prod_class>;
begin
  Apedvendaprod := TPedvenda_prod_classList.Create;
  AobjetcList   := TObjectList<TPedvenda_prod_class>.Create();
  try
    Apedvendaprod.SetValuesFrom(Fcon.SqlOpen('select %s from pedvenda_prod where nped = %s and tipo = %s and cod_empresa = %s',
                                    [TPedvenda_prod_class.GetFieldsSql(),
                                     ed_nped.Text, string(ed_tipo.Text).QuotedString, ed_cod_empresa.Text]));


//    memoJsonEncode.Lines.Clear;
//    memoJsonFormat.Lines.Clear;
    for I := 0 to Apedvendaprod.Count - 1 do
      AobjetcList.Add(Apedvendaprod.Items[I]);//[I] := Apedvendaprod.Items[I];
//    begin
      memoJsonEncode.Lines.Text := TJson.ObjectToJsonString( AobjetcList, [joDateIsUTC, joDateFormatISO8601, joIgnoreEmptyStrings, joIgnoreEmptyArrays] );
      memoJsonFormat.Lines.Text := TJson.Format( TJson.ObjectToJsonObject(AobjetcList) );
//    end;

    PageControl1.ActivePage := tsSaida;

  finally
    FreeAndNil(Apedvendaprod);
  end;
end;

procedure Tfrmdbtojson.ed_dbExit(Sender: TObject);
begin
  Fcon.desconectar;
  Fcon.conectar(ed_db.Text, True);
end;

procedure Tfrmdbtojson.FormCreate(Sender: TObject);
begin
  Fcon := TConexao.Create;
end;

procedure Tfrmdbtojson.FormDestroy(Sender: TObject);
begin
  Fcon.desconectar;
  FreeAndNil(Fcon);
end;

procedure Tfrmdbtojson.FormShow(Sender: TObject);
begin
  ed_dbExit(ed_db);
end;

end.
