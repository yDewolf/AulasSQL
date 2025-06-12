-- Selecionar autores e a quantidade de livros autorais vendidos
SELECT nome, SUM(Vendas.quantidade) FROM Autores
INNER JOIN Livros ON Livros.id_autor = Autores.id_autor
INNER JOIN Vendas ON Vendas.id_livro = Livros.id_livro
GROUP BY Autores.nome;

-- Selecionar clientes que compraram mais que 2 livros
SELECT Clientes.nome FROM Vendas
INNER JOIN Clientes ON Clientes.id_cliente = Vendas.id_cliente
GROUP BY Clientes.nome
HAVING COUNT(Clientes.id_cliente) > 2;

-- Selecionar livros que nunca foram vendidos
SELECT Livros.titulo FROM Livros
WHERE NOT EXISTS (
    SELECT Vendas.id_livro FROM Vendas
    WHERE Vendas.id_livro = id_livro)
GROUP BY Livros.titulo;