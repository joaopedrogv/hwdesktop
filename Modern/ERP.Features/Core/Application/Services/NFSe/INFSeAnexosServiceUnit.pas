(*
  Arquivo exclusivo Delphi com ACBR
*)
unit INFSeAnexosServiceUnit;

interface

uses
  SysUtils, System.Generics.Collections,
  TipoComunsUnit;

type
  NFSeAnexoResult = record
    NFSeId: string;
    FileName: string;
    Content: TBytes;
  end;

  NFSeAnexosResultArray = array of NFSeAnexoResult;

  TNFSeId = string;
  NFSeErroResult = TPair<TNFSeId,string>;
  NFSeErroResultArray = array of NFSeErroResult;

  NFSeAnexosServiceResult = record
    Anexos: NFSeAnexosResultArray;
    Erros: NFSeErroResultArray;
  end;

  INFSeAnexosService = interface
    ['{B7F2E8A1-4C5D-4F9E-8A3B-1D2E3F4A5B6C}']
    function CriarAnexos(
      const NFSeIds: TArrayString;
      EmpresaId: Integer;
      AnexarPDFs: Boolean
    ): NFSeAnexosServiceResult;
  end;

implementation

end.
