unit anexoxv_utils;

interface

uses
  cest_variante_class;

type
  TTipo_Cadastro_Cest_MVA = (tcNull, tcAnexoXV, tcApi, tcUsuario);
  TTipo_Variante_Cest_MVA = (tvRegraGeral, tvNacionalidade, tvOrigem, tvRamoAtividade, tvEspecificoProduto);

  AnxXVUtils = class
  public
    class function NovaVariante(Descricao: string): TCest_variante_class;
    class function DescrOrigToDescr(Descricao: string): string;
  end;

implementation

uses
{$IFNDEF VER180}
  System.Math,
  System.StrUtils;
{$ELSE}
  Math,
  StrUtils;
{$ENDIF}

{ AnxXVUtils }

class function AnxXVUtils.DescrOrigToDescr(Descricao: string): string;
begin
  Result := Descricao;
  Exit;
  if StartsText('Nacionais', Descricao) then
    Result := 'Mercadorias nacionais'
  else if StartsText('Importad', Descricao) then
    Result := 'Mercadorias importadas'
  else if StartsText('Interna', Descricao) then
    Result := 'Operação Interna'
  else if StartsText('Interestadual', Descricao) then
    Result := 'Operação Interestadual'
  else if StartsText('Regra Geral', Descricao) then
    Result := 'Regra Geral'
  else
    Result := Descricao;
end;

class function AnxXVUtils.NovaVariante(
  Descricao: string): TCest_variante_class;
begin
  Result                         := TCest_variante_class.Create;
  Result.descricao_original.Text := Descricao;
  Result.descricao               := AnxXVUtils.DescrOrigToDescr(Descricao);
  if StartsText('Nacionais', Descricao) then
  begin
    //Result.descricao  := 'Mercadorias nacionais';
    Result.tipo       := Integer(tvNacionalidade);
    Result.tipo_valor := 1;
  end
  else if StartsText('Importad', Descricao) then
  begin
    //Result.descricao  := 'Mercadorias importadas';
    Result.tipo       := Integer(tvNacionalidade);
    Result.tipo_valor := 2;
  end
  else if StartsText('Interna', Descricao) then
  begin
    //Result.descricao  := 'Operação Interna';
    Result.tipo       := Integer(tvOrigem);
    Result.tipo_valor := 1;
  end
  else if StartsText('Interestadual', Descricao) then
  begin
    //Result.descricao  := 'Operação Interestadual';
    Result.tipo       := Integer(tvOrigem);
    Result.tipo_valor := 2;
  end
  else if StartsText('Regra Geral', Descricao) then
  begin
    //Result.descricao  := 'Regra Geral'
    Result.tipo       := Integer(tvRegraGeral);
    Result.tipo_valor := 0;
  end
  else
  begin
    //Result.descricao := Descricao;
    if (StartsText('Indústria', Descricao)) or (StartsText('Atacadista', Descricao)) then
    begin
      Result.tipo       := Integer(tvRamoAtividade);
      Result.tipo_valor := IfThen(StartsText('Indústria', Descricao), 1, 2);
    end
    else
    begin
      Result.tipo       := Integer(tvEspecificoProduto);
      Result.tipo_valor := IfThen(StartsText('Sangrias nacionais', Descricao), 1,
                                  IfThen(StartsText('Sangrias importadas', Descricao), 2, 3));
    end;
  end;
  Result.aliq_icms_especifica := IfThen(ContainsText(Descricao, 'aliq 12%'), 12) +
                                 IfThen(ContainsText(Descricao, 'aliq 4%' ),  4);
end;

end.
