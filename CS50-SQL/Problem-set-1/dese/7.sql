SELECT
    "name" AS "Total school count in Cambridge District"
FROM "schools"
WHERE "district_id" = (
    SELECT "id" FROM "districts" WHERE "name" = 'Cambridge'
);

-- 17 rows ✅

/*
┌──────────────────────────────────────────┐
│ Total school count in Cambridge District │
├──────────────────────────────────────────┤
│ Amigos School                            │
│ Cambridge Rindge and Latin               │
│ Cambridge Street Upper School            │
│ Cambridgeport                            │
│ Fletcher/Maynard Academy                 │
│ Graham and Parks                         │
│ Haggerty                                 │
│ John M Tobin                             │
│ Kennedy-Longfellow                       │
│ King Open                                │
│ Maria L. Baldwin                         │
│ Martin Luther King Jr.                   │
│ Morse                                    │
│ Peabody                                  │
│ Putnam Avenue Upper School               │
│ Rindge Avenue Upper School               │
│ Vassal Lane Upper School                 │
└──────────────────────────────────────────┘
*/