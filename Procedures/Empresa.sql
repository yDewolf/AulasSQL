CREATE DATABASE IF NOT EXISTS MinhaEmpresa;
USE MinhaEmpresa;

CREATE TABLE locais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(127),
    cidade VARCHAR(63),
    estado VARCHAR(63),
    regiao VARCHAR(63)
);

DELIMITER $$

CREATE PROCEDURE inserir_local( 
    IN p_nome_cliente VARCHAR(127),
    IN p_cidade VARCHAR(63),
    IN p_estado VARCHAR(63),
    IN p_regiao VARCHAR(63)
)
BEGIN 
    INSERT INTO locais (nome_cliente, cidade, estado, regiao) VALUES
    (p_nome_cliente, p_cidade, p_estado, p_regiao);

END $$
DELIMITER ;

CALL inserir_local("Maria Silva", "São Paulo", "SP", "Sudeste");
CALL inserir_local("João Silva", "Rio de Janeiro", "RJ", "Sudeste");
CALL inserir_local("Maria Pereira", "São Paulo", "SP", "Sudeste");
CALL inserir_local("Carlos Souza", "Rio de Janeiro", "RJ", "Sudeste");
CALL inserir_local("Ana Lima", "Belo Horizonte", "MG", "Sudeste");
CALL inserir_local("Pedro Rocha", "São Paulo", "SP", "Sudeste");
CALL inserir_local("Luciana Alves", "Rio de Janeiro", "RJ", "Sudeste");

SELECT * FROM locais;

DELIMITER $$

CREATE PROCEDURE SelecionarClientesPorCidade(IN p_cidade VARCHAR(63))
BEGIN 
    SELECT * FROM locais
    WHERE cidade = p_cidade;
END

DELIMITER ;

CALL SelecionarClientesPorCidade("São Paulo");