unit EmpresaModel;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, System.SyncObjs, System.TypInfo,
  System.Generics.Collections, System.JSON, System.Generics.Defaults;

type
  TEmpresaModel = class(TPersistent)
  private
    Fcod_empresa: Integer;
    Fsinc_hwcloud: string;
    Fativo: Integer;
  published
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property sinc_hwcloud: string read Fsinc_hwcloud write Fsinc_hwcloud;
    property ativo: Integer read Fativo write Fativo;
  end;

implementation

end.
