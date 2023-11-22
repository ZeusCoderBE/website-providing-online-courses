<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="ONCOURSE nơi cung cấp các khóa học nổi tiếng">
<title>Trang Giới Thiệu</title>
<link rel="stylesheet"
	href="./templates/fontawesome-free-6.4.2-web/css/all.min.css" />
<link rel="stylesheet" href="./templates/bootstrap-5.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./templates/CSS/style.css">
<link rel="stylesheet" type="text/css" href="./templates/CSS/main.css">
<script type="text/javascript">
	function redirectToLogin() {
		window.location.href = 'login';
	}
</script>
</head>
<body>
	<div id="page_container">
		<header style="position: fixed; width: 100%; z-index: 100;">
			<nav class="navbar navbar-expand-lg">
				<div style="margin-top: 0; height: 100%;" class="container-fluid">
					<a class="navbar-brand" href="#"> ${company.getName()} </a>
					<div style="height: 100%;" class="collapse navbar-collapse"
						id="navbarSupportedContent">
						<ul style="height: 100%;" class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="#">Giới thiệu</a></li>
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="homepages">Khóa học</a></li>

							<li class="nav-item"><a class="nav-link" href="#">Hỏi
									đáp</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Bài
									viết</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Tài
									trợ</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Liên
									hệ</a></li>

						</ul>
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-secondary" type="submit">Search</button>
						</form>
						<div class="utilities">
							<div class="utilities-inner">
								<ul class="d-flex usernav p-0 ml-2 mb-0 align-items-center">
									<li style="margin-left: 0;" class="d-flex"><c:choose>
											<c:when test="${not empty hocvien.manguoidung}">
												<div class="usermenu">
													<span>${hocvien.hoten}</span>
													<div style="display: none;" class="usermenu">
														<span>Tài Khoản</span>
														<div style="width: 25px;" class="icon_name">
															<span> <i class="fa-solid fa-user"></i>
															</span>
														</div>
														<div class="border_bottom"></div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<button style="display: block;" onclick="redirectToLogin();"
													class="btn btn-success login_taikhoan">Đăng Nhập</button>
											</c:otherwise>
										</c:choose></li>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</header>

		<div class="main_container">
			<div class="content">
				<h1>Thư viện khóa học lập trình từ cơ bản đến nâng cao</h1>
				<p>Python ? C++? C# hay Java?</p>
				<p>Bạn lựa chọn ngôn ngữ nào để bắt đầu chặng đường trở thành
					lập trình viên của mình?</p>
				<a href="#">Học Ngay</a> <img
					src="https://www.pluralsight.com/content/dam/pluralsight2/homepage/2023-updates/ai-home-hero.webp"
					alt="">
			</div>
		</div>
	</div>

	<div class="info-device">
		<h3>Trang web chưa hỗ trợ điện thoại</h3>
	</div>
	<script type="text/javascript" src="./templates/bootstrap-5.3.2-dist/js/bootstrap.min.js" >
	<script src="./templates/JavaScript/script.js">
		
	</script>
	<script>
		window.onload = function() {
			ReloadAlert("${uptailieu}");
		}
	</script>
	<c:set var="uptailieu" value="${null}"></c:set>
</body>
</html>