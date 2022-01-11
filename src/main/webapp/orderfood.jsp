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
        <font size="12" color="green">WSKGOOD點餐系統</font>
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
            <br><font size="8" color="blue">菜單</font>
            <br>&emsp;&emsp;<font size="6" color="brown">主餐</font>
            <br>&emsp;&emsp;&emsp;&emsp;漢堡 : 80元
            <br>&emsp;&emsp;&emsp;&emsp;潛艇堡 : 90元
            <br>&emsp;&emsp;&emsp;&emsp;炸雞 : 100元
            <br>&emsp;&emsp;<font size="6" color="brown">副餐</font>
            <br>&emsp;&emsp;&emsp;&emsp;薯條 : 30元
            <br>&emsp;&emsp;&emsp;&emsp;洋蔥圈 : 35元
            <br>&emsp;&emsp;&emsp;&emsp;雞塊 : 40元
            <br>&emsp;&emsp;<font size="6" color="brown">飲料</font><!-- comment -->
            <br>&emsp;&emsp;&emsp;&emsp;奶茶 : 25元
            <br>&emsp;&emsp;&emsp;&emsp;咖啡 : 30元<!-- comment -->
            <br>&emsp;&emsp;&emsp;&emsp;可樂 : 20元

        </form>
    </body>
</html>
