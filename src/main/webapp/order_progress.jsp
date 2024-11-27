<%-- 
    Document   : order_progress
    Created on : 2024年11月27日, 上午3:58:15
    Author     : qazxc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單處理狀態</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <style>
        .progress {
            margin: 20px 0;
        }
        .status {
            text-align: center;
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
        }
        .feedback {
            margin-top: 20px;
            font-size: 16px;
            color: #333;
            text-align: center;
        }
        .back-link {
            margin-top: 20px;
            text-align: center;
        }
        .header-title {
            font-size: 32px;
            color: green;
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
    <script>
        // 自動進度條
        let progress = 0;
        const steps = ["訂單已接收", "正在準備餐點", "餐點已完成", "訂單已送達"];
        function updateProgress() {
            const progressBar = document.getElementById("progress-bar");
            const statusText = document.getElementById("status-text");

            if (progress < steps.length) {
                progressBar.style.width = (progress + 1) * 25 + "%";
                progressBar.innerHTML = (progress + 1) * 25 + "%";
                statusText.innerHTML = steps[progress];
                progress++;
                setTimeout(updateProgress, 1000); // 每 1 秒更新一次
            }
        }

        window.onload = updateProgress;
    </script>
</head>
<body>
<div class="container">
    <!-- WSKGOOD 點餐系統 標題 -->
    <div class="header-title">WSKGOOD 點餐系統</div>

    <h2 class="text-center mt-4">訂單處理狀態</h2>
    <div class="progress">
        <div id="progress-bar" class="progress-bar progress-bar-striped progress-bar-animated" 
            role="progressbar" style="width: 0%;">0%
        </div>
    </div>
    <div id="status-text" class="status">正在處理...</div>

    <div class="feedback">
        <% 
            String user_id = request.getParameter("user_id");
            String total_price = request.getParameter("total_price");
            String discount = request.getParameter("discount");
            int point = (int)(Integer.valueOf(total_price) * 0.03);
            String feedbackMessage = "";

            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test?useUnicode=true&characterEncoding=UTF-8", "root", "")) {
                if (user_id != null && !user_id.equals("目前尚未登入")) {
                    String sql = "";
                    if (discount.equals("0")) { // 未使用點數，進行回饋計算
                        int total_point = 0;
                        sql = "SELECT point FROM login WHERE id = ?";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        stmt.setString(1, user_id);
                        try (ResultSet rs1 = stmt.executeQuery()) {
                            if (rs1.next()) {
                                total_point = rs1.getInt("point") + point;
                            }
                        }
                        sql = "UPDATE login SET point = ? WHERE id = ?";
                        try (PreparedStatement stmt2 = conn.prepareStatement(sql)) {
                            stmt2.setInt(1, total_point);
                            stmt2.setString(2, user_id);
                            int rowsUpdated = stmt2.executeUpdate();
                            if (rowsUpdated > 0) {
                                feedbackMessage = "使用者：" + user_id + "，您獲得了 " + point + " 回饋點數，現在共有 " + total_point + " 點點數。";
                            } else {
                                feedbackMessage = "點數更新失敗，請稍後再試！";
                            }
                        }
                    } else if (discount.equals("1")) { // 使用點數，將點數清零
                        sql = "UPDATE login SET point = ? WHERE id = ?";
                        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                            stmt.setInt(1, 0);
                            stmt.setString(2, user_id);
                            int rowsUpdated = stmt.executeUpdate();
                            if (rowsUpdated > 0) {
                                feedbackMessage = "使用者：" + user_id + "，您的點數已使用，現為 0 點。";
                            } else {
                                feedbackMessage = "點數更新失敗，請稍後再試！";
                            }
                        }
                    }
                } else {
                    feedbackMessage = "目前尚未登入，無法計算點數。";
                }
            } catch (Exception e) {
                feedbackMessage = "發生錯誤：" + e.getMessage();
            }
        %>
        <p><%= feedbackMessage %></p>
    </div>

    <div class="back-link">
        <a href="index.jsp" class="btn btn-primary">返回點餐頁面</a>
    </div>
</div>
</body>
</html>
