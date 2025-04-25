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

/*
┌────────────┬──────────────┬─────────────────┐
│ first_name │  last_name   │ dollars per hit │
├────────────┼──────────────┼─────────────────┤
│ Albert     │ Pujols       │ 1030.93         │
│ Juan       │ Pierre       │ 1064.36         │
│ Jimmy      │ Rollins      │ 1111.11         │
│ David      │ Eckstein     │ 1204.82         │
│ Doug       │ Mientkiewicz │ 1295.18         │
│ Luis       │ Rivas        │ 1333.33         │
│ Terrence   │ Long         │ 1352.53         │
│ Paul       │ Lo Duca      │ 1564.63         │
│ Torii      │ Hunter       │ 1564.63         │
│ Aramis     │ Ramirez      │ 1574.59         │
└────────────┴──────────────┴─────────────────┘
*/