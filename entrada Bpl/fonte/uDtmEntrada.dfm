object dtmEnt: TdtmEnt
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 448
  Width = 638
  object cdsSenha: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSenha'
    BeforeOpen = cdsSenhaBeforeOpen
    Left = 27
    Top = 175
    object cdsSenhaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsSenhaDEPART: TStringField
      FieldName = 'DEPART'
      Size = 30
    end
    object cdsSenhaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsSenhaSENHA: TStringField
      FieldName = 'SENHA'
      FixedChar = True
      Size = 6
    end
    object cdsSenhaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSenhaNIVEL_US: TIntegerField
      FieldName = 'NIVEL_US'
    end
    object cdsSenhaALT_IMP: TStringField
      FieldName = 'ALT_IMP'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaIMP_US: TStringField
      FieldName = 'IMP_US'
      FixedChar = True
      Size = 15
    end
    object cdsSenhaESTOQ_NEG: TStringField
      FieldName = 'ESTOQ_NEG'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaNOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object cdsSenhaCGC_EMP: TStringField
      FieldName = 'CGC_EMP'
      Size = 18
    end
    object cdsSenhaEXIBIR_MENSAGEM_CONSORCIO: TStringField
      FieldName = 'EXIBIR_MENSAGEM_CONSORCIO'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsSenhaDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
    object cdsSenhaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 128
    end
    object cdsSenhaCOD_PERFIL_HORAS_TRAB: TIntegerField
      FieldName = 'COD_PERFIL_HORAS_TRAB'
    end
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = cdsSenhaBeforeOpen
    Left = 97
    Top = 176
    object cdsEmpresaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresaNOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Size = 50
    end
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHw
    SQL.Strings = (
      
        'select cod_empresa,(nome_emp||'#39' - '#39'||cgc_emp) as nome_emp from e' +
        'mpresa')
    Left = 97
    Top = 64
  end
  object qrSenha: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHw
    SQL.Strings = (
      
        'select col.nome_vendedor, s.codigo, dep.nome_depto depart, f.des' +
        'c_funcao,'
      's.usuario, s.senha, s.cod_empresa, s.nivel_us,'
      
        's.ALT_IMP, s.IMP_US, s.estoq_neg, e.nome_emp, e.CGC_EMP, s.EXIBI' +
        'R_MENSAGEM_CONSORCIO, s.cod_perfil_horas_trab from SENHAS S'
      
        'inner join colaborador col on col.cod_vendedor = s.codigo and co' +
        'l.cod_empresa = s.cod_empresa'
      'inner join empresa e on e.cod_empresa = s.cod_empresa'
      'left join funcoes f on f.cod_funcao = col.cod_funcao'
      'left join depto dep on dep.cod_depto = f.cod_depto'
      'where S.USUARIO = :USUARIO'
      'and S.cod_empresa =:COD_EMPRESA and S.ativo = 1')
    Left = 27
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object transacaoTemp: TIBTransaction
    DefaultDatabase = bancoTemp
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 480
    Top = 64
  end
  object SpIncCodigo: TIBStoredProc
    Database = bancoTemp
    Transaction = transacaoTemp
    Left = 168
    Top = 8
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoHw
    Left = 240
    Top = 8
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 97
    Top = 120
  end
  object dsEmpresa: TDataSource
    AutoEdit = False
    DataSet = cdsEmpresa
    Left = 97
    Top = 232
  end
  object dspSenha: TDataSetProvider
    DataSet = qrSenha
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 27
    Top = 122
  end
  object dsSenha: TDataSource
    AutoEdit = False
    DataSet = cdsSenha
    Left = 27
    Top = 232
  end
  object bancoTemp: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 480
    Top = 16
  end
  object transacaoHw: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 392
    Top = 8
  end
  object cdsEmpDes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpDes'
    BeforeOpen = cdsSenhaBeforeOpen
    Left = 169
    Top = 176
    object cdsEmpDesCOD_EMPDES: TIntegerField
      FieldName = 'COD_EMPDES'
      Required = True
    end
    object cdsEmpDesNOME_EMPDES: TStringField
      FieldName = 'NOME_EMPDES'
      Required = True
      Size = 40
    end
    object cdsEmpDesCNPJ_EMPDES: TStringField
      FieldName = 'CNPJ_EMPDES'
      Required = True
      Size = 14
    end
    object cdsEmpDesCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsEmpDesIE_EMPDES: TStringField
      FieldName = 'IE_EMPDES'
      Required = True
      Size = 14
    end
    object cdsEmpDesIM_EMPDES: TStringField
      FieldName = 'IM_EMPDES'
      Required = True
      Size = 14
    end
    object cdsEmpDesDATA_CAD_EMPDES: TDateTimeField
      FieldName = 'DATA_CAD_EMPDES'
    end
    object cdsEmpDesDATA_MOD_EMPDES: TDateTimeField
      FieldName = 'DATA_MOD_EMPDES'
    end
    object cdsEmpDesATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsEmpDesENDERECO_EMPDES: TStringField
      FieldName = 'ENDERECO_EMPDES'
      Required = True
      Size = 50
    end
    object cdsEmpDesBAIRRO_EMPDES: TStringField
      FieldName = 'BAIRRO_EMPDES'
      Required = True
      Size = 30
    end
    object cdsEmpDesCIDADE_EMPDES: TStringField
      FieldName = 'CIDADE_EMPDES'
      Required = True
      Size = 30
    end
    object cdsEmpDesFONE_EMPDES: TStringField
      FieldName = 'FONE_EMPDES'
      Required = True
      Size = 13
    end
    object cdsEmpDesCONTATO_EMPDES: TStringField
      FieldName = 'CONTATO_EMPDES'
      Required = True
      Size = 30
    end
    object cdsEmpDesUF_EMPDES: TStringField
      FieldName = 'UF_EMPDES'
      FixedChar = True
      Size = 2
    end
    object cdsEmpDesSITE: TStringField
      FieldName = 'SITE'
      Size = 64
    end
  end
  object qrEmpDes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoEmpDes
    SQL.Strings = (
      'select * from EMPDESVOLV')
    Left = 169
    Top = 64
  end
  object dspEmpDes: TDataSetProvider
    DataSet = qrEmpDes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 169
    Top = 120
  end
  object qrTemp: TIBQuery
    Database = bancoTemp
    Transaction = transacaoTemp
    Left = 536
    Top = 16
  end
  object transacaoEmpDes: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 88
  end
end
