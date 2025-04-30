-- Create the database for the UNION SQUARE DONUTS

CREATE TABLE IF NOT EXISTS "Ingredients" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL ,
    "rate" NUMERIC 
);

CREATE TABLE IF NOT EXISTS "Donuts" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "is_gluten_free" TEXT NOT NULL CHECK("is_gluten_free" IN ("yes", "no")),
    "price" NUMERIC NOT NULL
);

CREATE TABLE IF NOT EXISTS "Donut_ingredients" (
    "id" PRIMARY KEY,
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    FOREIGN KEY("donut_id") REFERENCES "Donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "Ingredients"("id")
);

CREATE TABLE IF NOT EXISTS "Orders" (
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER DEFAULT 1,
    FOREIGN KEY("donut_id") REFERENCES "Donuts"("id"),
    FOREIGN KEY("customer_id") REFERENCES "Customers"("id")
);

CREATE TABLE IF NOT EXISTS "Customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT
);

CREATE TABLE IF NOT EXISTS "Order_history" (
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER NOT NULL,
    "order_id" INTEGER NOT NULL,
    FOREIGN KEY("customer_id") REFERENCES "Customers"("id"),
    FOREIGN KEY("order_id") REFERENCES "Orders"("id")
);

-- Let's try to find the ingredients of the Belgian Dark Chocolate Donut

/*
sqlite> SELECT * FROM "Ingredients" WHERE "id" IN (
(x1...> SELECT "ingredient_id" FROM "Donut_ingredients" WHERE "donut_id" = (
(x2...> SELECT "id" FROM "Donuts" WHERE "name" = 'Belgian Dark Chocolate'));
┌────┬────────────┬───────┐
│ id │    name    │ rate  │
├────┼────────────┼───────┤
│ 1  │ Sugar      │ $2.00 │
│ 2  │ Cocoa      │ $5.00 │
│ 3  │ Flour      │       │
│ 4  │ Buttermilk │       │
└────┴────────────┴───────┘
*/

-- Let's try to find the ingredients of the Back-To-School Sprinkles Donut

/*
sqlite> SELECT * FROM "Ingredients" WHERE "id" IN (
(x1...> SELECT "ingredient_id" FROM "Donut_ingredients" WHERE "donut_id" = (
(x2...> SELECT "id" FROM "Donuts" WHERE "name" = 'Back-To-School Sprinkles'));
┌────┬────────────┬───────┐
│ id │    name    │ rate  │
├────┼────────────┼───────┤
│ 1  │ Sugar      │ $2.00 │
│ 3  │ Flour      │       │
│ 4  │ Buttermilk │       │
│ 5  │ Sprinkles  │       │
└────┴────────────┴───────┘
*/

-- Let's try to find the name of the person who ordered the Belgian Dark Chocolate 

/*
sqlite> SELECT "first_name", "last_name" FROM "Customers" WHERE "id" = (
(x1...> SELECT "customer_id" FROM "Orders" WHERE "donut_id" = (
(x2...> SELECT "id" FROM "Donuts" WHERE "name" = 'Belgian Dark Chocolate'));
┌────────────┬───────────┐
│ first_name │ last_name │
├────────────┼───────────┤
│ Luis       │ Singh     │
└────────────┴───────────┘
*/