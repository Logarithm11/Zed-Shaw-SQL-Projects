.mode column
.headers on

/* Select the average age of every person */
SELECT avg(age) FROM person;

/* Select the average age of every pet */
SELECT avg(age) FROM pet;

/* Select the average age of every breed by dead or alive */
SELECT breed, dead, avg(age) from pet
  GROUP BY breed, dead;

/* Select the sum of the ages of all people */
SELECT sum(age) FROM person;

/* Select the sum of the ages of all pets */
SELECT sum(age) FROM pet;

/* Select the sum of the deaths and ages for each breed */
SELECT breed, sum(dead), sum(age) FROM pet
  WHERE dead = 1
  GROUP BY breed, dead;

/* Select the minimum and maximum ages of all people */
SELECT min(age), max(age) FROM person;

/* Select the minimum and maximum ages of all pets */
SELECT min(age), max(age) FROM pet;

/* Select the min and max ages of pets over the age of zero */
/* and goroups them by breed and vitality */
SELECT breed, dead, min(age), max(age) FROM pet
  WHERE age > 0
  GROUP BY breed, dead;
