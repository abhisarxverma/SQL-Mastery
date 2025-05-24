/* So in this task we have to select the sentences from the sentences table that have the index in the 
below column and then we have to selecte the substring using the substr function of the s1l */

14	  98	 4
114	  3	     5
618	  72	 9
630	  7	     3
932	  12	 5
2230  50	 7
2346  44	 10
3041  14	 5

/* So I am planning to make another table and put the data in that and then join the sentences and this table
And then finally make a query to find the phrases */

/* Let's first make another table and put this data */

CREATE TABLE IF NOT EXISTS "cipher" (
    "sentence_id" INTEGER NOT NULL,
    "start" INTEGER NOT NULL,
    "length" INTEGER NOT NULL
);

/* Our table got created, now let's put the data */

INSERT INTO "cipher" ("sentence_id", "start", "length")
VALUES
(14,98,4),
(114,3,5),
(618,72,9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5);

/* Table is successfully created
┌─────────────┬───────┬────────┐
│ sentence_id │ start │ length │
├─────────────┼───────┼────────┤
│ 14          │ 98    │ 4      │
│ 114         │ 3     │ 5      │
│ 618         │ 72    │ 9      │
│ 630         │ 7     │ 3      │
│ 932         │ 12    │ 5      │
│ 2230        │ 50    │ 7      │
│ 2346        │ 44    │ 10     │
│ 3041        │ 14    │ 5      │
└─────────────┴───────┴────────┘
*/

CREATE VIEW "message" AS 
SELECT substr("sentence", "start", "length") AS "phrase"
FROM"sentences" JOIN "cipher" ON "sentences"."id" = "cipher"."sentence_id";

/* And we got our answer
┌────────────┐
│   phrase   │
├────────────┤
│ find       │
│ me in      │
│ the place  │
│ you        │
│ least      │
│ expect.    │
│ behind the │
│ books      │
└────────────┘
*/