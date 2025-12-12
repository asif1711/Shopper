package com.cart.servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import com.cart.dao.ProductDAO;

public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        ProductDAO dao = new ProductDAO();

        if (dao.deleteProduct(id)) {
            resp.sendRedirect("admin-products.jsp?msg=deleted");
        } else {
            resp.sendRedirect("admin-products.jsp?msg=error");
        }
    }
}
