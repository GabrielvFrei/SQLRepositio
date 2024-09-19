create database escola;
use escola;
create table cursos(
	id int primary key auto_increment,
	nome varchar(50),
    duracao int
);

create table alunos(
	id int primary key auto_increment,
    nome varchar(40),
    idade int,
    curso_id int,
    foreign key(curso_id) references cursos(id)
);

insert into cursos(nome, duracao) values(
	'Engenharia de Software', 6
);
insert into cursos(nome, duracao) values(
	'Sistemas da Informação', 6
);
insert into cursos(nome, duracao) values(
	'Análise e Desenvolvimento de Sistemas', 4
);
insert into cursos(nome, duracao) values(
	'Ciencia da Computação', 7
);
insert into cursos(nome, duracao) values(
	'T.I', 4
);
insert into cursos(nome, duracao) values(
	'Game Design', 4
);

insert into alunos(nome, idade, curso_id) values(
	'João Silva', 20, 1
);
insert into alunos(nome, idade, curso_id) values(
	'Maria Souza', 22, 2
);
insert into alunos(nome, idade, curso_id) values(
	'Paulo Santos', 19, 3
);
insert into alunos(nome, idade, curso_id) values(
	'Enzo Ribeiro', 27, 4
);
insert into alunos(nome, idade, curso_id) values(
	'Nicolas Mourão', 65, 5
);
insert into alunos(nome, idade, curso_id) values(
	'Kaue Almeida', 19, 6
);

update cursos set nome = 'Análise e Desenvolvimento de Softwares' where id = '3';

CREATE VIEW vw_nomes_cursos AS 
SELECT 
	alunos.nome as aluno_nome,
    cursos.nome as curso_nome
FROM
	alunos
join
	cursos
on
	alunos.curso_id = cursos.id;
    
select * from vw_nomes_cursos;

select nome from alunos where curso_id = 1;

CREATE VIEW vw_duracao_cursos AS 
SELECT 
	c.nome as curso_nome,
    c.duracao as duracao_curso,
    a.nome as aluno_nome
FROM
	cursos c
join
	alunos a
on
	c.id = a.curso_id;
select * from vw_duracao_cursos;

CREATE VIEW vw_media_soma_cont AS
select
	c.nome as alunos_nome,
	count(a.id) as alunos_numero,
    avg(a.idade) as alunos_media,
    sum(a.idade) as idade_soma
from 
	cursos c
left join
	alunos a
on 
	c.id = a.curso_id
group by
	c.nome;
select * from vw_media_soma_cont;