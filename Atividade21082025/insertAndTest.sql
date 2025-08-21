-- Inserts feitos pelo ChatGPT:

-- Inserindo usuarios
INSERT INTO Usuarios (cpf, nome, tel, address) VALUES
('12345678901', 'Carlos Silva', '11987654321', 'Rua A, 123, Sao Paulo'),
('98765432100', 'Ana Oliveira', '11998765432', 'Avenida B, 456, Sao Paulo'),
('19283746501', 'Joao Santos', '11345678901', 'Rua C, 789, Sao Paulo');

-- Inserindo categorias
INSERT INTO Categorias (nome, descricao) VALUES
('Ficcao', 'Livros de ficcao e aventura'),
('Tecnologia', 'Livros sobre tecnologia e inovacao'),
('Historia', 'Livros sobre historia mundial e brasileira');

-- Inserindo livros
INSERT INTO Livros (titulo, categoria_id, autor) VALUES
('O Senhor dos Aneis', 1, 'J.R.R. Tolkien'),
('Aprendendo Python', 2, 'Mark Lutz'),
('Historia do Brasil', 3, 'Sergio Buarque de Holanda');

-- Inserindo funcionarios
INSERT INTO Funcionarios (cpf, nome, tel, address, funcao) VALUES
('11223344556', 'Luciana Mendes', '11911223344', 'Rua D, 10, Sao Paulo', 'Bibliotecaria'),
('22334455667', 'Roberto Souza', '11922334455', 'Avenida E, 99, Sao Paulo', 'Assistente');

-- Inserindo emprestimos
INSERT INTO Emprestimos (cpf_usuario, cpf_funcionario, id_livro, data_retirada, data_devolucao_prevista, data_devolucao) VALUES
('12345678901', '11223344556', 1, '2025-08-01', '2025-08-15', '2025-08-14'),
('98765432100', '22334455667', 2, '2025-08-05', '2025-08-20', '2025-08-18'),
('19283746501', '11223344556', 3, '2025-08-10', '2025-08-24', '2025-08-23');
