unit ElementoBaseCalculoUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/api/model/input/basecalculo/enumeration/ElementoBaseCalculo.java

interface

uses
  StringNullableUnit,
  BaseCalculoBaseEnumUnit,
  BaseCalculoNaturezaEnumUnit,
  BaseCalculoOperacaoEnumUnit;

type
  TipoDocumentoSet = set of Byte;

  ElementoBaseCalculo = (
    ebcVProd,
    ebcVFrete,
    ebcVSeg,
    ebcVOutro,
    ebcVII,
    ebcVIS,
    ebcVDesc,
    ebcVPIS,
    ebcVCOFINS,
    ebcVICMS,
    ebcVICMSUFDest,
    ebcVFCP,
    ebcVFCPUFDest,
    ebcVICMSMono,
    ebcVISSQN
  );

function ElementoBaseCalculoTag(Elemento: ElementoBaseCalculo): string;
function ElementoBaseCalculoOperacao(Elemento: ElementoBaseCalculo): BaseCalculoOperacao;
function ElementoBaseCalculoBases(Elemento: ElementoBaseCalculo): BaseCalculoBaseSet;
function ElementoBaseCalculoNatureza(Elemento: ElementoBaseCalculo): BaseCalculoNatureza;
function ElementoBaseCalculoAnoInicioVigencia(Elemento: ElementoBaseCalculo): Integer;
function ElementoBaseCalculoAnoFimVigencia(Elemento: ElementoBaseCalculo): Integer;
function ElementoBaseCalculoTiposDocumentoValidos(Elemento: ElementoBaseCalculo): TipoDocumentoSet;
function ElementoBaseCalculoValidoParaTipoDocumento(Elemento: ElementoBaseCalculo;
  TipoDocumento: Integer): Boolean;
function CampoCompoeBase(Elemento: ElementoBaseCalculo; Ano: Integer;
  Natureza: BaseCalculoNatureza; TipoDocumento: Integer): Boolean;
function MotivoNaoComposicao(Elemento: ElementoBaseCalculo; Ano: Integer;
  Natureza: BaseCalculoNatureza; TipoDocumento: Integer): StringNullable;

implementation

uses
  SysUtils;

type
  TElementoBaseCalculoInfo = record
    Tag: string;
    Operacao: BaseCalculoOperacao;
    Bases: BaseCalculoBaseSet;
    Natureza: BaseCalculoNatureza;
    AnoInicioVigencia: Integer;
    AnoFimVigencia: Integer;
    TiposDocumento: TipoDocumentoSet;
  end;

function InfoDoElemento(Elemento: ElementoBaseCalculo): TElementoBaseCalculoInfo;
begin
  case Elemento of
    ebcVProd:
      begin
        Result.Tag := 'vProd';
        Result.Operacao := bcoSoma;
        Result.Bases := [bcbRG, bcbIS, bcbSN];
        Result.Natureza := bcnUnassigned;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2033;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVFrete:
      begin
        Result.Tag := 'vFrete';
        Result.Operacao := bcoSoma;
        Result.Bases := [bcbRG, bcbIS, bcbSN];
        Result.Natureza := bcnUnassigned;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2033;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVSeg:
      begin
        Result.Tag := 'vSeg';
        Result.Operacao := bcoSoma;
        Result.Bases := [bcbRG, bcbIS, bcbSN];
        Result.Natureza := bcnUnassigned;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2033;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVOutro:
      begin
        Result.Tag := 'vOutro';
        Result.Operacao := bcoSoma;
        Result.Bases := [bcbRG, bcbIS, bcbSN];
        Result.Natureza := bcnUnassigned;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2033;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVII:
      begin
        Result.Tag := 'vII';
        Result.Operacao := bcoSoma;
        Result.Bases := [bcbRG, bcbIS];
        Result.Natureza := bcnBem;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2033;
        Result.TiposDocumento := [55];
      end;
    ebcVIS:
      begin
        Result.Tag := 'vIS';
        Result.Operacao := bcoSoma;
        Result.Bases := [bcbRG, bcbSN];
        Result.Natureza := bcnUnassigned;
        Result.AnoInicioVigencia := 2027;
        Result.AnoFimVigencia := 2033;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVDesc:
      begin
        Result.Tag := 'vDesc';
        Result.Operacao := bcoSubtrai;
        Result.Bases := [bcbRG, bcbIS, bcbSN];
        Result.Natureza := bcnUnassigned;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2033;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVPIS:
      begin
        Result.Tag := 'vPIS';
        Result.Operacao := bcoSubtrai;
        Result.Bases := [bcbRG, bcbIS];
        Result.Natureza := bcnUnassigned;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2026;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVCOFINS:
      begin
        Result.Tag := 'vCOFINS';
        Result.Operacao := bcoSubtrai;
        Result.Bases := [bcbRG, bcbIS];
        Result.Natureza := bcnUnassigned;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2026;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVICMS:
      begin
        Result.Tag := 'vICMS';
        Result.Operacao := bcoSubtrai;
        Result.Bases := [bcbRG, bcbIS];
        Result.Natureza := bcnBem;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2032;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVICMSUFDest:
      begin
        Result.Tag := 'vICMSUFDest';
        Result.Operacao := bcoSubtrai;
        Result.Bases := [bcbRG, bcbIS];
        Result.Natureza := bcnBem;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2032;
        Result.TiposDocumento := [55];
      end;
    ebcVFCP:
      begin
        Result.Tag := 'vFCP';
        Result.Operacao := bcoSubtrai;
        Result.Bases := [bcbRG, bcbIS];
        Result.Natureza := bcnBem;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2032;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVFCPUFDest:
      begin
        Result.Tag := 'vFCPUFDest';
        Result.Operacao := bcoSubtrai;
        Result.Bases := [bcbRG, bcbIS];
        Result.Natureza := bcnBem;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2032;
        Result.TiposDocumento := [55];
      end;
    ebcVICMSMono:
      begin
        Result.Tag := 'vICMSMono';
        Result.Operacao := bcoSubtrai;
        Result.Bases := [bcbRG, bcbIS];
        Result.Natureza := bcnBem;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2032;
        Result.TiposDocumento := [55, 65];
      end;
    ebcVISSQN:
      begin
        Result.Tag := 'vISSQN';
        Result.Operacao := bcoSubtrai;
        Result.Bases := [bcbRG, bcbIS];
        Result.Natureza := bcnServico;
        Result.AnoInicioVigencia := 2026;
        Result.AnoFimVigencia := 2032;
        Result.TiposDocumento := [55, 65];
      end;
  else
    raise ERangeError.CreateFmt('Elemento de base de cálculo inválido: %d', [Ord(Elemento)]);
  end;
end;

function TipoDocumentoValido(const Tipos: TipoDocumentoSet; TipoDocumento: Integer): Boolean;
begin
  if (TipoDocumento < 0) or (TipoDocumento > 255) then
    Result := False
  else
    Result := Byte(TipoDocumento) in Tipos;
end;

function ElementoBaseCalculoTag(Elemento: ElementoBaseCalculo): string;
var
  info: TElementoBaseCalculoInfo;
begin
  info := InfoDoElemento(Elemento);
  Result := info.Tag;
end;

function ElementoBaseCalculoOperacao(Elemento: ElementoBaseCalculo): BaseCalculoOperacao;
var
  info: TElementoBaseCalculoInfo;
begin
  info := InfoDoElemento(Elemento);
  Result := info.Operacao;
end;

function ElementoBaseCalculoBases(Elemento: ElementoBaseCalculo): BaseCalculoBaseSet;
var
  info: TElementoBaseCalculoInfo;
begin
  info := InfoDoElemento(Elemento);
  Result := info.Bases;
end;

function ElementoBaseCalculoNatureza(Elemento: ElementoBaseCalculo): BaseCalculoNatureza;
var
  info: TElementoBaseCalculoInfo;
begin
  info := InfoDoElemento(Elemento);
  Result := info.Natureza;
end;

function ElementoBaseCalculoAnoInicioVigencia(Elemento: ElementoBaseCalculo): Integer;
var
  info: TElementoBaseCalculoInfo;
begin
  info := InfoDoElemento(Elemento);
  Result := info.AnoInicioVigencia;
end;

function ElementoBaseCalculoAnoFimVigencia(Elemento: ElementoBaseCalculo): Integer;
var
  info: TElementoBaseCalculoInfo;
begin
  info := InfoDoElemento(Elemento);
  Result := info.AnoFimVigencia;
end;

function ElementoBaseCalculoTiposDocumentoValidos(Elemento: ElementoBaseCalculo): TipoDocumentoSet;
var
  info: TElementoBaseCalculoInfo;
begin
  info := InfoDoElemento(Elemento);
  Result := info.TiposDocumento;
end;

function ElementoBaseCalculoValidoParaTipoDocumento(Elemento: ElementoBaseCalculo;
  TipoDocumento: Integer): Boolean;
var
  info: TElementoBaseCalculoInfo;
begin
  info := InfoDoElemento(Elemento);
  Result := TipoDocumentoValido(info.TiposDocumento, TipoDocumento);
end;

function CampoCompoeBase(Elemento: ElementoBaseCalculo; Ano: Integer;
  Natureza: BaseCalculoNatureza; TipoDocumento: Integer): Boolean;
var
  info: TElementoBaseCalculoInfo;
  anoValido: Boolean;
  naturezaValida: Boolean;
  modeloValido: Boolean;
begin
  info := InfoDoElemento(Elemento);
  anoValido := (Ano >= info.AnoInicioVigencia) and (Ano <= info.AnoFimVigencia);
  naturezaValida := (info.Natureza = bcnUnassigned) or (Natureza = info.Natureza);
  modeloValido := TipoDocumentoValido(info.TiposDocumento, TipoDocumento);
  Result := anoValido and naturezaValida and modeloValido;
end;

function MotivoNaoComposicao(Elemento: ElementoBaseCalculo; Ano: Integer;
  Natureza: BaseCalculoNatureza; TipoDocumento: Integer): StringNullable;
var
  info: TElementoBaseCalculoInfo;
  mensagem: string;
begin
  info := InfoDoElemento(Elemento);

  if (Ano < info.AnoInicioVigencia) or (Ano > info.AnoFimVigencia) then
  begin
    mensagem := Format(
      'Campo %s não compõe as bases para o ano %d (vigência %d'#$2013'%d) e foi ignorado no cálculo',
      [info.Tag, Ano, info.AnoInicioVigencia, info.AnoFimVigencia]);
    Result := StringNullable.Create(mensagem);
    Exit;
  end;

  if (info.Natureza <> bcnUnassigned) and (Natureza <> info.Natureza) then
  begin
    mensagem := Format(
      'Campo %s não compõe as bases para a natureza %s (aplicável apenas a %s) e foi ignorado no cálculo',
      [info.Tag, BaseCalculoNaturezaParaTexto(Natureza), BaseCalculoNaturezaParaTexto(info.Natureza)]);
    Result := StringNullable.Create(mensagem);
    Exit;
  end;

  if not TipoDocumentoValido(info.TiposDocumento, TipoDocumento) then
  begin
    mensagem := Format(
      'Campo %s não compõe as bases para o documento modelo %d e foi ignorado no cálculo',
      [info.Tag, TipoDocumento]);
    Result := StringNullable.Create(mensagem);
    Exit;
  end;

  Result := StringNullable.NullInstance();
end;

end.
