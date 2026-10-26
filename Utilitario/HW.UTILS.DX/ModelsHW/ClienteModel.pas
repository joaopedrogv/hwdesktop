unit ClienteModel;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, System.SyncObjs, System.TypInfo,
  System.Generics.Collections, System.JSON, System.Generics.Defaults;

type
  TClienteModel = class(TPersistent)
  private
    Fcod_cliente: Integer;
    Fsinc_hwcloud: string;

    Fnome_cliente: string;
    Frazao: string;
    Frg: string;
    Fcpfcgc: string;
    Fativo: Integer;

    Fconjuge: string;
    Fpai: string;
    Fmae: string;
    
    Fobservacao: string;
    Ffone_cliente: string;
    Festado_civil: string;
    Fnaturalid: string;
    Fsexo: string;

    Fhorario_ini_padrao: string;
    Fhorario_fim_padrao: string;
    Fdias_folga_semana: string;
    Fis_vendedor: Boolean;

    Fnum_end_cliente: string;

    Fdata_cadastro: TDate;
  published
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property sinc_hwcloud: string read Fsinc_hwcloud write Fsinc_hwcloud;
    property nome_cliente: string read Fnome_cliente write Fnome_cliente;
    property razao: string read Frazao write Frazao;
    property rg: string read Frg write Frg;
    property cpfcgc: string read Fcpfcgc write Fcpfcgc;
    property ativo: Integer read Fativo write Fativo;

    property conjuge: string read Fconjuge write Fconjuge;
    property pai: string read Fpai write Fpai;
    property mae: string read Fmae write Fmae;

    property observacao: string read Fobservacao write Fobservacao;
    property fone_cliente: string read Ffone_cliente write Ffone_cliente;
    property estado_civil: string read Festado_civil write Festado_civil;
    property naturalid: string read Fnaturalid write Fnaturalid;
    property sexo: string read Fsexo write Fsexo;

    property num_end_cliente: string read Fnum_end_cliente write Fnum_end_cliente;

    property horario_ini_padrao: string read Fhorario_ini_padrao write Fhorario_ini_padrao;
    property horario_fim_padrao: string read Fhorario_fim_padrao write Fhorario_fim_padrao;
    property dias_folga_semana: string read Fdias_folga_semana write Fdias_folga_semana;
    property is_vendedor: Boolean read Fis_vendedor write Fis_vendedor;

    property data_cadastro: TDate read Fdata_cadastro write Fdata_cadastro;
  end;

implementation

end.
