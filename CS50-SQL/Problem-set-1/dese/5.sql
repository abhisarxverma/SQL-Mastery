SELECT 
    "city",
    COUNT("name") AS "3 or less Public Schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "3 or less Public Schools" <= 3
ORDER BY "3 or less Public Schools" DESC, "city";

-- 201 rows ✅