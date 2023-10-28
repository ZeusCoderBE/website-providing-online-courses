

--Xem Danh Sach Bai Hoc Trong 1 Khoá Học đối với khách
CREATE OR ALTER PROC sp_XemDanhSachBaiHoc
@makhoahoc INT
as
begin
	select BAIHOC.MaBaiHoc,BAIHOC.TenBaiHoc,BAIHOC.ThoiGianHoanThanh,BAIHOC.NoiDungBaiHoc,BaiHoc.MucTieuDauRa ,NgayDang,BaiHoc.MaKhoaHoc From KHOAHOC
	join BAIHOC 
	on BAIHOC.MaBaiHoc=KHOAHOC.MaKhoaHoc
	where KHOAHOC.MaKhoaHoc=@makhoahoc
end
GO

--Xem Danh Sách Của Khoá học Thuộc 1 Tài Khoản học viên
Create or Alter Procedure sp_XemKhoaHocCuaToi
@manguoidung int 
as
begin
	select  TenKhoaHoc,TrinhDoDauVao From KHOAHOC 
	join DANGKY on DANGKY.MaKhoaHoc=KHOAHOC.MaKhoaHoc
	join HOCVIEN on DANGKY.MaNguoiDung=HOCVIEN.MaHocVien
	where HOCVIEN.MaHocVien=@manguoidung
end
GO

--Lấy Thông Tin của người dùng 
CREATE OR ALTER PROCEDURE sp_TimThongTinHocVien
@email varchar(64) 
as 
begin
	select HOCVIEN.MaHocVien,NGUOIDUNG.HoTen From NGUOIDUNG join  HOCVIEN
	on HOCVIEN.MaHocVien=NGUOIDUNG.MaNguoiDung
	where NGUOIDUNG.Email=@email
end
GO

-- So sánh giá tiền thanh toàn và giá tiền khóa học
CREATE OR ALTER PROCEDURE sp_thanhtoanKH
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
GO