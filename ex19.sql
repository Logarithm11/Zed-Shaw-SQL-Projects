.mode column
.headers on

/* Simple average for pet ages (Note: Decimals dropped)*/
SELECT sum(age)/count(age) AS average FROM pet;

/* Compare to average function (Decimals kept) */
SELECT avg(age) FROM pet;

/* Average name length of pets */
SELECT avg(length(name)) AS anl FROM pet;

/* Get the average age rounded */
SELECT round(avg(age)) AS average FROM pet;

/* Get a random number */
SELECT random();

/* Random number from 0-20 using absolute value and mod */
SELECT abs(random() % 20);

/* Update pet ages with random 0-20's */
UPDATE pet SET age = abs(random() % 20) WHERE dead = 0;

/* Check that it changed (maybe) */
SELECT round(avg(age)) AS average FROM pet;

/* Use 0-50 as the range */
UPDATE pet SET age = abs(random() % 50) WHERE dead = 0;

/* Check the average again */
SELECT round(avg(age)) AS average FROM pet;
