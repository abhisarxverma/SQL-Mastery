-- SELECT 
--     "birth_country",
--     ROUND(AVG("height"), 2) AS 'Average Height',
--     ROUND(AVG("weight"), 2) AS 'Average Weight'
-- FROM "players"
-- GROUP BY "birth_country"
-- ORDER BY "height", "weight";

SELECT 
    "birth_country",
    "birth_state",
    "birth_city",
    MAX(strftime("%Y", "final_game") - strftime("%Y", "debut")) AS "Years played"
FROM "players"
GROUP BY "birth_country", "birth_state", "birth_city"
ORDER BY "Years played" DESC

