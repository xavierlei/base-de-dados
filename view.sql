
USE Habitat;

-- **** View vw_doadores **** --

insert into Doadores(nome,NIF,rua,Localidade,codPostal,contacto,dataAssociacao,actividade,email,site) 
	values("filipe","123412345","rua das ruas","famalicao","4444-444","912221122","2014-10-12","particular","ffffd@gmail.com",NULL); 

insert into Doacoes(descricao,data,tipo,valor,doador)
	values("dinheiro","2014-11-12","Monetário",100,7);
insert into Doacoes(descricao,data,tipo,valor,doador)
	values("dinheiro","2014-11-13","Monetário",120,7);
insert into Doacoes(descricao,data,tipo,valor,doador)
	values("dinheiro","2014-11-15","Monetário",150,7);
insert into Doacoes(descricao,data,tipo,valor,doador)
	values("dinheiro","2014-11-16","Monetário",150,7);
    

select * from Doadores;
select * from Doacoes;

--
drop view if exists vw_doadores;

create view vw_doadores as
	select d.id "ID" ,d.nome "Nome", d.dataAssociacao "Data de Associação", d.contacto "Contacto",
		   d.email "Email",d.voluntario "Nº de Voluntario",count(doa.id) "Total Doações",MAX(doa.data) "Ultima Doação" 
		from Doadores as d inner join Doacoes as doa
			on d.id=doa.doador
			-- where d.voluntario in (select d.voluntario = case when d.voluntario is null then "-" else d.voluntario end from Doadores)
		group by d.id;
	
select * from vw_doadores where id=7;


-- **** View vw_voluntarios **** --

select * from Voluntarios;
select * from Projectos;
select * from Tarefas;
select * from ProjectoTarefaVoluntario;

insert into ProjectoTarefaVoluntario(duracaoHoras,dataRealizacao,voluntarios,tarefas,projecto)
	values(12,"2014-12-26",1,1,1);
insert into ProjectoTarefaVoluntario(duracaoHoras,dataRealizacao,voluntarios,tarefas,projecto)
	values(20,"2014-12-25",1,2,1);
insert into ProjectoTarefaVoluntario(duracaoHoras,dataRealizacao,voluntarios,tarefas,projecto)
	values(40,"2014-12-24",1,3,2);


 --
drop view if exists vw_voluntarios;

create view vw_voluntarios as
	select v.id "ID", v.nome "Nome", v.dataAssociacao "Data de Associação", v.contacto "Contacto", v.tipo "Tipo",
		   v.dataNascimento "Data de Nascimento", v.nomeEquipa "Nome da Equipa atual",
				sum(ptv.duracaoHoras) "Total Horas de Trabalho",
                count(distinct ptv.projecto) "Total de Projetos que participou", 
                count(ptv.tarefas) "Total de Tarefas Realizadas" 
		
        from Voluntarios as v inner join ProjectoTarefaVoluntario as ptv 
			on v.id = ptv.voluntarios;
        
select * from vw_voluntarios where id=1;



-- **** View vw_candidatura  (1)**** --

select * from Candidaturas;
select * from Projectos;

-- 
drop view if exists vw_candidatura;

create view vw_candidatura as
	select c.id "ID", c.funcionario "Funcionario Responsavel", e.nome "Responsavel da Familia", 
		   c.dataAbertura "Data de Abertura", c.dataDecisao "Data de Decisão", c.estado "Estado candidatura", 
		   p.dataInicio "Data de Inicio", p.dataFim "Data de Fim", p.estado "Estado Projeto", p.orcamento "Orçamento"
		
        from Candidaturas as c inner join Familias as f
			on c.familia = f.id
            inner join Projectos as p
				on c.id = p.candidatura
		join Elementos as e 
			on e.id = f.responsavel;
        
select * from vw_candidatura where id=1;




-- **** View vw_candidatura  (2)**** --


select * from Candidaturas;
select * from Projectos;
select * from Tarefas;
select * from ProjectoTarefas;
select * from Eventos;
select * from Doacoes;
select * from Funcionarios;
select * from ProjectoTarefaVoluntario;

insert into Eventos(data,nrParticipantes,observacoes,funcionario,projecto,valorAngariado)
	values("2014-12-10",3,"porreiro","xavier",1,10);
insert into Eventos(data,nrParticipantes,observacoes,funcionario,projecto,valorAngariado)
	values("2014-12-11",3,"porreiro","xavier",1,20);


insert into Doacoes(descricao,data,tipo,valor,doador,projecto)
	values ("Dinheiro","2014.12.12","Monetário",100,1,1);
insert into Doacoes(descricao,data,tipo,quantidade,unidade,doador,projecto)
	values ("cerveja","2014.12.13","Material",50,"unidade",1,1);


insert into ProjectoTarefas(projecto,tarefas)
	values (1,1);
insert into ProjectoTarefas(projecto,tarefas)
	values (1,2);
insert into ProjectoTarefas(projecto,tarefas)
	values (1,3);



-- 
drop view if exists vw_ProjetoTarefasEventosDoacaoes;

create view vw_ProjetoTarefasEventosDoacaoes as
	select p.id "ID",count(distinct pt.tarefas) "Total de Tarefas Realizadas",
					 count(distinct e.id) "Total de Eventos Realizadas",
					 count(distinct d.id) "Total de Doações Realizadas",
					 sum(distinct e.valorAngariado) + sum(distinct d.valor) "Total Angariado"
		
        from Projectos as p inner join ProjectoTarefas as pt
			on p.id = pt.projecto
            inner join Eventos as e
				on p.id = e.projecto
                inner join Doacoes as d
					on p.id = d.projecto;
		
        
select * from vw_ProjetoTarefasEventosDoacaoes where id=1;