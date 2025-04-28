-- TASK IS TO CREATE THE DATABASE SCHEMA FOR A AIRPORT

CREATE TABLE IF NOT EXISTS "passengers" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" NUMERIC
);

CREATE TABLE IF NOT EXISTS "airlines" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "concourse" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "flights" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "flight_number" INTEGER,
    "airline_id" INTEGER,
    "departure_airport" TEXT NOT NULL CHECK(LENGTH("departure_airport") = 3),
    "arrival_airport" TEXT NOT NULL CHECK(LENGTH("arrival_airport") = 3),
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);

CREATE TABLE IF NOT EXISTS "check_ins" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
)

/*
sqlite> SELECT "first_name" FROM "passengers" WHERE "id" = (     
(x1...> SELECT "id" FROM "check_ins" WHERE "flight_id" = (       
(x2...> SELECT "id" FROM "flights" WHERE "flight_number" = 300));
┌────────────┐
│ first_name │
├────────────┤
│ Amelia     │
└────────────┘
*/