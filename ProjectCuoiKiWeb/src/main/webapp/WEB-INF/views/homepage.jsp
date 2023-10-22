<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./templates/CSS/main.css">
	<link rel="stylesheet" type="text/css" href="./templates/CSS/style.css">
</head>
<body>
    <div id="page_container">
        <header style="position: fixed; width: 100%; z-index: 100;">
            <nav class="navbar navbar-expand-lg">
                <div style="margin-top: 0; height: 100%;" class="container-fluid">
                  <a class="navbar-brand" href="#">
                    OnCourse
                  </a>
                  <div style="height: 100%;" class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul style="height: 100%;" class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">Giới thiệu</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="./index.html">Khóa học</a>
                      </li>
                      
                      <li class="nav-item">
                        <a class="nav-link" href="#">Hỏi đáp</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Bài viết</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Tài trợ</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Liên hệ</a>
                      </li>
                      
                    </ul>
                    <form class="d-flex" role="search">
                      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <div class="utilities">
                        <div class="utilities-inner">
                            <ul class="d-flex usernav p-0 ml-2 mb-0 align-items-center">
                                <li style="margin-left: 0;" class="d-flex">
                                    <div class="usermenu">
                                        <span>Tài Khoản</span>
                                        <div style="width: 25px;" class="icon_name">
                                            <span>
                                                <i class="fa-solid fa-user"></i>
                                            </span>
                                        </div>
                                        <div class="border_bottom"></div>
                                    </div>
                                    <button onclick="goToNewPage()" class="btn btn-success login_taikhoan">Đăng Nhập</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                  </div>
                </div>
              </nav>
        </header>

        <div class="main_container">
            <div class="content">
                <h1>Thư viện khóa học lập trình từ cơ bản đến nâng cao</h1>
                <p>Python ? C++? C# hay Java? </p>
                <p>Bạn lựa chọn ngôn ngữ nào để bắt đầu chặng đường trở thành lập trình viên của mình?</p>
                <a href="#">Học Ngay</a>
                <img src="https://www.pluralsight.com/content/dam/pluralsight2/homepage/2023-updates/ai-home-hero.webp" alt="">
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
    <script src="./templates/JavaScript/script.js">
  </script>
</body>
</html>