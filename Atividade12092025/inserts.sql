-- Inserindo Clientes
INSERT INTO Clientes (nome, cidade) VALUES 
('João Silva', 'São Paulo'),
('Maria Oliveira', 'Rio de Janeiro'),
('Carlos Souza', 'Belo Horizonte'),
('Ana Costa', 'Curitiba'),
('Lucas Almeida', 'Porto Alegre');

-- Inserindo Vendedores
INSERT INTO Vendedores (nome, email) VALUES 
('Roberto Lima', 'roberto@vendas.com'),
('Fernanda Santos', 'fernanda@vendas.com'),
('Gustavo Pereira', 'gustavo@vendas.com');

-- Inserindo Categorias
INSERT INTO Categorias (nome) VALUES 
('Eletrônicos'),
('Roupas'),
('Alimentos'),
('Casa e Decoração');

-- Inserindo Produtos
INSERT INTO Produtos (id_categoria, preco, nome) VALUES 
(1, 1200.00, 'Smartphone XYZ'),
(1, 400.00, 'Fone de Ouvido ABC'),
(2, 200.00, 'Camiseta Estilo'),
(2, 80.00, 'Calça Jeans Slim'),
(3, 15.00, 'Arroz 5kg'),
(3, 10.00, 'Feijão Preto 1kg'),
(4, 100.00, 'Cadeira Escritório'),
(4, 300.00, 'Mesa de Jantar');

-- Inserindo Pedidos
INSERT INTO Pedidos (id_cliente, id_vendedor, valor_total) VALUES 
(1, 1, 5500.00),
(2, 2, 3200.00),
(3, 3, 250.00),
(4, 1, 15000.00),
(5, 2, 1000.00);

-- Inserindo Itens_Pedido
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(2, 4, 2),
(3, 5, 5),
(4, 6, 3),
(4, 7, 1),
(5, 8, 2);
