unit VersaoBaseDadosRepositoryUnit;

interface

uses
  IVersaoBaseDadosRepositoryUnit,
  VersaoSerproEtdUnit, TransferenciaCBSServiceUnit;

type
  /// <summary>
  ///   Equivale a VersaoBaseDadosRepository.java
  /// </summary>
  VersaoBaseDadosRepository = class(IVersaoBaseDadosRepository)
  private
    const CONFIG_VERSAO_RTC = 'rtc_versao_calculadora';
  public
    /// <summary>
    ///   Equivale a findTopByOrderByIdDesc
    /// </summary>
    function GetUltimaVersao(): VersaoSerproEtd; override;
  end;

implementation

uses
  SysUtils, ParameterValueUnit, CacheableRepositoryUnit;

type
   TWrapper = class(RecordWrapper)
     Data: VersaoSerproEtd;
   end;

{ VersoesFiscalCalculosRepository }

function VersaoBaseDadosRepository.GetUltimaVersao(): VersaoSerproEtd;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := 'last';

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'select first 1 ' +
    '  v.VALUE1_F VRBD_ID, v.VALUE_DT VRBD_DATA, v.VALUE1_B VRBD_DESCRICAO, v.VALUE1_VC VRBD_VERSAO_BASE_DADO ' +
    'from config_sistema v ' +
    'where v.CHAVE = :CHAVE',
    ParametersBuilder.Create(1)
      .ByName('CHAVE', CONFIG_VERSAO_RTC)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := VersaoSerproEtd.NullInstance()

    else
      Result := VersaoSerproEtd.Create(
        Round(FieldAsDouble('VRBD_ID')),
        FieldAsDate('VRBD_DATA'),
        FieldAsString('VRBD_DESCRICAO'),
        FieldAsStringNullable('VRBD_VERSAO_BASE_DADO')
      );

    W := TWrapper.Create;
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W, 10);

  finally
    FreeQueryResult();
  end;
end;

end.
