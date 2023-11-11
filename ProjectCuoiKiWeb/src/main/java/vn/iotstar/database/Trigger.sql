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
--Tao The cho Nguoi dung
Create Or Alter Trigger tg_CreateCardVisa
on HocVien for insert
as 
begin
	declare @mahocvien int
	declare @mathe int 
    select @mathe=NGUOIDUNG.Sdt,@mahocvien=inserted.MaHocVien From inserted
	join NGUOIDUNG on inserted.MaHocVien=NGUOIDUNG.MaNguoiDung
	insert into THE(MaThe,SoDu,MaNguoiDung)
	values(@mathe,5,@mahocvien)

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
GO

--Xóa những tham chiếu tới bài học trước khi xóa bài học
CREATE OR ALTER TRIGGER tr_xoaBaiHoc ON BAIHOC
INSTEAD OF DELETE
AS
DECLARE @mabaihoc INT
SELECT @mabaihoc=d.MaBaiHoc
FROM deleted d
BEGIN
	DELETE FROM LAMBAITAP WHERE MaBaiHoc = @mabaihoc
	DELETE FROM BAITAP WHERE MaBaiHoc = @mabaihoc
	DELETE FROM HOC WHERE MaBaiHoc = @mabaihoc
	DELETE FROM DINHKEM WHERE MaBaiHoc = @mabaihoc
	DELETE FROM BAIHOC WHERE MaBaiHoc = @mabaihoc
END
GO