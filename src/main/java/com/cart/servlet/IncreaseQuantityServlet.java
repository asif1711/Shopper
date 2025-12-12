package com.cart.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import com.cart.model.CartItem;

public class IncreaseQuantityServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        for (CartItem item : cart) {
            if (item.getProductId() == id) {
                item.setQuantity(item.getQuantity() + 1);
                break;
            }
        }

        resp.sendRedirect("cart.jsp");
    }
}
