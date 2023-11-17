<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Document</title>
<link rel="stylesheet" href="./templates/CSS/create_course.css">
<link rel="stylesheet" href="./templates/bootstrap-5.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./templates/fontawesome-free-6.4.2-web/css/all.min.css" />
<script src="./templates/JavaScript/script.js"></script>
</head>
<body>

	<div id="app">
		<div class="form_create">
			<form action="post-document" enctype="multipart/form-data"
				method="post">
				<div class="form-list">
					<div class="form-item">
						<div class="form-item-login">
							<div class="form-login-header">
								<h1>Document</h1>
							</div>
							<div class="form-login-input">
								<label id="theloai">Thể loại</label> <input type="text"
									name="theloai" value="${tailieu.theloai}"><br /> <label
									id="dinhdang">Định dạng lưu trữ:</label> <input type="text"
									name="dinhdang" value="${tailieu.dinhdangluutru}">
							</div>
							<div class="form-login-input">
								<label id="user-file">Tài liệu:</label> <input type="file"
									name="user-file"> <br />
							</div>
							<div class="form-login-input">
								<c:choose>
									<c:when test="${empty tailieu}">
										<button class="btn btn-primary" type="submit">Upload</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-primary" type="submit">Edit</button>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script
		src="./templates/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
</body>
</html>