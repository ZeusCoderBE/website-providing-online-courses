CREATE OR ALTER TRIGGER tr_themDangKy ON THANHTOAN
AFTER INSERT
AS
BEGIN
	DECLARE @mand INT, @makh INT
	SELECT @mand=i.MaNguoiDung, @makh=i.MaKhoaHoc
	FROM inserted i
	INSERT INTO DANGKY VALUES(@mand, @makh,0)
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
Go
--Tạo thẻ cho giảng viên
Create Or Alter Trigger tg_CreateCardVisaGV
on GiangVien for insert
as 
begin
	declare @magiangvien int
	declare @mathe varchar(10)
    select @mathe=NGUOIDUNG.SDT,@magiangvien=inserted.MaGiangVien From inserted
	join NGUOIDUNG on inserted.MaGiangVien=NGUOIDUNG.MaNguoiDung
	insert into THE(MaThe,SoDu,MaNguoiDung)
	values(@mathe,5,@magiangvien)

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
-- KHI CẬP NHẬT TRẠNG THÁI BẢNG 'HOC' THÌ CẬP NHẬT TIẾN ĐỘ CHO BẢNG DANGKY
CREATE OR ALTER TRIGGER tr_updateTienDo ON HOC
FOR UPDATE
AS
DECLARE @mabaihoc INT
DECLARE @manguoidung INT
SELECT @mabaihoc= i.MaBaiHoc , @manguoidung = i.MaNguoiDung
FROM inserted i
BEGIN
    DECLARE @tiendo REAL
	DECLARE @countbaihoc INT
	DECLARE @countbaidahoc INT

	SELECT @countbaihoc= count(*)
	FROM BAIHOC as bh
	JOIN KHOAHOC as kh ON kh.MaKhoaHoc = bh.MaKhoaHoc
	WHERE bh.MaKhoaHoc = (SELECT Distinct MaKhoaHoc 
	                      FROM BAIHOC AS bh
						  WHERE bh.MaBaiHoc = @mabaihoc)

	SELECT @countbaidahoc= count(*)
	FROM BAIHOC as bh
	JOIN HOC as hoc ON hoc.MaBaiHoc = bh.MaBaiHoc
	JOIN KHOAHOC as kh ON kh.MaKhoaHoc = bh.MaKhoaHoc
	WHERE hoc.TrangThai = 'Done' and hoc.MaNguoiDung = @manguoidung and bh.MaKhoaHoc = (SELECT Distinct MaKhoaHoc 
	                      FROM BAIHOC AS bh
						  WHERE bh.MaBaiHoc = @mabaihoc)

	IF @countbaihoc >0
	   BEGIN
	       SET @tiendo = @countbaidahoc * 100 / @countbaihoc
           UPDATE DANGKY SET TienDo = @tiendo WHERE MaNguoiDung = @manguoidung
       END
	ELSE
	   UPDATE DANGKY SET TienDo = 0 WHERE MaNguoiDung = @manguoidung 
END