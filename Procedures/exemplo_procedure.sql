CREATE DATABASE IF NOT EXISTS Autenticacao;
use Autenticacao;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(127),
    usuario VARCHAR(63),
    senha VARCHAR(127)
);


DELIMITER $$

CREATE PROCEDURE autentica_usuario (
    IN p_usuario VARCHAR(63),
    IN p_senha VARCHAR(127),
    OUT p_autenticacao INT
)
BEGIN 
    SELECT COUNT(*) INTO p_autenticacao
    FROM usuarios
    WHERE usuario = p_usuario AND senha = p_senha;

END $$

DELIMITER ;

CALL autentica_usuario("exemplo", "minhasenha", @resultado);
SELECT @resultado;

INSERT INTO usuarios (nome, usuario, senha) VALUES 
("João Silva", "joaos", "123456"),
("Maria Oliveira", "mariao", "senha@2025");

CALL autentica_usuario("joaos", "123456", @resultado);
SELECT @resultado;

CALL autentica_usuario("mariao", "senha@2024", @resultado);
SELECT @resultado;