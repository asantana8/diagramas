INSERT INTO `mydb`.`OrdemServico`
(`idOrdemServico`,
`DataEmissao`,
`Status`,
`DataConclusao`,
`ValorServico`,
`ValorMaoDeObra`,
`ValorPecas`,
`ValorInsumos`,
`ValorTotal`,
`Autorizacao`,
`Equipes_idEquipes`,
`Veiculos_idVeiculos`,
`Veiculos_Clientes_idCliente`,
`TipoServico_idTipoServico`,
`Pagamento_idPagamento`)
SELECT 2, 
       SYSDATE(),
       'EM ANÁLISE',
       (date_add(now(), interval 2 day)),
       258.25,
       50.10,
       155.10,
       25.30,
       488.75,
       'S',
       1,
       1,
       1,
       2,
       1;

