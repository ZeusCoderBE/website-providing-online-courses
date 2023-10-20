<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./templates/CSS/styledn.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<<<<<<< HEAD
=======
    <%String loidangnhap=request.getAttribute("thongbaoloi") +"";
	loidangnhap=(loidangnhap.equals("null"))?"":loidangnhap;%>
>>>>>>> 54463c1ba80401c925cb9a123a3c306d7e1c4f59
</head>
<body>
    <div class="container">
        <div id="form-login">
<<<<<<< HEAD
            <form action="#" method="get">
=======
            <form action="dang-nhap" method="post">
>>>>>>> 54463c1ba80401c925cb9a123a3c306d7e1c4f59
                <div class="form-list">
                    <div class="form-item">
                        <div class="form-item-login">
                            <div class="form-login-header"><h1>Login</h1></div>
                            <div class="form-login-input">
<<<<<<< HEAD
                                <input type="text" placeholder="Email"/>
                            </div>
                            <div class="form-login-input">
                                <input type="password" placeholder="Password"/>
=======
                                <input type="text" placeholder="Email" id="username" name="username"/>
                            </div>
                            <div class="form-login-input">
                                <input type="password" placeholder="Password" id="password" name="password"/>
>>>>>>> 54463c1ba80401c925cb9a123a3c306d7e1c4f59
                            </div>
                            <div class="form-notice">
                                <a href="#">Forgot Password?</a>
                            </div>
<<<<<<< HEAD
=======
                            <p><%=loidangnhap %></p>
>>>>>>> 54463c1ba80401c925cb9a123a3c306d7e1c4f59
                            <button class="btn" type="submit">Login</button>
                            <div class="form-login-policy">
                                <p>Don't have an account? </p>
                                <a href="#">Signup</a>
                            </div>
                            <div class="form-login-or">
                                <h1>
                                    <span>Or</span>
                                </h1>
                            </div>
                            <div class="header_login-nav">
                                <a href="#">
                                    <i class="fa-brands fa-facebook-f"></i>
                                    <div class="header_login-info">
                                        <span>Login with FaceBook</span>
                                    </div>
                                </a>
                            </div>
<<<<<<< HEAD

=======
>>>>>>> 54463c1ba80401c925cb9a123a3c306d7e1c4f59
                            <div class="header_login-nav logo_google">
                                <a href="#">
                                    <i class="fa-brands fa-google"></i>
                                    <div class="header_login-info">
                                        <span>Login with Google</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>