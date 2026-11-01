-- Canonical database for the Servlet/JSP application (MySQL 8.0).
-- English/USD fashion store: legacy footwear plus products matched to local photos.
-- Initialize a NEW/EMPTY database. This file is not an upgrade of an existing schema.
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
-- USD amounts retain cents in both product prices and order line totals.
CREATE TABLE IF NOT EXISTS `product` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `price` DECIMAL(12,2) UNSIGNED NOT NULL DEFAULT 0.00,
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
    `price` DECIMAL(12,2) UNSIGNED NOT NULL DEFAULT 0.00,
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


INSERT IGNORE INTO `category` (`id`, `code`, `name`) VALUES
    (1, 'giay-nam', 'Men''s Shoes'),
    (2, 'giay-nu', 'Women''s Shoes'),
    (3, 'giay-tre-em', 'Kids'' Shoes'),
    (4, 'dresses', 'Dresses'),
    (5, 'womens-tops', 'Women''s Tops'),
    (6, 'mens-tops', 'Men''s Tops'),
    (7, 'womens-trousers', 'Women''s Trousers'),
    (8, 'mens-trousers', 'Men''s Trousers & Shorts'),
    (9, 'jeans', 'Jeans'),
    (10, 'skirts', 'Skirts'),
    (11, 'costumes', 'Costumes');

-- Keep the three legacy shoe codes; all categories are loaded dynamically by code.

-- Local demo credentials. Legacy accounts have no declared customer relationship.
INSERT IGNORE INTO `user` (`id`, `fullname`, `username`, `password`, `role`) VALUES
    (1, 'Demo Administrator', 'admin', 'admin123', 'admin'),
    (2, 'Demo Customer', 'user', 'user123', 'user'),
    (101, 'AN', 'AN', '123456', 'user'),
    (102, 'BINH', 'BINH', '43543', 'user'),
    (103, 'CHUNG', 'CHUNG', '3420535', 'user'),
    (104, 'DAN', 'DAN', '357325', 'user'),
    (105, 'EMERSON', 'EMERSON', '37535', 'user'),
    (106, 'FLOCOTA', 'FLOCOTA', '57363', 'user'),
    (107, 'GARA', 'GARA', '3224', 'user'),
    (108, 'HUYEN', 'HUYEN', '3753572', 'user'),
    (109, 'YURI', 'YURI', '876925', 'user'),
    (110, 'KAIDO', 'KAIDO', '523535', 'user');

-- KM1..KM10 become integer IDs 1..10; percentage signs are removed.
INSERT IGNORE INTO `promotion` (`id`, `code`, `name`, `percent`, `img`, `alt_img`) VALUES
    (1, 'ABC1', 'Hot Deal 1', 10, 'images/image1.jpg', 'Shoe illustration'),
    (2, 'ABC2', 'Hot Deal 2', 20, 'images/image1.jpg', 'Shoe illustration'),
    (3, 'ABC3', 'Hot Deal 3', 30, 'images/image1.jpg', 'Shoe illustration'),
    (4, 'ABC4', 'Hot Deal 4', 40, 'images/image1.jpg', 'Shoe illustration'),
    (5, 'ABC5', 'Hot Deal 5', 50, 'images/image1.jpg', 'Shoe illustration'),
    (6, 'ABC6', 'Hot Deal 6', 60, 'images/image1.jpg', 'Shoe illustration'),
    (7, 'ABC7', 'Hot Deal 7', 70, 'images/image1.jpg', 'Shoe illustration'),
    (8, 'ABC8', 'Hot Deal 8', 80, 'images/image1.jpg', 'Shoe illustration'),
    (9, 'ABC9', 'Hot Deal 9', 90, 'images/image1.jpg', 'Shoe illustration'),
    (10, 'ABC10', 'Hot Deal 10', 100, 'images/image1.jpg', 'Shoe illustration');
-- SP1..SP9 become IDs 1..9; LH1..LH3 become category IDs 1..3.
-- Original numeric prices are preserved as USD, e.g. 9.8 becomes 9.80.
-- Two footwear images illustrate SP1/SP3; seven legacy shoes await suitable photos.
-- IDs 10..46 are demo clothing products named after the actual local photographs.
-- Added prices are sample USD amounts, not converted VND or live market prices.
INSERT IGNORE INTO `product`
    (`id`, `name`, `price`, `thumbnail`, `description`, `promotion`, `category`, `createdate`, `type`)
VALUES
    (1, 'Men''s Air-Cushioned Trainers', 14.00, 'images/image1.jpg',
        'Air-cushioned sports shoes for men. Trainer photo is illustrative.', '10', 1, '01-11-2026', 'topproduct'),
    (2, 'Men''s Leather Slip-On Loafers', 9.80, NULL,
        'Leather slip-on shoes with rubber soles. Product photo coming soon.', '20', 1, '01-11-2026', 'new product'),
    (3, 'UDANY Men''s Premium Leather Shoes', 34.80, 'images/reference/userTu/images/3.jpg',
        'UDANY leather shoes for men. Leather-shoe banner is illustrative, not an exact product photograph.', '30', 1, '01-11-2026', 'topproduct'),
    (4, 'Women''s Mesh Sneakers', 186.00, NULL,
        'Mesh sneakers with three-color soles. Product photo coming soon.', '20', 2, '01-11-2026', 'new product'),
    (5, 'SODOHA Women''s Office Shoes', 42.40, NULL,
        'SODOHA shoes for office wear. Product photo coming soon.', '30', 2, '01-11-2026', ''),
    (6, 'Women''s Pointed-Toe Flats', 7.70, NULL,
        'Pointed-toe flats for women. Product photo coming soon.', '20', 2, '01-11-2026', 'new product'),
    (7, 'Biti''s Kids'' Woven-Strap Trainers', 42.40, NULL,
        'Biti''s woven-strap sports shoes for kids. Product photo coming soon.', '20', 3, '01-11-2026', ''),
    (8, 'CrownUK Kids'' Low-Top Sneakers', 16.80, NULL,
        'CrownUK low-top sneakers for boys and girls. Product photo coming soon.', '20', 3, '01-11-2026', 'new product'),
    (9, 'Crown Space Girls'' Ballet Flats', 16.80, NULL,
        'Crown Space flats for school and everyday wear. Product photo coming soon.', '40', 3, '01-11-2026', ''),
    (10, 'White Strapless Party Dress', 49.90, 'assets/user/images/shop/product7.jpg',
        'A white strapless short dress for party outfits. Dress only; accessories are not included.', '0', 4, '01-11-2026', 'topproduct'),
    (11, 'Red Floral Cheongsam', 59.90, 'assets/user/images/shop/product9.jpg',
        'A red floral cheongsam with a high neckline. Dress only.', '0', 4, '01-11-2026', 'topproduct'),
    (12, 'Pink Bunny Costume', 34.90, 'assets/user/images/shop/product8.jpg',
        'A pink and white bunny-themed costume shown with matching ears.', '0', 11, '01-11-2026', 'new product'),
    (13, 'Navy Open-Front Cardigan', 29.90, 'assets/user/images/home/product1.jpg',
        'A navy open-front cardigan layered over a teal top. Cardigan only.', '0', 5, '01-11-2026', 'new product'),
    (14, 'Men''s Color-Block Polo Shirt', 24.90, 'assets/user/images/home/product2.jpg',
        'A green, white and navy color-block polo shirt. Polo shirt only.', '0', 6, '01-11-2026', 'new product'),
    (15, 'Black Sleeveless Dress', 39.90, 'assets/user/images/home/product3.jpg',
        'A fitted black sleeveless dress. Dress only; accessories are not included.', '0', 4, '01-11-2026', 'topproduct'),
    (16, 'Royal Blue Long-Sleeve Top', 22.90, 'assets/user/images/home/product5.jpg',
        'A royal blue long-sleeve top for everyday outfits. Top only.', '0', 5, '01-11-2026', 'new product'),
    (17, 'White V-Neck T-Shirt', 12.90, 'assets/user/images/home/product6.jpg',
        'A plain white short-sleeve V-neck T-shirt. T-shirt only.', '0', 5, '01-11-2026', 'new product'),
    (18, 'Taupe Sleeveless Top', 18.90, 'assets/user/images/shop/product10.jpg',
        'A taupe sleeveless top styled with jeans. Top only.', '0', 5, '01-11-2026', ''),
    (19, 'Men''s Blue Polo Shirt', 24.90, 'assets/user/images/shop/product12.jpg',
        'A blue short-sleeve polo shirt for casual outfits. Polo shirt only.', '0', 6, '01-11-2026', 'topproduct'),
    (20, 'Pink Printed Palazzo Trousers', 29.90, 'images/reference/userTu/images/pi.png',
        'Pink printed wide-leg trousers. Trousers only.', '0', 7, '01-11-2026', 'new product'),
    (21, 'Black and White Geometric Trousers', 28.90, 'images/reference/userTu/images/pi1.png',
        'Relaxed trousers with a black and white geometric print. Trousers only.', '0', 7, '01-11-2026', ''),
    (22, 'Red Polka-Dot Trousers', 26.90, 'images/reference/userTu/images/pi2.png',
        'Red tapered trousers with a small white dot pattern. Trousers only.', '0', 7, '01-11-2026', ''),
    (23, 'Red Maxi Skirt', 32.90, 'images/reference/userTu/images/pi3.png',
        'A flowing red full-length skirt. Skirt only.', '0', 10, '01-11-2026', 'topproduct'),
    (24, 'Plum Relaxed Joggers', 27.90, 'images/reference/userTu/images/si.jpg',
        'Relaxed plum trousers with tapered ankles. Trousers only.', '0', 7, '01-11-2026', 'topproduct'),
    (25, 'Blue and White Wide-Leg Trousers', 29.90, 'images/reference/userTu/images/pi5.png',
        'Blue and white patterned wide-leg cropped trousers. Trousers only.', '0', 7, '01-11-2026', ''),
    (26, 'Pastel Printed Trousers', 25.90, 'images/reference/userTu/images/pi6.png',
        'Relaxed trousers with a pastel multicolor pattern. Trousers only.', '0', 7, '01-11-2026', ''),
    (27, 'Light-Wash Skinny Jeans', 34.90, 'images/reference/userTu/images/pi7.png',
        'Light blue skinny jeans with turned-up hems. Jeans only.', '0', 9, '01-11-2026', 'topproduct'),
    (28, 'Black Wide-Leg Trousers', 32.90, 'images/reference/userTu/images/pi8.png',
        'Black full-length wide-leg trousers. Trousers only.', '0', 7, '01-11-2026', ''),
    (29, 'Men''s Charcoal Trousers', 39.90, 'images/reference/userTu/images/pi9.png',
        'Charcoal tailored trousers for smart outfits. Trousers only.', '0', 8, '01-11-2026', 'topproduct'),
    (30, 'Navy Slim Trousers', 31.90, 'images/reference/userTu/images/pi10.png',
        'Navy slim-cut ankle-length trousers. Trousers only.', '0', 7, '01-11-2026', ''),
    (31, 'Black Ankle Trousers', 29.90, 'images/reference/userTu/images/pi11.png',
        'Black slim ankle trousers. Trousers only.', '0', 7, '01-11-2026', ''),
    (32, 'Men''s Light Grey Trousers', 37.90, 'images/reference/userTu/images/pi12.png',
        'Light grey trousers for everyday smart dressing. Trousers only.', '0', 8, '01-11-2026', 'new product'),
    (33, 'Navy Maxi Dress', 44.90, 'images/reference/userTu/images/ce.jpg',
        'A navy long-sleeve maxi dress. Dress only.', '0', 4, '01-11-2026', ''),
    (34, 'Red Sleeveless Dress', 36.90, 'images/reference/userTu/images/ce1.jpg',
        'A fitted red sleeveless dress. Dress only.', '0', 4, '01-11-2026', ''),
    (35, 'Floral Shift Dress', 32.90, 'images/reference/userTu/images/ce2.jpg',
        'A light floral shift dress. Dress only; the outer layer is not included.', '0', 4, '01-11-2026', ''),
    (36, 'Men''s Black Crew-Neck T-Shirt', 16.90, 'images/reference/userTu/images/pr.jpg',
        'A plain black short-sleeve T-shirt. T-shirt only.', '0', 6, '01-11-2026', ''),
    (37, 'Men''s Red Graphic T-Shirt', 18.90, 'images/reference/userTu/images/pr2.jpg',
        'A red short-sleeve T-shirt with a front graphic. T-shirt only.', '0', 6, '01-11-2026', ''),
    (38, 'Teal Double-Breasted Tunic', 39.90, 'images/reference/userTu/images/pr3.jpg',
        'A teal long-sleeve double-breasted tunic. Tunic only.', '0', 5, '01-11-2026', ''),
    (39, 'Multicolor Striped Trousers', 28.90, 'images/reference/userTu/images/t1.jpg',
        'Wide-leg trousers with colorful vertical stripes. Trousers only.', '0', 7, '01-11-2026', ''),
    (40, 'Men''s Camouflage Cargo Shorts', 29.90, 'images/reference/userTu/images/t2.jpg',
        'Dark camouflage cargo shorts. Shorts only.', '0', 8, '01-11-2026', ''),
    (41, 'Men''s Tan Cargo Shorts', 27.90, 'images/reference/userTu/images/t3.jpg',
        'Tan cargo shorts with side pockets. Shorts only.', '0', 8, '01-11-2026', ''),
    (42, 'Men''s Cream Chinos', 34.90, 'images/reference/userTu/images/t5.jpg',
        'Cream straight-leg chinos. Trousers only.', '0', 8, '01-11-2026', ''),
    (43, 'Men''s Sand Chinos', 34.90, 'images/reference/userTu/images/t6.jpg',
        'Sand-colored casual chinos. Trousers only.', '0', 8, '01-11-2026', ''),
    (44, 'Cream Printed Cropped Trousers', 26.90, 'images/reference/userTu/images/t10.jpg',
        'Cream cropped trousers with a small dark print. Trousers only.', '0', 7, '01-11-2026', ''),
    (45, 'Indigo Skinny Jeans', 34.90, 'images/reference/userTu/images/t11.jpg',
        'Dark indigo skinny jeans. Jeans only.', '0', 9, '01-11-2026', 'new product'),
    (46, 'Black Cap-Sleeve Dress', 42.90, 'assets/user/images/product-details/1.jpg',
        'A black cap-sleeve dress with front buttons. Dress only; shopping bags are not included.', '0', 4, '01-11-2026', 'new product');
