select m.idMecanicos, m.Nome, e.NomeEspecialidade
  from mydb.Mecanicos m, mydb.Especialidades e, mydb.Mecanicos_has_Especialidades me
 where m.idMecanicos = me.Mecanicos_idMecanicos
   and e.idEspecialidades = me.Especialidades_idEspecialidades;