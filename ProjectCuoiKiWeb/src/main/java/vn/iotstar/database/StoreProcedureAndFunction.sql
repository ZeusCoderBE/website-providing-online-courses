 --Cập nhật số dư cho người là tác giả của khoá học
Create Or ALter Procedure sp_CapNhatSoDuTKGV
@matacgia int,@cost real
as
begin
	--Tìm người giảng viên là tác giả của khoá học
	declare @magiangvien int
	set @magiangvien=( select distinct MaGiangVien From KHOAHOC join GIANGVIEN
	on GIANGVIEN.MaGiangVien=KHOAHOC.MaTacGia
	where KHOAHOC.MaTacGia=@matacgia)
	
	--Cập nhật tài khoản giảng viên
	declare @sodubandau real
	select @sodubandau=SoDu From The
	where MaNguoiDung=@magiangvien
	Update THE set SoDu=@sodubandau+@cost
	where MaNguoiDung=@magiangvien
end
GO
 --Tạo Biên Soạn
 Create or ALter Procedure sp_CreateCompilation
@manguoidung int
as
begin
	declare @makhoahoc int 
	set @makhoahoc = (select Top 1 MaKhoaHoc From KHOAHOC
	order by MaKhoaHoc desc)
	insert into BIENSOAN(MaNguoiDung,MaKhoaHoc)
	values(@manguoidung,@makhoahoc)
end
Go
--Remove course dành cho giảng viên
Create or Alter Procedure sp_RemoveACourse
@makhoahoc int
as
begin
	delete From KHOAHOC
	where MaKhoaHoc=@makhoahoc
end
Go
--Edit Course dành cho giảng viên
Create Or Alter Procedure sp_EditACourse
@makhoahoc int,
@tenkhoahoc nvarchar(255),
@matacgia int ,
@giatien real,
@ngonngu nvarchar(50),
@thoigianhoanthanh real,
@trinhdodauvao nvarchar(50),
@ngayphathanh date,
@mota ntext,
@danhgia int,
@theloai nvarchar(50),
@linhvuc nvarchar(30)
as
begin
	Update KHOAHOC set TenKhoaHoc=@tenkhoahoc ,MaTacGia=@matacgia,GiaTien=@giatien,
	NgonNgu=@ngonngu,ThoiGianHoanThanh=@thoigianhoanthanh,TrinhDoDauVao=@trinhdodauvao,
	NgayPhatHanh=@ngayphathanh,MoTa=@mota,DanhGia=@danhgia,TheLoai=@theloai,LinhVuc=@linhvuc
	where KHOAHOC.MaKhoaHoc=@makhoahoc
end
Go
 --Tạo khoá học dành cho giảng viên
 Create Or Alter Procedure sp_CreateACourse
@tenkhoahoc nvarchar(255),
@matacgia int ,
@giatien real,
@ngonngu nvarchar(50),
@thoigianhoanthanh real,
@trinhdodauvao nvarchar(50),
@ngayphathanh date,
@mota ntext,
@danhgia int,
@theloai nvarchar(50),
@linhvuc nvarchar(30)
as
begin
	insert into  KHOAHOC(TenKhoaHoc,MaTacGia,GiaTien,NgonNgu,ThoiGianHoanThanh,TrinhDoDauVao,NgayPhatHanh,MoTa,DanhGia,TheLoai,LinhVuc)
	values(@tenkhoahoc,@matacgia,@giatien,@ngonngu,@thoigianhoanthanh,@trinhdodauvao,@ngayphathanh,@mota,@danhgia,@theloai,@linhvuc)
end

 Go
--Thêm Khoá Học Vào Giỏ hàng Của Tôi
CREATE Or Alter PROCEDURE sp_InsertCourseCart
    @MaNguoiDung INT,
    @MaKhoaHoc INT
AS
BEGIN
    INSERT INTO GioHang (MaNguoiDung, MaKhoaHoc)
    VALUES (@MaNguoiDung, @MaKhoaHoc);
END;
Go
--Xoá Khoá Học Trong Giỏ Hàng
CREATE Or ALter PROCEDURE sp_DeleteCourseCart
    @MaNguoiDung INT,
    @MaKhoaHoc INT
AS
BEGIN
    DELETE FROM GioHang
    WHERE MaNguoiDung = @MaNguoiDung AND MaKhoaHoc = @MaKhoaHoc;
END;
Go
-- Tạo stored procedure để thêm người dùng
CREATE OR ALTER PROCEDURE sp_SignUp
    @HoTen NVARCHAR(255),
    @Email NVARCHAR(255),
    @QuocGia NVARCHAR(50),
    @MatKhau NVARCHAR(255),
    @Sdt NVARCHAR(20)
AS
BEGIN
    INSERT INTO NguoiDung (HoTen, Email, QuocGia, MatKhau, Sdt)
    VALUES (@HoTen, @Email, @QuocGia, @MatKhau, @Sdt);
END
Go
-- Tạo sp cập nhật mật khẩu
CREATE Or ALTER PROCEDURE sp_UpdateMatKhau
    @MaNguoiDung INT,
    @MatKhau NVARCHAR(255)
AS
BEGIN
    UPDATE NguoiDung
    SET MatKhau = @MatKhau
    WHERE MaNguoiDung = @MaNguoiDung;
END;
Go
--đổi mật khẩu dựa trên mail
CREATE Or ALTER PROCEDURE sp_ForgetMatKhau
    @Email varchar(60),
    @MatKhau NVARCHAR(255)
AS
BEGIN
    UPDATE NguoiDung
    SET MatKhau = @MatKhau
    WHERE Email = @Email;
END
Go
-- Update NguoiDung
CREATE Or ALTER PROCEDURE sp_UpdateNguoiDung
    @MaNguoiDung INT,
    @HoTen NVARCHAR(255),
    @Sdt NVARCHAR(20),
    @QuocGia NVARCHAR(50),
    @VungMien NVARCHAR(50),
    @DiaChi NVARCHAR(255),
    @TrinhDo NVARCHAR(50),
    @Email NVARCHAR(255)
AS
BEGIN
    UPDATE NguoiDung
    SET HoTen = @HoTen,
        Sdt = @Sdt,
        QuocGia = @QuocGia,
        VungMien = @VungMien,
        DiaChi = @DiaChi,
        TrinhDo = @TrinhDo,
        Email = @Email
    WHERE MaNguoiDung = @MaNguoiDung;
END
Go
--Update chuyên ngành giảng viên
CREATE OR ALTER PROCEDURE sp_UpdateChuyenNganhGV
	@ChuyenNganh NVARCHAR(255),
    @MaGiangVien INT
AS
BEGIN
    UPDATE GiangVien
    SET ChuyenNganh = @ChuyenNganh
    WHERE MaGiangVien = @MaGiangVien;
END
Go
--Tìm và Cập Nhật Tài Khoản Giảng Viên
CREATE Or ALter PROCEDURE sp_TimTaiKhoanGiangVien
as
begin
	declare @manguoidung int
	set @manguoidung=(SELECT  Top 1 MaNguoiDung FROM NGUOIDUNG
	ORDER BY MaNguoiDung desc)
	insert into GIANGVIEN(MaGiangVien)
	values(@manguoidung)
end
go
--Tìm Và Cập Nhật Tài Khoản Học Viên
CREATE Or ALTER PROCEDURE sp_TimTaiKhoanHocVien
as
begin
	declare @manguoidung int
	set @manguoidung=(SELECT  Top 1 MaNguoiDung FROM NGUOIDUNG
	ORDER BY MaNguoiDung desc)
	insert into HOCVIEN(MaHocVien,LoaiTaiKhoan)
	values(@manguoidung,N'Dong')
end
Go

--Xem Danh Sach Bai Hoc Trong 1 Khoá Học đối với khách
CREATE OR Alter PROC sp_XemDanhSachBaiHoc
@makhoahoc INT
as
begin
	select BAIHOC.MaBaiHoc,BAIHOC.TenBaiHoc,BAIHOC.ThoiGianHoanThanh,BAIHOC.NoiDungBaiHoc,BaiHoc.MucTieuDauRa ,NgayDang,BaiHoc.MaKhoaHoc From KHOAHOC
	join BAIHOC 
	on BAIHOC.MaKhoaHoc=KHOAHOC.MaKhoaHoc
	where KHOAHOC.MaKhoaHoc=@makhoahoc
end
GO

--Xem Danh Sách Của Khoá học Thuộc 1 Tài Khoản học viên
CREATE Or ALter Procedure sp_XemKhoaHocCuaToi
@manguoidung int 
as
begin
	select  KhoaHoc.MaKhoaHoc,TenKhoaHoc,TrinhDoDauVao,MoTa From KHOAHOC 
	join DANGKY on DANGKY.MaKhoaHoc=KHOAHOC.MaKhoaHoc
	join HOCVIEN on DANGKY.MaNguoiDung=HOCVIEN.MaHocVien
	where HOCVIEN.MaHocVien=@manguoidung
end
GO
-- So sánh giá tiền thanh toán và giá tiền khóa học
CREATE Or ALter PROCEDURE sp_thanhtoanKH
@tienThanhToan DECIMAL, @maKhoaHoc INT,
@soSanh INT OUTPUT, @diff DECIMAL OUTPUT
AS
DECLARE @giatien DECIMAL
BEGIN
	SELECT @giatien=GiaTien FROM KHOAHOC
	WHERE MaKhoaHoc=@maKhoaHoc
	IF @giatien < @tienThanhToan
	BEGIN
		SET @soSanh=0
		SET @diff = @tienThanhToan - @giatien
	END
	IF @giatien > @tienThanhToan
	BEGIN
		SET @soSanh=1
		SET @diff = @giatien - @tienThanhToan
	END
	IF @giatien = @tienThanhToan
	BEGIN
		SET @soSanh=2
		SET @diff = 0
	END
END
Go
-- Check Đăng Nhập với vai trò là học viên
Create or Alter Procedure sp_CheckLoginHV
@email varchar(64),@matkhau nvarchar(30), @check int output
as
begin
	if exists (select 1 From NGUOIDUNG join HOCVIEN on 
	HOCVIEN.MaHocVien=NGUOIDUNG.MaNguoiDung where NGUOIDUNG.Email=@email and NGUOIDUNG.MatKhau=@matkhau)
		set @check=1
	else
		set @check=0
	print @check
end 
Go
--Check Đăng Nhập Giảng viên
Create or Alter Procedure sp_CheckLoginGV
@email varchar(64),@matkhau nvarchar(30), @check int output
as
begin
	if exists (select 1 From NGUOIDUNG join GIANGVIEN on 
	GIANGVIEN.MaGiangVien=NGUOIDUNG.MaNguoiDung where NGUOIDUNG.Email=@email and NGUOIDUNG.MatKhau=@matkhau)
		set @check=1
	else
		set @check=0
	print @check
end 
--Update số dư thẻ
GO
CREATE OR ALTER PROC sp_UpdateThe @mathe VARCHAR(10), @tiennap real
AS
BEGIN
	DECLARE @sodu real
	SELECT @sodu = SoDu FROM THE WHERE MaThe = @mathe
	UPDATE THE SET SoDu = @sodu + @tiennap WHERE MaThe = @mathe
END
GO

--Học viên nộp bài tập
CREATE Or ALTER PROCEDURE sp_NopBaiTap @mand INT, @TenBaiTap NVARCHAR(50), @mabaihoc INT, @filebailam VARCHAR(255) 
as
begin
	INSERT INTO LAMBAITAP (MaNguoiDung, TenBaiTap, MaBaiHoc, FileBaiLam)
	VALUES (@mand, @TenBaiTap, @mabaihoc, @filebailam)
end
Go


