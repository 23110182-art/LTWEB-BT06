<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - Shop Giày Thể Thao</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url("https://images.unsplash.com/photo-1600185365219-3c770d9cb0f1") no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }
        .login-container {
            max-width: 420px;
            margin: 80px auto;
            padding: 30px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }
        .login-title {
            font-weight: bold;
            color: #222;
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #ff3d00;
            color: white;
            font-weight: 600;
        }
        .btn-custom:hover {
            background-color: #e53935;
        }
        .links {
            text-align: center;
            margin-top: 15px;
        }
        .links a {
            text-decoration: none;
            color: #0d6efd;
            font-weight: 500;
        }
        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2 class="login-title">Shop Giày Thể Thao</h2>
    <c:if test="${not empty alert}">
        <div style="color:red;">${alert}</div>
    </c:if>
    <form action="<%=request.getContextPath()%>/login" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Tài khoản</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tài khoản" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
        </div>
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" id="rememberMe" name="remember">
            <label class="form-check-label" for="rememberMe">
                Ghi nhớ đăng nhập
            </label>
        </div>
        <button type="submit" class="btn btn-custom w-100">Đăng nhập</button>

        <div class="links">
            <a href="<%=request.getContextPath()%>/forgot-password">Quên mật khẩu?</a><br>
            <a href="<%=request.getContextPath()%>/register">Chưa có tài khoản? Đăng ký ngay</a>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
