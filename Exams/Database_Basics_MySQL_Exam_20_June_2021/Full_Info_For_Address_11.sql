CREATE PROCEDURE udp_courses_by_address (address_name VARCHAR(100))
BEGIN
SELECT
`a`.`name`,
`cl`.`full_name`,
(CASE
WHEN `co`.`bill` <= 20 THEN 'Low'
WHEN `co`.`bill` <= 30 THEN 'Medium'
ELSE 'High'
END) AS `level_of_bill`,
`c`.`make`,
`c`.`condition`,
`ca`.`name` AS `cat_name`
FROM `addresses` AS `a`
LEFT JOIN `courses` AS `co` ON `a`.`id` = `co`.`from_address_id`
LEFT JOIN `clients` AS `cl` ON `co`.`client_id` = `cl`.`id`
LEFT JOIN `cars` AS `c` ON `c`.`id` = `co`.`car_id`
LEFT JOIN `categories` AS `ca` ON `ca`.`id` = `c`.`category_id`
WHERE `a`.`name` = address_name
ORDER BY 
`c`.`make`,
`cl`.`full_name`;
END