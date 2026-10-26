library SpedFiscal;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Controls,
  Forms,
  StdCtrls,
  ComCtrls,
  uFormSpedFiscal in 'uFormSpedFiscal.pas' {frmSpedFiscal},
  uClassesSpedFiscal in 'uClassesSpedFiscal.pas',
  uSpedHw in 'uSpedHw.pas',
  ACBRSpedFiscalUtilHw in 'ACBRSpedFiscalUtilHw.pas',
  UPesProsSPED in 'UPesProsSPED.pas' {FrmPesqProsSPED},
  uDiferencaE310entreE316 in 'uDiferencaE310entreE316.pas' {Form3};

procedure closeallAuditoria ;stdcall; external 'auditoria.dll';

{$R *.res}

function gerarSpedFiscal(pCodEmpresa, pEnderecoBanco, pUsuario, pNivel: PChar): longbool; stdcall;
var
	vSped: TSpedFiscal;
begin

  vDadosIniSPED :=  TSingleton.GetInstance;
  vDadosIniSPED.vNomeUsuario := string(pUsuario);
  vDadosIniSPED.vCodEmpresa := string(pCodEmpresa);
  vDadosIniSPED.vNivel := StrToIntDef(string(pNivel), 1);

  TRY
  	vSped.abreFormSpedFiscal(string(pCodEmpresa),string(pEnderecoBanco));
  finally
     closeallAuditoria;
  end;
end;

function gerarSpedFiscalPAFECF(pCodEmpresa, pEnderecoBanco, vDataIni, vDataFim, pNomeArquivo, pUsuario, pNivel: PChar): string; stdcall;
var
  vSped : TSpedFiscal;
begin

  vDadosIniSPED :=  TSingleton.GetInstance;
  vDadosIniSPED.vNomeUsuario := string(pUsuario);
  vDadosIniSPED.vCodEmpresa := string(pCodEmpresa);
  vDadosIniSPED.vNivel := StrToIntDef(string(pNivel), 1);

  Application.CreateForm(TfrmSpedFiscal, frmSpedFiscal);
  Application.CreateForm(TfrmSpedFiscal, frmSpedFiscal);
  Application.CreateForm(TFrmPesqProsSPED, FrmPesqProsSPED);
  //  Application.CreateForm(TFrmPesqPros, FrmPesqPros);
  try
    frmSpedFiscal.vCodEmpresa := pcodEmpresa;
    frmSpedFiscal.vEndBanco := pEnderecoBanco;

    vSped := TSpedFiscal.create;
    frmSpedFiscal.vTempoGasto := Now;
    frmSpedFiscal.Timer1.Enabled := True;
    try
      vSped.DataIni := vDataIni;
      vSped.DataFim := vDataFim;
      frmSpedFiscal.dtIni.Text := vSped.DataIni;
      frmSpedFiscal.dtFim.Text := vSped.DataFim;
      frmSpedFiscal.GroupBox3.Enabled := False;
      frmSpedFiscal.Panel1.Enabled := False;
      frmSpedFiscal.ckBlocoH.Checked := True;
			vSped.CodEmpresa:= pCodEmpresa;
			vSped.EnderecoBanco := pEnderecoBanco;
			vSped.Destino := pNomeArquivo;
      //ExtractFilePath(Application.ExeName)+'ArquivosDigitais\S'+
        //copy(StringReplace(vSped.DataIni,'/','',[rfReplaceAll]),3,6)+'.txt';

      frmSpedFiscal.edDestino.Text := vSped.Destino;
      vSped.DataInv := vSped.DataFim;
			frmSpedFiscal.dtInventario.Text := vSped.DataInv;
      vSped.Finalidade :=frmSpedFiscal.ComboBox1.Text;
      vSped.FLabelStatus := TLabel(frmSpedFiscal.lbStatus);
      vSped.FLabelBloco := TLabel(frmSpedFiscal.lbBloco);
      vSped.FLabelCupons := TLabel(frmSpedFiscal.lbCupons);
      vSped.FProgressBar := TProgressBar(frmSpedFiscal.ProgressBar1);
      vSped.FProgressBar2 := TProgressBar(frmSpedFiscal.ProgressBar2);

      vSped.vBloco0 := True;
      vSped.vBlocoC := True;
      vSped.vBlocoD := True;
      vSped.vBlocoE := True;
      vSped.vBlocoG := True;
      vSped.vBlocoH := True;
      vSped.vBloco1 := True;
      vSped.vBloco9 := True;

      frmSpedFiscal.dtIni.Text := vSped.DataIni;
      frmSpedFiscal.dtFim.Text := vSped.DataFim;

      frmSpedFiscal.Show;
      frmSpedFiscal.Refresh;

      vSped.iniciaSpedFiscal;
      Result := vSped.Destino;
    finally
      frmSpedFiscal.GroupBox3.Enabled := True;
      frmSpedFiscal.Panel1.Enabled := True;
      vSped.Free;
      frmSpedFiscal.Timer1.Enabled := False;
      frmSpedFiscal.lbTempo.Caption := 'Tempo Gasto: '+TimeToStr(Now - frmSpedFiscal.vTempoGasto);
      Application.MessageBox(pchar('Arquivo "SPED Fiscal Ato COTEPE ICMS 09/08: criado com sucesso'+ #13 +
        'O arquivo foi salvo em: ' + frmSpedFiscal.edDestino.Text),'Atenção',0+64);
      frmSpedFiscal.ProgressBar1.Position := 0;
      frmSpedFiscal.ProgressBar2.Position := 0;
    end;
  finally
    frmSpedFiscal.Free;
    frmSpedFiscal := nil;
  end;
end;

function verificarDadosTotalizadores(pCodEmpresa, pEnderecoBanco, vDataIni, vDataFim, pNSerieECF, pCodTerminal: PChar): string; stdcall;
var
	vSped: TSpedFiscal;
begin
	try
		vSped := TSpedFiscal.create;
		try
			vSped.DataIni := string(vDataIni);
			vSped.DataFim := string(vDataFim);
			vSped.CodEmpresa:= string(pCodEmpresa);
			vSped.EnderecoBanco := string(pEnderecoBanco);
			if vSped.conectarBanco then
				vSped.verificaCupomSemZ(string(pNSerieECF), StrToIntDef(string(pCodTerminal), 0));
		finally
			vSped.Free;
		end;
	except

	end;

end;

exports
	gerarSpedFiscal, gerarSpedFiscalPAFECF, verificarDadosTotalizadores;
end.
