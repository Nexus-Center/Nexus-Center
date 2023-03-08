-- Criar Database
create database NexusCenter;

-- Selecionar Database
use NexusCenter;

-- Criar tabelas

CREATE TABLE CadastroFuncionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    CONSTRAINT chkEmail CHECK (email LIKE '%@%'),
    senha VARCHAR(45),
    codigoDeEmpresa INT,
    codigoDeEquipe INT,
    setor VARCHAR (5),

);

CREATE TABLE Maquina (
    idMaquina INT PRIMARY KEY AUTO_INCREMENT,
    setor VARCHAR(45),
    fkFuncionario INT,
    FOREIGN KEY (fkFuncionario)
        REFERENCES CadastroFuncionario (idFuncionario)
);

CREATE TABLE Metricas (
    idmetrica INT AUTO_INCREMENT,
    dataHora DATETIME,
    cpu DECIMAL(4 , 2 ),
    ram DECIMAL(4 , 2),
    memoria DECIMAL(4 , 2 ),
    periferico DECIMAL(4 , 2),
    fkMaquina  INT,
    PRIMARY KEY (idmetrica , fkMaquina),
    FOREIGN KEY (fkMaquina)
        REFERENCES Maquina (idMaquina)
)

