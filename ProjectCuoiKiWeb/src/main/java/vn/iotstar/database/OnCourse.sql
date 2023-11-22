--DROP DATABASE ONCOURSE
create database ONCOURSE
go

USE ONCOURSE
Go
--drop database OnCourse
CREATE TABLE NGUOIDUNG(
	MaNguoiDung INT PRIMARY KEY IDENTITY,
	HoTen NVARCHAR(50),
	Email VARCHAR(64) unique,
	Sdt VARCHAR(10) UNIQUE,
	QuocGia NVARCHAR(30),
	VungMien NVARCHAR(30),
	DiaChi NVARCHAR(30),
	TrinhDo NVARCHAR(30),
	MatKhau NVARCHAR(30)
);
GO

CREATE TABLE THE (
	MaThe VARCHAR(10) PRIMARY KEY, --(Số điện thoại người dùng)
	SoDu DECIMAL(18, 2),
	MaNguoiDung INT UNIQUE,
	CONSTRAINT FK_THE_NGUOIDUNG FOREIGN KEY(MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung)
);
GO

CREATE TABLE HOCVIEN (
	MaHocVien INT PRIMARY KEY,
	LoaiTaiKhoan NVARCHAR(20),
	CONSTRAINT FK_HOCVIEN_NGUOIDUNG FOREIGN KEY(MaHocVien) REFERENCES NGUOIDUNG(MaNguoiDung)
);
GO

CREATE TABLE GIANGVIEN (
	MaGiangVien INT PRIMARY KEY,
	ChuyenNganh NVARCHAR(20) ,
	CONSTRAINT FK_GIANGVIEN_NGUOIDUNG FOREIGN KEY(MaGiangVien) REFERENCES NGUOIDUNG(MaNguoiDung)
);
GO

CREATE TABLE KHOAHOC (
    MaKhoaHoc INT PRIMARY KEY IDENTITY(1,1),
    TenKhoaHoc NVARCHAR(255),
    MaTacGia INT,
    GiaTien REAL,
    NgonNgu NVARCHAR(50),
    ThoiGianHoanThanh REAL,
    TrinhDoDauVao NVARCHAR(50) ,
    NgayPhatHanh DATE,
    MoTa NTEXT,
    DanhGia INT default 5,
    TheLoai NVARCHAR(50),
    LinhVuc NVARCHAR(30),
    MinhHoa Nvarchar(255),
    CONSTRAINT FK_KHOAHOC_GIANGVIEN FOREIGN KEY (MaTacGia) REFERENCES GIANGVIEN(MaGiangVien) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT CHK_DANHGIA CHECK (DanhGia BETWEEN 1 AND 5)
);

GO

CREATE TABLE BAIHOC (
	MaBaiHoc INT PRIMARY KEY IDENTITY,
	TenBaiHoc NVARCHAR(255) ,
	ThoiGianHoanThanh real,
	NoiDungBaiHoc NTEXT ,
	MucTieuDauRa real ,
	NgayDang DATE ,
	MaKhoaHoc INT,
	CONSTRAINT FK_BAIHOC_KHOAHOC FOREIGN KEY (MaKhoaHoc) REFERENCES KHOAHOC(MaKhoaHoc) On delete set null on update cascade,
	CONSTRAINT CHK_MUCTIEUDAURA CHECK (MucTieuDauRa BETWEEN 0.0 AND 10.0)
);
GO

CREATE TABLE BAITAP (
	TenBaiTap NVARCHAR(100) NOT NULL,
	MaBaiHoc INT NOT NULL,
	ThoiGianHoanThanh real,
	PRIMARY KEY (TenBaiTap, MaBaiHoc),
	CONSTRAINT FK_BAITAP_BAIHOC FOREIGN KEY (MaBaiHoc) REFERENCES BAIHOC(MaBaiHoc) 
);
GO

CREATE TABLE TAILIEU (
	MaTaiLieu INT  PRIMARY KEY IDENTITY,
	TheLoai NVARCHAR(50),
	DinhDangLuuTru NVARCHAR(20),
	DuongDanLuuTru NVARCHAR(255) 
);
GO

CREATE TABLE GIOHANG (
	MaNguoiDung INT,
	MaKhoaHoc INT,
	PRIMARY KEY (MaNguoiDung, MaKhoaHoc),
	CONSTRAINT FK_GIOHANG_NGUOIDUNG FOREIGN KEY (MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung) ,
	CONSTRAINT FK_GIOHANG_KHOAHOC FOREIGN KEY (MaKhoaHoc) REFERENCES KHOAHOC(MaKhoaHoc)
);
GO

CREATE TABLE DANGKY (
	MaNguoiDung INT,
	MaKhoaHoc INT,
	TienDo REAL default 0 ,
	PRIMARY KEY (MaNguoiDung, MaKhoaHoc),
	CONSTRAINT FK_DANGKY_NGUOIDUNG FOREIGN KEY (MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung),
	CONSTRAINT FK_DANGKY_KHOAHOC FOREIGN KEY (MaKhoaHoc) REFERENCES KHOAHOC(MaKhoaHoc)
);
GO

CREATE TABLE THANHTOAN (
	MaNguoiDung INT,
	MaKhoaHoc INT,
	NgayThanhToan DATE NOT NULL,
	TienThanhToan DECIMAL(18, 2),
	NoiDungThanhToan NVARCHAR(255),
	PRIMARY KEY (MaNguoiDung, MaKhoaHoc),
	CONSTRAINT FK_THANHTOAN_NGUOIDUNG FOREIGN KEY (MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung),
	CONSTRAINT FK_THANHTOAN_KHOAHOC FOREIGN KEY (MaKhoaHoc) REFERENCES KHOAHOC(MaKhoaHoc)
);
GO

CREATE TABLE HOC (
	MaNguoiDung INT,
	MaBaiHoc INT,
	NgayHoanThanh DATE,
	TrangThai varchar(10) default 'Pending' ,
	PRIMARY KEY (MaNguoiDung, MaBaiHoc),
	CONSTRAINT FK_HOC_NGUOIDUNG FOREIGN KEY (MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung),
	CONSTRAINT FK_HOC_BAIHOC FOREIGN KEY (MaBaiHoc) REFERENCES BAIHOC(MaBaiHoc)
);
GO

CREATE TABLE LAMBAITAP (
	MaNguoiDung INT ,
	TenBaiTap NVARCHAR(100) ,
	MaBaiHoc INT ,
	TenBaiNop Nvarchar(100),
	PRIMARY KEY (MaNguoiDung, TenBaiTap, MaBaiHoc),
	CONSTRAINT FK_LAMBAITAP_NGUOIDUNG FOREIGN KEY (MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung),
	CONSTRAINT FK_LAMBAITAP_BAITAP FOREIGN KEY (TenBaiTap, MaBaiHoc) REFERENCES BAITAP(TenBaiTap, MaBaiHoc),
);
GO

CREATE TABLE DINHKEM (
	MaBaiHoc INT ,
	MaTaiLieu INT ,
	PRIMARY KEY (MaBaiHoc, MaTaiLieu),
	CONSTRAINT FK_DINHKEM_BAIHOC FOREIGN KEY (MaBaiHoc) REFERENCES BAIHOC(MaBaiHoc)  on update cascade,
	CONSTRAINT FK_DINHKEM_TAILIEU FOREIGN KEY (MaTaiLieu) REFERENCES TAILIEU(MaTaiLieu)  on update cascade

);
GO
-- Chèn người dùng
INSERT INTO NGUOIDUNG (HoTen, Email, Sdt, QuocGia, VungMien, DiaChi, TrinhDo,MatKhau)
VALUES
    (N'Nguyễn Văn A', 'nguyenvana@email.com', '1234567890', N'Việt Nam', N'Miền Nam', N'Địa chỉ 1', N'Cử nhân','1'),
    (N'Trần Thị B', 'tranthib@email.com', '9876543210', N'Việt Nam', N'Miền Trung', N'Địa chỉ 2', N'Thạc sĩ','2'),
    (N'Lê Văn C', 'levanc@email.com', '4567891230', N'Việt Nam', N'Miền Bắc', N'Địa chỉ 3', N'Tiến sĩ','3'),
    (N'Phạm Thị D', 'phamthid@email.com', '3216549870', N'Việt Nam', N'Miền Nam', N'Địa chỉ 4', N'Cử nhân','4'),
    (N'Hoàng Văn E', 'hoangvane@email.com', '9873216540', N'Việt Nam', N'Miền Trung', N'Địa chỉ 5', N'Thạc sĩ','5');


-- Chèn học viên
INSERT INTO HOCVIEN (MaHocVien, LoaiTaiKhoan)
VALUES (1, N'Vàng'),
    (2, N'Bạc'),
    (3, N'Đồng')
-- Chèn giảng viên
INSERT INTO  GIANGVIEN (MaGiangVien, ChuyenNganh)
VALUES (4, N'Công Nghệ Phần Mềm'),
    (5, N'Mạng Và An Ninh Mạng')
-- Chèn khóa học
INSERT INTO KHOAHOC (TenKhoaHoc, MaTacGia, GiaTien, NgonNgu, ThoiGianHoanThanh, TrinhDoDauVao, NgayPhatHanh, MoTa,TheLoai,LinhVuc, MinhHoa)
VALUES
    (N'Khóa học Lập Trình Web JSP & Servlet', 4, 29.99, N'Tiếng Việt', 3.5, N'Cơ bản', '2023-01-15', N'Học Toán từ cơ bản',N'Khoá Học Làm Dự Án',N'An Toàn Thông Tin', 'js.png')
    
INSERT INTO BAIHOC (TenBaiHoc, ThoiGianHoanThanh, NoiDungBaiHoc, MucTieuDauRa, NgayDang, MaKhoaHoc)
VALUES
    (N'Bài học 1', 2.5, N'Nội dung bài học 1', 5.0, '2023-01-10', 1),
    (N'Bài học 2', 3.0, N'Nội dung bài học 2', 6.0, '2023-01-15', 1)

INSERT INTO TAILIEU (TheLoai, DinhDangLuuTru, DuongDanLuuTru)
VALUES
    (N'Tài liệu', N'dox', N'Bài tập Chương 3.docx'),
    (N'Tài liệu', N'pptx', N'THUYẾT TRÌNH LỊCH SỬ ĐẢNG 2023.pptx'),
    (N'Tài liệu', N'pptx', N'WEBSITE_DAY_HOC_SO.pptx')
INSERT INTO DANGKY (MaNguoiDung, MaKhoaHoc)
VALUES
    (1, 1),
    (2, 1)

-- Chèn thẻ tài khoản
INSERT INTO THE 
VALUES
	('1234567890', 150.00, 1),
	('9876543210', 200.00, 2),
	('4567891230', 151.00, 3),
	('3216549870', 230.00, 4),
	('9873216540', 135.00, 5)


INSERT INTO HOC (MaNguoiDung, MaBaiHoc)
VALUES
    (1, 1),
	(1, 2),
    (2, 2)
    
INSERT INTO DINHKEM (MaBaiHoc, MaTaiLieu)
VALUES
    (1, 1),
    (2, 2)
    