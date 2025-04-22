SELECT COUNT("english_title") AS "Fuji in english title" FROM "views"
WHERE "artist" = 'Hokusai' AND "english_title" LIKE "%Fuji%";