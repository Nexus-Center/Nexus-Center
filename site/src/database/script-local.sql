CREATE DATABASE NexusCenter;

USE NexusCenter;

CREATE TABLE Empresa(
	idEmpresa CHAR(6) PRIMARY KEY,
	razaoSocial VARCHAR(120),
	CNPJ CHAR(14),
	email VARCHAR(45),
	tel CHAR(14)
);

insert into empresa values (232131, "sa",12213232121131, '21', 22123123232);


CREATE TABLE Usuario (
idUser int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
fkEmpresa char(6),
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

insert into usuario values (1, "1",'1', 1, 232131);

CREATE TABLE Maquina(
	idMaquina INT PRIMARY KEY AUTO_INCREMENT,
	nomeDoUsuario VARCHAR(45),
	patrimonio VARCHAR(45),
	senha VARCHAR(45),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

insert into maquina values (1, "1",1, '1', 232131);

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
    inicializado datetime,
	tempoDeAtividade VARCHAR(45)
);
  
  CREATE TABLE MetricaMouse(
	idMetricaMouse int primary key auto_increment,
	cordenadaX INT,
	cordenadaY INT,
	acaoClick INT,
	dataHora datetime,
	statusMouse VARCHAR(45),
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);


-- Metrica Mouse KPI Teste
insert into MetricaMouse values (null,60,20,1,'2023-08-15:00:00:00','Ausente',1,232131);
insert into MetricaMouse values (null,60,20,1,'2023-08-15:00:00:00','Ativo',1,232131);
insert into MetricaMouse values (null,60,20,1,'2023-08-15:00:00:00','Inativo',1,232131);



CREATE TABLE Componente(
idComponente int primary key auto_increment,
tipoComponente varchar(45),
modelo varchar(45)
);


CREATE TABLE ConfiguracaoComponente(
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    fkComponente int,
	FOREIGN KEY (fkComponente) REFERENCES Componente (idComponente),
	capacidade Decimal,
    unidadeMedida varchar(45)
);

CREATE TABLE Metrica(
	idMetrica INT  primary key auto_increment,
	valorUtilizado Decimal,
    unidadaMedida varchar(45),
    dataHora datetime,
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    fkComponente int,
	FOREIGN KEY (fkComponente) REFERENCES Componente (idComponente),
    fkMetrica int,
FOREIGN KEY (fkMetrica) REFERENCES Metrica (idMetrica)
);

CREATE TABLE ParametroAlerta(
idParametroAlerta int  primary key auto_increment,
parametroAlerta Decimal,
unidadeMedida varchar(45)
); 

CREATE TABLE AlertaDashboard(
idAlerta int primary key auto_increment,
dataHora datetime,
statusAlerta varchar(45),
fkParametroAlerta int,
FOREIGN KEY (fkParametroAlerta) REFERENCES ParametroAlerta (idParametroAlerta)
);


-- Select
select*from empresa;
select*from usuario;
select*from maquina;
select*from componente;
select*from metrica;
select*From ParametroAlerta;
select*From AlertaDashboard;


-- Insert
insert into componente values (1, 'CPU', 'Asus');
insert into ConfiguracaoComponente values (1,232131,1, 100, 'hz');
insert into metrica values (1, 50, 'hz', '2023-08-15:00:00:00', 1, 232131, 1);
insert into ParametroAlerta values (null,70,"hz",1);
insert into AlertaDashboard values (null, '2023-08-15:00:00:00',"Alerta",1);
insert into AlertaDashboard values (null, '2023-08-15:00:00:00',"Ideal",1);
insert into AlertaDashboard values (null, '2023-08-15:00:00:00',"Atencao",1);


select statusAlerta as 'Alerta', count(*) as Quantidade, m.fkEmpresa from AlertaDashboard as q join metrica as m on q.fkParametroAlerta = m.idMetrica group by statusAlerta;

select count(*) as quantidade from AlertaDashboard 
        where dataHora > now() - interval 24 hour group by statusAlerta ;

select count(*) as quantidade from AlertaDashboard as q join metrica as m on q.fkParametroAlerta = m.idMetrica
        where q.dataHora > now() - interval 24 hour and m.fkEmpresa = 232131 group by q.statusAlerta ;
