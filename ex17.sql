.mode column
.headers on

/* Everyone who is older than ten (by dob) */
SELECT * FROM person WHERE dob < date('now', '-10 years') ORDER BY dob;

/* Everyone born before 1970 (by dob) */
SELECT * FROM person WHERE dob < date('1970-0101') ORDER BY dob;

/* All pets purcased this year */
SELECT * FROM person_pet
  WHERE purchased_on > date('now', 'start of year')
  ORDER BY purchased_on;

/* All pets purchased between 1990 and 2000 */
SELECT * FROM person_pet
  WHERE purchased_on > date('1990-01-01') AND
        purchased_on < date('2000-01-01')
  ORDER BY purchased_on;

/* Link the pets from the last query */
SELECT pet.name, pet.breed, pet.age, pet.dead, person_pet.purchased_on
  FROM pet, person_pet
  WHERE
    purchased_on > date('1990-01-01') AND
    purchased_on < date('2000-01-01') AND
    person_pet.pet_id = pet.id
    ORDER BY purchased_on, pet.age;
