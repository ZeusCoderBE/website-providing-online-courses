<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nạp tiền</title>
<link rel="stylesheet" href="./templates/bootstrap-5.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./templates/fontawesome-free-6.4.2-web/css/all.min.css" />
<link rel="stylesheet" href="./templates/CSS/cart.css">
<link rel="stylesheet" href="./templates/CSS/main.css">
<link rel="stylesheet" href="./templates/CSS/descride.css">
<link rel="stylesheet" href="./templates/CSS/style.css">
<script type="text/javascript" src="./templates/JavaScript/script.js"></script>

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
								<c:if test="${not empty hocvien.manguoidung}">
									<li class="mr-3">
										<div class="show_info">
											<i class="fa-solid fa-cart-shopping"></i>
											<div class="show_info__figure">${countkhoahoc.numberofcourse}</div>
											<div class="my_course">
												<div class="pseudo_class"></div>
												<div class="my_course__header">
													<h5>Giỏ hàng của tôi</h5>
													<a href="ShowInforCart?Id=${hocvien.manguoidung}">Xem
														tất cả</a>
												</div>
												<ul class="my_course__list">
													<c:forEach var="giohangcuatoi" items="${dsgiohang}">
														<div class="my_course__detail">
															<div class="my_sourse__item">
																<a href="#"> <img
																	src="./templates/Images/${giohangcuatoi.hinhanh}"
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
									<li class="mr-3">
										<div class="">
											<i class="fa-solid fa-bell"></i>
										</div>
									</li>
								</c:if>

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
													<li class="setting__item"><a href="myprofiles"> <span>Chứng
																chỉ</span> <i class="fa-solid fa-award"></i>
													</a></li>

													<li class="setting__item"><a href="myprofiles"> <span>Cần
																trợ giúp</span> <i class="fa-solid fa-circle-question"></i>
													</a></li>
													<li class="setting__item"><a href="myprofiles"
														onclick="scrollToElement('.personal_email')"> <span>Đổi
																mật khẩu</span> <i class="fa-solid fa-lock"></i>
													</a></li>
													<li class="setting__item"><a href="#"
														onclick="testConfirmDialog()"> <span>Đăng xuất</span>
															<i class="fa-solid fa-right-to-bracket"></i>
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

		<section class="pay-container">
			<div class="pay-header">
				<img src="${company.getLogo()}" alt="logo" height="100"
					width="100">
				<h2>Cổng Thanh Toán Trực Tuyến</h2>
			</div>
			<div class="content-pay">
				<form action="deposit" method="post">
					<div class="row">
						<div class="col-6">
							<div class="form-list">
								<div class="form-item">
									<div class="form-item-pay">
										<div class="form-pay-header">
											<h2>Thông tin học viên</h2>
										</div>
										<div class="form-pay-input">
											<label for="namekh">Tên học viên</label> <input type="text"
												id="namehv" name="namehv" disabled value="${thongtin.hoten}" />
										</div>
										<div class="form-pay-input">
											<label for="cardNumber">Card Number</label> <input
												type="text" id="cardNumber" name="card"
												value="${the.getMaThe()}" />
										</div>
										<div class="form-pay-input">
											<label for="price">Số tiền cần nạp</label> <input type="text"
												id="price " name="price" />
										</div>
										<div class="form-pay-input">
											<label for="contentPay">Nội dung</label> <input type="text"
												id="contentPay" name="noidung" />
										</div>
										<!-- <button class="btn" type="submit">pay</button> -->
									</div>

								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="form-list">
								<div class="form-item">
									<div class="form-item-pay">
										<div class="form-pay-header">
											<h2>chọn hình thức thanh toán</h2>
										</div>
										<div class="category-pay">
											<ul class="category-list">
												<li class="category-item"><a href="#"> <img
														src="https://e-bills.vn/assets/img/VCB.png" height="60"
														width="110">
												</a></li>
												<li class="category-item"><a href="#"> <img
														src="https://e-bills.vn/assets/img/BIDV.png" height="60"
														width="110">
												</a></li>
												<li class="category-item"><a href="#"> <img
														src="https://pscinvoice.blob.core.windows.net/assets/VNPayATM.png"
														height="60" width="110">
												</a></li>

												<li class="category-item"><a href="#"> <img
														src="	https://e-bills.vn/assets/img/CreateInvoiceCode.png"
														height="60" width="110">
												</a></li>
											</ul>
										</div>
										<input class="btn btn-primary btn-pay" type="submit"
											value="Nạp Tiền">
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
		<footer class="footer">
			<section class="footer_list">
				<section class="footer_item">
					<div class="footer_column">
						<div class="footer_header">
							<a class="nav_item_link" href="#">
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
								<p>Lĩnh vực: Công nghệ, giáo dục, lập trình. ${company.getName()} xây
									dựng và phát triển những sản phẩm mang lại giá trị cho cộng
									đồng.</p>
							</li>

						</ul>
					</div>
				</section>

			</section>
			<section class="footer_nav">
				<div class="footer_nav__info">© 2018 - 2023 ${company.getName()}. Nền tảng
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
			ReloadAlert("${thongbaotienloi}")
		}
	</script>
	<c:set var="thongbaotienloi" value="${null}"></c:set>
</body>
</html>