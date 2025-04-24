SELECT "schools"."name", "expenditures"."per_pupil_expenditure", "graduation_rates"."graduated"
FROM "districts" 
INNER JOIN "schools" ON "districts"."id" = "schools"."district_id"
INNER JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
INNER JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
WHERE "graduation_rates"."graduated" IS NOT NULL
ORDER BY "per_pupil_expenditure" DESC, "schools"."name";

-- 391 rows ✅