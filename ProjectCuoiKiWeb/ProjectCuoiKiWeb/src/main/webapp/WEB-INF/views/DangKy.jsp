<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Đăng Ký</title>
<link rel="stylesheet" href="./templates/CSS/styledn.css">
<link rel="stylesheet"
	href="./templates/fontawesome-free-6.4.2-web/css/all.min.css" />
<script type="text/javascript" src=./templates/JavaScript/script.js></script>
</head>
<body>
	<div class="container">
		<div id="form-login" style="margin-top: 20px;">
			<form action="dang-ky" method="post" onsubmit="return validateForm()">
				<div class="form-list">
					<div class="form-item">
						<div class="form-item-login">
							<div class="form-login-header">
								<h1>Đăng Ký</h1>
							</div>
							<br />
							<div class="form-login-input">
								<label for="username">Họ và Tên</label> <input type="text"
									id="username" placeholder="VD: Nguyễn Văn A" name="username"
									required />
							</div>
							<div class="form-login-input">
								<label for="email">Email</label> <input type="text" id="email"
									placeholder="VD: vana@gmail.com" name="email" required />
							</div>
							<div class="form-login-input">
								<label for="sdt">Số Điện Thoại:</label> <input type="text"
									id="sdt" name="sdt" placeholder="VD:0123456789" required />
							</div>
							<div class="form-login-input">
								<label for="password">Mật Khẩu</label> <input type="password"
									id="password" name="password" required />
							</div>
							<div class="form-login-input">
								<label for="confirmpassword">Xác Nhận Mật Khẩu: </label> <input
									type="password" id="confirmpassword" name="confirmpassword"
									required />
							</div>

							<div class="form-login-input">
								<label for="diachi">Quốc Gia</label> <input type="text"
									id="quocgia" name="quocgia" placeholder="VD:Việt Nam" required />
							</div>
							<div class="form-login-input">
								<label for="loaitk">Loại Tài Khoản </label>
							</div>
							<div class="form-login-type">
								<input type="radio" class="my-checkbox" name="tkgiaovien"
									id="tkgiaovien" name="tkgiaovien"
									onchange="handleCheckboxChange(this)"> <label
									for="tkgiaovien">Giáo Viên</label>
								<input class="my-checkbox" type="radio"
								name="tkhocvien" id="tkhocvien" name="tkhocvien"
								onchange="handleCheckboxChange(this)"> <label
								for="tkhocvien">Học Viên</label>
							</div>

							<button class="btn" type="submit">Sign Up</button>
							<div class="form-login-policy">
								<p>Already have an account?</p>
								<a href="login">Login</a>
							</div>
							<div class="form-login-or">
								<h1>
									<span>Or</span>
								</h1>
							</div>
							<div class="header_login-nav">
								<a href="#"> <i class="fa-brands fa-facebook-f"></i>
									<div class="header_login-info">
										<span>Login with FaceBook</span>
									</div>
								</a>
							</div>

							<div class="header_login-nav logo_google">
								<a href="#"> <i class="fa-brands fa-google"></i>
									<div class="header_login-info">
										<span>Login with Google</span>
									</div>
								</a>
							</div>
						</div>

					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
		window.onload = function() {
			ReloadAlert("${thongbaodksai}");
			ReloadAlert("${thongbaodkgvsai}");
			ReloadAlert("${xacnhanmksai}");
		}
	</script>

</body>
</html>