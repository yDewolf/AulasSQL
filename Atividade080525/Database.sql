CREATE DATABASE Livraria;
USE Livraria;

CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(64) NOT NULL
);

CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY ,
    titulo VARCHAR(255) NOT NULL,
    ano_publicacao INT NOT NULL,
    preco DECIMAL(2, 10) NOT NULL,
    id_autor INT NOT NULL,
    CONSTRAINT FK_IdAutor FOREIGN KEY (id_autor) REFERENCES Autores(id_autor) 
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cidade VARCHAR(127) NOT NULL
);

CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    id_cliente INT NOT NULL,
    id_livro INT NOT NULL,
    CONSTRAINT FK_IdCliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    CONSTRAINT FK_IdLivro FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
);  
