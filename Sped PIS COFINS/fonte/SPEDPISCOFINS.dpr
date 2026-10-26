library SPEDPISCOFINS;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

{%File 'SPEDPISCOFINS_INFO.txt'}

uses
  SysUtils,
  Classes,
  Forms,
  StdCtrls,
  ComCtrls,
  uClassesSpedPISCOFINS in 'uClassesSpedPISCOFINS.pas',
  uSpedHw in '..\..\Sped Fiscal\fonte\uSpedHw.pas',
  uFormDefinirPISCOFINSCP in 'uFormDefinirPISCOFINSCP.pas' {frmDefinirPISCOFINSCP},
  uFormSpedPISCOFINS in 'uFormSpedPISCOFINS.pas' {frmSpedPISCOFINS},
  ACBRSpedPISCOFINSUtilHw in 'ACBRSpedPISCOFINSUtilHw.pas',
  uCreditosPISCOFINS in 'uCreditosPISCOFINS.pas' {frmCreditoPISCOFNS},
  uHistCreditosPISCOFINS in 'uHistCreditosPISCOFINS.pas' {frmHistCreditosPISCOFINS},
  uRetencoesPISCOFINS in 'uRetencoesPISCOFINS.pas' {frmRetencoesPISCOFINS},
  uHistRetencoesPISCOFINS in 'uHistRetencoesPISCOFINS.pas' {frmHistRetencoesPISCOFINS},
  uDemostrativoCredRetPISCOFINS in 'uDemostrativoCredRetPISCOFINS.pas' {frmDemostrativoCredRetPISCOFINS};

procedure closeallAuditoria ;stdcall; external 'auditoria.dll';

{$R *.res}

function gerarSPEDPISCOFINS(pEnderecoBanco: PChar; pCNPJ: PChar; pUsuario: PChar; pCodEmpresa: PChar; pNivel: PChar): longbool; stdcall;
var
  vSped: TSpedPISCOFINS;
begin
  vDadosIniSPED :=  TSingleton.GetInstance;
  vDadosIniSPED.vNomeUsuario := string(pUsuario);
  vDadosIniSPED.vCodEmpresa := string(pCodEmpresa);
  vDadosIniSPED.vNivel := StrToIntDef(string(pNivel), 1);
  try
    vSped.abreFormSPEDPISCOFINS(string(pEnderecoBanco), string(pCNPJ));
  finally
    closeallAuditoria;
  end;
end;

function definirPISCOFINSCuponsPorPeriodo(pCodEmpresa, pEndereco, pDataIni, pDataFim: PChar): Boolean; stdcall;
var
  vSped:TSpedPISCOFINS;
begin
  vSped := TSpedPISCOFINS.create;
  try
    Application.CreateForm(TfrmDefinirPISCOFINSCP, frmDefinirPISCOFINSCP);
  Application.CreateForm(TfrmSpedPISCOFINS, frmSpedPISCOFINS);
  Application.CreateForm(TfrmCreditoPISCOFNS, frmCreditoPISCOFNS);
  Application.CreateForm(TfrmHistCreditosPISCOFINS, frmHistCreditosPISCOFINS);
  Application.CreateForm(TfrmRetencoesPISCOFINS, frmRetencoesPISCOFINS);
  Application.CreateForm(TfrmHistRetencoesPISCOFINS, frmHistRetencoesPISCOFINS);
  Application.CreateForm(TfrmDemostrativoCredRetPISCOFINS, frmDemostrativoCredRetPISCOFINS);
  //  Application.CreateForm(TFrmPesqPros, FrmPesqPros);
  frmDefinirPISCOFINSCP.Show;

    vSped.EnderecoBanco := string(pEndereco);
    vSped.DataIni := string(pDataIni);
    vSped.DataFim := string(pDataFim);
    vSped.FLabelStatus := TLabel(frmDefinirPISCOFINSCP.lblStatus);
//    vSped.FLabelBloco := TLabel(lbBloco);
//    vSped.FLabelCupons := TLabel(lbCupons);
//    vSped.FLabelEmpresas:= TLabel(lbEmpresa);
//    vSped.FProgressBar := TProgressBar(ProgressBar1);
    vSped.FProgressBar2 := TProgressBar(frmDefinirPISCOFINSCP.ProgressBar1);
//    vSped.FMemoLog := TMemo(Memo1);
    Result := vSped.verificarPISCOFINSCupons(string(pCodEmpresa), frmDefinirPISCOFINSCP.lbl1 );

    frmDefinirPISCOFINSCP.Free;
    frmDefinirPISCOFINSCP := nil;

  finally

    vSped.Free;
    vSped := nil;
  end;
  
end;

function definirPISCOFINSCuponsPorPeriodoPorECF(pCodEmpresa, pEndereco, pDataIni, pDataFim, pNumSerieECF, pCodTerminal: PChar): Boolean; stdcall;
var
  vSped:TSpedPISCOFINS;
begin
  vSped := TSpedPISCOFINS.create;
  try
    Application.CreateForm(TfrmDefinirPISCOFINSCP, frmDefinirPISCOFINSCP);
    frmDefinirPISCOFINSCP.Show;

    vSped.EnderecoBanco := string(pEndereco);
    vSped.DataIni := string(pDataIni);
    vSped.DataFim := string(pDataFim);
    vSped.FLabelStatus := TLabel(frmDefinirPISCOFINSCP.lblStatus);

    vSped.FProgressBar2 := TProgressBar(frmDefinirPISCOFINSCP.ProgressBar1);

    Result := vSped.verificarPISCOFINSCupons(string(pCodEmpresa), string(pNumSerieECF),
      StrToInt(string(pCodTerminal)), frmDefinirPISCOFINSCP.lbl1 );

    frmDefinirPISCOFINSCP.Free;
    frmDefinirPISCOFINSCP := nil;

  finally
    vSped.Free;
    vSped := nil;
  end;

end;

exports
  gerarSPEDPISCOFINS, definirPISCOFINSCuponsPorPeriodo, definirPISCOFINSCuponsPorPeriodoPorECF;

begin
end.
