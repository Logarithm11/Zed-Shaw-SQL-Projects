.mode column
.headers on

/* Simple query to get a related table */
SELECT * FROM person, person_pet, pet
  WHERE person.id = person_pet.person_id AND
        pet.id = person_pet.pet_id;

/* Query to count number of dead pets per person by breed */
SELECT person.first_name, pet.breed, pet.dead, count(dead)
FROM person, person_pet, pet
  WHERE person.id = person_pet.person_id AND
        pet.id = person_pet.pet_id
  GROUP BY pet.breed, pet.dead;

/* Drop first names */
SELECT pet.breed, pet.dead, count(dead)
FROM person, person_pet, pet
  WHERE person.id = person_pet.person_id AND
        pet.id = person_pet.pet_id
  GROUP BY pet.breed, pet.dead;

/* Compare to non relation query (pets with no owners)*/
SELECT breed, dead, count(dead) FROM pet
  GROUP BY breed, dead;
