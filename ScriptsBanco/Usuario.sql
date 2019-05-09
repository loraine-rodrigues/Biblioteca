-- CRUD DE USUÁRIOS

-- Procedure buscar todos os usuarios 
USE `biblioteca`;
DROP procedure IF EXISTS `buscarUsuarios`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarUsuarios` ()
BEGIN
	SELECT * FROM usuario;
END$$

DELIMITER ;

-- Procedure para buscar usuário por cpf
USE `biblioteca`;
DROP procedure IF EXISTS `inserirUsuario`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `inserirUsuario` (IN cpf char(11), IN nome char(50), IN endereco varchar(50), IN telefone char(11))
BEGIN
	INSERT INTO usuario (cd_cpf, nm_nome, nm_endereco, cd_telefone)
		VALUES (cpf, nome, endereco, telefone);
END$$

DELIMITER ;

-- Procedure para buscar usuário por cpf
USE `biblioteca`;
DROP procedure IF EXISTS `buscarUsuario`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarUsuario` (IN cpf char(11))
BEGIN
	SELECT * FROM usuario WHERE cd_cpf = cpf;
END$$

DELIMITER ;

-- Procedure para atualizar usuário por cpf
USE `biblioteca`;
DROP procedure IF EXISTS `atualizarUsuario`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `atualizarUsuario` (IN cpf char(11), IN nome char(50), IN endereco varchar(50), IN telefone char(11))
BEGIN
	UPDATE usuario
		SET
			nm_nome		= nome,
            nm_endereco	= endereco,
            cd_telefone	= telefone
		WHERE
			cd_cpf = cpf;
END$$

DELIMITER ;

-- Procedure para excluir usuário por cpf
USE `biblioteca`;
DROP procedure IF EXISTS `excluirUsuario`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `excluirUsuario` (IN cpf char(11))
BEGIN
	DELETE FROM usuario WHERE cd_cpf = cpf;
END$$

DELIMITER ;