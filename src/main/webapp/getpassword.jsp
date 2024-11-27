<%-- 
    Document   : getpassword
    Created on : 2024年11月26日, 下午11:05:58
    Author     : qazxc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <style>
        .header-title {
            font-size: 32px;
            color: green;
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WSKGOOD 點餐系統 - 密碼提示</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="text-center mb-4">
                <h1 class="header-title ">WSKGOOD 點餐系統</h1>
            </div>

            <div class="card mx-auto" style="max-width: 400px;">
                <div class="card-header text-center">
                    <h4 class="text-primary">密碼提示</h4>
                </div>
                <div class="card-body text-center">
                    <%
                        String password = "";
                        Cookie[] cookies = request.getCookies();

                        if (cookies != null) {
                            for (Cookie cookie : cookies) {
                                if ("password".equals(cookie.getName())) {
                                    password = cookie.getValue();
                                    break;
                                }
                            }
                        }
                    %>
                    <p class="fs-5">
                        您的密碼為：<strong class="text-danger"><%= password %></strong>
                    </p>
                </div>
                <div class="card-footer text-center">
                    <a href="login.jsp" class="btn btn-primary">返回登入</a>
                </div>
            </div>
        </div>
    </body>
</html>
