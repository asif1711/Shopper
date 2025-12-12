package com.cart.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.cart.dao.UserDAO;
import com.cart.model.User;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = new User(name, email, password, "USER");

        UserDAO dao = new UserDAO();

        boolean success = dao.registerUser(user);

        System.out.println("REGISTER SUCCESS = " + success);

        if (success) {
            resp.sendRedirect("login.jsp?msg=success");
        } else {
            resp.sendRedirect("register.jsp?msg=error");
        }
    }
}
