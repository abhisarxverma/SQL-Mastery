SELECT 
    ROUND(AVG("height"), 2) AS "Average Height",
    ROUND(AVG("weight"), 2) AS "Average Weight"
FROM "players"
WHERE strftime("%Y-%m-%d", "debut") >= '2000-01-01';
