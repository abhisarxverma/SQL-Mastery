SELECT  "districts"."name", "expenditures"."per_pupil_expenditure", "staff_evaluations"."exemplary" 
FROM "expenditures"
JOIN "staff_evaluations" ON "expenditures"."district_id" = "staff_evaluations"."district_id"
JOIN "districts" ON "districts"."id" = "expenditures"."district_id"
WHERE "districts"."type" = 'Public School District'
AND "expenditures"."per_pupil_expenditure" > (
    SELECT ROUND(AVG("per_pupil_expenditure"),2) FROM "expenditures"
) AND "staff_evaluations"."exemplary" > (
    SELECT ROUND(AVG("exemplary"),2) FROM "staff_evaluations"
) 
ORDER BY  "staff_evaluations"."exemplary" DESC, "expenditures"."per_pupil_expenditure";

-- 65 ROWS ✅