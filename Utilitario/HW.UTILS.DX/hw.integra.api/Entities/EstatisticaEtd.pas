unit EstatisticaEtd;

interface

type

  TConfsEstatistica = class
  private
    FRegistroGeral: Boolean;
    FRegistroUsuarios: Boolean;
    FRegistroPersonalizado: Boolean;
    FEnviarGeral: Boolean;
    FEnvioUsuarios: Boolean;
    FEnvioPersonalizado: Boolean;
    FEnviarGeralResumido: Boolean;
    FEnvioUsuariosResumido: Boolean;
  published
    property RegistroGeral: Boolean read FRegistroGeral write FRegistroGeral;
    property RegistroUsuarios: Boolean read FRegistroUsuarios write FRegistroUsuarios;
    property RegistroPersonalizado: Boolean read FRegistroPersonalizado write FRegistroPersonalizado;
    property EnviarGeral: Boolean read FEnviarGeral write FEnviarGeral;
    property EnvioUsuarios: Boolean read FEnvioUsuarios write FEnvioUsuarios;
    property EnvioPersonalizado: Boolean read FEnvioPersonalizado write FEnvioPersonalizado;
    property EnviarGeralResumido: Boolean read FEnviarGeralResumido write FEnviarGeralResumido;
    property EnvioUsuariosResumido: Boolean read FEnvioUsuariosResumido write FEnvioUsuariosResumido;
  end;

  TEstatistica = class
  private
    Fdata: TDateTime;
    Fdescricao: string;
    Ftipo: Integer;
    Fquantidade: Integer;
    Fvalor: Double;
  published
    property data: TDateTime read Fdata write Fdata;
    property descricao: string read Fdescricao write Fdescricao;
    property tipo: Integer read Ftipo write Ftipo;
    property quantidade: Integer read Fquantidade write Fquantidade;
    property valor: Double read Fvalor write Fvalor;
  end;

  TEstatisticaCustom = class
  private
    Fid: string;
    Fname: string;
    FcustomExec: string;
    FcustomSelect: string;
    Fupdatedat: TDateTime;
    Ffrequency: Integer;
    FseqUpdate: Integer;
    Fativo: Integer;
  published
    property id: string read Fid write Fid;
    property name: string read Fname write Fname;
    property customExec: string read FcustomExec write FcustomExec;
    property customSelect: string read FcustomSelect write FcustomSelect;
    property updatedat: TDateTime read Fupdatedat write Fupdatedat;
    property frequency: Integer read Ffrequency write Ffrequency;
    property seqUpdate: Integer read FseqUpdate write FseqUpdate;
    property ativo: Integer read Fativo write Fativo;
  end;

  TEstatisticaCustomHW = class(TEstatisticaCustom)
  private
    FlastRun: TDateTime;
  published
    property lastRun: TDateTime read FlastRun write FlastRun;
  end;

implementation

end.
