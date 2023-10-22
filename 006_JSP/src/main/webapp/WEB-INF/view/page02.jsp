<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./templates/CSS/style_page02.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <%-- <style><%@include file="./templates/CSS/style_page02.css"%></style> --%>
</head>
<body>
	<br/>
	<%@ page import="java.util.List" %>
	<%@ page import="vn.iotstar.model.Student" %>
	<%@ page import="jakarta.servlet.http.HttpSession" %>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	
	<div class="container">
		<h1 class="main-heading">Danh sách sinh viên</h1>
	    <table class="student-table">
	        <tr>
	            <th>MSSV</th>
	            <th>Họ và Tên</th>
	            <th>Địa chỉ</th>
	            <th id="function-col">Chỉnh sửa</th>
	        </tr>
	        <c:forEach var="student" items="${listStudent}">
	            <tr>
	                <td><c:out value="${student.mssv}" /></td>
	                <td><c:out value="${student.name}" /></td>
	                <td><c:out value="${student.diachi}" /></td>
	                <td class="cell">
	                	<a class="edit-button" href="UpdateStudentServlet?mssv=${student.mssv}">Edit</a>
	                	<a class="delete-button" onclick="confirmDelete(${student.mssv})">Delete</a>
	                </td>
	             </tr>
	        </c:forEach>
	    </table>
	    <div class="action-buttons">
	    	<form action="${pageContext.request.contextPath}/InsertStudent">
	    		<button class="add-button">Đăng ký</button>
	    	</form>
	    </div>
	    <% String message = (String) session.getAttribute("messageResp"); %>
	            <% if (message != null) { %>
	            <div class="alert alert-info text-center"><%= message %></div>
	    <% } %>
	</div>
	<script type="text/javascript">
		function confirmDelete(mssv) {
			var result = confirm("Bạn chắc là muốn xóa sinh viên này ?");
			if (result) {
				window.location.href = "DeleteStudent?mssv=" + mssv;
			}
			else {
				return false;
			}
		}
	</script>
</body>
</html>