<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create course</title>
<link rel="stylesheet" href="./templates/CSS/create_course.css">
<link rel="stylesheet" href="./templates/bootstrap-5.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./templates/fontawesome-free-6.4.2-web/css/all.min.css" />
<script src="./templates/JavaScript/script.js"></script>
</head>
<body>
	<div id="app">
		<div class="form_create">
			<form action="post-lesson" method="post">
				<div class="form-list">
					<div class="form-item">
						<div class="form-item-login">
							<div class="form-login-header">
								<h1>TẠO BÀI HỌC</h1>
							</div>
							<div class="form-login-input">
								<label for="namelesson">Tên bài học:</label> <input type="text"
									id="namelesson" name="namelesson" placeholder="Tên bài học"
									value="${editbaihoc.tenbaihoc}" />
								<div style="width: 36%;">
									<label for="datelesson">Thời gian hoàn thành</label>
									<output id="Output" class="output">0</output>
									<input name="tghoanthanh" id="tghoanthanh" type="range" min="0"
										value="${editbaihoc.thoigianhoanthanh}" max="180" step="0.5"
										list="ticks" oninput="Output.value = tghoanthanh.value" />
								</div>
							</div>
							<div class="form-login-input">
								<label for="daura">Mục tiêu đầu ra</label> <input type="text"
									id="daura" name="daura" value="${editbaihoc.muctieudaura}" />
							</div>
							<div class="content">
								<h3>Nội dung bài học</h3>
								<textarea name="textarea" id="default"
									value="${editbaihoc.noidungbaihoc}"></textarea>
							</div>
							<button class="btn btn-primary" type="submit">Tạo bài
								học</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script
		src="./templates/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
	<script src="./templates/JavaScript/script.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			ReloadAlert("${warning}")
		}
	</script>
	<c:set var="warning" value="${null}"></c:set>
</body>
</html>