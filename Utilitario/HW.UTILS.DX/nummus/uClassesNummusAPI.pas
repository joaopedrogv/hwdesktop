unit uClassesNummusAPI;

interface

uses
  {$IFDEF VER180}
    UseCaseConsultarSaldoCliente, UseCaseSimularResgateCliente, HW.Servicos, IBQuery;
  {$ELSE}
    UseCaseConsultarSaldoCliente, UseCaseSimularResgateCliente, HW.Servicos, IBX.IBQuery;
  {$ENDIF}

type

  TNummusAPI = class(THwServicos)
  private
    FCodEmpresa: Integer;
    FDataBaseNummus: string;
  public
    function ConsultarSaldoCliente(
      pCodCliente: Integer;
      pCodEmpresa: Integer;
      pDadosNummus: string;
      AMensagemErro: Boolean): Double;

    function SimularResgateCliente(
      pCodCliente: Integer;
      pCodEmpresa: Integer;
      pValorCompra: Double;
      pDadosNummus: string;
      AMensagemErro: Boolean): Double;

    property DataBaseNummus: string read FDataBaseNummus write FDataBaseNummus;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
  var
    vIdCliente: string;
    vDocumentoCliente: string;
    vFoneCliente: string;
    vEmailCliente: string;
  end;

implementation

uses
  {$IFDEF VER180}
    Forms, SysUtils;
  {$ELSE}
    Vcl.Forms, System.SysUtils;
  {$ENDIF}

{ TNummusAPI }

function TNummusAPI.ConsultarSaldoCliente(pCodCliente: Integer; pCodEmpresa: Integer; pDadosNummus: string;
  AMensagemErro: Boolean): Double;
begin
  Result := 0;
  if not conectar(DataBasePath, True)  then
  begin
    registraErro(Format('TNummusAPI.ConsultarSaldoCliente. Erro ao conectar com o Banco %s', [DataBasePath]));
    Exit;
  end;

  try
    try
      vIdCliente        := '';
      vDocumentoCliente := '';
      vFoneCliente      := '';
      vEmailCliente     := '';

      QrAux.Close;
      QrAux.SQL.Text := ' select ' +
        ' clientes_integ.cod_integ, ' +
        ' clientes.cpfcgc, ' +
        ' clientes.email, ' +
        ' clientes.fone_celular from clientes ' +
        ' left join clientes_integ on ' +
        '   clientes_integ.cod_cliente = clientes.cod_cliente ' +
        '   and clientes_integ.cod_empresa = clientes.cod_empresa ' +
        '   and clientes_integ.tipo_integ = 0 ' +
        ' where clientes.cod_cliente = :cod_cliente ' +
        ' and clientes.cod_empresa = :cod_empresa ';
      QrAux.ParamByName('cod_cliente').AsInteger := pCodCliente;
      QrAux.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
      QrAux.Open;

      if not QrAux.IsEmpty then
      begin
        vIdCliente        := trim(QrAux.FieldByName('cod_integ').AsString);
        vDocumentoCliente := trim(QrAux.FieldByName('cpfcgc').AsString);
        vFoneCliente      := trim(QrAux.FieldByName('fone_celular').AsString);
        vEmailCliente     := trim(QrAux.FieldByName('email').AsString);
      end;

      var useCase := TUseCaseConsultarSaldoCliente.Create;

      try
        Result := useCase.Run(vIdCliente, vDocumentoCliente, vFoneCliente, vEmailCliente, pDadosNummus, pCodEmpresa);
      finally
        FreeAndNil(useCase);
      end;

    except on E: Exception do
      begin
        if AMensagemErro then
          Application.MessageBox(PChar('TNummusAPI.ConsultarSaldoCliente. Erro ao consultar saldo acumulado do cliente. Erro: ' + e.Message),'Atenção' , 0 + 64);
      end;
    end;
  finally
    desconectar;
  end;
end;

function TNummusAPI.SimularResgateCliente(
  pCodCliente: Integer;
  pCodEmpresa: Integer;
  pValorCompra: Double;
  pDadosNummus: string;
  AMensagemErro: Boolean): Double;
begin
  Result := 0;
  if not conectar(DataBasePath, True)  then
  begin
    registraErro(Format('TNummusAPI.SimularResgateCliente. Erro ao conectar com o Banco %s', [DataBasePath]));
    Exit;
  end;

  try
    try
      vIdCliente        := '';
      vDocumentoCliente := '';
      vFoneCliente      := '';
      vEmailCliente     := '';

      QrAux.Close;
      QrAux.SQL.Text := ' select ' +
        ' clientes_integ.cod_integ, ' +
        ' clientes.cpfcgc, ' +
        ' clientes.email, ' +
        ' clientes.fone_celular from clientes ' +
        ' left join clientes_integ on ' +
        '   clientes_integ.cod_cliente = clientes.cod_cliente ' +
        '   and clientes_integ.cod_empresa = clientes.cod_empresa ' +
        '   and clientes_integ.tipo_integ = 0 ' +
        ' where clientes.cod_cliente = :cod_cliente ' +
        ' and clientes.cod_empresa = :cod_empresa ';
      QrAux.ParamByName('cod_cliente').AsInteger := pCodCliente;
      QrAux.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
      QrAux.Open;

      if not QrAux.IsEmpty then
      begin
        vIdCliente        := trim(QrAux.FieldByName('cod_integ').AsString);
        vDocumentoCliente := trim(QrAux.FieldByName('cpfcgc').AsString);
        vFoneCliente      := trim(QrAux.FieldByName('fone_celular').AsString);
        vEmailCliente     := trim(QrAux.FieldByName('email').AsString);
      end;

      var useCase := TUseCaseSimularResgateCliente.Create;

      try
        Result := useCase.Run(vIdCliente, vDocumentoCliente, vFoneCliente, vEmailCliente, pDadosNummus, pCodEmpresa, pValorCompra);
      finally
        FreeAndNil(useCase);
      end;

    except on E: Exception do
      begin
        if AMensagemErro then
          Application.MessageBox(PChar('TNummusAPI.SimularResgateCliente. Erro ao consultar saldo disponível cashback. Erro: ' + e.Message),'Atenção' , 0 + 64);
      end;
    end;
  finally
    desconectar;
  end;
end;

end.
