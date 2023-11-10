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
										<p>
											<strong><img
												src="https://hcmute.edu.vn/Resources/Images/SubDomain/pmo/UTE%20tren%20cong%20bao/Nam%202018/SPKT/1513489129-trao-giai-eureka--1-.jpg"></strong>
										</p>  <p>Tru?c d&oacute;, v&agrave;o ng&agrave;y 29.5.2006, Th? tu?ng Ch&iacute;nh ph? d&atilde; ban h&agrave;nh Quy?t d?nh s? 122, d?ng &yacute; chuy?n d?i 19 tru?ng ÐH d&acirc;n l?p sang lo?i h&igrave;nh tru?ng ÐH tu th?c, giao B? tru?ng B? GD-ÐT ch? tr&igrave;, ph?i h?p v?i c&aacute;c b? ng&agrave;nh li&ecirc;n quan ban h&agrave;nh c&aacute;c quy d?nh hu?ng d?n vi?c chuy?n c&aacute;c tru?ng ÐH d&acirc;n l?p sang lo?i h&igrave;nh tru?ng ÐH tu th?c v?i th?i h?n chuy?n d?i ho&agrave;n th&agrave;nh tru?c ng&agrave;y 30.6.2007.</p>  <p>19 tru?ng ÐH d&acirc;n l?p l&uacute;c d&oacute; bao g?m: Thang Long, Ð&ocirc;ng Ð&ocirc;, Phuong Ð&ocirc;ng, Kinh doanh v&agrave; C&ocirc;ng ngh? H&agrave; N?i, H?i Ph&ograve;ng, Duy T&acirc;n, B&igrave;nh Duong, L?c H?ng, C?u Long, Van Lang, Van Hi?n, H&ugrave;ng Vuong, H?ng B&agrave;ng (nay l&agrave; Qu?c t? H?ng B&agrave;ng), Ngo?i ng?-Tin h?c TP.HCM, C&ocirc;ng ngh? S&agrave;i G&ograve;n, K? thu?t C&ocirc;ng ngh? TP.HCM (nay l&agrave; C&ocirc;ng ngh? TP.HCM), Ph&uacute; Xu&acirc;n, Luong Th? Vinh, Yersin Ð&agrave; L?t.</p>  <p>Ð?n nay, 16 nam d&atilde; tr&ocirc;i qua nhung ch? c&ograve;n 2 tru?ng ÐH d&acirc;n l?p g?m C&ocirc;ng ngh? S&agrave;i G&ograve;n v&agrave; Phuong Ð&ocirc;ng v?n chua th?c hi?n vi?c chuy?n d?i theo quy d?nh.</p>  <p>Ph&oacute; th? tu?ng y&ecirc;u c?u&nbsp;<a
												class="link-inline-content" title="B? GD-ÐT "
												href="https://thanhnien.vn/bo-gd-dt-bien-soan-mot-bo-sach-giao-khoa-giao-vien-de-xuat-gi-18523110214541354.htm"
												data-rel="follow">B? GD-ÐT&nbsp;</a>nghi&ecirc;m t&uacute;c r&uacute;t kinh nghi?m, kh?n truong th?c hi?n d&uacute;ng ch?c nang v&agrave; nhi?m v? du?c giao, c&oacute; van b?n hu?ng d?n k&egrave;m theo th?i h?n c? th? v&agrave; ch? t&agrave;i nghi&ecirc;m kh?c d?i v?i Tru?ng ÐH d&acirc;n l?p C&ocirc;ng ngh? S&agrave;i G&ograve;n v&agrave; Tru?ng ÐH d&acirc;n l?p Phuong Ð&ocirc;ng.</p>  <p>Ð?ng th?i Ph&oacute; th? tu?ng Ch&iacute;nh ph? y&ecirc;u c?u Tru?ng ÐH d&acirc;n l?p C&ocirc;ng ngh? S&agrave;i G&ograve;n v&agrave; Tru?ng ÐH d&acirc;n l?p Phuong Ð&ocirc;ng nghi&ecirc;m t&uacute;c tu&acirc;n th? ph&aacute;p lu?t, kh?n truong th?c hi?n vi?c chuy?n d?i theo d&uacute;ng quy tr&igrave;nh, th? t?c v&agrave; quy d?nh.</p>  <div
											class="ddict_btn" style="top: 520px; left: 1066.46px;">
											<img
												src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png">
										</div>
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