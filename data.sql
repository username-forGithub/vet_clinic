/* Populate database with sample data. */

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
	values
	('Agumon', '2020-02-03', 0, true, 10.23),
	('Gabumon', '2018-11-15', 2, true, 8.00),
	('Pikachu', '2021-01-07', 1, false, 15.04),
	('Devimon', '2017-05-17', 5, true, 11.00)
;

    INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Charmander', '2020/2/8', '0', 'false', '-11.0');

    INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Plantmon', '2021/11/15', '2', 'true', '-5.7');

    INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Squirtle', '1993/04/02', '3', 'false', '-12.13');

    INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Angemon', '2005/06/12', '1', 'true', '-45.0');

    INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Boarmon', '2005/06/07', '7', 'true', '20.4');

    INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Blossom', '1998/10/13', '3', 'true', '17.0');

    INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Ditto', '2022/05/14', '4', 'true', '22.0');

    INSERT INTO owners (full_name, age)
    VALUES ('Sam Smith', 34);

    INSERT INTO owners (full_name, age)
    VALUES ('Jennifer Orwell', 19);

    INSERT INTO owners (full_name, age)
    VALUES ('Bob', 45);

    INSERT INTO owners (full_name, age)
    VALUES ('Melody Pond', 77);

    INSERT INTO owners (full_name, age)
    VALUES ('Dean Winchester', 14);

    INSERT INTO owners (full_name, age)
    VALUES ('Jodie Whittaker', 38);

    INSERT INTO species (name)
    VALUES ('Pokemon');
    INSERT INTO species (name)
    VALUES ('Digimon');

    update animals set owner_id = 'Sam Smith' where name = 'Agumon';
    update animals set owner_id = 'Jennifer Orwell' where name in ('Gabumon', 'Pikachu');
    update animals set owner_id = 'Bob' where name in ('Devimon', 'Plantmon');
    update animals set owner_id = 'Melody Pond' where name in ('Charmander', 'Squirtle', 'Blossom');
    update animals set owner_id = 'Dean Winchester' where name in ('Angemon', 'Boarmon');

    INSERT INTO vets (name, age, date_of_graduation) VALUES  
    ('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');

    INSERT INTO visits (animal_id, vet_id, date_visited) VALUES 
    (9, 2, '2019-01-24'), (9, 2, '2019-05-15'),
    (7, 3, '2019-09-29'), (6, 2, '2019-12-21'),
    (3, 2, '2020-01-05'), (9, 2, '2020-02-27'),
    (3, 2, '2020-03-08'), (3, 2, '2020-05-14'),
    (1, 1, '2020-05-24'), (10, 3, '2020-05-24'),
    (1, 3, '2020-07-22'), (9, 2, '2020-08-03'),
    (6, 1, '2020-08-10'), (8, 4, '2020-10-03'),
    (8, 4, '2020-11-04'), (10, 1, '2021-01-11'),
    (2, 4, '2021-02-02'), (5, 4, '2021-02-24'),
    (6, 2, '2021-04-07'), (4, 3, '2021-05-04');

    INSERT INTO specializations (vet_id, species_id) VALUES  
    (1, 1), (3, 2),
    (3, 1), (4, 2);

    
