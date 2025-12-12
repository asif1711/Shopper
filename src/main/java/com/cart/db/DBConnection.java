package com.cart.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection connection = null;

    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {

                Class.forName("oracle.jdbc.driver.OracleDriver");

                connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521/XEPDB1",
                    "ecommerce",         // your Oracle username
                    "ecommerce123"       // your Oracle password
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
