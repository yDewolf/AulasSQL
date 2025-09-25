
DROP VIEW IF EXISTS Boletim_Pedidos;
CREATE VIEW Boletim_Pedidos AS
SELECT 
    P.id CodigoPedido,
    C.nome NomeCliente,
    P.data_pedido,
    P.valor_total,
    C.cidade
FROM Pedidos P
INNER JOIN Clientes C ON P.id_cliente = C.id;

DROP VIEW IF EXISTS Produto_Categoria;
CREATE VIEW Produto_Categoria AS
SELECT 
    Produtos.nome NomeProduto,
    Categorias.nome NomeCategoria
FROM Produtos
INNER JOIN Categorias ON Produtos.id_categoria = Categorias.id;

DROP VIEW IF EXISTS Vendedor_Pedido;
CREATE VIEW Vendedor_Pedido AS
SELECT 
    V.nome NomeVendedor,
    P.id,
    C.nome NomeCliente,
    P.data_pedido
FROM Pedidos P
INNER JOIN Vendedores V ON P.id_vendedor = V.id
INNER JOIN Clientes C ON P.id_cliente = C.id
GROUP BY V.id, V.nome;

DROP VIEW IF EXISTS Cliente_MaiorCompra;
CREATE VIEW Cliente_MaiorCompra AS
SELECT 
    C.nome NomeCliente,
    P.data_pedido,
    P.valor_total
FROM Pedidos P
JOIN Clientes C ON P.id_cliente = C.id
WHERE P.valor_total >= 5000;

DROP VIEW IF EXISTS Categoria_MaisVendida;
CREATE VIEW Categoria_MaisVendida AS
SELECT 
    Cat.nome,
    SUM(IP.quantidade) TotalVendido
FROM Itens_Pedido IP
INNER JOIN Produtos P ON IP.id_produto = P.id
INNER JOIN Categorias Cat ON P.id_categoria = Cat.id
GROUP BY Cat.nome;

DROP VIEW IF EXISTS Cliente_TotalPedidos;
CREATE VIEW Cliente_TotalPedidos AS
SELECT 
    C.nome NomeCliente,
    C.cidade,
    SUM(IP.quantidade) TotalPedidos
FROM Itens_Pedido IP
INNER JOIN Pedidos P ON IP.id_pedido = P.id
INNER JOIN Clientes C ON P.id_cliente = C.id
GROUP BY C.id, C.nome;

DROP VIEW IF EXISTS Vendedor_Faturamento;
CREATE VIEW Vendedor_Faturamento AS
SELECT
    V.nome NomeVendedor,
    COUNT(P.id) QuantidadePedidos,
    SUM(P.valor_total) ValorTotalVendas
FROM Vendedores V
INNER JOIN Pedidos P ON P.id_vendedor = V.id
GROUP BY V.id, V.nome;

DROP VIEW IF EXISTS Produtos_NaoVendidos;
CREATE VIEW Produtos_NaoVendidos AS
SELECT 
    Prod.nome
FROM Produtos Prod
LEFT JOIN Itens_Pedido IP ON Prod.id = IP.id_produto
LEFT JOIN Pedidos P ON IP.id_pedido = P.id AND P.data_pedido BETWEEN '2024-01-01' AND '2024-12-31'
WHERE P.id IS NULL;

-- Essa aqui também parece errada
DROP VIEW IF EXISTS Clientes_Premium;
CREATE VIEW Clientes_Premium AS
SELECT
    C.nome,
    C.cidade
FROM Clientes C
INNER JOIN Pedidos P ON P.id_cliente = C.id
HAVING COUNT(P.id) >= 10;

