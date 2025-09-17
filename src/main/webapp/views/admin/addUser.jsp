<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm User mới - Sneaker Shop</title>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f6f9;
    padding: 20px;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

.form-container {
    max-width: 500px;
    margin: auto;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.form-group input,
.form-group select {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.form-actions {
    text-align: center;
    margin-top: 20px;
}

.form-actions button,
.form-actions a {
    display: inline-block;
    padding: 10px 20px;
    margin: 5px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
}

.save-btn {
    background-color: #27ae60;
    color: white;
}

.save-btn:hover {
    background-color: #2ecc71;
}

.cancel-btn {
    background-color: #c0392b;
    color: white;
}

.cancel-btn:hover {
    background-color: #e74c3c;
}
</style>
</head>
<body>

    <h2>Thêm User mới</h2>

    <div class="form-container">
        <form action="addUser" method="post" enctype="multipart/form-data">
            
            <div class="form-group">
                <label>Tài khoản</label>
                <input type="text" name="taikhoan" required>
            </div>
            
            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" name="matkhau" required>
            </div>
            
            <div class="form-group">
                <label>Số điện thoại</label>
                <input type="text" name="phone">
            </div>
            
            <div class="form-group">
                <label>Biệt danh</label>
                <input type="text" name="bietdanh">
            </div>
            
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email">
            </div>
            
            <div class="form-group">
                <label>Role</label>
                <select name="roleId" required>
                    <option value="1">Admin</option>
                    <option value="2">Manager</option>
                    <option value="3" selected>User</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Ảnh đại diện</label>
                <input type="file" name="avatar" accept="image/*">
            </div>
            
            <div class="form-actions">
                <button type="submit" class="save-btn">💾 Lưu</button>
                <a href="adminUser.jsp" class="cancel-btn">✖ Hủy</a>
            </div>
        </form>
    </div>

</body>
</html>
