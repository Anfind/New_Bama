-- BaloShop Database Schema
-- MySQL Database Creation Script

CREATE DATABASE IF NOT EXISTS baloshop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE baloshop;

-- Drop tables if they exist (for recreation)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

-- Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role VARCHAR(20) DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    image VARCHAR(255),
    category VARCHAR(50),
    brand VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Cart items table
CREATE TABLE cart_items (
    cart_item_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_product (user_id, product_id)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    shipping_address TEXT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Order items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Insert sample data
-- Sample users
INSERT INTO users (username, password, email, full_name, phone, address, role) VALUES
('admin', 'admin123', 'admin@baloshop.com', 'Administrator', '0123456789', '123 Admin Street', 'admin'),
('user1', 'user123', 'user1@example.com', 'Nguyễn Văn A', '0987654321', '456 User Avenue', 'customer'),
('user2', 'user123', 'user2@example.com', 'Trần Thị B', '0912345678', '789 Customer Road', 'customer');

-- Sample products
INSERT INTO products (name, description, price, stock, image, category, brand) VALUES
('Balo Laptop Dell Essential 15.6"', 'Balo laptop Dell thiết kế đơn giản, chuyên nghiệp, phù hợp cho công sở và học tập. Có ngăn đựng laptop riêng biệt, an toàn và tiện lợi.', 599000, 50, 'balo-dell-essential.jpg', 'laptop', 'Dell'),

('Balo Học Sinh Nike Classic', 'Balo học sinh Nike với thiết kế trẻ trung, năng động. Chất liệu polyester bền bỉ, nhiều ngăn tiện dụng, phù hợp cho học sinh, sinh viên.', 750000, 30, 'balo-nike-classic.jpg', 'school', 'Nike'),

('Balo Du Lịch The North Face Jester', 'Balo du lịch The North Face với dung tích lớn, thiết kế ergonomic thoải mái. Chất liệu chống nước, phù hợp cho các chuyến đi dài ngày.', 1200000, 25, 'balo-tnf-jester.jpg', 'travel', 'The North Face'),

('Balo Công Sở Samsonite Business', 'Balo công sở Samsonite cao cấp, thiết kế sang trọng, chuyên nghiệp. Có ngăn laptop, tài liệu riêng biệt, phù hợp cho doanh nhân.', 1800000, 20, 'balo-samsonite-business.jpg', 'business', 'Samsonite'),

('Balo Thể Thao Adidas Performance', 'Balo thể thao Adidas với thiết kế năng động, chất liệu thoáng khí. Có ngăn đựng giày riêng, phù hợp cho tập luyện và thể thao.', 850000, 40, 'balo-adidas-performance.jpg', 'sport', 'Adidas'),

('Balo Laptop HP Prelude Pro 15.6"', 'Balo laptop HP thiết kế hiện đại, bảo vệ laptop tối ưu. Chất liệu cao cấp, nhiều ngăn tiện ích, phù hợp cho công việc và học tập.', 680000, 35, 'balo-hp-prelude.jpg', 'laptop', 'HP'),

('Balo Học Sinh Converse All Star', 'Balo học sinh Converse phong cách street style, thiết kế iconic. Chất liệu canvas bền đẹp, phù hợp cho giới trẻ năng động.', 550000, 45, 'balo-converse-allstar.jpg', 'school', 'Converse'),

('Balo Du Lịch Osprey Farpoint 40L', 'Balo du lịch Osprey dung tích 40L, thiết kế chuyên nghiệp cho backpacker. Có khung nội bộ, đai hông thoải mái cho chuyến đi dài.', 2500000, 15, 'balo-osprey-farpoint.jpg', 'travel', 'Osprey'),

('Balo Công Sở Targus City Smart', 'Balo công sở Targus thiết kế thông minh, có ngăn sạc USB tích hợp. Chất liệu chống thấm, phù hợp cho cuộc sống hiện đại.', 950000, 28, 'balo-targus-smart.jpg', 'business', 'Targus'),

('Balo Thể Thao Under Armour Storm', 'Balo thể thao Under Armour với công nghệ Storm chống nước. Thiết kế ergonomic, phù hợp cho hoạt động thể thao và outdoor.', 1100000, 32, 'balo-ua-storm.jpg', 'sport', 'Under Armour'),

('Balo Laptop Asus ROG Gaming', 'Balo laptop gaming Asus ROG thiết kế hầm hố, phù hợp cho game thủ. Có ngăn đựng laptop gaming riêng, chất liệu cao cấp bền bỉ.', 1350000, 22, 'balo-asus-rog.jpg', 'laptop', 'Asus'),

('Balo Học Sinh Jansport SuperBreak', 'Balo học sinh Jansport classic, thiết kế đơn giản bền đẹp. Được tin dùng hàng thập kỷ, phù hợp cho mọi lứa tuổi học sinh.', 650000, 55, 'balo-jansport-superbreak.jpg', 'school', 'Jansport'),

('Balo Du Lịch Deuter Futura 32L', 'Balo du lịch Deuter với hệ thống lưng Aircomfort thoáng khí. Thiết kế chuyên nghiệp cho trekking và hiking, chất lượng Đức.', 2200000, 18, 'balo-deuter-futura.jpg', 'travel', 'Deuter'),

('Balo Công Sở Bellroy Transit', 'Balo công sở Bellroy thiết kế tinh tế, chất liệu da cao cấp. Có ngăn laptop, tài liệu được bố trí khoa học, phong cách minimalist.', 2800000, 12, 'balo-bellroy-transit.jpg', 'business', 'Bellroy'),

('Balo Thể Thao Puma Deck', 'Balo thể thao Puma thiết kế trẻ trung, năng động. Chất liệu polyester bền bỉ, nhiều ngăn tiện ích, phù hợp cho tập luyện hàng ngày.', 720000, 38, 'balo-puma-deck.jpg', 'sport', 'Puma');

-- Sample orders (for demonstration)
INSERT INTO orders (user_id, total_amount, status, shipping_address, payment_method) VALUES
(2, 599000, 'delivered', '456 User Avenue, Q1, TP.HCM', 'cod'),
(2, 1350000, 'shipped', '456 User Avenue, Q1, TP.HCM', 'bank'),
(3, 750000, 'processing', '789 Customer Road, Q3, TP.HCM', 'momo');

-- Sample order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 599000),
(2, 11, 1, 1350000),
(3, 2, 1, 750000);

-- Create indexes for better performance
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_products_name ON products(name);
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_cart_items_user_id ON cart_items(user_id);

-- Show tables
SHOW TABLES;

-- Show sample data
SELECT 'Users:' as Info;
SELECT user_id, username, full_name, email, role FROM users;

SELECT 'Products:' as Info;
SELECT product_id, name, price, stock, category, brand FROM products LIMIT 5;

SELECT 'Sample complete!' as Status;
