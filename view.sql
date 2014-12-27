
USE Habitat;


insert into Doadores(nome,NIF,rua,Localidade,codPostal,contacto,dataAssociacao,actividade,email,site) 
	values("filipe","123412345","rua das ruas","famalicao","4444-444","912221122","2014-10-12","particular","ffffd@gmail.com",NULL); 

insert into Doacoes(descricao,data,tipo,valor,doador)
	values("dinheiro","2014-11-12","Monetário",100,6);
insert into Doacoes(descricao,data,tipo,valor,doador)
	values("dinheiro","2014-11-13","Monetário",120,6);
insert into Doacoes(descricao,data,tipo,valor,doador)
	values("dinheiro","2014-11-15","Monetário",150,1);
insert into Doacoes(descricao,data,tipo,valor,doador)
	values("dinheiro","2014-11-16","Monetário",170,1);


select * from Doadores;
select * from Doacoes;

drop view if exists vw_doadores;

create view vw_doadores as
	select d.id,d.nome, d.dataAssociacao, d.contacto,d.email,count(doa.id) "Total Doações",doa.data "Ultima Doação" 
		from Doadores as d inner join Doacoes as doa
			on d.id=doa.doador
			-- where doa.data in (select doa.data from Doacoes order by data desc limit 1)
        group by d.id
        order by doa.data desc; 
	
select * from vw_doadores where id=1;


-- view vw_voluntarios ---------

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

drop view if exists vw_voluntarios;

create view vw_voluntarios as
	select v.id, v.nome, v.dataAssociacao, v.contacto, v.tipo,v.dataNascimento, v.nomeEquipa,
				sum(ptv.duracaoHoras) "Total horas de Trabalho",
                count(distinct ptv.projecto) "Total de projetos que participou", 
                count(ptv.tarefas) "Total de tarefas Realizadas" 
		
        from Voluntarios as v inner join ProjectoTarefaVoluntario as ptv 
			on v.id = ptv.voluntarios;
        
select * from vw_voluntarios where id=1;



-- vista candidaturas ----------

select * from Candidaturas;
select * from Projectos;

drop view if exists vw_candidatura;

create view vw_candidatura as
	select c.id, c.funcionario, e.nome "Responsavel", c.dataAbertura, c.dataDecisao, c.estado "Estado candidatura", 
		   p.dataInicio, p.dataFim, p.estado "Estado Projeto", p.orcamento 
		
        from Candidaturas as c inner join Familias as f
			on c.familia = f.id
            inner join Projectos as p
				on c.id = p.candidatura
		join Elementos as e 
			on e.id = f.responsavel;
        
select * from vw_candidatura where id=1;


drop view if exists vw_ProjetoTarefasEventosDoacaoes;

create view vw_ProjetoTarefasEventosDoacaoes as
	select p.id,count(pt.tarefas) "Total de tarefas Realizadas",
				count(e.id) "Total de Eventos Realizadas",
                count(d.id) "Total de Doações Realizadas",
                sum(e.valorAngariado) "Total Angariado"
		
        from Projectos as p inner join ProjectoTarefas as pt
			on p.id = pt.projecto
            inner join Eventos as e
				on p.id = e.projecto
                inner join Doacoes as d
					on p.id = d.projecto;
		
        
select * from vw_ProjetoTarefasEventosDoacaoes where id=1;