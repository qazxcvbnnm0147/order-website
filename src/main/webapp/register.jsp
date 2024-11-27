<%-- 
    Document   : register
    Created on : 2022/1/7, 下午 09:23:07
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
        <title>WSKGOOD 點餐系統 - 註冊</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="text-center mb-4">
                <h1 class="header-title">WSKGOOD 點餐系統</h1>
            </div>

            <div class="card mx-auto" style="max-width: 400px;">
                <div class="card-header text-center">
                    <h4 class="text-primary">註冊會員</h4>
                </div>
                <div class="card-body">
                    <form action="processregister" method="POST">
                        <div class="mb-3">
                            <label for="id" class="form-label">ID</label>
                            <input type="text" class="form-control" id="id" name="id" required />
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required />
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">註冊</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <a href="login.jsp" class="text-primary">返回登入</a>
                </div>
            </div>
        </div>
    </body>
</html>
