package com.cart.servlet;

import java.io.IOException;
import java.util.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import com.cart.dao.ProductDAO;
import com.cart.model.Product;
import com.cart.model.CartItem;

public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        ProductDAO dao = new ProductDAO();
        Product p = dao.getProductById(id);

        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;

        for (CartItem item : cart) {
            if (item.getProductId() == id) {
                item.setQuantity(item.getQuantity() + 1);
                found = true;
                break;
            }
        }

        if (!found) {
            cart.add(new CartItem(id, p.getName(), p.getPrice()));
        }

        session.setAttribute("cart", cart);

        resp.sendRedirect("cart.jsp");
    }
}
