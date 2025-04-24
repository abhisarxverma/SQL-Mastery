SELECT "name", MIN("pupils") AS "Least Schools Count District" FROM "districts"
FULL JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id";

/*
┌───────┬──────────────────────────────┐
│ name  │ Least Schools Count District │
├───────┼──────────────────────────────┤
│ Savoy │ 64                           │
└───────┴──────────────────────────────┘
*/