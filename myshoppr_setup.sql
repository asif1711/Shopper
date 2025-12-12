---------------------------------------------
-- MyShoppr - Database Setup Script (Oracle)
-- Author: Your Name
-- Database: Oracle 21c XE (XEPDB1)
---------------------------------------------

-- IMPORTANT:
-- Log in as the ECOMMERCE user before running:
-- SQL> CONNECT ecommerce/ecommerce123@XEPDB1;
---------------------------------------------


---------------------------------------------
-- 1. DROP TABLES (for re-run safety)
---------------------------------------------
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE order_items';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE orders';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE products';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE users';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE user_seq';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE product_seq';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE order_seq';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE order_item_seq';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

---------------------------------------------
-- 2. CREATE USERS TABLE
---------------------------------------------
CREATE TABLE users (
    id         NUMBER PRIMARY KEY,
    name       VARCHAR2(100) NOT NULL,
    email      VARCHAR2(100) UNIQUE NOT NULL,
    password   VARCHAR2(200) NOT NULL,
    role       VARCHAR2(20) DEFAULT 'USER'
);

CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;


---------------------------------------------
-- 3. CREATE PRODUCTS TABLE
---------------------------------------------
CREATE TABLE products (
    id          NUMBER PRIMARY KEY,
    name        VARCHAR2(200) NOT NULL,
    description CLOB,
    price       NUMBER(10,2) NOT NULL,
    image_url   VARCHAR2(500)
);

CREATE SEQUENCE product_seq START WITH 1 INCREMENT BY 1;


---------------------------------------------
-- 4. CREATE ORDERS TABLE
---------------------------------------------
CREATE TABLE orders (
    id            NUMBER PRIMARY KEY,
    user_email    VARCHAR2(100) NOT NULL,
    order_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount  NUMBER(10,2) NOT NULL,

    CONSTRAINT fk_order_user FOREIGN KEY (user_email)
        REFERENCES users(email)
);

CREATE SEQUENCE order_seq START WITH 1 INCREMENT BY 1;


---------------------------------------------
-- 5. CREATE ORDER_ITEMS TABLE
---------------------------------------------
CREATE TABLE order_items (
    id            NUMBER PRIMARY KEY,
    order_id      NUMBER NOT NULL,
    product_name  VARCHAR2(200) NOT NULL,
    price         NUMBER(10,2) NOT NULL,
    quantity      NUMBER NOT NULL,

    CONSTRAINT fk_orderitem_order FOREIGN KEY (order_id)
        REFERENCES orders(id)
);

CREATE SEQUENCE order_item_seq START WITH 1 INCREMENT BY 1;


---------------------------------------------
-- 6. INSERT DEFAULT ADMIN USER
---------------------------------------------
INSERT INTO users (id, name, email, password, role)
VALUES (user_seq.NEXTVAL, 'Admin', 'admin@shop.com', 'admin123', 'ADMIN');

COMMIT;


---------------------------------------------
-- 7. INSERT SAMPLE PRODUCT DATA (Optional)
---------------------------------------------
INSERT INTO products (id, name, description, price, image_url)
VALUES (product_seq.NEXTVAL, 'Wireless Headphones', 'Bluetooth over-ear headphones', 1499.00,
'https://via.placeholder.com/400x300?text=Headphones');

INSERT INTO products (id, name, description, price, image_url)
VALUES (product_seq.NEXTVAL, 'Smartwatch', 'Fitness tracking smartwatch with AMOLED display', 2999.00,
'https://via.placeholder.com/400x300?text=Smartwatch');

INSERT INTO products (id, name, description, price, image_url)
VALUES (product_seq.NEXTVAL, 'Laptop Backpack', 'Water-resistant backpack with 15-inch laptop sleeve', 899.00,
'https://via.placeholder.com/400x300?text=Backpack');

INSERT INTO products (id, name, description, price, image_url)
VALUES (product_seq.NEXTVAL, 'Gaming Mouse', 'RGB gaming mouse with 6 programmable buttons', 599.00,
'https://via.placeholder.com/400x300?text=Mouse');

COMMIT;


---------------------------------------------
-- DATABASE SETUP COMPLETE
---------------------------------------------
PROMPT =============================================
PROMPT MyShoppr Database Setup Completed Successfully
PROMPT =============================================
