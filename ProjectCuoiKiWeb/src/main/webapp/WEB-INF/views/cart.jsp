<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<link rel="stylesheet"
	href="./templates/bootstrap-5.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./templates/fontawesome-free-6.4.2-web/css/all.min.css" />
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
			<form action="paycourseinfo" method="GET">
				<div class="row cart-row">
					<div class="cart-col-9 col-9">
						<div class="cart-content">
							<h3 class="cart-header">Giỏ hàng</h3>
							<div class="cart-info">
								<h5>Khóa học trong giỏ hàng: ${countkhoahoc.numberofcourse}
									Khoá Học</h5>
								<ul class="cart-list">
									<c:forEach var="giohang" items="${dsgiohang}">
										<li class="cart-item"><input class="checkbox-item"
											onclick="TotalPay()" type="checkbox" name="selectedCourses"
											id="selectedCourses"
											value="${giohang.getKhoahoc().getMakhoahoc()}">
											<div class="cart-item-container">
												<div class="cart-item-info">
													<div class="cart-item-img">
														<a href="#"><img
															src="./templates/Images/${giohang.hinhanh}" alt="react"></a>
													</div>
													<a href="#" class="cart-item-content">
														<h6>${giohang.getKhoahoc().getTenkhoahoc()}</h6>
														<div class="cart-item-evaluate">
															<div>Bán chạy nhất</div>
															<div>Đã cập nhật gần đây</div>
															<span>${giohang.getKhoahoc().getDanhgia()}</span>
															<div class="cart-item-icon__start">
																<c:choose>
																	<c:when
																		test="${giohang.getKhoahoc().getDanhgia() eq 5}">
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																	</c:when>
																	<c:when
																		test="${giohang.getKhoahoc().getDanhgia() eq 4}">
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star "></i>
																	</c:when>
																	<c:when
																		test="${giohang.getKhoahoc().getDanhgia() eq 3}">
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star"></i>
																		<i class="fa-solid fa-star "></i>
																	</c:when>
																	<c:when
																		test="${giohang.getKhoahoc().getDanhgia() eq 2}">
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star"></i>
																		<i class="fa-solid fa-star"></i>
																		<i class="fa-solid fa-star"></i>
																	</c:when>
																	<c:when
																		test="${giohang.getKhoahoc().getDanhgia() eq 1}">
																		<i class="fa-solid fa-star start-primary"></i>
																		<i class="fa-solid fa-star "></i>
																		<i class="fa-solid fa-star"></i>
																		<i class="fa-solid fa-star"></i>
																		<i class="fa-solid fa-star"></i>
																	</c:when>
																</c:choose>
															</div>
														</div>
														<ul class="cart-item-time">
															<fmt:formatNumber var="thoigian"
																value="${giohang.getKhoahoc().getThoigian()}"
																type="number" maxFractionDigits="3" />
															<li style="list-style: none;">${thoigian}h</li>
															<li>${giohang.getKhoahoc().getLinhvuc()}</li>
															<li>${giohang.getKhoahoc().getTrinhdodauvao()}</li>
														</ul>
													</a>
												</div>

												<div class="cart-item-action">
													<div class="cart-item-delete">
														<a
															href="DeleteCourses?makhoahoc=${giohang.getKhoahoc().getMakhoahoc()} &id=${hocvien.manguoidung}">Xoá</a>
													</div>
													<div class="cart-item-price">
														<div class="cart-price-current">
															<fmt:formatNumber var="giaTien"
																value="${giohang.getKhoahoc().getGiatien()}"
																type="number" maxFractionDigits="3" />
															<p>Giá Tiền: ${giaTien.replace(',','.')}$</p>
														</div>
													</div>
												</div>
											</div></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>

					<div class="cart-col-3 col-3">
						<div class="cart-pay">
							<span>Tổng:</span>
							<h2>0$</h2>
							<button class="btn btn-primary btn-buy" type="submit">Thanh
								Toán</button>
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
			</form>
		</section>
		<footer class="footer">
			<section class="footer_list">
				<section class="footer_item">
					<div class="footer_column">
						<div class="footer_header">
							<a class="nav_item_link" href="homepages">
								<div>${company.getName()}</div>
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
							<h5>Về ${company.getName()}</h5>
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
							<h5>Công ty cổ phần công nghệ giáo dục ${company.getName()}</h5>
						</div>
						<ul class="footer_info">
							<li><a href="#">Mã số thuế: 0109922901</a></li>
							<li><a href="#">Ngày thành lập: 04/03/2022</a></li>
							<li>
								<p>Lĩnh vực: Công nghệ, giáo dục, lập trình.
									${company.getName()} xây dựng và phát triển những sản phẩm mang
									lại giá trị cho cộng đồng.</p>
							</li>

						</ul>
					</div>
				</section>

			</section>
			<section class="footer_nav">
				<div class="footer_nav__info">© 2018 - 2023
					${company.getName()}. Nền tảng học lập trình hàng đầu Việt Nam</div>
				<div class="footer_nav__icon">
					<i class="fa-brands fa-square-youtube"></i> <i
						class="fa-brands fa-square-facebook"></i> <i
						class="fa-brands fa-tiktok"></i>
				</div>
			</section>
		</footer>
	</div>
	<script type="text/javascript"
		src="./templates/bootstrap-5.3.2-dist/js/bootstrap.min.js">
		
	</script>
	<script type="text/javascript">
		window.onload = function() {
			ReloadAlert("${thongbaothemgiohang}");
			ReloadAlert("${thongbaoxoa}");
			ReloadAlert("${thongbaott}");
		}
	</script>
	<c:set var="thongbaothemgiohang" value="${null}" scope="request"></c:set>
	<c:set var="thongbaoxoa" value="${null}" scope="request"></c:set>
	<c:set var="thongbaott" value="${null}" scope="request"></c:set>
</body>
</html>