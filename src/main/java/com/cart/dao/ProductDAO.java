package com.cart.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.cart.db.DBConnection;
import com.cart.model.Product;

public class ProductDAO {

    // Insert Product
    public boolean addProduct(Product p) {
        boolean saved = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO products (name, description, price, image_url) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getImageUrl());

            int rows = ps.executeUpdate();
            saved = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return saved;
    }

    // Get all products
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM products";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("image_url"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public Product getProductById(int id) {
        Product p = null;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM products WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("image_url"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    public boolean updateProduct(Product p) {
        boolean updated = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "UPDATE products SET name=?, description=?, price=?, image_url=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getImageUrl());
            ps.setInt(5, p.getId());

            updated = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

    public boolean deleteProduct(int id) {
        boolean deleted = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM products WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            deleted = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return deleted;
    }

}
