DROP DATABASE VendasOnline;

CREATE DATABASE VendasOnline;
USE VendasOnline;

CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cidade VARCHAR(127) NOT NULL
);

CREATE TABLE Vendedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE Pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    data_pedido DATETIME DEFAULT NOW(),
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id)
);

CREATE TABLE Categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

CREATE TABLE Produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    nome VARCHAR(127) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
);

CREATE TABLE Itens_Pedido (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id)
);

CREATE VIEW Boletim_Pedidos AS
SELECT 
    P.id,
    C.nome,
    P.data_pedido,
    P.valor_total,
    C.cidade
FROM Pedidos P
JOIN Clientes C ON P.id_cliente = C.id;

CREATE VIEW Produto_Categoria AS
SELECT 
    Produtos.nome NomeProduto,
    Categorias.nome NomeCategoria
FROM Produtos
JOIN Categorias ON Produtos.id_categoria = Categorias.id;

