library DLLConsGeral;

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
  forms,
  UConsGeral in 'UConsGeral.pas' {FrmConsGeral},
  UdtmConsGeral in 'UdtmConsGeral.pas' {DtmConsGeral: TDataModule},
  uPadrao in '..\..\uPadrao.pas' {frmPadrao},
  UClassesConsGeral in 'UClassesConsGeral.pas',
  UvincConsultaUsuario in 'UvincConsultaUsuario.pas' {FrmvincUsuario},
  uStatusProcessamento_2 in 'uStatusProcessamento_2.pas' {frmStatusProcessamento_2},
  UvisualizadorOLAP_2 in 'UvisualizadorOLAP_2.pas' {FrmVisualizaOlap_2};

{$R *.res}

procedure closeallAuditoria; stdcall; external 'auditoria.dll';

function PesquisaGeral(vtipo: Pchar; cod_empresa: Pchar; vendbanco: Pchar; vusu: Pchar; vcodus: Pchar): longbool; stdcall;
begin
  AMDI := False;
  DtmConsGeral := TDtmConsGeral.Create(nil);
  try
    Application.CreateForm(TFrmConsGeral, FrmConsGeral);

    Cadconsgeral := TRelConsGeral.create;
    Cadconsgeral.vendbanco := vendbanco;
    Cadconsgeral.conectaBanco;
    Cadconsgeral.cod_empresa := cod_empresa;
    Cadconsgeral.vusuario := vusu;
    Cadconsgeral.vcodus := strtoint(vcodus);
    FrmConsGeral.ShowModal;

  finally
    FreeAndNil(DtmConsGeral);
    closeallAuditoria;
  end;
end;

function PesquisaParametros(vpar: ArrayBi; cod_empresa: Pchar; vendbanco: Pchar; vusu: Pchar; vcodus: Pchar; vcodcnt: integer; titulo: Pchar): longbool; stdcall;
begin
  AMDI := False;
  DtmConsGeral := TDtmConsGeral.Create(nil);
  try
    Application.CreateForm(TfrmStatusProcessamento_2, frmStatusProcessamento_2);
    Cadconsgeral := TRelConsGeral.create;
    Cadconsgeral.vendbanco := vendbanco;
    Cadconsgeral.conectaBanco;
    Cadconsgeral.cod_empresa := cod_empresa;
    Cadconsgeral.vusuario := vusu;
    Cadconsgeral.vcodus := strtoint(vcodus);
    FrmConsGeral.ConsultaDireta(vcodcnt, vpar, pchar(titulo));
    FrmConsGeral.Close;
  finally
    FreeAndNil(DtmConsGeral);
    closeallAuditoria;
  end;
end;

exports
  PesquisaGeral,
  PesquisaParametros;

begin
end.

