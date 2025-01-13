-- Chọn cơ sở dữ liệu
USE kazu_fashion;

-- Tạo bảng kazu_fashion
CREATE TABLE kazu_fashion (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(50),
    price INT,
    stock_quantity INT,
    region VARCHAR(255),
    monthly_revenue BIGINT,
    address VARCHAR(255),
    cities_provinces VARCHAR(255),
    quarter INT,
    year INT,
    `rank` INT
);

