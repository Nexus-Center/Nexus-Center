CREATE DATABASE nexusCenter;
USE nexusCenter;

CREATE TABLE empresa(
idEmpresa varchar(6) primary key,
nome varchar(120),
cnpj char(14) not null,
email varchar(45),
tel char(14)
);

SELECT * FROM empresa;


CREATE TABLE usuario (
idUser int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
codigo varchar(6),
FOREIGN KEY (codigo) REFERENCES empresa(idEmpresa)
);

SELECT * FROM usuario;

