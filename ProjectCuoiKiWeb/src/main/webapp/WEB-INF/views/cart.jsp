<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="./templates/CSS/cart.css">
<link rel="stylesheet" href="./templates/CSS/main.css">
<link rel="stylesheet" href="./templates/CSS/descride.css">
<link rel="stylesheet" href="./templates/CSS/style.css">
<script src="./templates/JavaScript/script.js"></script>
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
								<li class="menu_list_item"><a href="#" onclick="clickabc()">Hướng
										dẫn Backup và Restore khóa học</a></li>
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
								<li class="d-flex"><c:choose>
										<c:when test="${ not empty hocvien.manguoidung}">
											<div class="usermenu">
												<c:choose>
													<c:when test="${not empty thongtin}">
														<span>${thongtin.hoten}</span>
														<div class="icon_name">
															<span>${fn:substring(thongtin.hoten,0,1)}</span>
														</div>
													</c:when>
													<c:otherwise>
														<span>${hocvien.hoten}</span>
														<div class="icon_name">
															<span>${fn:substring(hocvien.hoten,0,1)}</span>
														</div>
													</c:otherwise>
												</c:choose>
												<div class="border_bottom"></div>
												<ul class="setting my_course">
													<div style="right: -20px; top: -10px;" class="pseudo_class"></div>
													<li class="setting__item"><a href="myprofiles"> <span>Hồ
																sơ cá nhân</span> <i class="fa-solid fa-id-card"></i>
													</a></li>
													<li class="setting__item"><a href="#"> <span>Chứng
																chỉ</span> <i class="fa-solid fa-award"></i>
													</a></li>

													<li class="setting__item"><a href="#"> <span>Cần
																trợ giúp</span> <i class="fa-solid fa-circle-question"></i>
													</a></li>
													<li class="setting__item"><a href="myprofiles"
														onclick="scrollToElement('.personal_email')"> <span>Đổi
																mật khẩu</span> <i class="fa-solid fa-lock"></i>
													</a></li>
													<li class="setting__item"><a href="#"
														onclick="testConfirmDialog()"> <span>Đăng xuất
														</span> <i class="fa-solid fa-right-to-bracket"></i>
													</a></li>
												</ul>
											</div>
										</c:when>
										<c:otherwise>
											<a href="login"><button style="display: block;"
													class="btn btn-success login_taikhoan">Đăng Nhập</button></a>
										</c:otherwise>
									</c:choose></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</header>

		<section class="cart-container">
			<div class="row cart-row">
				<div class="cart-col-9 col-9">
					<div class="cart-content">
						<h3 class="cart-header">Giỏ hàng</h3>
						<div class="cart-info">
							<h5>1 khóa học trong giỏ hàng</h5>
							<ul class="cart-list">
								<c:forEach var="giohang" items="${dsgiohang}">
									<li class="cart-item">
										<div class="cart-item-container">
											<div class="cart-item-info">
												<div class="cart-item-img">
													<a href="#"><img
														src="https://files.fullstack.edu.vn/f8-prod/courses/13/13.png"
														alt="react"></a>
												</div>
												<a href="#" class="cart-item-content">
													<h6>${giohang.getKhoahoc().getTenkhoahoc()}</h6> <span>Bởi
														giáo viên: Minh Châu</span>
													<div class="cart-item-evaluate">
														<div>Bán chạy nhất</div>
														<div>Đã cập nhật gần đây</div>
														<span>${gohang.getKhoahoc().ggetDanhgia()}</span>
														<div class="cart-item-icon__start">
															<i class="fa-solid fa-star start-primary"></i> <i
																class="fa-solid fa-star start-primary"></i> <i
																class="fa-solid fa-star start-primary"></i> <i
																class="fa-solid fa-star start-primary"></i> <i
																class="fa-solid fa-star"></i>
														</div>
													</div>
													<ul class="cart-item-time">
														<li style="list-style: none;">${giohang.getKhoahoc().getThoigian()}h</li>
														<li>${giohang.getKhoahoc().getLinhvuc()}</li>
														<li>${giohang.getKhoahoc().getTrinhdodauvao()}</li>
													</ul>
												</a>
											</div>

											<div class="cart-item-action">
												<div class="cart-item-delete">
													<a href="DeleteCourses?makhoahoc=${giohang.getKhoahoc().getMakhoahoc()} &id=${hocvien.manguoidung}">Delete</a>
													<a href="#">Lưu để sau</a>
												</div>
												<div class="cart-item-price">
													<div class="cart-price-current">
														<p>${giohang.getKhoahoc().getGiatien()}</p>
													</div>
													<div class="cart-price-old">
														<p>10000$</p>
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<div class="cart-col-3 col-3">
					<div class="cart-pay">
						<span>Tổng:</span>
						<h2>9999$</h2>
						<button class="btn btn-primary btn-pay">Thanh Toán</button>
						<p>Khuyến mãi</p>
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="Recipient's username"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">Áp dụng</button>
						</div>

					</div>
				</div>
			</div>
		</section>
		<footer class="footer">
			<section class="footer_list">
				<section class="footer_item">
					<div class="footer_column">
						<div class="footer_header">
							<a class="nav_item_link" href="#">
								<div>OnCourse</div>
							</a>
							<h5>Dạy lập trình</h5>
						</div>
						<p class="footer_contact">Điện thoại: 0246.329.1102 Email:
							contact@fullstack.edu.vn Số 11D, lô A10, khu đô thị Nam Trung
							Yên, Phường Yên Hòa, Quận Cầu Giấy, TP. Hà Nội</p>
					</div>
				</section>
				<section class="footer_item">
					<div class="footer_column">
						<div class="footer_header">
							<h5>Về Oncourse</h5>
						</div>
						<ul class="footer_info">
							<li><a href="#">Giới thiệu</a></li>
							<li><a href="#">Liên hệ</a></li>
							<li><a href="#">Điều khoản</a></li>
							<li><a href="#">Bảo mật</a></li>
							<li><a href="#">Cơ hội việc làm</a></li>
						</ul>
					</div>
				</section>
				<section class="footer_item">
					<div class="footer_column">
						<div class="footer_header">
							<h5>Sản phẩm</h5>
						</div>
						<ul class="footer_info">
							<li><a href="#">Trang dạy học số</a></li>
							<li><a href="#">Trang đăng ký tài khoản</a></li>
							<li><a href="#">Trang giới thiệu khóa học</a></li>
							<li><a href="#">Trang thanh toán</a></li>

						</ul>
					</div>
				</section>
				<section class="footer_item">
					<div class="footer_column">
						<div class="footer_header">
							<h5>Công cụ</h5>
						</div>
						<ul class="footer_info">
							<li><a href="#">Github</a></li>
							<li><a href="#">VSCODE</a></li>
							<li><a href="#">Tomcat</a></li>
							<li><a href="#">Eclipse</a></li>
							<li><a href="#">Libary</a></li>
						</ul>
					</div>
				</section>
				<section class="footer_item">
					<div class="footer_column">
						<div class="footer_header">
							<h5>Công ty cổ phần công nghệ giáo dục Oncourse</h5>
						</div>
						<ul class="footer_info">
							<li><a href="#">Mã số thuế: 0109922901</a></li>
							<li><a href="#">Ngày thành lập: 04/03/2022</a></li>
							<li>
								<p>Lĩnh vực: Công nghệ, giáo dục, lập trình. Oncourse xây
									dựng và phát triển những sản phẩm mang lại giá trị cho cộng
									đồng.</p>
							</li>

						</ul>
					</div>
				</section>

			</section>
			<section class="footer_nav">
				<div class="footer_nav__info">© 2018 - 2023 Oncourse. Nền tảng
					học lập trình hàng đầu Việt Nam</div>
				<div class="footer_nav__icon">
					<i class="fa-brands fa-square-youtube"></i> <i
						class="fa-brands fa-square-facebook"></i> <i
						class="fa-brands fa-tiktok"></i>
				</div>
			</section>
		</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
   <script>
		window.onload = function() {
			ReloadAlert("${thongbaothemgiohang}");
			ReloadAlert("${thongbaoxoa}");
		}
	</script>
	<c:set var="thongbaothemgiohang" value="${null}" scope="request"></c:set>
	<c:set var="thongbaoxoa" value="${null}" scope="request"></c:set>
</body>
</html>