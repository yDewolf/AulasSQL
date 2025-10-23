-- INSERTS PARA TESTES

-- Usuários
INSERT INTO Usuarios (cpf, nome, tel, address) VALUES
('11111111111', 'Alice Silva', '999999999', 'Rua das Flores, 123'),
('22222222222', 'Bruno Souza', '988888888', 'Av. Central, 456');

-- Categorias
INSERT INTO Categorias (nome, descricao) VALUES
('Romance', 'Livros de romance'),
('Ficção Científica', 'Livros de ficção com base científica');

-- Livros
INSERT INTO Livros (titulo, categoria_id, autor, preco) VALUES
('Amor em Paris', 1, 'Joana Martins', 45.90),
('Viagem ao Centro da Terra', 2, 'Júlio Verne', 59.50);

-- Funcionários
INSERT INTO Funcionarios (cpf, nome, tel, address, funcao) VALUES
('33333333333', 'Carlos Mendes', '977777777', 'Rua do Sol, 789', 'Bibliotecário'),
('44444444444', 'Daniela Lima', '966666666', 'Av. Norte, 321', 'Atendente');

-- Empréstimos
INSERT INTO Emprestimos (cpf_usuario, cpf_funcionario, id_livro, data_retirada, data_devolucao_prevista, data_devolucao) VALUES
('11111111111', '33333333333', 1, '2025-08-01', '2025-08-15', '2025-08-10'),
('22222222222', '44444444444', 2, '2025-08-05', '2025-08-20', '2025-08-21');

-- Fornecedores
INSERT INTO Fornecedores (cnpj, nome, telefone) VALUES
('12345678000199', 'Distribuidora Alfa', '955555555'),
('98765432000188', 'Editora Beta', '944444444');

-- Compras
INSERT INTO Compras (cnpj_fornecedor, cpf_funcionario, valor_total, data_compra) VALUES
('12345678000199', '33333333333', 150.00, '2025-07-15 10:30:00'),
('98765432000188', '44444444444', 200.00, '2025-08-10 14:45:00');

-- CompraLivro
INSERT INTO CompraLivro (id_livro, id_compra, quantidade) VALUES
(1, 1, 2),
(2, 2, 3);

CALL Proc_UsuariosComEmprestimosAtrasados();
CALL Proc_ComprasPorFornecedor("98765432000188");