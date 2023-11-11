CREATE OR ALTER TRIGGER tr_themDangKy ON THANHTOAN
AFTER INSERT
AS
BEGIN
	DECLARE @mand INT, @makh INT
	SELECT @mand=i.MaNguoiDung, @makh=i.MaKhoaHoc
	FROM inserted i
	INSERT INTO DANGKY VALUES(@mand, @makh)
END
GO
--Tao The cho Học Viên
Create Or Alter Trigger tg_CreateCardVisa
on HocVien for insert
as 
begin
	declare @mahocvien int
	declare @mathe varchar(10)
    select @mathe=NGUOIDUNG.Sdt,@mahocvien=inserted.MaHocVien From inserted
	join NGUOIDUNG on inserted.MaHocVien=NGUOIDUNG.MaNguoiDung
	insert into THE(MaThe,SoDu,MaNguoiDung)
	values(@mathe,5,@mahocvien)

end 
--Tạo thẻ cho giảng viên
--Tao The cho Học Viên
Create Or Alter Trigger tg_CreateCardVisaGV
on GiangVien for insert
as 
begin
	declare @magiangvien int
	declare @mathe varchar(10)
    select @mathe=NGUOIDUNG.Sdt,@magiangvien=inserted.MaGiangVien From inserted
	join NGUOIDUNG on inserted.MaGiangVien=NGUOIDUNG.MaNguoiDung
	insert into THE(MaThe,SoDu,MaNguoiDung)
	values(@mathe,0,@magiangvien)

end
go
--Trigger các dòng tham chiếu trước khi xoá 1 khoá học
Create or Alter Trigger tg_XoaRangBuocTCKhoaHoc
on KhoaHoc instead of delete 
as
begin
	declare @makhoahoc int 
	--set Null cho Bài Học
	select @makhoahoc=deleted.MaKhoaHoc From deleted 
	update BAIHOC set MaKhoaHoc=null 
	where MaKhoaHoc=@makhoahoc
	--Xoá Biên Soạn
	delete From BIENSOAN
	where MaKhoaHoc=@makhoahoc
	--Xoá Đăng Ký
	delete From DANGKY 
	where MaKhoaHoc=@makhoahoc
	--Xoá Thanh Toán
	delete From THANHTOAN
	where MaKhoaHoc=@makhoahoc
	--Xoá Giỏ Hàng
	delete From GIOHANG
	where MaKhoaHoc=@makhoahoc
	--Xoá Khoá Học
	delete From KHOAHOC
	where KHOAHOC.MaKhoaHoc=@makhoahoc
end

