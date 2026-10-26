unit UsuarioSenhaModel;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, System.SyncObjs, System.TypInfo,
  System.Generics.Collections, System.JSON, System.Generics.Defaults;

type
  TUsuarioSenhaModel = class(TPersistent)
  private
    Fusuario: string;
    Fsenha: string;
    Fcdpessoa: string;
    Ftipo_pessoa: string;
    Fcontato: string;
  public
    property usuario: string read Fusuario write Fusuario;
    property senha: string read Fsenha write Fsenha;
    property cdpessoa: string read Fcdpessoa write Fcdpessoa;
    property tipo_pessoa: string read Ftipo_pessoa write Ftipo_pessoa;
    property contato: string read Fcontato write Fcontato;
  end;

implementation

end.
