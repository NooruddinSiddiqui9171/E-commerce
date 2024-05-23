<%@page import="java.util.List" %>
<%@page import="com.mycompany.dao.ProductDao" %>
<%@page import="com.mycompany.healper.CalculateDiscount" %>
<%@page import="com.mycompany.entity.Product" %>
<%@page import="com.mycompany.dao.CategoryDao" %>
<%@page import="com.mycompany.entity.Category" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <title>All Products</title>
        <%@include file="Components/common_css_js.jsp" %>
        <%@include file="Components/common_modals.jsp" %>
        <%
          String cat = request.getParameter("category");
          List<Product> productList2 = null;
          if(cat==null || cat.trim().equals("all"))
          {
          productList2 = ProductDao.getProducts();
          }
          else
          {
          int cid = Integer.parseInt(cat.trim());
          productList2 = ProductDao.getProductsById(cid);
          }
        %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
               
        <div class="row mt-3 justify-content-center">
            <div style="border-bottom: 1px solid black">
                <h2>FEATURED PRODUCTS</h2>
            </div>
        </div>

        <div class="row mt-3 justify-content-center">
            <%
                int cardCount = 0;
                for(Product product: productList2)
                {
                        int discount = CalculateDiscount.calculateDiscount(product.getProduct_price(),product.getProduct_discount());
                        if(cardCount % 3 == 0)
                        {
            %>
            <div class="row mt-3 justify-content-center">

                <%
                   } 
                %>
                <div class="col-md-4 mt-2">
                    <div class="card">
                        <img class="img-fluid" src="img/Products/<%=product.getProduct_photo()%>" alt="Card image cap">
                        <div class="card-body text-center">
                            <h5 class="card-title"><%=product.getProduct_title()%></h5>
                            <p class="card-text">
                                <span style=" color: red"><s>&#8377;<%=product.getProduct_price()%></s></span> <!-- Non-discounted price -->
                                <span>&#8377;<%=discount%></span> <!-- Discounted price -->
                            </p>
                            <div class="text-center mt-4">
                                <button type="button" class="btn btn-outline-info" onclick="add_to_cart(<%=product.getProduct_id()%>,'<%=product.getProduct_title()%>',<%=discount%>,'<%=product.getProduct_quantity()%>')">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                            cardCount++;
                            if(cardCount % 3 == 0 || cardCount == 6)
                            {
                %>
            </div>
            <% } } %>
        </div>
    </body>
</html>
