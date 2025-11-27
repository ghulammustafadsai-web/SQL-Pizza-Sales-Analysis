/* ------------------------------------------------------------
   PROJECT: SQL Pizza Sales Analysis
   AUTHOR: Ghulam Mustafa
   ANALYSIS LEVEL: BASIC
   DESCRIPTION: Total orders, revenue, highest-priced pizza,
                most common pizza size, and top 5 pizzas.
   DATABASE: Pizza_Sales
   ------------------------------------------------------------ */

USE Pizza_Sales;

-- Retrieve the total number of orders placed
SELECT COUNT(*) AS total_orders
FROM orders;

-- Calculate the total revenue generated from pizza sales
SELECT ROUND(SUM(Order_details.quantity * pizzas.price), 2) AS total_revenue
FROM Order_details
JOIN pizzas ON Order_details.pizza_id = pizzas.pizza_id;

-- Identify the highest-priced pizza
SELECT TOP 1 pizza_types.name, ROUND(pizzas.price, 2) AS price
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC;

-- Identify the most common pizza size ordered
SELECT TOP 1 pizzas.size, SUM(Order_details.quantity) AS total_order
FROM Order_details
JOIN pizzas ON Order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY total_order DESC;

-- List the top 5 most ordered pizza types along with their quantities
SELECT TOP 5 pizza_types.name, SUM(Order_details.quantity) AS total_quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN Order_details ON Order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY total_quantity DESC;
