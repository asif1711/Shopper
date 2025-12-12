package com.cart.servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import com.cart.dao.ProductDAO;
import com.cart.model.Product;

public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        String imageUrl = req.getParameter("imageUrl");

        Product p = new Product(name, description, price, imageUrl);
        p.setId(id);

        ProductDAO dao = new ProductDAO();

        if (dao.updateProduct(p)) {
            resp.sendRedirect("admin-products.jsp?msg=updated");
        } else {
            resp.sendRedirect("admin-products.jsp?msg=error");
        }
    }
}
