call buscarEditoras();

call inserirEditora(99887766, 'Editora1', 'Rua da editora', '123456789');

call buscarEditora(99887766);

call atualizarEditora(99887766, 'Editora São Bento', 'Rua da editora, 123', '123456789');

call excluirEditora(99887766);