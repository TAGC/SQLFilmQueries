/* q1, columns: title, directory */
SELECT title, director 
FROM films 
ORDER BY director;


/* q2, columns: title, length, made */
SELECT title, length, made 
FROM films 
WHERE origin != 'US';

/* q3, columns: title, director, made, length */
SELECT title, director, made, length 
FROM films 
WHERE extract('year' from made) >= 1997 and length >= '02:00:00';

/* q4, columns: name */
SELECT name 
FROM casting 
WHERE title = 'Psycho';

/* q5, columns: name, part, title */
SELECT name, part, title 
FROM casting 
WHERE substring(title from 1 for 1) = 'D';

/* q6, columns: name, part, title */
SELECT actors.name, part, title 
FROM casting join actors on casting.name = actors.name
WHERE extract('year' from born) < 1900;

/* q7, columns: name, part, title */
SELECT name, part, title
FROM casting
WHERE title in (SELECT title FROM casting WHERE name = 'Bruce Willis') 
      and name != 'Bruce Willis';

/* q8, columns: count */
SELECT COUNT (*) FROM (

(SELECT name FROM casting)
except
(SELECT casting.name FROM films join casting on films.title = casting.title
 WHERE extract('year' from films.made) >= '1990')
 
) AS res;

/* q9, columns: name, title, director */
SELECT DISTINCT c1.name, c1.title, c1.director
FROM casting as c1 join casting as c2
ON (c1.name = c2.name and c1.title <> c2.title)
ORDER BY c1.name;

/* q10, columns: name */
(SELECT name FROM casting WHERE director = 'Alfred Hitchcock')
intersect
(SELECT name FROM casting WHERE title in 
        (SELECT title FROM casting WHERE name = 'Ian Holm'));

