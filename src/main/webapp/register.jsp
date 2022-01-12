<%-- 
    Document   : register
    Created on : 2022/1/7, 下午 09:23:07
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
        註冊會員<br>
        <form action="processregister">
            id:<input type="text" name="id" value="" /><br>
            password:<input type="text" name="password" value="" /><br>
            <input type="submit" value="submit" />
        </form>
    </body>
</html>
