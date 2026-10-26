unit HW.Tray.Api.Category;

interface

uses
  HW.Tray.Api.Image;

type

  TCategory = class
  private
    Fname: String;
    FImages: TArray<TImageTray>;
    Fparent_id: String;
    Fid: String;
    Fdescription: String;
    Fsmall_description: String;
    Fhas_product: String;
  published
    property has_product: String read Fhas_product write Fhas_product;
    property id: String read Fid write Fid;
    property parent_id: String read Fparent_id write Fparent_id;
    property name: String read Fname write Fname;
    property description: String read Fdescription write Fdescription;
    property small_description: String read Fsmall_description write Fsmall_description;
    property Images: TArray<TImageTray> read FImages write FImages;// Collection
  end;

  TCategoryMescladaHw = class(TCategory)
  private
    Fsel: string;
    Fcod_categoria: Integer;
    Fcod_categoria_pai: Integer;
    Fdescricao: string;
    Findex: Integer;
  published
    property sel: string read Fsel write Fsel;
    property cod_categoria: Integer read Fcod_categoria write Fcod_categoria;
    property cod_categoria_pai: Integer read Fcod_categoria_pai write Fcod_categoria_pai;
    property descricao: string read Fdescricao write Fdescricao;
    property index: Integer read Findex write Findex;
  end;

  TCategoriaHw = class(TCategory)
  private
    Fcod_categoria    : Integer;
    Fcod_empresa      : Integer;
    Fdescricao        : string;
    Fcod_categoria_pai: Integer;
    Fid_commerce      : Integer;
    Fativo            : Integer;
    Fname_commerce    : string;
  published
    property cod_categoria    : Integer read Fcod_categoria     write Fcod_categoria;
    property cod_empresa      : Integer read Fcod_empresa       write Fcod_empresa;
    property descricao        : string  read Fdescricao         write Fdescricao;
    property cod_categoria_pai: Integer read Fcod_categoria_pai write Fcod_categoria_pai;
    property id_commerce      : Integer read Fid_commerce       write Fid_commerce;
    property ativo            : Integer read Fativo             write Fativo;
    property name_commerce    : string  read Fname_commerce     write Fname_commerce;
  end;

implementation

end.

