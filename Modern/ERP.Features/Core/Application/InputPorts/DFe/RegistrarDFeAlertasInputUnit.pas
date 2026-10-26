unit RegistrarDFeAlertasInputUnit;

interface

uses
  System.Generics.Collections;

type
  RegistrarDFeAlertasInput  = class
  private
    FChaveDFe: string;
    FMensagens: TList<TPair<Integer, string>>;
  public
    constructor Create(const AChaveDFe: string);
    destructor Destroy(); override;
    procedure Add(cMsg: Integer; const xMsg: string);

    property ChaveDFe: string read FChaveDFe;
    property Mensangens: TList<TPair<Integer,string>> read FMensagens;
  end;

implementation

{ RegistrarDFeAlertasInput }

procedure RegistrarDFeAlertasInput.Add(cMsg: Integer; const xMsg: string);
begin
  FMensagens.Add(TPair<Integer,string>.Create(cMsg, xMsg));
end;

constructor RegistrarDFeAlertasInput.Create(const AChaveDFe: string);
begin
  FChaveDFe := AChaveDFe;
  FMensagens := TList<TPair<Integer, string>>.Create();
end;

destructor RegistrarDFeAlertasInput.Destroy;
begin
  FMensagens.Free();
  inherited;
end;

end.
