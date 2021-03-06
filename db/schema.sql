DROP DATABASE `products`;
CREATE DATABASE  `products`;
USE `products`;

CREATE TABLE IF NOT EXISTS `Products` (
  `id` integer primary key auto_increment,
  `name` varchar(1000),
  `slogan` varchar(1000),
  `description` varchar(1000),
  `category` varchar(1000),
  `default_price` integer
);

CREATE TABLE IF NOT EXISTS `Styles` (
  `id` integer primary key auto_increment,
  `product_id` integer,
  `name` varchar(1000),
  `sale_price` integer,
  `original_price` integer,
  `default_style` binary
);

ALTER TABLE `Styles` ADD FOREIGN KEY (product_id) REFERENCES `Products` (`id`);

CREATE TABLE IF NOT EXISTS `Features` (
  `id` integer primary key auto_increment,
  `product_id` integer,
  `feature` varchar(1000),
  `value` varchar(1000)
);

ALTER TABLE `Features` ADD FOREIGN KEY (product_id) REFERENCES `Products` (`id`);

CREATE TABLE IF NOT EXISTS `Photos` (
  `id` integer primary key auto_increment,
  `style_id` integer,
  `url` varchar(1000),
  `thumbnail_url` varchar(1000)
);

ALTER TABLE `Photos` ADD FOREIGN KEY (style_id) REFERENCES `Styles` (`id`);


CREATE TABLE IF NOT EXISTS `RelatedProducts` (
  `id` integer primary key auto_increment,
  `product_id` integer,
  `related_id` integer
);

ALTER TABLE `RelatedProducts` ADD FOREIGN KEY (product_id) REFERENCES `Products` (`id`);


CREATE TABLE IF NOT EXISTS `Product_Styles` (
  `id` integer primary key auto_increment,
  `product_id` integer,
  `style_id` integer
);

ALTER TABLE `Product_Styles` ADD FOREIGN KEY (product_id) REFERENCES `Products` (`id`);
ALTER TABLE `Product_Styles` ADD FOREIGN KEY (style_id) REFERENCES `Styles` (`id`);

CREATE TABLE IF NOT EXISTS `Product_Features` (
  `id` integer primary key auto_increment,
  `product_id` integer,
  `feature_id` integer
);

ALTER TABLE `Product_Features` ADD FOREIGN KEY (product_id) REFERENCES `Products` (`id`);
ALTER TABLE `Product_Features` ADD FOREIGN KEY (feature_id) REFERENCES `Features` (`id`);

CREATE TABLE IF NOT EXISTS `Style_Skus` (
  `id` integer primary key auto_increment,
  `style_id` integer,
  `size` varchar(10),
  `quantity` integer
);

ALTER TABLE `Style_Skus` ADD FOREIGN KEY (style_id) REFERENCES `Styles` (`id`);
