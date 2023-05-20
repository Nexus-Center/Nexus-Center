
CREATE TABLE Empresa(
	idEmpresa CHAR(6) IDENTITY(1,1) PRIMARY KEY,
	razaoSocial VARCHAR(120),
	CNPJ CHAR(14),
	email VARCHAR(45),
	tel CHAR(14)
);


CREATE TABLE Usuario (
idUser INT IDENTITY(1,1) PRIMARY KEY,
nome varchar(45),
email varchar(45),
senha varchar(45),
fkEmpresa char(6),
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE Maquina(
	idMaquina INT IDENTITY(1,1) PRIMARY KEY,
	nomeDoUsuario VARCHAR(45),
	patrimonio VARCHAR(45),
	senha VARCHAR(45),
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);


CREATE TABLE RegistroAtividade(
	idRegistroUsuario INT IDENTITY(1,1) PRIMARY KEY,
	fkEmpresa CHAR(6),
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
	inicializado DATETIME,
	tempoDeAtividade VARCHAR(45)
);

CREATE TABLE InfoMaquina(
	idInfoMaquina INT IDENTITY(1,1) PRIMARY KEY,
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

 CREATE TABLE MetricaMouse(
	idMetricaMouse INT IDENTITY(1,1) PRIMARY KEY,
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

CREATE TABLE Componente(
idComponente INT IDENTITY(1,1) PRIMARY KEY,
tipoComponente INT,
modelo INT
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
	idMetrica INT IDENTITY(1,1) PRIMARY KEY,
	valorUtilizado Decimal,
    unidadeMedida varchar(45),
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
idParametroAlerta INT IDENTITY(1,1) PRIMARY KEY,
parametroAlerta Decimal,
unidadeMedida varchar(45)
); 


CREATE TABLE AlertaDashboard(
idAlerta INT IDENTITY(1,1) PRIMARY KEY,
dataHora datetime,
statusAlerta varchar(45),
fkParametroAlerta int,
FOREIGN KEY (fkParametroAlerta) REFERENCES ParametroAlerta (idParametroAlerta)
);