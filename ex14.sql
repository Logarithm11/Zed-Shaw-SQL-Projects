.mode column
.headers on

/* A copy of ex13.sql but with an error to practice */
/* using BEGIN, ROLLBACK, and COMMIT. */


/* adds column "dead" to table "person" */
ALTER TABLE person ADD COLUMN dead INTEGER;

/* adds column "phone_number" to table "person" */
ALTER TABLE person ADD COLUMN phone_number TEXT;

/* here is the intentional error */
ALTER person ADD COLUMN salary FLOAT;

/* adds column "dob" to tables "person" and "pet" */
ALTER TABLE person ADD COLUMN dob DATETIME;
ALTER TABLE pet ADD COLUMN dob DATETIME;

/* adds column "purchased_on" to table "person_pet" */
ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;

/* adds column "parent" to table "pet" */
ALTER TABLE pet ADD COLUMN parent INTEGER;

/* updates new columns of existing tables */
UPDATE person SET dead = 0
  WHERE
  first_name = 'Logan' OR
  first_name = 'Zed';

UPDATE person SET phone_number = 'Private'
  WHERE first_name = 'Logan';

UPDATE person SET dob = 1993-05-15
  WHERE first_name = 'Logan';

UPDATE person_pet SET purchased_on = '08-01-2007'
  WHERE pet_id IN(
    SELECT pet.id
    FROM pet, person_pet
    WHERE
    pet.id = person_pet.pet_id AND
    pet.name = 'Scooter'
  );

/* creates 4 new people and 5 new pets */
INSERT OR REPLACE INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
  VALUES (2, 'Samuel', 'Sook', 21, 0, 'private', 'private', '03-13-1997'),
         (3, 'Kendall', 'Sook', 17, 0, 'private', 'private', '12-17-2000'),
         (4, 'Hannah', 'Bell', 24, 0, 'private', 'private', '01-26-1994'),
         (5, 'John', 'Hammond', 60, 1, 'unknown', 'unknown', 'unknown');

INSERT INTO pet (id, name, breed, age, dead, dob)
  VALUES (4, 'Lola', 'Dog', 6, 0, 'unknown'),
         (5, 'Toofless', 'Cat', 1, 0, 'unknown'),
         (6, 'Ruby', 'Dog', 5, 0, 'unknown'),
         (7, 'Ice-T', 'Dinosaur', 2, 1, 'unknown');

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
  VALUES (8, 'Rex', 'Dinosaur', 1, 1, 'unknown', 7);

INSERT INTO person_pet (person_id, pet_id, purchased_on)
  VALUES (2, 4, '05-01-2012'),
         (3, 5, '01-01-2017'),
         (4, 6, '03-01-2013'),
         (5, 7, 'unknown'),
         (5, 8, 'unknown');

SELECT person.first_name, pet.name, person_pet.purchased_on
  FROM pet, person_pet, person
  WHERE
  pet.id = person_pet.pet_id
  AND person_pet.person_id = person.id
  AND person_pet.purchased_on >= "01-01-2004";

SELECT pet.name FROM pet WHERE pet.parent = 7;
