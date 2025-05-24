CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "property_type", "host_name", COUNT(*) AS "day_vacant"
FROM "listings" JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "date" >= "2023-06-01" AND "date" <= "2023-06-30" AND "available" = "TRUE"
GROUP BY "listings"."id";

/* ✅ 
┌──────────┐
│ COUNT(*) │
├──────────┤
│ 1895     │
└──────────┘
*/