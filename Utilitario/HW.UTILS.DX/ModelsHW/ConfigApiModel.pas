unit ConfigApiModel;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, System.SyncObjs, System.TypInfo,
  System.Generics.Collections, System.JSON, System.Generics.Defaults;

type
  TConfigApiModel = class(TPersistent)
  private
    Fambiente_api: string;
    Fnome_bot: string;
    Fmodelo_padrao: Integer;
    Fdia_mes_ini_fat_meta: Integer;
    Flimite_gastos_meta: Double;
    FempresaId: Integer;
    Fcnpj: string;
    Fidentificacao_emp: string;
    FqueueId: Integer;
    FclienteId: string;
    FcontentType: string;
    Faccept: string;
    Fapi: string;
    FURL: string;
    Ftoken: string;
    Fusuario: string;
    Fsenha: string;
    Fchave: string;
    Fcliente: string;
    Facess_token: string;
    Fauthorization: string;
    Fproducao: Boolean;
    Futil_recomendacao: string;
    Finterv_treino_recomenda: Integer;
    Fdias_vnd_recomenda: Integer;
    Finfo_contato: string;
    Fusar_api_cog: string;
    Fhorario_semana_ini: string;
    Fhorario_semana_fim: string;
    Fhorario_sabado_ini: string;
    Fhorario_sabado_fim: string;
    Fpeso_popularidade: Integer;
    Fpeso_nivel_giro_medio: Integer;
    Fpeso_demanda: Integer;
    Fpeso_frequencia: Integer;
    Fpeso_preco: Integer;
    Fgiro_padrao_baixo_ini: Double;
    Fgiro_padrao_baixo_fim: Double;
    Fgiro_padrao_medio_ini: Double;
    Fgiro_padrao_medio_fim: Double;
    Fgiro_padrao_alto_ini: Double;
    Fgiro_padrao_alto_fim: Double;
    Fsomente_contatos_aceitos: string;
    Fcod_tipo_contato_padrao: Integer;
  published
    property ambiente_api: string read Fambiente_api write Fambiente_api;
    property nome_bot: string read Fnome_bot write Fnome_bot;
    property modelo_padrao: Integer read Fmodelo_padrao write Fmodelo_padrao;
    property dia_mes_ini_fat_meta: Integer read Fdia_mes_ini_fat_meta write Fdia_mes_ini_fat_meta;
    property limite_gastos_meta: Double read Flimite_gastos_meta write Flimite_gastos_meta;
    property empresaId: Integer read FempresaId write FempresaId;
    property cnpj: string read Fcnpj write Fcnpj;
    property identificacao_emp: string read Fidentificacao_emp write Fidentificacao_emp;
    property queueId: Integer read FqueueId write FqueueId;
    property clienteId: string read FclienteId write FclienteId;
    property contentType: string read FcontentType write FcontentType;
    property accept: string read Faccept write Faccept;
    property api: string read Fapi write Fapi;
    property URL: string read FURL write FURL;
    property token: string read Ftoken write Ftoken;
    property usuario: string read Fusuario write Fusuario;
    property senha: string read Fsenha write Fsenha;
    property chave: string read Fchave write Fchave;
    property cliente: string read Fcliente write Fcliente;
    property acess_token: string read Facess_token write Facess_token;
    property authorization: string read Fauthorization write Fauthorization;
    property producao: Boolean read Fproducao write Fproducao;
    property util_recomendacao: string read Futil_recomendacao write Futil_recomendacao;
    property interv_treino_recomenda: Integer read Finterv_treino_recomenda write Finterv_treino_recomenda;
    property info_contato: string read Finfo_contato write Finfo_contato;
    property usar_api_cog: string read Fusar_api_cog write Fusar_api_cog;
    property horario_semana_ini: string read Fhorario_semana_ini write Fhorario_semana_ini;
    property horario_semana_fim: string read Fhorario_semana_fim write Fhorario_semana_fim;
    property horario_sabado_ini: string read Fhorario_sabado_ini write Fhorario_sabado_ini;
    property horario_sabado_fim: string read Fhorario_sabado_fim write Fhorario_sabado_fim;
    property dias_vnd_recomenda: Integer read Fdias_vnd_recomenda write Fdias_vnd_recomenda;
    property peso_popularidade: Integer read Fpeso_popularidade write Fpeso_popularidade;
    property peso_nivel_giro_medio: Integer read Fpeso_nivel_giro_medio write Fpeso_nivel_giro_medio;
    property peso_demanda: Integer read Fpeso_demanda write Fpeso_demanda;
    property peso_frequencia: Integer read Fpeso_frequencia write Fpeso_frequencia;
    property peso_preco: Integer read Fpeso_preco write Fpeso_preco;
    property giro_padrao_baixo_ini: Double read Fgiro_padrao_baixo_ini write Fgiro_padrao_baixo_ini;
    property giro_padrao_baixo_fim: Double read Fgiro_padrao_baixo_fim write Fgiro_padrao_baixo_fim;
    property giro_padrao_medio_ini: Double read Fgiro_padrao_medio_ini write Fgiro_padrao_medio_ini;
    property giro_padrao_medio_fim: Double read Fgiro_padrao_medio_fim write Fgiro_padrao_medio_fim;
    property giro_padrao_alto_ini: Double read Fgiro_padrao_alto_ini write Fgiro_padrao_alto_ini;
    property giro_padrao_alto_fim: Double read Fgiro_padrao_alto_fim write Fgiro_padrao_alto_fim;
    property somente_contatos_aceitos: string read Fsomente_contatos_aceitos write Fsomente_contatos_aceitos;
    property cod_tipo_contato_padrao: Integer read Fcod_tipo_contato_padrao write Fcod_tipo_contato_padrao;
  end;

implementation

end.
