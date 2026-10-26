unit ResultadoExecucaoTransmissaoDFeOutputUnit;

interface

uses
  ResultadoOperacaoDFeUnit;

type
  ResultadoExecucaoTransmissaoDFeOutput = record
  private
    FResultadoDFe: ResultadoOperacaoDFe;
    FSucessoAutorizacao: Boolean;
  public
    class function Create(
      ResultadoDFe: ResultadoOperacaoDFe; SucessoAutorizacao: Boolean
    ): ResultadoExecucaoTransmissaoDFeOutput; static;
    property ResultadoDFe: ResultadoOperacaoDFe read FResultadoDFe;
    property SucessoAutorizacao: Boolean read FSucessoAutorizacao;
  end;

implementation


{ ResultadoExecucaoTransmissaoDFeOutput }

class function ResultadoExecucaoTransmissaoDFeOutput.Create(ResultadoDFe: ResultadoOperacaoDFe;
  SucessoAutorizacao: Boolean): ResultadoExecucaoTransmissaoDFeOutput;
begin
  Result.FResultadoDFe := ResultadoDFe;
  Result.FSucessoAutorizacao := SucessoAutorizacao;
end;

end.
