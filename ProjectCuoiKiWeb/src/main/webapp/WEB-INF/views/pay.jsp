<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh Toán Khóa Học</title>
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
								<li class="mr-3">
									<div class="show_info">
										<i class="fa-solid fa-cart-shopping"></i>
										<div class="show_info__figure">4</div>
										<div class="my_course">
											<div class="pseudo_class"></div>

											<div class="my_course__header">
												<h5>Giỏ hàng của tôi</h5>
												<span>Xem tất cả</span>
											</div>
											<ul class="my_course__list">
												<div class="my_course__detail">
													<div class="my_sourse__item">
														<a href="#"> <img
															src="https://files.fullstack.edu.vn/f8-prod/courses/13/13.png"
															alt="react">
														</a>
													</div>
													<div class="my_course__info">
														<span> <a href="#">Xây Dựng Website với ReactJS
																ahdhdghdsg</a>
														</span> <span class="info_time"> Xuất bản :21-3-2022 </span>
													</div>

													<div class="my_course__action">
														<div class="my_course__buy">
															<a href="#">Buy</a>
														</div>

														<div class="my_course__delete">
															<a href="#">Delete</a>
														</div>
													</div>
												</div>
												<div class="my_course__detail">
													<div class="my_sourse__item">
														<a href="#"> <img
															src="https://files.fullstack.edu.vn/f8-prod/courses/12.png"
															alt="react">
														</a>
													</div>
													<div class="my_course__info">
														<span> <a href="#">Xây Dựng Website với ReactJS</a>
														</span> <span class="info_time"> Xuất bản :21-3-2022 </span>
													</div>
													<div class="my_course__action">
														<div class="my_course__buy">
															<a href="#">Buy</a>
														</div>

														<div class="my_course__delete">
															<a href="#">Delete</a>
														</div>
													</div>
												</div>
												<div class="my_course__detail">
													<div class="my_sourse__item">
														<a href="#"> <img
															src="https://files.fullstack.edu.vn/f8-prod/courses/13/13.png"
															alt="react">
														</a>
													</div>
													<div class="my_course__info">
														<span> <a href="#">Xây Dựng Website với ReactJS</a>
														</span> <span class="info_time"> Xuất bản :21-3-2022 </span>

													</div>
													<div class="my_course__action">
														<div class="my_course__buy">
															<a href="#">Buy</a>
														</div>

														<div class="my_course__delete">
															<a href="#">Delete</a>
														</div>
													</div>
												</div>
												<div class="my_course__detail">
													<div class="my_sourse__item">
														<a href="#"> <img
															src="https://files.fullstack.edu.vn/f8-prod/courses/12.png"
															alt="react">
														</a>
													</div>
													<div class="my_course__info">
														<span> <a href="#">Xây Dựng Website với ReactJS</a>
														</span> <span class="info_time"> Xuất bản :21-3-2022 </span>

													</div>
													<div class="my_course__action">
														<div class="my_course__buy">
															<a href="#">Buy</a>
														</div>

														<div class="my_course__delete">
															<a href="#">Delete</a>
														</div>
													</div>
												</div>
											</ul>

										</div>
									</div>
								</li>
								<li class="mr-3">
									<div class="">
										<i class="fa-solid fa-bell"></i>
									</div>
								</li>
								<li class="d-flex">
									<div class="usermenu" style="display: flex;">
										<span>Tran Van Luan</span>
										<div class="icon_name">
											<span>T</span>
										</div>
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
											<li class="setting__item"><a href="#"> <span>Đăng
														xuất</span> <i class="fa-solid fa-right-to-bracket"></i>
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

		<section class="pay-container">
			<div class="pay-header">
				<img src="./templates/Images/logo.png" alt="logo" height="100"
					width="100">
				<h2>Cổng Thanh Toán Trực Tuyến</h2>
			</div>
			<div class="content-pay">
				<form action="paid" method="post">
					<div class="row">
						<div class="col-6">
							<div class="form-list">
								<div class="form-item">
									<div class="form-item-pay">
										<div class="form-pay-header">
											<h2>Thông tin học viên</h2>
										</div>
										<div class="form-pay-input">
											<label for="namekh">Tên khóa học</label> <input type="text"
												id="namekh" value="${khoahoc.getTenkhoahoc()}" />
										</div>
										<div class="form-pay-input">
											<label for="date">Ngày thanh toán</label> <input type="date"
												id="date" placeholder="yyyy/mmm/dd" name="ngayThanhToan"
												value="${now}" />
										</div>
										<div class="form-pay-input">
											<label for="cardNumber">Card Number</label> <input
												type="text" id="cardNumber" name="CardNumber"
												value="${the.getMaThe()}" />
										</div>
										<div class="form-pay-input">
											<label for="price">Số tiền cần thanh toán</label> <input
												type="text" id="price" name="price"
												value="${khoahoc.getGiatien()}" />
										</div>
										<div class="form-pay-input">
											<label for="noidungtt">Nội dung thanh toán</label> <input
												type="text" id="noidungtt" name="noidungtt"
												value="${noidungtt}" />
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
														src="https://e-bills.vn/assets/img/CreateInvoiceCode.png"
														height="60" width="110">
												</a></li>
											</ul>
										</div>
										<button class="btn btn-primary btn-pay" type="submit"
											onclick="confirmPayment('${the.getSoDu()-khoahoc.getGiatien()}', '${khoahoc.getMakhoahoc()}')">Thanh
											toán</button>
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
							<li><a href="#">Spring MVC</a></li>
							<li><a href="#">Maven Project</a></li>
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
								<p>Lĩnh vực: Công nghệ, giáo dục, lập trình. OnCourse xây
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
	<script src="./templates/JavaScript/script.js"></script>
</body>
</html>