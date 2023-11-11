<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script src="./templates/JavaScript/script.js"></script>
</head>
<body>
	<div id="app">
		<div class="form_create">
			<c:choose>
				<c:when test="${not empty findkhoahoc }">
					<form action="Edit-Course" method="post"
						onsubmit="return checkKhoaHoc()">
						<div class="form-list">
							<div class="form-item">
								<div class="form-item-login">
									<div class="form-login-header">
										<h1>COURSE</h1>
									</div>

									<div class="form-login-input">
										<label for="name_course">Tên khóa học:</label> <input
											type="text" id="tenkhoahoc" name="tenkhoahoc"
											value="${findkhoahoc.tenkhoahoc}" placeholder="Tên Khóa học"
											required /> <label for="makh">Thể lọai</label> <input
											type="text" id="theloai" name="theloai"
											placeholder="Thể loại" required
											value="${findkhoahoc.theloai}" />
									</div>
									<div class="form-login-input">
										<label for="gv">Mã Tác Giả</label> <input type="text"
											id="matacgia" name="matacgia" placeholder="vd: 4" required
											value="${findkhoahoc.matacgia}" /> <label for="price">Gia
											tiền:</label>
										<fmt:formatNumber var="giatien" value="${findkhoahoc.giatien}"
											type="number" maxFractionDigits="3" />
										<input type="text" id="giatien" name="giatien"
											placeholder="vd: $9999" required value="${giatien}" />
									</div>
									<div class="form-login-input">
										<label for="gv">Trình độ </label> <input type="text"
											id="trinhdodauvao" name="trinhdodauvao"
											placeholder="vd :Cơ Bản" required
											value="${findkhoahoc.trinhdodauvao}" /> 
											<label for="upload">Upload file</label> 
											<input type="file" class="form-control" id="upload"/>
							    
									</div>
									<div class="form-login-input">
										<label for="makh">Ngôn ngữ</label> <input type="text"
											id="ngonngu" name="ngonngu" placeholder="vd: C#" required
											value="${findkhoahoc.ngonngu}" /> <label for="gv">Thời
											lượng</label> <input type="text" id="thoiluong" name="thoiluong"
											placeholder="vd: 1:00:00" required
											value="${findkhoahoc.thoigian}" />
									</div>
									<div class="form-login-input">
										<label for="makh">Lĩnh Vực</label> <input type="text"
											id="linhvuc" name="linhvuc" placeholder="Lĩnh vực"
											value="${findkhoahoc.linhvuc}" /> <label for="gv">Ngày
											phát hành</label> <input type="date" id="ngayphathanh"
											name="ngayphathanh" placeholder="vd: 1:00:00" required
											value="${findkhoahoc.ngayphathanh}" />
									</div>
									<div class="content">
										<h3>Mô tả khóa học</h3>
										<textarea name="textarea" id="default">${findkhoahoc.mota}</textarea>
									</div>
									<button class="btn btn-primary" type="submit">Sửa khóa
										học</button>
								</div>
							</div>
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<form action="Create-Course" method="post"
						onsubmit="return checkKhoaHoc()">
						<div class="form-list">
							<div class="form-item">
								<div class="form-item-login">
									<div class="form-login-header">
										<h1>COURSE</h1>
									</div>

									<div class="form-login-input">
										<label for="name_course">Tên khóa học:</label> <input
											type="text" id="tenkhoahoc" name="tenkhoahoc"
											placeholder="Tên Khóa học" required /> <label for="makh">Thể
											lọai</label> <input type="text" id="theloai" name="theloai"
											placeholder="Thể loại" required />
									</div>
									<div class="form-login-input">
										<label for="gv">Mã Tác Giả</label> <input type="text"
											id="matacgia" name="matacgia" placeholder="vd: 4" required />
										<label for="price">Gia tiền:</label> <input type="text"
											id="giatien" name="giatien" placeholder="vd: $9999" required />
									</div>
									<div class="form-login-input">
										<label for="gv">Trình độ </label> <input type="text"
											id="trinhdodauvao" name="trinhdodauvao"
											placeholder="vd :thạc sĩ" required /> 
											<label for="upload">Upload
											file</label> 
											<input type="file" class="form-control"
											id="upload" />
									</div>
									<div class="form-login-input">
										<label for="makh">Ngôn ngữ</label> <input type="text"
											id="ngonngu" name="ngonngu" placeholder="vd: C#" required />
										<label for="gv">Thời lượng</label> <input type="text"
											id="thoiluong" name="thoiluong" placeholder="vd: 1:00:00"
											required />
									</div>
									<div class="form-login-input">
										<label for="makh">Lĩnh Vực</label> <input type="text"
											id="linhvuc" name="linhvuc" placeholder="Lĩnh vực" /> <label
											for="gv">Ngày phát hành</label> <input type="date"
											id="ngayphathanh" name="ngayphathanh"
											placeholder="vd: 1-1-2021" required />
									</div>

									<div class="content">
										<h3>Mô tả khóa học</h3>
										<textarea name="textarea" id="default"></textarea>
									</div>
									<button class="btn btn-primary" type="submit">Tạo khóa
										học</button>
								</div>
							</div>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script
		src="https://cdn.tiny.cloud/1/yjs36lnwbew65fjemjpjuu6cjayfnprmaybt1rl1rmo6jx5e/tinymce/6/tinymce.min.js"
		referrerpolicy="origin"></script>
	<script src="./templates/JavaScript/script.js"></script>
	<script>
		window.onload = function() {
			ReloadAlert("${thongbaotaokh}");
		}
	</script>
	<c:set var="thongbaotaokh" value="${null}"></c:set>
</body>
</html>