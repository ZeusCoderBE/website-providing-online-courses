<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quên Mật Khẩu</title>
<link rel="stylesheet" href="./templates/CSS/styledn.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="./templates/JavaScript/script.js"></script>
</head>
<body>
	<div class="container">
		<div id="form-login">
			<form action="getpassword" method="post">
				<div class="form-list">
					<div class="form-item">
						<div class="form-item-login">
							<div class="form-login-header">
								<h1>Login</h1>
							</div>
							<div class="form-login-input">
								<input type="text" placeholder="Email đăng ký" name="Email"
									required />
							</div>
							<div class="form-login-input">
								<input type="password" placeholder="New Password"
									name="NewPassword" required />
							</div>
							<div class="form-login-input">
								<input type="password" placeholder="Check Password"
									name="CheckPassword" required />
							</div>
							<button class="btn" type="submit">Submit</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
		window.onload = function() {
			ReloadAlert("${warning}");
		}
	</script>
	<c:set var="warning" value="${null}"></c:set>
</body>
</html>