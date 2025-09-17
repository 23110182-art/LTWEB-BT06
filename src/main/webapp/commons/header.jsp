<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Giày Thể Thao</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }
    .header {
        background-color: #111;
        color: #fff;
        padding: 15px 40px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .logo {
        font-size: 22px;
        font-weight: bold;
        letter-spacing: 1px;
    }
    .nav a {
        color: #fff;
        text-decoration: none;
        margin: 0 15px;
        font-size: 16px;
    }
    .nav a:hover {
        color: #f39c12;
    }
    .cart {
        background-color: #f39c12;
        padding: 6px 12px;
        border-radius: 5px;
        font-weight: bold;
    }
</style>
</head>
<body>
    <div class="header">
        <div class="logo">SneakerShop</div>
        <div class="nav">
            <a href="home.jsp">Trang chủ</a>
            <a href="userCategory">Sản phẩm</a>
            <a href="about.jsp">Giới thiệu</a>
            <a href="contact.jsp">Liên hệ</a>
        </div>
        <div>
            <a href="cart.jsp" class="cart">🛒 Giỏ hàng</a>
        </div>
    </div>
</body>
</html>
