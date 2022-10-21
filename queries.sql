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

SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owners_id=owners.full_name
where owners.full_name = 'Melody Pond';

SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id=species.name
where species.name = 'Pokemon';

SELECT owners.full_name as owners, STRING_AGG(animals.name, ', ') as animals FROM animals JOIN owners ON animals.owners_id=owners.full_name
GROUP BY owners.full_name;

SELECT count(species.name), species.name FROM animals JOIN species ON animals.species_id=species.name
group by species.name;

SELECT owners.full_name as owners, STRING_AGG(bb.name, ', ') as animals 
FROM (select * from animals where species_id = 'Digimon') bb JOIN owners ON bb.owners_id=owners.full_name
where owners_id = 'Jennifer Orwell'
GROUP BY owners.full_name;

SELECT owners.full_name as owners, STRING_AGG(bb.name, ', ') as animals 
FROM (select * from animals where escape_attempts = 0) bb JOIN owners ON bb.owners_id=owners.full_name
where owners_id = 'Dean Winchester'
GROUP BY owners.full_name;

SELECT owners.full_name as owners, count(animals.name) as max_num
FROM animals JOIN owners ON animals.owners_id=owners.full_name
GROUP BY owners.full_name
order by max_num DESC
LIMIT  1;

select animals.name as animals_name, visits.date_visited, vets.name as vets_name from visits  
join animals on visits.animal_id=animals.id 
join vets on visits.vet_id=vets.id
where vets.name = 'William Tatcher'
order by visits.date_visited DESC
LIMIT 1;

select count(DISTINCT (animals.name)) as animals from visits  
join animals on visits.animal_id=animals.id 
join vets on visits.vet_id=vets.id
where vets.name = 'Stephanie Mendez';

select species.name, vets.name from specializations  
join vets on vets.id=specializations.vet_id
join species on species.id=specializations.species_id;

select animals.name as animals_name, visits.date_visited, vets.name as vets_name from visits  
join animals on visits.animal_id=animals.id 
join vets on visits.vet_id=vets.id
where vets.name = 'Stephanie Mendez' and visits.date_visited between '2020-04-01' and '2020-08-30';

select animals.name, count(visits.date_visited) as visits_num from visits  
join animals on visits.animal_id=animals.id 
join vets on visits.vet_id=vets.id
group by animals.name
order by visits_num DESC
LIMIT 1;

select animals.name as animals_name, visits.date_visited, vets.name as vets_name from visits  
join animals on visits.animal_id=animals.id 
join vets on visits.vet_id=vets.id
where vets.name = 'Stephanie Mendez'
order by visits.date_visited asc
LIMIT 1;

select * from visits  
join animals on visits.animal_id=animals.id 
join vets on visits.vet_id=vets.id
order by visits.date_visited desc
LIMIT 1;

select count(*) from vets ve
left join visits v on ve.id = v.animal_id
left join specializations s on s.species_id = ve.id
left join species sp on sp.id = s.species_id
where sp.id is null;

select count(a.id), a.* from animals a
join visits v on a.id=v.animal_id
join vets ve on v.vet_id=ve.id
where ve.name = 'Maisy Smith'
group by a.id
order by count(a.id) DESC
LIMIT 1;