<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - UrbanPulse</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">
                        <div class="card-header custom-bg text-white text-center ">
                            <%@include file="Components/errorMessage.jsp"%>
                            <h3>LOGIN</h3>
                            <h6>Please enter your login and password</h6>
                        </div>
                            <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <i class="fa-solid fa-envelope"></i>
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <i class="fa-solid fa-lock"></i>
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    <a href="#">Forgot password!</a>
                                </div>
                                <div class="container text-center"> 
                                    <button type="submit" class="btn btn-outline-primary">Submit</button>
                                </div>
                                <div class="container text-center mt-2">
                                    <a href="Register.jsp">Don't have an account? <strong>Register</strong></a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
