.mode column
.headers on

SELECT * FROM person, person_pet, pet
  WHERE person.id = person_pet.person_id AND
        pet.id = person_pet.pet_id AND
        person.first_name = 'Logan';

SELECT * FROM pet JOIN person, person_pet
  ON person.id = person_pet.person_id AND
     pet.id = person_pet.pet_id AND
     person.first_name = 'Logan';

SELECT * FROM pet LEFT OUTER JOIN person, person_pet
  ON person.id = person_pet.person_id AND
     pet.id = person_pet.pet_id AND
     person.first_name = 'Logan';
