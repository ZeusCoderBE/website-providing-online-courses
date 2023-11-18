<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Vào Một Khoá Học</title>
<link rel="stylesheet" href="./templates/bootstrap-5.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./templates/fontawesome-free-6.4.2-web/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="./templates/CSS/cart.css">
<link rel="stylesheet" type="text/css"
	href="./templates/CSS/descride.css">
<script src="./templates/JavaScript/script.js"></script>
</head>
<body>
	<div id="page">
		<div class="header">
			<nav class="nav">
				<ul class="nav_item">
					<li class="nav_link"><a class="nav_item_link" href="homepages">
							<div>OnCourse</div>
					</a></li>
					<li class="nav_link nav_input">
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</li>
					<li class="nav_link"><c:if
							test="${not empty hocvien.manguoidung}">
							<li class="mr-3">
								<div class="show_info">
									<i class="fa-solid fa-cart-shopping"></i>
									<div class="show_info__figure">${countkhoahoc.numberofcourse}</div>
									<div class="my_course">
										<div class="pseudo_class"></div>
										<div class="my_course__header">
											<h5>Giỏ hàng của tôi</h5>
											<a href="ShowInforCart?Id=${hocvien.manguoidung}">Xem tất
												cả</a>
										</div>
										<ul class="my_course__list">
											<c:forEach var="giohangcuatoi" items="${dsgiohang}">
												<div class="my_course__detail">
													<div class="my_sourse__item">
														<a href="#"> <img
															src="https://files.fullstack.edu.vn/f8-prod/courses/13/13.png"
															alt="react">
														</a>
													</div>
													<div class="my_course__info">
														<span> <a href="#">${giohangcuatoi.getKhoahoc().getTenkhoahoc()}</a>
														</span> <span class="info_time"> Xuất bản
															:${giohangcuatoi.getKhoahoc().getNgayphathanh()}</span>
													</div>
													<div class="my_course__action">
														<div class="my_course__buy">
															<a
																href="paycourseinfo?makhoahoc=${giohangcuatoi.getKhoahoc().getMakhoahoc()}">Mua</a>
														</div>

														<div class="my_course__delete">
															<a
																href="DeleteCourse?makhoahoc=${giohangcuatoi.getKhoahoc().getMakhoahoc()} &id=${hocvien.manguoidung}">Xoá</a>
														</div>
													</div>
												</div>
											</c:forEach>
										</ul>
									</div>
								</div>
							</li>
							<li class="mr-3 icon "><i class="fa-solid fa-bell"></i></li>

							<div class="site_img">
								<img
									src="https://files.fullstack.edu.vn/f8-prod/user_photos/284558/63c4c5f97e0c5.jpg"
									alt="Trần Văn Luân">
							</div>
						</c:if>
		</div>
		<div class="main">
			<div class="content">
				<div class="sidebar">
					<div class="sidebar_add">
						<span>+</span>
					</div>
					<ul class="sidebar_icon">
						<li class="sidebar_link"><a href="homepages"
							class="sidebar_link__icon"> <i class="fa-solid fa-house"></i>
								<span>Trang chủ</span>
						</a></li>
						<li class="sidebar_link"><a href="#"
							class="sidebar_link__icon"> <i class="fa-solid fa-road"></i>
								<span>Lộ trình</span>
						</a></li>
						<li class="sidebar_link"><a href="#"
							class="sidebar_link__icon"> <i class="fa-solid fa-newspaper"></i>
								<span>Bài viết</span>
						</a></li>
					</ul>
				</div>

				<div class="container">
					<div class="course_head">
						<h3>${khoahoc.tenkhoahoc}</h3>
					</div>
					<div class="course__content">
						<h3>Ngôn Ngữ :${khoahoc.ngonngu}</h3>
					</div>
					<div class="course_des"></div>
					<div class="course_detail">
						<p>${khoahoc.mota}</p>
					</div>
				</div>

				<div class="info">
					<div class="course_action">
						<div class="course_info">
							<h3>Course</h3>
							<div class="course_des course_des__main">Thời gian hoàn
								thành: ${khoahoc.thoigian} bài học</div>
							<div class="road_line"></div>

							<div class="evaluate">
								<span>${khoahoc.danhgia}</span> <i class="fa-solid fa-star"></i>
								<c:choose>
									<c:when test="${ not empty dem.soluong}">
										<span>(${dem.soluong} Đăng ký)</span>
									</c:when>
									<c:otherwise>
										<span>(0 Đăng ký)</span>
									</c:otherwise>
								</c:choose>
								<div class="line_stand"></div>
								<i class="fa-solid fa-thumbs-up"></i> <span>92%</span>
							</div>

							<h5>Ngày Phát Hành: ${khoahoc.ngayphathanh}</h5>
							<div class="course_des">${khoahoc.trinhdodauvao}</div>
							<fmt:formatNumber var="giatien" value="${khoahoc.giatien}"
								type="number" pattern="###0.00" />
							<h5>Giá Tiền: ${giatien.replace(',', '.')}$</h5>
							<div class="road_line"></div>
							<a class="view_course" href="#">View course modules</a>
						</div>
						<c:choose>
							<c:when
								test="${not empty hocvien.manguoidung && empty giangvien.manguoidung}">
								<c:choose>
									<c:when test="${isdangky != true}">
										<div class="btn_action">
											<a href="paycourseinfo?makhoahoc=${khoahoc.makhoahoc}"
												class="btn btn-success btn_signin__course"> Đăng Ký </a> <a
												href="AddCourse?makhoahoc=${khoahoc.makhoahoc}"
												class="btn btn-primary btn_signin__course">Thêm giỏ hàng</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="btn_action">
											<a href="courses?makhoahoc=${khoahoc.makhoahoc}">
												<button class="btn btn-success btn_signin__course">Vào
													học</button>
											</a>
										</div>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when
								test="${not empty giangvien.manguoidung && empty hocvien.manguoidung && istao==true}">
								<div class="btn_action">
									<a href="courses?makhoahoc=${khoahoc.makhoahoc}"
										class="btn btn-success btn_signin__course">Vào</a> <a
										href="Find-Course?makhoahoc=${khoahoc.makhoahoc} "
										class="btn btn-primary btn_signin__course">Sửa</a> <a href="#"
										onclick="XacNhanXoaKH(${khoahoc.makhoahoc})"
										class="btn btn-success btn_signin__course">Xoá</a>

								</div>
							</c:when>
							<c:when
								test="${empty giangvien.manguoidung && empty hocvien.manguoidung && empty istao}">
								<div class="btn_action">
									<a href="login">
										<button class="btn btn-success btn_signin__course">Đăng
											ký học</button>
									</a>
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
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
	<script type="text/javascript" src="./templates/bootstrap-5.3.2-dist/js/bootstrap.min.js" >
	<script>
		window.onload = function() {
			ReloadAlert("${xoakh}");
			ReloadAlert("${thongbaoedit}");
		}
	</script>
	<c:set var="thongbaoedit" value="${null}"></c:set>
	<c:set var="xoakh" value="${null}"></c:set>
</body>
</html>