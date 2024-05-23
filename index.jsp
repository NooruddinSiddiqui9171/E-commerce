<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.List" %>
<%@page import="com.mycompany.dao.ProductDao" %>
<%@page import="com.mycompany.healper.CalculateDiscount" %>
<%@page import="com.mycompany.entity.Product" %>
<%@page import="com.mycompany.dao.CategoryDao" %>
<%@page import="com.mycompany.entity.Category" %>
<%
           List<Product> productList = ProductDao.getProducts();
           List<Category> categoryList2 = CategoryDao.getCategory();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UrbanPulse - Home</title>
        <%@include file="Components/common_css_js.jsp" %>
        <%@include file="Components/common_modals.jsp" %>
        <style>
            #special.hover-effect{
                transition: transform 0.3s ease;
            }
            #special.hover-effect:hover {
                transform: scale(1.1);
            }
        </style>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>                
        <div class="row">
            <div class="col-md-12">
                <div id="myslider" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="img-fluid" src="img/banner/banner1.png" alt="">
                        </div>
                        <div class="carousel-item ">
                            <img class="img-fluid" src="img/banner/banner2.png" alt="">
                        </div>
                        <div class="carousel-item ">
                            <img class="img-fluid" src="img/banner/banner3.png" alt="">
                        </div>
                        <div class="carousel-item ">
                            <img class="img-fluid" src="img/banner/banner4.png" alt="">
                        </div>
                        <div class="carousel-item ">
                            <img class="img-fluid" src="img/banner/banner5.png" alt="">
                        </div>
                        <div class="carousel-item ">
                            <img class="img-fluid" src="img/banner/banner6.png" alt="">
                        </div>
                    </div>
                    <a href="#myslider" class="carousel-control-prev" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a href="#myslider" class="carousel-control-next" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                    <ul class="carousel-indicators">
                        <li data-target="#myslider" class="active" data-slide-to="0"></li>
                        <li data-target="#myslider" data-slide-to="1"></li>
                        <li data-target="#myslider" data-slide-to="2"></li>
                        <li data-target="#myslider" data-slide-to="3"></li>
                        <li data-target="#myslider" data-slide-to="4"></li>
                        <li data-target="#myslider" data-slide-to="5"></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-4 text-center border-right border-bottom p-4">
                <h4 class="mb"><i class="fa-solid fa-truck-fast fa-bounce"></i><strong> Free Shipping</strong></h4>
                <p>Enjoy free shipping on all Puna orders or orders above $200.</p>
            </div>
            <div class="col-md-4 text-center border-right border-bottom p-4">
                <h4 class="mb-3"><i class="fa-solid fa-boxes-packing fa-bounce"></i><strong> 30 Days Return</strong></h4>
                <p>Return items hassle-free within 30 days for an exchange.</p>
            </div>
            <div class="col-md-4 text-center border-bottom p-4">
                <h4 class="mb-3"><i class="fa-solid fa-credit-card fa-bounce"></i><strong> 100% Payment Secure</strong></h4>
                <p>Shop with confidence with our secure payment options available worldwide.</p>
            </div>
        </div>

        <div class="row mx-4 mt-4 justify-content-center">
            <div class="col-md-3 mx-1" style="padding-left: 0px;padding-right: 0px">
                <img id="special" class="img-fluid mt-2 hover-effect" src="img/category/category3.png" alt=""> 
                <img id="special" class="img-fluid mt-2 hover-effect" src="img/category/category2.png" alt="">  
            </div>
            <div class="col-md-3 mx-1" style="padding-left: 0px;padding-right: 0px">
                <img id="special" class="img-fluid mt-2 hover-effect" src="img/category/category4.png" alt="">  
                <img id="special" class="img-fluid mt-2 hover-effect" src="img/category/category5.png" alt="">  
            </div>
            <div class="col-md-3 mx-1"style="padding-left: 0px;padding-right: 0px;">
                <img id="special" class="img-fluid mt-2 hover-effect" src="img/category/category1.jpg" alt=""> 
            </div>
        </div>

        <div class="row mt-5 justify-content-center">
            <div style="border-bottom: 1px solid black">
                <h2>FEATURED PRODUCTS</h2>
            </div>
        </div>

        <div class="row mt-3 justify-content-center">
            <%
                int cardCount = 0;
                for(Product product: productList)
                {
                    int discount = CalculateDiscount.calculateDiscount(product.getProduct_price(),product.getProduct_discount());
                    if(cardCount < 6)
                    {
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
            <% } } } %>
        </div>

        <div class="row mt-4 justify-content-center">
            <div>
                <a href="AllProducts.jsp?category=all" style="padding-left: 35px; padding-right: 35px; background: black;" class="btn btn-dark">View All</a>
            </div>
        </div>

        
        <div class="row mt-5">            
            <img class="img-fluid" src="img/banner/bigbanner.png" alt="Card image cap">
        </div>   
     
    </body> 
</html>
