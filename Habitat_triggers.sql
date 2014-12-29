drop procedure if exists sp_actualizaMaterial;
delimiter $$
create procedure sp_actualizaMaterial(in matDescricao varchar(75), in quant int, in unit varchar(45))
begin
declare idMat int;
declare erro bool default 0;
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