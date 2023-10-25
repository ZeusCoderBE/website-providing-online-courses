<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
														aria-valuenow="5" style="width: 5%" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
												<div class="small">
													<span class="sr-only">Course progress:</span> <strong>5</strong>%
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
						<li class="sidebar_link"><a href="homepage"
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
							<li class="list_item"><i class="fa-solid fa-check"></i> <span>Nắm
									chắc lý thuyết chung trong việc xây dựng web</span></li>
							<li class="list_item"><i class="fa-solid fa-check"></i> <span>Nắm
									chắc lý thuyết chung trong việc xây dựng web</span></li>
							<li class="list_item"><i class="fa-solid fa-check"></i> <span>Nắm
									chắc lý thuyết chung trong việc xây dựng web</span></li>
							<li class="list_item"><i class="fa-solid fa-check"></i> <span>Nắm
									chắc lý thuyết chung trong việc xây dựng web</span></li>
							<li class="list_item"><i class="fa-solid fa-check"></i> <span>Nắm
									chắc lý thuyết chung trong việc xây dựng web</span></li>
							<li class="list_item"><i class="fa-solid fa-check"></i> <span>Nắm
									chắc lý thuyết chung trong việc xây dựng web</span></li>
							<li class="list_item"><i class="fa-solid fa-check"></i> <span>Nắm
									chắc lý thuyết chung trong việc xây dựng web</span></li>
							<li class="list_item"><i class="fa-solid fa-check"></i> <span>Nắm
									chắc lý thuyết chung trong việc xây dựng web</span></li>

						</ul>


					</div>

					<div class="course__content">
						<h3> Ngôn Ngữ :${khoahoc.ngonngu}</h3>
					</div>

				</div>

				<div class="info">
					<div class="course_action">
						<div class="course_info">
							<h3>Course</h3>
							<div class="course_des course_des__main">
							Giá Tiền: ${khoahoc.giatien}$</div>
							<div class="road_line"></div>

							<div class="evaluate">
								<span>${khoahoc.danhgia}</span> <i class="fa-solid fa-star"></i> <span>(1.040
									reviews)</span>
								<div class="line_stand"></div>
								<i class="fa-solid fa-thumbs-up"></i> <span>92%</span>
							</div>

							<h5>Ngày Phát Hành: ${khoahoc.ngayphathanh}</h5>
							<div class="course_des">No previous experience necessary</div>

							<h5>Thời Gian Hoàn Thành: ${khoahoc.thoigian}</h5>

							<div class="road_line"></div>
							<a class="view_course" href="#">View course modules</a>
						</div>
						<button class="btn btn-success btn_signin__course">Đăng
							ký học</button>
						<button class="btn btn-success btn_signin__course">Thêm Vào Giỏ Hàng</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>
</html>