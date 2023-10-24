Create Trigger tg_inserthocvien on NguoiDung
after insert 
as
begin
	declare @manguoidung int
	select @manguoidung=n.MaNguoiDung From inserted as n
	insert into HOCVIEN(MaHocVien,LoaiTaiKhoa) 
	values(@manguoidung,N'Đồng')
end