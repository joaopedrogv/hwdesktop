unit conf_historicos_class;

interface

uses
  Classes,
  uDtmAtivo, DB, hw_strings;

type
  //EnumHistorico = (CtpDeNF, CtpDeFreteNF, CtpDeFreteAvulso, Fpgto, FpgtoAuto);
  EnumHistorico = (CtpDeNF, CtpDeFreteNF, CtpDeFreteAvulso, Fpgto);

  HistoricoHelper = class
  public
    class function Build(id: EnumHistorico; dataSet: TDataSet; historico: string = ''; values: TStrings = nil; emptyCampos: Boolean = True): string;
  end;

  HistoricoHelperStrings = class(TStringFmt);

implementation

uses
  StrUtils,
  SysUtils,
  config_sistema_class,
  hw_utils,
  uDadosIni;

{ HistoricoHelper }

class function HistoricoHelper.Build(id: EnumHistorico; dataSet: TDataSet;
  historico: string; values: TStrings; emptyCampos: Boolean): string;
var
  conf: TConfig_sistema_class;
  fields: TStrings;
  key, field, defs, text: string;
  dbField: TField;

  procedure Rplc(f, value: string);
  begin
    Result := StringReplace(Result, '@' + UpperCase(Trim(f)), value, [rfReplaceAll]);
  end;

begin
  conf := TConfig_sistema_class.Create;
  try
    conf.AsStrings.Text := vDadosIni.conf_historicos;

    case id of
      CtpDeNF:
        begin
          key := 'ContasAPagarDeNfCompra';
          Result := 'COMPRA MERC CONF NF @NUM_NF';
          defs := 'NUM_NF';
        end;

      CtpDeFreteNF:
        begin
          key := 'ContasAPagarDeFreteNF';
          Result := 'CONHEC FRETE NF @NUM_NF';
          defs := 'NUM_NF';
        end;

      CtpDeFreteAvulso:
        begin
          key := 'ContasAPagarDeFreteAvulso';
          Result := 'CONHEC FRETE NUM @NUM_DOCUMENTO';
          defs := 'NUM_DOCUMENTO';
        end;

      Fpgto:
      begin
        key := 'FormaDePagamento';
        Result := 'CREDITOS A RECEBER CONFORME @TPDOCS Nº @NREQUISICAO';
        defs := 'TPDOCS,NREQUISICAO';
      end;
    end;

    text := conf.ReadString(key, 'Texto');
    fields := NewStringList(conf.ReadString(key, 'Campos'), ',');

    if fields.Count = 0 then
      fields := NewStringList(defs, ',');

    if Trim(historico) <> '' then
      Result := historico
    else
      Result := IfThen(Trim(text) <> '', Trim(text), Result);

    for field in fields do
    begin

      if values <> nil then
        if Trim(values.Values[field]) <> '' then        
          Rplc(field, values.Values[field]);

      dbField := dataSet.FindField(field);


      if (dbField <> nil) then
      begin
        if (dbField is TFloatField) and ((dbField.AsFloat > 0) or emptyCampos) then
          Rplc(field, Format('%0.2n', [dbField.AsFloat]))

        else if (Trim(dbField.AsString) <> '') or emptyCampos then             
          Rplc(field, dbField.AsString);
      end;

      if emptyCampos then
        Rplc(field, '');
    end;

  finally
    conf.Free;
  end;
end;

end.
