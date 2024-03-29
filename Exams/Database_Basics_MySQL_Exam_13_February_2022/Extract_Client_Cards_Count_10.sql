CREATE FUNCTION udf_customer_products_count(name VARCHAR(30)) 
RETURNS VARCHAR(50)
DETERMINISTIC 
BEGIN
RETURN 
(SELECT
COUNT(`op`.`product_id`) AS `total_products`
FROM 
`customers` AS `c` 
JOIN `orders` AS `o` ON `c`.`id` = `o`.`customer_id` 
JOIN `orders_products` AS `op` ON `op`.`order_id` = `o`.`id`
WHERE `c`.`first_name` = name);
END

