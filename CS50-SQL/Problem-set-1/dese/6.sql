SELECT "name" FROM "schools" WHERE "id" IN (
    SELECT "school_id" FROM "graduation_rates" WHERE "graduated" = 100
);

-- 9 rows ✅

/*
┌────────────────────────────────────────────────────────┐
│                          name                          │
├────────────────────────────────────────────────────────┤
│ Tahanto Regional High                                  │
│ O'Bryant School of Math & Science                      │
│ Cohasset High School                                   │
│ Global Learning Charter Public School                  │
│ Bromfield                                              │
│ Pioneer Valley Regional                                │
│ Sizer School: A North Central Charter Essential School │
│ Upper Cape Cod Vocational Technical                    │
│ Weston High                                            │
└────────────────────────────────────────────────────────┘
*/