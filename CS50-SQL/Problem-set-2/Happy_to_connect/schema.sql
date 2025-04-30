-- To Create the database for the LinkedIn Social platform

CREATE TABLE IF NOT EXISTS "Users" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "Schools_and_universities" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "foundation_year" NUMERIC
);

CREATE TABLE IF NOT EXISTS "Companies" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "Mutual_connections" (
    "id" INTEGER PRIMARY KEY,
    "user_id_1" INTEGER,
    "user_id_2" INTEGER CHECK("user_id_2" != "user_id_1"),
    FOREIGN KEY ("user_id_1") REFERENCES "Users"("id"),
    FOREIGN KEY ("user_id_2") REFERENCES "Users"("id")
);

CREATE TABLE IF NOT EXISTS "School_Affiliations" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "degree_type" TEXT,
    FOREIGN KEY("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY("school_id") REFERENCES "Schools_and_universities"("id")
);

CREATE TABLE IF NOT EXISTS "Company_Affiliations" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "post_title" TEXT,
    FOREIGN KEY("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY("company_id") REFERENCES "Companies"("id")
);

/*
sqlite> SELECT "first_name", "last_name" FROM "Users" WHERE "id" = (     
(x1...> SELECT "user_id" FROM "School_Affiliations" WHERE "school_id" = (
(x2...> SELECT "id" FROM "Schools_and_Universities" WHERE "name" = 'Harvard University'));
┌────────────┬───────────┐
│ first_name │ last_name │
├────────────┼───────────┤
│ Alan       │ Garber    │
└────────────┴───────────┘
*/