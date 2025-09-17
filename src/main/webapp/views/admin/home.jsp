<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Sneaker Shop</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f4f6f9;
}

/* Sidebar */
.sidebar {
	width: 220px;
	background-color: #2c3e50;
	color: white;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	padding-top: 20px;
}

.sidebar h2 {
	text-align: center;
	margin-bottom: 30px;
}

.sidebar a {
	display: block;
	padding: 12px 20px;
	color: white;
	text-decoration: none;
}

.sidebar a:hover {
	background-color: #34495e;
}

/* Content */
.content {
	margin-left: 220px;
	padding: 20px;
}

h2 {
	color: #333;
	margin-bottom: 15px;
}

/* Card style for menu */
.dashboard-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
	margin-top: 30px;
}

.card {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	text-align: center;
	transition: 0.3s;
	cursor: pointer;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.card h3 {
	margin-bottom: 10px;
}

.card p {
	color: #555;
	margin-bottom: 15px;
}

.card a {
	display: inline-block;
	padding: 8px 15px;
	background-color: #2c3e50;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

.card a:hover {
	background-color: #34495e;
}
</style>
</head>
<body>

	<!-- Sidebar -->
	<div class="sidebar">
		<h2>Admin Panel</h2>
		<a href="home.jsp">🏠 Trang chủ</a>
		<a href="adminUser">👤 Quản lý User</a>
		<a href="adminCategory">📂 Quản lý Category</a>
		<a href="adminVideo">📂 Quản lý Video</a>
		<a href="logout">🚪 Đăng xuất</a>
	</div>

	<!-- Content -->
	<div class="content">
		<h2>Chào mừng Admin đến với Dashboard</h2>
		<p>Chọn chức năng bên dưới để quản lý hệ thống.</p>

		<div class="dashboard-cards">
			<!-- Card User -->
			<div class="card">
				<h3>👤 Quản lý User</h3>
				<p>Xem, thêm, sửa hoặc xóa tài khoản người dùng trong hệ thống.</p>
				<a href="adminUser">Đi tới</a>
			</div>

			<!-- Card Category -->
			<div class="card">
				<h3>📂 Quản lý Category</h3>
				<p>Quản lý các danh mục sản phẩm giày trong cửa hàng.</p>
				<a href="adminCategory">Đi tới</a>
			</div>
		</div>
	</div>

</body>
</html>
