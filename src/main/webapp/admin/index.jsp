<%-- 
    Document   : index
    Created on : 2021/12/29, 下午 03:56:59
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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
        <title>WSKGOOD 點餐系統 - 登入成功</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="text-center mb-4">
                <h1 class="header-title">WSKGOOD 點餐系統</h1>
            </div>

            <div class="card mx-auto" style="max-width: 400px;">
                <div class="card-header text-center">
                    <h4 class="text-success">登入成功</h4>
                </div>
                <div class="card-body">
                    <%
                        //從cookie取得user_id
                        String user_id = "";
                        int point = 0;
                        Cookie[] cookies = request.getCookies();
                        
                        if (cookies != null) {
                            for (Cookie cookie : cookies) {
                                if ("user_id".equals(cookie.getName())) {
                                    user_id = cookie.getValue();
                                }
                            }
                        }
                        //連接資料庫 搜尋point值
                        try (Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "")) {
                        PreparedStatement stmt = conn.prepareStatement("select point from login where id = ?");
                          stmt.setString(1,  user_id);
                          try (ResultSet rs1 = stmt.executeQuery()) {
                              if (rs1.next()) {
                                     point = rs1.getInt("point");
                                  } else {
                                      System.out.println("No data found");
                                  }
                            }

                        } catch (Exception e) {
                            throw new ServletException(e);
                        }
                    %>
                    <p class="text-center">歡迎回來! 使用者 <%= user_id %></p>
                    <p class="text-center">您現在擁有 <%= point %> 點回饋點數</p>
                    <div class="text-center">
                        <a href="../login.jsp" class="btn btn-danger">登出</a>
                        <a href="../checkorder.jsp?user_id=<%= user_id %>&point=<%= point %>" class="btn btn-primary">繼續結帳</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
