insert into Funcionarios values ("xavier","mypassword","Xavier Carvalho Fernandes","1234566","Rua da Chamusca","Lama","4750-512");

insert into Familias (rendimento,rua,localidade,codPostal,contacto,funcionario)
	values(3000,"rua Sta Margarida","S.Vitor","4710-306","91000000000","xavier");

select * from Familias;

insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Joaquim António Tony","1979-10-13","6ºano","casado","pai","desempregado","Braga","português",1);
update familias set responsavel = 1
	where id = 1;
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Maria Rosa Tony","1982-10-13","7ºano","casado","mãe","desempregada","Braga","português",1);
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Mario José Tony","1995-08-03","12ºano","solteiro","filho","estudante","Braga","português",1);
    
select * from elementos;

insert into Candidaturas (dataAbertura,dataDecisao,observacoes,estado,funcionario,familia)
	values('2014-03-14','2014-10-12',"família muito carenciada","aprovado","xavier",1);
    
insert into Projectos (candidatura,dataInicio,dataFim,estado,descricao,orcamento,funcionario)
	values(1,'2015-02-01',null,"aprovado","construção de moradia de luxo",200000.00,"xavier");
 
select * from Familias
	where id = (select familia from Candidaturas
	where id = (select candidatura from Projectos where id = 1));