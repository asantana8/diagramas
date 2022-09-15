SELECT COUNT(1), v.marca 
  FROM mydb.Veiculos v 
 GROUP BY v.marca 
 ORDER BY v.marca;