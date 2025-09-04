CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Especialidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Medicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    id_especialidade INT NOT NULL,
    FOREIGN KEY (id_especialidade) REFERENCES Especialidades(id)
);

CREATE TABLE Atendimentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_paciente VARCHAR(255) NOT NULL,
    data_atendimento DATETIME NOT NULL DEFAULT NOW(),
    id_medico INT NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id)
);

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
