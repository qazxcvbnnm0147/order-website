<%
    String id=request.getParameter("id");
    String password=request.getParameter("password");
    
    if("user".equals(id)&&"pass".equals(password)){
        response.sendRedirect("admin/index.jsp");
    }else{
        response.sendRedirect("error.jsp");
    }
%>
