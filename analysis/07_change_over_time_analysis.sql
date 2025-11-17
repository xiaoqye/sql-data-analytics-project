SELECT
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month, 
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL 
GROUP BY order_year,order_month
ORDER BY order_year, order_month;
-------------------------------------
SELECT
  DATE_TRUNC(order_date, MONTH) AS order_date, 
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL 
GROUP BY  order_date
ORDER BY  order_date;
-------------------------------------
SELECT
  FORMAT_DATE('%Y-%b', DATE_TRUNC(order_date, MONTH)) AS order_data, 
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL 
GROUP BY  order_date
ORDER BY  order_date;