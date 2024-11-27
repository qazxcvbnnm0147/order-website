<%-- 
    Document   : temp
    Created on : 2024年11月27日, 上午5:08:11
    Author     : qazxc
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WSKGOOD 點餐系統</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    </head>
    <style>
        .header-title {
            font-size: 32px;
            color: green;
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
    <body>
        <div class="container mt-4">
            <div class="text-center mb-4">
                <h1 class="header-title">WSKGOOD 點餐系統</h1>
            </div>

            <div class="mb-3">
                <a href="admin/index.jsp" class="btn btn-primary me-2">登入</a>
                <a href="register.jsp" class="btn btn-secondary">註冊</a>
            </div>

            <div class="alert alert-info">
                <%  //確認登入狀態
                    String user_id = "目前尚未登入";
                    if (request.getParameter("user_id") != null) {
                        user_id = request.getParameter("user_id");
                    }
                %>
                <p>使用者：<strong><%= user_id %></strong></p>
            </div>

            <%  //從cookie取得order_id
                int order_id = 0;
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if ("order_id".equals(cookie.getName())) {
                            order_id = Integer.valueOf(cookie.getValue());
                            break;
                        }
                    }
                }
             %>
            <div class="alert alert-warning">
            <p>請檢查您的餐點的品項跟數量</strong</p>
            <style>
                table {
                    width: 30%;
                    border-collapse: collapse;
                    font-family: Arial, sans-serif;
                }
                th, td {
                    padding: 8px 12px;
                    text-align: left;
                }
                .quantity-column {
                    text-align: right; /* 品項左對齊 */
                }
                
            </style>
            <table>
                <thead>
                    <tr>
                        <th>品項</th>
                        <th>數量</th>
                        <th>品項單價</th>
                        <th>品項總價</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        //從order資料庫取出所有品項資料
                        String sql = "SELECT item, quantity , price, total_price FROM `order`";
                        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test?useUnicode=true&characterEncoding=UTF-8", "root", "");
                             Statement stmt = conn.createStatement();
                             ResultSet rs = stmt.executeQuery(sql)) {

                            while (rs.next()) {
                                String item = rs.getString("item");
                                int quantity = rs.getInt("quantity");
                                int price = rs.getInt("price");
                                int total_price = rs.getInt("total_price");
                    %>
                                <tr>
                                    <td><%= item %></td>
                                    <td><%= quantity %>個</td>
                                    <td><%= price %>元</td>
                                    <td><%= total_price %>元</td>
                                </tr>
                    <% 
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <%  //利用order_id找出訂單總價
                int total = 0;
                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test?useUnicode=true&characterEncoding=UTF-8", "root", "")) {
                    PreparedStatement stmt = conn.prepareStatement("SELECT total_price FROM order_list WHERE order_index = ?");
                    stmt.setInt(1, order_id);
                    try (ResultSet rs1 = stmt.executeQuery()) {
                        if (rs1.next()) {
                            total = rs1.getInt("total_price");
                        } else {
                            out.println("<div class='alert alert-danger'>未找到該訂單的資料。</div>");
                        }
                    }
                } catch (Exception e) {
                    throw new ServletException(e);
                }

                String point = "0";
                if (request.getParameter("point") != null) {
                    point = request.getParameter("point");
                }
            %>

            <div class="alert alert-success">
                <p>餐點價格為：<strong><%= total %></strong> 元</p>
            </div>

            <%  //有點數才會顯示折扣欄位
                if (!point.equals("0")) {
            %>
            <div class="alert alert-info">
                <p>您的折扣點數為：<strong><%= point %></strong> 點，是否使用點數折扣？</p>
                <a href="checkorder.jsp?discount=1&user_id=<%= user_id %>&point=<%= point %>" class="btn btn-success me-2">是</a>
            </div>
            <%
                }

                String discount = "0";
                if (request.getParameter("discount") != null) {
                    discount = request.getParameter("discount");
                }

                String final_price = "";
                if (discount.equals("1") && point != null) {
                    final_price = String.valueOf(total - Integer.valueOf(point));
                //可以選擇取消折扣
            %>
            <div class="alert alert-warning">
                <p>經點數折扣後，價格為：<strong><%= final_price %></strong> 元</p>
                <a href="checkorder.jsp?discount=0&user_id=<%= user_id %>&point=<%= point %>" class="btn btn-danger">取消折扣</a>
            </div>
            <%
                }
            %>

            <div class="d-flex justify-content-between mt-4">
                <a href="index.jsp" class="btn btn-secondary">修改訂單</a>
                <a href="order_progress.jsp?discount=<%= discount %>&user_id=<%= user_id %>&total_price=<%= total %>" class="btn btn-primary">確認結帳</a>
            </div>
        </div>
    </body>
</html>
