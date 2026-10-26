unit uRetencoesPISCOFINS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, 
  uClassesSpedPISCOFINS, DB, DBClient;

type
  TfrmRetencoesPISCOFINS = class(TForm)
    Panel1: TPanel;
    groupGrid: TGroupBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    lbAno: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btOK: TBitBtn;
    pnConsulta: TPanel;
    pnButtCons: TPanel;
    btExcluirConsulta: TBitBtn;
    btNovoConsulta: TBitBtn;
    btAltConsulta: TBitBtn;
    btHistCons: TBitBtn;
    pnCadCons: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    btCancelConsulta: TBitBtn;
    btSaveConsulta: TBitBtn;
    pnApuracao: TPanel;
    DataSource1: TDataSource;
    procedure btHistConsClick(Sender: TObject);
    procedure pnCadConsExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btSaveConsultaClick(Sender: TObject);
    procedure btCancelConsultaClick(Sender: TObject);
    procedure btExcluirConsultaClick(Sender: TObject);
    procedure btAltConsultaClick(Sender: TObject);
    procedure btNovoConsultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fDataSet: TClientDataSet;
    procedure habilitacontroles(pCadastro: Boolean);
  public
    { Public declarations }
    SpedPC: TSpedPISCOFINS;
  end;

var
  frmRetencoesPISCOFINS: TfrmRetencoesPISCOFINS;

implementation

uses
  uSpedHw;

{$R *.dfm}

{ TfrmRetencoesPISCOFINS }

procedure TfrmRetencoesPISCOFINS.btNovoConsultaClick(Sender: TObject);
begin
  if not vDadosIniSPED.PesqPros('EFD006', 'INSERIR', '', 'SPED_CREDITOS_PERIODO', '', SpedPC.qrAux, True) then
    Exit;
  fDataSet.Append;
  fDataSet.FieldByName('tipo_situacao').AsString := 'N';
  habilitacontroles(True);
  if DBEdit6.CanFocus then
    DBEdit6.SetFocus;
end;

procedure TfrmRetencoesPISCOFINS.btAltConsultaClick(Sender: TObject);
begin
  if not vDadosIniSPED.PesqPros('EFD007', 'ALTERAR', 'PIS:' + fDataSet.FieldByName('VALOR_PIS').AsString +
    ' COFINS:' + fDataSet.FieldByName('VALOR_COFINS').AsString, 'SPED_CREDITOS_PERIODO',
    fDataSet.FieldByName('MES').AsString + '/' + fDataSet.FieldByName('ANO').AsString, SpedPC.qrAux, True) then
    Exit;
  fDataSet.Edit;
  fDataSet.FieldByName('tipo_situacao').AsString := 'A';
  habilitacontroles(True);
  if DBEdit1.CanFocus then
    DBEdit1.SetFocus;
end;

procedure TfrmRetencoesPISCOFINS.btCancelConsultaClick(Sender: TObject);
begin
  fDataSet.Cancel;
  habilitacontroles(False);
end;

procedure TfrmRetencoesPISCOFINS.btExcluirConsultaClick(Sender: TObject);
begin
  if fDataSet.IsEmpty then
    Exit;
  if not vDadosIniSPED.PesqPros('EFD009', 'EXCLUIR', 'PIS:' + fDataSet.FieldByName('VALOR_PIS').AsString +
    ' COFINS:' + fDataSet.FieldByName('VALOR_COFINS').AsString, 'SPED_CREDITOS_PERIODO',
    fDataSet.FieldByName('MES').AsString + '/' + fDataSet.FieldByName('ANO').AsString, SpedPC.qrAux, True) then
    Exit;
  fDataSet.Edit;
  fDataSet.FieldByName('tipo_situacao').AsString := 'E';
  SpedPC._validarRegistrarRetencaoPISCOFIS;
  habilitacontroles(False);
end;

procedure TfrmRetencoesPISCOFINS.btHistConsClick(Sender: TObject);
begin
  if fDataSet.IsEmpty then
    Exit;

  if not vDadosIniSPED.PesqPros('EFD005', 'CONSULTAR', 'PIS:' + fDataSet.FieldByName('VALOR_PIS').AsString +
    ' COFINS:' + fDataSet.FieldByName('VALOR_COFINS').AsString, 'SPED_CREDITOS_PERIODO_UTIL',
    fDataSet.FieldByName('MES').AsString + '/' + fDataSet.FieldByName('ANO').AsString, SpedPC.qrAux, True) then
    Exit;

  SpedPC._abreDetalhesRetencoesPISCOFINS;
end;

procedure TfrmRetencoesPISCOFINS.btSaveConsultaClick(Sender: TObject);
begin
  if not vDadosIniSPED.PesqPros('EFD008', 'SALVAR', 'PIS:' + fDataSet.FieldByName('VALOR_PIS').AsString +
    ' COFINS:' + fDataSet.FieldByName('VALOR_COFINS').AsString, 'SPED_CREDITOS_PERIODO',
    fDataSet.FieldByName('MES').AsString + '/' + fDataSet.FieldByName('ANO').AsString, SpedPC.qrAux, True) then
    Exit;

  if SpedPC._validarRegistrarRetencaoPISCOFIS then
  begin
    if fDataSet.FieldByName('ano').AsInteger <> lbAno.Tag then
    begin
      lbAno.Tag := fDataSet.FieldByName('ano').AsInteger;
      lbAno.Caption := IntToStr(lbAno.Tag); 
    end;
    
    habilitacontroles(False);
  end;
end;

procedure TfrmRetencoesPISCOFINS.FormShow(Sender: TObject);
begin
  fDataSet := TClientDataSet(DataSource1.DataSet);
  fDataSet.Cancel;
  habilitacontroles(False);
end;

procedure TfrmRetencoesPISCOFINS.habilitacontroles(pCadastro: Boolean);
procedure habControle(hab: Boolean; const pArgs: array of TWinControl);
  var
    I: Integer;
  begin
    for I := 0 to Length(pArgs) - 1 do try pArgs[i].Enabled := hab; except end;
  end;

  procedure visbControle(visb: Boolean; const pArgs: array of TWinControl);
  var
    I: Integer;
  begin
    for I := 0 to Length(pArgs) - 1 do try pArgs[i].Visible := visb; except end;
  end;

begin
  if pnConsulta.Visible then
  begin
    if pCadastro then
    begin
      habControle(True, [pnCadCons, btCancelConsulta, btSaveConsulta]);
      habControle(False, [pnButtCons, groupGrid, btOK, DBEdit3, DBEdit4]);
      if fDataSet.FieldByName('tipo_situacao').AsString = 'N' then
        habControle(True, [DBEdit1, DBEdit2, DBEdit5, DBEdit6])
      else
      begin
        habControle(True, [DBEdit1, DBEdit2]);
        habControle(False, [DBEdit3, DBEdit4, DBEdit5, DBEdit6]);
      end;
    end
    else
    begin
      habControle(True, [pnButtCons, groupGrid, btOK, DBEdit1, DBEdit2, DBEdit3, DBEdit4, DBEdit5, DBEdit6]);
      habControle(False, [pnCadCons, btCancelConsulta, btSaveConsulta]);
    end;
  end
  else
  begin
  end;
end;

procedure TfrmRetencoesPISCOFINS.pnCadConsExit(Sender: TObject);
begin
  fDataSet.Cancel;
end;

procedure TfrmRetencoesPISCOFINS.SpeedButton3Click(Sender: TObject);
begin
  lbAno.Tag := lbAno.Tag - 1;
  lbAno.Caption := IntToStr(lbAno.Tag);
  SpedPC._verificarRetencoesPISCOFINS(False, 0, 0, lbAno.Tag);
end;

procedure TfrmRetencoesPISCOFINS.SpeedButton4Click(Sender: TObject);
begin
  lbAno.Tag := lbAno.Tag + 1;
  lbAno.Caption := IntToStr(lbAno.Tag);
  SpedPC._verificarRetencoesPISCOFINS(False, 0, 0, lbAno.Tag);
end;

end.
