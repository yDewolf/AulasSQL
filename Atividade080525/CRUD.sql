INSERT INTO Autores (nome, nacionalidade)
    VALUES 
        ("Machado de Assis", "BR"),
        ("Carlos Drummond", "BR"),
        ("Pedro Bandeira", "BR"),
        ("Maurício de Souza", "BR"),
        ("Montero Lobato", "BR");

INSERT INTO Livros (titulo, ano_publicacao, preco, id_autor)
    VALUES 
        ("Turma da Mônica", 1959, 9.90, 4),
        ("Turma da Mônica Jovem", 2008, 9.90, 4),
        ("Dom Casmurro", 1899, 6.90, 1),
        ("A Droga da Obediencia", 1984, 6.90, 3),
        ("O Saci", 1921, 9.90, 5),
        ("Reinações de Narizinho", 1931, 12.90, 5),
        ("Sentimento do Mundo", 1940, 15.90, 2),
        ("Alguma Poesia", 1930, 15.90, 2);

INSERT INTO Clientes (nome, email, cidade)
    VALUES
        ("Duda", "dudinhalealmoranguinho@gmail.com", "Marília"),
        ("André", "andrersng@gmail.com", "Marília"),
        ("Davi", "daviddd@gmail.com", "Campos Novos Paulista"),
        ("Daniel", "danielbonfim@gmail.com", "Marília"),
        ("Raquel", "yraquellissa@gmail.com", "Marília");

INSERT INTO Vendas (data_venda, quantidade, id_cliente, id_livro)
    VALUES
        ("05-15-2025", 1, 2, 3),
        ("05-15-2025", 1, 1, 3),
        ("05-15-2025", 1, 4, 3),
        ("05-15-2025", 1, 5, 1),
        ("05-15-2025", 1, 3, 5),
        ("05-15-2025", 1, 3, 3),
        ("05-15-2025", 1, 3, 2),
        ("05-15-2025", 1, 1, 2),
        ("05-15-2025", 1, 1, 1),
        ("05-15-2025", 1, 4, 8),
        ("05-15-2025", 1, 2, 6);

UPDATE Livros
SET preco = 7.90
WHERE id_livro = 3;

DELETE FROM Clientes
WHERE id_cliente NOT IN (
    SELECT DISTINCT id_cliente FROM Clientes
);

DROP DATABASE Livraria;
