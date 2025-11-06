DROP DATABASE Hospital;
CREATE DATABASE Hospital;
USE Hospital;

-- Tabela de Especialidades
CREATE TABLE Especialidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

-- Tabela de médicos
CREATE TABLE Medicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    id_especialidade INT NOT NULL,
    FOREIGN KEY (id_especialidade) REFERENCES Especialidades(id)
);

-- Tabela de Atendimentos
CREATE TABLE Atendimentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_paciente VARCHAR(255) NOT NULL,
    data_atendimento DATETIME NOT NULL DEFAULT NOW(),
    id_medico INT NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id)
);

-- Criar a view de atendimentos
-- Mostra informações sobre a especialidade
-- do médico e seu contato, o código do atendimento
-- nome do paciente e data de atendimento
CREATE VIEW Equipe_Atendimento AS
SELECT 
    E.id IdEspecialidade,
    E.nome NomeEspecialidade,
    M.email EmailMedico,
    A.id IdAtendimento,
    A.nome_paciente NomePaciente,
    A.data_atendimento DataAtendimento
FROM Atendimentos A
JOIN Medicos M ON A.id_medico = M.id
JOIN Especialidades E ON M.id_especialidade = E.id;

DELIMITER $$
CREATE PROCEDURE Proc_AtendimentosPorEspecialidade (
    IN especialidade_id INT
)
BEGIN 
    SELECT 
        nome_paciente, 
        data_atendimento, 
        M.nome as NomeMedico
    FROM Atendimentos A
    INNER JOIN Medicos M ON A.id_medico = M.id
    WHERE M.id_especialidade = especialidade_id;
END $$
DELIMITER ;
