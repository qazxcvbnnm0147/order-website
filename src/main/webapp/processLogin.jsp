<%
    String id=request.getParameter("id");
    String password=request.getParameter("password");
    
    if("user".equals(id)&&"pass".equals(password)){
        session.setAttribute("loggedInUser", id);
        response.sendRedirect("admin/index.jsp");
    }else{
        response.sendRedirect("error.jsp");
    }
%>
