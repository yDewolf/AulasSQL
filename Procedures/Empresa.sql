DROP DATABASE MinhaEmpresa;
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
END $$
DELIMITER ;

CALL SelecionarClientesPorCidade("São Paulo");

DELIMITER $$
CREATE PROCEDURE ContaClientesPorCidade(
    IN p_cidade VARCHAR(63), 
    OUT total INT
)
BEGIN 
    SELECT COUNT(*) INTO total
    FROM locais
    WHERE cidade = p_cidade;
END $$
DELIMITER ;

CALL ContaClientesPorCidade("São Paulo", @quantidade);
SELECT @quantidade;

DELIMITER $$
CREATE PROCEDURE verificar_regiao(
    IN p_cidade VARCHAR(63),
    IN target_reg VARCHAR(63),
    OUT mensagem VARCHAR(127)
)
BEGIN
    DECLARE reg VARCHAR(63);
    SELECT regiao INTO reg FROM locais WHERE cidade = p_cidade LIMIT 1;
    IF reg IS NULL THEN
        SET mensagem = "Cidade não encontrada";
    ELSEIF reg = target_reg THEN
        SET mensagem = CONCAT("A cidade", p_cidade, " está na região", target_reg);
    ELSE
        SET mensagem = CONCAT("A Cidade ", p_cidade, "está em outra região");
    END IF;
END $$
DELIMITER ;

CALL verificar_regiao("São Paulo", "Sudeste", @message);
SELECT @message;

DELIMITER $$
CREATE PROCEDURE contar_locais_regiao(
    IN p_regiao VARCHAR(63),
    OUT total INT
)
BEGIN 
    DECLARE contador INT DEFAULT 0;

    SELECT COUNT(*) INTO total FROM locais WHERE regiao = p_regiao;
    SET contador = total;

    DECLARE atual INT DEFAULT 0;
    WHILE atual < contador DO
        SET atual = atual + 1;
    END WHILE;
END $$
DELIMITER ;

CALL contar_locais_regiao("Sudeste", @total);
SELECT @total;