<%-- 
    Document   : forgetpassword
    Created on : 2024年11月26日, 下午10:40:44
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
        <title>WSKGOOD 點餐系統 - 忘記密碼</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="text-center mb-4">
                <h1 class="header-title">WSKGOOD 點餐系統</h1>
            </div>

            <div class="card mx-auto" style="max-width: 400px;">
                <div class="card-header text-center">
                    <h4 class="text-primary">忘記密碼</h4>
                </div>
                <div class="card-body">
                    <form method="POST" action="processForgetpassword">
                        <div class="mb-3">
                            <label for="user_id" class="form-label">請輸入您的使用者ID</label>
                            <input type="text" class="form-control" id="user_id" name="id" required/>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <a href="login.jsp" class="btn btn-secondary">返回登入</a>
                </div>
            </div>
        </div>
    </body>
</html>
