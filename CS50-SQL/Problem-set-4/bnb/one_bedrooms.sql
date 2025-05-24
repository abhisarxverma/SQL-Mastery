CREATE VIEW "one_bedrooms" AS 
SELECT "id", "property_type", "host_name", "accommodates"
FROM "listings"
WHERE "bedrooms" = 1;

/* Total one-bedroom listings ✅
┌──────────┐
│ COUNT(*) │
├──────────┤
│ 1228     │
└──────────┘

one-bedroom listings that have the bedrooms greater than or equal to 4 ✅ 
┌──────────┐
│ COUNT(*) │
├──────────┤
│ 222      │
└──────────┘
*/