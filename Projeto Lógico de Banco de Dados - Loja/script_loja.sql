SHOW DATABASES;

CREATE SCHEMA loja;

use loja;

-- ok

CREATE TABLE IF NOT EXISTS `loja`.`Conta` (
  `idConta` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('PF', 'PJ') NOT NULL,
  `numConta` VARCHAR(45) NOT NULL,
  `Cliente_idCliente1` INT NOT NULL,
  PRIMARY KEY (`idConta`, `Cliente_idCliente1`),
  UNIQUE INDEX `tipo_UNIQUE` (`tipo` ASC) VISIBLE,
  INDEX `fk_Conta_Cliente2_idx` (`Cliente_idCliente1` ASC) VISIBLE,
  CONSTRAINT `fk_Conta_Cliente2`
    FOREIGN KEY (`Cliente_idCliente1`)
    REFERENCES `loja`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Pnome` VARCHAR(45) NOT NULL,
  `Nome do meio` VARCHAR(3) NULL,
  `Sobrenome` VARCHAR(20) NULL,
  `CPF` CHAR(11) NOT NULL,
  `endereço` VARCHAR(45) NULL,
  `Data de Nascimento` DATE NOT NULL,
  `Conta_idConta` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `Identificação_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Pedido` (
  `idPedido` INT NOT NULL,
  `Status do pedido` ENUM('Aprovado', 'Aguardando') NULL DEFAULT 'Aguardando',
  `Descrição` VARCHAR(45) NULL,
  `Frete` FLOAT NULL,
  `Entrega_idEntrega` INT NOT NULL,
  `Pagamento_idPagamento` INT NOT NULL,
  `Cliente_idCliente1` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Entrega_idEntrega`, `Pagamento_idPagamento`, `Cliente_idCliente1`),
  INDEX `fk_Pedido_Entrega1_idx` (`Entrega_idEntrega` ASC) VISIBLE,
  INDEX `fk_Pedido_Pagamento1_idx` (`Pagamento_idPagamento` ASC) VISIBLE,
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente1` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Entrega1`
    FOREIGN KEY (`Entrega_idEntrega`)
    REFERENCES `loja`.`Entrega` (`idEntrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Pagamento1`
    FOREIGN KEY (`Pagamento_idPagamento`)
    REFERENCES `loja`.`Pagamento` (`idPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente1`)
    REFERENCES `loja`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Entrega` (
  `idEntrega` INT NOT NULL AUTO_INCREMENT,
  `Status` ENUM('Andamento', 'Aguardando', 'Entregue', 'Cancelado') NULL DEFAULT 'Aguardando',
  `Código de rastreio` VARCHAR(45) NULL,
  UNIQUE INDEX `Código de rastreio_UNIQUE` (`Código de rastreio` ASC) VISIBLE,
  PRIMARY KEY (`idEntrega`))
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Pagamento` (
  `idPagamento` INT NOT NULL AUTO_INCREMENT,
  `Forma de pagamento` ENUM('Cartão de crédito', 'Boleto Bancário', 'Pix') NULL COMMENT 'ENUM(\'Cartão de crédito\', \'Boleto Bancário\', \'Pix\')',
  PRIMARY KEY (`idPagamento`))
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `Produto_Pedido` (
  `Quantidade` VARCHAR(45) NOT NULL,
  `Status` ENUM('Aprovado', 'Aguardando') NOT NULL,
  `Pedido_idPedido1` INT NOT NULL,
  `Pedido_Entrega_idEntrega` INT NOT NULL,
  `Pedido_Pagamento_idPagamento` INT NOT NULL,
  `Pedido_Cliente_idCliente1` INT NOT NULL,
  `Produto_idProduct` INT NOT NULL,
  PRIMARY KEY (`Pedido_idPedido1`, `Pedido_Entrega_idEntrega`, `Pedido_Pagamento_idPagamento`, `Pedido_Cliente_idCliente1`, `Produto_idProduct`),
  INDEX `fk_Relação de produto/pedido_Produto1_idx` (`Produto_idProduct` ASC) VISIBLE,
  CONSTRAINT `fk_Relação de produto/pedido_Pedido2`
    FOREIGN KEY (`Pedido_idPedido1` , `Pedido_Entrega_idEntrega` , `Pedido_Pagamento_idPagamento` , `Pedido_Cliente_idCliente1`)
    REFERENCES `loja`.`Pedido` (`idPedido` , `Entrega_idEntrega` , `Pagamento_idPagamento` , `Cliente_idCliente1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relação de produto/pedido_Produto1`
    FOREIGN KEY (`Produto_idProduct`)
    REFERENCES `loja`.`Produto` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Produto` (
  `idProduct` INT NOT NULL AUTO_INCREMENT COMMENT 'CONSTRAINT UNIQUE_CPF_CLIENT UNIQUE (CPF)',
  `Pname` VARCHAR(10) NOT NULL,
  `classification_kids` TINYINT NULL DEFAULT 0,
  `Category` ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NULL,
  `Avaliação` FLOAT NULL DEFAULT 0,
  `Size` VARCHAR(10) NULL COMMENT 'CONSTRAINT UNIQUE_CPF_CLIENT UNIQUE (CPF)',
  PRIMARY KEY (`idProduct`))
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Produto_Estoque` (
  `Quantidade` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  `Produto_idProduct` INT NOT NULL,
  PRIMARY KEY (`Estoque_idEstoque`, `Produto_idProduct`),
  INDEX `fk_Relação de produto/estoque_Produto1_idx` (`Produto_idProduct` ASC) VISIBLE,
  CONSTRAINT `fk_Relação de produto/estoque_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `loja`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relação de produto/estoque_Produto1`
    FOREIGN KEY (`Produto_idProduct`)
    REFERENCES `loja`.`Produto` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `Local` VARCHAR(45) NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Produto_Fornecedor` (
  `Produto_idProduct` INT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduct`, `Fornecedor_idFornecedor`),
  INDEX `fk_Relação de produto/fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Relação de produto/fornecedor_Produto1`
    FOREIGN KEY (`Produto_idProduct`)
    REFERENCES `loja`.`Produto` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relação de produto/fornecedor_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `loja`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `Razão Social` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE,
  UNIQUE INDEX `Razão Social_UNIQUE` (`Razão Social` ASC) VISIBLE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `loja`.`Produto_Terceiro_Vendedor` (
  `Quantidade` VARCHAR(45) NOT NULL,
  `Produto_idProduct` INT NOT NULL,
  `Terceiro_Vendedor_idTerceiro` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduct`, `Terceiro_Vendedor_idTerceiro`),
  INDEX `fk_Produto_Terceiro_Vendedor_Terceiro_Vendedor1_idx` (`Terceiro_Vendedor_idTerceiro` ASC) VISIBLE,
  CONSTRAINT `fk_Relação de produto/terceiro-vendedor_Produto1`
    FOREIGN KEY (`Produto_idProduct`)
    REFERENCES `loja`.`Produto` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Terceiro_Vendedor_Terceiro_Vendedor1`
    FOREIGN KEY (`Terceiro_Vendedor_idTerceiro`)
    REFERENCES `loja`.`Terceiro_Vendedor` (`idTerceiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ok
CREATE TABLE IF NOT EXISTS `loja`.`Terceiro_Vendedor` (
  `idTerceiro` INT NOT NULL AUTO_INCREMENT,
  `Razão Social` VARCHAR(45) NOT NULL,
  `Local` VARCHAR(45) NULL,
  `Nome Fantasia` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTerceiro`),
  UNIQUE INDEX `Razão Social_UNIQUE` (`Razão Social` ASC) VISIBLE)
ENGINE = InnoDB;



INSERT INTO `loja`.`Cliente` (`Pnome`, `Nome do meio`, `Sobrenome`, `CPF`, `endereço`, `Data de Nascimento`, `Conta_idConta`) VALUES
('João', NULL, 'Silva', '12345678901', 'Rua A, 123', '1990-01-15', 1),
('Maria', NULL, 'Santos', '98765432109', 'Avenida B, 456', '1985-08-21', 2),
('Empresa XYZ', NULL, NULL, '9876543210', 'Rua C, 789', '2000-03-10', 3),
('Empresa ABC', NULL, NULL, '1234567890', 'Avenida D, 987', '1998-11-05', 4);


-- Conta do tipo PF
INSERT INTO `loja`.`Conta` (`tipo`, `numConta`, `Cliente_idCliente1`) VALUES
('PF', '12345678901', 1),
('PF', '98765432109', 2);

-- Conta do tipo PJ
INSERT INTO `loja`.`Conta` (`tipo`, `numConta`, `Cliente_idCliente1`) VALUES
('PJ', '9876543210', 3),
('PJ', '1234567890', 4);


INSERT INTO `loja`.`Entrega` (`idEntrega`, `Status`, `Código de rastreio`) VALUES
(1, default, 'ABC123'),
(2, 'Entregue', 'XYZ789'),
(3, default, '123DEF'),
(4, 'Entregue', '456GHI');


INSERT INTO `loja`.`Pagamento` (`idPagamento`, `Forma de pagamento`) VALUES
(1, 'Cartão de crédito'),
(2, 'Boleto Bancário'),
(3, 'Pix');



INSERT INTO `loja`.`Pedido` (`idPedido`, `Status do pedido`, `Descrição`, `Frete`, `Entrega_idEntrega`, `Pagamento_idPagamento`, `Cliente_idCliente1`) VALUES
(1, 'Aguardando', 'Pedido 1', 10.50, 1, 1, 1),
(2, 'Aprovado', 'Pedido 2', 8.75, 2, 2, 2),
(3, 'Aguardando', 'Pedido 3', 12.30, 3, 1, 3),
(4, 'Aprovado', 'Pedido 4', 9.95, 4, 3, 4);



INSERT INTO `loja`.`Produto` (`idProduct`, `Pname`, `classification_kids`, `Category`, `Avaliação`, `Size`) VALUES
(1, 'Produto A', 1, 'Eletrônico', 4.5, 'M'),
(2, 'Produto B', 0, 'Vestimenta', 3.8, 'L'),
(3, 'Produto C', 1, 'Alimentos', 4.2, 'S'),
(4, 'Produto D', 0, 'Brinquedos', 4.0, 'M');



INSERT INTO `loja`.`Estoque` (`idEstoque`, `Local`, `Quantidade`) VALUES
(1, 'Depósito 1', 100),
(2, 'Depósito 2', 150),
(3, 'Depósito 3', 200),
(4, 'Depósito 4', 75);


INSERT INTO `loja`.`Produto_Estoque` (`Quantidade`, `Estoque_idEstoque`, `Produto_idProduct`) VALUES
(100, 1, 1),
(150, 2, 2),
(200, 3, 3),
(75, 4, 4);


INSERT INTO `loja`.`Fornecedor` (`idFornecedor`, `Razão Social`, `CNPJ`) VALUES
(1, 'Fornecedor 1', '12345678901234'),
(2, 'Fornecedor 2', '98765432109876'),
(3, 'Fornecedor 3', '56789012345678'),
(4, 'Fornecedor 4', '78901234567890');


INSERT INTO `loja`.`Produto_Fornecedor` (`Produto_idProduct`, `Fornecedor_idFornecedor`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


INSERT INTO `loja`.`Terceiro_Vendedor` (`idTerceiro`, `Razão Social`, `Local`, `Nome Fantasia`, `Endereço`) VALUES
(1, 'Vendedor 1', 'Local 1', 'Fantasia 1', 'Endereço 1'),
(2, 'Vendedor 2', 'Local 2', 'Fantasia 2', 'Endereço 2'),
(3, 'Vendedor 3', 'Local 3', 'Fantasia 3', 'Endereço 3'),
(4, 'Vendedor 4', 'Local 4', 'Fantasia 4', 'Endereço 4');


INSERT INTO `loja`.`Produto_Terceiro_Vendedor` (`Quantidade`, `Produto_idProduct`, `Terceiro_Vendedor_idTerceiro`) VALUES
(50, 1, 1),
(60, 2, 2),
(70, 3, 3),
(80, 4, 4);





-- 1. Quantidade de Pedidos por Cliente:
	-- Para saber quantos pedidos foram feitos por cada cliente, você pode usar a seguinte query:
SELECT c.Pnome, COUNT(p.idPedido) AS Quantidade_Pedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente1
GROUP BY c.Pnome;


-- 2. Vendedores que são Fornecedores:
	-- Para identificar se algum vendedor também é fornecedor:
SELECT tv.`Razão Social` AS Terceiro_Vendedor, f.`Razão Social` AS Fornecedor
FROM Terceiro_Vendedor tv
INNER JOIN Produto_Terceiro_Vendedor ptv ON tv.idTerceiro = ptv.Terceiro_Vendedor_idTerceiro
INNER JOIN Produto_Fornecedor pf ON ptv.Produto_idProduct = pf.Produto_idProduct
INNER JOIN Fornecedor f ON pf.Fornecedor_idFornecedor = f.idFornecedor;

-- 3. Relação de Produtos, Fornecedores e Estoques:
	-- Para obter a relação de produtos, fornecedores e estoques:
SELECT p.Pname AS Produto, f.`Razão Social` AS Fornecedor, e.Local AS Local_Estoque, pe.Quantidade AS Quantidade_Estoque
FROM Produto p
INNER JOIN Produto_Fornecedor pf ON p.idProduct = pf.Produto_idProduct
INNER JOIN Fornecedor f ON pf.Fornecedor_idFornecedor = f.idFornecedor
INNER JOIN Produto_Estoque pe ON p.idProduct = pe.Produto_idProduct
INNER JOIN Estoque e ON pe.Estoque_idEstoque = e.idEstoque;


-- 4. Relação de Nomes de Fornecedores e Nomes de Produtos:
	-- Para listar os nomes dos fornecedores e os nomes dos produtos:
SELECT f.`Razão Social` AS Fornecedor, p.Pname AS Produto
FROM Fornecedor f
INNER JOIN Produto_Fornecedor pf ON f.idFornecedor = pf.Fornecedor_idFornecedor
INNER JOIN Produto p ON pf.Produto_idProduct = p.idProduct;


-- 5. Pedidos por Status e Cliente:
	-- Para saber quantos pedidos estão em cada status para cada cliente:
SELECT c.Pnome AS Cliente, p.`Status do pedido` AS Status, COUNT(p.idPedido) AS Quantidade_Pedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente1
GROUP BY c.Pnome, p.`Status do pedido`;


-- 6. Produtos com Maior Avaliação:
	-- Para listar os produtos com as maiores avaliações:
SELECT p.Pname AS Produto, p.Avaliação
FROM Produto p
WHERE p.Avaliação = (SELECT MAX(Avaliação) FROM Produto);

-- 7. Média de Avaliação Dos Produtos:
	-- Para Calcular a Média de Avaliação dos Produtos:
SELECT ROUND(AVG(Avaliação), 2) AS Média_Avaliação_Produtos
FROM Produto;


-- 8. Pedidos por Código de Rastreio:
	-- Para listar os pedidos com seus códigos de rastreio:
SELECT p.idPedido, e.`Código de rastreio`
FROM Pedido p
INNER JOIN Entrega e ON p.Entrega_idEntrega = e.idEntrega;


-- 9. Encontrar Clientes que fizeram mais de dois pedidos
	-- Para listar todos os clientes com mais de dois pedidos realizados:
SELECT c.Pnome AS Cliente, COUNT(p.idPedido) AS Quantidade_Pedidos
FROM Cliente c
INNER JOIN Pedido p ON c.idCliente = p.Cliente_idCliente1
GROUP BY (1)
HAVING Quantidade_Pedidos > 2;