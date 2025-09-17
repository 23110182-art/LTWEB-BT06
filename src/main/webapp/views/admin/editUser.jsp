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
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
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
    input[type="text"], input[type="password"], input[type="email"], input[type="file"], select {
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
    <h2>Chỉnh sửa User</h2>
    <form action=editUser method="post" enctype="multipart/form-data">
        <!-- ẩn id để controller biết user nào -->
        <input type="hidden" name="id" value="${user.id}" />

        <div class="form-group">
            <label>Tài khoản</label>
            <input type="text" name="taikhoan" value="${user.taikhoan}" required>
        </div>

        <div class="form-group">
            <label>Mật khẩu</label>
            <input type="password" name="matkhau" value="${user.matkhau}" required>
        </div>

        <div class="form-group">
            <label>Số điện thoại</label>
            <input type="text" name="phone" value="${user.phone}">
        </div>

        <div class="form-group">
            <label>Biệt danh</label>
            <input type="text" name="bietdanh" value="${user.bietdanh}">
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="${user.email}">
        </div>

        <div class="form-group">
            <label>Role</label>
            <select name="roleId">
                <option value="1" <c:if test="${user.roleId == 1}">selected</c:if>>Admin</option>
                <option value="2" <c:if test="${user.roleId == 2}">selected</c:if>>Manager</option>
                <option value="3" <c:if test="${user.roleId == 3}">selected</c:if>>User</option>
            </select>
        </div>

        <div class="form-group">
            <label>Ảnh đại diện hiện tại</label><br>
            <c:url value="/image?fname=${user.avatar}" var="imgUrl"/>
            <img src="${imgUrl}" alt="Avatar">
        </div>

        <div class="form-group">
            <label>Đổi ảnh đại diện</label>
            <input type="file" name="avatar" accept="image/*">
        </div>

        <div class="actions">
            <button type="submit">Cập nhật</button>
            <button type="reset">Làm lại</button>
        </div>
    </form>
</div>

</body>
</html>
