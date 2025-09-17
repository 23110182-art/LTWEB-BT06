<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký - Sneaker Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('${request.contextPath}/assets/images/bg-sneaker.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            border-radius: 15px;
        }
        .btn-sneaker {
            background-color: #ff4d4d;
            color: white;
            font-weight: bold;
        }
        .btn-sneaker:hover {
            background-color: #e63946;
        }
    </style>
</head>
<body>
<div class="container mt-5" style="max-width:600px;">
    <div class="card shadow-lg">
        <div class="card-body p-4">
            <h3 class="card-title text-center mb-4">Đăng ký tài khoản Sneaker</h3>
            <form action="${request.contextPath}/register" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="username" class="form-label">Tài khoản</label>
                    <input type="text" id="username" name="username" class="form-control" required minlength="3">
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" id="password" name="password" class="form-control" required minlength="8">
                </div>

                <div class="mb-3">
                    <label for="confirm" class="form-label">Xác nhận mật khẩu</label>
                    <input type="password" id="confirm" name="confirmPassword" class="form-control" required minlength="8">
                </div>

                <div class="mb-3">
                    <label for="nickname" class="form-label">Biệt danh</label>
                    <input type="text" id="nickname" name="nickname" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="tel" id="phone" name="phone" class="form-control" pattern="\\+?[0-9]{7,15}">
                </div>

                <div class="mb-3">
                    <label for="avatar" class="form-label">Ảnh đại diện</label>
                    <input type="file" id="avatar" name="avatar" class="form-control" accept="image/*">
                </div>

                <button type="submit" class="btn btn-sneaker w-100">Đăng ký ngay</button>

                <div class="mt-3 text-center">
                    <a href="${request.contextPath}/login" class="text-decoration-none">Đã có tài khoản? Đăng nhập</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
