[X] - Regra Fiscal e tratamento tributário
	[X] - Criar aliquotas de Diferimento
	[X] - Remover campos de aliquota que nao estamos usando
	[X] - Habilitar quando o Tratamento Tributário Indicar
	[X] - Adicionar campos da Tributacao Regular
	[X] - Validar no caso de uso a regra fiscal da trib regular
[X] - Obter tratamento tributário na NF
    [X] - Habilitar no formulario os campos possiveis	
[X] - Impplementar não salvamento de IBSCBS ou IS
	[X] - No contexto colocar um flag: sem_ibscbs
	[X] - O usuário precisa dar o comando para ativar o flag
[ ] - Adicionar Grupo Fiscal IBSCBS no Produto
	Esperar o Odilon comitar
[X] - Totalizar Nota Fiscal com novos campos
[X] - Testar NF Outras
[X] - Testar com Veiculos
[X] - Testar com Despesas
[X] - Testar NF Servicos
[X] - Implementar envio XML
[X] - cMunFG - Usar o codigo do emitente
[X] - Baixar e importar o banco de dados da calculadora
	[X] - Chamada da dll no legado
	[X] - Executar o download
	[X] - Importar os dados	
[X] - RELEASE 4.0.9.3.4
[X] - Colocar travas de emissao de NFCe para cnpj pra 5 jan
[X] - Importacao XML salvar os dados
	[X] - Salvar os dados originais, porém com outro ID no item
[.] - Central de Informaçoes fiscais
    - [X] - Criar grupos fiscais com base nos anexos para classificar os 
		produtos
	[ ] - Atualizar nos produtos o grupo fiscal compativel com o anexo
	[ ] - Analisar a necessidade de salvar a versao que foi 
		configurado, pois se a calc/anexo sofrer atualizacao
		e no cadastro do produto nao ser a mesma coisa entao avisar
	[ ] - Informar e Corrigir produtos com NCM inexistentes ou expirados
	
	Sobre as tela, Tela 1 é o Resumo
		0) Listar os anexos e descrições - Tela 2
			- Trazer o campo de data de revisão, assim o usuario pode decidir
			reclassificar os grupos
			- O usuário pode identificar anexos que nao fazer parte da sua 
			atividade
			- Selecionados os anexos, o sistema vai executar o caso de uso
			e retornar um resumo e dois botoes
				- Display = "898 Produtos podem ser classificados automaticamente"
					-> btnClassificar
					meio que é o Passo 1, Tela 3
				- Display = "72 Produtos precisam ser classificados manualmente"
					-> btnClassificar,  Tela 4
					devem vir ordenados, por NCM? por Anexo? vai alter no grid?
			
		1) Analisar produtos Automaticamente
			Primeiro passo: Lista os anexos em um checkbox
				Seria aqui a listagem de Item do Anexo? acho que sim
				Dar opção de ir para os NCMs(passo 2) ou direto para os produtos 
			Segundo Passo: Lista os NCMs 
				Talvez é aqui que listaria o Item do Anexo! Faz mais sentido?
			Terceiro Passo: Lista os produtos
				Botão confirmar
				
		2) Tem de existir uma outra Tela 5, vindo da Tela Resumo
			Produtos classificados inconpatíveis com o Anexo, 
				Simplesmente identificar o produto que tem um vinculo que nao 
				deveria
				
		3) Tela precisa ser mestre detalhe de NCM com Produtos, pra evitar
		demorar muito processar.
			Entao tem de fazer um Input usando somente o NCM no lugar de grupo
			e codigo
			
			1 Frame pro NCM
			1 Frame com Produto, aquela logica do Vincular vai pra esse frame
				
				
			
			
				
		
	
	
[ ] - Funcionalidades no cadastro de produtos
	[ ] - Identificar Anexo Automaticamente cadastro Produto
	[ ] - Informar NCM inexistentes ou expirados
[ ] - Alteração em lote do flag tipo regra RTC e da Regra Fiscal
[ ] - Criar preferencias de emissao NF na Operacao Interna
	Criar os grupos de dados para pular as telas modais de emissao da 
	nota; Não deve ser obrigatório; A NF deve continuar como está, 
	OpInternadId obrigatorio se configurado.
	[ ] - Modelo? Tipo de emissao? o que mais?
	[ ] - Identificar sobre os veiculos como fazer igual feito com
		TipoVendas
[ ] - Existe a situacao de um NCM em mais anexos, o caso de 3 por exemplo
		25010090, cloreto de sodio, 3 anexos, 5 cclassTrib
		1 Anexo é Fornecimento Composicao para nutricial enteral e parenteral
		1 Anexo é Fornecimento de medicamentos
		1 Anexo diz respeito a emergencia reconhecida no setor publica
		Faz sentido ser o usuario escolher entre o primeiro e o segundo,
		mas o terceiro é por conta de uma situacao momentanea, o que faz sentido
		seria o criar um grupo fiscal fora do anexo, e ter finalidades 
		especificas, e criar os condicionais na funcionalidade das operacoes
		fiscais
[ ] - Dados de Compra Governamental no cabeçalho
[ ] - Implementar classe de validacao para novas regras RTC
	[ ] - Usar UIFormValidator para resolver validações
	[ ] - Criar uma validacao para os grupos no item
[X] - Atualizar fontes com a calculadora v0012
    [.] - Avaliar quais novos flags de grupos foram criados
		[ ] - Flag diferimento tabelas CST na Regra Fiscal
    [ ] - Implementar no formulario as validacoes
[ ] - Analisar sobre o campo vDevTrib como preencher
[ ] - Usar tabela de credito presumido
	[ ] - Ajustar soma 
		vIBS = vIBSUF + vIBSMun – vCredPres (se indDeduzCredPres=1) 
[ ] - Quando produto ter aliquota do imposto seletivo, vincular a unidade 
      do sistema com a unidade da calculadora
	  Asegurar do envio correto do campo de quantidade
[ ] - Adicionar tpCredPresIBSZFM no item NFe
[ ] - Adicionar indBemMovelUsado no item NFe
[ ] - Adicionar indBemMovelUsado no item NFCe (acho que nao, pois o estoque tudo é novo)
[ ] - Regra fiscal com vigencia compativel com classificacao
[ ] - Complementar de NFCe nao faz complemento de IBSCBS
[ ] - Api calculadora tem a descricao do Tratamento tributário
	[ ] - Usar a API publica pra atualizar o banco de dados da calculadora
	[ ] - Usar a descricao para corrigir os dados incorretos ou desatualizados
[ ] - Melhorar os Frames da RTC quando Setup ReadOnly, tem de navegar nos	
	frames, nao pode alterar os campos
[ ] - Efetuar o rateio dos tributos no desmembramento
[ ] - Devolucao de nota que nao teve destaque da RTC, como fazer????, no codigo
	tá ficando sem tributo quando a nota original nao teve, certificar disso!!
[ ] - Após popular as tabelas da RTC recompilar os indices
[ ] - Após executar updates em produtos grupos fiscais, recompilar indices
[ ] - NFSe 
	[ ] - Compra Governamental
	[ ] - Referencia NFSe
	[ ] - Grupo gReeRepRes