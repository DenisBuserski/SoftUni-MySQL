SELECT 
`mc`.`country_code`,
COUNT(`m`.`mountain_range`) AS `mountain_range`
FROM `mountains_countries` AS `mc`
JOIN `mountains` AS `m` ON `mc`.`mountain_id` = `m`.`id`
WHERE
`mc`.`country_code` = 'BG'
OR `mc`.`country_code` = 'US'
OR `mc`.`country_code` = 'RU'
GROUP BY `mc`.`country_code`
ORDER BY `mountain_range` DESC;
