<%-- 
    Document   : login
    Created on : 2021/12/29, 下午 04:34:21
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
        <font size="12" color="green">WSKGOOD點餐系統</font><br><!-- comment -->
        登入會員<br>
        <form method="POST" action="processLogin">
            ID: <input name="id"/><br/>
            Password: <input name="password"/><br/>
            <input type="submit"/>
        </form>
    </body>
</html>
