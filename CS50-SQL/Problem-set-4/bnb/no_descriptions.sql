CREATE VIEW "no_descriptions" AS
SELECT "id", "property_type", "host_name", "accomodates", "bedrooms"
FROM "listings";

/* ✅
┌──────────┐
│ COUNT(*) │
├──────────┤
│ 3973     │
└──────────┘
*/