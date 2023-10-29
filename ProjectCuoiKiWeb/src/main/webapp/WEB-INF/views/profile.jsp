<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./templates/CSS/cart.css">
<link rel="stylesheet" type="text/css" href="./templates/CSS/main.css">
<link rel="stylesheet" type="text/css" href="./templates/CSS/style.css">
<script type="text/javascript" src="./templates/JavaScript/script.js"></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var elementId = localStorage.getItem('scrollToElement');
		console.log(elementId)
		if (elementId) {
			var element = document.querySelector(elementId);
			if (element) {
				element.scrollIntoView({
					behavior : 'smooth'
				});
				localStorage.removeItem('scrollToElement'); // Xóa tham số khi đã sử dụng
			}
		}
	});
</script>
</head>
<body>
	<div class="" id="app">
		<header class="header">
			<div class="top_bar">
				<div class="drawer-toggle">
					<button style="border: none;" class="btn btn-toggle">
						<span class="fa-solid fa-bars"></span>
					</button>
				</div>

				<div class="flex-wrapper">
					<div class="intro">
						<div class="intro_item">
							<a href="#" class="intro_toggle"> <span> <img
									src="https://utex.hcmute.edu.vn/theme/image.php/maker/theme/1692144561/grid-icon-inverse"
									alt="#">
							</span> <span>
									<div class="intro-text">Hướng dẫn (dành cho Giảng viên)</div>
									<div class="border_bottom"></div>
							</span>
							</a>
							<ul class="menu_list">
								<!-- <div ></div> -->
								<li class="menu_list_item"><a href="#">Hướng dẫn Backup
										và Restore khóa học</a></li>
								<li class="menu_list_item"><a href="#">Hướng dẫn Backup
										và Restore khóa học</a></li>
								<li class="menu_list_item"><a href="#">Hướng dẫn Backup
										và Restore khóa học</a></li>
								<li class="menu_list_item"><a href="#">Hướng dẫn Backup
										và Restore khóa học</a></li>
							</ul>
						</div>
						<ul class="social-media-list list-inline">
							<li class="list-inline-item"><a href="#"> <i
									class="fa-solid fa-earth-americas"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa-brands fa-facebook-f"></i>
							</a></li>
						</ul>
					</div>

					<div class="utilities">
						<div class="utilities-inner">
							<ul class="d-flex usernav p-0 ml-2 mb-0 align-items-center">
								<li class="mr-3">
									<div class="">
										<i class="fa-solid fa-bell"></i>
									</div>
								</li>
								<li class="d-flex">
									<div class="usermenu" style="display: flex;">
										<span>${thongtin.hoten}</span>
										<div class="icon_name">
											<span>${fn:substring(thongtin.hoten,0,1)}</span>
										</div>
										<div class="border_bottom"></div>
										<ul class="setting my_course">
											<div style="right: -20px; top: -10px;" class="pseudo_class"></div>
											<li class="setting__item"><a href="myprofiles"> <span>Hồ
														sơ cá nhân</span>
											</a></li>

											<li class="setting__item"><a href="#"> <span>Cần
														trợ giúp</span>
											</a></li>
											<li class="setting__item"><a href="myprofiles"> <span>Đổi
														mật khẩu</span>
											</a></li>
											<li class="setting__item"><a href="#"> <span>Đăng
														xuất</span>
											</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</header>

		<section class="profile-container">
			<div class="row row_profile">
				<nav class="col-3 profile_info">
					<div class="profile_avata">
						<div class="personal_detail">Personal details</div>
						<div class="profile_icon">
							<span>${fn:substring(thongtin.hoten,0,1)}</span>
						</div>
						<div class="profile_name">${thongtin.hoten}</div>
						<button class="btn btn_main">
							<i class="fa-solid fa-link"></i> Share profile link
						</button>
						<a href="#" class="profile_update">Update profile visibility</a>
					</div>

					<div class="profile_avata">
						<div>
							<span>Let recruiters know what role you’re looking for to
								make sure you find opportunities that are right for you.</span>
						</div>
						<button class="btn btn_main">
							<i class="fa-solid fa-plus"></i> Add work preferences
						</button>
					</div>
					<div class="profile_avata">
						<div>
							<h4>Additional info</h4>
						</div>
						<div>
							<span>Help recruiters get to know you better by describing
								what makes you a great candidate and sharing other links.</span>
						</div>
						<button class="btn btn_main">
							<i class="fa-solid fa-plus"></i> Add additional info
						</button>
					</div>


				</nav>


				<article class="col-9">
					<div class="profile_content">
						<form action="myprofile" method="post">
							<div class="profile_account">
								<h6>Account</h6>
								<c:choose>
									<c:when test="${not empty thongbao}">
										<h5>${thongbao}</h5>
										<c:remove var="thongbao" scope="session" />
									</c:when>
								</c:choose>
								<ul class="profile_account-list">
									<li class="account-list_item"><label for="username">Họ
											và Tên:</label> <input type="text" id="username" name="username"
										value="${thongtin.hoten}" disabled /></li>
									<li class="account-list_item"><label for="username">Email:</label>
										<input type="email" id="email" name="email"
										value="${thongtin.email}" disabled /></li>
									<li class="account-list_item"><label for="quocgia">Quốc
											Gia</label> <input type="text" id="quocgia" name="quocgia"
										value="${thongtin.quocgia}" disabled /></li>
									<li class="account-list_item"><label for="username">Language</label>
										<select class="form-select"
										aria-label="Default select example">
											<option selected>Language</option>
											<option value="English">English</option>
											<option value="VietNamese">VietNamese</option>
									</select></li>
									<li class="account-list_item"><label for="sdt">Số
											Điện Thoại:</label> <input type="text" id="sdt" name="sdt"
										value="${thongtin.sdt}" disabled /></li>
									<li class="account-list_item"><label for="vungmien">Vùng
											Miền:</label> <input type="text" id="vungmien" name="vungmien"
										value="${thongtin.vungmien}" disabled /></li>
									<li class="account-list_item"><label for="diachi">Địa
											Chỉ:</label> <input type="text" id="diachi" name="diachi"
										value="${thongtin.diachi}" disabled /></li>
									<li class="account-list_item"><label for="loaitaikhoan">Loại
											Tài Khoản</label> <input type="text" id="loaitaikhoan"
										name="loaitaikhoan" value="${thongtin.loaitaikhoan}" disabled /></li>
									<li class="account-list_item"><label for="trinhdo">Trình
											Độ</label> <input type="text" id="trinhdo" name="trinhdo"
										value="${thongtin.trinhdo}" disabled /></li>
								</ul>
								<input id="save" type="submit" class="btn btn_main btn-save"
									value="Save" disabled /> <input id="change" type="button"
									class="btn btn_main btn-save" style="margin: 20px"
									onclick="enableField()" value="Change" />
							</div>
						</form>
						<div class="the_line"></div>
						<div class="personal_password">
							<h6>Password</h6>
							<ul class="personal_password-list">
								<li class="account-list_item"><label for="username">Current
										password</label> <input type="password" id="password" /></li>
								<li class="account-list_item"><label for="username">New
										password</label> <input type="password" id="newpass" /></li>
								<li class="account-list_item"><label for="username">Retype
										password</label> <input type="password" id="repass" /></li>
							</ul>
							<button class="btn btn_main btn-save">Change password</button>
						</div>
						<div class="the_line"></div>

						<div class="profile_course">
							<h6>Accomplishments</h6>
							<div class="profile_my-course">
								<div class="profile_my-course__img">
									<img
										src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d2j5ihb19pt1hq.cloudfront.net/certificates/cert-course.png?auto=format%2Ccompress&amp;dpr=1&amp;w=&amp;h=72"
										srcset="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d2j5ihb19pt1hq.cloudfront.net/certificates/cert-course.png?auto=format%2Ccompress&amp;dpr=2&amp;w=&amp;h=72 2x, https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d2j5ihb19pt1hq.cloudfront.net/certificates/cert-course.png?auto=format%2Ccompress&amp;dpr=3&amp;w=&amp;h=72 3x"
										alt="Certificate logo" style="max-height: 72px;">
								</div>
								<div class="profile_my-course__info">
									<a href="#">Version Control</a>
									<p>OnCourse</p>
									<span>Grade Achieved: 91.25%</span>
								</div>
							</div>
							<div class="profile_my-course">
								<div class="profile_my-course__img">
									<img
										src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d2j5ihb19pt1hq.cloudfront.net/certificates/cert-course.png?auto=format%2Ccompress&amp;dpr=1&amp;w=&amp;h=72"
										srcset="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d2j5ihb19pt1hq.cloudfront.net/certificates/cert-course.png?auto=format%2Ccompress&amp;dpr=2&amp;w=&amp;h=72 2x, https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d2j5ihb19pt1hq.cloudfront.net/certificates/cert-course.png?auto=format%2Ccompress&amp;dpr=3&amp;w=&amp;h=72 3x"
										alt="Certificate logo" style="max-height: 72px;">
								</div>
								<div class="profile_my-course__info">
									<a href="#">Version Control</a>
									<p>OnCourse</p>
									<span>Grade Achieved: 91.25%</span>
								</div>
							</div>
							<div class="profile_my-course">
								<div class="profile_my-course__img">
									<img
										src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d2j5ihb19pt1hq.cloudfront.net/certificates/cert-course.png?auto=format%2Ccompress&amp;dpr=1&amp;w=&amp;h=72"
										srcset="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d2j5ihb19pt1hq.cloudfront.net/certificates/cert-course.png?auto=format%2Ccompress&amp;dpr=2&amp;w=&amp;h=72 2x, https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d2j5ihb19pt1hq.cloudfront.net/certificates/cert-course.png?auto=format%2Ccompress&amp;dpr=3&amp;w=&amp;h=72 3x"
										alt="Certificate logo" style="max-height: 72px;">
								</div>
								<div class="profile_my-course__info">
									<a href="#">Version Control</a>
									<p>OnCourse</p>
									<span>Grade Achieved: 91.25%</span>
								</div>
							</div>

						</div>

					</div>
				</article>
			</div>
		</section>

		<footer class="footer">
			<div class="footer_list">
				<div class="footer_nav">
					<p>Bạn đang đăng nhập với tên ,</p>
					<a href="#">${thongtin.hoten}</a>
				</div>
				<a href="#">Get the mobile app</a>
			</div>
			<div class="footer_info">Copyright Oncourse © 2023</div>

		</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>
</html>