--Xem Danh Sach Bai Hoc Trong 1 Khoá Học
CREATE OR ALTER PROC sp_XemDanhSachBaiHoc
@makhoahoc int 
as
begin
	select BAIHOC.MaBaiHoc,BAIHOC.TenBaiHoc,BAIHOC.ThoiGianHoanThanh,BAIHOC.NoiDungBaiHoc,BaiHoc.MucTieuDauRa ,NgayDang,BaiHoc.MaKhoaHoc From KHOAHOC
	join BAIHOC 
	on BAIHOC.MaBaiHoc=KHOAHOC.MaKhoaHoc
	where KHOAHOC.MaKhoaHoc=@makhoahoc
end
go
--Xem Danh Sách Của Khoá học Thuộc 1 Tài Khoản 
Create Or Alter Procedure sp_XemKhoaHocCuaToi
@manguoidung int 
as
begin
	select Top 3 TenKhoaHoc,TrinhDoDauVao From KHOAHOC 
	join DANGKY on DANGKY.MaKhoaHoc=KHOAHOC.MaKhoaHoc
	join HOCVIEN on DANGKY.MaNguoiDung=HOCVIEN.MaHocVien
	where HOCVIEN.MaHocVien=@manguoidung
end