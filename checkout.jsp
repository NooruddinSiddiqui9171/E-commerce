<%
   User user =(User) session.getAttribute("current-user");
   if(user == null)
   {
     session.setAttribute("errormessage", "You are not logged in !! Login First To Access Checkout Page");
     response.sendRedirect("login.jsp");
     return;
   }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UrbanPulse - Checkout</title>
        <%@include file="Components/common_css_js.jsp" %>
        <%@include file="Components/common_modals.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>  


        <div class="row mt-3 p-2">

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">

                        <h3 class="text-center mb-5">Your Selected Items</h3>
                        <div class="cart-body">

                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">

                        <h3 class="text-center mb-5">Your Details For Order</h3>
                        <form action="#" >
                            <div class="form-group">
                                <label for="InputEmail1">Email address</label>
                                <input value="<%= user.getEmail_id()%>" type="email" class="form-control" id="InputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="name">Your Name</label>
                                <input value="<%= user.getUsername()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Here">
                            </div>
                            <div class="form-group">
                                <label for="shippingaddress">Your Shipping Address</label>
                                <textarea class="form-control" id="shippingaddress" rows="3"></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Order Now</button>
                                <button class="btn btn-outline-primary">Continue Shopping</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
