<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - Sneaker Shop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        h2 {
            text-align: center;
            margin: 20px 0;
            color: #333;
        }
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }
        .product-card {
            background: #fff;
            border-radius: 8px;
            width: 220px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .product-card:hover {
            transform: scale(1.05);
        }
        .product-card img {
            width: 100%;
            height: 180px;
            border-radius: 8px 8px 0 0;
            object-fit: cover;
        }
        .product-info {
            padding: 10px;
            text-align: center;
        }
        .product-info h3 {
            font-size: 16px;
            margin: 10px 0 5px 0;
            color: #444;
        }
        .product-info p {
            margin: 5px 0;
            color: #777;
            font-size: 14px;
        }
        .price {
            color: #e67e22;
            font-weight: bold;
            font-size: 15px;
        }
    </style>
</head>
<body>

    <h2>Danh sách sản phẩm của bạn</h2>

    <div class="product-container">
        <c:forEach var="p" items="${listProduct}">
            <div class="product-card">
                <c:url value="/image?fname=${p.hinhanh}" var="imgUrl" /> <img
					height="150" width="200" src="${imgUrl}" />
                <div class="product-info">
                    <h3>${p.tensanpham}</h3>
                    
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
