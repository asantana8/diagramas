#MODO 1
SELECT COUNT(1), me.Mecanicos_idMecanicos, m.nome
       #(SELECT m.nome FROM mydb.Mecanicos m WHERE m.idMecanicos = me.Mecanicos_idMecanicos) as NomeMecanico 
  FROM mydb.Mecanicos_has_Especialidades me
   JOIN mydb.Mecanicos m ON m.idMecanicos = me.Mecanicos_idMecanicos
 GROUP BY me.Mecanicos_idMecanicos
 HAVING COUNT(1) > 1;

#MODO 2
SELECT COUNT(1), me.Mecanicos_idMecanicos, 
       (SELECT m.nome FROM mydb.Mecanicos m WHERE m.idMecanicos = me.Mecanicos_idMecanicos) as NomeMecanico 
  FROM mydb.Mecanicos_has_Especialidades me   
 GROUP BY me.Mecanicos_idMecanicos
 HAVING COUNT(1) > 1; 