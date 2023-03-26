create database nexus;
use nexus;
create table empresa(
idEmpresa int primary key not null,
cnpj int not null,
razaoSocial varchar(120),
emailCorporativo varchar(45),
telCorp int
);
create table usuario (
idUser int primary key auto_increment,
nome varchar(45),
senha varchar(45),
email varchar(45),
fkcodigoDeEmpresa int,
foreign key (fkcodigoDeEmpresa) references empresa(idEmpresa)
);
