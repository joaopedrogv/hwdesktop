unit NFSeParticipanteFactoryUnit;

interface

uses
  ClienteEtdUnit,
  NFSeParticipanteEtdUnit,
  NFSeTypesUnit;

type
  NFSeParticipanteFactory = class
  public
    class function Executar(
      const NFSeId: string;
      Tipo: TipoPartDpesEnum;
      const Cliente: ClienteEtd
    ): NFSeParticipanteEtd;
  end;

implementation

uses
  SysUtils,
  StringNullableUnit,
  IntegerNullableUnit, StringServiceUnit, TipoComunsUnit;

{ NFSeParticipanteFactory }

class function NFSeParticipanteFactory.Executar(
  const NFSeId: string;
  Tipo: TipoPartDpesEnum;
  const Cliente: ClienteEtd
): NFSeParticipanteEtd;
var
  cMun: IntegerNullable;
  sEmail: string;
  emails: TArrayString;
begin
  if Cliente = nil then
    Result := nil

  else
  begin
    if Cliente.Municipio = nil then
      cMun := IntegerNullable.NullInstance()
    else
      cMun := IntegerNullable.Create(Cliente.Municipio.Codigo);

    sEmail := '';
    SetLength(emails, 0);

    if Cliente.Email.HasValue then
    begin
      sEmail := StringReplace( Cliente.Email.Value, ';', ',', [rfReplaceAll]);
      sEmail := StringReplace( sEmail, ' ', ',', [rfReplaceAll]);

      emails := StringService.Split([','], sEmail);

      if Length(emails) > 0  then
        sEmail := emails[0]
      else
        sEmail := '';
      //Cliente.Email.SetValue(sEmail);
    end;

    Result := NFSeParticipanteEtd.Create(
      NFSeId,
      Tipo,
      Cliente.CpfCnpj,
      StringNullable.NullInstance(),
      IntegerNullable.NullInstance(),
      Cliente.InscMunicipal,
      Cliente.Razao,
      Cliente.FoneCliente,
      StringNullable.CreateOrNull(sEmail),
      cMun,
      StringNullable.Create(Cliente.Cep),
      StringNullable.Create(Cliente.Endereco),
      Cliente.NumEndCliente,
      Cliente.Complemento,
      StringNullable.Create(Cliente.Bairro)
    );

    Result.ListaEmails := emails;
  end;
end;

end.
