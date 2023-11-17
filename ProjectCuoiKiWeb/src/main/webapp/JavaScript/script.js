tinymce.init({
	selector: 'textarea#default',
	width: 1100,
	height: 700,
	plugins: [
		'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'prewiew', 'anchor', 'pagebreak',
		'searchreplace', 'wordcount', 'visualblocks', 'code', 'fullscreen', 'insertdatetime', 'media',
		'table', 'emoticons', 'template', 'codesample'
	],
	toolbar: 'undo redo | styles | bold italic underline | alignleft aligncenter alignright alignjustify |' +
		'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
		'forecolor backcolor emoticons',
	// enable title field in the Image dialog
	image_title: true,
	// enable automatic uploads of images represented by blob or data URIs
	automatic_uploads: true,
	// add custom filepicker only to Image dialog
	file_picker_types: 'image',
	file_picker_callback: function(cb, value, meta) {
		var input = document.createElement('input');
		input.setAttribute('type', 'file');
		input.setAttribute('accept', '*/*');

		input.onchange = function() {
			var file = this.files[0];
			var reader = new FileReader();

			reader.onload = function() {
				var id = 'blobid' + (new Date()).getTime();
				var blobCache = tinymce.activeEditor.editorUpload.blobCache;
				var base64 = reader.result.split(',')[1];
				var blobInfo = blobCache.create(id, file, base64);
				blobCache.add(blobInfo);

				// call the callback and populate the Title field with the file name
				cb(blobInfo.blobUri(), { title: file.name });
			};
			reader.readAsDataURL(file);
		};

		input.click();
	},

	// add custom filepicker only to Image dialog
	file_picker_types: 'media',
	audio_template_callback: function(data) {
		return '<audio controls>' + '\n<source src="' + data.source + '"' + (data.sourcemime ? ' type="' + data.sourcemime + '"' : '') + ' />\n' + (data.altsource ? '<source src="' + data.altsource + '"' + (data.altsourcemime ? ' type="' + data.altsourcemime + '"' : '') + ' />\n' : '') + '</audio>';
	},
	menu: {
		favs: { title: 'menu', items: 'code visualaid | searchreplace | emoticons' }
	},
	menubar: 'favs file edit view insert format tools table',
	content_style: 'body{font-family:Helvetica,Arial,sans-serif; font-size:16px}'
});
function CheckPass() {
	var repass = document.getElementById("repass").value;
	var newpass = document.getElementById("newpass").value;
	var password = document.getElementById("password").value;
	if (repass === "" || newpass === "" || password === "") {
		alert("Bạn Muốn Đổi Mật Khẩu Vui Lòng Nhập Theo Hướng Dẫn");
		return false;
	} else if (newpass !== repass) {
		alert("Bạn Nhập Xác Nhận Mật Khẩu Chưa Đúng !");
		return false;
	}
	else {
		return true;
	}
}


function handleFocus() {
	const page = document.querySelector('.page');
	const sidebarHome = document.querySelector('.sidebar_home');
	const pageStudy = document.querySelector('.page_study');
	const sidebarStudy = document.querySelector('.sidebar_study');
	page.style.display = 'none';
	sidebarHome.style.display = 'none';
	pageStudy.style.display = 'block';
	sidebarStudy.style.display = 'block';
}
function handleCheckboxChange(checkbox) {
	var tkhocvienCheckbox = document.getElementById("tkhocvien");
	var tkgiaovienCheckbox = document.getElementById("tkgiaovien");
	if (checkbox.id === "tkgiaovien" && checkbox.checked) {
		tkhocvienCheckbox.checked = false;
	} else if (checkbox.id === "tkhocvien" && checkbox.checked) {
		tkgiaovienCheckbox.checked = false;
	}
}
function validateForm() {
	var tkhocvienCheckbox = document.getElementById("tkhocvien");
	var tkgiaovienCheckbox = document.getElementById("tkgiaovien");

	if (!tkhocvienCheckbox.checked && !tkgiaovienCheckbox.checked) {
		alert("Bạn phải chọn ít nhất một tùy chọn (Học viên hoặc Giáo viên) .");
		return false;
	}
	return true;
}
function SelectedCourse() {
	var count = document.getElementById("selectedCourses");
	if (!count.checked) {
		alert("Bạn phải chọn ít nhất một khoá học để thanh toán")
		return false;
	}

	return true;
}

function testConfirmDialog() {
	var result = confirm("Bạn chắc chắc có muốn đăng xuất không");
	if (result == true) {
		window.location.href = "dang-xuat";
	}
	else {
		return false;
	}
}
function XacNhanXoaKH(makhoahoc) {
	var result = confirm("Bạn chắc chắc có muốn xoá khoá học này không");
	if (result == true) {
		window.location.href = "Delete-Course?makhoahoc=" + makhoahoc;
	}
	else {
		return false;
	}
}
function handleBlur() {
	const page = document.querySelector('.page');
	const sidebarHome = document.querySelector('.sidebar_home');
	const pageStudy = document.querySelector('.page_study');
	const sidebarStudy = document.querySelector('.sidebar_study');
	page.style.display = 'block';
	sidebarHome.style.display = 'block';
	pageStudy.style.display = 'none';
	sidebarStudy.style.display = 'none';
}
function enableField() {
	const username = document.getElementById("username");
	const quocgia = document.getElementById("quocgia");
	const sdt = document.getElementById("sdt");
	const vungmien = document.getElementById("vungmien");
	const trinhdo = document.getElementById("trinhdo");
	const diachi = document.getElementById("diachi");
	const save = document.getElementById("save");
	const email = document.getElementById("email");
	const chuyennganh = document.getElementById("chuyennganh");
	username.removeAttribute("disabled");
	quocgia.removeAttribute("disabled");
	sdt.removeAttribute("disabled");
	vungmien.removeAttribute("disabled");
	trinhdo.removeAttribute("disabled");
	diachi.removeAttribute("disabled");
	email.removeAttribute("disabled");
	save.disabled = false;
	chuyennganh.removeAttribute("disabled");
}
function myCourses() {
	const page = document.querySelector('.page_content');
	const homecourse = document.querySelector('.home_course');
	page.style.gridTemplateColumns = '77% 22.7%';
	homecourse.style.display = 'block';
}

function homePage() {
	const page = document.querySelector('.page_content');
	const homecourse = document.querySelector('.home_course');
	page.style.gridTemplateColumns = 'auto';
	homecourse.style.display = 'none';
}
function ReloadAlert(thongBao) {
	if (thongBao !== null && thongBao !== "") {
		alert(thongBao);
	}
}
function checkKhoaHoc() {
    // Lấy giá trị của các trường
    var giatienValue = document.getElementById('giatien').value;
    var thoiluongValue = document.getElementById('thoiluong').value;
    var matacgiaValue = document.getElementById('matacgia').value;

    // Kiểm tra giá trị không chứa kí tự chữ hoặc kí tự đặc biệt
    var regex = /^[0-9.]+$/; // Chỉ chấp nhận các kí tự số
    if (!regex.test(giatienValue)) {
        alert("Giá tiền không hợp lệ");
        return false;
    }

    if (!regex.test(thoiluongValue)) {
        alert("Thời lượng không hợp lệ");
        return false;
    }

    regex = /^[0-9]+$/; // Chỉ chấp nhận các kí tự số cho mã tác giả
    if (!regex.test(matacgiaValue)) {
        alert("Mã tác giả không hợp lệ.");
        return false;
    }

    // Nếu mọi kiểm tra đều qua, cho phép form submit
    return true;
}


function goToNewPage() {
	window.location.href = "./signin.html";
}

function scrollToElement(elementId) {
	window.location.href = "profile"; // Thay đổi URL tới trang bạn muốn chuyển đến
	localStorage.setItem('scrollToElement', elementId);
}

function confirmPay(diff) {
	if (diff < 0) {
		var money = alert("Tiền trong thẻ không đủ thanh toán các khóa học!");
		return "paycartinfo";
	} else {
		var result = confirm("Bạn sẽ thanh toán các khóa học này chứ ?");
		if (result == true) {
			window.location.href = "paycourses";
		}
		else {
			return "redirect:/homepage";
		}
	}
}
function createLessonFaied(warning) {
	if (warning != "" && warning != null) {
		alert(warning);
	}
}

function TotalPay() {
	var checkboxes = document.querySelectorAll('.checkbox-item');
	var priceElements = document.querySelectorAll('.cart-price-current p');
	var pricePay = document.querySelector(".cart-pay h2");
	var prices = Array.from(priceElements).map(function(element) {
		return element.textContent.replace("Giá Tiền: ", "").replace("$", ""); // Bỏ đi ký tự "$" ở cuối
	});
	checkboxes.forEach(function(checkbox, index) {
		checkbox.addEventListener('change', function() {
			// Nếu checkbox được chọn, thêm giá trị của p vào tổng
			var total = 0;
			checkboxes.forEach(function(checkbox, i) {
				if (checkbox.checked) {
					total += parseFloat(prices[i]);
				}
			});
			pricePay.textContent = total + "$";
		});
	});
}

function uploadFile() {
	var fileInput = document.getElementById('file-input');
	var files = fileInput.files;

	var formData = new FormData();
	for (var i = 0; i < files.length; i++) {
		formData.append('files', files[i]);
	}

	// Sử dụng AJAX để gửi FormData đến server
	var xhr = new XMLHttpRequest();
	xhr.open('POST', './Submit-Practice', true);
	xhr.onload = function() {
		if (xhr.status === 200) {
			console.log('Files uploaded successfully!');
		} else {
			console.log('Error uploading files!');
		}
	};
	xhr.send(formData);
}


function scrollToTop() {
  console.log('Clicked on back-to-top button');
  window.scrollTo({
      top: 0,
      behavior: 'smooth' // Sử dụng 'smooth' để có hiệu ứng cuộn mượt
  });
}

function OpenCreate(name){
  let elements = document.getElementsByClassName(name);
    
  // Kiểm tra xem có phần tử nào với class name đã cho hay không
  if (elements.length > 0) {
      let create = elements[0];

      if (!create.classList.contains('active')) {
          create.classList.add('active');
          scrollToTop();
      }

      document.body.classList.add('create-open');
  } else {
      console.error('Không tìm thấy phần tử với class ' + name);
  }
}

function CloseCreate(name){
  let elements = document.getElementsByClassName(name);
  if(elements.length >0){
    let create = elements[0];
    if(create.classList.contains('active')){
      create.classList.remove('active');
    }
    document.body.classList.remove('create-open');
  }else {
    console.error('Không thể xóa phần tử với class ' + name);
  }
}

function MaskDone(mabaihoc) {
/*	let icon = document.querySelector('.content_progress i');
	let mask = document.querySelector('.content_progress span');
	icon.classList.add('fa-solid');
	icon.classList.add('fa-check');
	mask.textContent = 'Done';*/
	window.location.href= 'mask-complete?mabaihoc=' + mabaihoc;
}

function ShowOption(name, ...item){
	let tab = document.getElementsByClassName(name);
	for(var i =0; i<item.length; i++){
		let tabName = document.getElementsByClassName(item[i]);
		if(!tabName[0].classList.contains('active')){	
		    tabName[0].classList.add('active');			
		}
	}
	if(tab[0].classList.contains('active')){
		tab[0].classList.remove('active');
	}
}
