DROP DATABASE Biblioteca;
CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Usuarios (
    cpf CHAR(14) NOT NULL PRIMARY KEY,
    nome VARCHAR(127) NOT NULL,
    tel CHAR(9) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(127),
    descricao VARCHAR(255)
);

CREATE TABLE Livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    categoria_id INT NOT NULL, 
    autor VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

CREATE TABLE Funcionarios (
    cpf CHAR(14) NOT NULL PRIMARY KEY,
    nome VARCHAR(127) NOT NULL,
    tel CHAR(9) NOT NULL,
    address VARCHAR(255) NOT NULL,
    funcao VARCHAR(127) NOT NULL
);

CREATE TABLE Emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf_usuario CHAR(14) NOT NULL,
    cpf_funcionario CHAR(14) NOT NULL, 
    id_livro INT NOT NULL,
    data_retirada DATE NOT NULL DEFAULT CURRENT_DATE,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    FOREIGN KEY (cpf_usuario) REFERENCES Usuarios(cpf),
    FOREIGN KEY (cpf_funcionario) REFERENCES Funcionarios(cpf),
    FOREIGN KEY (id_livro) REFERENCES Livros(id)
);

CREATE TABLE Fornecedores (
    cnpj CHAR(14) PRIMARY KEY NOT NULL,
    nome VARCHAR(127) NOT NULL,
    telefone CHAR(9) NOT NULL
);

CREATE TABLE Compras (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cnpj_fornecedor CHAR(14) NOT NULL,
    cpf_funcionario CHAR(14) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    data_compra DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedores(cnpj),
    FOREIGN KEY (cpf_funcionario) REFERENCES Funcionarios(cpf)
);

CREATE TABLE CompraLivro (
    id_livro INT NOT NULL,
    id_compra INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES Livros(id),
    FOREIGN KEY (id_compra) REFERENCES Compras(id)
);

DELIMITER $$
CREATE PROCEDURE Proc_UsuariosComEmprestimosAtrasados(
    -- OUT usuarios_devendo
)
BEGIN
    SELECT U.nome, U.tel FROM usuarios U 
    INNER JOIN Emprestimos E ON E.cpf_usuario = U.cpf
    WHERE E.data_devolucao_prevista < NOW();
END $$
DELIMITER ; 

DELIMITER $$
CREATE PROCEDURE Proc_ComprasPorFornecedor(
    IN cnpj CHAR(14)
)
BEGIN 
    SELECT 
        valor_total, data_compra, 
        F.nome AS NomeFornecedor, 
        F.telefone AS TelefoneFornecedor,
        Fn.nome AS NomeFuncionario, 
        Fn.cpf AS CPFFuncionario, 
        Fn.tel AS TelefoneFuncionario
    FROM Compras C
    INNER JOIN Fornecedores F ON C.cnpj_fornecedor = F.cnpj
    INNER JOIN Funcionarios Fn ON Fn.cpf = C.cpf_funcionario
    WHERE F.cnpj = cnpj;
END $$
DELIMITER ;