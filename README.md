🛍️ Superstore Retail Sales Analysis

This project presents an end-to-end data analysis on the "Superstore" dataset using both Python and SQL.
The objective is to derive insights on sales, customer behavior, profitability, and shipping patterns.

📁 Project Structure

Superstore-Retail-Analysis/

├── data/

│   ├── Superstore.csv

│   └── Superstore_working.csv

├── notebooks/

│   └── superstore_analysis.ipynb

├── sql/

│   └── retail_sales_analysis.sql

└── README.md


🚀 Tools & Technologies

Python (Pandas, SQLAlchemy, PyMySQL)
MySQL / MariaDB
Jupyter Notebook
SQL


🔧 Step-by-Step Process

1. 📥 Data Loading & Cleaning (Python)
Loaded CSV into a Pandas DataFrame
Converted `Order Date` and `Ship Date` to datetime
Checked for and removed duplicate rows
Checked for and handled null values
Standardized column names for consistency

2. 🛢️ Upload to SQL Database

Used SQLAlchemy + PyMySQL to:

Connect to MySQL (`superstore_db`)
Upload cleaned data into a `superstore` table

from sqlalchemy import create_engine

engine = create_engine('mysql+pymysql://root:root@localhost:3306/superstore_db')
df_store.to_sql('superstore', con=engine, if_exists='replace', index=False)



📊 Key SQL Insights

🔹 Total Sales by Region and Month
SELECT region, MONTH(order_date) AS month, ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY region, month
ORDER BY month ASC, region;


🔹 Top 10 Products by Sales
SELECT product_name, ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


🔹 Profit vs. Discount Analysis
SELECT discount, ROUND(AVG(profit), 2) AS avg_profit
FROM superstore
GROUP BY discount
ORDER BY discount;


🔹 Sales by Category & Sub-category
SELECT category, `sub-category`, ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY category, `sub-category`
ORDER BY total_sales DESC;

🔹 Customer Insights
Most Profitable Customers
Sales Distribution by Ship Mode
Profit per Customer Segment

🧠 Key Takeaways

Certain regions outperform others in specific months.
High discounts often correlate with lower profits.
Standard Class is the most used shipping mode.
Top customers contribute significantly to profit.

📌 Improvements Made
Cleaned column names for consistency
Converted dates correctly for SQL filtering
Used SQL-safe practices (e.g., safe update handling)
Added meaningful comments in SQL script


💼 Author
Made by [Ankit Chauhan]  
🔗 [GitHub Profile](https://github.com/singhshaab-ankit)

📜 License
MIT License
See LICENSE.md for details.

