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
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
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
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE MetricaDisco(
idMetricaDisco INT PRIMARY KEY,
fkComponente INT,
FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente),
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES Componente(idComponente),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
tamanho DECIMAL,
leitura DECIMAL,
escrita DECIMAL,
tempoTransferencia DECIMAL,
metricaDisco VARCHAR(45)
);

CREATE TABLE MetricaCPU(
idMetricaCPU INT PRIMARY KEY,
fkComponente INT,
FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente),
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES Componente(idComponente),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
usoCPU DECIMAL,
usoMemoria DECIMAL,
bytesUsados DECIMAL,
memoriaVirtualUtilizada DECIMAL,
metricaCPU VARCHAR(45)
);

CREATE TABLE MetricaMemoria(
idMetricaMemoria INT PRIMARY KEY,
fkComponente INT,
FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente),
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES Componente(idComponente),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
emUso DECIMAL,
disponivel DECIMAL,
total DECIMAL
);

CREATE TABLE MetricaUSB(
ifMetricaUSB INT PRIMARY KEY,
dispositivoConectado VARCHAR(45),
totalDispositivosConectados VARCHAR(45),
fkPeriferico INT,
fkComponente INT,
FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente),
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
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
	(1, 23, 75, null, 1, 111111);
    
SELECT * FROM MetricaMouse;
    
INSERT INTO Componente VALUES
	(1, 'Componente', 'componente', 'AZUS', 1, 111111);
    
SELECT * FROM Componente;
    
INSERT INTO MetricaDisco VALUES
	(1, 1, 1, 111111, 8.0, 3.2, 2.2, 5.4, 'bytes');
    
SELECT * FROM MetricaDisco;
    
INSERT INTO MetricaCPU VALUES
	(1, 1, 1, 111111, 8.123, 2.456, 3.789, 4.123, 'bytes');
    
SELECT * FROM MetricaCPU;
    
INSERT INTO MetricaMemoria VALUES
	(1, 1, 1, 111111, 1111.2, 222222.4, 333333.2);
    
SELECT * FROM MetricaMemoria;
    
INSERT INTO MetricaUSB VALUES
	(1, 'Teclado', '2', null, 1, 1, 111111);
    
SELECT * FROM MetricaUSB;
    
SELECT * FROM Empresa 
	JOIN Usuario AS usuario ON usuario.fkEmpresa = idEmpresa
    JOIN Maquina AS maquina ON maquina.fkEmpresa = idEmpresa;