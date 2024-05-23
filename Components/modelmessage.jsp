<%
  String modelmessage = (String) session.getAttribute("modelmessage");
  if (modelmessage != null) {
%>
  <div class="alert alert-success" role="alert">
    <strong><%= modelmessage %></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
<%
    session.removeAttribute("modelmessage"); 
  }
%>
