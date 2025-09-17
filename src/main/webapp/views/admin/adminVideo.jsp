<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý Video - Sneaker Shop</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f4f6f9;
	padding: 20px;
}

h2 {
	color: #333;
	margin-bottom: 20px;
	text-align: center;
}

/* Header chứa nút và search */
.header-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

/* Button thêm */
.add-btn {
	display: inline-block;
	padding: 10px 15px;
	background-color: #2c3e50;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

.add-btn:hover {
	background-color: #34495e;
}

/* Search box */
.search-box input[type="text"] {
	padding: 8px;
	width: 220px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.search-box button {
	padding: 8px 12px;
	margin-left: 5px;
	border: none;
	background-color: #2c3e50;
	color: white;
	border-radius: 5px;
	cursor: pointer;
}

.search-box button:hover {
	background-color: #34495e;
}

/* Card layout */
.user-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
}

.card {
	background: white;
	border-radius: 10px;
	padding: 15px;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.card img {
	width: 100%;
	height: 160px;
	border-radius: 8px;
	object-fit: cover;
	margin-bottom: 10px;
}

.card h3 {
	margin: 8px 0 5px;
}

.card p {
	margin: 3px 0;
	color: #555;
}

.card .actions {
	margin-top: 10px;
}

.card .actions a {
	display: inline-block;
	padding: 6px 12px;
	margin: 3px;
	border-radius: 5px;
	text-decoration: none;
	font-size: 14px;
}

.edit-btn {
	background-color: #27ae60;
	color: white;
}

.edit-btn:hover {
	background-color: #2ecc71;
}

.delete-btn {
	background-color: #c0392b;
	color: white;
}

.delete-btn:hover {
	background-color: #e74c3c;
}
</style>
</head>
<body>

	<h2>Quản lý Video</h2>

	<div class="header-bar">
		<!-- Nút thêm -->
		<a href="addVideo" class="add-btn">+ Thêm Video</a>

		<!-- Form tìm kiếm -->
		<form action="findVideo" method="get" class="search-box">
			<input type="text" name="keyword" placeholder="Tìm kiếm video..."
				value="${param.keyword}">
			<button type="submit">Tìm</button>
		</form>
	</div>

	<!-- Danh sách video -->
	<div class="user-container">

		<div class="card">
			<!-- Ảnh thumbnail -->
			<!--<c:url value="/image?fname=${v.hinhanh}" var="imgUrl"/>-->
			<!--<img src="${imgUrl}" alt="Thumbnail">-->

			<!-- Tên video -->
			<h3>${video.tenvideo}</h3>

			<!-- Preview video -->
			<video controls style="width: 100%; margin-top: 10px;">
				<source src="<c:url value='/image?fname=${video.video}'/>"
					type="video/mp4">
			</video>

			<div class="actions">
				<a href="editVideo?id=${video.id}" class="edit-btn">Sửa</a> <a
					href="deleteVideo?id=${video.id}" class="delete-btn"
					onclick="return confirm('Bạn có chắc chắn muốn xóa video này?')">Xóa</a>
			</div>
		</div>

	</div>

</body>
</html>
