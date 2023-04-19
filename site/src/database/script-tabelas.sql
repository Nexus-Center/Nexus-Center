CREATE DATABASE nexusCenter;
USE nexusCenter;

CREATE TABLE empresa(
idEmpresa char(6) primary key,
razaoSocial varchar(120),
cnpj char(14) not null,
email varchar(45),
telefone char(14)
);

SELECT * FROM empresa;


CREATE TABLE usuario (
idUser int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
fkEmpresa char(6),
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

SELECT * FROM usuario;


CREATE TABLE maquina (
idMaquina int primary key auto_increment,
nomeUsuario varchar(45),
patrimonio varchar(20),
senha varchar(30),
fkEmpresa CHAR(6),
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

SELECT * FROM maquina;