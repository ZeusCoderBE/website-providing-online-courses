<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="./templates/CSS/style.css" rel="stylesheet">
	<link href="./templates/CSS/main.css" rel="stylesheet">
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
                        <a href="#" class="intro_toggle">
                            <span>
                                <img src="https://utex.hcmute.edu.vn/theme/image.php/maker/theme/1692144561/grid-icon-inverse" alt="#">
                            </span>

                            <span>
                                <div class="intro-text">Hướng dẫn (dành cho Giảng viên)</div>
                                <div class="border_bottom"></div>
                            
                            </span>
                        </a>
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
                                    <div class="usermenu">
                                        <span>Tran Van Luan</span>
                                        <div class="icon_name">
                                            <span>T</span>
                                        </div>
                                        <div class="border_bottom"></div>
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
                    <div class="nav_drawer-primary nav_drawer home">
                        <a href="#">
                            <i class="fa-regular fa-clock"></i>
                            <span>Nhà của tôi</span>
                        </a>
                    </div>

                    <div class="nav_drawer home_system">
                        <a href="#">
                            <i class="fa-solid fa-house"></i>
                            <span>Trang trủ hệ thống</span>
                        </a>
                    </div>
                    <div class="nav_drawer calendar">
                        <a href="#">
                            <i class="fa-solid fa-calendar-days"></i>
                            <span>lịch</span>
                        </a>
                    </div>
                    <div class="nav_drawer home_file">
                        <a href="#">
                            <i class="fa-regular fa-file"></i>
                            <span>Tập tin riêng tư</span>
                        </a>
                    </div>
                    <div class="nav_drawer home_course">
                        <a href="#">
                            <i class="fa-solid fa-graduation-cap"></i>
                            <span>Các khóa học của tôi</span>
                            
                        </a>
                        <ul>
                            <li>
                                <a href="#">
                                    <i class="fa-solid fa-graduation-cap"></i>
                                    <span>SHDK_23_24_01</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa-solid fa-graduation-cap"></i>
                                    <span>SHDK_23_24_01</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                </nav>
    
                <article class="col-10">
                    <div class="page">
                        <div class="branding">
                            <div class="branding-inner">
                                <a href="#" class="site-name">
                                    <img class="site-logo" src="./templates/Images/logo.png" alt="UTEX-HCMUTE">
                                </a>

                                <ul class="main-nav">
                                    <li class="nav-item">
                                        <a href="#">
                                            Đại học Sư Phạm Kỹ Thuật 
                                        </a>
                                    </li >
                                    <li class="nav-item">
                                        <a href="#">
                                            Các khóa học
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#">
                                            Vietnamese (vi)
                                        </a>
                                        <div class="border_bottom border_black"></div>
                                    </li>
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
                                                    <a href="#" class="chevron-left">
                                                        <i class="fa-solid fa-chevron-left"></i>
                                                    </a>
                                                    <a href="#" class="chevron-right">
                                                        <i class="fa-solid fa-chevron-right"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <div style="justify-content: center;" class="card_deck">
                                                <div class="card_text">
                                                    <div class="view_content">
                                                        <div class="card_item">
                                                            <a href="#">
                                                                <div class="card_img"></div>
                                                            </a>
                                                            <div class="course_info">
                                                                <span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
                                                            </div>
                                                            <a href="#" class="course_name">An toan thong tin_ Nhom 11</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card_text">
                                                    <div class="view_content">
                                                        <div class="card_item">
                                                            <a href="#">
                                                                <div class="card_img"></div>
                                                            </a>
                                                            <div class="course_info">
                                                                <span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
                                                            </div>
                                                            <a href="#" class="course_name">An toan thong tin_ Nhom 11</a>
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
                                                        <i class="fa-solid fa-filter"></i>
                                                        <span class="text-center">All (except removed from view)</span>
                                                        <div style="border-top: 5px solid #6c757d;" class="border_bottom"></div>
                                                    </button>
                                                </div>

                                                <div class="filter_access">
                                                    <div class="cb_all">
                                                        <button class="btn btn_view">
                                                            <i class="fa-solid fa-arrow-down-short-wide"></i>
                                                            <span class="text-center">Last accessed</span>
                                                            <div style="border-top: 5px solid #6c757d;" class="border_bottom"></div>
                                                        </button>
                                                    </div>

                                                    <div style="margin-right: 15px;" class="cb_all">
                                                        <button class="btn btn_view">
                                                            <i class="icon fa fa-th fa-fw "></i>
                                                            <span class="text-center">Card</span>
                                                            <div style="border-top: 5px solid #6c757d;" class="border_bottom"></div>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card_deck">
                                                <div class="card_text card_group">
                                                    <div class="view_content">
                                                        <div class="card_item">
                                                            <a href="#">
                                                                <div class="card_img"></div>
                                                            </a>
                                                            <div class="course_info">
                                                                <span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
                                                            </div>
                                                            <a href="#" class="course_name">An toan thong tin_ Nhom 11</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card_text card_group">
                                                    <div class="view_content">
                                                        <div class="card_item">
                                                            <a href="#">
                                                                <div class="card_img"></div>
                                                            </a>
                                                            <div class="course_info">
                                                                <span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
                                                            </div>
                                                            <a href="#" class="course_name">An toan thong tin_ Nhom 11</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card_text card_group">
                                                    <div class="view_content">
                                                        <div class="card_item">
                                                            <a href="#">
                                                                <div class="card_img"></div>
                                                            </a>
                                                            <div class="course_info">
                                                                <span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
                                                            </div>
                                                            <a href="#" class="course_name">An toan thong tin_ Nhom 11</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card_text card_group">
                                                    <div class="view_content">
                                                        <div class="card_item">
                                                            <a href="#">
                                                                <div class="card_img"></div>
                                                            </a>
                                                            <div class="course_info">
                                                                <span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
                                                            </div>
                                                            <a href="#" class="course_name">An toan thong tin_ Nhom 11</a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card_text card_group">
                                                    <div class="view_content">
                                                        <div class="card_item">
                                                            <a href="#">
                                                                <div class="card_img"></div>
                                                            </a>
                                                            <div class="course_info">
                                                                <span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
                                                            </div>
                                                            <a href="#" class="course_name">An toan thong tin_ Nhom 11</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card_text card_group">
                                                    <div class="view_content">
                                                        <div class="card_item">
                                                            <a href="#">
                                                                <div class="card_img"></div>
                                                            </a>
                                                            <div class="course_info">
                                                                <span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
                                                            </div>
                                                            <a href="#" class="course_name">An toan thong tin_ Nhom 11</a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card_text card_group">
                                                    <div class="view_content">
                                                        <div class="card_item">
                                                            <a href="#">
                                                                <div class="card_img"></div>
                                                            </a>
                                                            <div class="course_info">
                                                                <span>HK1 NĂM HỌC 2023-2024 - HỆ ĐẠI TRÀ</span>
                                                            </div>
                                                            <a href="#" class="course_name">An toan thong tin_ Nhom 11</a>
                                                        </div>
                                                    </div>
                                                </div>

                                                
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                
                                <section class="region_sidebar"></section>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </section>
  
        <footer class="footer">

        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>