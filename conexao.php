<?php

$servidor = "localhost";
$banco = "biblioteca";
$usuario = "root";
$senha = "";

$conexao = new mysqli($servidor, $usuario, $senha, $banco);

if ($conexao->connect_errno) {
    echo "Erro ao conectar ao banco!" . PHP_EOL;
    echo "Número do erro: " . $conexao->connect_error . PHP_EOL;
    exit;
}

$conexao->set_charset('utf8');