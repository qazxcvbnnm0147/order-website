<%-- 
    Document   : orderfood
    Created on : 2022/1/7, 下午 04:10:53
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
        <form method="post" action="SetFoodServlet">
            是否組成套餐?: <select name="combo">
                <option value="yes">是</option>
                <option value="no">否</option>
                </select>
           
         <form method="post" action="SetFoodServlet">
            主餐: <select name="food_main">
                <option value="hamburger">漢堡</option>
                <option value="ramen">拉麪</option>
                <option value="chicken">炸雞</option>
                <option value="none">無</option>
                </select>
            附餐:<select name="food_sub">
                <option value="chips">薯條</option>
                <option value="onionrings">洋蔥圈</option>
                <option value="chickennuggets">雞塊</option>
                <option value="none">無</option>
                </select>
            飲料:<select name="drinks">
                <option value="milktea">奶茶</option>
                <option value="coffee">咖啡</option>
                <option value="cola">可樂</option>
                <option value="none">無</option>
            </select>
            <input type="submit"/>
        </form>
    </body>
</html>
