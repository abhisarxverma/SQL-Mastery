SELECT 
    "city",
    COUNT("name") AS "Total Public School Count"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "Total Public School Count" DESC, "city"
LIMIT 10;

-- 2 COLUMNS, 10 ROWS ✅

/*
┌─────────────┬───────────────────────────┐
│    city     │ Total Public School Count │
├─────────────┼───────────────────────────┤
│ Springfield │ 64                        │
│ Worcester   │ 47                        │
│ Lynn        │ 27                        │
│ Lawrence    │ 26                        │
│ Lowell      │ 26                        │
│ New Bedford │ 26                        │
│ Dorchester  │ 25                        │
│ Brockton    │ 24                        │
│ Quincy      │ 19                        │
│ Fall River  │ 18                        │
└─────────────┴───────────────────────────┘
*/