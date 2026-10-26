unit Hw.Nuvemshop.Api.Category;

interface

type
  TDescription = class;
  THandle = class;
  TName = class;
  TSeoDescription = class;
  TSeoTitle = class;

  TSeoDescription = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  TSeoTitle = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  TDescription = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  THandle = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  TName = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  TCategory = class
  private
    FId: Integer;
    Fname_category: string;
    FName: TName;
    FParent: Integer;
    FSubcategories: TArray<Integer>;
  published
    property Id: Integer read FId write FId;
    property name_category: string read Fname_category write Fname_category;
    property Name: TName read FName write FName;
    property Parent: Integer read FParent write FParent;
    property Subcategories: TArray<Integer> read FSubcategories write FSubcategories;
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
    Fname_commerce    : string;
    Fativo            : Integer;
    Fname             : TName;
  published
    property cod_categoria    : Integer read Fcod_categoria     write Fcod_categoria;
    property cod_empresa      : Integer read Fcod_empresa       write Fcod_empresa;
    property descricao        : string  read Fdescricao         write Fdescricao;
    property cod_categoria_pai: Integer read Fcod_categoria_pai write Fcod_categoria_pai;
    property id_commerce      : Integer read Fid_commerce       write Fid_commerce;
    property name_commerce     : string read Fname_commerce     write Fname_commerce;
    property ativo            : Integer read Fativo             write Fativo;
    property Name             : TName   read FName              write FName;
  end;


implementation

end.
