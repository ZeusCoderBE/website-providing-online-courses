<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create course</title>
<link rel="stylesheet" href="./templates/CSS/create_course.css">
<link rel="stylesheet"
	href="./templates/bootstrap-5.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./templates/fontawesome-free-6.4.2-web/css/all.min.css" />
<script src="./templates/JavaScript/script.js"></script>
</head>
<body>
	<div id="app">
		<div class="form_create">
			<form action="Post-Course" method="post"
				enctype="multipart/form-data" onsubmit="return checkKhoaHoc()">
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
									type="text" id="theloai" name="theloai" placeholder="Thể loại"
									required value="${findkhoahoc.theloai}" />
							</div>
							<div class="form-login-input">
								<label for="price">Gia tiền:</label>
								<fmt:formatNumber var="giatien" value="${findkhoahoc.giatien}"
									type="number" maxFractionDigits="3" />
								<input type="text" id="giatien" name="giatien"
									placeholder="vd: $9999" required
									value="${giatien.replace(',','.')}" />
							</div>
							<div class="form-login-input">
								<label for="gv">Trình độ </label> <input type="text"
									id="trinhdodauvao" name="trinhdodauvao"
									placeholder="vd :Cơ Bản" required
									value="${findkhoahoc.trinhdodauvao}" /> <label for="upload">Upload
									file</label> <input type="file" class="form-control" id="upload"
									name="minhhoa" required />
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
							<c:choose>
								<c:when test="${not empty findkhoahoc }">
									<button class="btn btn-primary" type="submit">Sửa khóa
										học</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-primary" type="submit">Tạo khoá
										học</button>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="./templates/tinymce/tinymce.min.js"
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