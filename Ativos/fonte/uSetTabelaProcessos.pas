unit uSetTabelaProcessos;

interface

uses
  tabela_processos_class, Classes, IBQuery, IBDatabase;

type
  TSetTabelaProcessos = class
  private
    Fprcss: TTabela_processos_classList;
    Fcod_empresa: Integer;


    function NewPrcss(Acod_processo: string;
                      Anivel_processo: Smallint;
                      Anome_processo: string;
                      Asenha_gerente: Boolean = False;
                      Agravar_auditoria: Boolean = True;
                      Aform: string = '.'): TTabela_processos_class;

    procedure criarLista_CLI;
    procedure criarLista_NF;
    procedure criarLista_NFE;
  public
    constructor create;
    destructor Destroy; override;

    procedure verificar_processo(Aprocesso, AcodEmpresa: string; buscas: TIBQuery);

  end;

implementation

uses
  SysUtils, StrUtils, Contnrs, IBCustomDataSet, Forms;


{ TSetTabelaProcessos }

constructor TSetTabelaProcessos.create;
begin

end;

procedure TSetTabelaProcessos.criarLista_CLI;
begin
  Fprcss.Add(NewPrcss('CLI217', 003, 'BT NOVO ENDERECO ADICIONAL CLIENTE'));
  Fprcss.Add(NewPrcss('CLI218', 003, 'BT EXCLUIR ENDERECO ADICIONAL CLIENTE', True));
  Fprcss.Add(NewPrcss('CLI219', 003, 'BT ALTERAR ENDERECO ADICIONAL CLIENTE'));
  Fprcss.Add(NewPrcss('CLI220', 003, 'BT SALVAR ENDERECO ADICIONAL CLIENTE'));
end;

procedure TSetTabelaProcessos.criarLista_NF;
begin
  Fprcss.Add(NewPrcss('NF0200', 100, 'BT EXCLUIR PAG NFE ORIGEM PEDIDO', True));
  Fprcss.Add(NewPrcss('NF0201', 100, 'BT PAG NFE SEM FORMA', True));
  Fprcss.Add(NewPrcss('NF0202', 100, 'BT ALTERAR PAG NFE ORIGEM PEDIDO', True));
  Fprcss.Add(NewPrcss('NF0203', 006, 'HAB ALTERAR FORMEMISS NFE', False, False));
end;

procedure TSetTabelaProcessos.criarLista_NFE;
begin
//  Fprcss.Add(NewPrcss('NFE001', 100, 'BT EXCLUIR PAG NFE ORIGEM PEDIDO', True));
//  Fprcss.Add(NewPrcss('NFE002', 100, 'BT EXCLUIR PAG NFE ORIGEM PEDIDO', True));
//  Fprcss.Add(NewPrcss('NFE003', 100, 'BT EXCLUIR PAG NFE ORIGEM PEDIDO', True));
//  Fprcss.Add(NewPrcss('NFE004', 100, 'BT EXCLUIR PAG NFE ORIGEM PEDIDO', True));
  Fprcss.Add(NewPrcss('NFE005', 010, 'BT NFE VER INUTILIZACAO'));
  Fprcss.Add(NewPrcss('NFE006', 010, 'BT NFE NOVA INUTILIZACAO'));
  Fprcss.Add(NewPrcss('NFE007', 100, 'BT NFE NOVA INUTILIZACAO FAIXA', True));
  Fprcss.Add(NewPrcss('NFE008', 010, 'BT NFE EMAIL INUTILIZACAO'));
  Fprcss.Add(NewPrcss('NFE009', 010, 'BT NFE COPIAR XML AREA TRANSF'));
  Fprcss.Add(NewPrcss('NFE010', 010, 'BT NFE VISUALIZAR XML'));
  Fprcss.Add(NewPrcss('NFE011', 010, 'BT NFE SALVAR XML'));
end;

destructor TSetTabelaProcessos.Destroy;
begin
  if Assigned(Fprcss) then
    FreeAndNil(Fprcss);  
  inherited;
end;

function TSetTabelaProcessos.NewPrcss(Acod_processo: string;
                          Anivel_processo: Smallint;
                          Anome_processo: string;
                          Asenha_gerente: Boolean;
                          Agravar_auditoria: Boolean;
                          Aform: string): TTabela_processos_class;
begin
  Result := TTabela_processos_class.Create;
  Result.cod_processo     := Acod_processo;
  Result.nivel_processo   := Anivel_processo;
  Result.nome_processo    := Anome_processo;
  Result.senha_gerente    := IfThen(Asenha_gerente, 'S', 'N');
  Result.gravar_auditoria := IfThen(Agravar_auditoria, 'S', 'N');
  Result.form             := Aform;
end;

procedure TSetTabelaProcessos.verificar_processo(Aprocesso,
  AcodEmpresa: string; buscas: TIBQuery);
var
  I: Integer;
  Atransacao: TIBTransaction;
  Aquery: TIBQuery;
begin
  Fcod_empresa := StrToInt(AcodEmpresa);
  Aprocesso := Trim(UpperCase(Aprocesso));

  if not Assigned(Fprcss) then
  begin
    Fprcss := TTabela_processos_classList.Create;

    criarLista_CLI;
    criarLista_NF;
    criarLista_NFE;

  end;

  {$REGION 'procurando e gravando no banco o processo'}
  for I := 0 to Fprcss.Count - 1 do
    if Fprcss.Items[I].cod_processo = Aprocesso then
    begin
      Atransacao := TIBTransaction.Create(nil);
      Aquery := TIBQuery.Create(nil);
      try
        Aquery.Database := buscas.Database;
        Atransacao.DefaultDatabase := Aquery.Database;
        Aquery.Transaction := Atransacao;

        if Fprcss.Items[I].form = '.' then
          if Assigned(Screen) then
            if Assigned(Screen.ActiveForm) then
              Fprcss.Items[I].form := UpperCase(Trim(Screen.ActiveForm.Name));        

        Aquery.Close;
        Aquery.SQL.Text := 'insert into TABELA_PROCESSOS (cod_processo, cod_empresa, nome_processo, nivel_processo,' +
                           ' senha_gerente, form, gravar_auditoria, data_mod_cad)' +
                           ' values' +
                           ' (:cod_processo, :cod_empresa, :nome_processo, :nivel_processo,' +
                           ' :senha_gerente, :form, :gravar_auditoria, (select current_d from sp_current_ts(:cod_empresa)))';
        Aquery.ParamByName('cod_processo').AsString     := Copy(Fprcss.Items[I].cod_processo, 1, 10);
        Aquery.ParamByName('cod_empresa').AsInteger     := Fcod_empresa;
        Aquery.ParamByName('nome_processo').AsString    := Copy(Fprcss.Items[I].nome_processo, 1, 50);
        Aquery.ParamByName('nivel_processo').AsInteger  := Fprcss.Items[I].nivel_processo;
        Aquery.ParamByName('senha_gerente').AsString    := Copy(Fprcss.Items[I].senha_gerente, 1, 1);
        Aquery.ParamByName('form').AsString             := Copy(Fprcss.Items[I].form, 1, 30);
        Aquery.ParamByName('gravar_auditoria').AsString := Copy(Fprcss.Items[I].gravar_auditoria,1 ,1);
        Aquery.ExecSQL;
        if Aquery.Transaction.InTransaction then
          Aquery.Transaction.Commit;
        Aquery.Close;

        Break;
      finally
        FreeAndNil(Aquery);
        FreeAndNil(Atransacao);
      end;
    end;
  {$ENDREGION}

end;

end.
