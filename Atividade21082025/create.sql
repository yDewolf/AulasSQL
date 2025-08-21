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
    autor VARCHAR(255),
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

CREATE VIEW Historico_Emprestimos AS
SELECT 
    U.nome NomeUsuario,
    L.titulo TituloLivro,
    C.descricao CategoriaLivro,
    F.nome NomeFuncionario,
    E.data_retirada,
    E.data_devolucao_prevista,
    E.data_devolucao
FROM Emprestimos E
JOIN Usuarios U ON U.cpf = E.cpf_usuario
JOIN Livros L ON L.id = E.id_livro
JOIN Categorias C ON L.categoria_id = C.id
JOIN Funcionarios F ON F.cpf = E.cpf_funcionario
