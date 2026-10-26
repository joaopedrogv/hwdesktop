unit uHistRetencoesPISCOFINS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, 
  uClassesSpedPISCOFINS, DBClient, DB;

type
  TfrmHistRetencoesPISCOFINS = class(TForm)
    Panel1: TPanel;
    groupGrid: TGroupBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btOK: TBitBtn;
    pnConsulta: TPanel;
    pnButtCons: TPanel;
    btExcluirConsulta: TBitBtn;
    btNovoConsulta: TBitBtn;
    btAltConsulta: TBitBtn;
    pnCadCons: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    btCancelConsulta: TBitBtn;
    btSaveConsulta: TBitBtn;
    DataSource1: TDataSource;
    procedure btSaveConsultaClick(Sender: TObject);
    procedure btCancelConsultaClick(Sender: TObject);
    procedure btExcluirConsultaClick(Sender: TObject);
    procedure btAltConsultaClick(Sender: TObject);
    procedure btNovoConsultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SpedPC: TSpedPISCOFINS;
    fDataSet, fDataSetP: TClientDataSet;
    procedure habilitacontroles(pCadastro: Boolean);
  end;

var
  frmHistRetencoesPISCOFINS: TfrmHistRetencoesPISCOFINS;

implementation

uses
  uSpedHw;

{$R *.dfm}

procedure TfrmHistRetencoesPISCOFINS.btAltConsultaClick(Sender: TObject);
begin
  if not vDadosIniSPED.PesqPros('EFD011', 'ALTERAR', 'PISUTIL:' + fDataSet.FieldByName('VALOR_PIS_UTIL').AsString +
    ' COFINSUTIL:' + fDataSet.FieldByName('VALOR_COFINS_UTIL').AsString, 'SPED_CREDITOS_PERIODO_UTIL',
    fDataSetP.FieldByName('MES').AsString + '/' + fDataSetP.FieldByName('ANO').AsString + '-' +
    fDataSet.FieldByName('MES_UTIL').AsString + '/' + fDataSet.FieldByName('ANO_UTIL').AsString, SpedPC.qrAux, True) then
    Exit;
  fDataSet.Edit;
  fDataSet.FieldByName('tipo_situacao').AsString := 'A';
  habilitacontroles(True);
  if DBEdit3.CanFocus then
    DBEdit3.SetFocus;
end;

procedure TfrmHistRetencoesPISCOFINS.btCancelConsultaClick(Sender: TObject);
begin
  fDataSet.Cancel;
  habilitacontroles(False);
end;

procedure TfrmHistRetencoesPISCOFINS.btExcluirConsultaClick(Sender: TObject);
begin
  if fDataSet.IsEmpty then
    Exit;
  
  if not vDadosIniSPED.PesqPros('EFD013', 'EXCLUIR', 'PISUTIL:' + fDataSet.FieldByName('VALOR_PIS_UTIL').AsString +
    ' COFINSUTIL:' + fDataSet.FieldByName('VALOR_COFINS_UTIL').AsString, 'SPED_CREDITOS_PERIODO_UTIL',
    fDataSetP.FieldByName('MES').AsString + '/' + fDataSetP.FieldByName('ANO').AsString + '-' +
    fDataSet.FieldByName('MES_UTIL').AsString + '/' + fDataSet.FieldByName('ANO_UTIL').AsString, SpedPC.qrAux, True) then
  Exit;

  fDataSet.Edit;
  fDataSet.FieldByName('tipo_situacao').AsString := 'E';
  SpedPC._validarRegistrarHistoricoRetencoesPISCOFIS;
  habilitacontroles(False);
end;

procedure TfrmHistRetencoesPISCOFINS.btNovoConsultaClick(Sender: TObject);
begin
  if not vDadosIniSPED.PesqPros('EFD010', 'INSERIR', '', 'SPED_CREDITOS_PERIODO_UTIL', '', SpedPC.qrAux, True) then
    Exit;

  fDataSet.Append;
  fDataSet.FieldByName('tipo_situacao').AsString := 'N';
  habilitacontroles(True);
  if DBEdit6.CanFocus then
    DBEdit6.SetFocus;
end;

procedure TfrmHistRetencoesPISCOFINS.btSaveConsultaClick(Sender: TObject);
begin
  if not vDadosIniSPED.PesqPros('EFD012', 'SALVAR', 'PISUTIL:' + fDataSet.FieldByName('VALOR_PIS_UTIL').AsString +
    ' COFINSUTIL:' + fDataSet.FieldByName('VALOR_COFINS_UTIL').AsString, 'SPED_CREDITOS_PERIODO_UTIL',
    fDataSetP.FieldByName('MES').AsString + '/' + fDataSetP.FieldByName('ANO').AsString + '-' +
    fDataSet.FieldByName('MES_UTIL').AsString + '/' + fDataSet.FieldByName('ANO_UTIL').AsString, SpedPC.qrAux, True) then
  Exit;
  if SpedPC._validarRegistrarHistoricoRetencoesPISCOFIS then
    habilitacontroles(False);
end;

procedure TfrmHistRetencoesPISCOFINS.FormShow(Sender: TObject);
begin
  fDataSet := TClientDataSet(DataSource1.DataSet);
  fDataSet.Cancel;
  habilitacontroles(False);
end;

procedure TfrmHistRetencoesPISCOFINS.habilitacontroles(pCadastro: Boolean);
  procedure habControle(hab: Boolean; const pArgs: array of TWinControl);
  var
    I: Integer;
  begin
    for I := 0 to Length(pArgs) - 1 do try pArgs[i].Enabled := hab; except end;
  end;
begin
  if pCadastro then
  begin
    habControle(True, [pnCadCons, btCancelConsulta, btSaveConsulta]);
    habControle(False, [pnButtCons, groupGrid, btOK]);
    if fDataSet.FieldByName('tipo_situacao').AsString = 'N' then
      habControle(True, [DBEdit5, DBEdit6])
    else
    begin
      habControle(True, [DBEdit3, DBEdit4]);
      habControle(False, [DBEdit5, DBEdit6]);
    end;
  end
  else
  begin
    habControle(True, [pnButtCons, groupGrid, btOK, DBEdit3, DBEdit4, DBEdit5, DBEdit6]);
    habControle(False, [pnCadCons, btCancelConsulta, btSaveConsulta]);
  end;
end;

end.
