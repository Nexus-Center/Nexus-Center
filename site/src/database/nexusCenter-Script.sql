-- drop database NexusCenter;
CREATE DATABASE NexusCenter;
USE NexusCenter;

CREATE TABLE Empresa(
	idEmpresa CHAR(6) PRIMARY KEY,
	razaoSocial VARCHAR(120),
	CNPJ CHAR(14),
	email VARCHAR(45),
	tel CHAR(14)
);

CREATE TABLE Usuario (
idUser int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
fkEmpresa char(6),
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

CREATE TABLE Usb(
idUsb int primary key auto_increment,
nome varchar(100),
fornecedor varchar(100),
dataHora varchar(45),
fkMaquina INT,
FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE InfoMaquina(
	idInfoMaquina INT PRIMARY KEY AUTO_INCREMENT,
	sistemaOperacional varchar(200),
	fabricante  varchar(200),
	Arquitetura int,
	nomeProcessador varchar(200),
	capacidadeRam varchar(200),
	capacidadeDisco varchar(200),
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

 Create TABLE RegistroAtividade(
	idRegistroUsuario int primary key auto_increment,
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Maquina(fkEmpresa),
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
    inicializado  VARCHAR(45)
);
  
  CREATE TABLE MetricaMouse(
	idMetricaMouse int primary key auto_increment,
	cordenadaX INT,
	cordenadaY INT,
	dataHora varchar(45),
	statusMouse VARCHAR(45),
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina)
);



CREATE TABLE Componente(
idComponente int primary key auto_increment,
tipoComponente varchar(45)
);

CREATE TABLE ConfiguracaoComponente(
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    fkComponente int,
	FOREIGN KEY (fkComponente) REFERENCES Componente (idComponente),
	capacidade INT,
    unidadeMedida varchar(45)
);

CREATE TABLE Metrica (
    idMetrica INT PRIMARY KEY AUTO_INCREMENT,
    valorUtilizado int,
    unidadeMedida VARCHAR(45),
    dataHora varchar(45),
    fkMaquina INT,
    FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
    fkEmpresa CHAR(6),
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    fkComponente INT,
    FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente)
);

CREATE TABLE ParametroAlerta(
idParametroAlerta int  primary key auto_increment,
fkComponente int,
Ideal int,
Atencao int,
Alerta int,
FOREIGN KEY (fkComponente) REFERENCES Componente (idComponente)
); 

CREATE TABLE AlertaDashboard(
idAlerta int primary key auto_increment,
dataHora datetime,
statusAlerta varchar(45),
fkParametroAlerta int,
FOREIGN KEY (fkParametroAlerta) REFERENCES ParametroAlerta (idParametroAlerta),
fkComponente int,
FOREIGN KEY (fkComponente) REFERENCES Componente (idComponente),
fkMetrica int,
FOREIGN KEY (fkMetrica) REFERENCES Metrica (idMetrica)
);
insert into Componente values(null,"Disco");
insert into Componente values(null,"Processador");
insert into Componente values(null,"Memoria");

INSERT INTO Empresa value
	(111111, 'Nexus Center', 11111111111111, 'ryu@gmail.com', 1234);
    
INSERT INTO Usuario value
	(null, 'Ryu', 'ryu@gmail.com', 1234, 111111);
    
INSERT INTO Maquina value
	(null, 'Ryu', '123', '1234', 111111),
    (null, 'Thamires', '123', '1234', 111111),
    (null, 'Vinicius', '123', '1234', 111111),
    (null, 'Vitor Xavier', '123', '1234', 111111),
    (null, 'Vitória', '123', '1234', 111111),
    (null, 'Rafael Aldo', '123', '1234', 111111);
    
INSERT INTO MetricaMouse(statusMouse, fkMaquina) value
	('Inativo', 3),
    ('Ausente', 1),
    ('Ausente', 6),
    ('Ativo', 4),
    ('Ativo', 2),
    ('Ativo', 5);
    
SELECT idMetricaMouse ,nomeDoUsuario as nomeUsuario, statusMouse FROM MetricaMouse 
            JOIN Maquina ON idMaquina = fkMaquina WHERE fkEmpresa = 111111 AND idMaquina = 6 ORDER BY idMetricaMouse DESC LIMIT 720;
SELECT COUNT(idMaquina) AS numeroMaquinas FROM Maquina WHERE fkEmpresa = 111111;
    
/*
DELIMITER //
CREATE PROCEDURE deletarMaquina(IN p_idMaquina INT)
BEGIN
    DELETE FROM infomaquina WHERE fkMaquina = p_idMaquina;
    DELETE FROM maquina WHERE idMaquina = p_idMaquina;
END //
DELIMITER //

select*From Empresa;
select*From Maquina;
select*From Usb;
select*From RegistroAtividade;
select*From InfoMaquina;
select*From MetricaMouse;
select*From ConfiguracaoComponente;
select*From Componente;
select*From ParametroAlerta;
select*From alertaDashboard;
select*From Metrica;
select*From RegistroAtividade;
select*From MetricaMouse;
show tables;
*/

