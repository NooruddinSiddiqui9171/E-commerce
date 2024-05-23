package com.mycompany.servlets;

import com.mycompany.dao.UserDao;
import com.mycompany.entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            if (email.equals("")) {
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("errormessage", "Please Enter Email Address!");
                response.sendRedirect("login.jsp");
            } else if (password.equals("")) {
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("errormessage", "Please Enter Password!");
                response.sendRedirect("login.jsp");
            } else {
                User user = UserDao.getUserByEmailAndPassword(email, password);
//              System.out.println(user);
                if (user == null) {
                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("errormessage", "Invaild User ID Password");
                    response.sendRedirect("login.jsp");
                } else {
                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("current-user", user);
                    if (user.getUserType().equals("admin")) {
                        response.sendRedirect("admin.jsp");
                    } else if (user.getUserType().equals("normal")) {
                        response.sendRedirect("index.jsp");
                    } 
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
