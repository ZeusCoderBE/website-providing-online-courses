<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
											<li class="setting__item"><a href="#"> <span>Hồ
														sơ cá nhân</span>
											</a></li>
											<li class="setting__item"><a href="#"> <span>Chứng
														chỉ</span>
											</a></li>
											<li class="setting__item"><a href="#"> <span>Cần
														trợ giúp</span>
											</a></li>
											<li class="setting__item"><a href="#"> <span>Đổi
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

		<section class="cart-container">
			<div class="row cart-row">
				<div class="cart-col-9 col-9">
					<div class="cart-content">
						<h3 class="cart-header">Giỏ hàng</h3>
						<div class="cart-info">
							<h5>1 khóa học trong giỏ hàng</h5>
							<ul class="cart-list">
								<li class="cart-item">
									<div class="cart-item-container">
										<div class="cart-item-info">
											<div class="cart-item-img">
												<a href="#"><img
													src="https://files.fullstack.edu.vn/f8-prod/courses/13/13.png"
													alt="react"></a>
											</div>
											<a href="#" class="cart-item-content">
												<h6>ReactJS</h6> <span>Bởi giáo viện: Minh Châu</span>
												<div class="cart-item-evaluate">
													<div>Bán chạy nhất</div>
													<div>Đã cập nhật gần đây</div>
													<span>4,8</span>
													<div class="cart-item-icon__start">
														<i class="fa-solid fa-star start-primary"></i> <i
															class="fa-solid fa-star start-primary"></i> <i
															class="fa-solid fa-star start-primary"></i> <i
															class="fa-solid fa-star start-primary"></i> <i
															class="fa-solid fa-star"></i>
													</div>
												</div>
												<ul class="cart-item-time">
													<li style="list-style: none;">Tổng số giờ</li>
													<li>340 bài giảng</li>
													<li>Sơ cấp</li>
												</ul>
											</a>
										</div>

										<div class="cart-item-action">
											<div class="cart-item-delete">
												<a href="#">Xóa</a> <a href="#">Lưu để sau</a>
											</div>
											<div class="cart-item-price">
												<div class="cart-price-current">
													<p>9999$</p>
												</div>
												<div class="cart-price-old">
													<p>10000$</p>
												</div>
											</div>
										</div>
									</div>
								</li>
								<li class="cart-item">
									<div class="cart-item-container">
										<div class="cart-item-info">
											<div class="cart-item-img">
												<a href="#"><img
													src="https://files.fullstack.edu.vn/f8-prod/courses/13/13.png"
													alt="react"></a>
											</div>
											<a href="#" class="cart-item-content">
												<h6>ReactJS</h6> <span>Bởi giáo viện: Minh Châu</span>
												<div class="cart-item-evaluate">
													<div>Bán chạy nhất</div>
													<div>Đã cập nhật gần đây</div>
													<span>4,8</span>
													<div class="cart-item-icon__start">
														<i class="fa-solid fa-star start-primary"></i> <i
															class="fa-solid fa-star start-primary"></i> <i
															class="fa-solid fa-star start-primary"></i> <i
															class="fa-solid fa-star start-primary"></i> <i
															class="fa-solid fa-star start-primary"></i>
													</div>
												</div>
												<ul class="cart-item-time">
													<li style="list-style: none;">Tổng số giờ</li>
													<li>340 bài giảng</li>
													<li>Sơ cấp</li>
												</ul>
											</a>
										</div>

										<div class="cart-item-action">
											<div class="cart-item-delete">
												<a href="#">Xóa</a> <a href="#">Lưu để sau</a>
											</div>
											<div class="cart-item-price">
												<div class="cart-price-current">
													<p>9999$</p>
												</div>
												<div class="cart-price-old">
													<p>10000$</p>
												</div>
											</div>
										</div>
									</div>
								</li>
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
			<div class="footer_list">
				<div class="footer_nav">
					<p>Bạn đang đăng nhập với tên ,</p>
					<a href="#">TRAN VAN LUAN(Thoát)</a>
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