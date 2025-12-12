package com.cart.dao;

import java.sql.*;
import java.util.*;

import com.cart.db.DBConnection;

public class OrderDAO {

    public List<Map<String, Object>> getOrdersByUser(String email) {
        List<Map<String, Object>> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT id, order_date, total_amount FROM orders WHERE user_email = ? ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> order = new HashMap<>();
                order.put("id", rs.getInt("id"));
                order.put("date", rs.getTimestamp("order_date"));
                order.put("total", rs.getDouble("total_amount"));
                list.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
