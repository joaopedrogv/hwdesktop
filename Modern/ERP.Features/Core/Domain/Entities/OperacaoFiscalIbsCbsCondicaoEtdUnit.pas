unit OperacaoFiscalIbsCbsCondicaoEtdUnit;

interface

type
  OperacaoFiscalIbsCbsCondicaoTipo = (
    ofctEnteGovernamentalAny,
    ofctEnteGovernamentalUniao,
    ofctEnteGovernamentalUF,
    ofctEnteGovernamentalMunicipio
  );

  OperacaoFiscalIbsCbsCondicaoEtd = record
  private
    FTipo: OperacaoFiscalIbsCbsCondicaoTipo;
    FCondicaoId: string;
  public
    //constructor Create();    
     
    property Tipo: OperacaoFiscalIbsCbsCondicaoTipo read FTipo;
    property CondicaoId: string read FCondicaoId;
  end;

  OperacaoFiscalIbsCbsCondicaoEtdArray = array of OperacaoFiscalIbsCbsCondicaoEtd;

implementation

end.
