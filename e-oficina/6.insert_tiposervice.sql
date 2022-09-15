insert into mydb.TipoServico(idTipoServico,NomeServico) values(1,"REVISÃO");
insert into mydb.TipoServico(idTipoServico,NomeServico) values(2,"MANUTENÇÃO");
insert into mydb.TipoServico(idTipoServico,NomeServico) values(3,"REVISÃO-GARANTIA");
insert into mydb.TipoServico(idTipoServico,NomeServico) values(4,"MANUTENÇÃO-GARANTIA");
COMMIT;
SELECT * FROM mydb.TipoServico;