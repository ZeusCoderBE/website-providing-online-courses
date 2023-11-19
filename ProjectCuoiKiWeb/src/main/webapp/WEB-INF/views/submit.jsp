<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="./templates/CSS/submitprac.css" type="text/css"
	rel="stylesheet">

<head>
<meta charset="UTF-8">
<title>Nop bai tap</title>
</head>
<body>
	<form id="upload-form" enctype="multipart/form-data"
		action="fileupload-exercise" method="post">
		<div id="drop-area">
			<h1>Kéo và Thả File</h1>
			<p>Thả file vào đây hoặc nhấn vào để chọn file.</p>
			<input type="file" id="file-input" name="file" />
			<ul id="file-list"></ul>
			<input type="submit" id="submit-button" value="Submit"
				onclick="uploadFile()" />
		</div>
	</form>
</body>
</html>