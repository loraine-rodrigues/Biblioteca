-- CRUD DE EDITORAS

-- Procedure buscar todos os editoras
USE `biblioteca`;
DROP procedure IF EXISTS `buscarEditoras`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarEditoras` ()
BEGIN
		SELECT * FROM editora;
END$$

DELIMITER ;

-- Procedure de inserir editora
USE `biblioteca`;
DROP procedure IF EXISTS `inserirEditora`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `inserirEditora` (IN codigo int(11), IN nome varchar(35), IN endereco varchar(60), IN contato char(11))
BEGIN
	INSERT INTO editora (cd_editora, nm_editora, nm_endereco, cd_contato)
		VALUES (codigo, nome, endereco, contato);
END$$

DELIMITER ;

-- Procedure para buscar editora por código
USE `biblioteca`;
DROP procedure IF EXISTS `buscarEditora`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarEditora` (IN codigo int(11))
BEGIN
	SELECT * FROM editora WHERE cd_editora = codigo;
END$$

DELIMITER ;

-- Procedure para atualizar editora
USE `biblioteca`;
DROP procedure IF EXISTS `atualizarEditora`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `atualizarEditora` (IN codigo int(11), IN nome varchar(35), IN endereco varchar(60), IN contato char(11))
BEGIN
	UPDATE editora
		SET
			nm_editora	= nome,
            nm_endereco	= endereco,
            cd_contato	= contato
		WHERE
			cd_editora = codigo;
END$$

DELIMITER ;

-- Procedure para excluir editora por código
USE `biblioteca`;
DROP procedure IF EXISTS `excluirEditora`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `excluirEditora` (IN codigo int(11))
BEGIN
	DELETE FROM editora WHERE cd_editora = codigo;
END$$

DELIMITER ;

-- Procedure para buscar livros de uma editora
USE `biblioteca`;
DROP procedure IF EXISTS `buscarLivrosPorEditora`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarLivrosPorEditora` (IN codigo_editora int(11))
BEGIN
	SELECT livro.nm_titulo as 'Nome do livro', 
		   livro.nm_genero as 'Gênero', 
		   livro.aa_publicacao as'Ano de publicação',
		   livro.cd_livro as 'Código do livro',
		   editora.nm_editora as 'Nome da editora',
		   editora.cd_editora as 'Código editora'
		FROM livro, editora
		WHERE livro.cd_editora = editora.cd_editora
			AND codigo_editora = livro.cd_editora;
END$$

DELIMITER ;
