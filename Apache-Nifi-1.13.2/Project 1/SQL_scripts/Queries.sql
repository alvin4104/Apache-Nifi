1. Truy vấn tất cả các sản phẩm

SELECT * FROM Products;
2. Truy vấn các sản phẩm thuộc danh mục 'Shoes'

SELECT * FROM Products
WHERE category = 'Shoes';
3. Truy vấn các sản phẩm có giá trên 1,000,000 và có lượng tồn kho trên 100

SELECT product_id, product_name, price, stock_quantity
FROM Products
WHERE price > 1000000 AND stock_quantity > 100;
4. Truy vấn sản phẩm có doanh thu hàng tháng lớn nhất

SELECT product_id, product_name, monthly_revenue
FROM Products
ORDER BY monthly_revenue DESC
LIMIT 1;
5. Truy vấn sản phẩm theo khu vực 'Southeast'

SELECT * FROM Products
WHERE region = 'Southeast';
6. Truy vấn sản phẩm trong khu vực 'South Mekong Delta' với doanh thu hàng tháng lớn hơn 50,000,000

SELECT product_id, product_name, monthly_revenue
FROM Products
WHERE region = 'South Mekong Delta' AND monthly_revenue > 50000000;
7. Truy vấn sản phẩm có giá trị trong tháng 4 của năm 2024

SELECT product_id, product_name, price, stock_quantity
FROM Products
WHERE year = 2024 AND quarter = 4;
8. Tính tổng doanh thu hàng tháng của tất cả sản phẩm

SELECT SUM(monthly_revenue) AS total_monthly_revenue
FROM Products;
9. Tính tổng lượng sản phẩm trong kho cho mỗi khu vực

SELECT region, SUM(stock_quantity) AS total_stock_quantity
FROM Products
GROUP BY region;
10. Truy vấn các sản phẩm có giá trị thấp nhất (price)

SELECT * FROM Products
WHERE price = (SELECT MIN(price) FROM Products);
11. Truy vấn các sản phẩm có doanh thu hàng tháng cao nhất (monthly_revenue)

SELECT * FROM Products
WHERE monthly_revenue = (SELECT MAX(monthly_revenue) FROM Products);
12. Truy vấn các sản phẩm theo thứ tự giảm dần của giá trị sản phẩm (price)

SELECT product_id, product_name, price
FROM Products
ORDER BY price DESC;
13. Truy vấn sản phẩm với xếp hạng từ 1 đến 5

SELECT * FROM Products
WHERE rank BETWEEN 1 AND 5;
14. Truy vấn sản phẩm có doanh thu hàng tháng trên 100,000,000 và thuộc khu vực 'Southeast'

SELECT product_id, product_name, monthly_revenue, region
FROM Products
WHERE monthly_revenue > 100000000 AND region = 'Southeast';
