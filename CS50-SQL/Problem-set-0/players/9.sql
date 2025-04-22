SELECT "first_name", "last_name" FROM "players"
WHERE strftime("%Y", "final_game") = '2000'
ORDER BY "first_name", "last_name";