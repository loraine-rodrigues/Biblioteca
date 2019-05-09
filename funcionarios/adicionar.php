<?php
require '../conexao.php';
if (isset($_POST['adicionar']))
{
    $cpf = $_POST['cpf'];
    $nome = $_POST['nome'];
    $endereco = $_POST['endereco'];
    $telefone = $_POST['telefone'];
    $salario = $_POST['salario'];
    $funcao = $_POST['funcao'];

    try {
        $procedureInserir = "CALL inserirFuncionario($cpf, '$nome', '$endereco', '$telefone', '$salario', '$funcao')";
        if ($conexao->query($procedureInserir) === TRUE) {
            header('Location: index.php');
        }
        echo $conexao->error;
    }
    catch (mysqli_sql_exception $exception) {
        echo "Erro ao adicionar funcionário: (" . $conexao->errno . ") " . $conexao->error;
    }
}
?>

<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Biblioteca - Adicionar Funcionário</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</head>
<body>
    <h1>Adicionar Funcionário</h1>
    <form method="post">
        <table class="table">
            <tr>
                <td><label for="cpf">CPF</label></td>
                <td><input type="text" id="cpf" name="cpf" placeholder="Informe o cpf"></td>
            </tr>
            <tr>
                <td><label for="nome">Nome</label></td>
                <td><input type="text" id="nome" name="nome" placeholder="Informe o nome"></td>
            </tr>
            <tr>
                <td><label for="endereco">Endereço</label></td>
                <td><input type="text" id="endereco" name="endereco" placeholder="Informe o endereço"></td>
            </tr>
            <tr>
                <td><label for="telefone">Telefone</label></td>
                <td><input type="text" id="telefone" name="telefone" placeholder="Informe o telefone"></td>
            </tr>
            <tr>
                <td><label for="salario">Salário</label></td>
                <td><input type="text" id="salario" name="salario" placeholder="Informe o salário"></td>
            </tr>
            <tr>
                <td><label for="funcao">Função</label></td>
                <td><input type="text" id="funcao" name="funcao" placeholder="Informe a função"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="index.php" class="btn btn-danger mx-5">Voltar</a>
                    <button type="submit" class="btn btn-success" name="adicionar">Adicionar</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>