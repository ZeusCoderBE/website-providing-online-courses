--View xem các khoá học đã được đăng ký
CREATE OR ALTER VIEW v_xemkhoahocdangky as
select KhoaHoc.MaKhoaHoc,COUNT(DANGKY.MaNguoiDung)  as[SoLuong],KHOAHOC.TenKhoaHoc,KHOAHOC.TrinhDoDauVao,KhoaHoc.MinhHoa From DANGKY
join KHOAHOC
on KHOAHOC.MaKhoaHoc =DANGKY.MaKhoaHoc
group by KHOAHOC.MaKhoaHoc,KHOAHOC.TenKhoaHoc,KHOAHOC.TrinhDoDauVao,KhoaHoc.MinhHoa

Go
--Xem Thông Tin Học Viên
CREATE OR ALTER VIEW v_ThongTinHocVien as
select HOCVIEN.MaHocVien,NGUOIDUNG.HoTen,NGUOIDUNG.Email,NGUOIDUNG.Sdt,
	NGUOIDUNG.QuocGia,NGUOIDUNG.VungMien,NGUOIDUNG.DiaChi,NGUOIDUNG.TrinhDo,
	HOCVIEN.LoaiTaiKhoan,NguoiDung.MatKhau  From NGUOIDUNG join  HOCVIEN
	on HOCVIEN.MaHocVien=NGUOIDUNG.MaNguoiDung
GO
--Xem Khoá Học Đã Tạo
Create Or Alter View v_XemKhoaHocDaTao
as select KHOAHOC.MaKhoaHoc,TenKhoaHoc,TrinhDoDauVao,MoTa,GIANGVIEN.MaGiangVien, KHOAHOC.MinhHoa From GIANGVIEN 
join KHOAHOC on KHOAHOC.MaTacGia=GIANGVIEN.MaGiangVien
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
GO

--View xem danh sách bài tập sinh viên nộp
CREATE OR ALTER VIEW vw_baitapsinhvien
AS
SELECT LamBaiTap.TenBaiNop,HOCVIEN.MaHocVien,concat(HOCVIEN.MaHocVien,'_',NGUOIDUNG.HoTen) as HoTen, BAITAP.TenBaiTap, BAITAP.MaBaiHoc, ThoiGianHoanThanh
FROM LAMBAITAP
INNER JOIN  BAITAP 
ON LAMBAITAP.MaBaiHoc = BAITAP.MaBaiHoc AND LAMBAITAP.TenBaiTap = BAITAP.TenBaiTap
INNER JOIN HOCVIEN
on HOCVIEN.MaHocVien=LAMBAITAP.MaNguoiDung	
join NGUOIDUNG
on HOCVIEN.MaHocVien=NGUOIDUNG.MaNguoiDung
GO