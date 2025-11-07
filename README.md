# SQL Pizza Sales Analysis

A data analytics project that uses SQL to analyze pizza sales data, uncover key business insights, and support data-driven decision making. The analysis focuses on customer ordering patterns, revenue trends, and sales performance across pizza categories, sizes, and time periods.

## Table of Contents

- [Introduction](#introduction)
- [Data Model (Schema)](#data-model-schema)
- [Key Analysis Features](#key-analysis-features)
- [Total revenue generated from pizza sales](#total-revenue-from-pizza)
- [Top ordered pizza types on revenue](#top-ordered-pizza-on-revenue)
- [Percentage contribution of each pizza type to total revenue](#percent-contribution-to-revenue)
- [Top ordered pizza types based on revenue for each pizza category](#top-revenue-from-pizza-on-category)
- [Sales Performance](#sales-performance)
- [Revenue Growth](#revenue-growth)
- [Market Overview](#market-overview)
- [Executive Summary](#executive-summary)
- [How to Run](#how-to-run)

---

## Introduction

This project analyzes pizza sales data using SQL to uncover key business insights. It explores:
- Customer ordering patterns
- Revenue trends
- Sales performance across categories, sizes, and time periods
- Aggregation, joins, grouping, and ranking techniques

 decisions for pricing, promotions, and product mix.

 ---

## Data Model Schema (Example)

Note: Adapt this to your actual database schema.

- `Order_details(Order_detail_id,order_id,pizza_id,quantity)`
- `orders(Order_id,date,time)`
- `pizza_types(pizza_type_id,name,category,ingredients)`
- `pizzas(pizza_id,pizza_tyep_id,size,price)`
- `categories(category_i


---

## Key Analysis Features

- Aggregating sales and revenue by category, size, and time.
- Joining multiple tables to enrich orders with product and customer data.
- Grouping, ranking pizzas by performance, and identifying order trends by date, time, and category.
- Customer segmentation insights (if applicable from the analysis).

d, name)`

---
## Total revenue generated from pizza sales.

<img width="505" height="118" alt="total_revenu_generated" src="https://github.com/user-attachments/assets/6271e16e-6017-4287-82d9-240c9c851122" />

---

## Top 3 most ordered pizza types based on revenue.

<img width="526" height="206" alt="Top_three_category" src="https://github.com/user-attachments/assets/4eb406da-4a9e-488e-8c10-10aca9b20abd" />

---

##  Percentage contribution of each pizza type to total revenue.

<img width="719" height="316" alt="percentage cont" src="https://github.com/user-attachments/assets/b1dc2702-c104-4b3e-92aa-9c738f235ce2" />

---

## Top 3 most ordered pizza types based on revenue for each pizza category.


<img width="600" height="204" alt="catewise_revenue" src="https://github.com/user-attachments/assets/149de534-6c11-4026-b69e-0846a49ddc89" />

---


## Sales Performance

- Steady performance with certain pizza types yielding higher revenue.
- Peak hours and weekends drive higher demand.
- Revenue patterns align with time-based promotions and popular items.


---

## Revenue Growth

- Steady order volume across categories and sizes suggests expanding customer base.
- High-value pizzas contribute a larger share of total sales.
- Time-based spikes (weekends, evenings) indicate opportunities for profitability through promotions.


---
## Market Overview

- Popular flavors: pepperoni, barbecue chicken, and other classic flavors.
- Size distribution: medium and large sizes are most ordered.
- Market trend: steady growth with opportunities for targeted promotions.

---

## Executive Summary

- Premium pizza types contribute the highest revenue.
- Medium and large sizes dominate total orders, indicating strong group/family demand.
- Weekends and evenings show consistent sales, highlighting preferred time windows.
- Findings support data-driven

---

## How to Run

1. Set up your database and import the dataset (customers, orders, order_items, pizzas, etc.).
2. Run SQL queries to reproduce:
   - Revenue by pizza category and size
   - Top-performing pizzas (rankings)
   - Order trends by date and time
   - Customer segmentation metrics
3. (Optional) Generate visualizations from query results.


