CREATE OR ALTER PROC sp_XemDanhSachKH
@makhoahoc int 
as
begin
	select *From KHOAHOC
	join BAIHOC 
	on BAIHOC.MaBaiHoc=KHOAHOC.MaKhoaHoc
	where KHOAHOC.MaKhoaHoc=@makhoahoc
end