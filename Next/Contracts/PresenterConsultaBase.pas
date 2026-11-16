unit PresenterConsultaBase;

interface

uses
  SysUtils, FilterCriterion, IDataSetReaderUnit;

type
  IPresenterConsultaBase = interface
    ['{e387739b-31d9-4501-a7aa-feb88bd57c6b}']
    function CriarLeitor(const ACriteria: TFilterCriteria): IDataSetReader;
  end;

  TPresenterConsultaBase = class(TInterfacedObject, IPresenterConsultaBase)
  public
    function CriarLeitor(const ACriteria: TFilterCriteria): IDataSetReader;
  end;

implementation

{TPresenterConsultaBase}

function TPresenterConsultaBase.CriarLeitor(const ACriteria: TFilterCriteria): IDataSetReader;
begin
  Result := FQuery.CriarLeitor(ACriteria);
end;

end.