-- CRUD DE FUNCIONÁRIOS

-- Procedure buscar todos os funcionarios
USE `biblioteca`;
DROP procedure IF EXISTS `buscarFuncionarios`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarFuncionarios` ()
BEGIN
	SELECT * FROM funcionario;
END$$

DELIMITER ;

-- Procedure buscar funcionarios por cpf--
USE `biblioteca`;
DROP procedure IF EXISTS `buscarFuncionario`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarFuncionario` (IN cpf char(11))
BEGIN
    SELECT * FROM funcionario WHERE cd_cpf = cpf;
END$$

DELIMITER ;

-- Procedure excluir funcionario por cpf
USE `biblioteca`;
DROP procedure IF EXISTS `excluirFuncionario`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `excluirFuncionario` (IN cpf char(11))
BEGIN
	DELETE FROM funcionario WHERE cd_cpf = cpf;
END$$

DELIMITER ;

-- Procedure atualizar funcionario por cpf
USE `biblioteca`;
DROP procedure IF EXISTS `atualizarFuncionario`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `atualizarFuncionario` (IN cpf char(11), IN nome varchar(50), IN endereco varchar(60), IN telefone char(11), IN salario decimal(9,2), IN funcao varchar(15))
BEGIN
	UPDATE funcionario
		SET
			nm_funcionario	= nome,
            nm_endereco 	= endereco,
            cd_telefone		= telefone,
            vl_salario		= salario,
            nm_funcao		= funcao
		WHERE
			cd_cpf = cpf;
END$$

-- Procedure de inserir funcionario
USE `biblioteca`;
DROP procedure IF EXISTS `inserirFuncionario`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `inserirFuncionario` (IN cpf char(11), IN nome varchar(50), IN endereco varchar(60), IN telefone char(11), IN salario decimal(9,2), IN funcao varchar(15))
BEGIN
	INSERT INTO funcionario (cd_cpf, nm_funcionario, nm_endereco, cd_telefone, vl_salario, nm_funcao)
		values (cpf, nome, endereco, telefone, salario, funcao); 
END$$

DELIMITER ;