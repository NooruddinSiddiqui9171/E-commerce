<%@page import="com.mycompany.entity.User" %>
<%@page import="com.mycompany.entity.Category" %>
<%@page import="com.mycompany.dao.CategoryDao" %>
<%@page import="java.util.List" %>
<%
   User user =(User) session.getAttribute("current-user");
   if(user == null)
   {
     session.setAttribute("errormessage", "You are not logged in !! Login First");
     response.sendRedirect("login.jsp");
     return;
   }else
   {
     if (user.getUserType().equals("normal"))
     {
     session.setAttribute("errormessage", "You are not admin !! Do not Access This Page");
     response.sendRedirect("login.jsp");
     return; 
     }
    
   }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class="text-center"> <%@include file="Components/modelmessage.jsp"%></div>
        <div class="container">
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card border-primary">
                        <div class="card-header text-center bg-primary"><strong style="color: white;"><i class="fa-solid fa-users"></i> USERS</strong></div>
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <img style="max-width: 120px" class="img-fluid" src="img/man.png" alt="Card image cap">
                            </div>
                            <h5 class="card-title mt-4">Total User:</h5>
                            <div class="container text-center mt-4">
                                <button type="button" class="btn btn-outline-primary mx-1" data-toggle="modal" data-target="#addUserModal">Add</button>
                                <button type="button" class="btn btn-outline-primary mx-1" data-toggle="modal" data-target="#removeUserModal">Remove</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-primary">
                        <div class="card-header text-center bg-primary"><strong style="color: white;"><i class="fa-solid fa-list"></i> CATEGORIES</strong></div>
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <img style="max-width: 120px" class="img-fluid" src="img/options.png" alt="Card image cap">
                            </div>
                            <h5 class="card-title mt-4">Total Categories:</h5>
                            <div class="container text-center mt-4">
                                <button type="button" class="btn btn-outline-primary mx-1" data-toggle="modal" data-target="#categoryModal">Add</button>
                                <button type="button" class="btn btn-outline-primary mx-1" data-toggle="modal" data-target="#removeCategoryModal">Remove</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-primary">
                        <div class="card-header text-center bg-primary"><strong style="color: white;"><i class="fa-solid fa-store"></i> PRODUCTS</strong></div>
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <img style="max-width: 120px" class="img-fluid" src="img/product.png" alt="Card image cap">
                            </div>
                            <h5 class="card-title mt-4">Total Products:</h5>
                            <div class="container text-center mt-4">
                                <button type="button" class="btn btn-outline-primary mx-1" data-toggle="modal" data-target="#productModal">Add</button>
                                <button type="button" class="btn btn-outline-primary mx-1" data-toggle="modal" data-target="#removeProductModal">Remove</button>
                            </div>
                        </div>
                    </div>
                </div>           
            </div>

            <div class="row mt-6 mt-4 mb-4">
                <div class="col-md-6">
                    <div class="card border-primary">
                        <div class="card-header text-center bg-primary"><strong style="color: white;"><i class="fa-solid fa-message"></i> Messages</strong></div>
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <img style="max-width: 120px" class="img-fluid" src="img/chat.png" alt="Card image cap">
                            </div>
                            <h5 class="card-title mt-4">New Messages:</h5>
                            <div class="container text-center mt-4">
                                <a class="btn btn-outline-primary mx-1" href="#" role="button">See</a>
                                <a class="btn btn-outline-primary mx-1" href="#" role="button">Remove</a>
                            </div>
                        </div>
                    </div>                
                </div>
                <div class="col-md-6">
                    <div class="card border-primary">
                        <div class="card-header text-center bg-primary"><strong style="color: white;"><i class="fa-solid fa-eye"></i> Visitors</strong></div>
                        <div class="card-body">
                            <div class="d-flex justify-content-center">
                                <img style="max-width: 120px" class="img-fluid" src="img/gamer.png" alt="Card image cap">
                            </div>
                            <h5 class="card-title mt-4">Daily Visitors:</h5>
                            <div class="container text-center mt-4">
                                <a class="btn btn-outline-primary mx-1" href="#" role="button">Daily</a>
                                <a class="btn btn-outline-primary mx-1" href="#" role="button">Monthly</a>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>


        <!--        this model is for adding user -->
        <div class="modal" id="addUserModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title">ADD USER</h5>
                    </div>
                    <div class="modal-body">
                        <form action="#">
                            <div class="form-group">
                                <input type="hidden" name="operation" value="adduser">
                                <label for="usernameInput">Username:</label>
                                <input type="text" class="form-control" id="usernameInput" placeholder="Enter Username" required>
                            </div>
                            <div class="form-group">
                                <label for="emailInput">Email:</label>
                                <input type="email" class="form-control" id="emailInput" placeholder="Enter Email" required>
                            </div>
                            <div class="form-group">
                                <label for="passwordInput">Password:</label>
                                <input type="password" class="form-control" id="passwordInput" placeholder="Enter Password" required>
                            </div>
                            <div class="form-group">
                                <label for="phoneInput">Phone:</label>
                                <input type="text" class="form-control" id="phoneInput" placeholder="Enter Phone" required>
                            </div>
                            <div class="form-group">
                                <label for="picInput">Profile Picture:</label>
                                <input type="file" class="form-control-file" id="picInput" accept="image/*">
                            </div>
                            <div class="form-group">
                                <label for="addressInput">Address:</label>
                                <input type="text" class="form-control" id="addressInput" placeholder="Enter Address" required>
                            </div>
                            <div class="form-group">
                                <label for="userTypeInput">User Type:</label>
                                <select class="form-control" id="userTypeInput" required>
                                    <option value="">Select User Type</option>
                                    <option value="admin">Admin</option>
                                    <option value="user">User</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Add User</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <!--       this model is for removing user-->
        <div class="modal" id="removeUserModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title">REMOVE USER</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="removeUserIdInput">User ID:</label>
                            <input type="text" class="form-control" id="removeUserIdInput" placeholder="Enter User ID" readonly>
                        </div>
                        <div class="form-group">
                            <label for="removeUsernameInput">Username:</label>
                            <input type="text" class="form-control" id="removeUsernameInput" placeholder="Enter Username" readonly>
                        </div>
                        <p>Are you sure you want to remove this user?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="removeUserButton">Remove</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>




        <!--        This model is for adding Categories-->
        <div class="modal" id="categoryModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title">FILL CATEGORIES DETAILS</h5>
                    </div>
                    <div class="modal-body">
                        <form action="AddProductOperations" method="post">
                            <div class="form-group">
                                <input type="hidden" name="operation" value="addcategory">
                                <label for="categoryTitleInput">Category Title:</label>
                                <input type="text" class="form-control" id="categoryTitleInput" name="categorytitle" placeholder="Enter Category Title" required>
                            </div>
                            <div class="form-group">
                                <label for="categoryDescriptionInput">Category Description:</label>
                                <textarea style="height: 200px" class="form-control" id="categoryDescriptionInput" placeholder="Enter Category Description" name="categorydescription" required></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" >Save Changes</button>
                                <button type="reset" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <!--        this model is for removing category-->
        <div class="modal" id="removeCategoryModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title">REMOVE CATEGORY</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="categoryIdInput">Category ID:</label>
                            <input type="text" class="form-control" id="categoryIdInput" placeholder="Enter Category ID" readonly>
                        </div>
                        <div class="form-group">
                            <label for="categoryTitleInput">Category Title:</label>
                            <input type="text" class="form-control" id="categoryTitleInput" placeholder="Enter Category Title" readonly>
                        </div>
                        <p>Are you sure you want to remove this category?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="removeCategoryButton">Remove</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>


        <!--        This model is for adding product-->
        <div class="modal" id="productModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title">FILL PRODUCT DETAILS</h5>
                    </div>
                    <div class="modal-body">
                        <form action="AddProductOperations" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="hidden" name="operation" value="addproduct">
                                <label for="productTitleInput">Product Title:</label>
                                <input type="text" class="form-control" id="productTitleInput" name="producttitle" placeholder="Enter Product Title" required>
                            </div>
                            <div class="form-group">
                                <label for="productPriceInput">Product Price:</label>
                                <input type="text" class="form-control" id="productPriceInput" name="productprice" placeholder="Enter Product Price" required>
                            </div>
                            <div class="form-group">
                                <label for="productDiscountInput">Product Discount:</label>
                                <input type="text" class="form-control" id="productDiscountInput" name="productdiscount" placeholder="Enter Product Discount" required>
                            </div>
                            <div class="form-group">
                                <label for="productQuantityInput">Product Quantity:</label>
                                <input type="text" class="form-control" id="productQuantityInput" name="productquantity" placeholder="Enter Product Quantity" required>
                            </div>
                            <%
                            List<Category> list = CategoryDao.getCategory();                           
                            %>
                            <div class="form-group">
                                <label for="userTypeInput">Category:</label>
                                <select class="form-control" id="productCategory" name="productcategoryid" required>
                                    <%
                                      for(Category c:list){
                                    %>
                                    <option value="<%=c.getCategory_id()%>"><%=c.getCategory_title()%></option>
                                    <%
                                      }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="productDescriptionInput">Product Description:</label>
                                <textarea style="height: 200px" class="form-control" id="productDescriptionInput" placeholder="Enter Product Description" name="productdescription" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="productImageInput">Product Image:</label>
                                <input type="file" class="form-control-file" id="productImageInput" name="productimage" accept="image/*">
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!--        this model is for removing product -->
        <div class="modal" id="removeProductModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title">REMOVE PRODUCT</h5>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="productIdInput">Product ID:</label>
                            <input type="text" class="form-control" id="productIdInput" placeholder="Enter Product ID">
                        </div>
                        <div class="form-group">
                            <label for="productNameInput">Product Name:</label>
                            <input type="text" class="form-control" id="productNameInput" placeholder="Enter Product Name">
                        </div>
                        <div class="form-group">
                            <label for="categoryIdInput">Category ID:</label>
                            <input type="text" class="form-control" id="categoryIdInput" placeholder="Enter Category ID">
                        </div>
                        <p>Are you sure you want to remove this product?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="removeButton">Remove</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>



    </body>
</html>
