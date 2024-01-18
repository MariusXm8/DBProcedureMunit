Project detail:
Create a postgres database via docker, create a table of your choice,
a stored procedure or a function and use mulesoft to retrieve that database via "select" and "stored procedure".
 
Finally create the munit! 
---
table name:persone(personaid,nome,cognome,eta)
Procedures: 
  -aggiungi(personaid,nome,cognome,eta): add this values into the table;
  -modifica(personaid,nome): change the name with the specific personaid;
  -cancella(personaid): delete the row with the specific personaid;

I translate all the procedure in functions to testing the project with munit(using h2 database than postgreSQL). 

Docker container postgresDB: docker run --rm --name postgresDB -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres
