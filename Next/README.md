# Telas Next no HWDESKTOP

A aplicação Delphi 2006 abre telas Delphi Rio hospedadas em `hw.next.dll`.
O host usa a API de `HwNextHostUnit` e identifica cada tela pelo nome registrado
no catálogo da DLL.

## Abrir uma tela

Com `HwNextHostUnit` no `uses` do chamador, passe o formulário hospedeiro,
o identificador e as opções de abertura.

```pascal
OpenNextView(Self, 'next.validation', NextQueryOptions());
```

| Opções | Abertura | Fechamento individual |
| --- | --- | --- |
| `NextQueryOptions()` | MDI com instância única | Oculta para reapresentar |
| `NextMultipleOptions(False)` | Nova instância MDI | Oculta |
| `NextMultipleOptions(True)` | Nova instância MDI | Destrói |
| `NextModalOptions()` | Nova instância modal | Destrói |

## Registrar uma tela

1. Crie um descendente de `TfrmNextBase` e adicione sua unit ao projeto
   [hw.next.dproj](Projects/hw.next.dproj).
2. Inclua a unit no `uses` da composição interna da DLL. A função de criação
   recebe `AParent: HWND` e retorna `TfrmNextBase`. Use `CreateParented` na
   classe concreta e entregue as dependências à tela antes de retorná-la.
   Se o preparo falhar após a construção, libere a tela na função e propague o erro.
3. Associe a função a um identificador no
   [catálogo](Interop/Module/NextViewCatalog.pas). Use um nome único,
   com até 63 caracteres ASCII imprimíveis. A busca ignora maiúsculas e minúsculas.

O registro existente é um exemplo de tela com a construção padrão.

```pascal
FRegistry.Register('next.validation', CreateValidationView);
```

A composição executa a função apenas para novas instâncias. Reapresentar uma
consulta oculta reaproveita a tela e suas dependências.

## Fechar uma tela de edição

Sobrescreva `HasPendingChanges` no descendente para indicar se a edição tem
alterações a preservar ou descartar. O botão de fechamento da tela pode usar
`RequestClose` para passar pela mesma consulta do fechamento individual do host.

A base pede confirmação quando há pendência e seleciona **Não** por padrão.
A mensagem informa se a edição será mantida ao ocultar ou descartada ao destruir.
Na troca de usuário e na saída do ERP, o host faz o fechamento coletivo sem
perguntas individuais.

## Compilar a DLL e o host

A [ABI v3](Interop/Contracts/HwNextViewApi.pas) inclui `HwNextCanCloseView`.
Compile a DLL Rio Win32 e os pacotes Delphi 2006 `pkAtivos` e `pkAutomacao` da
mesma revisão. A saída do projeto Next é `bpl/hw.next.dll` na raiz do clone.
Confira se o ERP carrega esse binário ao validar.
