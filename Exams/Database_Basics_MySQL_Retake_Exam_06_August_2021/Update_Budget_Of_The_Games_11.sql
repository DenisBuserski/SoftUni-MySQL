CREATE PROCEDURE udp_update_budget(min_game_rating FLOAT) 
BEGIN
UPDATE `games`
SET 
`budget` = `budget` + 100000,
`release_date` = DATE_ADD(`release_date`, INTERVAL 1 YEAR)
WHERE
`release_date` IS NOT NULL 
AND `id` NOT IN (SELECT `game_id` FROM `games_categories`) 
AND `rating` > min_game_rating;
END
