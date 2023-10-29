
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
	MaNguoiDung INT,
	FOREIGN KEY(MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung)
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
	MaKhoaHoc INT PRIMARY KEY,
	TenKhoaHoc NVARCHAR(255) ,
	MaTacGia INT ,
	GiaTien DECIMAL(18, 2) ,
	NgonNgu NVARCHAR(50) , 
	ThoiGianHoanThanh DECIMAL(4, 2),
	TrinhDoDauVao NVARCHAR(50) ,
	NgayPhatHanh DATE ,
	MoTa NVARCHAR(255) ,
	DanhGia INT ,
	TheLoai nvarchar(50),
	LinhVuc nvarchar(30),
	CONSTRAINT FK_KHOAHOC_GIANGVIEN FOREIGN KEY (MaTacGia) REFERENCES GIANGVIEN(MaGiangVien),
	CONSTRAINT CHK_DANHGIA CHECK (DanhGia BETWEEN 1 AND 5)
);
GO

CREATE TABLE BAIHOC (
	MaBaiHoc INT  PRIMARY KEY,
	TenBaiHoc NVARCHAR(255) ,
	ThoiGianHoanThanh real,
	NoiDungBaiHoc TEXT ,
	MucTieuDauRa real ,
	NgayDang DATE ,
	AnhMinhHoa VARCHAR(255),
	MaKhoaHoc INT,
	CONSTRAINT FK_BAIHOC_KHOAHOC FOREIGN KEY (MaKhoaHoc) REFERENCES KHOAHOC(MaKhoaHoc),
	CONSTRAINT CHK_MUCTIEUDAURA CHECK (MucTieuDauRa BETWEEN 0.0 AND 10.0)
);
GO

CREATE TABLE BAITAP (
	TenBaiTap NVARCHAR(50) NOT NULL,
	MaBaiHoc INT NOT NULL,
	HinhThuc NVARCHAR(20) ,
	ThoiGianHoanThanh real,
	FileDapAn VARCHAR(255),
	PRIMARY KEY (TenBaiTap, MaBaiHoc),
	CONSTRAINT FK_BAITAP_BAIHOC FOREIGN KEY (MaBaiHoc) REFERENCES BAIHOC(MaBaiHoc)
);
GO

CREATE TABLE TAILIEU (
	MaTaiLieu INT  PRIMARY KEY,
	TheLoai NVARCHAR(20),
	DinhDangLuuTru NVARCHAR(20),
	DuongDanLuuTru NVARCHAR(255) 
);
GO

CREATE TABLE GIOHANG (
	MaNguoiDung INT,
	MaKhoaHoc INT,
	PRIMARY KEY (MaNguoiDung, MaKhoaHoc),
	CONSTRAINT FK_GIOHANG_NGUOIDUNG FOREIGN KEY (MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung),
	CONSTRAINT FK_GIOHANG_KHOAHOC FOREIGN KEY (MaKhoaHoc) REFERENCES KHOAHOC(MaKhoaHoc)
);
GO

CREATE TABLE DANGKY (
	MaNguoiDung INT,
	MaKhoaHoc INT,
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
	PRIMARY KEY (MaNguoiDung, MaBaiHoc),
	CONSTRAINT FK_HOC_NGUOIDUNG FOREIGN KEY (MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung),
	CONSTRAINT FK_HOC_BAIHOC FOREIGN KEY (MaBaiHoc) REFERENCES BAIHOC(MaBaiHoc)
);
GO

CREATE TABLE LAMBAITAP (
	MaNguoiDung INT ,
	TenBaiTap NVARCHAR(50) ,
	MaBaiHoc INT ,
	DiemSo INT ,
	PRIMARY KEY (MaNguoiDung, TenBaiTap, MaBaiHoc),
	CONSTRAINT FK_LAMBAITAP_NGUOIDUNG FOREIGN KEY (MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung),
	CONSTRAINT FK_LAMBAITAP_BAITAP FOREIGN KEY (TenBaiTap, MaBaiHoc) REFERENCES BAITAP(TenBaiTap, MaBaiHoc),
	CONSTRAINT CHK_DIEMSO CHECK (DiemSo BETWEEN 0 AND 10)
);
GO

CREATE TABLE DINHKEM (
	MaBaiHoc INT ,
	MaTaiLieu INT ,
	PRIMARY KEY (MaBaiHoc, MaTaiLieu),
	CONSTRAINT FK_DINHKEM_BAIHOC FOREIGN KEY (MaBaiHoc) REFERENCES BAIHOC(MaBaiHoc),
	CONSTRAINT FK_DINHKEM_TAILIEU FOREIGN KEY (MaTaiLieu) REFERENCES TAILIEU(MaTaiLieu)

);
GO

Create TABLE BIENSOAN
(
	MaNguoiDung int foreign key references NguoiDung(MaNguoiDung),
	MaKhoaHoc int foreign key references KhoaHoc(MaKhoaHoc),
	primary key (MaNguoiDung,MaKhoaHoc)
)
Go
Create TAble TaiLieuVanBan
(
  MaTaiLieu int primary key,
  NoiDung Text,
)
GO
Create Table DinhKiemVanBan
(
	MaBaiHoc int   FOREIGN KEY (MaBaiHoc) REFERENCES BAIHOC(MaBaiHoc),
	MaTaiLieu int FOREIGN KEY (MaTaiLieu) REFERENCES TaiLieuVanBan(MaTaiLieu),
	primary key (MaBaiHoc,MaTaiLieu)
)
go

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
INSERT INTO KHOAHOC (MaKhoaHoc,TenKhoaHoc, MaTacGia, GiaTien, NgonNgu, ThoiGianHoanThanh, TrinhDoDauVao, NgayPhatHanh, MoTa, DanhGia,TheLoai,LinhVuc)
VALUES
    (1,N'Khóa học Toán cơ bản', 4, 29.99, N'Tiếng Việt', 3.5, N'Cơ bản', '2023-01-15', N'Học Toán từ cơ bản', 4,N'Khoá Học Làm Dự Án',N'An Toàn Thông Tin'),
    (2,N'Khóa học Machine Learning', 4, 49.99, N'Tiếng Anh', 6.0, N'Nâng cao', '2023-03-10', N'Machine Learning và ứng dụng',5,N'Khoá Học Ngắn Hạn', N'Phát Triển Web'),
    (3,N'Khóa học Lịch sử thế giới', 4, 39.99, N'Tiếng Việt', 5.5, N'Nâng cao', '2023-04-05', N'Lịch sử thế giới', 4,N'Khoá Học Dài Hạn',N'Dữ Liệu'),
    (4,N'Khóa học Kỹ thuật điện tử', 5, 59.99, N'Tiếng Anh', 7.0, N'Cao cấp', '2023-05-01', N'Kỹ thuật điện tử và thiết kế',4,N'Khoá Học Chuyên Nghiệp', N'Trí Tệu Nhân Tạo');
INSERT INTO BAIHOC (MaBaiHoc,TenBaiHoc, ThoiGianHoanThanh, NoiDungBaiHoc, MucTieuDauRa, NgayDang, AnhMinhHoa, MaKhoaHoc)
VALUES
    (1,N'Bài học 1', 2.5, N'Nội dung bài học 1', 5.0, '2023-01-10', 'anh1.jpg', 1),
    (2,N'Bài học 2', 3.0, N'Nội dung bài học 2', 6.0, '2023-01-15', 'anh2.jpg', 1),
    (3,N'Bài học 3', 2.0, N'Nội dung bài học 1', 4.5, '2023-02-05', 'anh3.jpg', 2),
    (4,N'Bài học 4', 2.5, N'Nội dung bài học 1', 5.0, '2023-02-10', 'anh4.jpg', 2),
    (5,N'Bài học 5', 3.0, N'Nội dung bài học 1', 6.0, '2023-02-15', 'anh5.jpg', 3);

INSERT INTO BAITAP (TenBaiTap, MaBaiHoc, HinhThuc, ThoiGianHoanThanh, FileDapAn)
VALUES
    (N'Bài tập 1', 1, N'Loại 1', 2.0, 'dap_an_1.pdf'),
    (N'Bài tập 2', 1, N'Loại 2', 3.0, 'dap_an_2.pdf'),
    (N'Bài tập 1', 2, N'Loại 1', 2.5, 'dap_an_3.pdf'),
    (N'Bài tập 2', 2, N'Loại 2', 3.5, 'dap_an_4.pdf'),
    (N'Bài tập 1', 3, N'Loại 1', 2.0, 'dap_an_5.pdf');

INSERT INTO TAILIEU (MaTaiLieu,TheLoai, DinhDangLuuTru, DuongDanLuuTru)
VALUES
    (1,N'Tài liệu 1', N'PDF', 'duong_dan_1.pdf'),
    (2,N'Tài liệu 2', N'PDF', 'duong_dan_2.pdf'),
    (3,N'Tài liệu 3', N'Word', 'duong_dan_3.docx'),
    (4,N'Tài liệu 4', N'PDF', 'duong_dan_4.pdf'),
    (5,N'Tài liệu 5', N'Word', 'duong_dan_5.docx');

INSERT INTO GIOHANG (MaNguoiDung, MaKhoaHoc)
VALUES
    (1, 1),
    (2, 1),
    (3, 2)
INSERT INTO DANGKY (MaNguoiDung, MaKhoaHoc)
VALUES
    (1, 1),
    (2, 1),
    (3, 2)
-- Chèn thẻ tài khoản
INSERT INTO THE 
VALUES
	('1234567890', 150.00, 1),
	('9876543210', 200.00, 2),
	('4567891230', 151.00, 3),
	('3216549870', 230.00, 4),
	('9873216540', 135.00, 5)

INSERT INTO THANHTOAN (MaNguoiDung, MaKhoaHoc, NgayThanhToan, TienThanhToan, NoiDungThanhToan)
VALUES
    (1, 1, '2023-01-10', 15.99, N'THANH TOÁN KHÓA HỌC TOÁN CƠ BẢN'),
    (2, 1, '2023-01-11', 9.99, N'THANH TOÁN KHÓA HỌC TOÁN CƠ BẢN'),
    (3, 2, '2023-01-12', 23.99, N'THANH TOÁN KHÓA HỌC MACHINE LEARNING')
INSERT INTO HOC (MaNguoiDung, MaBaiHoc, NgayHoanThanh)
VALUES
    (1, 1, '2023-01-10'),
    (2, 2, '2023-01-11'),
    (3, 3, '2023-01-12')
INSERT INTO LAMBAITAP (MaNguoiDung, TenBaiTap, MaBaiHoc, DiemSo)
VALUES
    (1, N'Bài tập 1', 1, 9),
    (2, N'Bài tập 2', 2, 8),
    (3, N'Bài tập 1', 3, 7)
INSERT INTO DINHKEM (MaBaiHoc, MaTaiLieu)
VALUES
    (1, 1),
    (2, 2),
    (3, 3)
INSERT INTO BIENSOAN (MaNguoiDung, MaKhoaHoc)
VALUES
    (1, 1),
    (2, 1),
    (3, 2)
-- Insert into TaiLieuVanBan
INSERT INTO TaiLieuVanBan (MaTaiLieu, NoiDung)
VALUES
    (1, N'Nội dung tài liệu số 1'),
    (2, N'Nội dung tài liệu số 2'),
    (3, N'Nội dung tài liệu số 3');

-- Insert into DinhKiemVanBan
INSERT INTO DinhKiemVanBan (MaBaiHoc, MaTaiLieu)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 3);