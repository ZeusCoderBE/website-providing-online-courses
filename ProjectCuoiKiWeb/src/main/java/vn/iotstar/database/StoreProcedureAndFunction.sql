--Tìm và Cập Nhật Tài Khoản Giảng Viên
CREATE OR ALTER PROCEDURE sp_TimTaiKhoanGiangVien
as
begin
	declare @manguoidung int
	set @manguoidung=(SELECT  Top 1 MaNguoiDung FROM NGUOIDUNG
	ORDER BY MaNguoiDung desc)
	insert into GIANGVIEN(MaGiangVien)
	values(@manguoidung)
end

--Tìm Và Cập Nhật Tài Khoản Học Viên
Create OR ALTER PROCEDURE sp_TimTaiKhoanHocVien
as
begin
	declare @manguoidung int
	set @manguoidung=(SELECT  Top 1 MaNguoiDung FROM NGUOIDUNG
	ORDER BY MaNguoiDung desc)
	insert into HOCVIEN(MaHocVien,LoaiTaiKhoan)
	values(@manguoidung,N'Dong')
end

--Xem Danh Sach Bai Hoc Trong 1 Khoá Học đối với khách
CREATE OR ALTER PROC sp_XemDanhSachBaiHoc
@makhoahoc int 
as
begin
	select BAIHOC.MaBaiHoc,BAIHOC.TenBaiHoc,BAIHOC.ThoiGianHoanThanh,BAIHOC.NoiDungBaiHoc,BaiHoc.MucTieuDauRa ,NgayDang,BaiHoc.MaKhoaHoc From KHOAHOC
	join BAIHOC 
	on BAIHOC.MaBaiHoc=KHOAHOC.MaKhoaHoc
	where KHOAHOC.MaKhoaHoc=@makhoahoc
end
--Xem Danh Sách Của Khoá học Thuộc 1 Tài Khoản học viên
GO
Create Or Alter Procedure sp_XemKhoaHocCuaToi
@manguoidung int 
as
begin
	select  TenKhoaHoc,TrinhDoDauVao From KHOAHOC 
	join DANGKY on DANGKY.MaKhoaHoc=KHOAHOC.MaKhoaHoc
	join HOCVIEN on DANGKY.MaNguoiDung=HOCVIEN.MaHocVien
	where HOCVIEN.MaHocVien=@manguoidung
end
--Lấy Thông Tin của người dùng 

CREATE OR ALTER PROCEDURE sp_TimThongTinHocVien
@email varchar(64) 
as 
begin
	select HOCVIEN.MaHocVien,NGUOIDUNG.HoTen From NGUOIDUNG join  HOCVIEN
	on HOCVIEN.MaHocVien=NGUOIDUNG.MaNguoiDung
	where NGUOIDUNG.Email=@email
end