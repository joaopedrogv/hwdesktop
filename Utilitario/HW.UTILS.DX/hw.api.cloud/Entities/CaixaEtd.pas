unit CaixaEtd;

interface

type
  TCaixa = class
  private
    Fid          : Integer;
    FempresaId   : Integer;
    Fname        : string;
    FrefreshToken: string;
    Fserie: Integer;
    FserieOff: Integer;
    FseqId: Integer;
  public
    property id          : Integer read Fid write Fid;
    property empresaId   : Integer read FempresaId write FempresaId;
    property name        : string read Fname write Fname;
    property refreshToken: string read FrefreshToken write FrefreshToken;
    property serie: Integer read Fserie write Fserie;
    property serieOff: Integer read FserieOff write FserieOff;
    property seqId: Integer read FseqId write FseqId;
  end;

implementation

end.
