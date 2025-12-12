package com.cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.cart.db.DBConnection;
import com.cart.model.User;

public class UserDAO {

    public boolean registerUser(User user) {
        boolean result = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword()); 
            ps.setString(4, user.getRole());

            int rows = ps.executeUpdate();

            System.out.println("ROWS INSERTED = " + rows);
            
            if (rows > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println("REGISTER SUCCESS = " + result);
        return result;
    }
    
    public User login(String email, String password) {
        User user = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            var rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;  // returns null if invalid credentials
    }

}
