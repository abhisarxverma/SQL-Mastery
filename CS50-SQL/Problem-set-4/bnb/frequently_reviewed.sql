CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("reviews"."id") AS "reviews"
FROM "listings" JOIN "reviews" ON "listings"."id" = "reviews"."listing_id"
GROUP BY "listings"."id"
ORDER BY "reviews" DESC;

/* ✅ 
┌─────────┬───────────────┬───────────┬─────────┐
│   id    │ property_type │ host_name │ reviews │
├─────────┼───────────────┼───────────┼─────────┤
│ 4090224 │ Entire home   │ Tiffany   │ 860     │
└─────────┴───────────────┴───────────┴─────────┘
*/