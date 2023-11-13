<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Document</title>
<script src="./templates/JavaScript/script.js"></script>
</head>
<body>
	<form action="post-document" enctype="multipart/form-data" method="post">
		<label id="theloai">Thể loại</label> <input type="text" name="theloai"><br />
		<label id="dinhdang">Định dạng lưu trữ:</label> <input type="text"
			name="dinhdang"><br /> <label id="user-file">Tài
			liệu:</label> <input type="file" name="user-file"> <br /> <input
			type="submit" value="Upload File">
	</form>


<script>
		window.onload = function() {
			ReloadAlert("${uptailieu}");
		}
	</script>
	<c:set var="uptailieu" value="${null}"></c:set>
</body>
</html>