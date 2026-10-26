unit IOperacoesFiscaisIbsCbsRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  TipoComunsUnit,
  OperacaoFiscalIbsCbsEtdUnit;

type                                  
  {$IFDEF INTF_ON}
  IOperacoesFiscaisIbsCbsRepository = interface
    ['{474A968E-E746-4488-B7CD-A562E1392846}']
    function Post(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
    function Put(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
    function GetById(const Id: string): OperacaoFiscalIbsCbsEtd;
    function GetByOpInternaGrupoFiscal(
      const OpInternaId, GrupoFiscalId: string;
      EmpresaId: Integer;
      Data: TDate
    ): OperacaoFiscalIbsCbsEtdList;
  end;
  {$ELSE}
  IOperacoesFiscaisIbsCbsRepository = class(BaseRepository)
  public
    function Post(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd; virtual; abstract;
    function Put(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd; virtual; abstract;
    function GetById(const Id: string): OperacaoFiscalIbsCbsEtd; virtual; abstract;
    function GetByOpInternaGrupoFiscal(
      const OpInternaId, GrupoFiscalId: string;
      EmpresaId: Integer;
      Data: TDate
    ): OperacaoFiscalIbsCbsEtdList; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
