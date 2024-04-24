<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class="row mt-4">
            <div class="col-md-4 offset-md-4">
                <div class="card border-info">
                    <div class="card-body px-4">
                        <%@include file="Components/message.jsp"%>
                        <%@include file="Components/errorMessage.jsp"%>
                        <h3 class="my-3">Sign up here</h3>
                        <form action="RegisterServlet" method="post">
                            <div class="form-group">
                                <i class="fa-solid fa-user"></i>
                                <label for="name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here">
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-envelope"></i>
                                <label for="email">Email address</label>
                                <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-lock"></i>
                                <label for="password">Password</label>
                                <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here">
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-phone"></i>
                                <label for="phone">Mobile Number</label>
                                <input name="user_phone" type="text" class="form-control" id="phone" placeholder="Enter here">
                            </div>
                            <div class="form-group">
                                <i class="fa-solid fa-address-book"></i>
                                <label for="address">User Address</label>
                                <textarea name="user_address" class="form-control" id="address" placeholder="Enter your address"></textarea>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Register</button>
                                <button type="reset" class="btn btn-outline-warning">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
