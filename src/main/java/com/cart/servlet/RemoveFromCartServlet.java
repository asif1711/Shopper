package com.cart.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import com.cart.model.Product;

public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        HttpSession session = req.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(p -> p.getId() == id);
        }

        resp.sendRedirect("cart.jsp");
    }
}
