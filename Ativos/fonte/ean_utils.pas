unit ean_utils;

interface

uses
  {$IFNDEF VER180}
  IBX.IBQuery
  {$ELSE}
  IBQuery
  {$ENDIF}
  ;

type

  EANUtils = class
  public
    class function IsValid(value: string): Boolean;
    class function GetValid(value: string; query: TIBQuery; prefixosInvalidosConfs: string = ''): string;
  end;

implementation

uses
  hw_utils,
  SysUtils,
  StrUtils,
  Query_OOP;

{ EANUtils }

class function EANUtils.IsValid(value: string): Boolean;
var
  sl_CodIni: string;
  il_SeqSom, il_Soma, il_TodNum: Integer;

  function DUN14Valido: Boolean;
  var
    Codigo,converCalculo :string;
    imp2, imp1, imp3, imp4, imp5,imp6, imp7, par1, par2 ,par3, par4, par5,par6,TResult,Tamanho,TImpar, TPar, Calculo, Digito:integer;
  begin

    try
      Codigo := Copy(value, 1, 13);

      imp1:= StrToInt(copy(Codigo,1,1));
      imp2:= StrToInt(copy(Codigo,3,1));
      imp3:= StrToInt(copy(Codigo,5,1));
      imp4:= StrToInt(copy(Codigo,7,1));
      imp5:= StrToInt(copy(Codigo,9,1));
      imp6:= StrToInt(copy(Codigo,11,1));
      imp7:= StrToInt(copy(Codigo,13,1));

      TImpar:= (imp1)+(imp2)+(imp3)+(imp4)+(imp5)+(imp6)+(imp7);
      TImpar:= TImpar * 3;

      par1:= StrToInt(copy(Codigo,2,1));
      par2:= StrToInt(copy(Codigo,4,1));
      par3:= StrToInt(copy(Codigo,6,1));
      par4:= StrToInt(copy(Codigo,8,1));
      par5:= StrToInt(copy(Codigo,10,1));
      par6:= StrToInt(copy(Codigo,12,1));

      TPar:= (par1)+(par2)+(par3)+(par4)+(par5)+(par6);

      Calculo:= TImpar + TPar;

      converCalculo:= IntToStr(Calculo);

      Tamanho:= length(converCalculo);

      case Tamanho of
      1 :begin
          TResult:= StrToInt(copy(converCalculo,1,1));
            if TResult= 0 then
             Digito:= 0
            else
             Digito:= TResult - 10;

            if Digito < 0 then
             Digito:= ABS(Digito);
         end;

      2 :begin
          TResult:= StrToInt(copy(converCalculo,2,1));
            if TResult = 0 then
             Digito:= 0
            else
             Digito:= 10 - TResult;

           if Digito < 0 then
             Digito:= ABS(Digito);
         end;

      3 :begin
          TResult:= StrToInt(copy(converCalculo,3,1));
            if TResult= 0 then
              Digito:= 0
            else
              Digito:= 10 -  TResult;

           if Digito < 0 then
             Digito:= ABS(Digito);
         end;
      end;

      Result := IntToStr(Digito) = Copy(value, 14, 1);

    except
      Result := False;
    end;
  end;

begin
  Result := False;

  value := Trim(value);
  if value <> OnlyNumber(value) then
    Exit;

  if not (Length(value) in [8, 12, 13, 14]) then
    Exit;

  if (Length(Trim(value)) = 14) then
     Result := DUN14Valido
    // se codigo eh certo, entao continua
  else
  begin
    sl_CodIni := PadL(value, 13, '0');

    sl_CodIni := Copy(Trim(sl_CodIni), 1, Length(sl_CodIni) - 1);
    il_Soma := 0;
    il_SeqSom := 1;

    // se for ean8 entao completa numeros
//    if Length(Trim(value)) = 8 then
//      sl_CodIni := '00000' + sl_CodIni;

    // continua

    for il_TodNum := 1 to Length(sl_CodIni) do
    begin
      if il_SeqSom = 1 then
      begin
        il_Soma := il_Soma +
          (StrToInt(Copy(sl_CodIni, il_TodNum, 1)) * il_SeqSom);
        il_SeqSom := 3;
      end
      else
      begin
        il_Soma := il_Soma +
          (StrToInt(Copy(sl_CodIni, il_TodNum, 1)) * il_SeqSom);
        il_SeqSom := 1;
      end

    end;

    // calcula o restante

    // para numeros que nao sao zero no final
    if Copy(IntToStr(il_Soma), Length(IntToStr(il_Soma)), 1) <> '0' then
    begin
      if Copy(Trim(value), Length(value), 1) =
        IntToStr(10 - StrToInt(Copy(IntToStr(il_Soma),
        Length(IntToStr(il_Soma)), 1))) then
        Result := True
      else
        Result := False
    end
    else if StrToInt(Copy(Trim(value), Length(value), 1)) = 0 then
      Result := True
    else
      Result := False;
  end;

end;

class function EANUtils.GetValid(value: string;
  query: TIBQuery; prefixosInvalidosConfs: string): string;
var
  prefix, code: string;
begin
  if not EANUtils.IsValid(Trim(value)) then
  begin
    Result := '';
    Exit;
  end;

  prefix := OnlyNumber(value);
  prefix := PadL(IfThen(Length(prefix) = 14, Copy(prefix, 2, 13), prefix), 14, '0');
  prefix := IfThen(Copy(prefix, 1, 6) = '000000', Copy(prefix, 7, 3), Copy(prefix, 2, 3));

  if NewStringList(False, prefixosInvalidosConfs, ',').IndexOf(prefix) >= 0 then
    Result := ''
  else if (QueryHelper.Scalar('select count(inicio) contador from gs1prefix' +
                            ' where %s >= inicio and %s <= fim',
                            [QuotedStr(prefix), QuotedStr(prefix)], query).AsInteger > 0)
  then
    Result := Trim(value)
  else
    Result := '';
end;

end.
