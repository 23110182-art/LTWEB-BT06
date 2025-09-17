<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa User - Sneaker Shop</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f5f6fa;
	margin: 0;
	padding: 0;
}

.container {
	width: 600px;
	margin: 40px auto;
	background: #fff;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 6px;
}

input[type="text"], input[type="password"], input[type="email"], input[type="file"],
	select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
}

img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	margin-top: 10px;
	object-fit: cover;
	border: 2px solid #ccc;
}

.actions {
	text-align: center;
	margin-top: 20px;
}

.actions button {
	background: #333;
	color: #fff;
	padding: 10px 18px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	margin: 0 10px;
}

.actions button:hover {
	background: #555;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Chỉnh sửa Category</h2>
		<form action=editCategory method="post" enctype="multipart/form-data">
			<!-- ẩn id để controller biết user nào -->
			<input type="hidden" name="id" value="${category.id}" />

			<div class="form-group">
				<label>Tên sản phẩm</label> <input type="text" name="tensanpham"
					value="${category.tensanpham}" required>
			</div>

			<div class="form-group">
				<label>User</label> <select name="userId" class="form-control">
					<c:forEach var="u" items="${users}">
						<option value="${u.id}"
							<c:if test="${category.user != null && category.user.id == u.id}">selected</c:if>>
							${u.taikhoan}
							<!-- hoặc ${u.bietdanh}, ${u.email} tuỳ bạn muốn hiển thị -->
						</option>
					</c:forEach>
				</select>
			</div>


			<div class="form-group">
				<label>Ảnh sản phẩm hiện tại</label><br>
				<c:url value="/image?fname=${category.hinhanh}" var="imgUrl" />
				<img src="${imgUrl}" alt="Avatar">
			</div>

			<div class="form-group">
				<label>Đổi ảnh sản phẩm</label> <input type="file" name="hinhanh"
					accept="image/*">
			</div>

			<div class="actions">
				<button type="submit">Cập nhật</button>
				<button type="reset">Làm lại</button>
			</div>
		</form>
	</div>

</body>
</html>
