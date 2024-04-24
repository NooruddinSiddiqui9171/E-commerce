<%
  String errormessage = (String) session.getAttribute("errormessage");
  if (errormessage != null) {
%>
  <div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong><%= errormessage %></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
<%
    session.removeAttribute("errormessage"); // Corrected attribute name
  }
%>

