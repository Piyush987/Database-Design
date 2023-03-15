# Database-Design
Design and development of a database for a logistics company to manage all orders to be transported from suppliers to buyers along with the warehouse details and various modes of transport. One stop solution database for Spartan Logistics Ltd.  

## Project Includes
1. Entities, relations, attributes in the data model  
2. Conceptual Data Model  
3. Logical Data Model  
4. SQL Up/Down script to implement internal model, load/migrate data and data logic for external model.  

## 1. Entities, Relations
Buyer places Orders which are accepted by Suppliers, who ship Commodities included in that order to Warehouse and Buyer receives the order via Shipping.
It also has Payment details, Inovices,  Feedback, Login roles and permissions for the app.

## 2. Conceptual Data Model
![Conceptual Diagram](https://user-images.githubusercontent.com/51230992/225242260-6647e5cd-a6fa-4e1b-9339-c1446731f9a4.jpg)

## 3. Logical Data Model
![Relational Diagram](https://user-images.githubusercontent.com/51230992/225242422-cd62ef3b-a6bf-4720-910e-cfc9e3f402f8.jpg)

## 4. SQL Up/Down Script
It includes 
- Creating database
- Drop tables and fk if they exist
- Creating the said tables, 
- Adding foreign key constraints, 
- Insert dummy data into the tables
- Stored procedure for discount and some basic views.
