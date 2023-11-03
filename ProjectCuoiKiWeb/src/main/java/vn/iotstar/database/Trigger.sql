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

