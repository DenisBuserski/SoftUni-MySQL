CREATE TABLE `logs` (
`log_id` INT PRIMARY KEY AUTO_INCREMENT,
`account_id` INT NOT NULL,
`old_sum` DECIMAL(19 , 4 ) NOT NULL,
`new_sum` DECIMAL(19 , 4 ) NOT NULL
);


CREATE TRIGGER trigger_balance_update
AFTER UPDATE ON `accounts`
FOR EACH ROW
BEGIN
IF OLD.balance <> NEW.balance 
   THEN INSERT INTO `logs`(account_id, old_sum, new_sum) 
        VALUES (OLD.id, OLD.balance, NEW.balance);
END IF;
END;


CREATE TABLE `notification_emails` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`recipient` INT NOT NULL,
`subject` VARCHAR(60) NOT NULL,
`body` VARCHAR(255) NOT NULL
);


CREATE TRIGGER trigger_notifications_emails
AFTER INSERT ON `logs`
FOR EACH ROW
BEGIN
INSERT INTO `notification_emails`(`recipient`, `subject`, `body`)
VALUES(
NEW.account_id,
CONCAT('Balance change for account: ', NEW.account_id),
CONCAT('On ', DATE_FORMAT(NOW(), '%b %d %Y at %r'), ' your balance was changed from ', ROUND(NEW.old_sum,2), ' to ', ROUND(NEW.new_sum,2), '.'));
END;
