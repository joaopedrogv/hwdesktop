unit uRelIndTecGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, QuickRpt, ExtCtrls, DB, DBClient, uClasseConexao,
  IBCustomDataSet, IBQuery, QRCtrls, qrpctrls, IBDatabase;

type

  TReldIndTecGrade = class(TConexao)
  private
    Fac: TIBQuery;
    Fac_est: TIBQuery;
    Fmp_est: TIBQuery;
    Fmp: TIBQuery;
    Fclient: TDataSet;
    Festdisp: Double;
    Festfis: Double;
    Festpend: Double;
    Fstarted: Boolean;
    FBeforeStart: TNotifyEvent;
    procedure AfterScroll_ac(DataSet: TDataSet);
    procedure AfterScroll_mp(DataSet: TDataSet);
  public
    constructor Create(AdataBase: TIBDatabase);
    destructor Destroy; override;

    procedure executar; overload;
    procedure executar(AdataSet: TDataSet); overload;

    procedure SetItemAcabado_e_Estoque(var Aest, Apend, Adisp: Double);
    procedure SetItemMpInsumo_e_Estoque(var Aest, Apend, Adisp: Double);
    
    property ac: TIBQuery read Fac write Fac;
    property ac_est: TIBQuery read Fac_est write Fac_est;
    property mp: TIBQuery read Fmp write Fmp;
    property mp_est: TIBQuery read Fmp_est write Fmp_est;

    property estfis : Double read Festfis  write Festfis;
    property estpend: Double read Festpend write Festpend;
    property estdisp: Double read Festdisp write Festdisp;

    property started: Boolean read Fstarted write Fstarted;

    property BeforeStart: TNotifyEvent read FBeforeStart write FBeforeStart;

  end;

  TfrmRelIndTecGrade = class(TForm)
    prod_a: TClientDataSet;
    prod_aid: TIntegerField;
    prod_anome: TStringField;
    prod_aestoque: TFloatField;
    ClientDataSet1: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    ClientDataSet2: TClientDataSet;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    ClientDataSet3: TClientDataSet;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    FloatField3: TFloatField;
    QuickRep1: TQuickRep;
    detail_ac: TQRBand;
    sub_ac_est: TQRSubDetail;
    sub_mp: TQRSubDetail;
    BitBtn1: TBitBtn;
    ac_num_fab: TQRDBText;
    ac_descr_prod: TQRDBText;
    sub_mp_est: TQRSubDetail;
    ac_est_descricao: TQRDBText;
    ac_est_estf: TQRDBText;
    mp_num_fab: TQRDBText;
    mp_descr_prod: TQRDBText;
    mp_est_descricao: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    lbEmpresa: TQRLabel;
    QRPLabel1: TQRPLabel;
    QRLabel32: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel37: TQRLabel;
    QRSysData9: TQRSysData;
    QRShape3: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel80: TQRLabel;
    ac_loc1: TQRDBText;
    ac_loc2: TQRDBText;
    ac_unidade: TQRDBText;
    QRLabel58: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    ac_disp: TQRLabel;
    ac_est_pend: TQRDBText;
    mp_loc1: TQRDBText;
    mp_loc2: TQRDBText;
    mp_quant: TQRDBText;
    mp_unidade: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    ac_pend: TQRLabel;
    ac_estf: TQRLabel;
    ac_est_disp: TQRDBText;
    mp_estf: TQRLabel;
    mp_pend: TQRLabel;
    mp_disp: TQRLabel;
    QRShape1: TQRShape;
    QRSubDetail1: TQRSubDetail;
    qtde_mp: TQRLabel;
    PageFooterBand1: TQRBand;
    total_ac: TQRLabel;
    tot_estf: TQRLabel;
    tot_pend: TQRLabel;
    tot_disp: TQRLabel;
    mp_est_descr: TQRLabel;
    mp_est_estf: TQRLabel;
    mp_est_pend: TQRLabel;
    mp_est_disp: TQRLabel;
    procedure mp_est_dispPrint(sender: TObject; var Value: string);
    procedure mp_est_pendPrint(sender: TObject; var Value: string);
    procedure mp_est_estfPrint(sender: TObject; var Value: string);
    procedure mp_est_descrPrint(sender: TObject; var Value: string);
    procedure mp_est_descricaoPrint(sender: TObject; var Value: string);
    procedure QuickRep1Preview(Sender: TObject);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sub_mpBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure sub_mp_estBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure detail_acBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure sub_ac_estBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FrelIndTecGrade: TReldIndTecGrade;
    procedure before_start(Sender: TObject);
  public
    { Public declarations }

    property relIndTecGrade: TReldIndTecGrade read FrelIndTecGrade write FrelIndTecGrade;
  end;

var
  frmRelIndTecGrade: TfrmRelIndTecGrade;


implementation

uses
  Math, StrUtils, uDtmAtivo, uDadosIni;

{$R *.dfm}

{ TReldIndTecGrade }

procedure TReldIndTecGrade.AfterScroll_ac(DataSet: TDataSet);
begin
  if (not DataSet.Active) or (DataSet.IsEmpty) then
    Exit;

  SqlOpen('select gr.*,cgp.*, est.*, (coalesce(est.pend_reqos, 0) +coalesce(est.pend_pdc, 0) + coalesce(est.pend_almox, 0)) est_pend from cod_grade_prod cgp' +
          ' inner join grade gr on gr.cod_grade = cgp.cod_grade and gr.cod_empresa = cgp.cod_empresa' +
          ' left join getestoquedisponivel(cgp.grupo_prod, cgp.cod_prod, cgp.cod_grade, cgp.cod_empresa, 0, '''', 0, 0) est on 1=1' +
          ' where cgp.grupo_prod = %d and cgp.cod_prod = %s and cgp.cod_empresa = %d AND cgp.qtde <> 0',
          [DataSet.FieldByName('grupo_prod').AsInteger,
           QuotedStr(Trim(DataSet.FieldByName('cod_prod').AsString)),
           DataSet.FieldByName('cod_empresa').AsInteger], ac_est);

  SqlOpen('select pr.num_fab_prod, pr.descr_prod, pr.grupo_prod, pr.cod_prod, pr.cod_empresa,' +
          ' pr.locacao_prod, pr.locacao_prod_1, pr.unidade, pr.est_f,' +
          ' it.quant, est.*, (coalesce(est.pend_reqos, 0) +coalesce(est.pend_pdc, 0) + coalesce(est.pend_almox, 0)) est_pend' +
          ' from indice_tecnico it' +
          ' inner join produtos pr on (pr.grupo_prod = it.grupo_prod_mprima)' +
          '   and (pr.cod_prod = it.cod_prod_mprima) and (pr.cod_empresa = it.cod_empresa)' +
          ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1=1' +
          ' and (pr.cod_empresa = it.cod_empresa)' +
          ' where it.grupo_prod_acabado = %d and it.cod_prod_acabado = %s and it.cod_empresa = %d',
          [DataSet.FieldByName('grupo_prod').AsInteger,
           QuotedStr(Trim(DataSet.FieldByName('cod_prod').AsString)),
           DataSet.FieldByName('cod_empresa').AsInteger], mp);
end;

procedure TReldIndTecGrade.AfterScroll_mp(DataSet: TDataSet);
begin
  if (not DataSet.Active) or (DataSet.IsEmpty) then
    Exit;

  SqlOpen('select gr.*,cgp.*, est.*, (coalesce(est.pend_reqos, 0) +coalesce(est.pend_pdc, 0) + coalesce(est.pend_almox, 0)) est_pend from cod_grade_prod cgp' +
          ' inner join grade gr on gr.cod_grade = cgp.cod_grade and gr.cod_empresa = cgp.cod_empresa' +
          ' left join getestoquedisponivel(cgp.grupo_prod, cgp.cod_prod, cgp.cod_grade, cgp.cod_empresa, 0, '''', 0, 0) est on 1=1' +
          ' where cgp.grupo_prod = %d and cgp.cod_prod = %s and cgp.cod_empresa = %d and cgp.qtde <> 0',
          [DataSet.FieldByName('grupo_prod').AsInteger,
           QuotedStr(Trim(DataSet.FieldByName('cod_prod').AsString)),
           DataSet.FieldByName('cod_empresa').AsInteger], mp_est);
end;

constructor TReldIndTecGrade.Create(AdataBase: TIBDatabase);
begin
  inherited Create(AdataBase);;
  Fac := TIBQuery.Create(Banco.Owner);
  Fac.Transaction := Transacao;

  Fac_est := TIBQuery.Create(Banco.Owner);
  Fac_est.Transaction := Transacao;

  Fmp := TIBQuery.Create(Banco.Owner);
  Fmp.Transaction := Transacao;

  Fmp_est := TIBQuery.Create(Banco.Owner);
  Fmp_est.Transaction := Transacao;
end;

destructor TReldIndTecGrade.Destroy;
begin
  FreeAndNil(Fac);
  FreeAndNil(Fac_est);
  FreeAndNil(Fmp);
  FreeAndNil(Fmp_est);

  inherited;
end;

procedure TReldIndTecGrade.executar(AdataSet: TDataSet);
var
  Aerro: string;
  I: Integer;
begin
  try
    if Assigned(BeforeStart) then
      FBeforeStart(Self);

    Fclient := AdataSet;
    ac.AfterScroll := AfterScroll_ac;
    mp.AfterScroll := AfterScroll_mp;

    QrAux.Close;
    I := 0;
    Fclient.First;
    while not Fclient.Eof do
    begin
      if I = 0  then
      begin
        QrAux.SQL.Clear;
        QrAux.SQL.Add('execute block as begin');
      end;

      QrAux.SQL.Add(Format('insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (%s, %d, %d, %s);',
                           [QuotedStr('INDTEC'),
                            Fclient.FieldByName('cod_empresa').AsInteger,
                            Fclient.FieldByName('grupo_prod').AsInteger,
                            QuotedStr(Fclient.FieldByName('cod_prod').AsString)]));
      I := I + 1;
      if I >= 255 then
      begin
        QrAux.SQL.Add('end;');
        QrAux.ExecSQL;
        I := 0;
      end;
      Fclient.Next;
    end;
    QrAux.SQL.Add('end;');

    if I > 0 then
      QrAux.ExecSQL;


    SqlOpen('select pr.num_fab_prod, pr.descr_prod, pr.grupo_prod, pr.cod_prod, pr.cod_empresa, pr.locacao_prod, pr.locacao_prod_1, pr.unidade,' +
            ' est.*, (coalesce(est.pend_reqos, 0) +coalesce(est.pend_pdc, 0) + coalesce(est.pend_almox, 0)) est_pend' +
            ' from produtos_tmp pt' +
            ' inner join produtos pr on pr.grupo_prod = pt.grupo_prod and pr.cod_prod = pt.cod_prod and pr.cod_empresa = pt.cod_empresa' +
            ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1=1' +
            ' where pt.id_tmp = ''INDTEC'' and pt.cod_empresa = %s', [vDadosIni.codEmpresa], ac );
    Fclient := ac;

    Festfis  := 0;
    Festpend := 0;
    Festdisp := 0;
    Fstarted := True;

  finally
  end;
end;

procedure TReldIndTecGrade.SetItemAcabado_e_Estoque(var Aest, Apend, Adisp: Double);
begin
  if Fac_est.IsEmpty then
  begin
    Aest  := Fac.FieldByName('est_f').AsFloat;
    Apend := Fac.FieldByName('est_pend').AsFloat;
    Adisp := Fac.FieldByName('estoque').AsFloat;
  end
  else
  begin
    Aest  := 0;
    Apend := 0;
    Adisp := 0;

    Fac_est.First;
    while not Fac_est.Eof do
    begin
      Aest  := Aest  + Fac_est.FieldByName('est_f').AsFloat;
      Apend := Apend + Fac_est.FieldByName('est_pend').AsFloat;
      Adisp := Adisp + Fac_est.FieldByName('estoque').AsFloat;

      Fac_est.Next;
    end;
    Fac_est.First;
  end;

  if started then
  begin
    Festfis  := Festfis  + Aest;
    Festpend := Festpend + Apend;
    Festdisp := Festdisp + Adisp;
  end;

end;

procedure TReldIndTecGrade.SetItemMpInsumo_e_Estoque(var Aest, Apend, Adisp: Double);
begin
  if Fmp_est.IsEmpty then
  begin
    Aest  := Fmp.FieldByName('est_f').AsFloat;
    Apend := Fmp.FieldByName('est_pend').AsFloat;
    Adisp := Fmp.FieldByName('estoque').AsFloat;
  end
  else
  begin
    Aest  := 0;
    Apend := 0;
    Adisp := 0;

    Fmp_est.First;
    while not Fmp_est.Eof do
    begin
      Aest  := Aest  + Fmp_est.FieldByName('est_f').AsFloat;
      Apend := Apend + Fmp_est.FieldByName('est_pend').AsFloat;
      Adisp := Adisp + Fmp_est.FieldByName('estoque').AsFloat;

      Fmp_est.Next;
    end;
    Fmp_est.First;
  end;
end;

procedure TReldIndTecGrade.executar;
var
  Aerro: string;
begin
  if not Banco.Connected then
    conectar('joaopedro-pc:D:\Hw\bases\producao\Hwauto.fdb', 'sysdba', 'masterkey', Aerro);
  try
    if Assigned(BeforeStart) then
      FBeforeStart(Self);

    ac.AfterScroll := AfterScroll_ac;
    mp.AfterScroll := AfterScroll_mp;

    SqlExec('execute block' +
            ' as' +
            ' begin' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 12, ''18502'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 13, ''18503'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 01, ''16656'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 01, ''15568'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 01, ''13840'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 01, ''13842'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 01, ''17472'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 01, ''18454'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 01, ''18459'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 01, ''18460'');' +
            '   insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod) values (''INDTEC'', 1, 01, ''17988'');' +
            ' end;');

    SqlOpen('select pr.num_fab_prod, pr.descr_prod, pr.grupo_prod, pr.cod_prod, pr.cod_empresa, pr.locacao_prod, pr.locacao_prod_1, pr.unidade,' +
            ' est.*, (coalesce(est.pend_reqos, 0) +coalesce(est.pend_pdc, 0) + coalesce(est.pend_almox, 0)) est_pend' +
            ' from produtos_tmp pt' +
            ' inner join produtos pr on pr.grupo_prod = pt.grupo_prod and pr.cod_prod = pt.cod_prod and pr.cod_empresa = pt.cod_empresa' +
            ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1=1' +
            ' where pt.id_tmp = ''INDTEC'' and pt.cod_empresa = 1', ac);
    Fclient := ac;

    Festfis  := 0;
    Festpend := 0;
    Festdisp := 0;
    Fstarted := True;

  finally
    //desconectar;
  end;
end;

{ TfrmRelIndTecGrade }

procedure TfrmRelIndTecGrade.BitBtn1Click(Sender: TObject);
begin
  if not Assigned(FrelIndTecGrade) then
    FrelIndTecGrade := TReldIndTecGrade.Create(dtmAtivo.bancoHw);

  try
    FrelIndTecGrade.Executar;

    QuickRep1.Preview;

  finally
    FrelIndTecGrade.desconectar;
    FreeAndNil(FrelIndTecGrade);
  end;
end;

procedure TfrmRelIndTecGrade.ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;  
end;

procedure TfrmRelIndTecGrade.detail_acBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Aest, Apend, Adisp: Double;
begin
  FrelIndTecGrade.SetItemAcabado_e_Estoque(Aest, Apend, Adisp);
  ac_estf.Caption := Format('%0.2n', [Aest]);
  ac_pend.Caption := Format('%0.2n', [Apend]);
  ac_disp.Caption := Format('%0.2n', [Adisp]);

  if FrelIndTecGrade.ac_est.IsEmpty and FrelIndTecGrade.mp.IsEmpty then 
  begin
    ac_num_fab.Font.Style    := ac_num_fab.Font.Style    - [fsBold];
    ac_descr_prod.Font.Style := ac_descr_prod.Font.Style - [fsBold];
    ac_loc1.Font.Style       := ac_loc1.Font.Style       - [fsBold];
    ac_loc2.Font.Style       := ac_loc2.Font.Style       - [fsBold];
    ac_unidade.Font.Style    := ac_unidade.Font.Style    - [fsBold];
    ac_estf.Font.Style       := ac_estf.Font.Style       - [fsBold];
    ac_pend.Font.Style       := ac_pend.Font.Style       - [fsBold];
    ac_disp.Font.Style       := ac_disp.Font.Style       - [fsBold];
  end
  else
  begin
    ac_num_fab.Font.Style    := ac_num_fab.Font.Style    + [fsBold];
    ac_descr_prod.Font.Style := ac_descr_prod.Font.Style + [fsBold];
    ac_loc1.Font.Style       := ac_loc1.Font.Style       + [fsBold];
    ac_loc2.Font.Style       := ac_loc2.Font.Style       + [fsBold];
    ac_unidade.Font.Style    := ac_unidade.Font.Style    + [fsBold];
    ac_estf.Font.Style       := ac_estf.Font.Style       + [fsBold];
    ac_pend.Font.Style       := ac_pend.Font.Style       + [fsBold];
    ac_disp.Font.Style       := ac_disp.Font.Style       + [fsBold];
  end;
end;

procedure TfrmRelIndTecGrade.FormCreate(Sender: TObject);
begin
  FrelIndTecGrade := TReldIndTecGrade.Create(dtmAtivo.bancoHw);
  FrelIndTecGrade.BeforeStart := before_start;
end;

procedure TfrmRelIndTecGrade.FormShow(Sender: TObject);
begin
//  BitBtn1.Click;
end;

procedure TfrmRelIndTecGrade.mp_est_descricaoPrint(sender: TObject;
  var Value: string);
begin
//  vDadosIni.ShowAtencao(FrelIndTecGrade.mp_est.FieldByName('descricao').AsString);
//  QRLabel6.Caption := FrelIndTecGrade.mp_est.FieldByName('descricao').AsString;
  Value := '';
end;

procedure TfrmRelIndTecGrade.mp_est_descrPrint(sender: TObject;
  var Value: string);
begin
  Value := FrelIndTecGrade.mp_est.FieldByName('descricao').AsString
end;

procedure TfrmRelIndTecGrade.mp_est_dispPrint(sender: TObject;
  var Value: string);
begin
  Value := Format('%0.2n', [FrelIndTecGrade.mp_est.FieldByName('estoque').AsFloat]);
end;

procedure TfrmRelIndTecGrade.mp_est_estfPrint(sender: TObject;
  var Value: string);
begin
  Value := Format('%0.2n', [FrelIndTecGrade.mp_est.FieldByName('est_f').AsFloat]);
end;

procedure TfrmRelIndTecGrade.mp_est_pendPrint(sender: TObject;
  var Value: string);
begin
  Value := Format('%0.2n', [FrelIndTecGrade.mp_est.FieldByName('est_pend').AsFloat]);
end;

procedure TfrmRelIndTecGrade.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  FrelIndTecGrade.started := False;
  tot_estf.Caption := Format('%0.2n', [FrelIndTecGrade.estfis]);
  tot_pend.Caption := Format('%0.2n', [FrelIndTecGrade.estpend]);
  tot_disp.Caption := Format('%0.2n', [FrelIndTecGrade.estdisp]);
end;

procedure TfrmRelIndTecGrade.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := FrelIndTecGrade.mp.RecordCount > 0;
  if PrintBand then
    qtde_mp.Caption := 'Quantidade de matérias primas / insumos do produto: ' + IntToStr(FrelIndTecGrade.mp.RecordCount);
end;

procedure TfrmRelIndTecGrade.QuickRep1Preview(Sender: TObject);
begin
  vDadosIni.VisualizaRelQrp(Sender, QuickRep1.ReportTitle);
end;

procedure TfrmRelIndTecGrade.before_start(Sender: TObject);
begin
  QuickRep1.DataSet        := FrelIndTecGrade.ac;
  sub_ac_est.DataSet       := FrelIndTecGrade.ac_est;
  sub_mp.DataSet           := FrelIndTecGrade.mp;
  sub_mp_est.DataSet       := FrelIndTecGrade.mp_est;

  ac_num_fab.DataSet       := FrelIndTecGrade.ac;
  ac_descr_prod.DataSet    := FrelIndTecGrade.ac;
  ac_unidade.DataSet       := FrelIndTecGrade.ac;
  ac_loc1.DataSet          := FrelIndTecGrade.ac;
  ac_loc2.DataSet          := FrelIndTecGrade.ac;

  ac_est_descricao.DataSet := FrelIndTecGrade.ac_est;
  ac_est_estf.DataSet      := FrelIndTecGrade.ac_est;
  ac_est_pend.DataSet      := FrelIndTecGrade.ac_est;
  ac_est_disp.DataSet      := FrelIndTecGrade.ac_est;

  mp_num_fab.DataSet       := FrelIndTecGrade.mp;
  mp_descr_prod.DataSet    := FrelIndTecGrade.mp;
  mp_loc1.DataSet          := FrelIndTecGrade.mp;
  mp_loc2.DataSet          := FrelIndTecGrade.mp;
  mp_quant.DataSet         := FrelIndTecGrade.mp;
  mp_unidade.DataSet       := FrelIndTecGrade.mp;

  mp_est_descricao.DataSet := FrelIndTecGrade.mp_est;
//  mp_est_estf.DataSet      := FrelIndTecGrade.mp_est;
//  mp_est_pend.DataSet      := FrelIndTecGrade.mp_est;
//  mp_est_disp.DataSet      := FrelIndTecGrade.mp_est;
end;

procedure TfrmRelIndTecGrade.sub_ac_estBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := not FrelIndTecGrade.ac_est.IsEmpty;
end;

procedure TfrmRelIndTecGrade.sub_mpBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);                 
var
  Aest, Apend, Adisp: Double;
begin
  PrintBand := FrelIndTecGrade.mp.RecordCount > 0;
  if not PrintBand then
    Exit;

  if FrelIndTecGrade.mp_est.IsEmpty then
  begin
    mp_num_fab.Font.Style    := mp_num_fab.Font.Style    - [fsBold];
    mp_quant.Font.Style      := mp_quant.Font.Style      - [fsBold];
    mp_descr_prod.Font.Style := mp_descr_prod.Font.Style - [fsBold];
    mp_loc1.Font.Style       := mp_loc1.Font.Style       - [fsBold];
    mp_loc2.Font.Style       := mp_loc2.Font.Style       - [fsBold];
    mp_unidade.Font.Style    := mp_unidade.Font.Style    - [fsBold];
    mp_estf.Font.Style       := mp_estf.Font.Style       - [fsBold];
    mp_pend.Font.Style       := mp_pend.Font.Style       - [fsBold];
    mp_disp.Font.Style       := mp_disp.Font.Style       - [fsBold];
  end
  else
  begin
    mp_num_fab.Font.Style    := mp_num_fab.Font.Style    + [fsBold];
    mp_quant.Font.Style      := mp_quant.Font.Style      + [fsBold];
    mp_descr_prod.Font.Style := mp_descr_prod.Font.Style + [fsBold];
    mp_loc1.Font.Style       := mp_loc1.Font.Style       + [fsBold];
    mp_loc2.Font.Style       := mp_loc2.Font.Style       + [fsBold];
    mp_unidade.Font.Style    := mp_unidade.Font.Style    + [fsBold];
    mp_estf.Font.Style       := mp_estf.Font.Style       + [fsBold];
    mp_pend.Font.Style       := mp_pend.Font.Style       + [fsBold];
    mp_disp.Font.Style       := mp_disp.Font.Style       + [fsBold];
  end;

  FrelIndTecGrade.SetItemMpInsumo_e_Estoque(Aest, Apend, Adisp);
  mp_estf.Caption := Format('%0.2n', [Aest]);
  mp_pend.Caption := Format('%0.2n', [Apend]);
  mp_disp.Caption := Format('%0.2n', [Adisp]);
end;

procedure TfrmRelIndTecGrade.sub_mp_estBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := not FrelIndTecGrade.mp_est.IsEmpty;

//  mp_descr_prod.Caption := FrelIndTecGrade.mp_est.FieldByName('descricao').AsString;
//  mp_est_estf.Caption   := Format('%0.2n', [FrelIndTecGrade.mp_est.FieldByName('est_f').AsFloat]);
//  mp_est_pend.Caption   := Format('%0.2n', [FrelIndTecGrade.mp_est.FieldByName('est_pend').AsFloat]);
//  mp_est_disp.Caption   := Format('%0.2n', [FrelIndTecGrade.mp_est.FieldByName('estoque').AsFloat]);

end;

end.
