-- Inserindo Especialidades
INSERT INTO Especialidades (nome) VALUES
('Cardiologia'),
('Pediatria'),
('Ortopedia'),
('Dermatologia');

-- Inserindo Médicos
INSERT INTO Medicos (nome, email, id_especialidade) VALUES
('Dr. João Silva', 'joao.silva@hospital.com', 1),
('Dra. Maria Souza', 'maria.souza@hospital.com', 2),
('Dr. Pedro Santos', 'pedro.santos@hospital.com', 3),
('Dra. Ana Lima', 'ana.lima@hospital.com', 4);

-- Inserindo Atendimentos
INSERT INTO Atendimentos (nome_paciente, data_atendimento, id_medico) VALUES
('Carlos Pereira', '2024-01-15 10:30:00', 1),
('Mariana Costa', '2024-02-20 14:00:00', 2),
('Felipe Rocha', '2024-03-05 09:15:00', 3),
('Luciana Alves', '2024-04-12 16:45:00', 4),
('Rafael Mendes', '2024-05-07 11:00:00', 1),
('Beatriz Santos', '2024-05-18 13:30:00', 2);

CALL Proc_AtendimentosPorEspecialidade(1);