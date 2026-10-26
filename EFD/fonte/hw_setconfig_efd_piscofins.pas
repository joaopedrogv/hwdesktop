unit hw_setconfig_efd_piscofins;

interface

uses
  hw_setconfig_base;

type
  TSetConfigPisCofins = class(TSetConfigBase)
  public
    function Execute: Boolean; override;
  end;

implementation

uses
  SysUtils,
  config_sistema_class, hw_win_utils;

{ TSetConfigPisCofins }

function TSetConfigPisCofins.Execute: Boolean;
var
  I: Integer;
  conf: TConfig_sistema_class;
begin
  try
    if VersaoBancoMenor(1) then
    begin
      New('efd_piscofins_versao_config',
          'EFD CONTRIBUIÇÕES - Versao da configuração do sistema',
          0);
      New('efd_piscofins_valor_st_ipi_em_vlmerc',
          'EFD CONTRIBUIÇÕES - Apurar o valor da ST e IPI nos campos correspondentes ao valor da mercadoria(Conforme Manual EFD ICMSIPI)',
          True);
    end;

    if VersaoBancoMenor(2) then
      New('efd_piscofins_d100_campo_vl_nt_zerado',
          'EFD CONTRIBUIÇÕES - D100 - Zerar campo Valor não-tributado(VL_NT)',
          False);

    if VersaoBancoMenor(3) then
      New('efd_piscofins_valor_st_ipi_zerado',
          'EFD CONTRIBUIÇÕES - Apurar o valor da ST e IPI zerados',
          False);

    if VersaoBancoMenor(4) then
      New('efd_piscofins_entada_dev_cpf',
          'EFD CONTRIBUIÇÕES - Escriturar notas fiscais de devolução de venda a cliente com CPF',
          False);

    if VersaoBancoMenor(5) then
    begin
      conf := New('efd_piscofins_data_emiss', 'EFD CONTRIBUIÇÕES - Configuração de data Registros C100 e D500');
      if conf <> nil then
        conf.WriteString('Conf', 'DataEmissaoIgualDataEntrada', 'N');
    end;

    if VersaoBancoMenor(6) then
      New('efd_piscofins_c175_icms_em_vldesc',
          'EFD CONTRIBUIÇÕES - C175 - Adicionar valor do ICMS excluído da base de calculo ao campo de desconto(VL_DESC)', False);

    ExecuteDone;

  except
    on e: exception do
    begin
      LastError := 'Erro ao abrir configuracoes (TSetConfigPisCofins.Execute). Erro: ' + e.Message;
      LogApp.Error('TSetConfigPisCofins.Execute. Erro: ' + e.Message);
    end;
  end;
end;

end.
