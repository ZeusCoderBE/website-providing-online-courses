<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Vào Một Khoá Học</title>
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
<link rel="stylesheet" type="text/css"
	href="./templates/CSS/descride.css">
</head>
<body>
	<div id="page">
		<div class="header">
			<nav class="nav">
				<ul class="nav_item">
					<li class="nav_link"><a class="nav_item_link"
						href="index.html">
							<div>OnCourse</div>
					</a></li>
					<li class="nav_link nav_input">
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</li>
					<li class="nav_link">
						<div class="show_info">
							<span>Khóa học của tôi</span>
							<div class="my_course">
								<div class="pseudo_class"></div>

								<div class="my_course__header">
									<h5>Khóa học của tôi</h5>
									<span><a href="mycourse?manguoidung=${manguoidung}">Xem
											tất cả</a></span>
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
											<span> <a href="#">Xây Dựng Website với ReactJS</a>
											</span> <span class="info_time"> Học cách đây 2 ngày trước </span>
											<div class="card-footer dashboard-card-footer border-0">
												<div class="progress border">
													<div class="progress-bar bar" role="progressbar"
														aria-valuenow="81" style="width: 81%" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
												<div class="small">
													<span class="sr-only">Course progress:</span> <strong>81</strong>%
													complete
												</div>
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
											</span> <span class="info_time"> Học cách đây 2 ngày trước </span>
											<div class="card-footer dashboard-card-footer border-0">
												<div class="progress border">
													<div class="progress-bar bar" role="progressbar"
														aria-valuenow="50" style="width: 50%" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
												<div class="small">
													<span class="sr-only">Course progress:</span> <strong>50</strong>%
													complete
												</div>
											</div>
										</div>
									</div>
								</ul>

							</div>
						</div> <i class=" icon fa-solid fa-bell"></i>
						<div class="site_img">
							<img
								src="https://files.fullstack.edu.vn/f8-prod/user_photos/284558/63c4c5f97e0c5.jpg"
								alt="Trần Văn Luân">
						</div>
					</li>
				</ul>
			</nav>
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
						<h1>${khoahoc.tenkhoahoc}</h1>
					</div>
					<div class="course_des">${khoahoc.mota}</div>
					<div class="course_detail">
						<h2>Bạn sẽ học được gì?</h2>
						<ul class="list">
							<c:forEach var="baihoc" items="${listbaihoc}">
								<li class="list_item"><i class="fa-solid fa-check"></i> 
								    <span>Tên Bài Học: ${baihoc.tenbaihoc}</span> <br/>
									<span>Nội Dung Bài Học: ${baihoc.noidungbaihoc}</span> <br/>
									<span>Thời Gian Hoàn Thành: ${baihoc.thoigianhoanthanh}h</span>
								</li>
							</c:forEach>

						</ul>
					</div>

					<div class="course__content">
						<h3>Ngôn Ngữ :${khoahoc.ngonngu}</h3>
					</div>

				</div>

				<div class="info">
					<div class="course_action">
						<div class="course_info">
							<h3>Course</h3>
							<div class="course_des course_des__main">Giá Tiền:
								${khoahoc.giatien}$</div>
							<div class="road_line"></div>

							<div class="evaluate">
								<span>${khoahoc.danhgia}</span> <i class="fa-solid fa-star"></i>
								<span>(1.040 reviews)</span>
								<div class="line_stand"></div>
								<i class="fa-solid fa-thumbs-up"></i> <span>92%</span>
							</div>

							<h5>Ngày Phát Hành: ${khoahoc.ngayphathanh}</h5>
							<div class="course_des">No previous experience necessary</div>

							<h5>Thời Gian Hoàn Thành: ${khoahoc.thoigian}</h5>

							<div class="road_line"></div>
							<a class="view_course" href="#">View course modules</a>
						</div>
						
						<div class="btn_action">
							<a href="paycourse?makhoahoc=${khoahoc.makhoahoc}">
							<button class="btn btn-success btn_signin__course">Đăng
								ký học</button></a>
							<button class="btn btn-primary btn_signin__course">Thêm
								giỏ hàng</button>
						</div>
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
                        <p class="footer_contact">Điện thoại: 0246.329.1102
                            Email: contact@fullstack.edu.vn
                            Số 11D, lô A10, khu đô thị Nam Trung Yên, Phường Yên Hòa, Quận Cầu Giấy, TP. Hà Nội</p>
                    </div>
                </section>
                <section class="footer_item">
                    <div class="footer_column">
                        <div class="footer_header">
                            <h5>Về Oncourse</h5>
                        </div>
                        <ul class="footer_info">
                            <li>
                                <a href="#">Giới thiệu</a>
                            </li>
                            <li>
                                <a href="#">Liên hệ</a>
                            </li>
                            <li>
                                <a href="#">Điều khoản</a>
                            </li>
                            <li>
                                <a href="#">Bảo mật</a>
                            </li>
                            <li>
                                <a href="#">Cơ hội việc làm</a>
                            </li>
                        </ul>
                    </div>
                </section>
                <section class="footer_item">
                    <div class="footer_column">
                        <div class="footer_header">
                            <h5>Sản phẩm</h5>
                        </div>
                        <ul class="footer_info">
                            <li>
                                <a href="#">Trang dạy học số</a>
                            </li>
                            <li>
                                <a href="#">Trang đăng ký tài khoản</a>
                            </li>
                            <li>
                                <a href="#">Trang giới thiệu khóa học</a>
                            </li>
                            <li>
                                <a href="#">Trang thanh toán</a>
                            </li>
                            
                        </ul>
                    </div>
                </section>
                <section class="footer_item">
                    <div class="footer_column">
                        <div class="footer_header">
                            <h5>Công cụ</h5>
                        </div>
                        <ul class="footer_info">
                            <li>
                                <a href="#">Github</a>
                            </li>
                            <li>
                                <a href="#">VSCODE</a>
                            </li>
                            <li>
                                <a href="#">Tomcat</a>
                            </li>
                            <li>
                                <a href="#">Eclipse</a>
                            </li>
                            <li>
                                <a href="#">Libary</a>
                            </li>
                        </ul>
                    </div>
                </section>
                <section class="footer_item">
                    <div class="footer_column">
                        <div class="footer_header">
                            <h5>Công ty cổ phần công nghệ giáo dục Oncourse</h5>
                        </div>
                        <ul class="footer_info">
                            <li>
                                <a href="#">Mã số thuế: 0109922901</a>
                            </li>
                            <li>
                                <a href="#">Ngày thành lập: 04/03/2022</a>
                            </li>
                            <li>
                                <p>Lĩnh vực: Công nghệ, giáo dục, lập trình. Oncourse xây dựng và phát triển những sản phẩm mang lại giá trị cho cộng đồng.</p>
                            </li>
                            
                        </ul>
                    </div>
                </section>
                
            </section>
            <section class="footer_nav">
                <div class="footer_nav__info">© 2018 - 2023 Oncourse. Nền tảng học lập trình hàng đầu Việt Nam</div>
                <div class="footer_nav__icon">
                    <i class="fa-brands fa-square-youtube"></i>
                    <i class="fa-brands fa-square-facebook"></i>
                    <i class="fa-brands fa-tiktok"></i>
                </div>
            </section>
            </footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>
</html>