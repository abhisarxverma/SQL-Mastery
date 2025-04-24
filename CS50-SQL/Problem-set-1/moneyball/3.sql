SELECT 
    "year" AS "Year",
    "HR" AS "Home Runs"
FROM "performances"
WHERE "player_id" = (
    SELECT "id" FROM "players" WHERE 
    "first_name" = "Ken" AND
    "last_name" = "Griffey" AND
    "birth_year" = "1969"
)
ORDER BY "year" DESC;

-- 17 ROWS ✅
/*
┌──────┬───────────┐
│ Year │ Home Runs │
├──────┼───────────┤
│ 2001 │ 22        │
│ 2000 │ 40        │
│ 1999 │ 48        │
│ 1998 │ 56        │
│ 1997 │ 56        │
│ 1996 │ 49        │
│ 1995 │ 17        │
│ 1994 │ 40        │
│ 1993 │ 45        │
│ 1992 │ 27        │
│ 1991 │ 22        │
│ 1990 │ 22        │
│ 1989 │ 16        │
└──────┴───────────┘
*/