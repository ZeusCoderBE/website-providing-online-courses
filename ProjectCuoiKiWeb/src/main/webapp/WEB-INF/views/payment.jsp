<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Đăng Nhập</title>
<link rel="stylesheet" href="./templates/CSS/styledn.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div class="container">
		<div id="form-login">
			<form action="paycourse" method="post">
				<div class="form-list">
					<div class="form-item">
						<div class="form-item-login">
							<div class="form-login-header">
								<h1>Thanh toán Visa</h1>
							</div>
							<div class="form-login-input">
								<label for="Card number">Card number </label> <input type="text"
									placeholder="Số thể" name="CardNumber" />
							</div>
							<div class="form-login-input">
								<label for="CVV">Số CVV </label> <input
									type="CVV" placeholder="số cvv" name="CVV" />
							</div>
							<div class="form-login-input">
								<label for="bill">Số tiến cần thanh toán </label> <input
									type="bill" placeholder="số tiền cần thanh toán" name="bill" />
							</div>
							<button class="btn" type="submit">Thanh toán</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>