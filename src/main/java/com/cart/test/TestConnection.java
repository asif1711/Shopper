package com.cart.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.cart.db.DBConnection;

public class TestConnection extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnection.getConnection();
            if (con != null) {
                out.println("Database Connected Successfully!");
            } else {
                out.println("Failed to connect.");
            }
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
