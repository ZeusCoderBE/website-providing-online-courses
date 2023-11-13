--Xem Thông Tin Học Viên
CREATE OR ALTER VIEW vThongTinHocVien as
select HOCVIEN.MaHocVien,NGUOIDUNG.HoTen,NGUOIDUNG.Email,NGUOIDUNG.Sdt,
	NGUOIDUNG.QuocGia,NGUOIDUNG.VungMien,NGUOIDUNG.DiaChi,NGUOIDUNG.TrinhDo,
	HOCVIEN.LoaiTaiKhoan,NguoiDung.MatKhau  From NGUOIDUNG join  HOCVIEN
	on HOCVIEN.MaHocVien=NGUOIDUNG.MaNguoiDung
GO
--Xem Khoá Học Đã Tạo
Create Or Alter View v_XemKhoaHocDaTao
as select KHOAHOC.MaKhoaHoc,TenKhoaHoc,TrinhDoDauVao,MoTa,GIANGVIEN.MaGiangVien From GIANGVIEN 
join BIENSOAN on GIANGVIEN.MaGiangVien=BIENSOAN.MaNguoiDung
join KHOAHOC on KHOAHOC.MaKhoaHoc=BIENSOAN.MaKhoaHoc
Go

-- Xem Giỏ Hàng
Create Or Alter View v_XemGioHang
as 
select NGUOIDUNG.HoTen,NGUOIDUNG.Email,KHOAHOC.TenKhoaHoc,KHOAHOC.DanhGia,KHOAHOC.MaTacGia
,KHOAHOC.TrinhDoDauVao,KHOAHOC.GiaTien,KHOAHOC.ThoiGianHoanThanh,
KHOAHOC.LinhVuc,KhoaHoc.NgayPhatHanh,KhoaHoc.MaKhoaHoc,NGUOIDUNG.MaNguoiDung From NGUOIDUNG
join GIOHANG
on  GIOHANG.MaNguoiDung=NGUOIDUNG.MaNguoiDung
join KHOAHOC on KHOAHOC.MaKhoaHoc= GIOHANG.MaKhoaHoc
Go
--Xem Thông tin giảng viên
CREATE OR ALTER VIEW vThongTinGiangVien as
select GIANGVIEN.MaGiangVien,NGUOIDUNG.HoTen,NGUOIDUNG.Email,NGUOIDUNG.Sdt,
	NGUOIDUNG.QuocGia,NGUOIDUNG.VungMien,NGUOIDUNG.DiaChi,NGUOIDUNG.TrinhDo,
	GIANGVIEN.ChuyenNganh,NguoiDung.MatKhau  From NGUOIDUNG join  GIANGVIEN
	on GIANGVIEN.MaGiangVien=NGUOIDUNG.MaNguoiDung
Go
-- Xem Danh Sách Tài Liệu dạng video đính kèm
Create or Alter View v_xemdanhsachtailieu as
select BaiHoc.*,TAILIEU.MaTaiLieu,TAILIEU.TheLoai,TAILIEU.DinhDangLuuTru,DuongDanLuuTru 
From DINHKEM
join TAILIEU
on TAILIEU.MaTaiLieu=DINHKEM.MaTaiLieu 
right join BAIHOC 
on BAIHOC.MaBaiHoc=DINHKEM.MaBaiHoc
join KHOAHOC
on BAIHOC.MaKhoaHoc=KHOAHOC.MaKhoaHoc