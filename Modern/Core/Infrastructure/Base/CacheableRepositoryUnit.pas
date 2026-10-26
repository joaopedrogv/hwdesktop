unit CacheableRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  ObjectCacheUnit,
  IRecordCacheUnit,
  IObjectCacheUnit,
  IDataBaseConnectionUnit, ISessionContextUnit;

type
  RecordWrapper = class(ObjectCacheUnit.RecordWrapper);
  CacheableRepository = class(BaseRepository)
  protected
    /// <summary>
    ///   Usar FCacheRecords apenas quando o record for simples, sem records aninhados que contenham strings, da erro na alocacao de memoria
    ///  Qualquer string contida em um record aninhado vai causar erro de alocacao de memoria, use o Classes no lugar de Records nesses casos
    /// </summary>
    FCacheRecords: IRecordCache;
    FCacheObjs: IObjectCache;
  public
    constructor Create(Connection: IDatabaseConnection); overload; override; // Remover talvez esse metodo caso comece a dar problemas de referencia nula
    constructor Create(Connection: IDatabaseConnection; Session: ISessionContext); overload; override;
    destructor Destroy; override;
  end;

implementation

{ CacheableRepository }

uses
  SysUtils,
  SimpleRecordCacheUnit;

constructor CacheableRepository.Create(Connection: IDatabaseConnection);
begin
  inherited Create(Connection);
  FCacheRecords := SimpleRecordCache.Create();
  FCacheObjs    := ObjectCache.Create();
end;

constructor CacheableRepository.Create(Connection: IDatabaseConnection; Session: ISessionContext);
begin
  inherited Create(Connection, Session);
end;

destructor CacheableRepository.Destroy;
begin  

  {$IFDEF INTF_ON}
  FCacheRecords := nil;
  FCacheObjs    := nil;
  {$ELSE}
  FreeAndNil(FCacheRecords);
  FreeAndNil(FCacheObjs);
  {$ENDIF}

  inherited;
end;

end.
