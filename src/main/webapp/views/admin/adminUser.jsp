<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý User - Sneaker Shop</title>
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
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.card img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
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

    <h2>Quản lý User</h2>

    <div class="header-bar">
        <!-- Nút thêm -->
        <a href="addUser" class="add-btn">+ Thêm User</a>

        <!-- Form tìm kiếm -->
        <form action="findUser" method="get" class="search-box">
            <input type="text" name="keyword" placeholder="Tìm kiếm user..." value="${param.keyword}">
            <button type="submit">Tìm</button>
        </form>
    </div>

    <!-- Danh sách user -->
    <div class="user-container">
        <c:forEach var="u" items="${listuser}">
            <div class="card">
                <c:url value="/image?fname=${u.avatar}" var="imgUrl"/>
                <img src="${imgUrl}" alt="Avatar">
                <h3>${u.taikhoan}</h3>
                <p><b>Email:</b> ${u.email}</p>
                <p><b>SĐT:</b> ${u.phone}</p>
                <p><b>Biệt danh:</b> ${u.bietdanh}</p>
                <p><b>Role:</b> 
                    <c:choose>
                        <c:when test="${u.roleId == 1}">Admin</c:when>
                        <c:when test="${u.roleId == 2}">Manager</c:when>
                        <c:otherwise>User</c:otherwise>
                    </c:choose>
                </p>
                <div class="actions">
                    <a href="editUser?id=${u.id}" class="edit-btn">Sửa</a>
                    <a href="deleteUser?id=${u.id}" class="delete-btn"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa user này?')">Xóa</a>
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
