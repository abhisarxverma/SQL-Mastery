SELECT 
    strftime('%Y', air_date) as 'year',
    MIN("air_date") as 'first-date'
FROM "episodes"
GROUP BY "year";