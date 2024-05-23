<%@page import="com.mycompany.entity.User" %>
<%@page import="java.util.List" %>
<%@page import="com.mycompany.dao.CategoryDao" %>
<%@page import="com.mycompany.entity.Category" %>
<%
   User user1 =(User) session.getAttribute("current-user");
   List<Category> categoryList = CategoryDao.getCategory();
%>

<nav class="navbar navbar-expand-lg navbar-light custom-bg">
    <a class="navbar-brand custom-tx" href="index.jsp">UrbanPulse</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link custom-tx" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle custom-tx" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a  href="AllProducts.jsp?category=all" class="dropdown-item border-bottom">All Categories</a>
                    <%
                    for(Category category: categoryList){
                    %>
                    <a href="AllProducts.jsp?category=<%=category.getCategory_id()%>" class="dropdown-item"><%= category.getCategory_title() %></a>
                    <%
                        }
                    %>

                </div>
            </li>
        </ul>


        <ul class="navbar-nav ml-auto ">
            <div class="navbar-nav mr-2">
                <a style="color: white;" data-toggle="modal" data-target="#cart" href="#" class="nav-item nav-link"><i class="fa-solid fa-cart-shopping"></i><span class="cart-items"> ( 0 ) Cart</span></a>
            </div>
            <%
                if(user1 == null){
            %> 
            <li class="nav-item active px-2">
                <a class="btn btn-outline-primary" href="login.jsp" role="button">Login</a>
            </li>

            <li class="nav-item active px-2">
                <a class="btn btn-outline-primary" href="Register.jsp" role="button">Register</a>
            </li>
            <%
                }else
                {
            %>
            <li class="nav-item active px-2">
                <a class="btn btn-outline-primary" href="#" role="button"> <%=user1.getUsername()%></a>
            </li>

            <li class="nav-item active px-2">
                <a class="btn btn-outline-warning" href="LogoutServlet" role="button">Logout</a>
            </li>
            <%
                }
            %>
        </ul>

    </div>
</nav>