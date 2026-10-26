unit AnexoXV;

interface

type

  TVersao = class
  private
    FId: Integer;
    FVersao: string;
    FDataVersao: TDateTime;
    FSincId: Integer;
    FAtivo: Integer;
  published
    property Id: Integer read FId write FId;
    property Versao: string read FVersao write FVersao;
    property DataVersao: TDateTime read FDataVersao write FDataVersao;
    property SincId: Integer read FSincId write FSincId;
    property Ativo: Integer read FAtivo write FAtivo;
  end;

  TItem = class
  private
    FId: Integer;
    FVersaoId: string;
    FDescricao: string;
    FSincId: Integer;
//    FVersao: TObject;
//    FAmbito: TObject;
//    FCests: TObject;
  published
    property Id: Integer read FId write FId;
    property VersaoId: string read FVersaoId write FVersaoId;
    property Descricao: string read FDescricao write FDescricao;
    property SincId: Integer read FSincId write FSincId;
//    property Versao: TObject read FVersao write FVersao;
//    property Ambito: TObject read FAmbito write FAmbito;
//    property Cests : TObject read FCests write FCests;
  end;

  TAmbito = class
  private
    FItemId: Integer;
    FAmbito: Integer;
    FVersaoId: Integer;
    FDescricao: string;
    FSincId: Integer;
    FAtivo: Integer;
  published
    property ItemId: Integer read FItemId write FItemId;
    property Ambito: Integer read FAmbito write FAmbito;
    property VersaoId: Integer read FVersaoId write FVersaoId;
    property Descricao: string read FDescricao write FDescricao;
    property SincId: Integer read FSincId write FSincId;
    property Ativo: Integer read FAtivo write FAtivo;
  end;

  TVariante = class
  private
    FId: Integer;
    FVersaoId: string;
    FDescricao: string;
    FSincId: Integer;
  published
    property Id: Integer read FId write FId;
    property VersaoId: string read FVersaoId write FVersaoId;
    property Descricao: string read FDescricao write FDescricao;
    property SincId: Integer read FSincId write FSincId;
  end;

  TNCM = class
  private
    FId: Integer;
    FCestId: Integer;
    FNCM: string;
    FSincId: Integer;
    FAtivo: Integer;
  published
    property Id: Integer read FId write FId;
    property CestId: Integer read FCestId write FCestId;
    property NCM: string read FNCM write FNCM;
    property SincId: Integer read FSincId write FSincId;
    property Ativo: Integer read FAtivo write FAtivo;
  end;

  TMVA = class
  private
    FId: Integer;
    FCestId: Integer;
    FVarianteId: Integer;
    FMVA: Double;
    FSincId: Integer;
    FAtivo: Integer;
    FHwVarianteId: Integer;
    FVariante: TVariante;
    FNcmExcecao: string;
  published
    property Id: Integer read FId write FId;
    property CestId: Integer read FCestId write FCestId;
    property VarianteId: Integer read FVarianteId write FVarianteId;
    property MVA: Double read FMVA write FMVA;
    property NcmExcecao: string read FNcmExcecao write FNcmExcecao;
    property SincId: Integer read FSincId write FSincId;
    property Ativo: Integer read FAtivo write FAtivo;
    property HwVarianteId: Integer read FHwVarianteId write FHwVarianteId;
    property Variante: TVariante read FVariante write FVariante;
  end;

  TCest = class
  private
    FId: Integer;
    FVersaoId: string;
    FItemId: Integer;
    FCEST: string;
    FAmbito: Integer;
    FDescricao: string;
    FEstados: string;
    FSincId: Integer;
    FAtivo: Integer;
    FMvas: TArray<TMVA>;
    FNcms: TArray<TNCM>;
  published
    property Id: Integer read FId write FId;
    property VersaoId: string read FVersaoId write FVersaoId;
    property ItemId: Integer read FItemId write FItemId;
    property CEST: string read FCEST write FCEST;
    property Ambito: Integer read FAmbito write FAmbito;
    property Descricao: string read FDescricao write FDescricao;
    property Estados: string read FEstados write FEstados;
    property SincId: Integer read FSincId write FSincId;
    property Ativo: Integer read FAtivo write FAtivo;

    property Mvas: TArray<TMVA> read FMvas write FMvas;
    property Ncms: TArray<TNCM> read FNcms write FNcms;
  end;

implementation

end.
