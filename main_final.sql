/* Create database */

drop database if exists main_db

IF NOT EXISTS (
 SELECT name
 FROM sys.databases
 WHERE name = N'main_db'
)
 CREATE DATABASE [main_db];
GO
IF SERVERPROPERTY('ProductVersion') > '12'
 ALTER DATABASE [main_db] SET QUERY_STORE=ON;
GO



/*Creating tables to store all the supply chain data where Spartan Logistics conducts business*/
-- DOWN
use main_db

drop view if exists v_buyer_order_info

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'feedback_buyer_id')
    ALTER TABLE feedbacks DROP CONSTRAINT feedback_buyer_id
drop table if exists feedbacks 


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_orders_commodities_order_no')
    ALTER TABLE orders_commodities DROP CONSTRAINT fk_orders_commodities_order_no
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_orders_commodities_commodity_id')
    ALTER TABLE orders_commodities DROP CONSTRAINT fk_orders_commodities_commodity_id
DROP TABLE IF EXISTS orders_commodities 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_shipping_airports_shipping_id')
    ALTER TABLE shipping_airports DROP CONSTRAINT fk_shipping_airports_shipping_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_shipping_airports_airport_id')
    ALTER TABLE shipping_airports DROP CONSTRAINT fk_shipping_airports_airport_id
DROP TABLE IF EXISTS shipping_airports

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_shipping_types_shipping_id')
    ALTER TABLE shipping_types DROP CONSTRAINT fk_shipping_types_shipping_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_shipping_types_type_id')
    ALTER TABLE shipping_types DROP CONSTRAINT fk_shipping_types_type_id
DROP TABLE IF EXISTS shipping_types

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_total_costs_cost_shipping_id')
    ALTER TABLE total_costs DROP CONSTRAINT fk_total_costs_cost_shipping_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_total_costs_cost_order_no')
    ALTER TABLE total_costs DROP CONSTRAINT fk_total_costs_cost_order_no
DROP TABLE IF EXISTS total_costs

DROP TABLE IF EXISTS airports 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_shippings_shipping_buyer_id')
    ALTER TABLE shippings DROP CONSTRAINT fk_shippings_shipping_buyer_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_shippings_shipping_warehouse_id')
    ALTER TABLE shippings DROP CONSTRAINT fk_shippings_shipping_warehouse_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_shippings_shipping_supplier_id')
    ALTER TABLE shippings DROP CONSTRAINT fk_shippings_shipping_supplier_id
DROP TABLE IF EXISTS shippings

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_payments_payment_cost_id')
    ALTER TABLE payments DROP CONSTRAINT fk_payments_payment_cost_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_payments_payment_buyer_id')
    ALTER TABLE payments DROP CONSTRAINT fk_payments_payment_buyer_id
DROP TABLE IF EXISTS payments

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_invoices_invoice_payment_id')
    ALTER TABLE invoices DROP CONSTRAINT fk_invoices_invoice_payment_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_invoices_invoice_order_no')
    ALTER TABLE invoices DROP CONSTRAINT fk_invoices_invoice_order_no
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_invoices_invoice_shipment_id')
    ALTER TABLE invoices DROP CONSTRAINT fk_invoices_invoice_shipment_id
DROP TABLE IF EXISTS invoices 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_commodities_supplier_id')
    ALTER TABLE commodities DROP CONSTRAINT fk_commodities_supplier_id
DROP TABLE IF EXISTS commodities

DROP TABLE IF EXISTS categories


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_commodity_categories_commodity_id')
    ALTER TABLE commodities_categories DROP CONSTRAINT fk_commodity_categories_commodity_id
--IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_commodity_categories_category_name')
 --   ALTER TABLE commodities_categories DROP CONSTRAINT fk_commodity_categories_category_name
DROP TABLE IF EXISTS commodities_categories

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_stores_warehouse_id')
    ALTER TABLE stores DROP CONSTRAINT fk_stores_warehouse_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_stores_supplier_id')
    ALTER TABLE stores DROP CONSTRAINT fk_stores_supplier_id
DROP TABLE IF EXISTS stores 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_warehouses_warehouse_supplier_id')
    ALTER TABLE warehouses DROP CONSTRAINT fk_warehouses_warehouse_supplier_id
DROP TABLE IF EXISTS warehouses

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_permissions_perm_role_id')
    ALTER TABLE permissions DROP CONSTRAINT fk_permissions_perm_role_id
DROP TABLE IF EXISTS permissions

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_logins_login_buyer_id')
    ALTER TABLE logins DROP CONSTRAINT fk_logins_login_buyer_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_logins_login_supplier_id')
    ALTER TABLE logins DROP CONSTRAINT fk_logins_login_supplier_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_logins_login_role_id')
    ALTER TABLE logins DROP CONSTRAINT fk_logins_login_role_id
DROP TABLE IF EXISTS logins

DROP TABLE IF EXISTS roles

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_order_supplier_order_no')
    ALTER TABLE order_suppliers DROP CONSTRAINT fk_order_supplier_order_no
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_order_supplier_supplier')
    ALTER TABLE order_suppliers DROP CONSTRAINT fk_order_supplier_supplier
DROP TABLE IF EXISTS order_suppliers

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_orders_order_buyer_id')
    ALTER TABLE orders  DROP CONSTRAINT fk_orders_order_buyer_id
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_orders_order_supplier_id')
    ALTER TABLE orders DROP CONSTRAINT fk_orders_order_supplier_id
DROP TABLE IF EXISTS orders

drop table if exists stocks
DROP TABLE IF EXISTS suppliers
DROP TABLE IF EXISTS buyers
DROP TABLE IF EXISTS types

use main_db
-- UP Metadata
/*Create Tables*/
GO
CREATE TABLE buyers (
    buyer_id INT IDENTITY NOT NULL,
    buyer_company_name NVARCHAR(50) NOT NULL,
    buyer_email VARCHAR(50) NOT NULL,
    buyer_phone VARCHAR(15) NOT NULL,  --For International Phone Nos
    buyer_first_name NVARCHAR(50), -- NVARCHAR For International Clients
    buyer_last_name NVARCHAR(50),
    buyer_description VARCHAR(200),
    buyer_city VARCHAR(50) NOT NULL,
    buyer_state VARCHAR(2) NOT NULL,
    buyer_country VARCHAR(50) NOT NULL,
    buyer_zipcode CHAR(5) NOT NULL,
    CONSTRAINT pk_buyers_buyer_id PRIMARY KEY(buyer_id),
    CONSTRAINT u_buyers_buyer_email UNIQUE (buyer_email)
)

CREATE TABLE suppliers(
    supplier_id INT IDENTITY NOT NULL,
    supplier_company_name NVARCHAR(50) NOT NULL,
    supplier_email VARCHAR(50) NOT NULL,
    supplier_phone VARCHAR(15) NOT NULL,  
    supplier_first_name NVARCHAR(50),
    supplier_last_name NVARCHAR(50),
    supplier_description VARCHAR(200),
    supplier_city VARCHAR(50) NOT NULL,
    supplier_state CHAR(2) NOT NULL,
    supplier_country VARCHAR(50) NOT NULL,
    supplier_zipcode CHAR(5) NOT NULL,
    CONSTRAINT pk_suppliers_supplier_id PRIMARY KEY (supplier_id),
    CONSTRAINT u_suppliers_supplier_email UNIQUE (supplier_email),    
)

CREATE TABLE orders(
    order_no INT IDENTITY NOT NULL,
    order_status CHAR(10) NOT NULL,
    order_cost MONEY NOT NULL,
    order_date DATETIME NOT NULL,
    order_buyer_id INT NOT NULL,
    order_supplier_id INT NOT NULL,
    CONSTRAINT pk_orders_order_no PRIMARY KEY (order_no)    
)


--Bridge
CREATE TABLE orders_commodities(
    oc_order_no INT NOT NULL,
    oc_commodity_id INT NOT NULL
)

--Bridge
CREATE TABLE orders_suppliers(
    os_order_no INT NOT NULL,
    os_supplier_id INT NOT NULL,
)
CREATE TABLE roles(
    role_id INT IDENTITY NOT NULL,
    role_name CHAR(50) NOT NULL,
    role_description VARCHAR(100),
    CONSTRAINT pk_roles_role_id PRIMARY KEY (role_id),
    CONSTRAINT u_role_name UNIQUE (role_name)
)

CREATE TABLE logins(
    login_id INT IDENTITY NOT NULL,
    login_username NVARCHAR(50) NOT NULL,
    login_password NVARCHAR(50) NOT NULL,
    login_buyer_id INT NOT NULL,
    login_supplier_id INT NOT NULL,
    login_role_id INT NOT NULL,
    CONSTRAINT pk_logins_login_id PRIMARY KEY (login_id),
    CONSTRAINT u_login_username UNIQUE (login_username)    
)


CREATE TABLE permissions(
    perm_id INT IDENTITY NOT NULL,
    perm_type CHAR(50) NOT NULL,
    perm_name VARCHAR(50) NOT NULL,
    perm_description VARCHAR(100),
    perm_role_id INT NOT NULL,
    CONSTRAINT pk_permissions_permission_id PRIMARY KEY (perm_id),
    CONSTRAINT u_permission_name UNIQUE (perm_name)
)
CREATE TABLE warehouses(
    warehouse_id INT IDENTITY NOT NULL,
    warehouse_name NVARCHAR(50) NOT NULL,
    warehouse_email VARCHAR(50) NOT NULL,
    warehouse_phone VARCHAR(15) NOT NULL,  
    warehouse_description VARCHAR(200),
    warehouse_city VARCHAR(50) NOT NULL,
    warehouser_state CHAR(2) NOT NULL,
    warehouse_country VARCHAR(50) NOT NULL,
    warehouse_zipcode CHAR(5) NOT NULL,
    warehouse_supplier_id INT NOT NULL,
    CONSTRAINT pk_warehouses_warehouse_id PRIMARY KEY (warehouse_id),
    CONSTRAINT u_warehouse_email UNIQUE (warehouse_email)
)

--Bridge
CREATE TABLE stores(
    store_supplier_id INT NOT NULL,
    store_warehouse_id INT NOT NULL   
)

CREATE TABLE categories(
    category_name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_categories_category_name PRIMARY KEY (category_name)
)


--Bridge
CREATE TABLE commodities_categories(
    cc_commodity_id INT NOT NULL,
    cc_category_name VARCHAR(50) NOT NULL
)

--Bridge
CREATE TABLE commodities(
    commodity_id INT IDENTITY NOT NULL,
    commodity_name NVARCHAR(50) NOT NULL,
    commodity_price MONEY NOT NULL,
    commodity_type CHAR(50) NOT NULL,
    commodity_qty INT NOT NULL,
    commodity_description VARCHAR(200),
    commodity_supplier_id INT NOT NULL,
    CONSTRAINT pk_commodities_commodity_id PRIMARY KEY (commodity_id)    
)


CREATE TABLE invoices(
    invoice_no INT IDENTITY NOT NULL,
    invoice_date DATE NOT NULL,
    invoice_description VARCHAR(200),
    invoice_payment_id INT NOT NULL,
    invoice_order_no INT NOT NULL,
    invoice_shipping_id INT NOT NULL,
    CONSTRAINT pk_invoices_invoice_no PRIMARY KEY (invoice_no)
)

CREATE TABLE payments( 
    payment_id INT IDENTITY NOT NULL,
    payment_date DATE NOT NULL, 
    payment_type CHAR(50) NOT NULL,
    payment_status VARCHAR(50),
    payment_cost_id INT NOT NULL,
    payment_buyer_id INT NOT NULL,
    CONSTRAINT pk_payments_payment_id PRIMARY KEY (payment_id)
)
CREATE TABLE shippings(
    shipping_id INT IDENTITY NOT NULL,
    shipping_carrier_name VARCHAR(50) NOT NULL,
    shipping_expected_delivery_date DATE,
    shipping_buyer_id INT NOT NULL,
    shipping_warehouse_id INT NOT NULL,
    shipping_supplier_id INT NOT NULL,
    CONSTRAINT pk_shipping_shipping_id PRIMARY KEY (shipping_id)
)

CREATE TABLE airports(
    airport_id INT IDENTITY NOT NULL,
    airport_name VARCHAR(50) NOT NULL,
    airport_address VARCHAR(50) NOT NULL,
    airport_zipcode CHAR(5) NOT NULL,
    CONSTRAINT fk_airports_airport_id PRIMARY KEY (airport_id)
)

CREATE TABLE total_costs(
    cost_id INT IDENTITY NOT NULL,
    discount MONEY,
    total_amount MONEY, --remove this
    tc_shipping_id INT NOT NULL,
    tc_order_no INT NOT NULL,
    CONSTRAINT fk_total_costs_cost_id PRIMARY KEY (cost_id)
)
--ALTER TABLE total_costs DROP COLUMN total_amount--


--Bridge
CREATE TABLE types(
    type_id INT IDENTITY NOT NULL,
    type_name VARCHAR(50) NOT NULL,
 --   type_shipping_id INT NOT NULL,
    CONSTRAINT pk_types_type_id PRIMARY KEY(type_id),
    CONSTRAINT u_types_type_name UNIQUE(type_name)
)
CREATE TABLE shipping_types(
    st_shipping_id INT NOT NULL,
    st_type_id INT NOT NULL,   
)


--Bridge
CREATE TABLE shipping_airports(
    sa_shipping_id INT NOT NULL,
    sa_airport_id INT NOT NULL
)
create table stocks(
    stock_warehouse_id INT NOT NULL,
   stock_commodity_id INT NOT NULL,
   availabel_qty int 
)


create table feedbacks(
    feedback_id INT NOT NULL,
    feedback_buyer_id INT NOT NULL,
    feedback_msg varchar(500),
    feedback_rating int,
    CONSTRAINT pk_feedbacks_feedback_id PRIMARY KEY(feedback_id), 

)

use main_db

ALTER TABLE orders
    ADD CONSTRAINT fk_orders_order_buyer_id FOREIGN KEY(order_buyer_id) REFERENCES buyers(buyer_id),
        CONSTRAINT fk_orders_order_supplier_id FOREIGN KEY(order_supplier_id) REFERENCES suppliers(supplier_id)


ALTER TABLE orders_commodities
   ADD CONSTRAINT fk_orders_commodities_order_no FOREIGN KEY(oc_order_no) REFERENCES orders(order_no),
       CONSTRAINT fk_orders_commodities_commodity_id FOREIGN KEY(oc_commodity_id) REFERENCES commodities(commodity_id)



ALTER TABLE orders_suppliers
    ADD CONSTRAINT fk_order_supplier_order_no FOREIGN KEY(os_order_no) REFERENCES orders(order_no),
        CONSTRAINT fk_order_supplier_supplier_id FOREIGN KEY(os_supplier_id) REFERENCES suppliers(supplier_id)


ALTER TABLE logins
    ADD CONSTRAINT fk_logins_login_buyer_id FOREIGN KEY(login_buyer_id) REFERENCES buyers(buyer_id),
        CONSTRAINT fk_logins_login_supplier_id FOREIGN KEY(login_supplier_id) REFERENCES suppliers(supplier_id),
        CONSTRAINT fk_logins_login_role_id FOREIGN KEY(login_role_id) REFERENCES roles(role_id)


ALTER TABLE permissions
    ADD CONSTRAINT fk_permissions_perm_role_id FOREIGN KEY(perm_role_id) REFERENCES roles(role_id)


ALTER TABLE warehouses
    ADD CONSTRAINT fk_warehouses_warehouse_supplier_id FOREIGN KEY(warehouse_supplier_id) REFERENCES suppliers(supplier_id)



ALTER TABLE stores
    ADD CONSTRAINT fk_stores_supplier_id FOREIGN KEY(store_supplier_id) REFERENCES suppliers(supplier_id),
        CONSTRAINT fk_stores_warehouse_id FOREIGN KEY(store_warehouse_id) REFERENCES warehouses(warehouse_id)

ALTER TABLE commodities_categories
    ADD CONSTRAINT fk_commodities_categories_commodity_id FOREIGN KEY(cc_commodity_id) REFERENCES commodities(commodity_id)
        


ALTER TABLE commodities
    ADD CONSTRAINT  fk_commodities_supplier_id FOREIGN KEY(commodity_supplier_id) REFERENCES suppliers(supplier_id)
        


ALTER TABLE invoices 
    ADD CONSTRAINT fk_invoices_invoice_payment_id FOREIGN KEY(invoice_payment_id) REFERENCES payments(payment_id),
        CONSTRAINT fk_invoices_invoice_order_no FOREIGN KEY(invoice_order_no) REFERENCES orders(order_no),
        CONSTRAINT fk_invoices_invoice_shipment_id FOREIGN KEY(invoice_shipping_id) REFERENCES shippings(shipping_id)


ALTER TABLE payments 
    ADD CONSTRAINT fk_payments_payment_cost_id FOREIGN KEY(payment_cost_id) REFERENCES total_costs(cost_id),
        CONSTRAINT fk_payments_payment_buyer_id FOREIGN KEY(payment_buyer_id) REFERENCES buyers(buyer_id)
    



ALTER TABLE shippings
    ADD CONSTRAINT fk_shippings_shipping_buyer_id FOREIGN KEY(shipping_buyer_id) REFERENCES buyers(buyer_id),
        CONSTRAINT fk_shippings_shipping_warehouse_id FOREIGN KEY (shipping_warehouse_id) REFERENCES warehouses(warehouse_id),
        CONSTRAINT fk_shippings_shipping_supplier_id FOREIGN KEY (shipping_supplier_id) REFERENCES suppliers(supplier_id)


ALTER TABLE total_costs
    ADD CONSTRAINT fk_total_costs_cost_shipping_id FOREIGN KEY(tc_shipping_id) REFERENCES shippings(shipping_id),
        CONSTRAINT fk_total_costs_cost_order_no FOREIGN KEY (tc_order_no) REFERENCES orders(order_no)



ALTER TABLE stocks 
   ADD available_qty INT
--make it as a whole table--


ALTER TABLE shipping_types 
    ADD CONSTRAINT fk_shipping_types_shipping_id FOREIGN KEY(st_shipping_id) REFEREnceS shippings(shipping_id),
        CONSTRAINT fk_shipping_types_type_id FOREIGN KEY(st_type_id) REFEReNCES types(type_id)



ALTER TABLE shipping_airports
   ADD CONsTRAINT fk_shipping_airports_shipping_id FOREIGN KEY(sa_shipping_id) REFERENCES shippings(shipping_id),
       CONSTRAINT fk_shipping_airports_airport_id FOREIGN KEY (sa_airport_id) REFERENCES airports(airport_id)


ALTER TABLE stocks
    ADD CONSTRAINT fk_stocks_stock_warehouse_id FOREIGN KEY (stock_warehouse_id) REFERENCES warehouses(warehouse_id),
         CONSTRAINT fk_stocks_stock_commodity_id FOREIGN KEY (stock_commodity_id) REFERENCES commodities(commodity_id)

ALTER TABLE feedbacks
    ADD CONSTRAINT chk_rating CHECK(feedback_rating>0 and feedback_rating<6)

ALTER TABLE feedbacks
    ADD CONSTRAINT fk_feedback_buyer_id foreign key (feedback_buyer_id) references buyers(buyer_id)


use main_db
--INSERT STATEMENTS--
--up script--
insert into buyers( buyer_company_name, buyer_email, buyer_phone, buyer_first_name, buyer_last_name, buyer_description, buyer_city, buyer_state, buyer_country, buyer_zipcode) values ( 'syr uni', 'hyedulla@syr.edu', '3159529708', 'harish', 'yedulla', 'educational institution', 'syracuse', 'NY', 'USA', '13210');
insert into buyers( buyer_company_name, buyer_email, buyer_phone, buyer_first_name, buyer_last_name, buyer_description, buyer_city, buyer_state, buyer_country, buyer_zipcode) values ('amazon', 'amazon@gmail.com', '635428764824', 'jeff', 'bezos', 'retail', 'los angeles','LA', 'USA', '13267');
insert into buyers( buyer_company_name, buyer_email, buyer_phone, buyer_first_name, buyer_last_name, buyer_description, buyer_city, buyer_state, buyer_country, buyer_zipcode) values ('meta', 'meta@gmail.com', '62534978342', 'mark', 'zukerberg', 'social media', 'texas','TX', 'USA', '57583');
insert into buyers( buyer_company_name, buyer_email, buyer_phone, buyer_first_name, buyer_last_name, buyer_description, buyer_city, buyer_state, buyer_country, buyer_zipcode) values ('flipkart', 'flipkart@gmail.com', '7489928752', 'chinmay', 'maganur', 'e-commerce', 'new jersey','NJ', 'USA', '97525');
insert into buyers( buyer_company_name, buyer_email, buyer_phone, buyer_first_name, buyer_last_name, buyer_description, buyer_city, buyer_state, buyer_country, buyer_zipcode) values ('apple', 'apple@gmail.com', '63893928335', 'tim', 'cook', 'tech', 'seattle' ,'SE', 'USA', '45678');



insert into suppliers( supplier_company_name, supplier_email, supplier_phone, supplier_first_name, supplier_last_name, supplier_description, supplier_city, supplier_state, supplier_country, supplier_zipcode) values ( 'piyush', 'piyush@gmail.com', '3465789012', 'piyush', 'khedkar', 'lumber', 'buffalo', 'NY', 'USA', '78234');
insert into suppliers( supplier_company_name, supplier_email, supplier_phone, supplier_first_name, supplier_last_name, supplier_description, supplier_city, supplier_state, supplier_country, supplier_zipcode) values ('great value', 'greatvalue@gmail.com', '835496712', 'adam', 'sanders', 'groceries', 'cleveland', 'OH', 'USA', '96294');
insert into suppliers( supplier_company_name, supplier_email, supplier_phone, supplier_first_name, supplier_last_name, supplier_description, supplier_city, supplier_state, supplier_country, supplier_zipcode) values ('foxconn', 'foxconn@gmail.com', '9853421070', 'dominic', 'mckinnon', 'semi conductors', 'atlanta','GA', 'USA', '67214');
insert into suppliers( supplier_company_name, supplier_email, supplier_phone, supplier_first_name, supplier_last_name, supplier_description, supplier_city, supplier_state, supplier_country, supplier_zipcode) values ('aliexpress', 'aliexpress@gmail.com', '7938562032', 'damien', 'brown', 'finished goods', 'nashville','TN', 'USA', '12458');
insert into suppliers( supplier_company_name, supplier_email, supplier_phone, supplier_first_name, supplier_last_name, supplier_description, supplier_city, supplier_state, supplier_country, supplier_zipcode) values ('nvidia', 'nvidia@gmail.com', '93257627023', 'rami', 'kartn', 'gpu', 'maryland', 'MA', 'USA', '86524');



insert into orders(order_status, order_cost, order_date, order_buyer_id, order_supplier_id) values ('Inprogress', 500, '2009-01-01T00:08:00.000', 1,1);
insert into orders(order_status, order_cost, order_date, order_buyer_id, order_supplier_id ) values ('Inprogress', 1000, '2009-01-01T00:08:00.000', 2, 2);
insert into orders(order_status, order_cost, order_date, order_buyer_id, order_supplier_id) values ('Inprogress', 2000, '2009-01-01T00:09:00.000', 3, 3);
insert into orders(order_status, order_cost, order_date, order_buyer_id, order_supplier_id) values ('Complete', 500, '2009-01-01T00:15:10.000', 4, 4);
insert into orders(order_status, order_cost, order_date, order_buyer_id, order_supplier_id) values ('Shipping', 5010, '2009-01-01T00:18:11.000', 5, 5);
insert into orders(order_status, order_cost, order_date, order_buyer_id, order_supplier_id) values ('Complete', 20000, '2009-01-03T00:09:00.000', 3, 3);
insert into orders(order_status, order_cost, order_date, order_buyer_id, order_supplier_id) values ('Complete', 5000, '2009-01-04T00:15:10.000', 4, 4);
insert into orders(order_status, order_cost, order_date, order_buyer_id, order_supplier_id) values ('Complete', 5020, '2009-01-03T00:18:11.000', 5, 5);

--we dont have order no 3
--Start runnung here
insert into commodities (commodity_name,commodity_price , commodity_type , commodity_qty , commodity_description , commodity_supplier_id) values ('Timber',500,'raw material',10,'Teak wood',1);
insert into commodities (commodity_name,commodity_price , commodity_type , commodity_qty , commodity_description , commodity_supplier_id) values ('Rock Salt',100,'finished goods',15,'Salt by Tenzen Goods',2);
insert into commodities (commodity_name,commodity_price , commodity_type , commodity_qty , commodity_description , commodity_supplier_id) values ('Integrated Circuits',150,'finished goods',20,'ICs for foxconn',3);
insert into commodities (commodity_name,commodity_price , commodity_type , commodity_qty , commodity_description , commodity_supplier_id) values ('Water Bottle',20,'finished goods',25,'Plastic water bottles',4);
insert into commodities (commodity_name,commodity_price , commodity_type , commodity_qty , commodity_description , commodity_supplier_id) values ('GPU',300,'finished goods',10,'Nvidia GEForce GTX 3000',5);


insert into warehouses (warehouse_name, warehouse_email, warehouse_phone, warehouse_description, warehouse_city, warehouser_state, warehouse_country, warehouse_zipcode, warehouse_supplier_id) values ('UPT Warehouse', 'upt@gmail.com', '3065896678', 'West coast medium sized warehouse', 'San Jose', 'CA', 'USA', 74629, 1)
insert into warehouses (warehouse_name, warehouse_email, warehouse_phone, warehouse_description, warehouse_city, warehouser_state, warehouse_country, warehouse_zipcode, warehouse_supplier_id) values ('JRS Warehouse', 'jrs@gmail.com', '3925389400', 'Central small sized distribution centre', 'Cleveland', 'OH', 'USA', 84370, 2)
insert into warehouses (warehouse_name, warehouse_email, warehouse_phone, warehouse_description, warehouse_city, warehouser_state, warehouse_country, warehouse_zipcode, warehouse_supplier_id) values ('HBR Warehouse', 'hbr@gmail.com', '6396781360', 'Cold Storage', 'Atlanta', 'GA', 'USA', 93710, 3)
insert into warehouses (warehouse_name, warehouse_email, warehouse_phone, warehouse_description, warehouse_city, warehouser_state, warehouse_country, warehouse_zipcode, warehouse_supplier_id) values ('JFK Warehouse', 'jfk33@gmail.com', '3006789931', 'East coast bonded warehouse', 'New York City', 'NY', 'USA', 19056, 4)
insert into warehouses (warehouse_name, warehouse_email, warehouse_phone, warehouse_description, warehouse_city, warehouser_state, warehouse_country, warehouse_zipcode, warehouse_supplier_id) values ('WKH Warehouse', 'wkh8@gmail.com', '3749732208', 'Cold Storgae', 'Dallas', 'TX', 'USA', 49601, 5)


insert into orders_suppliers (os_order_no,os_supplier_id) values (1,1)
insert into orders_suppliers (os_order_no,os_supplier_id) values (2,2)
insert into orders_suppliers (os_order_no,os_supplier_id) values (4,3)
insert into orders_suppliers (os_order_no,os_supplier_id) values (5,4)
insert into orders_suppliers (os_order_no,os_supplier_id) values (6,5)


INSERT into commodities_categories (cc_commodity_id,cc_category_name) values(1,'Raw_Materials')
INSERT into commodities_categories (cc_commodity_id,cc_category_name) values(2,'Finished_goods')
INSERT into commodities_categories (cc_commodity_id,cc_category_name) values(3,'Finished_goods')
INSERT into commodities_categories (cc_commodity_id,cc_category_name) values(4,'Plastics')
INSERT into commodities_categories (cc_commodity_id,cc_category_name) values(5,'Finished_goods')




insert into stores (store_supplier_id,store_warehouse_id) values (1,1)
insert into stores (store_supplier_id,store_warehouse_id) values (2,2)
insert into stores (store_supplier_id,store_warehouse_id) values (3,3)
insert into stores (store_supplier_id,store_warehouse_id) values (4,4)
insert into stores (store_supplier_id,store_warehouse_id) values (5,5)



insert into stocks (stock_warehouse_id,stock_commodity_id,available_qty) values (1,1,1000)
insert into stocks (stock_warehouse_id,stock_commodity_id,available_qty) values (2,2,100)
insert into stocks (stock_warehouse_id,stock_commodity_id,available_qty) values (3,3,2000)
insert into stocks (stock_warehouse_id,stock_commodity_id,available_qty) values (4,4,303)
insert into stocks (stock_warehouse_id,stock_commodity_id,available_qty) values (5,5,1044)



insert into shippings (shipping_carrier_name,shipping_expected_delivery_date,shipping_buyer_id,shipping_warehouse_id,shipping_supplier_id) values('UPCSC','2009-01-12',1,1,1)
insert into shippings (shipping_carrier_name,shipping_expected_delivery_date,shipping_buyer_id,shipping_warehouse_id,shipping_supplier_id) values('instacart','2009-01-11',2,2,2)
insert into shippings (shipping_carrier_name,shipping_expected_delivery_date,shipping_buyer_id,shipping_warehouse_id,shipping_supplier_id) values('Amazon_prime','2009-01-20',3,3,3)
insert into shippings (shipping_carrier_name,shipping_expected_delivery_date,shipping_buyer_id,shipping_warehouse_id,shipping_supplier_id) values('UPS','2009-01-05',4,4,4)
insert into shippings (shipping_carrier_name,shipping_expected_delivery_date,shipping_buyer_id,shipping_warehouse_id,shipping_supplier_id) values('Fedex','2009-02-01',5,5,5)

insert into airports (airport_name,airport_address,airport_zipcode) values('JFK international airport' , 'NY' ,11430 )
insert into airports (airport_name,airport_address,airport_zipcode) values('SF international airport' , 'California' ,13210 )
insert into airports (airport_name,airport_address,airport_zipcode) values('Dellas international airport' , 'Texas' ,75261 )
insert into airports (airport_name,airport_address,airport_zipcode) values('Miami international airport' , 'Miami' ,11222 )
insert into airports (airport_name,airport_address,airport_zipcode) values('Denver international airport' , 'denver' ,64321 )

insert into shipping_airports (sa_shipping_id,sa_airport_id) values(1,1)
insert into shipping_airports (sa_shipping_id,sa_airport_id) values(2,2)
insert into shipping_airports (sa_shipping_id,sa_airport_id) values(3,3)
insert into shipping_airports (sa_shipping_id,sa_airport_id) values(4,4)
insert into shipping_airports (sa_shipping_id,sa_airport_id) values(5,5)



insert into types (type_name) values ('land')
insert into types (type_name) values ('ships')
insert into types (type_name) values ('air')

insert into shipping_types (st_shipping_id,st_type_id) values(1,1)
insert into shipping_types (st_shipping_id,st_type_id) values(2,2)
insert into shipping_types (st_shipping_id,st_type_id) values(3,2)
insert into shipping_types (st_shipping_id,st_type_id) values(4,3)
insert into shipping_types (st_shipping_id,st_type_id) values(5,2)

insert into total_costs ( discount,total_amount,tc_shipping_id,tc_order_no) values (150,500,1,1)
insert into total_costs ( discount,total_amount,tc_shipping_id,tc_order_no) values (50,1000,2,2)
--insert into total_costs ( discount,total_amount,tc_shipping_id,tc_order_no) values (310,500,3,3)
insert into total_costs ( discount,total_amount,tc_shipping_id,tc_order_no) values (200,500,4,4)
insert into total_costs ( discount,total_amount,tc_shipping_id,tc_order_no) values (310,5010,5,5)


insert into feedbacks (feedback_id, feedback_buyer_id,feedback_msg,feedback_rating) values(1,1,'service was good',4)
insert into feedbacks (feedback_id, feedback_buyer_id,feedback_msg,feedback_rating) values(2,2,'product was cheap',2)
insert into feedbacks (feedback_id, feedback_buyer_id,feedback_msg,feedback_rating) values(3,3,'very satisfied',4.5)
insert into feedbacks (feedback_id, feedback_buyer_id,feedback_msg,feedback_rating) values(4,4,'service was horrible',1)



---need to insert payment agin
insert into payments (payment_date,payment_type,payment_cost_id,payment_buyer_id) values ( '2009-01-01','card' , 1 , 1 )
insert into payments (payment_date,payment_type,payment_cost_id,payment_buyer_id) values ( '2009-01-02','cash' , 2 , 2 )
insert into payments (payment_date,payment_type,payment_cost_id,payment_buyer_id) values ( '2009-01-03' ,'venmo' , 3 , 3 )
insert into payments (payment_date,payment_type,payment_cost_id,payment_buyer_id) values ( '2009-01-01','zelle' , 4 , 4 )
--insert into payments (payment_date,payment_type,payment_cost_id,payment_buyer_id) values ( '2009-01-02' ,'card' , 5 , 5 )



update commodities set commodity_name='GPU' where commodity_id=5

insert into invoices (invoice_date,invoice_description,invoice_payment_id,invoice_order_no,invoice_shipping_id) values('2009-01-01','so many items wow',1,1,1)
insert into invoices (invoice_date,invoice_description,invoice_payment_id,invoice_order_no,invoice_shipping_id) values('2009-01-02','lets buy more',2,2,2)
insert into invoices (invoice_date,invoice_description,invoice_payment_id,invoice_order_no,invoice_shipping_id) values('2009-01-03','isnit it too much',3,3,3)
insert into invoices (invoice_date,invoice_description,invoice_payment_id,invoice_order_no,invoice_shipping_id) values('2009-01-04', 'shopping_addict',4,4,4)
--insert into invoices (invoice_date,invoice_description,invoice_payment_id,invoice_order_no,invoice_shipping_id) values('2009-01-05','you will be broke',5,5,5)






------- for powerapp user story
create table pending_requests(
    commodity_name varchar(20) not null,
    commodity_type varchar(20) not null,
    commodity_description varchar(50),
    quantity int not null
)
insert into pending_requests(commodity_name,commodity_type,commodity_description,quantity) values('Timber','raw material','form of wood',30)
insert into pending_requests(commodity_name,commodity_type,commodity_description,quantity) values('Rock Salt','fineshed goods','for manufacturing',5)
----

update pending_requests set commodity_type='finished goods' where commodity_name='Rock Salt'





-----stroed procedure to add discount to user 



DROP PROCEDURE IF EXISTS p_discount
GO
CREATE PROCEDURE p_discount (
    @cust_id int
   
) AS BEGIN 
IF exists(select order_buyer_id,count(*) from orders where order_buyer_id =@cust_id group by order_buyer_id having count(*)=1) BEGIN
    --print 'changing major of student' + cast(@student_id as varchar)
    --print ' to major id '  + cast(@new_major_id as varchar)
    
    declare @new_amt money

    set @new_amt = (select 0.5*(select sum(t.total_amount) from buyers b   join orders o on o.order_buyer_id = buyer_id
                                join total_costs t on t.tc_order_no=o.order_no and b.buyer_id = @cust_id))

    print 'before discount '+cast(@new_amt*2 as varchar)+ ' after discount '+ cast(@new_amt as varchar)
END

ELSE BEGIN
    print 'Offers valid to new users only'
    RETURN NULL
    END
END
GO
exec p_discount @cust_id=1

--query to get buyers with highest order amount--turns meta has highest oredered amount
select * from buyers where buyer_id =(select top 1 order_buyer_id from orders
group by order_buyer_id
order by sum(order_cost) desc)


go
create view v_buyer_order_info as(
select o.order_no,order_buyer_id,(buyer_first_name+' '+buyer_last_name) fullname, order_date, order_cost from buyers b join orders o on o.order_buyer_id=b.buyer_id
)


---if option given to buyer to choose from available supplier. and supplier not in  database ,through error. Since we cannot insert through views we did not proceed with the query
/*
go
create procedure v_user_choose_buyer (
     @select_vendor_id int,
     @qty int,
     @commodity_name varchar,
    @commodity_desc varchar
)as begin 
Begin TRANSACTION
    begin try
        if(@select_vendor_id<1 and @select_vendor_id>10)
            throw 5001, 'Vendor ID you selected i invalid, PLease select between 1 to 10',1
        insert into v_order_prod_vend values  (@commodity_name,@commdity_desc,@select_vendor_id,@qty)
    COMMIT
    return @@identity
    end TrY

*/
