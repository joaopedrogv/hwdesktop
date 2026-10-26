unit nfc_pagamento_class;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type
  Tnfc_pagamento_class = class(TBaseFb_class)
  private
    Fcod_nfce      : Integer;
    Fcod_empresa   : Integer;
    Fseqid         : Integer;
    Ftpag          : Variant;
    Fvpag          : Variant;
    Fcnpj          : string;
    Ftband         : Variant;
    Fcaut          : string;
    Fcod_controle  : Variant;
    Ftpintegra     : string;
    Findpag        : string;
    Fid_tr_cartao  : Variant;
    Fguidt         : string;
    Fguid_tr_cartao: string;
    Fguid_nfce     : string;
    Fxpag          : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_nfce      : Integer read Fcod_nfce       write Fcod_nfce;
    property cod_empresa   : Integer read Fcod_empresa    write Fcod_empresa;
    property seqid         : Integer read Fseqid          write Fseqid;
    property tpag          : Variant read Ftpag           write Ftpag;
    property vpag          : Variant read Fvpag           write Fvpag;
    property cnpj          : string  read Fcnpj           write Fcnpj;
    property tband         : Variant read Ftband          write Ftband;
    property caut          : string  read Fcaut           write Fcaut;
    property cod_controle  : Variant read Fcod_controle   write Fcod_controle;
    property tpintegra     : string  read Ftpintegra      write Ftpintegra;
    property indpag        : string  read Findpag         write Findpag;
    property id_tr_cartao  : Variant read Fid_tr_cartao   write Fid_tr_cartao;
    property guidt         : string  read Fguidt          write Fguidt;
    property guid_tr_cartao: string  read Fguid_tr_cartao write Fguid_tr_cartao;
    property guid_nfce     : string  read Fguid_nfce      write Fguid_nfce;
    property xpag          : string  read Fxpag           write Fxpag;
  end;

  Tnfc_pagamento_classList = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): Tnfc_pagamento_class;
    procedure SetItem(Index: Integer; const Value: Tnfc_pagamento_class);
  public
    function New: Tnfc_pagamento_class;

    property Items[Index: Integer]: Tnfc_pagamento_class read GetItem write SetItem;
  end;

implementation

{ Tnfc_pagamento_class }

procedure Tnfc_pagamento_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('NFCE_PAGAMENTO');
  with FTable.Fields do
  begin
    AddField('COD_NFCE'      , fkInteger, 0 , False, True , True       );
    AddField('COD_EMPRESA'   , fkInteger, 0 , False, True , True       );
    AddField('SEQID'         , fkInteger, 0 , False, True              );
    AddField('TPAG'          , fkInteger                               );
    AddField('VPAG'          , fkFloat  , 0 , True , False, False, True);
    AddField('CNPJ'          , fkString , 14                           );
    AddField('TBAND'         , fkInteger                               );
    AddField('CAUT'          , fkString , 20                           );
    AddField('COD_CONTROLE'  , fkInteger                               );
    AddField('TPINTEGRA'     , fkString , 1                            );
    AddField('INDPAG'        , fkString , 1                            );
    AddField('ID_TR_CARTAO'  , fkInteger                               );
    AddField('GUIDT'         , fkString , 36                           );
    AddField('GUID_TR_CARTAO', fkString , 36                           );
    AddField('GUID_NFCE'     , fkString , 36                           );
    AddField('XPAG'          , fkString , 60                           );
  end;
end;

constructor Tnfc_pagamento_class.Create;
begin
  InitializeObjects;
end;

{ Tnfc_pagamento_classList }

function Tnfc_pagamento_classList.GetItem(Index: Integer): Tnfc_pagamento_class;
begin
  Result := Tnfc_pagamento_class(inherited Items[Index]);
end;

function Tnfc_pagamento_classList.New: Tnfc_pagamento_class;
begin
  Result := Tnfc_pagamento_class.Create;
  Add(Result);
end;

procedure Tnfc_pagamento_classList.SetItem(Index: Integer; const Value: Tnfc_pagamento_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(Tnfc_pagamento_class);
finalization
  UnRegisterClass(Tnfc_pagamento_class);

end.
