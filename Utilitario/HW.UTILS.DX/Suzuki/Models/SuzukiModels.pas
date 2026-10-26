unit SuzukiModels;

interface

uses
  System.Classes, System.Generics.Collections;

type

  TAutenticacao = class(TPersistent)
  private
    FCliente: string;
    FSenha: string;
    FUsuario: string;
  published
    property Cliente: string read FCliente write FCliente;
    property Senha: string read FSenha write FSenha;
    property Usuario: string read FUsuario write FUsuario;
  end;

  TNotaFiscal = class(TPersistent)
  private
    FdanfeBase64: string;
    FidTipoUso: Integer;
    FinfoAdicional: string;
    Fchassi: string;
  published
    property danfeBase64: string read FdanfeBase64 write FdanfeBase64;
    property idTipoUso: Integer read FidTipoUso write FidTipoUso;
    property infoAdicional: string read FinfoAdicional write FinfoAdicional;
    property chassi: string read Fchassi write Fchassi;
  end;

implementation

end.
