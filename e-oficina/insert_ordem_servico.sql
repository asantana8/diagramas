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
`TipoServico_idTipoServico`)
VALUES
(900,
sysdate(),
1,
sysdate()+2,
10.20,
5.20,
4.20,
0,
19.60,
"S",
1,
1,
1,
1);

COMMIT;