/* ------------------------------------------------------------
   PROJECT: SQL Pizza Sales Analysis
   AUTHOR: Ghulam Mustafa
   ANALYSIS LEVEL: ADVANCED
   DESCRIPTION: Revenue contribution percentages, cumulative revenue,
                top 3 pizzas per category by revenue.
   DATABASE: Pizza_Sales
   ------------------------------------------------------------ */

USE Pizza_Sales;

-- Percentage contribution of each pizza category to total revenue
SELECT category, total_revenu_catwise,
       total_revenu_catwise / (
           SELECT SUM(total_revenu_catwise)
           FROM (
               SELECT pizza_types.category, SUM(Order_details.quantity * pizzas.price) AS total_revenu_catwise
               FROM Order_details
               JOIN pizzas ON Order_details.pizza_id = pizzas.pizza_id
               JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
               GROUP BY pizza_types.category
           ) AS tab
       ) * 100 AS percentage_contribution
FROM (
    SELECT pizza_types.category, SUM(Order_details.quantity * pizzas.price) AS total_revenu_catwise
    FROM Order_details
    JOIN pizzas ON Order_details.pizza_id = pizzas.pizza_id
    JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
    GROUP BY pizza_types.category
) AS tab;

-- Analyze cumulative revenue generated over time
SELECT *,
       SUM(revenu) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sum
FROM (
    SELECT order_details.quantity, pizzas.price, orders.date,
           order_details.quantity * pizzas.price AS revenu
    FROM order_details
    JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
    JOIN orders ON order_details.order_id = orders.order_id
) AS tabe;

-- Top 3 most ordered pizza types based on revenue for each pizza category
SELECT TOP 3 pizza_types.category, SUM(order_details.quantity * pizzas.price) AS revenue_catwise
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY revenue_catwise DESC;
