<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Delete Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <h3 class="text-center text-secondary mt-5 mb-3">Xóa sinh viên</h3>
            <form action = "/006_JSP/DeleteStudent" method = "post" class="border rounded w-100 mb-5 mx-auto px-3 pt-3 bg-light">
                <div class="form-group">
                    <label for="fullname">Họ và tên</label>
                    <input id="fullname" name = "fullname" type="text" class="form-control" placeholder="họ và tên">
                </div>
                <div class="form-group">
                    <label for="mssv">Mã sinh viên</label>
                    <input id="mssv" name = "mssv" type="text" class="form-control" placeholder="mã sinh viên">
                </div>
                <div class="form-group">
                    <button class="btn btn-success px-5">Xóa sinh viên</button>
                </div>
                <div class="form-group">
                    <p>Forgot password? <a href="#">Click here</a></p>
                </div>
            </form>
            <% String message = (String) request.getAttribute("message"); %>
            <% if (message != null) { %>
            <div class="alert alert-info text-center"><%= message %></div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>