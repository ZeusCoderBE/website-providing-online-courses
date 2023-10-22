<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@ page import="vn.iotstar.model.Student" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <h3 class="text-center text-secondary mt-5 mb-3">Chỉnh sửa thông tin</h3>
            <c:set var="student" value="${findStudent}"/>
            <form action = "/006_JSP/UpdateStudentServlet" method = "post" class="border rounded w-100 mb-5 mx-auto px-3 pt-3 bg-light">
            	<div class="form-group">
                    <label for="mssv">Mã sinh viên</label>
                    <input id="mssv" name = "mssv" type="text" class="form-control" placeholder="mã sinh viên" value="${student.getMssv()}">
                </div>
                <div class="form-group">
                    <label for="fullname">Họ và tên</label>
                    <input id="fullname" name = "fullname" type="text" class="form-control" placeholder="họ và tên" value="${student.getName()}">
                </div>
                <div class="form-group">
                    <label for="diachi">Địa chỉ</label>
                    <input id="diachi" name = "diachi" type="text" class="form-control" placeholder="địa chỉ" value="${student.getDiachi()}">
                </div>
                <div class="form-group">
                    <button class="btn btn-success px-5">Cập nhật</button>
                </div>
                <div class="form-group">
                    <p>Forgot password? <a href="#">Click here</a></p>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>