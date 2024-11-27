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
        <title>點餐系統</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                padding: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .container {
                display: flex;
                justify-content: space-between;
                width: 90%;  /* 增大寬度 */
                margin: 0 auto;  /* 中央對齊 */
            }
            .menu-container, .cart-container {
                width: 48%;  /* 兩個區塊各佔 48%，加起來 96% 左右 */
            }
            .menu-item {
                font-size: 1.2rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .section-title {
                font-size: 1.5rem;
                color: #6c757d;
            }
            select {
                width: 200px;
                margin-bottom: 10px;
            }
            .menu-card {
                margin-bottom: 15px;
                display: inline-block;
                width: 150px;
                text-align: center;
                margin-right: 15px;
            }
            .menu-card img {
                width: 100px;
                height: 100px;
            }
            .menu-card h4 {
                margin-bottom: 10px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .cart-item {
                margin-bottom: 10px;
                display: flex;
                justify-content: space-between;
            }
            .header-title {
            font-size: 32px;
            color: green;
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
            }   
            #total {
                margin-top: 15px;
                font-size: 1.2rem;
            }
        </style>
    </head>
    <body>
        <h1 class="header-title">WSKGOOD 點餐系統</h1>

            <div class="container">
                <!-- 菜單區塊 -->
                <div class="menu-container">
                    <h3 class="section-title">主餐</h3>
                    <div class="menu-card">
                        <h4>炸機</h4>
                        <img src="/picture/chicken.jpg" alt="牛排">
                        <p>90元</p>
                        <select name="food_main_chicken" id="food_main_chicken" class="form-control">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                    <div class="menu-card">
                        <h4>漢堡</h4>
                        <img src="/picture/hamburger.jpg" alt="漢堡">
                        <p>80元</p>
                        <select name="food_main_hamburger" id="food_main_hamburger" class="form-control">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>

                    <div class="menu-card">
                        <h4>潛艇堡</h4>
                        <img src="/picture/ramen.jpg" alt="漢堡">
                        <p>100元</p>
                        <select name="food_main_ramen" id="food_main_ramen" class="form-control">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>

                    <h3 class="section-title">副餐</h3>
                    <div class="menu-card">
                        <h4>薯條</h4>
                        <img src="/picture/chips.jpg" alt="薯條">
                        <p>30元</p>
                        <select name="food_sub_chips" id="food_sub_chips" class="form-control">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                    <div class="menu-card">
                        <h4>洋蔥圈</h4>
                        <img src="/picture/onionrings.jpg" alt="洋蔥圈">
                        <p>35元</p>
                        <select name="food_sub_onionrings" id="food_sub_onionrings" class="form-control">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>

                    <div class="menu-card">
                        <h4>雞塊</h4>
                        <img src="/picture/chickennuggets.jpg" alt="洋蔥圈">
                        <p>40元</p>
                        <select name="food_sub_chickennuggets" id="food_sub_chickennuggets" class="form-control">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>

                    <h3 class="section-title">飲料</h3>
                    <div class="menu-card">
                        <h4>可樂</h4>
                        <img src="/picture/cola.jpg" alt="可樂">
                        <p>35元</p>
                        <select name="drinks_cola" id="drinks_cola" class="form-control">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                    <div class="menu-card">
                        <h4>奶茶</h4>
                        <img src="/picture/milktea.jpg" alt="奶茶">
                        <p>25元</p>
                        <select name="drinks_milktea" id="drinks_milktea" class="form-control">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                     <div class="menu-card">
                        <h4>咖啡</h4>
                        <img src="/picture/coffee.jpg" alt="咖啡">
                        <p>30元</p>
                        <select name="drinks_coffee" id="drinks_coffee" class="form-control">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                </div>

                <!-- 購物車區塊 -->
                <div class="cart-container">
                    <h3 class="section-title">購物車</h3>
                    <div id="cart"></div>
                    <div id="total"></div>
                </div>
            </div>

        <!-- 提交表單 -->
        <form method="post" action="SetFoodServlet">
            <div class="container">
                <div class="menu-container">
                     
                    <!-- 此處無需變動，提交表單已經包含在下方 -->
                </div>
                <div class="cart-container">
                     <!-- 隱藏的欄位，用來存儲購物車內容 -->
                    <input type="hidden" name="cart_data" id="cart_data" />
                     <input type="hidden" name="total_price" id="total_price" />
                    <input type="submit" value="提交訂單" class="btn btn-primary" />
                </div>
            </div>
        </form>

        <script>
            var cart = [];

            function addToCart(item, quantity) {
                if (item && quantity) {
                    if(quantity != 0)
                    {
                        cart.push({ name: item.name, price: item.price, quantity: quantity });
                        updateCart();
                    }
                }
            }

            function updateCart() {
                var cartDiv = document.getElementById("cart");
                var totalDiv = document.getElementById("total");
                cartDiv.innerHTML = "";
                var totalPrice = 0;

                cart.forEach(function(item, index) {
                    cartDiv.innerHTML += "<div class='cart-item'>" + item.name + " - " + item.quantity + " 個 - " + item.price * item.quantity + "元 " +
                    "<button onclick='removeFromCart(" + index + ")'>刪除</button></div>";
                    totalPrice += item.price * item.quantity;
                });

                totalDiv.innerHTML = "<strong>總金額: " + totalPrice + "元</strong>";
                
                // 將購物車資料轉換成 JSON 並設置到隱藏欄位
                var cartData = JSON.stringify(cart);  // 將購物車陣列轉換為 JSON 字串
                
                document.getElementById("cart_data").value = cartData;  // 填入隱藏欄位
                document.getElementById("total_price").value = totalPrice;  // 填入隱藏欄位
            }

            function removeFromCart(index) {
                cart.splice(index, 1);  // Remove item from cart
                updateCart();
            }

            // 為每個選單加入事件，當選擇數量時加入購物車
            document.getElementById('food_main_chicken').addEventListener('change', function() {
                addToCart({ name: '炸機', price: 90 }, this.value);
            });
             document.getElementById('food_main_ramen').addEventListener('change', function() {
                addToCart({ name: '潛艇堡', price: 100 }, this.value);
            });
            document.getElementById('food_main_hamburger').addEventListener('change', function() {
                addToCart({ name: '漢堡', price: 80 }, this.value);
            });
            document.getElementById('food_sub_chips').addEventListener('change', function() {
                addToCart({ name: '薯條', price: 30 }, this.value);
            });
            document.getElementById('food_sub_onionrings').addEventListener('change', function() {
                addToCart({ name: '洋蔥圈', price: 35 }, this.value);
            });
            document.getElementById('food_sub_chickennuggets').addEventListener('change', function() {
                addToCart({ name: '雞塊', price: 40 }, this.value);
            });
            document.getElementById('drinks_milktea').addEventListener('change', function() {
                addToCart({ name: '奶茶', price: 25 }, this.value);
            });
             document.getElementById('drinks_coffee').addEventListener('change', function() {
                addToCart({ name: '咖啡', price: 30 }, this.value);
            });
             document.getElementById('drinks_cola').addEventListener('change', function() {
                addToCart({ name: '可樂', price: 35 }, this.value);
            });
        </script>
    </body>
</html>