unit INFSExecutorUnit;

interface

uses
  TipoComunsUnit;

type
  NFSExecutorContext = record
    NumeroOS: Integer;
    EmissaLegadaDesativada: Boolean;
    SendSilent: Boolean;
    NumerosRPS: TArrayInteger; // Somente o Legado tem grava numero de RPS nos itens
    NFSeIDs: TArrayString;     // Somente o Novo grava IDs de NFSe
  end;

  INFSExecutorResult = record
    MensagemErro: string;
  end;

  INFSExecutor = interface
    ['{02981600-C06B-4490-BAA0-CAA4E5252C41}']
    function PodeExecutar(const Context: NFSExecutorContext): Boolean;
    function Emitir(const Context: NFSExecutorContext): INFSExecutorResult;
    function CriarAnexosEmail(const Context: NFSExecutorContext): TArrayString;
  end;

implementation

end.
