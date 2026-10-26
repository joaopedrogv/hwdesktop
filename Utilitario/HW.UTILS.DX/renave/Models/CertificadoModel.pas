unit CertificadoModel;

interface

uses
  System.Classes,
  HW.Utils.Classes.Rtti;

type

  TCertificadoModel = class(TPersistent)
  private
    FcertificateId: string;
    Fdados: string;
    Fvencimento: TDateTime;
    Femissao: TDateTime;
    Fname: string;
  published
    property certificateId: string read FcertificateId write FcertificateId;

    [THwDBField('dados', 'Dados', 1024)]
    property dados: string read Fdados write Fdados;
    property vencimento: TDateTime read Fvencimento write Fvencimento;
    property emissao: TDateTime read Femissao write Femissao;
    property name: string read Fname write Fname;
  end;

//  TCertificados = class(TList<TCertificado>);

implementation

end.
