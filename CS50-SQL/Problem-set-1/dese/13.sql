-- Let's see the relation between the staff and the graduation rates of students

SELECT
    "schools"."name",
    "staff_evaluations"."proficient",
    "staff_evaluations"."needs_improvement",
    "staff_evaluations"."unsatisfactory",
    "graduation_rates"."graduated",
    "graduation_rates"."dropped",
    "graduation_rates"."excluded"
FROM "districts"
INNER JOIN "schools" ON "districts"."id" = "schools"."district_id"
INNER JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
INNER JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
ORDER BY "graduation_rates"."dropped" DESC
LIMIT 15;