MyShopr – Online Shopping Platform (Advanced Java Project)
Project Documentation Summary
📝 1. Project Overview

MyShopr is a fully functional online shopping platform developed using Advanced Java (Servlets & JSP) technologies. The system allows users to browse products, add items to the shopping cart, place orders, and manage their profile.
Administrators can manage products, perform CRUD operations, and oversee platform operations.

The platform is designed with a clean, modern UI using Bootstrap 5, offering a professional and user-friendly interface.

🎯 2. Objectives of the Project

Build a real-world online shopping cart application using JSP/Servlets.

Implement authentication and authorization.

Develop a session-based cart management system.

Allow admins to manage products through a dashboard.

Store user data and orders securely in Oracle Database (21c XE).

Demonstrate full-stack development using Java EE components.

Implement MVC architecture for clean code and maintainability.

🏗 3. System Architecture

MyShoppr follows a classic MVC (Model–View–Controller) architecture:

Model

Java Beans representing User, Product, CartItem, etc.

DAO classes for database operations.

View

JSP pages for UI (login, register, products, cart, orders, admin pages).

Controller

Servlet classes handling:

Authentication

Cart operations

Order processing

Admin product management

Database

Oracle 21c Express Edition (XE)

Tables:

users

products

orders

order_items

🎨 4. Frontend Details (UI/UX)

The frontend is built using:

✔ JSP (View Layer)

Each page is styled to look modern and professional, including:

Product listings

Product details

Cart page

Order history

Admin dashboard

✔ Bootstrap 5

Used for:

Responsive layout

Grid systems

Buttons, cards, modals

Table styling

Navbar

Form design

✔ Custom CSS Enhancements

Smooth shadow effects

Rounded cards

Poppins Google Font

Hover animations

Modern buttons

Key UI Features:

Mobile responsive design

Animated product cards

Clean checkout experience

Elegant admin product management UI

⚙ 5. Backend Details

Backend is developed entirely using:

✔ Java Servlets (Controller Layer)

Handles:

User Login / Logout

Registration

Add / Remove Cart Items

Increase / Decrease Quantity

Checkout processing

Order creation

Admin product CRUD operations

✔ JSP

Used for:

Displaying dynamic data

Rendering UI templates

Forms for user/admin actions

✔ DAO Layer (Database Access Layer)

Classes such as:

UserDAO

ProductDAO

OrderDAO

These use:

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement(query);


DAO layer handles:

Insert / Update / Delete

Authentication verification

Cart and order queries

✔ Session Management

Used to store:

Logged-in user

Shopping cart items

✔ Server-Side Validation

Ensures safe and correct user inputs.

🗄️ 6. Database Details

Database: Oracle Database 21c Express Edition (XEPDB1 PDB)
User: ECOMMERCE

Tables:
🟦 1. users
Column	Type	Description
id	NUMBER (PK)	Auto-increment via sequence
name	VARCHAR2(100)	User’s full name
email	VARCHAR2(100)	Unique email
password	VARCHAR2(100)	Encrypted password
role	VARCHAR2(20)	USER / ADMIN
🟦 2. products
Column	Type	Description
id	NUMBER (PK)	Product ID
name	VARCHAR2	Product name
description	CLOB	Details
price	NUMBER(10,2)	Price
image_url	VARCHAR2	Product image
🟦 3. orders
Column	Type	Description
id	NUMBER (PK)	Order ID
user_email	VARCHAR2	Associated user
order_date	TIMESTAMP	Date of order
total_amount	NUMBER(10,2)	Final amount
🟦 4. order_items
Column	Type	Description
id	NUMBER (PK)	Item ID
order_id	NUMBER	FK → orders.id
product_name	VARCHAR2	Name stored snapshot
price	NUMBER	Product price
quantity	NUMBER	Quantity ordered
🚀 7. Deployment Details
✔ Server: Apache Tomcat 10/11
✔ JDK: Java 17
✔ Database: Oracle 21c Express Edition
✔ IDE used: Eclipse Enterprise Edition
Steps to Deploy:

Import the project into Eclipse (Dynamic Web Project).

Add JDBC driver (ojdbc11.jar) to /lib.

Configure Tomcat Server inside Eclipse.

Ensure Oracle DB is running.

Update DB credentials in DBConnection.java.

Run the project using:

http://localhost:8080/MyShoppr/


Login as:

Admin: Insert a row in DB with role = 'ADMIN'

🛠 8. Technologies Used
Backend

Java Servlets

JSP (Java Server Pages)

JDBC

MVC Pattern

Frontend

HTML5

CSS3

Bootstrap 5

JSP Expression Language (EL)

Database

Oracle 21c XE

SQL + JDBC

Sequences & triggers (optional)

Server

Apache Tomcat 10/11

Tools

Eclipse IDE

SQL Plus

Oracle APEX / SQL Developer (optional)

📈 9. Key Features Implemented
✔ User Features

User Registration & Login

Product Browsing

Add to Cart

Increase/Decrease Quantity

Remove Items

Checkout

View Order History

View Order Items

✔ Admin Features

Add Product

Edit Product

Delete Product

View all products

✔ System Features

Session-based cart

Secure password storage

Form validation

Responsive UI

Clean navigation

Professional Bootstrap styling

🏁 10. Conclusion

MyShopr successfully demonstrates a fully functional e-commerce platform built using Advanced Java technologies.
It showcases practical implementations of:

MVC Architecture

JDBC Database Connectivity

Session Handling

Servlets + JSP Integration

Full CRUD operations

Secure authentication

Modern UI/UX with Bootstrap
