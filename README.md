# **Oficina - Narrativa**

- [x]  Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica;
- [x]  Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas;
- [x]  Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega;
- [x]  A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referencia de mão de obra;
- [x]  O valor de cada peça também irá compor a OS;
- [x]  O cliente autoriza a execução da OS;
- [x]  A mesma equipe avalia e executa os serviços
- [x]  Os mecanicos possuem código, nome, endereço e especialidade
- [x]  Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos
- [x]  Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS;
- [x]  Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS

# **Descrição do Desafio**

Para este cenário você irá utilizar seu esquema conceitual, criado no desafio do módulo de modelagem de BD com modelo ER, para criar o esquema lógico para o contexto de uma oficina. Neste desafio, você definirá todas as etapas. Desde o esquema até a implementação do banco de dados. Sendo assim, neste projeto você será o protagonista. Tenha os mesmos cuidados, apontados no desafio anterior, ao modelar o esquema utilizando o modelo relacional.

Após a criação do esquema lógico, realize a criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realize a persistência de dados para realização de testes. Especifique ainda queries mais complexas do que apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:

# Teoria Dos Conjuntos (Representação Gráfica)
![Exemplo de conjunto de dados](conjunto_de_dados_exemplo.png)


- Recuperações simples com SELECT Statement;

```sql
SELECT *
FROM `veículo`;

SELECT *
FROM `Conserto`;

SELECT *
FROM Revisão;

SELECT *
FROM Mecânico;

SELECT *
FROM `ordem de serviço - os`;

SELECT *
FROM Veículo;

SELECT *
FROM clientes;

SELECT * FROM PessoaFisica;

SELECT *
FROM pessoajuridica;

SELECT *
FROM autorizaçãocliente;


SELECT *
FROM `tabela referencia preços`;

SELECT *
FROM serviços;

SELECT * 
FROM `peças`;

SELECT *
FROM `os tem peças`;


SELECT *
FROM `os tem serviços`;
```

- Filtros com WHERE Statement;

```sql
SELECT *
FROM `veículo`
WHERE idVeículo = 1;
```

- Crie expressões para gerar atributos derivados;

```sql
SELECT 
OS.`idOrdem de Serviço - OS`,
OS.`Data de emissão`,
OS.`Valor serviço`,
OS.`Valor peça`,
ROUND(OS.`Valor peça` + OS.`Valor serviço`, 2) AS Valor_Total,
OS.`Status`,
OS.`Data de conclusão`
FROM `ordem de serviço - os` AS OS;
```

- Defina ordenações dos dados com ORDER BY;

```sql
SELECT 
OS.`idOrdem de Serviço - OS`,
OS.`Data de emissão`,
OS.`Valor serviço`,
OS.`Valor peça`,
ROUND(OS.`Valor peça` + OS.`Valor serviço`, 2) AS Valor_Total,
OS.`Status`,
OS.`Data de conclusão`
FROM `ordem de serviço - os` AS OS
ORDER BY Valor_Total DESC;
```

- Condições de filtros aos grupos – HAVING Statement;

```sql
SELECT 
    OS.`idOrdem de Serviço - OS`,
    OS.`Data de emissão`,
    OS.`Valor serviço`,
    OS.`Valor peça`,
    ROUND(OS.`Valor peça` + OS.`Valor serviço`, 2) AS Valor_Total,
    OS.`Status`,
    OS.`Data de conclusão`
FROM `ordem de serviço - os` AS OS
HAVING Valor_Total > 1000
ORDER BY Valor_Total DESC;

-- OU

SELECT 
    OS.`idOrdem de Serviço - OS`,
	OS.`Data de emissão`,
    OS.`Status`,
    OS.`Valor serviço`,
    OS.`Valor peça`,
    OS.`Data de conclusão`,
    ROUND(AVG(OS.`Valor peça` + OS.`Valor serviço`),2) AS Valor_Total_Médio
FROM `ordem de serviço - os` AS OS
GROUP BY OS.`Status`, `Data de emissão`, `Valor serviço`, `Valor peça`, `Data de conclusão`, `idOrdem de Serviço - OS`
HAVING Valor_Total_Médio > 500;
```

- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;

```sql
SELECT OS.*, AC.Autorizado, PF.Nome, PF.CPF, PF.Endereço, PF.Contato
FROM `ordem de serviço - os` AS OS 
JOIN `autorizaçãocliente` AS AC 
ON OS.`idOrdem de Serviço - OS` = AC.`Ordem de Serviço - OS_idOrdem de Serviço - OS`
JOIN `clientes` AS C
ON AC.`Clientes_idClientes` = C.`idClientes`
JOIN `pessoafisica` AS PF
ON C.`idClientes` = PF.`Clientes_idClientes`;
```

## **Diretrizes**

- Não há um mínimo de queries a serem realizadas;
- Os tópicos supracitados devem estar presentes nas queries;
- Elabore perguntas que podem ser respondidas pelas consultas
- As cláusulas podem estar presentes em mais de uma query

O projeto deverá ser adicionado a um repositório do Github para futura avaliação do desafio de projeto. Adicione ao Readme a descrição do projeto lógico para fornecer o contexto sobre seu esquema lógico apresentado.

## Diagrama De Classes

```mermaid
classDiagram
  class PessoaFisica {
    +idPessoaFisica: INT
    +Nome: VARCHAR[45]
    +CPF: CHAR[11]
    +Endereço: VARCHAR[45]
    +Contato: CHAR[11]
    +Clientes_idClientes: INT
    +Clientes_Veículo_idVeículo: INT
    --
    +getInfo()
  }

  class PessoaJuridica {
    +idPessoaJuridica: INT
    +RazaoSocial: VARCHAR[45]
    +CNPJ: CHAR[15]
    +Endereço: VARCHAR[45]
    +Contato: CHAR[11]
    +Clientes_idClientes: INT
    +Clientes_Veículo_idVeículo: INT
    --
    +getInfo()
  }

  class Clientes {
    +idClientes: INT
    +Veículo_idVeículo: INT
    --
    +getInfo()
  }

  class Veículo {
    +idVeículo: INT
    +Equipe_mecânicos_idEquipe_mecânicos: INT
    +Conserto_idConserto: INT
    +Revisão_idRevisão: INT
    +PlacaVeiculo: CHAR[7]
    --
    +getInfo()
  }

  class Conserto {
    +idConserto: INT
    +Descrição_do_conserto: VARCHAR[45]
    --
    +getInfo()
  }

  class Revisao{
    +idRevisão: INT
    +Descrição_da_revisão: VARCHAR[45]
    --
    +getInfo()
  }

  class Equipe_mecânicos{
    +idEquipe_mecânicos INT
    +Mecânico_idMecânico INT
    +Ordem_de_Serviço_OS_idOrdem_de_Serviço_OS INT
    --
    +getInfo()
  }

  class Mecânico {
    +idMecânico: INT
    +Nome: VARCHAR[45]
    +Endereço: VARCHAR[45]
    +Especialidade: VARCHAR[45]
    --
    +getInfo()
  }

  class Ordem_de_Serviço_OS {
    +idOrdem_de_Serviço_OS: INT
    +Data_de_emissão: DATE
    +Valor_serviço: FLOAT
    +Valor_peça: FLOAT
    +Status: VARCHAR[45]
    +Data_de_conclusão: DATE
    --
    +getInfo()
  }

  class Tabela_referencia_preços {
    +idTabela_referencia_preços: INT
    +Ordem_de_Serviço_OS_idOrdem_de_Serviço_OS: INT
    --
    +getInfo()
  }

  class AutorizaçãoCliente {
    +Clientes_idClientes: INT
    +Clientes_Veículo_idVeículo: INT
    +Ordem_de_Serviço_OS_idOrdem_de_Serviço_OS: INT
    +Autorizado: TINYINT
    --
    +getInfo()
  }

  class Serviços {
    +idServiços: INT
    +Descrição: VARCHAR[45]
    +Valor: FLOAT
    --
    +getInfo()
  }

  class Peças {
    +idPeças: INT
    +Descrição: VARCHAR[45]
    +Valor: FLOAT
    --
    +getInfo()
  }

  class OS_tem_Serviços {
    +idOrdem_de_Serviço_OS: INT
    +Serviços_idServiços: INT
    --
    +getInfo()
  }

  class OS_tem_Peças {
    +idOrdem_de_Serviço_OS: INT
    +Peças_idPeças: INT
    --
    +getInfo()
  }

  PessoaFisica --|> Clientes
  PessoaJuridica --|> Clientes
  Clientes --|> Veículo
  Clientes --|> AutorizaçãoCliente
  Veículo --|> Conserto
  Veículo --|> Revisao
  Veículo --|> Equipe_mecânicos
  Equipe_mecânicos --|> Mecânico
  Ordem_de_Serviço_OS --|> Equipe_mecânicos
  AutorizaçãoCliente --|> Ordem_de_Serviço_OS
  Ordem_de_Serviço_OS --|> Tabela_referencia_preços
  Ordem_de_Serviço_OS --|> OS_tem_Serviços
  Ordem_de_Serviço_OS --|> OS_tem_Peças
  OS_tem_Serviços --|> Serviços
  OS_tem_Peças --|> Peças
  ```