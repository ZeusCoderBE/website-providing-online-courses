--Trigger này có tác dụng check email người dùng nhập vào có bị trùng với csdl đang có hay không.
CREATE TRIGGER TRG_CheckDuplicateEmail
ON NGUOIDUNG
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Email VARCHAR(64);
    
    -- Lấy email mới từ bảng 'inserted'
    SELECT @Email = Email
    FROM inserted;

    -- Kiểm tra xem email mới có trùng với email nào trong bảng không
    IF EXISTS (SELECT 1 FROM NGUOIDUNG WHERE Email = @Email)
    BEGIN
        RAISERROR ('Email đã tồn tại trong bảng NGUOIDUNG.', 16, 1);
        ROLLBACK;
    END
END;