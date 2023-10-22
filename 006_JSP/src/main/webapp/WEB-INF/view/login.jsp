<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <h3 class="text-center text-secondary mt-5 mb-3">Đăng nhập</h3>
            <form action = "CheckAccountServlet" method = "post" class="border rounded w-100 mb-5 mx-auto px-3 pt-3 bg-light">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input id="username" name = "username" type="text" class="form-control" placeholder="username">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" name = "password" type="text" class="form-control" placeholder="password">
                </div>
                <div class="form-group">
                    <button class="btn btn-success px-5">Đăng nhập</button>
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