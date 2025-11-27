/* ------------------------------------------------------------
   PROJECT: SQL Pizza Sales Analysis
   AUTHOR: Ghulam Mustafa
   ANALYSIS LEVEL: INTERMEDIATE
   DESCRIPTION: Category-wise quantities, hourly distribution,
                category distribution, daily averages, top 3 pizzas by revenue.
   DATABASE: Pizza_Sales
   ------------------------------------------------------------ */

USE Pizza_Sales;

-- Total quantity of each pizza category ordered
SELECT pizza_types.category, SUM(Order_details.quantity) AS total_quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN Order_details ON Order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY total_quantity;

-- Distribution of orders by hour of the day
SELECT DATEPART(HOUR, time) AS order_hour, COUNT(order_id) AS total_orders
FROM orders
GROUP BY DATEPART(HOUR, time)
ORDER BY order_hour;

-- Category-wise distribution of pizzas
SELECT category, COUNT(*) AS count_of_cat
FROM pizza_types
GROUP BY category;

-- Average number of pizzas ordered per day
SELECT AVG(quantity_per_day) AS avg_order_per_day
FROM (
    SELECT orders.date, SUM(order_details.quantity) AS quantity_per_day
    FROM orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.date
) AS avg_order_per_day;

-- Top 3 most ordered pizza types based on revenue
SELECT TOP 3 category, SUM(revenue) AS total_revenue
FROM (
    SELECT pizza_types.category, Order_details.quantity * pizzas.price AS revenue
    FROM Order_details
    JOIN pizzas ON Order_details.pizza_id = pizzas.pizza_id
    JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
) AS total
GROUP BY category;
