DROP VIEW Historico_Emprestimos;
CREATE VIEW Historico_Emprestimos AS
SELECT 
    U.nome NomeUsuario,
    L.titulo TituloLivro,
    C.descricao CategoriaLivro,
    F.nome NomeFuncionario,
    E.data_retirada,
    E.data_devolucao_prevista,
    E.data_devolucao
FROM Emprestimos E
JOIN Usuarios U ON U.cpf = E.cpf_usuario
JOIN Livros L ON L.id = E.id_livro
JOIN Categorias C ON L.categoria_id = C.id
JOIN Funcionarios F ON F.cpf = E.cpf_funcionario;

SELECT * FROM Historico_Emprestimos;

DROP VIEW Relatorio_Compras_Livros;
CREATE VIEW Relatorio_Compras_Livros AS
SELECT 
    Fornecedor.nome NomeFornecedor,
    Funcionario.nome NomeFuncionario,
    Compra.id,
    Livro.titulo,
    CompraLivro.quantidade,
    Compra.valor_total,
    Compra.data_compra
FROM Compras Compra
JOIN Fornecedores Fornecedor ON Compra.cnpj_fornecedor = Fornecedor.cnpj
JOIN Funcionarios Funcionario ON Compra.cpf_funcionario = Funcionario.cpf
JOIN CompraLivro CompraLivro ON CompraLivro.id_compra = Compra.id
JOIN Livros Livro ON CompraLivro.id_livro = Livro.id
GROUP BY Compra.id;

SELECT * FROM Relatorio_Compras_Livros;