<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa Video - Sneaker Shop</title>
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

input[type="text"], input[type="file"], select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
}

video {
    width: 100%;
    max-height: 240px;
    margin-top: 10px;
    border-radius: 8px;
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
        <h2>Chỉnh sửa Video</h2>
        <form action="editVideo" method="post" enctype="multipart/form-data">
            <!-- ẩn id để controller biết video nào -->
            <input type="hidden" name="id" value="${video.id}" />

            <div class="form-group">
                <label>Tên video</label>
                <input type="text" name="tenvideo" value="${video.tenvideo}" required>
            </div>
            
            <div class="form-group">
                <label>Video hiện tại</label><br>
                <video controls>
                    <source src="<c:url value='/iamge?fname=${video.video}'/>" type="video/mp4">
                </video>
            </div>

            <div class="form-group">
                <label>Đổi video</label>
                <input type="file" name="video" accept="video/*">
            </div>

            <div class="actions">
                <button type="submit">Cập nhật</button>
                <button type="reset">Làm lại</button>
            </div>
        </form>
    </div>

</body>
</html>
