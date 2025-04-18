-- Gives total prints, average contrast, average brightness, average entropy of the prints of both the artist.
SELECT 
    "artist",
    COUNT("englist_title") AS 'Total Prints',
    ROUND(AVG("contrast"), 2) AS 'Average Contrast',
    ROUND(AVG("brightness"), 2) AS 'Average Brightness',
    ROUND(AVG("entropy"), 2) AS 'Average Entropy'
FROM "views"
GROUP BY "artist";
