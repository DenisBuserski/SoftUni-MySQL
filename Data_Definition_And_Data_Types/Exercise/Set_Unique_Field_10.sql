ALTER TABLE `users`
DROP PRIMARY KEY, 
ADD CONSTRAINT pk_users 
PRIMARY KEY `users`(`id`), 
CHANGE COLUMN `username` `username` VARCHAR(50) UNIQUE;
