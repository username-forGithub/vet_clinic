/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id integer primary key generated always as identity,
  name varchar(100),
	date_of_birth date,
	escape_attempts integer,
	neutered boolean,
	weight_kg decimal	
);

ALTER TABLE animals
ADD COLUMN species varchar;

CREATE TABLE owners (
	id integer primary key generated always as identity,
  full_name varchar(100),
	age integer		
);

CREATE TABLE species (
	id integer primary key generated always as identity,
  name varchar(100)	
);

ALTER TABLE animals
drop column species;

ALTER TABLE animals
ADD COLUMN species_id varchar;

ALTER TABLE animals ADD CONSTRAINT spec_id_fkey FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD CONSTRAINT owne_id_fkey FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (
	id integer primary key generated always as identity,
	name varchar(100),
	age integer,
	date_of_graduation date
)

CREATE TABLE visits (
    animal_id integer REFERENCES animals(id),
    vet_id integer REFERENCES vets(id),
    date_visited DATE
);

CREATE TABLE specializations (
		vet_id integer REFERENCES vets(id),
		species_id integer REFERENCES species(id)
);

