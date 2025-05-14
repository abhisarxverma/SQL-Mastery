.import --csv meteorites.csv meteorites

/* Now we have to make all the empty string values in columsn to the NULL */
/* For this we will use the NULLIF function on the columns which sets the column to NULL if the string matches the second argument */

UPDATE "meteorites"
SET "mass" = NULLIF("mass", ''), /* Returns NULL if the mass column is '' */
    "year" = NULLIF("year", ''),
    "lat" = NULLIF("lat", ''),
    "long" = NULLIF("long", '')
WHERE "mass" = '' OR "year" = '' OR "lat" = '' OR "long" = '';

/* Now we have to round all the values in the mass, lat and long to the 2 places */

UPDATE "meteorites"
SET "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);

/* Now we have to delete rows from the table that have the nametype of the Relict */
DELETE FROM "meteorites" WHERE "namtype" = 'Relict';

/* Now let's sort the table by the year and then by the name */

/* Create a temporary table and copy the data from the meteorites but sorted as we need */
CREATE TABLE "temp_meteorites"
AS SELECT * FROM "meteorites" ORDER BY "year", "name";

/* Delete the previous meteorites table */
DROP TABLE "meteorites";

/* Rename the sorted table to the meteorites table */
ALTER TABLE "temp_meteorites" RENAME TO "meteorites";

/* Now let's reallot the id's to the meteorites according to the new sorted order */

/* Create a temp table and set in it the id field, and set to the primary key so that sqlite autoincrement it when we add data*/
CREATE TABLE "temp_meteorties" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "nametype" TEXT,
    "class" TEXT,
    "mass" FLOAT,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" FLOAT,
    "long" FLOAT
);

/* Copy the data of the meteorites table in the temp table but leaving the id column */
INSERT INTO "temp"
SELECT "name", "nametype", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites";

/* Delete the meteorites table cause we have our data now in the temp */
DROP TABLE "meteorites";

/* Rename temp to the meteorites */
ALTER TABLE "temp" RENAME TO "meteorites";

/* Now we have to delete the nametype column from the table cause CS50 does not wants this columns
and also we have filtered the rows to do not have the 'Relict" nametype so we does not need this column */
ALTER TABLE "meteorites" DROP COLUMN "nametype";

/* ✅✅✅ Checked by CS50