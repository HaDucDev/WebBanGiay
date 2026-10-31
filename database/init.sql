-- Schema for the current Servlet/JSP application, MySQL 5.7/8.0.
-- Run against a NEW database. This is not a migration of Web_Ban_Giay.sql.
-- Existing data is not dropped or overwritten by this script.
CREATE DATABASE IF NOT EXISTS `Web_Ban_Giay`
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `Web_Ban_Giay`;
SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS `category` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(100) DEFAULT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_category_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `user` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `fullname` VARCHAR(255) DEFAULT NULL,
    `avatar` VARCHAR(1024) DEFAULT NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `address` VARCHAR(500) DEFAULT NULL,
    `phone` VARCHAR(30) DEFAULT NULL,
    `createdate` VARCHAR(32) DEFAULT NULL,
    `role` VARCHAR(20) NOT NULL DEFAULT 'user',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `promotion` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(100) DEFAULT NULL,
    `name` VARCHAR(255) DEFAULT NULL,
    `percent` INT NOT NULL DEFAULT 0,
    `img` VARCHAR(1024) DEFAULT NULL,
    `alt_img` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dates remain strings because the current controllers send dd-mm-yyyy text.
-- Prices remain integers because checkout uses Integer.parseInt(...).
CREATE TABLE IF NOT EXISTS `product` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `price` INT UNSIGNED NOT NULL DEFAULT 0,
    `thumbnail` VARCHAR(1024) DEFAULT NULL,
    `description` TEXT,
    `promotion` VARCHAR(100) DEFAULT NULL,
    `category` INT NOT NULL,
    `createdate` VARCHAR(32) DEFAULT NULL,
    `type` VARCHAR(50) NOT NULL DEFAULT '',
    PRIMARY KEY (`id`),
    KEY `idx_product_category` (`category`),
    CONSTRAINT `fk_product_category` FOREIGN KEY (`category`)
        REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `cart` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `u_id` INT NOT NULL,
    `buydate` VARCHAR(32) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_cart_user` (`u_id`),
    CONSTRAINT `fk_cart_user` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `cartitem` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `cart_id` INT NOT NULL,
    `pro_id` INT NOT NULL,
    `quantity` INT NOT NULL DEFAULT 1,
    `price` INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `idx_cartitem_cart` (`cart_id`),
    KEY `idx_cartitem_product` (`pro_id`),
    CONSTRAINT `fk_cartitem_cart` FOREIGN KEY (`cart_id`)
        REFERENCES `cart` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_cartitem_product` FOREIGN KEY (`pro_id`)
        REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `contact` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) DEFAULT NULL,
    `email` VARCHAR(255) DEFAULT NULL,
    `phone` VARCHAR(30) DEFAULT NULL,
    `title` VARCHAR(255) DEFAULT NULL,
    `message` TEXT,
    `createByUser` VARCHAR(255) DEFAULT NULL,
    `createByDate` VARCHAR(32) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Development/demo data only. The current login compares plain-text passwords.
INSERT IGNORE INTO `category` (`id`, `code`, `name`) VALUES
    (1, 'giay-nam', 'Giày nam'),
    (2, 'giay-nu', 'Giày nữ'),
    (3, 'giay-tre-em', 'Giày trẻ em');

INSERT IGNORE INTO `user` (`id`, `fullname`, `username`, `password`, `role`) VALUES
    (1, 'Quản trị mẫu', 'admin', 'admin123', 'admin'),
    (2, 'Khách hàng mẫu', 'user', 'user123', 'user');

INSERT IGNORE INTO `promotion` (`id`, `code`, `name`, `percent`, `alt_img`) VALUES
    (1, 'WELCOME', 'Ưu đãi chào mừng', 10, 'Ưu đãi mẫu');

INSERT IGNORE INTO `product`
    (`id`, `name`, `price`, `thumbnail`, `description`, `promotion`, `category`, `createdate`, `type`)
VALUES
    (1, 'Giày thể thao nam', 350000, 'assets/user/images/shop/product9.jpg',
        'Sản phẩm mẫu cho giày nam', '10', 1, '31-10-2026', 'topproduct'),
    (2, 'Giày thể thao nữ', 300000, 'assets/user/images/shop/product8.jpg',
        'Sản phẩm mẫu cho giày nữ', '0', 2, '31-10-2026', 'new product'),
    (3, 'Giày trẻ em', 200000, 'assets/user/images/shop/product7.jpg',
        'Sản phẩm mẫu cho trẻ em', '0', 3, '31-10-2026', 'new product');
