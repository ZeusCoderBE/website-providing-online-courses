<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Chủ</title>
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
<link href="./templates/CSS/main.css" type="text/css" rel="stylesheet">
<link href="./templates/CSS/style.css" type="text/css" rel="stylesheet">
<link href="./templates/CSS/course.css" type="text/css" rel="stylesheet">
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
														sơ cá nhân</span>
											</a></li>
											<li class="setting__item"><a href="myprofiles"> <span>Chứng
														chỉ</span>
											</a></li>
											<li class="setting__item"><a href="myprofiles"> <span>Cần
														trợ giúp</span>
											</a></li>
											<li class="setting__item"><a href="myprofiles"> <span>Đổi
														mật khẩu</span>
											</a></li>
											<li class="setting__item"><a
												onclick="testConfirmDialog()" href="#"> <span>Đăng
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

		<section class="main">
			<div class="row">
				<nav class="col-2">
					<div class="sidebar sidebar_study">
						<div style="justify-content: center;" class="branding-inner">
							<a style="margin-top: 0;" href="homepages" class="site-name">
								<img class="site-logo" src="./templates/Images/logo.png"
								alt="UTEX-HCMUTE">
							</a>
						</div>

						<div class="nav_drawer home_system">
							<div>React Basic</div>
						</div>
						<div class="nav_drawer calendar nav_drawer__course">
							<button class="btn btn_course">
								<i class="fa-solid fa-chevron-down"></i>
								<div style="margin: 0;" class="btn_course__content">Course
									Material</div>
							</button>
							<ul class="list_timer">
								<c:forEach var="baihoc" items="${dsbaihoc}">
									<li><a href="FindDocuments?mabaihoc=${baihoc.mabaihoc}">
											<span>${baihoc.tenbaihoc}</span>
									</a></li>
								</c:forEach>
							</ul>

						</div>
						<!-- <div class="nav_drawer home_file">
                            <a href="#">
                                <i class="fa-solid fa-calendar-days"></i>
                                <span>lịch</span>
                            </a>
                        </div> -->
						<div class="nav_drawer home_file">
							<a href="#"> <i class="fa-regular fa-file"></i> <span>Grades</span>
							</a>
						</div>
						<div class="nav_drawer home_file">
							<a href="#"> <i class="fa-regular fa-file"></i> <span>Notes</span>
							</a>
						</div>
						<div class="nav_drawer home_file">
							<a href="upload.html"> <i class="fa-regular fa-file"></i> <span>Discussion
									Forums</span>
							</a>
						</div>
						<div class="nav_drawer home_file">
							<a href="#"> <i class="fa-regular fa-file"></i> <span>Messages</span>
							</a>
						</div>
						<div class="nav_drawer home_file">
							<a href="#"> <i class="fa-regular fa-file"></i> <span>Resourses</span>
							</a>
						</div>

					</div>

				</nav>
				<c:choose>
				<c:when test="${not empty lesson}">
					<article class="col-10">
						<div class="page_study">
							<div class="branding-inner">
								<div class="course_name">SSRF là gì? Cách phát hiện và
									ngăn chặn tấn công yêu cầu giả mạo từ phía máy chủ</div>
								<div class="date_course">
									<span>Đã đăng vào :</span> <span> thg 11 29, 2018 3:12</span>
								</div>
							</div>

							<div class="content">
								<div class="content_text">
									<div class="content_item">
										<div class="content_header">
											<div>Nội dung bài học</div>
											<div class="content_progress">
												<i class="fa-solid fa-check"></i> <span>Complete</span>
											</div>
										</div>
										<div class="content_main">
											<div class="container_content">
												<p>Hôm nay chúng ta cùng đi tìm hiểu SSRF (Server Side
													Request Forgery) là gì, cách phát hiện và ngăn chặn tấn
													công yêu cầu giả mạo từ phía máy chủ qua bài viết dưới đây.</p>
												<h6 style="font-weight: bold;">SSRF là gì?</h6>
												<p>SSRF (Server Side Request Forgery) hay còn gọi là tấn
													công yêu cầu giả mạo từ phía máy chủ cho phép kẻ tấn công
													thay đổi tham số được sử dụng trên ứng dụng web để tạo hoặc
													kiểm soát các yêu cầu từ máy chủ dễ bị tấn công.</p>
												<p style="text-align: center;">
													<video width="640" height="360" controls>
														<source src="./templates/ResourceVideo/${lesson.duongdan}"
															type="video/mp4"></source>
													</video>
												</p>
												<p>
													Khi thông tin trong một ứng dụng web phải được lấy từ một
													tài nguyên bên ngoài, chẳng hạn như nguồn cấp dữ liệu RSS
													từ một trang web khác, các yêu cầu phía máy chủ được sử
													dụng để tìm nạp tài nguyên và đưa nó vào ứng dụng web. <br>
													Ví dụ, một nhà phát triển có thể sử dụng một URL như
													https://example.com/feed.php?url=externalsite.com/feed/ để
													lấy nguồn cấp dữ liệu từ xa. Nếu kẻ tấn công có thể thay
													đổi tham số url thành localhost, thì anh ta có thể xem các
													tài nguyên cục bộ được lưu trữ trên máy chủ, làm cho nó dễ
													bị tấn công bởi yêu cầu giả mạo từ phía máy chủ.
												</p>
												<h6 style="font-weight: bold;">Nếu kẻ tấn công có thể
													kiểm soát đích của các yêu cầu phía máy chủ, chúng có thể
													thực hiện các hành động sau:</h6>
												<ul>
													<li>Lạm dụng mối quan hệ tin cậy giữa máy chủ dễ bị
														tổn thương và những người khác.</li>
													<li>Bỏ qua danh sách trắng IP.</li>
													<li>Bỏ qua dịch vụ xác thực dựa trên máy chủ.</li>
													<li>Đọc tài nguyên mà công chúng không thể truy cập,
														chẳng hạn như trace.axd trong ASP.NET hoặc siêu dữ liệu
														API trong môi trường AWS.</li>
													<li>Quét mạng nội bộ mà máy chủ được kết nối đến.</li>
													<li>Đọc tệp từ máy chủ web.</li>
													<li>Xem trang trạng thái và tương tác với các API như
														máy chủ web.</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
					</c:when>
				</c:choose>
			</div>
		</section>

		<footer class="footer"> </footer>
	</div>
	<script src="./templates/JavaScript/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>