# 🍔 Food Delivery Management System (SQL)

A relational database project that models how a food delivery platform stores customers, restaurants, menus, orders, payments, deliveries and reviews. The database was designed from an ER diagram and then analysed with SQL to answer real business questions.

## 📌 Project Overview

Food delivery platforms handle many connected pieces of data: who ordered, from which restaurant, what was ordered, how it was paid for, who delivered it and how the customer rated it. This project organises that data into **8 normalised tables** and uses **joins, aggregations, subqueries and CASE statements** to turn it into insights.

## 🎯 Objectives

- Design a normalised relational schema (3NF) starting from an ER diagram
- Enforce data integrity with primary keys, foreign keys, and `NOT NULL`, `UNIQUE` and `CHECK` constraints
- Load realistic sample data across all tables
- Answer business questions on revenue, customers, restaurants, delivery partners and payments

## 🛠️ Tools & Technologies

- **SQL** (MySQL 8.x syntax)
- **MySQL Workbench** for running scripts
- **Git & GitHub** for version control

## 🗺️ ER Diagram

![ER Diagram](images/er_diagram.png)

## 🗃️ Database Schema

| Table | Purpose | Key columns |
|---|---|---|
| `customers` | Customers who place orders | `customer_id` (PK), `email` (unique) |
| `restaurants` | Restaurants on the platform | `restaurant_id` (PK) |
| `menu_items` | Items sold by each restaurant | `item_id` (PK), `restaurant_id` (FK) |
| `delivery_partners` | Riders who deliver orders | `partner_id` (PK) |
| `orders` | One row per order | `order_id` (PK), `customer_id`, `restaurant_id`, `partner_id` (FKs) |
| `order_items` | Line items of each order | `order_item_id` (PK), `order_id`, `item_id` (FKs) |
| `payments` | One payment per order | `payment_id` (PK), `order_id` (FK, unique) |
| `reviews` | Customer rating for an order | `review_id` (PK), `order_id` (FK, unique), `customer_id` (FK) |

**Relationships**

- One customer places many orders (1:N)
- One restaurant receives many orders and offers many menu items (1:N)
- One delivery partner delivers many orders (1:N). `partner_id` is optional because a cancelled order may never be assigned a rider
- One order contains many items, and one menu item appears in many orders. `order_items` resolves this many-to-many relationship
- One order has at most one payment and at most one review (1:1)

## 📁 Repository Structure

```
food-delivery-sql-project/
├── README.md
├── images/
│   └── er_diagram.png
└── sql/
    ├── 01_create_tables.sql      # database + 8 tables with constraints
    ├── 02_insert_data.sql        # sample data (11 customers, 6 restaurants, 22 orders, ...)
    └── 03_analysis_queries.sql   # 14 business queries
```

## ▶️ How to Run

1. Open **MySQL Workbench** and connect to your local server.
2. Run `sql/01_create_tables.sql` to create the database and tables.
3. Run `sql/02_insert_data.sql` to load the sample data. It ends with a row-count check.
4. Run `sql/03_analysis_queries.sql` (or run the queries one at a time) to see the analysis.

> The sample data is fictional and created only for learning purposes.

## 🔍 SQL Concepts Used

- `INNER JOIN` and `LEFT JOIN`, including multi-table joins (up to 4 tables)
- Aggregations: `COUNT`, `SUM`, `AVG`, `ROUND`, with `GROUP BY` and `HAVING`
- Subqueries in `WHERE`, `HAVING` and `FROM`
- `CASE` statements for classification
- Constraints: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `CHECK`
- Data integrity validation with a reconciliation query

## 📊 Sample Queries and Results

### Q3. Revenue by restaurant (delivered orders only)

```sql
SELECT r.restaurant_name,
       r.cuisine_type,
       COUNT(o.order_id)   AS delivered_orders,
       SUM(o.total_amount) AS revenue
FROM restaurants r
JOIN orders o ON o.restaurant_id = r.restaurant_id
WHERE o.order_status = 'Delivered'
GROUP BY r.restaurant_id, r.restaurant_name, r.cuisine_type
ORDER BY revenue DESC, r.restaurant_name;
```

| restaurant_name | cuisine_type | delivered_orders | revenue |
|---|---|---|---|
| Pasta Palace | Italian | 2 | 2860 |
| Burger Barn | Fast Food | 5 | 2824 |
| Spice Route | North Indian | 4 | 2800 |
| Biryani House | Biryani | 3 | 2300 |
| Dragon Bowl | Chinese | 2 | 2180 |
| Green Leaf | South Indian | 3 | 1710 |

### Q10. Payment method share (aggregation with a subquery)

```sql
SELECT payment_method,
       COUNT(*) AS total_payments,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM payments), 2) AS pct_share
FROM payments
GROUP BY payment_method
ORDER BY total_payments DESC, payment_method;
```

| payment_method | total_payments | pct_share |
|---|---|---|
| UPI | 11 | 50.00 |
| Wallet | 5 | 22.73 |
| Cash on Delivery | 3 | 13.64 |
| Credit Card | 3 | 13.64 |

### Q8. Customers spending above the average customer (subquery in HAVING)

| full_name | total_spent |
|---|---|
| Arjun Nair | 3327 |
| Kabir Mehta | 2228 |
| Riya Deshmukh | 2200 |
| Ananya Kulkarni | 2140 |
| Neha Joshi | 2100 |

The full list of 14 queries is in [`sql/03_analysis_queries.sql`](sql/03_analysis_queries.sql).

## 💡 Key Insights (from the sample data)

- 19 of 22 orders were delivered, and the 3 cancelled orders were all refunded.
- UPI is the most used payment method, covering half of all orders.
- Vegetarian items make up about 70% of units sold in delivered orders.
- Pasta Palace earns the most revenue from only 2 orders, so it has the highest average order value, while Burger Barn has the most delivered orders.

## 🚀 Future Improvements

- Add indexes on foreign key columns and test query performance
- Create views for common reports (for example, monthly revenue)
- Add stored procedures for placing an order
- Add window-function queries such as customer ranking and running totals
- Build a Power BI dashboard on top of this database

## 👩‍💻 Author

**Aaditi Ghogardare**
Associate Software Engineer | Data Eng, Mgmt and Governance Associate
🔗 [LinkedIn](https://www.linkedin.com/in/aaditi-ghogardare-634011212/) · 📧 aaditighogardare20502@gmail.com
