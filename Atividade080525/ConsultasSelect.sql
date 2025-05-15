USE Livraria;

-- Selecionar livros que tem ano de publicacao depois de 2015
SELECT * FROM Livros
    WHERE ano_publicacao > 2015;

-- Selecionar autores com nacionalidade = BR
SELECT * FROM Autores
    WHERE nacionalidade = "BR";

-- Selecionar livros com nome que começa pela letra S
SELECT * FROM Clientes
    WHERE nome = "S%";

-- Selecionar livros com preco entre 30 e 50
SELECT * FROM Livros
    WHERE preco BETWEEN 30 AND 50;
