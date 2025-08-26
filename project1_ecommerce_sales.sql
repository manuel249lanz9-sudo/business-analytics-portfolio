
-- Project: E-commerce Sales Analytics (Starter Pack)
-- Database: SQLite (tables: customers, products, orders, order_items)

/*
Business Questions:
1) Revenue and orders by month (completed only).
2) Top 10 products by revenue.
3) Top 10 customers by revenue and their cities/regions.
4) Conversion proxy: completion rate of orders over total placed.
5) Category performance: revenue, AOV, items per order by category.
6) Cohort-style first vs. repeat customers revenue share.
7) Geo view: revenue by region/state.
*/

-- 1) Revenue and orders by month (completed only)
WITH order_amounts AS (
  SELECT
    oi.order_id,
    SUM(oi.line_amount) AS order_revenue
  FROM order_items oi
  GROUP BY oi.order_id
)
SELECT
  strftime('%Y-%m', o.order_date) AS year_month,
  COUNT(DISTINCT o.order_id) FILTER (WHERE o.status='completed') AS completed_orders,
  ROUND(SUM(CASE WHEN o.status='completed' THEN oa.order_revenue ELSE 0 END), 2) AS completed_revenue
FROM orders o
LEFT JOIN order_amounts oa ON o.order_id = oa.order_id
GROUP BY 1
ORDER BY 1;

-- 2) Top 10 products by revenue
SELECT
  p.product_id,
  p.product_name,
  p.category,
  ROUND(SUM(oi.line_amount),2) AS revenue,
  SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status='completed'
GROUP BY 1,2,3
ORDER BY revenue DESC
LIMIT 10;

-- 3) Top 10 customers by revenue
WITH order_amounts AS (
  SELECT order_id, SUM(line_amount) AS order_revenue
  FROM order_items
  GROUP BY 1
)
SELECT
  c.customer_id,
  c.city,
  c.state,
  c.region,
  ROUND(SUM(oa.order_revenue),2) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_amounts oa ON oa.order_id = o.order_id
WHERE o.status='completed'
GROUP BY 1,2,3,4
ORDER BY revenue DESC
LIMIT 10;

-- 4) Conversion proxy: completion rate
SELECT
  COUNT(*) AS total_orders,
  SUM(CASE WHEN status='completed' THEN 1 ELSE 0 END) AS completed_orders,
  ROUND(1.0*SUM(CASE WHEN status='completed' THEN 1 ELSE 0 END)/COUNT(*), 4) AS completion_rate
FROM orders;

-- 5) Category performance
WITH order_amounts AS (
  SELECT order_id, SUM(line_amount) AS order_revenue, SUM(quantity) AS items_count
  FROM order_items
  GROUP BY 1
),
order_lines AS (
  SELECT
    o.order_id, o.status, p.category, oi.quantity, oi.line_amount
  FROM orders o
  JOIN order_items oi ON oi.order_id = o.order_id
  JOIN products p ON p.product_id = oi.product_id
)
SELECT
  category,
  ROUND(SUM(CASE WHEN status='completed' THEN line_amount ELSE 0 END),2) AS revenue,
  ROUND(AVG(CASE WHEN status='completed' THEN (SELECT order_revenue FROM order_amounts oa WHERE oa.order_id=ol.order_id) END),2) AS avg_order_value,
  ROUND(AVG(CASE WHEN status='completed' THEN (SELECT items_count FROM order_amounts oa WHERE oa.order_id=ol.order_id) END),2) AS items_per_order
FROM order_lines ol
GROUP BY 1
ORDER BY revenue DESC;

-- 6) First vs repeat customers revenue share
WITH first_order AS (
  SELECT customer_id, MIN(order_date) AS first_date
  FROM orders
  WHERE status='completed'
  GROUP BY 1
),
order_amounts AS (
  SELECT order_id, SUM(line_amount) AS order_revenue
  FROM order_items
  GROUP BY 1
)
SELECT
  CASE WHEN DATE(o.order_date)=DATE(f.first_date) THEN 'First-time' ELSE 'Repeat' END AS customer_type,
  ROUND(SUM(oa.order_revenue),2) AS revenue
FROM orders o
JOIN first_order f ON f.customer_id = o.customer_id
JOIN order_amounts oa ON oa.order_id = o.order_id
WHERE o.status='completed'
GROUP BY 1;

-- 7) Revenue by region/state
WITH order_amounts AS (
  SELECT order_id, SUM(line_amount) AS order_revenue
  FROM order_items
  GROUP BY 1
)
SELECT
  c.region,
  c.state,
  ROUND(SUM(oa.order_revenue),2) AS revenue
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_amounts oa ON oa.order_id = o.order_id
WHERE o.status='completed'
GROUP BY 1,2
ORDER BY revenue DESC;
