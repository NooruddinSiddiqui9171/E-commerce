package com.mycompany.servlets;

import com.mycompany.dao.CategoryDao;
import com.mycompany.dao.ProductDao;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

@MultipartConfig
public class AddProductOperations extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String operation = request.getParameter("operation");
            if (operation.trim().equals("addcategory")) {
                String categoryTitle = request.getParameter("categorytitle");
                String categoryDescription = request.getParameter("categorydescription");

                CategoryDao.saveCategory(categoryTitle, categoryDescription);
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("modelmessage", "Category Added Successfuly!");
                response.sendRedirect("admin.jsp");

            } else if (operation.trim().equals("addproduct")) {

                String title = request.getParameter("producttitle");
                String price = request.getParameter("productprice");
                String discount = request.getParameter("productdiscount");
                String quantity = request.getParameter("productquantity");
                int categoryID = Integer.parseInt(request.getParameter("productcategoryid"));
                String description = request.getParameter("productdescription");
                Part img = request.getPart("productimage");
                String imagename = img.getSubmittedFileName();

                ProductDao.saveProduct(title, description, imagename, price, discount, quantity, categoryID); 
                InputStream ip = img.getInputStream();
                byte[] data = new byte[(ip.available())];
                ip.read(data);
                ServletContext servletContext = getServletContext();
                String path = servletContext.getRealPath("img") + File.separator + "Products" + File.separator + imagename;
                System.out.println(path);
                FileOutputStream fos = new FileOutputStream(path);
                fos.write(data);

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("modelmessage", "Product Added Successfuly!");
                response.sendRedirect("admin.jsp");

            } else if (operation.trim().equals("adduser")) {

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
