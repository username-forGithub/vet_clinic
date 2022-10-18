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
