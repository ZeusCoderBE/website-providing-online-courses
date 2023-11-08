<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
                    <button style="border :none;" class="btn btn-toggle">
                        <span class="fa-solid fa-bars"></span>
                    </button>
                </div>

                <div class="flex-wrapper">
                    <div class="intro">
                        <div class="intro_item">
                            <a href="#" class="intro_toggle">
                                <span>
                                    <img src="https://utex.hcmute.edu.vn/theme/image.php/maker/theme/1692144561/grid-icon-inverse" alt="#">
                                </span>
    
                                <span>
                                    <div class="intro-text">Hướng dẫn (dành cho Giảng viên)</div>
                                    <div class="border_bottom"></div>
                                </span>
                            </a>
                            <ul class="menu_list">
                                <!-- <div ></div> -->
                                <li class="menu_list_item">
                                    <a href="#">Hướng dẫn Backup và Restore khóa học</a>
                                </li>
                                <li class="menu_list_item">
                                    <a href="#">Hướng dẫn Backup và Restore khóa học</a>
                                </li>
                                <li class="menu_list_item">
                                    <a href="#">Hướng dẫn Backup và Restore khóa học</a>
                                </li>
                                <li class="menu_list_item">
                                    <a href="#">Hướng dẫn Backup và Restore khóa học</a>
                                </li>
                            </ul>
                        </div>
                        <ul class="social-media-list list-inline">
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa-solid fa-earth-americas"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa-brands fa-facebook-f"></i>
                                </a>
                            </li>
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
                                             <div style="right: -20px; top:-10px;"  class="pseudo_class"></div>
                                             <li class="setting__item">
                                                <a href="#">
                                                    <span>Hồ sơ cá nhân</span>
                                                </a>
                                            </li>
                                             <li class="setting__item">
                                                <a href="#">
                                                    <span>Chứng chỉ</span>
                                                </a>
                                            </li>
                                             <li class="setting__item">
                                                <a href="#">
                                                    <span>Cần trợ giúp</span>
                                                </a>
                                            </li>
                                             <li class="setting__item">
                                                <a href="#">
                                                    <span>Đổi mật khẩu</span>
                                                </a>
                                            </li>
                                             <li class="setting__item">
                                                <a href="#">
                                                    <span>Đăng xuất</span>
                                                </a>
                                            </li>
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
                                <img class="site-logo" src="./templates/Images/logo.png" alt="UTEX-HCMUTE">
                            </a>
                        </div>
    
                        <div class="nav_drawer home_system">
                            <div>React Basic</div>
                        </div>
                        <div class="nav_drawer calendar nav_drawer__course">
                            <button class="btn btn_course">
                                    <i class="fa-solid fa-chevron-down"></i>
                                    <div style="margin:0;" class="btn_course__content">Course Material</div>
                            </button>

                            <ul class="list_timer">
                                <li>
                                    <a href="#">
                                        <span>Week1</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span>Week2</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span>Week3</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span>Week4</span>
                                    </a>
                                </li>
                            </ul>
                            
                        </div>
                        <!-- <div class="nav_drawer home_file">
                            <a href="#">
                                <i class="fa-solid fa-calendar-days"></i>
                                <span>lịch</span>
                            </a>
                        </div> -->
                        <div class="nav_drawer home_file">
                            <a href="#">
                                <i class="fa-regular fa-file"></i>
                                <span>Grades</span>
                            </a>
                        </div>
                        <div class="nav_drawer home_file">
                            <a href="createlesson">
                                <i class="fa-regular fa-file"></i>
                                <span>Create Lesson</span>
                            </a>
                        </div>
                        <div class="nav_drawer home_file">
                            <a href="upload.html">
                                <i class="fa-regular fa-file"></i>
                                <span>Discussion Forums</span>
                            </a>
                        </div>
                        <div class="nav_drawer home_file">
                            <a href="#">
                                <i class="fa-regular fa-file"></i>
                                <span>Messages</span>
                            </a>
                        </div>
                        <div class="nav_drawer home_file">
                            <a href="#">
                                <i class="fa-regular fa-file"></i>
                                <span>Resourses</span>
                            </a>
                        </div>
                       
                    </div>
                    
                </nav>
    
                <article class="col-10">
                    <div class="page_study">
                        <div class="branding-inner">
                            <div class="course_name">SSRF là gì? Cách phát hiện và ngăn chặn tấn công yêu cầu giả mạo từ phía máy chủ</div>
                            <div class="date_course">
                                <span>Đã đăng vào :</span>
                                <span> thg 11 29, 2018 3:12</span>
                            </div>
                        </div>

                        <div class="content">
                            <div class="content_text">
                                <div class="content_item">
                                    <div class="content_header">
                                        <div>Nội dung bài học</div>
                                        <div class="content_progress">
                                            <i class="fa-solid fa-check"></i>
                                            <span>Complete</span>
                                        </div>
                                    </div>
                                    <div class="content_main">
                                        <div class="container_content">${content}</div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </article>
            </div>
        </section>
  
        <footer class="footer">

        </footer>
    </div>
	<script src="./templates/JavaScript/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>