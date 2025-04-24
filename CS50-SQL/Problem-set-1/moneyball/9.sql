SELECT "teams"."name", ROUND(AVG("salaries"."salary")) AS "Average Salary" FROM "teams"
JOIN "salaries" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = "2001"
GROUP BY "team_id"
ORDER BY "Average Salary" 
LIMIT 5;

/*
┌────────────────────┬────────────────┐
│        name        │ Average Salary │
├────────────────────┼────────────────┤
│ Minnesota Twins    │ 893704.0       │
│ Montreal Expos     │ 1134177.0      │
│ Florida Marlins    │ 1153629.0      │
│ Oakland Athletics  │ 1252250.0      │
│ Kansas City Royals │ 1265089.0      │
└────────────────────┴────────────────┘
*/