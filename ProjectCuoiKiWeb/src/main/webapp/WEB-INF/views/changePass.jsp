<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Change Password</title>
<link rel="stylesheet" href="./templates/CSS/styledn.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div class="container">
		<div id="form-login">
			<form action="login" method="post">
				<div class="form-list">
					<div class="form-item">
                        <div class="form-item-login">
                            <div class="form-login-header"><h2>ĐỔI MẬT KHẨU</h2></div>
                            <div class="form-login-input">
                                <label for="email">Email</label>
                                <input type="text" id="email" placeholder="Email"/>
                            </div>
                            <div class="form-login-input">
                                <label for="oldPass">Old password</label>
                                <input type="password" id="oldPass" placeholder="Mật khẩu cũ"/>
                            </div>
                            <div class="form-login-input">
                                <label for="newPass">New password</label>
                                <input type="password" id="newPass" placeholder="Mật khẩu mới"/>
                            </div>
                            <div class="form-login-input">
                                <label for="confirmpass">Confirm password</label>
                                <input type="password" id="confirmpass" placeholder="Nhập lại mật khẩu mới"/>
                            </div>
                            <div class="form-notice">
                                <a href="#">Forgot Password?</a>
                            </div>
                            <button class="btn" type="submit">Cập nhật</button>
                            <div class="form-login-policy">
                                <p>Don't have an account? </p>
                                <a href="#">Signup</a>
                            </div>
                        </div>
                        
                    </div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>