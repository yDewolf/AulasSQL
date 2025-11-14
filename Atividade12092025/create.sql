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

DELIMITER $$
CREATE PROCEDURE Relatorio_Pedidos_Por_Periodo ( 
    IN min_date DATE,
    IN max_date DATE
)
BEGIN 
    SELECT 
        P.id,
        P.valor_total,
        V.email as EmailVendedor,
        V.nome as NomeVendedor,
        C.nome as NomeCliente
    FROM Pedidos P
    INNER JOIN Vendedores V ON V.id = P.id_vendedor
    INNER JOIN Clientes C ON C.id = P.id_cliente
    WHERE P.data_pedido BETWEEN min_date AND max_date;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Relatorio_Produtos_Por_Categoria ( 
    IN categoria_id INT
)
BEGIN 
    SELECT 
        P.nome,
        P.preco,
        C.nome as NomeCategoria
    FROM Produtos P
    INNER JOIN Categorias C ON C.id = P.id_categoria
    WHERE C.id = categoria_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Relatorio_Equipe_Projeto ( 
    IN pedido_id INT
)
BEGIN 
    SELECT 
        P.data_pedido,
        P.valor_total,
        C.nome as NomeCliente,
        V.nome as NomeVendedor,
        V.email as EmailVendedor
    FROM Pedidos P
    INNER JOIN Clientes C ON C.id = P.id_cliente
    INNER JOIN Vendedores V ON V.id = P.id_vendedor 
    WHERE P.id = pedido_id;
END $$
DELIMITER ;
