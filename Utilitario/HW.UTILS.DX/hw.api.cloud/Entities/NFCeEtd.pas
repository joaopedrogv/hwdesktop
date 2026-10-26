unit NFCeEtd;

interface

uses
  GenericDataEtd;

type
  TNFCe = class
  private
    Fid: Integer;
    FempresaId: Integer;
    Fstatus: string;
    Fsituacao: string;
    FtpEmis: string;
    Fguidt: string;
    FsincOff: Integer;
    FpedidoDestId: Integer;
    FpedidoDestTipo: string;
    FpedidoOrigId: Integer;
    FpedidoOrigTipo: string;
  published
    property id: Integer read Fid write Fid;
    property empresaId: Integer read FempresaId write FempresaId;
    property status: string read Fstatus write Fstatus;
    property situacao: string read Fsituacao write Fsituacao;
    property tpEmis: string read FtpEmis write FtpEmis;
    property guidt: string read Fguidt write Fguidt;
    property sincOff: Integer read FsincOff write FsincOff;
    property pedidoDestId: Integer read FpedidoDestId write FpedidoDestId;
    property pedidoDestTipo: string read FpedidoDestTipo write FpedidoDestTipo;
    property pedidoOrigId: Integer read FpedidoOrigId write FpedidoOrigId;
    property pedidoOrigTipo: string read FpedidoOrigTipo write FpedidoOrigTipo;
  end;

implementation

end.
