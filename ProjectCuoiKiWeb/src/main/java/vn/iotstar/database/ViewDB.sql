--Xem Thông Tin Học Viên
CREATE OR ALTER VIEW vThongTinHocVien as
select HOCVIEN.MaHocVien,NGUOIDUNG.HoTen,NGUOIDUNG.Email,NGUOIDUNG.Sdt,
	NGUOIDUNG.QuocGia,NGUOIDUNG.VungMien,NGUOIDUNG.DiaChi,NGUOIDUNG.TrinhDo,
	HOCVIEN.LoaiTaiKhoan,NguoiDung.MatKhau  From NGUOIDUNG join  HOCVIEN
	on HOCVIEN.MaHocVien=NGUOIDUNG.MaNguoiDung

	go
-- Xem Giỏ Hàng
Create Or Alter View v_XemGioHang
as 
select NGUOIDUNG.HoTen,NGUOIDUNG.Email,KHOAHOC.TenKhoaHoc,KHOAHOC.DanhGia,KHOAHOC.MaTacGia
,KHOAHOC.TrinhDoDauVao,KHOAHOC.GiaTien,KHOAHOC.ThoiGianHoanThanh,
KHOAHOC.LinhVuc,KhoaHoc.NgayPhatHanh,NGUOIDUNG.MaNguoiDung From NGUOIDUNG
join GIOHANG
on  GIOHANG.MaNguoiDung=NGUOIDUNG.MaNguoiDung
join KHOAHOC on KHOAHOC.MaKhoaHoc= GIOHANG.MaKhoaHoc