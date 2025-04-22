SELECT COUNT("first_name") AS 'Opposite hands bats and throws' FROM "players"
WHERE ("bats" = 'L' AND "throws" = 'R' ) OR ("bats" = 'R' AND "throws" = 'L');