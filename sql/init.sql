DROP DATABASE IF EXISTS `fake-stor-db`;

CREATE DATABASE `fake-stor-db`;

USE `fake-stor-db`;


CREATE TABLE `Order` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `User` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NOT NULL AUTO_INCREMENT,
	`last_name` varchar(255) NOT NULL AUTO_INCREMENT,
	`email` varchar(255) NOT NULL AUTO_INCREMENT,
	`password` varchar(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Product` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL AUTO_INCREMENT,
	`price` FLOAT(255) NOT NULL AUTO_INCREMENT,
	`description` TEXT(1000) NOT NULL AUTO_INCREMENT,
	`category` varchar(255) NOT NULL AUTO_INCREMENT,
	`image` TEXT(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Cart` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Order_Product` (
	`id` INT NOT NULL,
	`order_id` INT NOT NULL AUTO_INCREMENT,
	`product_id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Cart_Product` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`product_id` INT NOT NULL AUTO_INCREMENT,
	`cart_id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Cart` ADD CONSTRAINT `Cart_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Order_Product` ADD CONSTRAINT `Order_Product_fk0` FOREIGN KEY (`order_id`) REFERENCES `Order`(`id`);

ALTER TABLE `Order_Product` ADD CONSTRAINT `Order_Product_fk1` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`);

ALTER TABLE `Cart_Product` ADD CONSTRAINT `Cart_Product_fk0` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`);

ALTER TABLE `Cart_Product` ADD CONSTRAINT `Cart_Product_fk1` FOREIGN KEY (`cart_id`) REFERENCES `Cart`(`id`);

SET FOREIGN_KEY_CHECKS = 0; 




