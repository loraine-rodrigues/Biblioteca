<?php
require '../conexao.php';
if (isset($_POST['atualizar']))
{
    $id = $_POST['id'];
    $titulo = $_POST['titulo'];
    $genero = $_POST['genero'];
    $ano = $_POST['anoPublicacao'];

    try {
        $procedureAtualizar = "CALL atualizarLivro($id, '$titulo', '$genero', '$ano')";
        if ($conexao->query($procedureAtualizar) === TRUE) {
            header('Location: index.php');
        }
    }
    catch (mysqli_sql_exception $exception) {
        echo "Erro ao editar livro: (" . $conexao->errno . ") " . $conexao->error;
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
    <title>Biblioteca - Editar Livro</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</head>
<body>
<?php
if (isset($_GET['codigo']))
{
    $codigo = $_GET['codigo'];
    try {
        $procedureBusca = "CALL buscarLivroPorCodigo($codigo)";
        $query = $conexao->query($procedureBusca);

        $resultado = $query->fetch_assoc();
        if (!$resultado) {
            header('Location: index.php');
        }
        ?>
        <h1>Editar livro</h1>
        <form method="post">
            <table class="table">
                <tr>
                    <td><label for="id">Código</label></td>
                    <td>
                        <input disabled type="text" id="id" name="id" value="<?php echo $resultado['cd_livro'] ?>">
                        <input type="hidden" name="id" value="<?php echo $resultado['cd_livro'] ?>">
                    </td>
                </tr>
                <tr>
                    <td><label for="titulo">Título</label></td>
                    <td><input type="text" id="titulo" name="titulo" placeholder="Informe o título" value="<?php echo $resultado['nm_titulo'] ?>"></td>
                </tr>
                <tr>
                    <td><label for="genero">Gênero</label></td>
                    <td><input type="text" id="genero" name="genero" placeholder="Informe o gênero" value="<?php echo $resultado['nm_genero'] ?>"></td>
                </tr>
                <tr>
                    <td><label for="anoPublicacao">Ano de publicação</label></td>
                    <td><input type="text" id="anoPublicacao" name="anoPublicacao" placeholder="Informe o ano publicação" value="<?php echo $resultado['aa_publicacao'] ?>"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="index.php" class="btn btn-danger mx-5">Voltar</a>
                        <button type="submit" class="btn btn-success" name="atualizar">Atualizar</button>
                    </td>
                </tr>
            </table>
        </form>
        <?php
    }
    catch (mysqli_sql_exception $exception) {
        echo "Erro ao editar livro: (" . $conexao->errno . ") " . $conexao->error;
    }
}

else {
    header('Location: index.php');
}
?>
</body>
</html>