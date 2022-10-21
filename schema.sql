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

