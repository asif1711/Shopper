package com.cart.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import com.cart.db.DBConnection;
import com.cart.model.CartItem;
import com.cart.model.User;

public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (user == null || cart == null || cart.isEmpty()) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        double total = 0;
        for (CartItem item : cart) {
            total += item.getPrice() * item.getQuantity();
        }

        try {
            Connection con = DBConnection.getConnection();

            // Insert order
            String sqlOrder = "INSERT INTO orders (user_email, total_amount) VALUES (?, ?)";
            PreparedStatement psOrder = con.prepareStatement(sqlOrder, new String[] { "id" });

            psOrder.setString(1, user.getEmail());
            psOrder.setDouble(2, total);
            psOrder.executeUpdate();

            // Get generated order ID
            ResultSet rs = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Insert each cart item
            String sqlItem = "INSERT INTO order_items (order_id, product_id, product_name, price, quantity) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement psItem = con.prepareStatement(sqlItem);

            for (CartItem item : cart) {
                psItem.setInt(1, orderId);
                psItem.setInt(2, item.getProductId());
                psItem.setString(3, item.getName());
                psItem.setDouble(4, item.getPrice());
                psItem.setInt(5, item.getQuantity());
                psItem.addBatch();
            }

            psItem.executeBatch();

            // Clear cart after checkout
            session.removeAttribute("cart");

            resp.sendRedirect("order-success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
