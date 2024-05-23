package com.mycompany.servlets;

import com.mycompany.entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String username = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_password = request.getParameter("user_password");
            String user_phone = request.getParameter("user_phone");
            String user_address = request.getParameter("user_address");

            if (username.equals("")) {
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Please Enter User Name!");
                response.sendRedirect("Register.jsp");
            } else if (user_email.equals("")) {
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Please Enter Email Address!");
                response.sendRedirect("Register.jsp");
            } else if (user_password.equals("")) {
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Please Enter Password!");
                response.sendRedirect("Register.jsp");
            } else if (user_phone.equals("")) {
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Please Enter Phone Number!");
                response.sendRedirect("Register.jsp");
            } else if (user_address.equals("")) {
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Please Enter Address!");
                response.sendRedirect("Register.jsp");
            } else {
                User user = new User(username, user_email, user_password, user_phone, "default.png", user_address, "normal");
                Configuration cfg = null;
                SessionFactory sessionFactory = null;
                Session session = null;
                Transaction transaction = null;

                cfg = new Configuration();
                cfg.configure("com/myCart/Cfg/hibernate.cfg.xml");
                sessionFactory = cfg.buildSessionFactory();
                session = sessionFactory.openSession();
                try {
                    transaction = session.beginTransaction();
                    session.save(user);
                    transaction.commit();
                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("message", "Registration Successful");
                    response.sendRedirect("Register.jsp");
                    return;
                } catch (HibernateException e) {
                    e.printStackTrace();
                } finally {
                    session.close();
                    sessionFactory.close();
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
