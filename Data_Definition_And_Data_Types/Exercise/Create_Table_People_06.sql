CREATE TABLE `people` (
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
`picture` BLOB,
`height` DOUBLE(10 , 2 ),
`weight` DOUBLE(10 , 2 ),
`gender` CHAR(1) NOT NULL,
`birthdate` DATE NOT NULL,
`biography` TEXT,
PRIMARY KEY (`id`)
);

INSERT INTO `people` (`name`, `gender`, `birthdate`)
VALUES 
('Denis', 'M', DATE(NOW())),
('Ivan', 'M', DATE(NOW())),
('Petar', 'M', DATE(NOW())),
('Asen', 'M', DATE(NOW())),
('Alex', 'G', DATE(NOW()));
