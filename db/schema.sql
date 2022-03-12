CREATE DATABASE record_company;
USE record_company;

CREATE TABLE bands (
	id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE albums (
	id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INTEGER,
    band_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id) --links the albums table to bands table 
);	


SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

--changes the name of columns using AS (Ascending default)
SELECT id AS 'ID', name AS 'Band Name'
FROM bands;

--order the elements in your table
SELECT * FROM bands ORDER BY name;

--descending order 
SELECT * FROM bands ORDER BY name DESC;

-- unique names, no repeats
SELECT DISTINCT name FROM albums;

UPDATE albums 
SET release_year = 1982
WHERE id = 1;

-- Where is a great filter 
SELECT * FROM albums
WHERE release_year < 2000;\

-- % can be anything, use when filtering through queries
SELECT * FROM albums
WHERE name LIKE '%er%';

SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id = 2;

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2018;

SELECT * FROM albums
WHERE release_year IS NULL;

-- Delete command 
DELETE FROM albums
WHERE id = 5;

-- joining tables together - joins tables with values on left and right and only returns values if there is a match
SELECT * FROM bands
INNER JOIN albums ON bands.id = albums.band_id;

-- returns everything from bands table on the left side
SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM albums
RIGHT JOIN bands ON bands.id = albums.band_id;

SELECT AVG(release_year) FROM albums;