USE Livraria;

-- Livros por preço
SELECT titulo, preco
FROM Livros
ORDER BY preco;

-- Quantidade de vendas por livro
SELECT Livros.titulo, SUM(V.quantidade)
FROM vendas V
JOIN Livros ON V.id_livro = Livros.id_livro
GROUP BY Livros.titulo;

-- Média de preço de livro por autor
SELECT AVG(Livros.preco), Autores.nome
FROM Livros
JOIN Autores ON Livros.id_autor = Livros.id_autor
GROUP BY Autores.nome;

-- Apenas autores que tem mais de um livro
SELECT nome, COUNT(Livros.id_livro)
FROM Autores
JOIN Livros ON Livros.id_autor = Autores.id_autor
GROUP BY Autores.nome
HAVING COUNT(Livros.id_livro) > 1;

-- Modulo 5

-- Livros e seus respectivos autores
SELECT titulo, Autores.nome
FROM Livros
INNER JOIN Autores ON Autores.id_autor = Livros.id_autor;

-- Clientes e suas compras
SELECT Clientes.nome, Livros.titulo, Vendas.data_venda
FROM Vendas
INNER JOIN Clientes ON Clientes.id_cliente = Vendas.id_cliente
INNER JOIN Livros ON Livros.id_livro = Vendas.id_livro;

-- Clientes que compraram livros de estrangeiros
SELECT Clientes.nome
FROM Vendas
INNER JOIN Clientes ON Clientes.id_cliente = Vendas.id_cliente
INNER JOIN Livros ON Livros.id_livro = Vendas.id_livro
INNER JOIN Autores ON Autores.id_autor = Livros.id_autor
WHERE Autores.nacionalidade != "BR";