--Xem Danh Sach Khoá Học
CREATE OR ALTER PROC sp_XemDanhSachKH
@makhoahoc int 
as
begin
	select BAIHOC.MaBaiHoc,BAIHOC.TenBaiHoc,BAIHOC.ThoiGianHoanThanh,BAIHOC.NoiDungBaiHoc,BaiHoc.MucTieuDauRa ,NgayDang,BaiHoc.MaKhoaHoc From KHOAHOC
	join BAIHOC 
	on BAIHOC.MaBaiHoc=KHOAHOC.MaKhoaHoc
	where KHOAHOC.MaKhoaHoc=@makhoahoc
end

--Xem Danh Sach Khoá Học Của Tôi
Create or ALter Procedure sp_XemKhoaHocCuaToi 
@manguoidung int
as
begin
	select Top 3 TenKhoaHoc,TrinhDoDauVao From KhoaHoc join
	DANGKY on KHOAHOC.MaKhoaHoc=DANGKY.MaKhoaHoc
	join HOCVIEN 
	on HOCVIEN.MaHocVien=DANGKY.MaNguoiDung
	where MaHocVien=@manguoidung
end