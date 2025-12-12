package com.cart.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.cart.dao.ProductDAO;
import com.cart.model.Product;

public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        String imageUrl = req.getParameter("imageUrl");

        Product p = new Product(name, description, price, imageUrl);
        ProductDAO dao = new ProductDAO();

        boolean saved = dao.addProduct(p);

        if (saved) {
            resp.sendRedirect("admin-add-product.jsp?msg=added");
        } else {
            resp.sendRedirect("admin-add-product.jsp?msg=error");
        }
    }
}
