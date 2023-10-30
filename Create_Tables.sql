CREATE TABLE IF NOT EXISTS `Oficina`.`PessoaFisica` (
   `idPessoaFisica` INT NOT NULL,
   `Nome` VARCHAR(45) NOT NULL,
   `CPF` CHAR(11) NOT NULL,
   `Endereço` VARCHAR(45) NOT NULL,
   `Contato` CHAR(11) NOT NULL,
   `Clientes_idClientes` INT NOT NULL,
   `Clientes_Veículo_idVeículo` INT NOT NULL,
   PRIMARY KEY (`idPessoaFisica`, `Clientes_idClientes`, `Clientes_Veículo_idVeículo`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`Clientes` (
  `idClientes` INT NOT NULL,
  `Veículo_idVeículo` INT NOT NULL,
   PRIMARY KEY (`idClientes`, `Veículo_idVeículo`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`Veículo` (
  `idVeículo` INT NOT NULL,
  `Equipe mecânicos_idEquipe mecânicos` INT NOT NULL,
  `Conserto_idConserto` INT NOT NULL,
  `Revisão_idRevisão` INT NOT NULL,
  `PlacaVeiculo` CHAR(7) NOT NULL,
  PRIMARY KEY (`idVeículo`, `Equipe mecânicos_idEquipe mecânicos`, `Conserto_idConserto`, `Revisão_idRevisão`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`Conserto` (
  `idConserto` INT NOT NULL,
  `Descrição do conserto` VARCHAR(45) NULL,
  PRIMARY KEY (`idConserto`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`Revisão` (
  `idRevisão` INT NOT NULL,
  `Descrição da revisão` VARCHAR(45) NULL,
  PRIMARY KEY (`idRevisão`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`Mecânico` (
  `idMecânico` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecânico`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`Ordem de Serviço - OS` (
  `idOrdem de Serviço - OS` INT NOT NULL,
  `Data de emissão` DATE NULL,
  `Valor serviço` FLOAT NULL,
  `Valor peça` FLOAT NULL,
  `Valor total` FLOAT NULL,
  `Status` VARCHAR(45) NULL,
  `Data de conclusão` DATE NULL,
  PRIMARY KEY (`idOrdem de Serviço - OS`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`Tabela referencia preços` (
  `idTabela referencia preços` INT NOT NULL,
  `Ordem de Serviço - OS_idOrdem de Serviço - OS` INT NOT NULL,
  PRIMARY KEY (`idTabela referencia preços`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`),
  INDEX `fk_Tabela referencia preços_Ordem de Serviço - OS1_idx` (`Ordem de Serviço - OS_idOrdem de Serviço - OS` ASC) VISIBLE,
  CONSTRAINT `fk_Tabela referencia preços_Ordem de Serviço - OS1`
    FOREIGN KEY (`Ordem de Serviço - OS_idOrdem de Serviço - OS`)
    REFERENCES `Oficina`.`Ordem de Serviço - OS` (`idOrdem de Serviço - OS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`AutorizaçãoCliente` (
  `Clientes_idClientes` INT NOT NULL,
  `Clientes_Veículo_idVeículo` INT NOT NULL,
  `Ordem de Serviço - OS_idOrdem de Serviço - OS` INT NOT NULL,
  `Autorizado` TINYINT NULL,
  PRIMARY KEY (`Clientes_idClientes`, `Clientes_Veículo_idVeículo`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`),
  INDEX `fk_Clientes_has_Ordem de Serviço - OS_Ordem de Serviço - _idx` (`Ordem de Serviço - OS_idOrdem de Serviço - OS` ASC) VISIBLE,
  INDEX `fk_Clientes_has_Ordem de Serviço - OS_Clientes1_idx` (`Clientes_idClientes` ASC, `Clientes_Veículo_idVeículo` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_has_Ordem de Serviço - OS_Clientes1`
    FOREIGN KEY (`Clientes_idClientes` , `Clientes_Veículo_idVeículo`)
    REFERENCES `Oficina`.`Clientes` (`idClientes` , `Veículo_idVeículo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clientes_has_Ordem de Serviço - OS_Ordem de Serviço - OS1`
    FOREIGN KEY (`Ordem de Serviço - OS_idOrdem de Serviço - OS`)
    REFERENCES `Oficina`.`Ordem de Serviço - OS` (`idOrdem de Serviço - OS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`Serviços` (
  `idServiços` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  `Valor` FLOAT NULL,
  PRIMARY KEY (`idServiços`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`OS tem serviços` (
  `idOrdem de Serviço - OS` INT NOT NULL,
  `Serviços_idServiços` INT NOT NULL,
  PRIMARY KEY (`idOrdem de Serviço - OS`, `Serviços_idServiços`),
  INDEX `fk_Ordem de Serviço - OS_has_Serviços_Serviços1_idx` (`Serviços_idServiços` ASC) VISIBLE,
  INDEX `fk_Ordem de Serviço - OS_has_Serviços_Ordem de Serviço -_idx` (`idOrdem de Serviço - OS` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Serviço - OS_has_Serviços_Ordem de Serviço - OS1`
    FOREIGN KEY (`idOrdem de Serviço - OS`)
    REFERENCES `Oficina`.`Ordem de Serviço - OS` (`idOrdem de Serviço - OS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Serviço - OS_has_Serviços_Serviços1`
    FOREIGN KEY (`Serviços_idServiços`)
    REFERENCES `Oficina`.`Serviços` (`idServiços`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oficina`.`Peças` (
  `idPeças` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  `Valor` FLOAT NULL,
  PRIMARY KEY (`idPeças`))
ENGINE = InnoDB;
  
CREATE TABLE IF NOT EXISTS `Oficina`.`OS tem Peças` (
  `idOrdem de Serviço - OS` INT NOT NULL,
  `Peças_idPeças` INT NOT NULL,
  PRIMARY KEY (`idOrdem de Serviço - OS`, `Peças_idPeças`),
  INDEX `fk_Ordem de Serviço - OS_has_Peças_Peças1_idx` (`Peças_idPeças` ASC) VISIBLE,
  INDEX `fk_Ordem de Serviço - OS_has_Peças_Ordem de Serviço - OS_idx` (`idOrdem de Serviço - OS` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Serviço - OS_has_Peças_Ordem de Serviço - OS1`
    FOREIGN KEY (`idOrdem de Serviço - OS`)
    REFERENCES `Oficina`.`Ordem de Serviço - OS` (`idOrdem de Serviço - OS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Serviço - OS_has_Peças_Peças1`
    FOREIGN KEY (`Peças_idPeças`)
    REFERENCES `Oficina`.`Peças` (`idPeças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;  

CREATE TABLE IF NOT EXISTS `Oficina`.`PessoaJuridica` (
  `idPessoaJuridica` INT NOT NULL,
  `RazaoSocial` VARCHAR(45) NOT NULL,
  `CNPJ` CHAR(15) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Contato` CHAR(11) NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  `Clientes_Veículo_idVeículo` INT NOT NULL,
  PRIMARY KEY (`idPessoaJuridica`, `Clientes_idClientes`, `Clientes_Veículo_idVeículo`))
ENGINE = InnoDB ;

CREATE TABLE IF NOT EXISTS `Oficina`.`Equipe mecânicos` (
  `idEquipe mecânicos` INT NOT NULL,
  `Mecânico_idMecânico` INT NOT NULL,
  `Ordem de Serviço - OS_idOrdem de Serviço - OS` INT NOT NULL,
  PRIMARY KEY (`idEquipe mecânicos`, `Mecânico_idMecânico`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`))
ENGINE = InnoDB; 

-- Adicionar um índice na coluna Mecânico_idMecânico
ALTER TABLE `Equipe mecânicos`
ADD INDEX fk_Equipe_mecânicos_Mecânico1_idx (`Mecânico_idMecânico`);

-- Adicionar um índice na coluna Ordem de Serviço - OS_idOrdem de Serviço - OS
ALTER TABLE `Equipe mecânicos`
ADD INDEX fk_Equipe_mecânicos_Ordem_de_Serviço_OS1_idx (`Ordem de Serviço - OS_idOrdem de Serviço - OS`);

-- Estabelecer a restrição de chave estrangeira (Foreign Key) para Mecânico_idMecânico
ALTER TABLE `Equipe mecânicos`
ADD CONSTRAINT fk_Equipe_mecânicos_Mecânico1
FOREIGN KEY (`Mecânico_idMecânico`)
REFERENCES `Oficina`.`Mecânico` (`idMecânico`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Estabelecer a restrição de chave estrangeira (Foreign Key) para Ordem de Serviço - OS_idOrdem de Serviço - OS
ALTER TABLE `Equipe mecânicos`
ADD CONSTRAINT fk_Equipe_mecânicos_Ordem_de_Serviço_OS1
FOREIGN KEY (`Ordem de Serviço - OS_idOrdem de Serviço - OS`)
REFERENCES `Oficina`.`Ordem de Serviço - OS` (`idOrdem de Serviço - OS`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionar um índice único na coluna CNPJ
ALTER TABLE PessoaJuridica
ADD UNIQUE INDEX CNPJ_UNIQUE (CNPJ);

-- Adicionar um índice na coluna Clientes_idClientes e Clientes_Veículo_idVeículo
ALTER TABLE PessoaJuridica
ADD INDEX fk_PessoaJuridica_Clientes1_idx (Clientes_idClientes, Clientes_Veículo_idVeículo);

-- Adicionar a restrição de chave estrangeira (Foreign Key)
ALTER TABLE PessoaJuridica
ADD CONSTRAINT fk_PessoaJuridica_Clientes1
FOREIGN KEY (Clientes_idClientes, Clientes_Veículo_idVeículo)
REFERENCES Oficina.Clientes (idClientes, Veículo_idVeículo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionar um índice na coluna Equipe mecânicos_idEquipe mecânicos
ALTER TABLE Veículo
ADD INDEX fk_Veículo_Equipe_mecânicos1_idx (`Equipe mecânicos_idEquipe mecânicos`);

-- Adicionar um índice na coluna Conserto_idConserto
ALTER TABLE Veículo
ADD INDEX fk_Veículo_Conserto1_idx (`Conserto_idConserto`);

-- Adicionar um índice na coluna Revisão_idRevisão
ALTER TABLE Veículo
ADD INDEX fk_Veículo_Revisão1_idx (`Revisão_idRevisão`);

-- Adicionar um índice único na coluna PlacaVeiculo
ALTER TABLE Veículo
ADD UNIQUE INDEX PlacaVeiculo_UNIQUE (PlacaVeiculo);

-- Estabelecer as restrições de chave estrangeira (Foreign Keys)
ALTER TABLE Veículo
ADD CONSTRAINT fk_Veículo_Equipe_mecânicos1
FOREIGN KEY (`Equipe mecânicos_idEquipe mecânicos`)
REFERENCES Oficina.`Equipe mecânicos` (`idEquipe mecânicos`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Veículo
ADD CONSTRAINT fk_Veículo_Conserto1
FOREIGN KEY (`Conserto_idConserto`)
REFERENCES Oficina.`Conserto` (`idConserto`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Veículo
ADD CONSTRAINT fk_Veículo_Revisão1
FOREIGN KEY (`Revisão_idRevisão`)
REFERENCES Oficina.`Revisão` (`idRevisão`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionar um índice único na coluna CPF
ALTER TABLE PessoaFisica
ADD UNIQUE INDEX CPF_UNIQUE (CPF);

-- Adicionar um índice na coluna Clientes_idClientes e Clientes_Veículo_idVeículo
ALTER TABLE PessoaFisica
ADD INDEX fk_PessoaFisica_Clientes1_idx (Clientes_idClientes, Clientes_Veículo_idVeículo);

-- Adicionar a restrição de chave estrangeira (Foreign Key)
ALTER TABLE PessoaFisica
ADD CONSTRAINT fk_PessoaFisica_Clientes1
FOREIGN KEY (Clientes_idClientes, Clientes_Veículo_idVeículo)
REFERENCES Oficina.Clientes (idClientes, Veículo_idVeículo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionar um índice na coluna Veículo_idVeículo
ALTER TABLE Clientes
ADD INDEX fk_Clientes_Veículo1_idx (Veículo_idVeículo);

-- Adicionar uma restrição de chave estrangeira (Foreign Key)
ALTER TABLE Clientes
ADD CONSTRAINT fk_Clientes_Veículo1
FOREIGN KEY (Veículo_idVeículo)
REFERENCES Oficina.Veículo (idVeículo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;