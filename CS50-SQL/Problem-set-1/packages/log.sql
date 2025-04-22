
-- *** The Lost Letter ***

-- First check if there exist a drop scan of the package that has a congratulatory letter in it

SELECT "action" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
    ) AND "to_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '2 Finnigan Street'
    ) AND 
    "contents" LIKE "%congratulatory%letter%"
);
/*
┌────────┐
│ action │
├────────┤
│ Pick   │
│ Drop   │
└────────┘
*/
-- This means the package is dropped now let's check where it is dropped

SELECT "address" FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
        )
    ) AND "action" = 'Drop'
);
/*
┌───────────────────┐
│      address      │
├───────────────────┤
│ 2 Finnigan Street │
└───────────────────┘
*/

-- So the package is dropped at the 2 Finnigan Street, let's finally check if this is the right destination of the package

SELECT "address" FROM "addresses" WHERE "id" = (
    SELECT "to_address_id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
    ) AND
    "contents" LIKE "congratulatory letter"
);
/*
┌───────────────────┐
│      address      │
├───────────────────┤
│ 2 Finnigan Street │
└───────────────────┘
*/
-- let's get the type of address the lost letter is now
SELECT "type" FROM "addresses" WHERE "address" = '2 Finnigan Street';
/*
┌─────────────┐
│    type     │
├─────────────┤
│ Residential │
└─────────────┘
*/
-- So the Lost Letter is at the Residential address 2 Finnigan Street
-- Yes this is the right destination, to the enquirer - "Sir, your package is delivered successfuly to right house. Thank you!"


-- *** The Devious Delivery ***

-- First let's check the packages with contents related to the duck
SELECT "contents" FROM "packages" WHERE "contents" LIKE '%duck%';
/*
│ Rubber duck   │
│ Rubber duck   │
│ Rubber duck   │
│ Duck debugger │
│ Rubber duck   │
│ Rubber duck   │
│ Rubber duck   │
│ Rubber
*/
-- Among many Rubber duck packages, there is one which had the Duck debugger 
-- this maybe the package that's lost, So let's check if it was dropped or not

SELECT "action" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "contents" = 'Duck debugger'
);
/*
┌────────┐
│ action │
├────────┤
│ Pick   │
│ Drop   │
└────────┘
*/
-- So the package is dropped, let's check where is the package dropped
SELECT "address" FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "contents" = 'Duck debugger'
    )
    AND "action" = 'Drop'
);
/*
┌──────────────────┐
│     address      │
├──────────────────┤
│ 7 Humboldt Place │
└──────────────────┘
*/
-- So the package is delivered to the '7 Humboldt Place' 
-- Let's quickly check if this was the place the package was supposed to be dropped

SELECT "address" FROM "addresses" WHERE "id" = (
    SELECT "to_address_id" FROM "packages" WHERE "contents" = 'Duck debugger'
);
/*
┌───────────────────┐
│      address      │
├───────────────────┤
│ 123 Sesame Street │
└───────────────────┘
*/
-- No, the package is delivered to the wrong house - 7 Humboldt Place
-- let's finally get what type of the address the devious devilery ended up at
SELECT "type" FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "contents" = 'Duck debugger'
    )
);
/*
┌─────────────┐
│    type     │
├─────────────┤
│ Residential │
└─────────────┘
*/
-- FINALLY to the enquirer - 'Very sorry sir, your package is delivered to the wrong Residential location, we will soon get it redelivered to right location 123 Seasame street


-- *** The Forgotten Gift ***

-- Let's see what was the content of the forgotten gift
SELECT "contents" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
);
/*
┌──────────┐
│ contents │
├──────────┤
│ Flowers  │
└──────────┘
*/
-- so the forgotten gift has flowers, now let's check where it is.
-- We have both the From and To address so we can directly check if the package is dropped and if yes where

SELECT "action" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "to_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
    ) AND "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    )
);
/*
┌────────┐
│ action │
├────────┤
│ Pick   │
│ Drop   │
│ Pick   │
└────────┘ */

-- So the package was delivered and picked again, then there can be two cases :-
-- 1 - The package was delivered successfully to 109 Tileston Street and picked up again maybe cause no one collected it
-- 2 - The package was delivered to wrong location and it is collected again to deliver it to right desination 109 Tileston Street

SELECT "address" FROM "addresses" WHERE  "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "to_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
        ) AND "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        ) AND "action" = 'Drop'
    )
);
/*
┌────────────────────────┐
│        address         │
├────────────────────────┤
│ 950 Brannon Harris Way │
└────────────────────────┘
*/
-- so the case 2 happened - package was delivered to the 950 Brannon Harris Way which was not where it was supposed to be
-- Also it was picked again from the 950 Brannon Harris Way, to deliver to the right location 728 Maple Place
-- So the delivery boy has it, let's check which delivery boy has the forgotten gift

SELECT "name" FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        ) AND "to_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
        )
    ) AND "action" = 'Drop'
);
/*
┌────────┐
│  name  │
├────────┤
│ Maegan │
└────────┘
*/

-- So the Driver named Maegan has the forgotten gift for now and will deliver it to the 729 Maple Place son
-- TO THE WORRIED CUSTOMER - "Very sorry Sir, your gift package was misdelivered to 950 Brannon Harris Way, but I am happy to say that driver Maegan has collected it again to deliver to 728 Maple Place, at your daughter's house."