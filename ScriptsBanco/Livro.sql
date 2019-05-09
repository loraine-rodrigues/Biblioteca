-- CRUD DE LIVROS

-- Procedure de inserção de livros
USE `biblioteca`;
DROP procedure IF EXISTS `inserirLivro`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `inserirLivro` (IN codigo int(11), IN titulo varchar(60), IN genero varchar(25), IN anoPublicacao year(4), IN cpf_funcionario char(11), IN codigo_editora int(11), IN cpf_usuario_retirar char(11), IN cpf_usuario_reservar char(11))
BEGIN
	INSERT INTO livro (cd_livro, nm_titulo, nm_genero, aa_publicacao, cd_cpf_funcionario, cd_editora, cd_cpf_usuario_retirar, cd_cpf_usuario_reservar) 
		VALUES (codigo, titulo, genero, anoPublicacao, cpf_funcionario, codigo_editora, cpf_usuario_retirar, cpf_usuario_reservar);
END$$

DELIMITER ;

-- Procedure para buscar todos os livros 
USE `biblioteca`;
DROP procedure IF EXISTS `buscarLivros`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarLivros`()
BEGIN
	SELECT * FROM livro;
END$$

DELIMITER ;

-- Procedure para buscar livro por código
USE `biblioteca`;
DROP procedure IF EXISTS `buscarLivroPorCodigo`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarLivroPorCodigo` (IN codigo int(11))
BEGIN
	SELECT * FROM livro WHERE cd_livro = codigo;
END$$

DELIMITER ;

-- Procedure para buscar livros de um autor
USE `biblioteca`;
DROP procedure IF EXISTS `buscarLivrosPorAutor`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarLivrosPorAutor` (IN codigo_autor int(11))
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
		AND codigo_autor = livro_autor.cd_autor;
END$$

DELIMITER ;

-- Procedure para buscar livros de uma editora
USE `biblioteca`;
DROP procedure IF EXISTS `buscarLivrosPorEditora`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `buscarLivrosPorEditora`(IN codigo_editora int(11))
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

-- Procedure para atualizar livro
USE `biblioteca`;
DROP procedure IF EXISTS `atualizarLivro`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `atualizarLivro` (IN codigo int(11), IN titulo varchar(60), IN genero varchar(25), IN anoPublicacao year(4), IN cpf_funcionario char(11), IN codigo_editora int(11), IN cpf_usuario_retirar char(11), IN cpf_usuario_reservar char(11))
BEGIN
	UPDATE livro
    SET    
		nm_titulo      = titulo,
		nm_genero     = genero,
		aa_publicacao = anoPublicacao,
        cd_cpf_funcionario = cpf_funcionario,
        cd_editora = codigo_editora,
        cd_cpf_usuario_retirar = cpf_usuario_retirar,
        cd_cpf_usuario_reservar = cpf_usuario_reservar
    WHERE  
		cd_livro = codigo; 
END$$

DELIMITER ;

-- Procedure para excluir livro por código
USE `biblioteca`;
DROP procedure IF EXISTS `excluirLivro`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `excluirLivro` (IN codigo int(11))
BEGIN
	DELETE FROM livro WHERE cd_livro = codigo;
END$$

DELIMITER ;