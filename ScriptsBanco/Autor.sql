-- CRUD DE AUTORES

-- Procedure para inserir autor
USE `biblioteca`;
DROP procedure IF EXISTS `inserirAutor`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `inserirAutor` (IN codigo int(11), IN nome varchar(50), IN nacionalidade varchar(25))
BEGIN
	INSERT INTO autor (cd_autor, nm_autor, nm_nacionalidade)
		VALUES (codigo, nome, nacionalidade);
END$$

DELIMITER ;

-- Procedure de buscar de autor por código
USE `biblioteca`;
DROP procedure IF EXISTS `buscarAutor`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarAutor` (IN codigo int(11))
BEGIN
	SELECT * FROM autor WHERE cd_autor = codigo;
END$$

DELIMITER ;

-- Procedure para atualizar autor por código
USE `biblioteca`;
DROP procedure IF EXISTS `atualizarAutor`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `atualizarAutor` (IN codigo int(11), IN nome varchar(50), IN nacionalidade varchar(25))
BEGIN
	UPDATE autor
		SET
			nm_autor			= nome,
            nm_nacionalidade	= nacionalidade
		WHERE
			cd_autor = codigo;
END$$

DELIMITER ;

-- Procedure de excluir autor por código
USE `biblioteca`;
DROP procedure IF EXISTS `excluirAutor`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `excluirAutor` (IN codigo int(11))
BEGIN
	DELETE FROM autor WHERE cd_autor = codigo;
END$$

DELIMITER ;

-- Procedure para buscar todos os autores
USE `biblioteca`;
DROP procedure IF EXISTS `buscarAutores`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarAutores` ()
BEGIN
	SELECT * FROM autor;
END$$

DELIMITER ;

-- Procedure para buscar autores de um livros 
USE `biblioteca`;
DROP procedure IF EXISTS `buscarAutoresPorLivro`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarAutoresPorLivro` (IN codigo_livro int(11))
BEGIN
	SELECT livro.nm_titulo, 
	   livro.nm_genero, 
	   livro.aa_publicacao,
	   livro.cd_livro,
	   autor.nm_autor,
       autor.nm_nacionalidade,
       autor.cd_autor
	FROM livro, autor, livro_autor
    WHERE livro.cd_livro = livro_autor.cd_livro
		AND autor.cd_autor = livro_autor.cd_autor
		AND codigo_livro = livro_autor.cd_livro;
END$$

DELIMITER ;