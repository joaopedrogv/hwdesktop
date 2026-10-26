unit uthreadSincronizacao;

interface

uses
  Classes, uClassesRetaguarda;

type
  threadSincronizacao = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    constructor Create(CreateSuspended: Boolean);
  end;

  TVerificaVendasSemDadosCupom = class(TThread)
  private
    Sinc: TAtualizacaoRetaguarda;
    { Private declarations }
  protected
    constructor Create(CreateSuspended: Boolean);
    procedure Execute; override;
  end;

var
  thSincronizacao: threadSincronizacao;

implementation

uses
  SysUtils, uDadosIniFiscal;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure threadSincronizacao.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ threadSincronizacao }

constructor threadSincronizacao.Create(CreateSuspended: Boolean);
begin
  inherited Create (CreateSuspended);
  Self.FreeOnTerminate := false;
  Self.Priority := tpLower;
  if vHwSinc = nil then
    vHwSinc := TAtualizacaoRetaguarda.create;
end;

procedure threadSincronizacao.Execute;
begin
  { Place thread code here }
  Sleep(5000);
  while (not Self.Terminated) do
  begin
    try
      if (not vHwSinc.EmExecucao) then
      begin
        if vHwSinc.Acao = 'estoqueI' then
        begin
          try
            vHwSinc._sincronizarDados;
            vHwSinc._atualizarEstoque(True);
          finally
            vHwSinc.Acao := '';
          end;
        end
        else
        if vHwSinc.Acao = 'estoque' then
        begin
          try
            vHwSinc._sincronizarDados;
            vHwSinc._atualizarEstoque;
          finally
            vHwSinc.Acao := '';
          end;
        end
        else if vHwSinc.Acao = 'cupom' then
        begin
          try
            vHwSinc._sincronizarDados;
          finally
            vHwSinc.Acao := '';
          end;
        end
        else
          vHwSinc._sincronizarDados;
      end;

    except on E: Exception do
      begin
        vHwSinc._registraErro('threadSincronizacao.Execute. Erro: ' + e.Message);
      end;
    end;
    Sleep(vHwSinc.SleepTimeSemConxecao);
  end;
end;

{ threadVerificaVendasSemDadosCupom }

constructor TVerificaVendasSemDadosCupom.Create(CreateSuspended: Boolean);
begin
  inherited Create (CreateSuspended);
  Self.FreeOnTerminate := false;
  Self.Priority := tpLower;
  if Sinc = nil then
    Sinc := TAtualizacaoRetaguarda.create;
end;

procedure TVerificaVendasSemDadosCupom.Execute;
begin
  inherited;
  { Place thread code here }
  Sleep(10000);
  while (not Self.Terminated) do
  begin
    try
      if (not Sinc.EmExecucao) then
      begin
        if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then// Segundo plano desativado essa thread será executada apenas uma vez
          Sinc.VerificarVendasSemCupom(0)                     // 0 aqui vai verificar 365 anteriores uma vez só
        else
        begin
          Sinc.VerificarVendasSemCupom(Date);
          Sinc.VerificarVendasSemCupom(0);
        end;
      end;

    except on E: Exception do
      begin
        Sinc._registraErro('TthreadVerificaVendasSemDadosCupom.Execute. Erro: ' + e.Message);
      end;
    end;
    Sleep(Sinc.SleepTimeSemConxecao + ( 60 * 1000) );
    if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then // Isso serve para a primeira vez apenas, pois será chamado no metodo padrao de sincronização
      Self.Terminate;                                      // Sincronizacao em segundo plano desativada, thread executa 1 vez e termina
  end;
end;

end.
