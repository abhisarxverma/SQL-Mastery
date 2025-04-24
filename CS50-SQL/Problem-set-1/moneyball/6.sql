SELECT 
    "teams"."name" AS "Team name",
    SUM("H") AS "Total hits"
FROM "performances"
JOIN "teams" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."year" = "2001"
GROUP BY "team_id"
ORDER BY "Total hits" DESC
LIMIT 5;

/*
┌───────────────────┬────────────┐
│     Team name     │ Total hits │
├───────────────────┼────────────┤
│ Colorado Rockies  │ 1663       │
│ Seattle Mariners  │ 1637       │
│ Texas Rangers     │ 1566       │
│ Cleveland Indians │ 1559       │
│ Minnesota Twins   │ 1514       │
└───────────────────┴────────────┘
*/