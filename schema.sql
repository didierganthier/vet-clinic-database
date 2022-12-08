/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD COLUMN species varchar(100);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age int,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id int;
ALTER TABLE animals ADD COLUMN owner_id int;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id);


CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    age int,
    date_of_graduation date,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    vet_id int,
    species_id int,
    PRIMARY KEY(vet_id, species_id),
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    vet_id int,
    animal_id int,
    date_of_visit date,
    PRIMARY KEY(id),
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT fk_animals FOREIGN KEY (animal_id) REFERENCES animals(id)
);