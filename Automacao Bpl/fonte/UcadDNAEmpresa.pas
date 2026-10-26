unit UcadDNAEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Mask, Buttons, Grids,
  DBGrids, UClassesCadastrosBasicos; {,UClassesGestor;}

type
  TFrmcadDNAEmpresa = class(TfrmPadrao)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit2: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmcadDNAEmpresa: TFrmcadDNAEmpresa;
  caddepto: TDepart;
  cadapuracaoDep: TApuracaoDepto;

implementation

uses {UdtmGestorHw,} UDtmCadastrosBasicos, UDtmAtivo, DB;

{$R *.dfm}

procedure TFrmcadDNAEmpresa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  BitBtn1.Enabled := false;
  BitBtn2.Enabled := false;
  BitBtn3.Enabled := false;
  BitBtn4.Enabled := false;
  TabSheet1.TabVisible:=false;
  cadapuracaoDep.Insert;
  cadapuracaoDep.dataSet.fieldbyname('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
  PageControl1.ActivePage := TabSheet2;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
  	DBLookupComboBox1.SetFocus;
end;

procedure TFrmcadDNAEmpresa.BitBtn2Click(Sender: TObject);
begin
  inherited;
  BitBtn1.Enabled := false;
  BitBtn2.Enabled := false;
  BitBtn3.Enabled := false;
  BitBtn4.Enabled := false;
  TabSheet1.TabVisible:=false;
  cadapuracaoDep.Edit;
  PageControl1.ActivePage := TabSheet2;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
  	DBLookupComboBox1.SetFocus;
end;

procedure TFrmcadDNAEmpresa.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente apagar este registro de DNA da Empresa?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
  begin
    if cadapuracaoDep.Delete then
    begin
      cadapuracaoDep.Apply;
      cadapuracaoDep.CommitaTransacao;
    end;
  end;
end;

procedure TFrmcadDNAEmpresa.BitBtn4Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmcadDNAEmpresa.BitBtn5Click(Sender: TObject);
var
  vcf, vcmv, vocv: currency;
  vmes,vano,vdep: string;
begin
  inherited;
  vmes:=cadapuracaoDep.dataSet.FieldByName('MES').AsString;
  vano:=cadapuracaoDep.dataSet.FieldByName('ANO').AsString;
  vdep:=cadapuracaoDep.dataSet.FieldByName('COD_DEP').AsString;
  if not cadapuracaoDep.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
  end
  else
  begin
   cadapuracaoDep.buscas.Close;
   cadapuracaoDep.buscas.SQL.text := 'SELECT * FROM APURACAO_DEPTO WHERE cod_empresa =  ' + vDadosIni.codEmpresa +
    ' AND MES = ' + vmes + ' AND ANO = ' +
    vano+ ' AND COD_DEP = ' +vdep;
   cadapuracaoDep.buscas.Open;
   vcf := 0;
   vcmv := 0;
   vocv := 0;
   while not cadapuracaoDep.buscas.eof do
   begin
     if trim(cadapuracaoDep.buscas.FieldByName('TPDESP').AsString) = 'CF' then
       vcf := cadapuracaoDep.buscas.FieldByName('VALOR').AsCurrency;
     if trim(cadapuracaoDep.buscas.FieldByName('TPDESP').AsString) = 'CMV' then
       vcmv := cadapuracaoDep.buscas.FieldByName('VALOR').AsCurrency;
     if trim(cadapuracaoDep.buscas.FieldByName('TPDESP').AsString) = 'OCV' then
       vocv := cadapuracaoDep.buscas.FieldByName('VALOR').AsCurrency;
     cadapuracaoDep.buscas.Next;
   end;
   // fazer a porra do update
   cadapuracaoDep.buscas.Close;
   cadapuracaoDep.buscas.sql.text:='UPDATE APURACAO_DEPTO SET DNADEP = ''CF(' +
     vDadosIni.alndir(trim(Format('%n', [vcf])), 12) + ')+CMV(' +
     vDadosIni.alndir(trim(Format('%n', [vcmv])), 6) + '%F)+OCV(' +
     vDadosIni.alndir(trim(Format('%n', [vocv])), 6) + '%F)+L=F'' '+
     'WHERE cod_empresa =  ' + vDadosIni.codEmpresa +
    ' AND MES = ' + vmes + ' AND ANO = ' +
    vano+ ' AND COD_DEP = ' +vdep;
    cadapuracaoDep.buscas.ExecSQL;
    cadapuracaoDep.CommitaTransacao;
//   cadapuracaoDep.dataSet.FieldByName('DNADEP').AsString := 'CF(' +
//     vDadosIni.alndir(trim(Format('%n', [vcf])), 12) + ')+CMV(' +
//     vDadosIni.alndir(trim(Format('%n', [vcmv])), 6) + '%F)+OCV(' +
//     vDadosIni.alndir(trim(Format('%n', [vocv])), 6) + '%F)+L=F';
   cadapuracaoDep.buscas.Close;
//   cadapuracaoDep.Post;
//   cadapuracaoDep.CommitaTransacao;
    cadapuracaoDep.close;
    cadapuracaoDep.Open;
    cadapuracaoDep.last;
    PageControl1.ActivePage := TabSheet1;
    TabSheet1.TabVisible:=true;
    //  cadapuracaoDep.Apply;
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := true;
  end;
end;

procedure TFrmcadDNAEmpresa.BitBtn6Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.TabVisible:=true;
  cadapuracaoDep.Cancel;
  BitBtn1.Enabled := true;
  BitBtn2.Enabled := true;
  BitBtn3.Enabled := true;
  BitBtn4.Enabled := true;
end;

procedure TFrmcadDNAEmpresa.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox2.Text = 'CF' then
    Label13.Visible := false;
  if (DBComboBox2.Text = 'CMV') or (DBComboBox2.Text = 'OCV') or (DBComboBox2.Text = 'RAT') then
    Label13.Visible := true;
end;

procedure TFrmcadDNAEmpresa.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox2.Text = 'CF' then
  begin
    if cadapuracaoDep.dataSet.FieldByName('VALOR_FATURADO').AsCurrency <> 0 then
      cadapuracaoDep.dataSet.FieldByName('PERC_VALOR').AsCurrency :=
        (cadapuracaoDep.dataSet.FieldByName('VALOR').AsCurrency / cadapuracaoDep.dataSet.FieldByName('VALOR_FATURADO').AsCurrency) * 100;
    cadapuracaoDep.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency := cadapuracaoDep.dataSet.FieldByName('VALOR').AsCurrency;
  end;
  if (DBComboBox2.Text = 'CMV') or (DBComboBox2.Text = 'OCV') or (DBComboBox2.Text = 'RAT') then
  begin
    if cadapuracaoDep.dataSet.FieldByName('VALOR_FATURADO').AsCurrency <> 0 then
      cadapuracaoDep.dataSet.FieldByName('PERC_VALOR').AsCurrency := cadapuracaoDep.dataSet.FieldByName('VALOR').AsCurrency;
    cadapuracaoDep.dataSet.FieldByName('VALOR_DINHEIRO').AsCurrency := (cadapuracaoDep.dataSet.FieldByName('VALOR').AsCurrency / 100) *
      cadapuracaoDep.dataSet.FieldByName('VALOR_FATURADO').AsCurrency;
  end;
end;

procedure TFrmcadDNAEmpresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmcadDNAEmpresa := nil;
end;

procedure TFrmcadDNAEmpresa.FormShow(Sender: TObject);
begin
  inherited;
  caddepto := TDepart.create;
  caddepto.abreBase;
  cadapuracaoDep := TApuracaoDepto.create;
  cadapuracaoDep.abrebase;
  cadapuracaoDep.last;
  //TabSheet1.TabVisible:=false;
  PageControl1.ActivePage := TabSheet1;
  TabSheet2.TabVisible := false;
end;

end.

