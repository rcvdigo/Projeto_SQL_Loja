INSERT INTO Conserto VALUES (1, 'Não funciona'),
							(2, 'Quebrado'),
                            (3, 'Não liga'),
                            (4, 'Barulho'),
                            (5, 'Pneu furado'),
                            (6, 'Ar condicionado quebrado');
                            
INSERT INTO Revisão VALUES  (1, 'Não funciona'),
							(2, 'Quebrado'),
                            (3, 'Não liga'),
                            (4, 'Barulho'),
                            (5, 'Pneu furado'),
                            (6, 'Ar condicionado quebrado');

INSERT INTO Mecânico VALUES	(1, 'Jhon', 'Rua de Trás', 'Borracharia'),
							(2, 'Alemão', 'Esquina com a primeira', 'Eletricista'),
                            (3, 'Zézinho', 'Virtude, 555', 'Qualquer tipo de reparo'),
                            (4, 'Zé Caolho', 'Rua dos espertos, 1', 'Funilaria'),
                            (5, 'Ricardo', 'Rua plenitude, 54', 'Eletricista'),
                            (6, 'Mauricio', 'Av. Ambrosia', 'Motor');

INSERT INTO `ordem de serviço - os` VALUES
							(1, '2022-09-08', '134.50', '15.00', 'AGUARDANDO', NULL),
							(2, '2022-09-06', '198.90', '80.90', 'CONCLUIDO', '2022-09-09'),
							(3, '2022-09-03', '930.99', '520.10', 'CONCLUIDO', '2022-09-10'),
							(4, '2022-08-18', '245.70', '110.90', 'EM ANDAMENTO', NULL),
							(5, '2022-08-30', '480.87', '10.15', 'CANCELADO', NULL),
							(6, '2022-08-25', '736.56', '7.50', 'EM ANDAMENTO', NULL);

INSERT INTO Veículo VALUES 	(1, 1, 1, 1,'NBH4567'),
							(2, 2, 2, 2,'JHJ7563'),
                            (3, 3, 3, 3,'ASK8944'),
                            (4, 4, 4, 4,'EQW4214'),
                            (5, 5, 5, 5,'ADA2144'),
                            (6, 6, 6, 6,'JBF2134');

INSERT INTO `oficina`.`clientes` (`idClientes`, `Veículo_idVeículo`) VALUES ('1', '1');
INSERT INTO `oficina`.`clientes` (`idClientes`, `Veículo_idVeículo`) VALUES ('2', '2');
INSERT INTO `oficina`.`clientes` (`idClientes`, `Veículo_idVeículo`) VALUES ('3', '3');
INSERT INTO `oficina`.`clientes` (`idClientes`, `Veículo_idVeículo`) VALUES ('4', '4');
INSERT INTO `oficina`.`clientes` (`idClientes`, `Veículo_idVeículo`) VALUES ('5', '5');
INSERT INTO `oficina`.`clientes` (`idClientes`, `Veículo_idVeículo`) VALUES ('6', '6');

INSERT INTO PessoaFisica VALUES (1, 'Diego', 12345678910, 'Miami Beach, 333', '11137564556', 1, 1),
								(2, 'Antonio', 08975386541, 'Paraíso, 17', '11997665745',2,2),
                                (3, 'Rafael', 78531297453, 'Rua Milionário e José Rico, 99', '11091184726',3,3),
                                (4, 'Edson', 89674435241, 'Saudade, 13', '11997674632',4,4),
                                (5, 'Ana Caroline', 90877865576, 'Paixão, 7', '11976556477',5,5),
                                (6, 'Whesley', 07795647385, 'Consolação, 25', '11999098896',6,6);
                                
INSERT INTO `oficina`.`pessoajuridica` (`idPessoaJuridica`, `RazaoSocial`, `CNPJ`, `Endereço`, `Contato`, `Clientes_idClientes`, `Clientes_Veículo_idVeículo`) VALUES ('1', 'Mecânica Veloz Ltda', '12345678000112', 'Rua das Rodas, 123, Bairro do Motor, Cidade Veloz', '1198765432', '1', '1');
INSERT INTO `oficina`.`pessoajuridica` (`idPessoaJuridica`, `RazaoSocial`, `CNPJ`, `Endereço`, `Contato`, `Clientes_idClientes`, `Clientes_Veículo_idVeículo`) VALUES ('2', 'Auto Peças Rápido Ltda', '98765432000198', 'Avenida das Engrenagens, 456, Centro de Reparos, Cidade Veloz', '1154329876', '2', '2');
INSERT INTO `oficina`.`pessoajuridica` (`idPessoaJuridica`, `RazaoSocial`, `CNPJ`, `Endereço`, `Contato`, `Clientes_idClientes`, `Clientes_Veículo_idVeículo`) VALUES ('3', 'Oficina do Motorista S.A', '23456789000123', 'Travessa dos Pneus, 789, Vila da Velocidade, Cidade Motorizada', '1112345678', '3', '3');
INSERT INTO `oficina`.`pessoajuridica` (`idPessoaJuridica`, `RazaoSocial`, `CNPJ`, `Endereço`, `Contato`, `Clientes_idClientes`, `Clientes_Veículo_idVeículo`) VALUES ('4', 'Carros & Companhia Ltda', '67890123000167', 'Rua das Correias, 321, Bairro das Rodas, Cidade Automotiva', '1176543210', '4', '4');
INSERT INTO `oficina`.`pessoajuridica` (`idPessoaJuridica`, `RazaoSocial`, `CNPJ`, `Endereço`, `Contato`, `Clientes_idClientes`, `Clientes_Veículo_idVeículo`) VALUES ('5', 'Auto Máquinas Expresso S.A', '34567890000134', 'Alameda das Velocidades, 567, Vila dos Motores, Cidade Automobilística', '1189012345', '5', '5');
INSERT INTO `oficina`.`pessoajuridica` (`idPessoaJuridica`, `RazaoSocial`, `CNPJ`, `Endereço`, `Contato`, `Clientes_idClientes`, `Clientes_Veículo_idVeículo`) VALUES ('6', 'Veículos Rápidos e Sons Ltda', '45678901000145', 'Rua dos Motores, 987, Centro Automotivo, Cidade das Rodas', '1167890123', '6', '6');

INSERT INTO `oficina`.`autorizaçãocliente` (`Clientes_idClientes`, `Clientes_Veículo_idVeículo`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`, `Autorizado`) VALUES ('1', '1', '1', '0');
INSERT INTO `oficina`.`autorizaçãocliente` (`Clientes_idClientes`, `Clientes_Veículo_idVeículo`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`, `Autorizado`) VALUES ('2', '2', '2', '1');
INSERT INTO `oficina`.`autorizaçãocliente` (`Clientes_idClientes`, `Clientes_Veículo_idVeículo`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`, `Autorizado`) VALUES ('3', '3', '3', '1');
INSERT INTO `oficina`.`autorizaçãocliente` (`Clientes_idClientes`, `Clientes_Veículo_idVeículo`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`, `Autorizado`) VALUES ('4', '4', '4', '1');
INSERT INTO `oficina`.`autorizaçãocliente` (`Clientes_idClientes`, `Clientes_Veículo_idVeículo`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`, `Autorizado`) VALUES ('5', '5', '5', '0');
INSERT INTO `oficina`.`autorizaçãocliente` (`Clientes_idClientes`, `Clientes_Veículo_idVeículo`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`, `Autorizado`) VALUES ('6', '6', '6', '1');

INSERT INTO `oficina`.`tabela referencia preços` (`idTabela referencia preços`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`) VALUES ('1', '1');
INSERT INTO `oficina`.`tabela referencia preços` (`idTabela referencia preços`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`) VALUES ('2', '2');
INSERT INTO `oficina`.`tabela referencia preços` (`idTabela referencia preços`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`) VALUES ('3', '3');
INSERT INTO `oficina`.`tabela referencia preços` (`idTabela referencia preços`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`) VALUES ('4', '4');
INSERT INTO `oficina`.`tabela referencia preços` (`idTabela referencia preços`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`) VALUES ('5', '5');
INSERT INTO `oficina`.`tabela referencia preços` (`idTabela referencia preços`, `Ordem de Serviço - OS_idOrdem de Serviço - OS`) VALUES ('6', '6');

INSERT INTO Serviços VALUES 	(1, 'Problemas Eletricos', '134.50'),
								(2, 'Caixa de cambio quebrado', '198.90'),
								(3, 'Problemas Eletricos', '930.99'),
								(4, 'Peça proxima a caixa de direção danificada', '245.70'),
								(5, 'Pneu Furado', '480.87'),
								(6, 'O sistema de ar condicionado danificada', '736.56');
                                
INSERT INTO `Peças` VALUES 	(1, 'Volante', '15.00'),
							(2, 'Pistão', '80.90'),
							(3, 'Cambio', '520.10'),
							(4, 'Caixa eletrica', '110.90'),
							(5, 'Pneu', '10.15'),
							(6, 'Ar Condicionado', '7.50');
                            
INSERT INTO `oficina`.`os tem peças` (`idOrdem de Serviço - OS`, `Peças_idPeças`) VALUES ('1', '1');
INSERT INTO `oficina`.`os tem peças` (`idOrdem de Serviço - OS`, `Peças_idPeças`) VALUES ('2', '2');
INSERT INTO `oficina`.`os tem peças` (`idOrdem de Serviço - OS`, `Peças_idPeças`) VALUES ('3', '3');
INSERT INTO `oficina`.`os tem peças` (`idOrdem de Serviço - OS`, `Peças_idPeças`) VALUES ('4', '4');
INSERT INTO `oficina`.`os tem peças` (`idOrdem de Serviço - OS`, `Peças_idPeças`) VALUES ('5', '5');
INSERT INTO `oficina`.`os tem peças` (`idOrdem de Serviço - OS`, `Peças_idPeças`) VALUES ('6', '6');

INSERT INTO `oficina`.`os tem serviços` (`idOrdem de Serviço - OS`, `Serviços_idServiços`) VALUES ('1', '1');
INSERT INTO `oficina`.`os tem serviços` (`idOrdem de Serviço - OS`, `Serviços_idServiços`) VALUES ('2', '2');
INSERT INTO `oficina`.`os tem serviços` (`idOrdem de Serviço - OS`, `Serviços_idServiços`) VALUES ('3', '3');
INSERT INTO `oficina`.`os tem serviços` (`idOrdem de Serviço - OS`, `Serviços_idServiços`) VALUES ('4', '4');
INSERT INTO `oficina`.`os tem serviços` (`idOrdem de Serviço - OS`, `Serviços_idServiços`) VALUES ('5', '5');
INSERT INTO `oficina`.`os tem serviços` (`idOrdem de Serviço - OS`, `Serviços_idServiços`) VALUES ('6', '6');