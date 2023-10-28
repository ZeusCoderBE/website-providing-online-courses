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
<link href="./templates/CSS/cart.css" rel="stylesheet">
<link href="./templates/CSS/style.css" rel="stylesheet">
<link href="./templates/CSS/main.css" rel="stylesheet">
</head>
<%
int check = 0;
%>
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

								<li class="d-flex"><c:choose>
										<c:when test="${ not empty hocvien.manguoidung}">
											<div class="usermenu">
												<span>${hocvien.hoten}</span>
												<div class="icon_name">
													<span>${fn:substring(hocvien.hoten,0,1)}</span>
												</div>
												<div class="border_bottom"></div>
												<ul class="setting my_course">
													<div style="right: -20px; top: -10px;" class="pseudo_class"></div>
													<li class="setting__item"><a href="myprofiles"> <span>Hồ
																sơ cá nhân</span>
													</a></li>
													<li class="setting__item"><a href="myprofiles"> <span>Cần
																trợ giúp</span>
													</a></li>
													<li class="setting__item"><a href="myprofiles"> <span>Đổi
																mật khẩu</span>
													</a></li>
													<li class="setting__item"><a href="#"
														onclick="testConfirmDialog()"> <span>Đăng xuất</span>
													</a></li>
												</ul>
											</div>
										</c:when>
										<c:otherwise>
											<a href="login">Đăng Nhập</a>
										</c:otherwise>
									</c:choose></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</header>

		<section class="main">
			<div class="row">
				<nav class="col-2">
					<div class="sidebar sidebar_home">
						<div class="nav_drawer home_system">
							<a href="homepages"> <i class="fa-solid fa-house"></i> <span>Trang
									trủ hệ thống</span>
							</a>
						</div>
						<c:if test="${not empty hocvien.manguoidung}">
							<div class=" nav_drawer home">
								<a href="myhomepage"> <i class="fa-regular fa-clock"></i> <span>Khóa
										học của tôi</span>
								</a>
							</div>

						</c:if>

						<div class="nav_drawer calendar">
							<a href="#"> <i class="fa-solid fa-calendar-days"></i> <span>lịch</span>
							</a>
						</div>
						<div class="nav_drawer home_file">
							<a href="#"> <i class="fa-regular fa-file"></i> <span>Tập
									tin riêng tư</span>
							</a>
						</div>
						<c:if test="${not empty hocvien.manguoidung}">
						<div class="nav_drawer home_course">
							<a style="height: 46px;" href="#"> <i
								class="fa-solid fa-graduation-cap"></i> <span>Các khóa
									học của tôi</span>
							</a>
							<ul>
								<c:forEach var="khoahoctaikhoan"
									items="${requestScope.danhsachkhoahoc}">
									<li><a href="#"> <i class="fa-solid fa-graduation-cap"></i>
											<span>${khoahoctaikhoan.tenkhoahoc}</span>
									</a></li>
								</c:forEach>

							</ul>
						</div>
						</c:if>
					</div>
				</nav>

				<article class="col-10">
					<div class="page">
						<div class="branding">
							<div class="branding-inner">
								<a href="#" class="site-name"> <img class="site-logo"
									src="./templates/Images/logo.png" alt="UTEX-HCMUTE">
								</a>

								<ul class="main-nav">
									<li class="nav-item"><a href="#"> Online Course </a></li>
									<li class="nav-item"><a href="#"> Các khóa học </a></li>
									<li class="nav-item"><a href="#"> Vietnamese (vi) </a>
										<div class="border_bottom border_black"></div></li>
								</ul>
							</div>
						</div>

						<div class="container-fluid">
							<div class="page_content">
								<section class="region_main">
									<div class="region_item">
										<div class="card_body">
											<div class="card_history">
												<h5>Recently accessed courses</h5>
												<div class="show_detail">
													<a href="#" class="chevron-left"> <i
														class="fa-solid fa-chevron-left"></i>
													</a> <a href="#" class="chevron-right"> <i
														class="fa-solid fa-chevron-right"></i>
													</a>
												</div>
											</div>
											<div style="justify-content: center;" class="card_deck">
												<div class="card_text" tabindex="1">
													<div class="view_content">
														<div class="card_item">
															<a href="./course.html">
																<div class="card_img"></div>
															</a>
															<div class="course_info">
																<span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
															</div>
															<a href="#" class="course_name">An toan thong tin_
																Nhom 11</a>
														</div>
													</div>
												</div>
												<div class="card_text">
													<div class="view_content">
														<div class="card_item">
															<a href="describe.jsp">
																<div class="card_img"></div>
															</a>
															<div class="course_info">
																<span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
															</div>
															<a href="#" class="course_name">An toan thong tin_
																Nhom 11</a>
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>

									<div class="region_list">
										<div class="card_body">
											<div class="card_history">
												<h5>Recently accessed courses</h5>
											</div>
											<div class="card_setting">
												<div class="cb_all">
													<button style="margin-left: 15px;" class="btn btn_view">
														<i class="fa-solid fa-filter"></i> <span
															class="text-center">All (except removed from view)</span>
														<div style="border-top: 5px solid #6c757d;"
															class="border_bottom"></div>
													</button>
													<ul class="menu_list cb_all__list">
														<!-- <div ></div> -->
														<li class="menu_list_item"><a href="#">All
																(except removed from view)</a></li>
														<li class="menu_list_item"><a href="#">Starred</a></li>
														<li class="menu_list_item"><a href="#">Removed
																from view</a></li>
													</ul>

												</div>

												<div class="filter_access">
													<div class="cb_all">
														<button class="btn btn_view">
															<i class="fa-solid fa-arrow-down-short-wide"></i> <span
																class="text-center">Last accessed</span>
															<div style="border-top: 5px solid #6c757d;"
																class="border_bottom"></div>
														</button>

														<ul class="menu_list cb_all__list-two">
															<!-- <div ></div> -->
															<li class="menu_list_item"><a href="#">Course
																	name</a></li>
															<li class="menu_list_item"><a href="#">Last
																	accessed</a></li>
														</ul>
													</div>

													<div style="margin-right: 15px;" class="cb_all">
														<button class="btn btn_view">
															<i class="icon fa fa-th fa-fw "></i> <span
																class="text-center">Card</span>
															<div style="border-top: 5px solid #6c757d;"
																class="border_bottom"></div>
														</button>

														<ul class="menu_list cb_all__list-three">
															<!-- <div ></div> -->
															<li class="menu_list_item"><a href="#">Card</a></li>
															<li class="menu_list_item"><a href="#">List</a></li>
															<li class="menu_list_item"><a href="#">Summary</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="card_deck">
												<c:choose>
													<c:when test="${check eq 0}">
														<c:forEach var="khoahoc" items="${danhsachkhoahoc}">
															<div class="card_text card_group">
																<div class="view_content">
																	<div class="card_item">
																		<a href="describe?makhoahoc=${khoahoc.makhoahoc}">
																			<div class="card_img"></div>
																		</a>
																		<div class="course_info">
																			<span>${khoahoc.mota}</span>
																		</div>
																		<a href="describe?makhoahoc=${khoahoc.makhoahoc}"
																			class="course_name">${khoahoc.tenkhoahoc}</a>
																	</div>
																</div>
															</div>
														</c:forEach>
														<c:set var="check" value="${1}"></c:set>
													</c:when>
													<c:otherwise>
														<c:forEach var="khoahoc" items="${danhsachkh}">
															<div class="card_text card_group">
																<div class="view_content">
																	<div class="card_item">
																		<a href="describe?makhoahoc=${khoahoc.makhoahoc}">
																			<div class="card_img"></div>
																		</a>
																		<div class="course_info">
																			<span>${khoahoc.mota}</span>
																		</div>
																		<a href="describe?makhoahoc=${khoahoc.makhoahoc}"
																			class="course_name">${khoahoc.tenkhoahoc}</a>
																	</div>
																</div>
															</div>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</section>

								<section class="region_sidebar"></section>
							</div>
							<footer class="footer">
								<c:choose>
									<c:when test="${not empty hocvien.manguoidung}">
										<div class="footer_list">
											<div class="footer_nav">
												<p>Bạn đang đăng nhập với tên ,</p>
												<a href="#">${hocvien.hoten}</a>
											</div>
											<a href="introduct">Get the mobile app</a>
										</div>
										<div class="footer_info">Copyright Oncourse © 2023</div>
									</c:when>
									<c:otherwise>
										<div class="footer_list">
											<div class="footer_nav">
												<p class="p-thongbao">Bạn vẫn chưa đăng nhập</p>
												<a href="login">Đăng Nhập Tại Đây</a>
											</div>
											<a href="introduct">Get the mobile app</a>
										</div>
										<div class="footer_info">Copyright Oncourse © 2023</div>
									</c:otherwise>
								</c:choose>
							</footer>
						</div>
					</div>
				</article>
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