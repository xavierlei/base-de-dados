drop procedure if exists sp_actualizaMaterial;
delimiter $$
create procedure sp_actualizaMaterial(in matDescricao varchar(75), in quant int, in unit varchar(45))
begin
declare idMat int;
		select id into idMat from Habitat.Material where Material.descricao = matDescricao
					group by id;
		if idMat is null then
			insert into Habitat.Material (descricao,quantidade,unidade)
					values(matDescricao,quant,unit);
		else
			update Habitat.Material set quantidade = quantidade + quant
				where id = idMat;
		end if;
end $$

drop procedure if exists sp_actualizaAngariacao;
delimiter $$
create procedure sp_actualizaAngariacao(in idEvento int, in valor int)
	begin
		update Habitat.Eventos 
			set valorAngariado = valorAngariado + valor
            where Eventos.id = idEvento;
end $$

drop trigger if exists Habitat.tg_Doacao;

delimiter $$
create trigger tg_Doacao
	after insert on Habitat.Doacoes
    for each row
    begin
		 if new.tipo = "material" then
			call sp_actualizaMaterial(new.descricao,new.quantidade,new.unidade);
		 elseif new.tipo = "monetário" then
			if new.evento is not null then
				call sp_actualizaAngariacao(new.evento, new.valor);
			end if;
		 end if;
end$$

drop trigger if exists tg_updateDoacao;
delimiter $$
create trigger tg_updateDoacao
	after update on Habitat.Doacoes
    for each row
    begin
		 if new.tipo = "monetário" then
			if old.evento is null then
				if new.evento is not null then
					call sp_actualizaAngariacao(new.evento, new.valor);
				end if;
			end if;
		 end if;
end$$

-- utilizadores



CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpassword';

GRANT ALL ON Habitat.* TO 'admin'@'localhost';

CREATE USER 'angariacao'@'localhost' IDENTIFIED BY 'angariacaopassword';

GRANT SELECT ON Habitat.* TO 'angariacao'@'localhost';

GRANT ALL ON Habitat.Eventos TO 'angariacao'@'localhost';
GRANT ALL ON Habitat.Doacoes TO 'angariacao'@'localhost';
GRANT ALL ON Habitat.Doadores TO 'angariacao'@'localhost';
GRANT ALL ON Habitat.Voluntarios TO 'angariacao'@'localhost';
GRANT ALL ON Habitat.VoluntariosEquipas TO 'angariacao'@'localhost';
GRANT ALL ON Habitat.Equipas TO 'angariacao'@'localhost';

CREATE USER 'familias'@'localhost' IDENTIFIED BY 'failiaspassword';

GRANT SELECT ON Habitat.* TO 'familias'@'localhost';
GRANT ALL ON Habitat.Familias TO 'familias'@'localhost';
GRANT ALL ON Habitat.Elementos TO 'familias'@'localhost';
GRANT ALL ON Habitat.Candidaturas TO 'familias'@'localhost';
GRANT ALL ON Habitat.CandidaturaPerguntas TO 'familias'@'localhost';
GRANT ALL ON Habitat.Perguntas TO 'familias'@'localhost';
GRANT ALL ON Habitat.Anexos TO 'familias'@'localhost';

CREATE USER 'obras'@'localhost' IDENTIFIED BY 'obraspassword';
GRANT SELECT ON Habitat.* TO 'obras'@'localhost';
GRANT ALL ON Habitat.Projectos TO 'obras'@'localhost';
GRANT ALL ON Habitat.ProjectoTarefas TO 'obras'@'localhost';
GRANT ALL ON Habitat.Tarefas TO 'obras'@'localhost';
GRANT ALL ON Habitat.ProjectoMaterial TO 'obras'@'localhost';
GRANT ALL ON Habitat.Material TO 'obras'@'localhost';
GRANT ALL ON Habitat.ProjectoTarefaVoluntario TO 'obras'@'localhost';