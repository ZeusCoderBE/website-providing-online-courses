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
    if (checkbox.id === "tkgiaovien" && checkbox.checked) {
        document.getElementById("tkhocvien").checked = false;
    } else if (checkbox.id === "tkhocvien" && checkbox.checked) {
        document.getElementById("tkgiaovien").checked = false;
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