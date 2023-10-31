<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<form action="paid" method="post">
				<div class="form-list">
					<div class="form-item">
						<div class="form-item-login">
							<div class="form-login-header">
								<h1>Thanh toán khóa học</h1>
							</div>
							<div class="form-login-input">
								<label for="tenKhoaHoc">Tên khóa học </label> <input
									type="tenKhoaHoc" placeholder="khóa học" name="tenKhoaHoc"
									value="${khoahoc.getTenkhoahoc()}" />
							</div>
							<div class="form-login-input">
								<label for="ngayThanhToan">Ngày thanh toán </label> <input
									type="date" placeholder="yyyy/mmm/dd" name="ngayThanhToan"
									value="${now}" />
							</div>
							<div class="form-login-input">
								<label for="CardNumber">Card number </label> <input type="text"
									placeholder="Số thể" name="CardNumber"
									value="${the.getMaThe()}" />
							</div>
							<div class="form-login-input">
								<label for="bill">Số tiến cần thanh toán </label> <input
									type="bill" placeholder="số tiền cần thanh toán" name="bill"
									value="${khoahoc.getGiatien()}" />
							</div>
							<div class="form-login-input">
								<label for="noidungtt">Nội dung thanh toán </label> <input
									type="noidungtt" placeholder="số tiền cần thanh toán"
									name="noidungtt" value="${noidungtt}" />
							</div>
							<button class="btn" type="submit" onclick="confirmPayment('${the.getSoDu()-khoahoc.getGiatien()}')">Thanh
								toán</button>
							<div class="form-login-input">
								<label for="loaitk"></label>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="./templates/JavaScript/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>