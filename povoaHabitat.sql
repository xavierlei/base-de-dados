insert into Funcionarios values ("pedro","1234","Pedro Silva","1234566","rua do Pedro","Famalicão","4755-231","admin");
insert into Funcionarios values ("xavier","mypassword","Xavier Carvalho Fernandes","1234566","Rua da Chamusca","Lama","4750-512","famílias");
insert into Funcionarios values ("mariojorge","hispassword","Mario Jorge Anónimo","1234566","Rua do Raio","Braga","4710-925","famílias");
insert into Funcionarios values ("Josefino","apassword","José Fino costa","90832323","Rua Conselheiro Januário","Braga","4700-373","famílias");
insert into Funcionarios values ("julianaJ","herpasswd","Juliana Julieta","934568714","Rua Já não Sei","Braga","4700-374","angariação");
insert into Funcionarios values ("ruiT","passwd","Rui Trolha","934568717","Rua Já não Sei","Braga","4700-374","obras");
-- familia
insert into Familias (rendimento,rua,localidade,codPostal,contacto,funcionario)
	values(3000,"rua Sta Margarida","S.Vitor","4710-306","91000000000","xavier");
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Joaquim António Tony","1979-10-13","6ºano","casado","pai","desempregado","Braga","português",1);
update familias set responsavel = 1
	where id = 1;
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Maria Rosa Tony","1982-10-13","7ºano","casado","mãe","desempregada","Braga","português",1);
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Mario José Tony","1995-08-03","12ºano","solteiro","filho","estudante","Braga","português",1);
insert into Candidaturas (dataAbertura,dataDecisao,observacoes,estado,funcionario,familia)
	values('2014-03-14','2014-10-12',"família muito carenciada","aprovado","xavier",1);
insert into Projectos (candidatura,dataInicio,dataFim,estado,descricao,orcamento,funcionario)
	values(1,'2015-02-01',null,"aprovado","construção de moradia de luxo",200000.00,"xavier");
 
-- familia
insert into Familias (rendimento,rua,localidade,codPostal,contacto,funcionario)
	values(7000,"Rua dos Barbosas","Braga","4715-267","968901234","Josefino");
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Pedro Pedrosa","1970-02-01","4ºano","casado","pai","pedreiro","Braga","português",2);
update familias set responsavel = 4
	where id = 2;
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Luísa Mulher","1973-08-10","4ºano","casado","mãe","costureira","Braga","português",2);
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Justina Pedrosa","1998-12-25","12ºano","solteira","filha","estudante","Braga","português",2);
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Joaquim Pedrosa","2002-03-25","7ºano","solteira","filho","estudante","Braga","português",2);
insert into Candidaturas (dataAbertura,dataDecisao,observacoes,estado,funcionario,familia)
	values('2007-05-19','2007-09-02',"familia sem dificuldades aparentes","reprovado","mariojorge",2);
insert into Candidaturas (dataAbertura,dataDecisao,observacoes,estado,funcionario,familia)
	values('2009-05-19','2009-11-18',"família com dívidas","aprovado","Josefino",2);
insert into Projectos (candidatura,dataInicio,dataFim,estado,descricao,orcamento,funcionario)
	values(3,'2010-05-08','2011-10-02',"concluído","construção de casa",100000.00,"xavier");
-- familia
insert into Familias (rendimento,rua,localidade,codPostal,contacto,funcionario)
	values(10000,"Rua Direita","Barcelos","9500-725","253843874","mariojorge");
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Rui Rato","1980-07-02","9ºano","casado","pai","camionista","Barcelos","português",3);
update familias set responsavel = 8
	where id = 3;
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Joana Rato","1982-07-02","10ºano","casado","mãe","telefonista","Barcelos","português",3);
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("Ana Rato","2010-07-02","infantario","solteiro","filha","estudante","Barcelos","português",3);
insert into Elementos (nome,dataNasc,escolaridade,estadoCivil,parentesco,ocupacao,naturalidade,nacionalidade,familia)
	values("André Rato","1912-07-02",null,"solteiro","filho",null,"Barcelos","português",3);
insert into Candidaturas (dataAbertura,dataDecisao,observacoes,estado,funcionario,familia)
	values('2014-11-19',null,"família com dívidas","pendente","xavier",3);

-- Voluntarios
insert into Voluntarios (nome, dataAssociacao,tipo,contacto,dataNascimento,profissao,rua,localidade,codPostal,nomeEquipa)
	values("Marco Marcos",'2002-12-21',"obras","MM@email.com",'1990-10-02',"estudante","rua ficticia","Barcelos","4750-500","equipa cenas");
insert into Voluntarios (nome, dataAssociacao,tipo,contacto,dataNascimento,profissao,rua,localidade,codPostal,nomeEquipa)
	values("Johny Bravo",'1990-09-21',"obras","JB@email.com",'1990-10-02',"professor","rua da imaginação","Barcelos","4750-123","equipa cenas");
insert into Voluntarios (nome, dataAssociacao,tipo,contacto,dataNascimento,profissao,rua,localidade,codPostal,nomeEquipa)
	values("João Homem",'2009-02-04',"familias","JH@email.com",'1980-10-02',"empresario","rua de cima","Braga","4750-200","equipa cenas");
insert into Voluntarios (nome, dataAssociacao,tipo,contacto,dataNascimento,profissao,rua,localidade,codPostal,nomeEquipa)
	values("Cookie Monster",'2010-12-21',"angariação","CM@email.com",'1969-10-02',"monstro","rua Sésamo","Lisboa","4000-500","equipa cenas");
insert into Voluntarios (nome, dataAssociacao,tipo,contacto,dataNascimento,profissao,rua,localidade,codPostal,nomeEquipa)
	values("Michael Knight",'2012-12-21',"obras","MK@email.com",'1945-10-02',"justiceiro","rua cenas","Porto","4300-500","equipa cenas");
insert into Voluntarios (nome, dataAssociacao,tipo,contacto,dataNascimento,profissao,rua,localidade,codPostal,nomeEquipa)
	values("Mário Anónimo",'2011-10-21',"obras","MA@email.com",'1978-10-02',"engenheiro civil","rua rua","Bragança","4330-500","equipa cenas");
insert into Voluntarios (nome, dataAssociacao,tipo,contacto,dataNascimento,profissao,rua,localidade,codPostal,nomeEquipa)
	values("José Cid",'2003-04-01',"obras","JC@email.com",'1947-06-02',"artista","rua da Cabana Junta á Praia","Lisboa","4000-510","equipa cenas");


-- Doadores
insert into doadores (nome,NIF,rua,Localidade,codPostal,contacto,dataAssociacao,actividade,email,site,pessoaDeContacto,voluntario)
	values("Marco Marcos","12345654","rua ficticia","Barcelos","4750-500","9112343212",'2002-12-21',null,"MM@email.com",null,null,1);
insert into doadores (nome,NIF,rua,Localidade,codPostal,contacto,dataAssociacao,actividade,email,site,pessoaDeContacto,voluntario)
	values("Moveis Mobilia lta", "9327213921","rua dos carpinteiros","Barcelos","4750-123","253456234",'2002-12-21',"mobília","mobilia@email.pt","www.mobilia.pt","José Zé",null);
insert into doadores (nome,NIF,rua,Localidade,codPostal,contacto,dataAssociacao,actividade,email,site,pessoaDeContacto,voluntario)
	values("Construtora Passa Orçamento", "9187345212","rua de baixo","Barcelos","4750-222","253987234",'2001-11-03',"obras","passa@email.pt","www.passa.pt","António Tone",null);
insert into doadores (nome,NIF,rua,Localidade,codPostal,contacto,dataAssociacao,actividade,email,site,pessoaDeContacto,voluntario)
	values("Construtora Enterra", "9187345212","rua do lado","Braga","4400-123","253900876",'2005-11-03',"obras","enterra@email.pt","www.enterra.pt","Bob Construtor",null);
    insert into doadores (nome,NIF,rua,Localidade,codPostal,contacto,dataAssociacao,actividade,email,site,pessoaDeContacto,voluntario)
	values("Rui Martelo","9834372920","rua não existe","Barcelos","4750-500","9112343212",'2002-12-21',null,"MM@email.com",null,null,null);
    
-- tarefas
insert into Tarefas (descricao)
	values("alicerços");
insert into Tarefas (descricao)
	values("colocação de brita");
insert into Tarefas (descricao)
	values("limpeza de terreno");
insert into Tarefas (descricao)
	values("levantamento de paredes");
insert into Tarefas (descricao)
	values("colocação de telhado");
insert into Tarefas (descricao)
	values("instalação electrica");
insert into Tarefas (descricao)
	values("pintura exterior");
insert into Tarefas (descricao)
	values("pintura interior");
insert into Tarefas (descricao)
	values("colocação de janelas");
insert into Tarefas (descricao)
	values("colocação de portas");
insert into Tarefas (descricao)
	values("canalizações");
insert into Tarefas (descricao)
	values("colocação de mobília");
insert into Tarefas (descricao)
	values("colocação de mobiliario de casa de banho");
insert into Tarefas (descricao)
	values("inspeção geral");
insert into Tarefas (descricao)
	values("plantar relvado");
-- questoes
insert into Perguntas (descricao,estado)
	values("Porque não começa a trabalhar?","activa");
insert into Perguntas (descricao,estado)
	values("Qual rendimento bruto do agregado?","activa");
insert into Perguntas (descricao,estado)
	values("Porquê que as galinhas não têm dentes?","activa");
insert into Perguntas (descricao,estado)
	values("Quanto é 2+2?","activa");
insert into Perguntas (descricao,estado)
	values("Quantos elementos compõem o agregado?","activa");
insert into Perguntas (descricao,estado)
	values("Como se chamavam os três mosqueteiros?","activa");
insert into Perguntas (descricao,estado)
	values("Qual a escolaridade média do agregado familiar?","activa");
insert into Perguntas (descricao,estado)
	values("Qual a disponibilidade horaria para os elementos do agregado trabalharem na obra?","activa");
    
-- doadores

insert into Doadores (nome,NIF,rua,Localidade,codPostal,contacto,dataAssociacao,actividade,
					  email)
			values("João Rico","123456","Rua de Barros","Gualtar","4710-058",
            "910000000","2013-12-12","particular","rico@email.pt");
            
-- doacoes
insert into Doacoes(descricao,data,tipo,quantidade,unidade,doador)
	values("cimento","2013-12-12","material",2000,"kg",1);
insert into Doacoes(descricao,data,tipo,quantidade,unidade,doador)
	values("tijolos","2013-12-12","material",5000,"unidade",1);
insert into Doacoes(descricao,data,tipo,quantidade,unidade,doador)
	values("areia","2013-12-12","material",1000,"kg",1);
insert into Doacoes(descricao,data,tipo,quantidade,unidade,doador)
	values("cerveja cristal","2013-12-12","material",1000,"litros",1);
insert into Doacoes(descricao,data,tipo,valor,doador,evento)
	values("dinheiro","2013-12-12","monetario",1200,1,1);
insert into Doacoes(descricao,data,tipo,valor,doador,evento)
	values("dinheiro","2013-12-12","monetario",1.90,1,1);
-- eventos
insert into Habitat.Eventos (data,nrParticipantes,observacoes,funcionario, valorAngariado)
	values("2013-12-12",123,"observado","julianaJ",0);
    
select * from doacoes;

select * from Material;
select * from Eventos;

