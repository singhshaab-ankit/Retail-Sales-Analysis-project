Use superstore_db;
SELECT * FROM superstore;

-- Modify  the col names then update.
ALTER TABLE superstore
MODIFY COLUMN order_date DATE,
MODIFY COLUMN ship_date DATE;

-- update the order date and ship date format 
-- Disable safe update mode for this session
SET SQL_SAFE_UPDATES = 0;
Update superstore 
	SET order_date=DATE(order_date),
		ship_date=DATE(ship_date);

# Total Sales by Region and 
select region, month(order_date) as Month, round(SUM(sales), 2) as Total_Sales
from superstore
group by region, month
order by month ASC, region;

# TOP 10 Products by Sales
SELECT product_name, round(SUM(SALES),2) AS Total_Sales
FROM superstore
group by product_name
order by Total_Sales desc
limit 10;

#  Profit vs. Discount Correlation
SELECT discount, round(AVG(profit),2) AS avg_profit
FROM superstore
GROUP BY discount
ORDER BY discount;

# Sales by Category and Sub-Category
SELECT category, `sub-category`, round(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY category, `sub-category`
ORDER BY total_sales DESC;

# Most Profitable Customers
SELECT customer_name, round(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;

# Sales Analysis
SELECT MONTH(order_date) AS month, YEAR(order_date) AS year, round(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY year, month
ORDER BY year DESC, month ASC;

# Sales with Region
SELECT region, round(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

# Profit Per Customer Segment
SELECT segment, round(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC;


# Customer Segmentation by Purchase Quantity
SELECT segment, round(AVG(quantity),2) AS avg_quantity_purchased
FROM superstore
GROUP BY segment
ORDER BY avg_quantity_purchased DESC;

# Sales Distribution by Ship Mode
SELECT ship_mode, round(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;

# Customer Preference for Ship Mode
SELECT ship_mode, COUNT(*) AS order_count
FROM superstore
GROUP BY ship_mode
ORDER BY order_count DESC;