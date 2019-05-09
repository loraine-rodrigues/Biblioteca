<?php
require '../conexao.php';
try {
    $query = $conexao->query("CALL buscarUsuarios()");
}
catch (mysqli_sql_exception $exception) {
    echo "Erro ao buscar usuários : (" . $conexao->errno . ") " . $conexao->error;
}
$conexao->close();
?>
<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Biblioteca - Usuários</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</head>
<body>
<h1>Usuários</h1>
<p><a href="adicionar.php" class="btn btn-primary m-2 float-left">Adicionar</a></p>
<p><a href="../index.php" class="btn btn-secondary m-2 float-right">Voltar</a></p>
<table class="table">
    <tr>
        <th>CPF</th>
        <th>Nome</th>
        <th>Endereço</th>
        <th>Telefone</th>
        <th>Opções</th>
    </tr>
    <?php while ($resultado = $query->fetch_array(MYSQLI_ASSOC)): ?>
        <tr>
            <td><?php echo $resultado['cd_cpf'] ?></a></td>
            <td><?php echo $resultado['nm_nome'] ?></td>
            <td><?php echo $resultado['nm_endereco'] ?></td>
            <td><?php echo $resultado['cd_telefone'] ?></td>
            <td><a class="btn btn-warning" href="editar.php?codigo=<?php echo $resultado['cd_cpf'] ?>">Editar</a> - <a class="btn btn-danger" href="excluir.php?codigo=<?php echo $resultado['cd_cpf'] ?>">Excluir</a></td>
        </tr>
    <?php endwhile; ?>
</table>
</body>
</html>
