package com.cart.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.cart.dao.UserDAO;
import com.cart.model.User;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(email, password);

        if (user != null) {
            // create session
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            
            resp.sendRedirect("home.jsp");
        } else {
            resp.sendRedirect("login.jsp?msg=invalid");
        }
    }
}
