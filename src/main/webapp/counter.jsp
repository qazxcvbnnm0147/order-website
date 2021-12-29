<%-- 
    Document   : counter
    Created on : 2021/12/29, 下午 03:32:11
    Author     : user
--%>

<%@page import="lendle.courses.network.loginws.CounterListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=CounterListener.counter%></h1>
    </body>
</html>
