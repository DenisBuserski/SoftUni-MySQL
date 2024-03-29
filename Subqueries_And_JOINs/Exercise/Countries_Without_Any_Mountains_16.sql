SELECT 
(COUNT(`c`.`country_name`) - COUNT(`mc`.`country_code`)) AS `country_count`
FROM `countries` AS `c`
LEFT JOIN `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`;
