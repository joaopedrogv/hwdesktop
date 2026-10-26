library hw.nfe.v400.dx;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.Classes,
  System.SysUtils,
  uClasseConexao in '..\Automacao Bpl\fonte\uClasseConexao.pas',
  hw.nfe.export.dx in 'NF\hw.nfe.export.dx.pas',
  hw.nfe.classes.dx in 'NF\hw.nfe.classes.dx.pas',
  empresa_nfe_class in '..\Ativos\fonte\empresa_nfe_class.pas',
  notafiscal_class in '..\Ativos\fonte\notafiscal_class.pas',
  notafiscal_dup_class in '..\Ativos\fonte\notafiscal_dup_class.pas',
  notafiscal_item_class in '..\Ativos\fonte\notafiscal_item_class.pas',
  notafiscal_item_veiculo_class in '..\Ativos\fonte\notafiscal_item_veiculo_class.pas',
  notafiscal_pag_class in '..\Ativos\fonte\notafiscal_pag_class.pas',
  notafiscal_item_adi_class in '..\Ativos\fonte\notafiscal_item_adi_class.pas',
  notafiscal_item_di_class in '..\Ativos\fonte\notafiscal_item_di_class.pas',
  notafiscal_item_detexport_class in '..\Ativos\fonte\notafiscal_item_detexport_class.pas',
  notafiscal_item_exportind_class in '..\Ativos\fonte\notafiscal_item_exportind_class.pas',
  notafiscal_sped_c113_class in '..\Ativos\fonte\notafiscal_sped_c113_class.pas',
  notafiscal_sped_c114_class in '..\Ativos\fonte\notafiscal_sped_c114_class.pas',
  notafiscal_sped_c115_class in '..\Ativos\fonte\notafiscal_sped_c115_class.pas',
  transportador_class in '..\Ativos\fonte\transportador_class.pas',
  config_sistema_class in '..\Ativos\fonte\config_sistema_class.pas',
  notafiscal_sped_c111_class in '..\Ativos\fonte\notafiscal_sped_c111_class.pas',
  notafiscal_carta_correcao_class in '..\Ativos\fonte\notafiscal_carta_correcao_class.pas',
  notafiscal_inut_class in '..\Ativos\fonte\notafiscal_inut_class.pas',
  produtos_class in '..\Ativos\fonte\produtos_class.pas';

{$R *.res}

end.
