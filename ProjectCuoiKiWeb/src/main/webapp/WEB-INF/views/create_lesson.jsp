<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create course</title>
<link rel="stylesheet" href="./templates/CSS/create_course.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div id="app">
		<div class="form_create">
			<form action="createlesson" method="post">
				<div class="form-list">
					<div class="form-item">
						<div class="form-item-login">
							<div class="form-login-header">
								<h1>TẠO BÀI HỌC</h1>
							</div>

							<div class="form-login-input">
								<label for="namelesson">Tên bài học:</label> <input type="text"
									id="namelesson" name="namelesson" placeholder="Tên bài học" />
								<label for="datelesson">Thời gian hoàn thành</label> <input
									type="date" id="datelesson" name="datelesson"
									placeholder="vd: 1:00:00" />
							</div>
							<div class="form-login-input">
								<label for="trinhdo">Mục tiêu đầu ra</label> <input type="text"
									id="trinhdo" name="trinhdo" />
							</div>
							<div class="content">
								<h3>Nội dung bài học</h3>
								<form action="" method="post">
									<textarea name="textarea" id="default">
									</textarea>
								</form>
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
		src="https://cdn.tiny.cloud/1/yjs36lnwbew65fjemjpjuu6cjayfnprmaybt1rl1rmo6jx5e/tinymce/6/tinymce.min.js"
		referrerpolicy="origin"></script>
	<script src="./templates/JavaScript/script.js"></script>
</body>
</html>