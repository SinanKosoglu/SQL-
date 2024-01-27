CREATE DATABASE sql_proje_brazilian_ecommerce;
CREATE TABLE customers (
	customer_id character varying (50) primary key,
	customer_unique_id character varying (50),
	customer_zip_code_prefix integer,
	customer_city character varying (50),
	customer_state character varying (50)
);
COPY customers FROM 'C:\Program Files\PostgreSQL\15\bin\olist_customers_dataset.csv' delimiter ',' csv header
;
CREATE TABLE orders (
	order_id character varying (150) primary key,
	customer_id character varying (150),
	order_status character varying (50),
	order_purchase_timestamp timestamp,
	order_approved_at timestamp,
	order_delivered_carrier_date timestamp,
	order_delivered_customer_date timestamp,
	order_estimated_delivery_date timestamp,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
COPY orders FROM 'C:\Program Files\PostgreSQL\15\bin\olist_orders_dataset.csv' delimiter ',' csv header
;
CREATE TABLE sellers (
	seller_id character varying (150) primary key,
	seller_zipcode_prefix integer,
	seller_city character varying (100),
	seller_state character varying (50)
);
COPY sellers FROM 'C:\Program Files\PostgreSQL\15\bin\olist_sellers_dataset.csv' delimiter ',' csv header
;
CREATE TABLE order_reviews (
	review_id character varying (150),
	order_id character varying (100),
	review_score smallint,
	review_comment_title character varying (100),
	review_comment_message text, 
	review_creation_date timestamp,
	review_answer_timestamp timestamp,
	FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
COPY order_reviews FROM 'C:\Program Files\PostgreSQL\15\bin\olist_order_reviews_dataset.csv' delimiter ',' csv header
;
CREATE TABLE order_payments (
	order_id character varying (150),
	payments_squential integer, 
	payment_type character varying (50),
	payment_instalments integer,
	payment_value real,
	FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
COPY order_payments FROM 'C:\Program Files\PostgreSQL\15\bin\olist_order_payments_dataset.csv' delimiter ',' csv header
;
CREATE TABLE product_category_name_translation (
	product_category_name character varying (100) primary key,
	product_category_name_english character varying (100)
);
COPY product_category_name_translation FROM 'C:\Program Files\PostgreSQL\15\bin\product_category_name_translation.csv' delimiter ',' csv header
;
CREATE TABLE products (
	product_id character varying (100) primary key,
	product_category_name character varying (100),
	product_name_length integer,
	product_description_length integer,
	product_photos_qty integer,
	product_weight_g integer,
	product_length_cm integer,
	product_height_cm integer,
	product_width_cm integer,
	FOREIGN KEY (product_category_name) REFERENCES product_category_name_translation (product_category_name)
);-- bu tablo da veriler portekizce
COPY products FROM 'C:\Program Files\PostgreSQL\15\bin\olist_products_dataset.csv' delimiter ',' csv header
;-- veriyi yükleyemiyor. çünkü pc_gamer mesleğini bağlı olduğu dosyada bulamıyor bu yüzden drop constraint yapacağım.
------------
--ERROR:  Key (product_category_name)=(pc_gamer) is not present in table "product_category_name_translation".
--insert or update on table "products" violates foreign key constraint "products_product_category_name_fkey" 
--ERROR:  insert or update on table "products" violates foreign key constraint "products_product_category_name_fkey"
--SQL state: 23503
--Detail: Key (product_category_name)=(pc_gamer) is not present in table "product_category_name_translation".
------------
CREATE TABLE order_items (
	order_id character varying (150),
	order_item_id integer,
	product_id character varying (50),
	seller_id character varying (50),
	shipping_limit_date timestamp, 
	price real,
	freight_value real,
	FOREIGN KEY (order_id) REFERENCES orders (order_id),
	FOREIGN KEY (product_id) REFERENCES products (product_id),
	FOREIGN KEY (seller_id) REFERENCES sellers (seller_id)
	);
---- 4244733e06e7ecb4970a6e2683c13e61 bu "  ... " iki tırnak arasında listede ama products dosyasında " ... " işaretleri arasında değil.
COPY order_items FROM 'C:\Program Files\PostgreSQL\15\bin\olist_order_items_dataset.csv' delimiter ',' csv header
;
select count(*) from customers
select count(*) from order_items
select count(*) from order_payments
select count(*) from order_reviews
select count(*) from orders
select count(*) from product_category_name_translation
select count(*) from products
select count(*) from sellers

