DROP DATABASE exemplo_views;
CREATE DATABASE exemplo_views;
USE exemplo_views;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    produto VARCHAR(100),
    valor DECIMAL(10, 2),
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

INSERT INTO clientes (nome, cidade, estado) VALUES
    ("João Silva", "São Paulo", "SP"),
    ("Maria Oliveira", "Rio de Janeiro", "RJ"),
    ("Carlos Souza", "Campinas", "SP");

INSERT INTO pedidos (id_cliente, produto, valor, data_pedido) VALUES
    (1, "Notebook", 3500.00, '2025-05-01'),
    (1, "Mouse", 80.00, '2025-05-03'),
    (2, "Teclado", 120.00, '2025-05-02'),
    (3, "Monitor", 800.00, '2025-05-04');

CREATE VIEW relatorio_pedidos AS
SELECT 
    C.nome AS cliente,
    C.cidade,
    p.produto,
    p.valor,
    p.data_pedido
FROM pedidos P
JOIN clientes C ON p.id_cliente = C.id;