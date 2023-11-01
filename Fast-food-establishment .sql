CREATE DATABASE Fastfood;
USE Fastfood;

CREATE TABLE `employee` (
	`employee_id` INT NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`position` varchar(15) NOT NULL,
	`employment_date` DATE NOT NULL,
	`rate` FLOAT NOT NULL,
	`bonus` FLOAT,
	`institution_id` INT,
	`manager_id` INT,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE `institution` (
	`institution_id` INT NOT NULL,
	`institution_name` varchar(30) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(40) NOT NULL,
	`building_namber` INT(3) NOT NULL,
	PRIMARY KEY (`institution_id`)
);

CREATE TABLE `product` (
	`product_id` INT NOT NULL,
	`product_name` varchar(40) NOT NULL,
	`product_description` varchar(150) NOT NULL,
	`category` varchar(15) NOT NULL,
	`price` FLOAT NOT NULL,
	`employee_id` INT NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `Customer` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`birt_date` DATE NOT NULL,
	`phone_number` INT(12) ,
	`discount` INT(2),
	`card_number` INT NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `orders` (
	`orders_id` INT NOT NULL,
	`employee_id` INT NOT NULL,
	`transaction_type` INT NOT NULL,
	`product_id` INT NOT NULL,
	`customer_id` INT,
	`transaction_moment` DATETIME NOT NULL,
	`summ` FLOAT NOT NULL,
	`delivery_id` INT,
	`discount` INT,
	PRIMARY KEY (`orders_id`)
);

CREATE TABLE `delivery` (
	`delivery_id` INT NOT NULL AUTO_INCREMENT,
	`city` varchar (30) NOT NULL,
	`street` varchar (30) NOT NULL,
	`building_number` INT NOT NULL,
	`shipping_price` INT NOT NULL DEFAULT '100',
	PRIMARY KEY (`delivery_id`)
);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk0` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`institution_id`);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk1` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `product` ADD CONSTRAINT `product_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk3` FOREIGN KEY (`delivery_id`) REFERENCES `delivery`(`delivery_id`);







