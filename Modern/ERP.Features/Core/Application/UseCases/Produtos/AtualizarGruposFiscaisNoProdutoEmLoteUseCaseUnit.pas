unit AtualizarGruposFiscaisNoProdutoEmLoteUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  IProdutosRepositoryUnit,
  IProgressObserverUnit,
  ProdutoGrupoFiscalUpdateModelUnit,
  ProdutoNcmGrupoFiscalUpdateModelUnit;

type
  AtualizarGruposFiscaisNoProdutoEmLoteUseCaseBase = class(BaseUseCase)
  protected
    FObserver: IProgressObserver;
    FProdutosRepo: IProdutosRepository;
    procedure Executar(const Input: ProdutoGrupoFiscalUpdateModelArray); overload; virtual;
    procedure Executar(const Input: ProdutoNcmGrupoFiscalUpdateModelArray); overload; virtual;
  public
    constructor Create(
      const Connection: IDataBaseConnection;
      const ProdutosRepo: IProdutosRepository;
      const Observer: IProgressObserver
    );
  end;

  IAtualizarGruposFiscaisNoProdutoEmLoteUseCase = class(AtualizarGruposFiscaisNoProdutoEmLoteUseCaseBase)
  public
    procedure Executar(const Input: ProdutoGrupoFiscalUpdateModelArray); override;
  end;

  IAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase = class(AtualizarGruposFiscaisNoProdutoEmLoteUseCaseBase)
  public
    procedure Executar(const Input: ProdutoNcmGrupoFiscalUpdateModelArray); override;
  end;

implementation

uses
  ITransactionUnit,
  SysUtils;

{ AtualizarGruposFiscaisNoProdutoEmLoteUseCaseBase }

constructor AtualizarGruposFiscaisNoProdutoEmLoteUseCaseBase.Create(
  const Connection: IDataBaseConnection;
  const ProdutosRepo: IProdutosRepository;
  const Observer: IProgressObserver
);
begin
  inherited Create(Connection);
  FProdutosRepo := ProdutosRepo;
  FObserver := Observer;
end;

procedure AtualizarGruposFiscaisNoProdutoEmLoteUseCaseBase.Executar(
  const Input: ProdutoGrupoFiscalUpdateModelArray);
var
  T: ITransaction;
  Lote: ProdutoGrupoFiscalUpdateModelArray;
  I, Count, IMax: Integer;
  LoteMaxCommit: Integer;
begin
  FObserver.OnStart();
  if Length(Input) = 0 then
  begin
    FObserver.OnComplete();
    Exit;
  end;

  FObserver.OnMessage('Iniciando');

  T := FConnection.BeginTransaction();
  try
    try
      Count := 0;
      LoteMaxCommit := 50;
      SetLength(Lote, LoteMaxCommit);
      I := Low(Input);
      IMax := High(Input) + 1;
      for I := Low(Input) to High(Input) do
      begin
        if FObserver.IsCancellationRequested() then
        begin
          FObserver.OnWarning('Processo cancelado pelo usuário');
          FObserver.OnCancel();
          Exit;
        end;
        FObserver.OnProgress(Trunc((I + 1) / IMax * 100));

        Inc(Count);
        Lote[Count - 1] := Input[I];

        if Count >= LoteMaxCommit then
        begin
          FProdutosRepo.AtualizarGrupoFiscalEmLote(Lote);
          T.Commit();
          Count := 0;
        end;
      end;

      if Count > 0 then
      begin
        SetLength(Lote, Count);
        FProdutosRepo.AtualizarGrupoFiscalEmLote(Lote);
      end;

      T.Commit();

      FObserver.OnMessage(Format('Processo concluído, %d ocorrências', [IMax]));
      FObserver.OnComplete();

    except on E: Exception do
      begin
        T.Rollback();
        FObserver.OnError('Erro no processamento. Consulte o log para mais detalhes');
        raise;
      end;
    end;
  finally
    T.Free();
  end;
end;

procedure AtualizarGruposFiscaisNoProdutoEmLoteUseCaseBase.Executar(
  const Input: ProdutoNcmGrupoFiscalUpdateModelArray);

var
  T: ITransaction;
  Lote: ProdutoNcmGrupoFiscalUpdateModelArray;
  I, Count, IMax: Integer;
  LoteMaxCommit: Integer;
begin
  FObserver.OnStart();
  if Length(Input) = 0 then
  begin
    FObserver.OnComplete();
    Exit;
  end;

  FObserver.OnMessage('Iniciando');

  T := FConnection.BeginTransaction();
  try
    try
      Count := 0;
      LoteMaxCommit := 5;
      SetLength(Lote, LoteMaxCommit);
      I := Low(Input);
      IMax := High(Input) + 1;
      for I := Low(Input) to High(Input) do
      begin
        if FObserver.IsCancellationRequested() then
        begin
          FObserver.OnWarning('Processo cancelado pelo usuário');
          FObserver.OnCancel();
          Exit;
        end;
        FObserver.OnProgress(Trunc((I + 1) / IMax * 100));

        Inc(Count);
        Lote[Count - 1] := Input[I];

        if Count >= LoteMaxCommit then
        begin
          FProdutosRepo.AtualizarGrupoFiscalEmLote(Lote);
          T.Commit();
          Count := 0;
        end;
      end;

      if Count > 0 then
      begin
        SetLength(Lote, Count);
        FProdutosRepo.AtualizarGrupoFiscalEmLote(Lote);
      end;

      T.Commit();

      FObserver.OnMessage(Format('Processo concluído, %d ocorrências', [IMax]));
      FObserver.OnComplete();

    except on E: Exception do
      begin
        T.Rollback();
        FObserver.OnError('Erro no processamento. Consulte o log para mais detalhes');
        raise;
      end;
    end;
  finally
    T.Free();
  end;
end;

{ IAtualizarGruposFiscaisNoProdutoEmLoteUseCase }

procedure IAtualizarGruposFiscaisNoProdutoEmLoteUseCase.Executar(
  const Input: ProdutoGrupoFiscalUpdateModelArray);
begin
  inherited;
end;

{ IAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase }

procedure IAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase.Executar(
  const Input: ProdutoNcmGrupoFiscalUpdateModelArray);
begin
  inherited;
end;

end.
