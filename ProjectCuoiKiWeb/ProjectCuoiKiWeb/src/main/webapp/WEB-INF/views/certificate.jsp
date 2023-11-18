<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="./templates/fontawesome-free-6.4.2-web/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="./templates/CSS/certificate.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.8.0/html2pdf.bundle.min.js"
	integrity="sha512-w3u9q/DeneCSwUDjhiMNibTRh/1i/gScBVp2imNVAMCt6cUHIw6xzhzcPFIaL3Q1EbI2l+nu17q2aLJJLo4ZYg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<div id="app">
		<div class="certificate">
			<i class="fa-regular fa-square"></i> <i class="fa-regular fa-square"></i>
			<i class="fa-regular fa-square"></i> <i class="fa-regular fa-square"></i>
			<div class="content">
				<div class="header">
					<img src="./templates/Images/logo.png" width="120" height="120"
						alt="logo">
					<h1>OnCourse</h1>
				</div>
				<div class="info">
					<span class="date_complete">Sep 15, 2023</span>
					<h4>${tenhocvien.hoten}</h4>
					<span>has success completed</span>
					<h6>${khoahoc.tenkhoahoc}</h6>
					<span>an online none-credit course authorized by Oncourse
						and offered throungh OnCourse</span>
				</div>

				<div class="header_footer">
					<img src="./templates/Images/logo.png" width="100" height="100"
						alt="logo">
					<h1>OnCourse</h1>
				</div>

				<div class="logo_certificate">
					<h5>
						ONCOURSE <br> CERTIFICATE
					</h5>
					<div class="site-img">
						<img src="./templates/Images/certificate.png" width="240"
							height="240" alt="certificate">
					</div>
				</div>
				<div class="footer">
					<span>Verify at:</span> <a href="#">http://oncourse/verify/ABC</a>
					<span>Oncourse has confirm the identity of this individual
						and their participation in the course</span>
				</div>

			</div>
		</div>
	</div>
	<button class="btn">Lấy chứng chỉ</button>

	<script>
        let div = document.querySelector("#app");
        let btn = document.querySelector(".btn");
        btn.addEventListener('click', () => {
            html2pdf(div).save('Certificate.pdf');
        });
    </script>
</body>
</html>