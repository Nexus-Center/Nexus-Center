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
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
qntClicks VARCHAR(45),
dataHora DATETIME
);

CREATE TABLE RegistroAtividade(
fkUsuario INT,
FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUser),
fkUsuarioEmpresa CHAR(6),
FOREIGN KEY (fkUsuarioEmpresa) REFERENCES Empresa(idEmpresa),
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
sistemaOperacional VARCHAR(45),
fabricante VARCHAR(45),
arquitetura VARCHAR(45),
inicializado DATETIME,
tempoDeAtividade VARCHAR(45),
permissoes VARCHAR(45)
);

CREATE TABLE Componente(
	idComponente INT PRIMARY KEY,
    tipoComponente VARCHAR(45),
    nome VARCHAR(45),
    modelo VARCHAR(45),
    fabricante VARCHAR(45),
    dispositivoConectadoUSB VARCHAR(45)
);

CREATE TABLE ConfiguracaoComponente(
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
fkComponente INT,
FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente),
quantidade VARCHAR(45),
tamanho VARCHAR(45)
);

CREATE TABLE Metrica(
idMetrica INT PRIMARY KEY,
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES ConfiguracaoComponente (fkComponente),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES ConfiguracaoComponente (fkEmpresa),
fkComponente INT,
FOREIGN KEY (fkComponente) REFERENCES ConfiguracaoComponente(fkComponente),
horario DATETIME,
memoriaEmUso DECIMAL,
memoriaDisponivel DECIMAL,
memoriaTotal DECIMAL,
usoCPU DECIMAL,
usoMemoria DECIMAL,
memoriaVirtualUsada DECIMAL,
tamahnoDisco DECIMAL,
leituraDisco DECIMAL,
escritaDisco DECIMAL,
tempoTransferencia DECIMAL,
totalDispositivoConectado INT
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
	(1, 111111, 1, 'Windows', 'Samsung', 'X', '2023-04-11 11:19:30','4h', 'nenhuma');
    
SELECT * FROM RegistroAtividade;
    
INSERT INTO MetricaMouse VALUES
	(1, 23, 75, 1, 111111, 5000, "2023-04-12 20:21:30");
    
SELECT * FROM MetricaMouse;
    
INSERT INTO Componente VALUES
	(1, "RAM", "ASUS", "MK2", "ASUS", null);
    
SELECT * FROM Componente;
    
INSERT INTO ConfiguracaoComponente VALUES
	(1, 111111, 1, "2", "8GB");
    
SELECT * FROM ConfiguracaoComponente;

INSERT INTO Metrica (idMetrica, fkMaquina, fkEmpresa, fkComponente) VALUES
	(1, 1, 111111, 1);
    
SELECT * FROM Metrica;
    
SELECT * FROM Empresa 
	JOIN Usuario AS usuario ON usuario.fkEmpresa = idEmpresa
    JOIN Maquina AS maquina ON maquina.fkEmpresa = idEmpresa;
    
SELECT * FROM ConfiguracaoComponente AS cc
	JOIN Componente ON cc.fkComponente = idComponente
    JOIN Metrica ON cc.fkMaquina = metrica.fkMaquina;
    
SELECT * FROM MetricaMouse
	JOIN Maquina ON fkMaquina = idMaquina;