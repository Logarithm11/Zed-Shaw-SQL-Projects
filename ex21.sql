.mode column
.headers on

/* Test our query from excersize 16 */
SELECT pet.breed, pet.dead, count(dead)
  FROM person, person_pet, pet
  WHERE person.id = person_pet.person_id AND
        pet.id = person_pet.pet_id
  GROUP BY pet.breed, pet.dead;

/* Create the view */
CREATE VIEW dead_pets AS
  SELECT pet.breed, pet.dead, count(dead) AS total
    FROM person, pet, person_pet
    WHERE person.id = person_pet.person_id
    AND pet.id = person_pet.pet_id
    GROUP BY pet.breed, pet.dead;

/* Try it */
SELECT * FROM dead_pets WHERE total > 10;

/* Get rid of the cats to see if it changes dead_pets */
DELETE FROM pet WHERE breed = 'Cat';
SELECT * FROM dead_pets;

/* Drop it */
DROP VIEW dead_pets;
