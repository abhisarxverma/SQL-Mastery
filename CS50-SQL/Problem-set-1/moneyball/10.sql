SELECT
  "players"."first_name",
  "players"."last_name",
  "salaries"."salary",
  "performances"."HR",
  "salaries"."year"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
ORDER BY
  "players"."id" ASC,
  "salaries"."year" DESC,
  "performances"."HR" DESC,
  "salaries"."salary" DESC;

-- In this task i took help of the CHATGPT
-- I didn't know and learned that we could achieve this by joining the (players joined salaries) to performances using two on columns.
-- 14915 ROWS ✅