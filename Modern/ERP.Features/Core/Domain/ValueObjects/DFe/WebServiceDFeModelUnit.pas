unit WebServiceDFeModelUnit;

interface

type
  WebServiceDFeModel = record
  private
    FEnvioEmProducao: Boolean;
    FCMunEmitente: Integer;
    FArquivos: string;
    FWSFraseSecreta: string;
    FWSChaveAcesso: string;
    FWSSenha: string;
    FGravaLog: Boolean;
    FApiPropria: Boolean;
    FConsultaRetornoTentativas: Cardinal;
    FConsultaRetornoAguardarEmSegundos: Cardinal;
    FConsultaRetornoIntervaloEmSegundos: Cardinal;
    FTimeOutEmSegundos: Cardinal;
  public
    class function Create(
      AEnvioEmProducao: Boolean;
      ACMunEmitente: Integer;
      const AArquivos: string;
      const AWSFraseSecreta: string;
      const AWSChaveAcesso: string;
      const AWSSenha: string;
      AGravaLog, AApiPropria: Boolean;
      AConsultaRetornoAguardarEmSegundos, AConsultaRetornoIntervaloEmSegundos, AConsultaRetornoTentativas,
      ATimeOutEmSegundos: Cardinal
    ): WebServiceDFeModel; static;

    property EnvioEmProducao: Boolean read FEnvioEmProducao;
    property CMunEmitente: Integer read FCMunEmitente;
    property Arquivos: string read FArquivos;
    property WSFraseSecreta: string read FWSFraseSecreta;
    property WSChaveAcesso: string read FWSChaveAcesso;
    property WSSenha: string read FWSSenha;
    property GravaLog: Boolean read FGravaLog;
    property ApiPropria: Boolean read FApiPropria;
    property ConsultaRetornoAguardarEmSegundos: Cardinal read FConsultaRetornoAguardarEmSegundos;
    property ConsultaRetornoIntervaloEmSegundos: Cardinal read FConsultaRetornoIntervaloEmSegundos;
    property ConsultaRetornoTentativas: Cardinal read FConsultaRetornoTentativas;
    property TimeOutEmSegundos: Cardinal read FTimeOutEmSegundos;
  end;

implementation

uses
  Math;

{ WebServiceDFeModel }

class function WebServiceDFeModel.Create(
  AEnvioEmProducao: Boolean;
  ACMunEmitente: Integer;
  const AArquivos: string;
  const AWSFraseSecreta: string;
  const AWSChaveAcesso: string;
  const AWSSenha: string;
  AGravaLog, AApiPropria: Boolean;
  AConsultaRetornoAguardarEmSegundos, AConsultaRetornoIntervaloEmSegundos, AConsultaRetornoTentativas,
  ATimeOutEmSegundos: Cardinal
): WebServiceDFeModel;
begin
  Result.FEnvioEmProducao := AEnvioEmProducao;
  Result.FCMunEmitente := ACMunEmitente;
  Result.FArquivos := AArquivos;
  Result.FWSFraseSecreta := AWSFraseSecreta;
  Result.FWSChaveAcesso := AWSChaveAcesso;
  Result.FWSSenha := AWSSenha;
  Result.FGravaLog := AGravaLog;
  Result.FApiPropria := AApiPropria;
  Result.FConsultaRetornoAguardarEmSegundos := Max(Min(AConsultaRetornoAguardarEmSegundos, 30), 0);
  Result.FConsultaRetornoIntervaloEmSegundos := Max(Min(AConsultaRetornoIntervaloEmSegundos, 30), 0);
  Result.FConsultaRetornoTentativas := Max(Min(AConsultaRetornoTentativas, 10), 0);
  Result.FTimeOutEmSegundos := Max(Min(ATimeOutEmSegundos, 120), 0);
end;

end.
