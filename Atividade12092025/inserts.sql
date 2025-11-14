INSERT INTO Clientes (nome, cidade) VALUES
('Alice', 'São Paulo'),
('Bruno', 'Rio de Janeiro'),
('Carla', 'Belo Horizonte');

INSERT INTO Vendedores (nome, email) VALUES
('Vitor', 'vitor@loja.com'),
('Fernanda', 'fernanda@loja.com');

INSERT INTO Categorias (nome) VALUES
('Eletrônicos'),
('Livros'),
('Roupas');

INSERT INTO Produtos (id_categoria, preco, nome) VALUES
(1, 3000.00, 'Notebook Gamer'),
(1, 1500.00, 'Smartphone'),
(2, 50.00, 'Livro de Fantasia'),
(3, 200.00, 'Camiseta'),
(2, 100.00, 'Livro Não Vendido');

INSERT INTO Pedidos (id_cliente, id_vendedor, data_pedido, valor_total) VALUES
(1, 1, '2024-02-10', 4500.00),
(2, 2, '2024-03-15', 5200.00),
(3, 1, '2024-04-20', 200.00);

INSERT INTO Pedidos (id_cliente, id_vendedor, data_pedido, valor_total) VALUES
(1, 1, '2024-05-01', 100.00),
(1, 1, '2024-05-02', 120.00),
(1, 1, '2024-05-03', 130.00),
(1, 1, '2024-05-04', 140.00),
(1, 1, '2024-05-05', 150.00),
(1, 1, '2024-05-06', 160.00),
(1, 1, '2024-05-07', 170.00),
(1, 1, '2024-05-08', 180.00);

INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 3),
(5, 3, 1),
(6, 3, 1),
(7, 3, 1),
(8, 3, 1),
(9, 3, 1),
(10, 3, 1),
(11, 3, 1);

CALL Relatorio_Pedidos_Por_Periodo('2024-05-01', '2024-05-06');
CALL Relatorio_Produtos_Por_Categoria(1);
CALL Relatorio_Equipe_Projeto(1);