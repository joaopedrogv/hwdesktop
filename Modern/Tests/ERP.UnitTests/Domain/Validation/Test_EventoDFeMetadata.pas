unit Test_EventoDFeMetadata;

interface

uses
  DUnitX.TestFramework,
  EntityMetadataUnit,
  EventoDFe112150MetadataUnit,
  EventoDFe211130MetadataUnit;

type
  [TestFixture]
  TTestEventoDFeMetadata = class
  public
    [Test]
    procedure DeveDescreverTabelaEEntidade112150;

    [Test]
    procedure DeveRegistrarAtributos112150;

    [Test]
    procedure DeveRegistrarAtributos211130;

    [Test]
    procedure DeveUsarRotuloDaChaveDaNFeEmAmbos;
  end;

implementation

{ TTestEventoDFeMetadata }

procedure TTestEventoDFeMetadata.DeveDescreverTabelaEEntidade112150;
var
  Metadata: EntityMetadata;
begin
  Metadata := TEventoDFe112150Metadata.GetMetadata();

  Assert.AreEqual('Evento DF-e 112150', Metadata.DisplayName);
  Assert.AreEqual('EVENTOS_DFE', Metadata.TableName);
end;

procedure TTestEventoDFeMetadata.DeveRegistrarAtributos112150;
var
  Metadata: EntityMetadata;
  Codigo: string;
  Situacao: string;
  DataPrevisao: string;
begin
  Metadata := TEventoDFe112150Metadata.GetMetadata();

  Codigo := 'C' + #243 + 'digo';
  Situacao := 'Situa' + #231 + #227 + 'o';
  DataPrevisao := 'Data de previs' + #227 + 'o de entrega';

  Assert.AreEqual(Codigo, Metadata.GetDisplayAttribute('SeqId'));
  Assert.AreEqual('Documento', Metadata.GetDisplayAttribute('FamiliaDocumento'));
  Assert.AreEqual(Situacao, Metadata.GetDisplayAttribute('Ativo'));
  Assert.AreEqual(DataPrevisao, Metadata.GetDisplayAttribute('DataPrevisaoEntrega'));
  Assert.AreEqual('TIPO_EVENTO', Metadata.Attribute['TipoEvento'].FieldName);
end;

procedure TTestEventoDFeMetadata.DeveRegistrarAtributos211130;
var
  Metadata: EntityMetadata;
  Codigo: string;
begin
  Metadata := TEventoDFe211130Metadata.GetMetadata();

  Codigo := 'C' + #243 + 'digo';

  Assert.AreEqual('Evento DF-e 211130', Metadata.DisplayName);
  Assert.AreEqual('EVENTOS_DFE', Metadata.TableName);
  Assert.AreEqual(Codigo, Metadata.GetDisplayAttribute('SeqId'));
  Assert.AreEqual('Itens do evento', Metadata.GetDisplayAttribute('Itens'));
  Assert.AreEqual('', Metadata.Attribute['Itens'].FieldName);
end;

procedure TTestEventoDFeMetadata.DeveUsarRotuloDaChaveDaNFeEmAmbos;
var
  Metadata112150: EntityMetadata;
  Metadata211130: EntityMetadata;
begin
  Metadata112150 := TEventoDFe112150Metadata.GetMetadata();
  Metadata211130 := TEventoDFe211130Metadata.GetMetadata();

  Assert.AreEqual('Chave da NF-e',
    Metadata112150.GetDisplayAttribute('ChaveDocumento'));
  Assert.AreEqual('Chave da NF-e',
    Metadata211130.GetDisplayAttribute('ChaveDocumento'));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestEventoDFeMetadata);

end.
