create database nexus;
use nexus;
drop table usuario;
drop table empresa;
create table empresa(
idEmpresa varchar(6) primary key not null,
cnpj varchar(14) not null,
razaoSocial varchar(120),
emailCorporativo varchar(45),
senha varchar(45),
telCorp char(11)
);
create table usuario (
idUser int primary key auto_increment,
nome varchar(45),
senha varchar(45),
email varchar(45),
fkcodigoDeEmpresa varchar(6),
foreign key (fkcodigoDeEmpresa) references empresa(idEmpresa)
);
-- Usuários testados
insert into empresa (idEmpresa,cnpj,razaoSocial,emailCorporativo,senha,telCorp)
values("200167","23322337843","Vitamina","vitamina@vitamina","senha123","11983743674");
insert into usuario (nome,senha,email,fkcodigoDeEmpresa) values ("ceará","12345","ceara@ceara","200167");

select * from usuario;
