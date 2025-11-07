/* ------------------------------------------------------------
   PROJECT: SQL Pizza Sales Analysis
   AUTHOR: Ghulam Mustafa
   DESCRIPTION: SQL-based analysis of pizza sales data to extract
                insights such as revenue, order distribution,
                and top-performing pizzas.
   DATABASE FILES: orders, order_details, pizza_types and pizzas
   ------------------------------------------------------------ */

USE Pizza_Sales

-- ===============================
-- BASIC ANALYSIS
-- ===============================

--Retrieve the total number of orders placed.
SELECT COUNT(*) total_orders FROM orders;

--Calculate the total revenue generated from pizza sales.
SELECT ROUND(SUM(Order_details.quantity * pizzas.price ),2) total_revenue
FROM Order_details
JOIN pizzas
ON Order_details.pizza_id=pizzas.pizza_id;

--Identify the highest-priced pizza.
SELECT TOP 1 pizza_types.name ,ROUND(pizzas.price,2)
FROM  pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id=pizzas.pizza_type_id
ORDER BY pizzas.price DESC

--Identify the most common pizza size ordered.
SELECT TOP 1 pizzas.size,SUM(Order_details.quantity) total_order
FROM Order_details
JOIN pizzas
ON Order_details.pizza_id=pizzas.pizza_id
GROUP BY  pizzas.size
ORDER BY  total_order DESC

--List the top 5 most ordered pizza types along with their quantities.
SELECT TOP 5 pizza_types.name,SUM(Order_details.quantity) total_quantity
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id=pizzas.pizza_type_id
JOIN Order_details 
ON Order_details.pizza_id=pizzas.pizza_id
GROUP BY  pizza_types.name
ORDER BY  total_quantity DESC


-- ===============================
-- INTERMEDIATE ANALYSIS
-- ===============================

--Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT pizza_types.category,SUM(Order_details.quantity) total_quantity
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id=pizzas.pizza_type_id
JOIN Order_details
ON Order_details.pizza_id=pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY  total_quantity
--Determine the distribution of orders by hour of the day.
SELECT 
    DATEPART(HOUR, time) AS order_hour,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY DATEPART(HOUR, time)
ORDER BY order_hour;

--join tables to find the category-wise distribution of pizzas.
SELECT category ,COUNT(*) count_of_cat 
FROM pizza_types
GROUP BY category

--Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT AVG(quantity_per_day) AS avg_order_per_day
FROM (SELECT orders.date ,SUM(order_details.quantity) quantity_per_day
     FROM orders
     JOIN order_details
     ON orders.order_id=order_details.order_id
     GROUP BY orders.date) AS avg_order_per_day
--Determine the top 3 most ordered pizza types based on revenue.


SELECT 3 category ,SUM(revenue) total_revanue
FROM (SELECT pizza_types.category,Order_details.quantity * pizzas.price revenue
     FROM Order_details
     JOIN pizzas
     ON Order_details.pizza_id=pizzas.pizza_id
     JOIN pizza_types
     ON pizzas.pizza_type_id=pizza_types.pizza_type_id) AS total
GROUP BY category

-- ===============================
-- ADVANCED ANALYSIS
-- ===============================

--Calculate the percentage contribution of each pizza type to total revenue.
SELECT category ,total_revenu_catwise,
                            total_revenu_catwise / (SELECT SUM(total_revenu_catwise)
                            FROM (SELECT pizza_types.category,SUM(Order_details.quantity * pizzas.price) total_revenu_catwise
                            from Order_details
                            JOIN pizzas
                             ON Order_details.pizza_id=pizzas.pizza_id
                             JOIN pizza_types
                             ON pizzas.pizza_type_id=pizza_types.pizza_type_id
                             GROUP BY pizza_types.category) AS tab)*100 AS percentage_contribution
FROM (SELECT pizza_types.category,SUM(Order_details.quantity * pizzas.price) total_revenu_catwise
                    FROM Order_details
                    JOIN pizzas
                    ON Order_details.pizza_id=pizzas.pizza_id
                    JOIN pizza_types
                    ON pizzas.pizza_type_id=pizza_types.pizza_type_id
                    GROUP BY pizza_types.category) AS tab

--Analyze the cumulative revenue generated over time.
SELECT * ,
SUM(revenu)  OVER(ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumlative_sum
FROM  (SELECT order_details.quantity,pizzas.price,orders.date,order_details.quantity * pizzas.price revenu
               FROM order_details
               JOIN pizzas
               ON order_details.pizza_id=pizzas.pizza_id
               JOIN orders
               ON order_details.order_id=orders.order_id) AS tabe

--Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT TOP  3 pizza_types.category,SUM(order_details.quantity * pizzas.price) revenue_catwise
FROM order_details
JOIN pizzas
ON order_details.pizza_id=pizzas.pizza_id
JOIN pizza_types
ON pizzas.pizza_type_id=pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY revenue_catwise DESC
 
 /* ------------------------------------------------------------
   PROJECT SUMMARY:
   This  project analyzes pizza sales data using SQL Server.
   It involves three tables: orders, order_details,pizzas, and pizza_types.
   The queries explore total orders, total revenue, pizza popularity,
   size distribution, and category-wise sales performance.
   Time-based analysis includes order distribution by hour and 
   daily order averages. Revenue-based queries identify top pizzas 
   and their contribution to total sales.
   ------------------------------------------------------------ */







