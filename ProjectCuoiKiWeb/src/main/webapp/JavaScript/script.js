tinymce.init({
    selector: 'textarea#default',
    width: 1100,
    height: 800,
    plugins:[
        'advlist', 'autolink', 'link', 'image', 'lists', 'charmap', 'prewiew', 'anchor', 'pagebreak',
        'searchreplace', 'wordcount', 'visualblocks', 'code', 'fullscreen', 'insertdatetime', 'media', 
        'table', 'emoticons', 'template', 'codesample'
    ],
    toolbar: 'undo redo | styles | bold italic underline | alignleft aligncenter alignright alignjustify |' + 
    'bullist numlist outdent indent | link image | print preview media fullscreen | ' +
    'forecolor backcolor emoticons',
    menu: {
        favs: {title: 'menu', items: 'code visualaid | searchreplace | emoticons'}
    },
    menubar: 'favs file edit view insert format tools table',
    content_style: 'body{font-family:Helvetica,Arial,sans-serif; font-size:16px}'
});
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
        alert("Bạn phải chọn ít nhất một tùy chọn (Học viên hoặc Giáo viên) trước khi đăng ký.");
        return false; 
    }
    return true; 
}


function testConfirmDialog()
 {
 	var result=confirm("Bạn chắc chắc có muốn đăng xuất không");
 	if(result==true)
 	{
 		window.location.href="dang-xuat";
 	}
 	else
 	{
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
function enableField()
{
	const username=document.getElementById("username");
	const quocgia=document.getElementById("quocgia");
	const sdt=document.getElementById("sdt");
	const vungmien=document.getElementById("vungmien");
	const trinhdo=document.getElementById("trinhdo");
	const diachi=document.getElementById("diachi");
	const save=document.getElementById("save");
	username.removeAttribute("disabled");
	quocgia.removeAttribute("disabled");
	sdt.removeAttribute("disabled");
	vungmien.removeAttribute("disabled");
	trinhdo.removeAttribute("disabled");
	diachi.removeAttribute("disabled");
	save.disabled = false;
}
function myCourses(){
    const page = document.querySelector('.page_content');
    const homecourse = document.querySelector('.home_course');
    page.style.gridTemplateColumns = '77% 22.7%';
    homecourse.style.display = 'block';
}

function homePage(){
    const page = document.querySelector('.page_content');
    const homecourse = document.querySelector('.home_course');
    page.style.gridTemplateColumns = 'auto';
    homecourse.style.display = 'none';
}

function goToNewPage() {
    window.location.href = "./signin.html";
}

function scrollToElement(elementId) {
    window.location.href = "myprofiles"; // Thay đổi URL tới trang bạn muốn chuyển đến
    localStorage.setItem('scrollToElement', elementId);
  }