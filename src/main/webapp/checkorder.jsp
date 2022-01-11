<%-- 
    Document   : checkorder
    Created on : 2022/1/7, 下午 06:30:28
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="admin/index.jsp">Admin</a>
        <a href="register.jsp;">New</a>
        <h1>Hello World!</h1>
        <%
            String lie="";
            Cookie [] cookies=request.getCookies();
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("lie")){
                    lie=cookie.getValue();
                    break;
                }
            }
            out.print(lie);
            if(lie.equals("yes"))
            {
                %>
                <jsp:forward page="orderfood.jsp"/>
                <%
            }                          
            String food_main="";
            cookies=request.getCookies();
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("food_main")){
                    food_main=cookie.getValue();
                    break;
                }
            }
            String food_sub="";
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("food_sub")){
                    food_sub=cookie.getValue();
                    break;
                }
            }
            String drinks="";
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("drinks")){
                    drinks=cookie.getValue();
                    break;
                }
            } 
            String total="";
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("total")){
                    total=cookie.getValue();
                    break;
                }
            }
            out.print(food_main);
            out.print(food_sub);
            out.print(drinks);
            out.print(total);
            String discount=request.getParameter("discount");
            out.print(discount);
            if(discount!=null)
            {
                if ( discount.equals("1")){
                    int total_login;
                    total_login=(int)(Float.parseFloat(total)*0.9);
                    String string_total_login= String.valueOf(total_login);
                    out.print(string_total_login);
                }
            }
           
           
        %>
        <img style="position: absolute; left :0px; top: 300px; bottom: 200px" width="150" height="150" src="./picture/<%=food_main%>.jpg"></img>
        <img style="position: absolute; left :150px; top: 300px; bottom: 200px" width="150" height="150" src="./picture/<%=food_sub%>.jpg"></img>
        <img style="position: absolute; left :300px; top: 300px; bottom: 200px" width="150" height="150" src="./picture/<%=drinks%>.jpg"></img>
        <a href="number?buy=1">pay</a>
    </body>
</html>
