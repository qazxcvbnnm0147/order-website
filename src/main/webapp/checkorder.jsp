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
        <a href="admin/index.jsp">登入</a>
        <a href="register.jsp;">註冊</a><br>
        <%
            String lie="";
            Cookie [] cookies=request.getCookies();
            String total="";
            String string_total_combo="";
            int total_combo;
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("total")){
                    total=cookie.getValue();
                    break;
                }
            }
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("lie")){
                    lie=cookie.getValue();
                    break;
                }
            }
            if(lie.equals("yes"))
            {
                %>
                <jsp:forward page="index.jsp"/>
                <%
            } 
            else if(lie.equals("no"))
            {
            total_combo = (int)(Float.parseFloat(total)*0.85);
            string_total_combo= String.valueOf(total_combo);
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
            
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("total")){
                    total=cookie.getValue();
                    break;
                }
            }
            
            
            String discount=request.getParameter("discount");
            
            String string_total_login="";
            if(discount!=null)
            {
                if ( discount.equals("1")){
                    int total_login;
                    total_login=(int)(Float.parseFloat(string_total_combo)*0.9);
                    string_total_login= String.valueOf(total_login);
                    
                }
            }
           
           
        %>
        請檢察您的餐點,價格為<%=total%><br>
        經套餐打折後,價格為<%=string_total_combo%><br>
        經登入打折後,價格為<%=string_total_login%><br>
        
        <img style="position: absolute; left :0px; top: 300px; bottom: 200px" width="150" height="150" src="./picture/<%=food_main%>.jpg"></img>
        <img style="position: absolute; left :150px; top: 300px; bottom: 200px" width="150" height="150" src="./picture/<%=food_sub%>.jpg"></img>
        <img style="position: absolute; left :300px; top: 300px; bottom: 200px" width="150" height="150" src="./picture/<%=drinks%>.jpg"></img>
        <a href="number?buy=1">pay</a>
    </body>
</html>
