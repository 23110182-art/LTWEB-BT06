<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sneaker Shop - Trang chủ</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #f4f4f4;
}

header {
	background: #111;
	color: #fff;
	padding: 15px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

header h1 {
	margin: 0;
	font-size: 24px;
	letter-spacing: 1px;
}

nav a {
	color: #fff;
	margin-left: 20px;
	text-decoration: none;
	font-weight: bold;
}

nav a:hover {
	color: #e67e22;
}

/* Video quảng cáo */
.video-banner {
	position: relative;
	width: 100%;
	height: 100vh; /* full màn hình */
	overflow: hidden;
}

.video-banner video {
	position: absolute;
	top: 50%;
	left: 50%;
	min-width: 100%;
	min-height: 100%;
	object-fit: cover;
	transform: translate(-50%, -50%);
}

.video-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4); /* làm tối video để chữ nổi bật */
	display: flex;
	justify-content: center;
	align-items: center;
	color: #fff;
	font-size: 48px;
	font-weight: bold;
	text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.9);
}

/* Sản phẩm */
h2 {
	text-align: center;
	margin: 30px 0 20px;
	color: #333;
}

.product-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
	padding: 0 30px 30px;
}

.product-card {
	background: #fff;
	border-radius: 8px;
	width: 220px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
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
	margin: 10px 0 5px;
	color: #444;
}

.price {
	color: #e67e22;
	font-weight: bold;
}

footer {
	background: #111;
	color: #fff;
	text-align: center;
	padding: 15px;
}
</style>
</head>
<body>


	<!-- Video quảng cáo -->
	<div class="video-banner">
		<c:url value="/image?fname=${product.video}" var="videoUrl" />
		<video autoplay muted loop playsinline>
			<source src="${videoUrl}" type="video/mp4">
		</video>

		<div class="video-overlay">Chào mừng đến với Sneaker Shop</div>
	</div>

</body>
</html>
