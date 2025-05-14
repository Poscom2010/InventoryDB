# Warehouses InventoryTrackingDB
This is a full Inventory Database Managemnet System for Poscom Logistics. It Tracks products, users, movement of stock between warehouses and monitors stock Levels.
# Inventory Tracking System

## 📌 Description

This project is a relational database system built using MySQL to track the movement of products in and out of Poscom warehouses which are located in different locations. It enables inventory tracking, stock management, and user accountability for stock changes.Also it allows grouping of all commodities and ensure those Warehouses running low on certain products are allowed to restock  through identifying which warehouse still has mmore stock.This relational database utilizes all relationships of 1:M based on the table typle.

## 📁 Features

- Product and warehouse tracking
- Stock IN/OUT logging
- User accountability for stock movements
- Current stock level table
- Product_Category table -all products falls under different commodities.As such, this groups products into different  categories eg Groceries, Kitchen Appliamnces, Electronics etc

## 🛠️ Setup Instructions
If need to copy and use the repo, you need to clone through git. 
1. Clone the repo:
```bash
git clone https://github.com/Poscom2010/InventoryDB.git

```

##  Summary of Tables and Relationships explanation
| Table                | Related Table     | Relationship Type |
| -------------------- | ----------------- | ----------------- |
| `product_categories` | `products`        | One-to-Many       |
| `products`           | `stock_movements` | One-to-Many       |
| `products`           | `stock_levels`    | One-to-Many       |
| `warehouses`         | `stock_movements` | One-to-Many       |
| `warehouses`         | `stock_levels`    | One-to-Many       |
| `users`              | `stock_movements` | One-to-Many       |


🖱🖲💻🧡🧡🧡🧡🧡🖱🖲💻 Happy Databasing
