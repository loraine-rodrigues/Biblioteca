-- Teste de procedures de livro

-- Inserir
call inserirLivro(44332211, 'Nome do Livro', 'Gênero do livro', '2019', null, null, null, null);

-- Buscar todos
call buscarLivros();

-- Buscar por código
call buscarLivroPorCodigo(44332211);

-- Buscar por autor
call buscarLivrosPorAutor(55490076);

-- Buscar por editora
call buscarLivrosPorEditora(2134000);

-- Atualizar
call atualizarLivro(44332211, 'Livro', 'Sem gênero', '2010', null, null, null, null);

-- Excluir
call excluirLivro(44332211);