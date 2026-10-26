unit MunicipioRenaveModel;

interface

uses
  System.Classes;

type

  TMunicipioRenaveModel = class(TPersistent)
  private
    Fid: string;
    Fnome: string;
    Fuf: string;
  published
    property id: string read Fid write Fid;
    property nome: string read Fnome write Fnome;
    property uf: string read Fuf write Fuf;
  end;

implementation

end.
