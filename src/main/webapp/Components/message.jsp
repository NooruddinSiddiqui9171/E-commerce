<% 
  String message = (String)session.getAttribute("message");
  if(message!=null)
  {
%>
  <div class="alert alert-primary alert-dismissible fade show" role="alert">
  <strong>Registration Successful!</strong> Congratulations on successfully registering with us!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close" >
    <span aria-hidden="true">&times;</span>
  </button>
  </div>
<%
  session.removeAttribute("message");
  }
%>