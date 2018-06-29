.mode column
.headers on

CREATE TABLE person (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  age INTEGER
);

CREATE TABLE pet (
  id INTEGER PRIMARY KEY,
  name TEXT,
  breed TEXT,
  age INTEGER,
  dead INTEGER
);

CREATE TABLE person_pet (
  person_id INTEGER,
  pet_id INTEGER
);

INSERT INTO person (id, first_name, last_name, age)
  values (0, 'Zed', 'Shaw', 37);

INSERT INTO pet (id, name, breed, age, dead)
  values (0, 'Fluffy', 'Unicorn', 1000, 0);

INSERT INTO pet values (1, 'Giganator', 'Robot', 1, 1);

INSERT INTO person values (1, 'Logan', 'Coe', 24);

INSERT INTO pet values (2, 'Stella', 'Cat', 20, 1);

INSERT INTO pet values (3, 'Scooter', 'Dog', 10, 0);

INSERT INTO person_pet (person_id, pet_id)
  values (0, 0);

INSERT INTO person_pet values (0, 1);
INSERT INTO person_pet values (1, 2);
INSERT INTO person_pet values (1, 3);

ALTER TABLE person ADD COLUMN hight INTEGER;
ALTER TABLE person ADD COLUMN weight INTEGER;
