/*Queries that provide answers to the questions from all projects.*/

select * from animals
WHERE name LIKE '%mon';

select (name) from animals
WHERE date_of_birth between '2016-01-01' and '2019-01-01';

select (name) from animals
WHERE neutered = true 
and escape_attempts < 3;

select name, escape_attempts from animals
WHERE weight_kg > 10.5;

select date_of_birth from animals
WHERE name in ('Agumon', 'Pikachu');

select * from animals
WHERE neutered = true;

select * from animals
WHERE name not in ('Gabumon');

select * from animals
WHERE weight_kg between 10.4 and 17.3;

begin;

update animals set species = 'digimon' where name LIKE '%mon';
update animals set species = 'pokemon' where species is null;

commit;

begin;

delete from animals where date_of_birth > '2022-01-01';
savepoint deleted_one_row;
update animals set weight_kg = weight_kg * (-1); 
rollback to deleted_one_row;
update animals set weight_kg = weight_kg * (-1) where weight_kg < 0;

commit;

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select count(*), neutered from animals group by neutered;
select min(weight_kg), max(weight_kg), neutered from animals group by neutered;
select avg(escape_attempts), neutered from animals where date_of_birth 
between '1990-01-01' and '2000-01-01' 
group by neutered;
