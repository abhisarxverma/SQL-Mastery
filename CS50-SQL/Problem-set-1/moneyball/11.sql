SELECT
  "players"."first_name",
  "players"."last_name",
  ROUND("salaries"."salary" * 1.0 / "performances"."H", 2) AS "dollars per hit"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "salaries"."year" = 2001
  AND "performances"."year" = 2001
  AND "performances"."H" > 0
ORDER BY "dollars per hit" ASC, "players"."first_name" ASC, "players"."last_name" ASC
LIMIT 10;
