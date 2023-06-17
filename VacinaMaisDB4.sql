
create database if not exists  db_vacinamais;
use db_vacinamais;

create table if not exists paciente(
id_paciente smallint auto_increment,
nome_paciente varchar (255) not null,
email_paciente varchar (255) not null unique,
senha_paciente varchar (255) not null,
nascimento_paciente varchar (255) not null,
tel_paciente varchar (255) not null,
cpf_paciente char (11) not null unique key,
sexo_paciente varchar (1) not null,
endereco_paciente varchar (255)not null,
numero_casa_paciente int (255)not null,
bairro_paciente varchar (255) not null,
cep_paciente char (8) not null,
cidade_paciente varchar (255) not null,
uf_paciente varchar (2) not null,
cns_paciente char (255) not null,
primary key (id_paciente)
);

create table if not exists vacinador(
id_vacinador smallint not null auto_increment,
nome_vacinador varchar (255),
email_vacinador varchar (255),
senha_vacinador varchar (255),
nascimento_vacinador varchar (255),
tel_vacinador bigint (255),
cpf_vacinador char (11) not null unique key,
sexo_vacinador varchar (1),
endereco_vacinador varchar (255),
numero_casa_vacinador bigint (50),
bairro_vacinador varchar (255),
cep_vacinador int (8),
cidade_vacinador varchar (255),
uf_vacinador varchar (2),
cns_vacinador varchar (255),
cbo_vacinador bigint (255),
primary key (id_vacinador)
);

create table if not exists lote_fabricante (
id_fabricante smallint auto_increment primary key,
natureza_juridica varchar (255),
nome_fabricante varchar (255) not null unique key,
endereco_fabricante varchar (255),
numero_fabricante int (255),
bairro_fabricante varchar (255),
uf_fabricante varchar (255),
cep_fabricante varchar (255),
cidade_fabricante varchar (255),
cnes_fabricante varchar (255),
cnpj_fabricante varchar (255)
);

create table if not exists estabelecimento(
id_estabelecimento smallint auto_increment ,
cnes_estabelecimento varchar(255),
cnpj_estabelecimento varchar(255),
tipo_estabelecimento varchar (255),
nome_fantasia_estabelecimento varchar (255) not null unique key,
natureza_juridica_estabelecimento varchar (255),
endereco_estabelecimento varchar(255),
numero_estabelecimento varchar (255),
bairro_estabelecimento varchar(255),
cep_estabelecimento varchar (255),
cidade_estabelecimento varchar (255),
uf_estabelecimento varchar (255),
primary key(id_estabelecimento)
);

create table if not exists vacina (
id_vacina smallint not null auto_increment,
nome_vacina varchar(255) not null unique key,
descricao_vacina varchar (255),
estrategia_vacina varchar (255),
estoque_vacina varchar(255),
nome_lote_vacina varchar(255) not null,
data_validade_vacina varchar (255),
primary key (id_vacina)
);


create table if not exists agendamento (
id_agendamento smallint auto_increment primary key,
cpf_paciente char (11) not null,
nome_vacina varchar(255),
dose int (1) not null,
nome_fantasia_estabelecimento varchar(255),
data_agendamento varchar(255) not null,
constraint fk_cpf_paciente1 foreign key (cpf_paciente) references paciente (cpf_paciente),
constraint fk_tipo_vacina1 foreign key (nome_vacina) references vacina (nome_vacina),
constraint fk_posto_nome1 foreign key (nome_fantasia_estabelecimento) references estabelecimento (nome_fantasia_estabelecimento)
);

create table CodigoSenha (
id_cod int not null primary key auto_increment,
cod_senha varchar(25) not null
);

-- comandos
INSERT INTO paciente (nome_paciente,email_paciente,senha_paciente,nascimento_paciente,tel_paciente,
cpf_paciente,sexo_paciente,endereco_paciente,numero_casa_paciente,bairro_paciente,cep_paciente,cidade_paciente,uf_paciente,cns_paciente)
 VALUES ('Lucas Rodrigues Amorim','lucas3amorim@gmail.com','lucas123','08/12/1999','997985858',
18121256747,'M','Rua Bolivia','4','J.A','29170550','Cariacica','ES','191568478');

insert into vacina (nome_vacina,descricao_vacina,estrategia_vacina,estoque_vacina,nome_lote_vacina,data_validade_vacina)
values ('Covid-19','contra o virus covid','acima de 12 anos','50','butamtam','pra sempre');
 insert into vacina (nome_vacina,descricao_vacina,estrategia_vacina,estoque_vacina,nome_lote_vacina,data_validade_vacina)
values ('LALALALALA','contra o virus covid','acima de 12 anos','50','butamtam','pra sempre');
 insert into vacina (nome_vacina,descricao_vacina,estrategia_vacina,estoque_vacina,nome_lote_vacina,data_validade_vacina)
values ('Gripe','contra o virus covid','acima de 12 anos','50','butamtam','pra sempre');
 insert into vacina (nome_vacina,descricao_vacina,estrategia_vacina,estoque_vacina,nome_lote_vacina,data_validade_vacina)
values ('Carambaaaa','contra o virus covid','acima de 12 anos','50','butamtam','pra sempre');
 
drop table vacinador;
drop table paciente;
drop table estabelecimento;
drop table vacina;
drop table agendamento;
drop table lote_fabricante;
select nome_paciente from paciente where email_paciente = 'lucas3amorim@gmail.com';
select * from vacinador;
select * from paciente;
update vacinador set id_vacinador = 2 where id = 1;
select * from estabelecimento;
select * from vacina;
select * from agendamento;
alter table vacina modify nome_lote_vacina varchar (255) not null;
alter table lote_fabricante modify nome_fabricante varchar (255) not null unique key;
alter table vacina add constraint fk_lote foreign key (nome_lote_vacina) references lote_fabricante (nome_fabricante);
alter table vacinador modify email_vacinador varchar (255) not null unique key;
select email_paciente from paciente; 
select*from CodigoSenha;
delete from CodigoSenha where id_cod = 1;

SELECT v.email_vacinador AS email, p.email_paciente AS email
FROM vacinador AS v
left JOIN paciente AS p ON v.email_vacinador = p.email_paciente
WHERE v.email_vacinador = 'lucas3amorim@gmail.com' or p.email_paciente = 'lucas3amorim@gmail.com'
union
SELECT v.email_vacinador AS email, p.email_paciente AS email
FROM vacinador AS v
right JOIN paciente AS p ON v.email_vacinador = p.email_paciente
WHERE v.email_vacinador = 'lucas3amorim@gmail.com' or p.email_paciente = 'lucas3amorim@gmail.com';





