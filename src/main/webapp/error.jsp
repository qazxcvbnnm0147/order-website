<%-- 
    Document   : error
    Created on : 2021/12/29, 下午 04:21:12
    Author     : user
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
        <title>WSKGOOD 點餐系統 - 密碼錯誤</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="text-center mb-4">
                <h1 class="header-title">WSKGOOD 點餐系統</h1>
            </div>

            <div class="card mx-auto" style="max-width: 400px;">
                <div class="card-header text-center">
                    <h4 class="text-danger">密碼錯誤</h4>
                </div>
                <div class="card-body">
                    <p class="text-center text-danger">您輸入的密碼錯誤，請重試或使用其他方式恢復您的密碼。</p>
                    <div class="text-center">
                        <a href="login.jsp" class="btn btn-primary">返回登入</a>
                        <a href="forgetpassword.jsp" class="btn btn-secondary">忘記密碼</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
