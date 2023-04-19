CREATE DATABASE NexusCenter;
-- DROP DATABASE nexuscenter;

USE NexusCenter;

CREATE TABLE Empresa(
	idEmpresa CHAR(6) PRIMARY KEY,
	razaoSocial VARCHAR(120),
	CNPJ CHAR(14),
	email VARCHAR(45),
	tel CHAR(14)
);

CREATE TABLE Usuario(
	idUser INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	email VARCHAR(45),
	senha VARCHAR(45),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Maquina(
	idMaquina INT PRIMARY KEY AUTO_INCREMENT,
	nomeDoUsuario VARCHAR(45),
	patrimonio VARCHAR(45),
	senha VARCHAR(45),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE MetricaMouse(
	idMetrica INT PRIMARY KEY AUTO_INCREMENT,
	cordenadaX INT,
	cordenadaY INT,
	qntClicks VARCHAR(45),
	dataHora DATETIME,
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE RegistroAtividade(
	fkUsuario INT,
	FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUser),
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
	sistemaOperacional VARCHAR(45),
	fabricante VARCHAR(45),
	arquitetura VARCHAR(45),
	inicializado DATETIME,
	tempoDeAtividade VARCHAR(45)
);

CREATE TABLE Componente(
	idComponente INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(45),
    tipoComponente VARCHAR(45)
);

CREATE TABLE ConfiguracaoComponente(
	fkMaquina INT,
    FOREIGN KEY (fKMaquina) REFERENCES Maquina(idMaquina),
    fkEmpresa CHAR(6),
    FOREIGN KEY (fkEmpresa) REFERENCES Maquina(fkEmpresa),
    fkComponente INT,
    FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente),
    capacidade DECIMAL,
    quantidade INT
);

CREATE TABLE Metrica(
	idMetrica INT PRIMARY KEY AUTO_INCREMENT,
    memoriaEmUso DECIMAL,
    memoriaDisponivel DECIMAL,
    memoriaTotal DECIMAL,
    usooCPU DECIMAL,
    usoMemoria DECIMAL,
    bytesUsados DECIMAL,
    memoriaVirtualUsada DECIMAL,
    tamanhoDisco DECIMAL,
    leituraDisco DECIMAL,
    escritaDisco DECIMAL,
    fkMaquina INT,
    FOREIGN KEY (fkMaquina) REFERENCES ConfiguracaoComponente(fkMaquina),
    fkEmpresa CHAR(6),
    FOREIGN KEY (fkEmpresa) REFERENCES ConfiguracaoComponente(fkEmpresa),
    fkComponente INT,
    FOREIGN KEY (fkComponente) REFERENCES ConfiguracaoComponente(fkComponente)
);

CREATE TABLE Alerta(
	idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    destinario VARCHAR(45),
    dataHora DATETIME,
    fkMetrica INT,
    FOREIGN KEY(fkMetrica) REFERENCES Metrica(idMetrica),
    fkMaquina INT,
    FOREIGN KEY(fkMaquina) REFERENCES Metrica(fkMaquina),
    fkEmpresa CHAR(6),
    FOREIGN KEY (fkEmpresa) REFERENCES Metrica(fkEmpresa),
    fkComponente INT,
    FOREIGN KEY (fkComponente) REFERENCES Metrica(fkComponente)
);

INSERT INTO Empresa VALUES
	(111111, 'NexusCenter', 12345678901234, 'nexus@nexus.com', 1234567890123);
    
SELECT * FROM Empresa;
    
INSERT INTO Usuario VALUES
	(1, 'Ryu', 'ryu@gmail.com', 1234, 111111);
    
SELECT * FROM Usuario;
    
INSERT INTO Maquina VALUES
	(1, 'Ryu', '13245', 1234, 111111);
    
SELECT * FROM Maquina;
    
INSERT INTO RegistroAtividade VALUES
	(1, 1, 'Windows', 'Samsung', null, '2023-04-16 9:53:12', '4h');
    
SELECT * FROM RegistroAtividade;
    
INSERT INTO MetricaMouse VALUES
	(1, 53, 206, 30, '2023-04-16 9:58:42', 1, 111111);
    
SELECT * FROM MetricaMouse;

INSERT INTO Componente VALUES
	(1, 'Memoria RAM', 'ASUS');
    
SELECT * FROM Componente;

INSERT INTO ConfiguracaoComponente VALUES
	(1, 111111, 1, FORMAT(5, 1), 1);
    
SELECT * FROM ConfiguracaoCOmponente;

INSERT INTO Metrica (idMetrica, fkMaquina, fkEmpresa, fkComponente) VALUES
	(1, 1, 111111, 1);
    
SELECT * FROM Metrica;

INSERT INTO Alerta VALUES
	(1, 'Ryu', '2023-04-16 10:07:23', 1, 1, 111111, 1);
    
SELECT * FROM Alerta;
    
SELECT * FROM Empresa 
	JOIN Usuario AS usuario ON usuario.fkEmpresa = idEmpresa
    JOIN Maquina AS maquina ON maquina.fkEmpresa = idEmpresa;
    
SELECT * FROM ConfiguracaoComponente AS cc
	JOIN Componente ON cc.fkComponente = idComponente
    JOIN Metrica ON cc.fkMaquina = metrica.fkMaquina;
    
SELECT * FROM MetricaMouse
	JOIN Maquina ON fkMaquina = idMaquina;