SELECT "name", "per_pupil_expenditure" FROM "districts" 
LEFT JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "name" NOT LIKE "%(non-op)"
ORDER BY "per_pupil_expenditure" DESC
LIMIT 10;

-- 10 rows ✅

/*
┌────────────────────────────────────────────────────┬───────────────────────┐
│                        name                        │ per_pupil_expenditure │
├────────────────────────────────────────────────────┼───────────────────────┤
│ Provincetown                                       │ 41318.9               │
│ Cambridge                                          │ 35113.7               │
│ Martha's Vineyard Charter Public School (District) │ 35079.24              │
│ Martha's Vineyard                                  │ 34611.23              │
│ Minuteman Regional Vocational Technical            │ 32814.39              │
│ Wellfleet                                          │ 32788.2               │
│ Truro                                              │ 32245.03              │
│ Orleans                                            │ 31703.4               │
│ Weston                                             │ 30295.95              │
│ Tisbury                                            │ 29598.7               │
└────────────────────────────────────────────────────┴───────────────────────┘
*/