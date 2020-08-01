 --1: Kiểm tra một học phần có những ngành nào phải phọc 
create proc kt_HP @MaHP nchar(10)
as
select HocPhan.MaHP,TenNganh FROM HocPhan,CTDaoTao,Nganh
where	HocPhan.MaHP=CTDaoTao.MaHP and CTDaoTao.MaNganh=Nganh.MaNganh AND HocPhan.MaHP=@MaHP
EXEC kt_HP 'MI1030'
--2: Kiểm tra giảng viên dạy lớp học phần nào 
create proc kT_GV @maGV nchar(10)
as
select MaGV,TenGV,MaLopHP from GiangVien,LopHP
where MaGV=GVDay and MaGV=@maGV
EXEC kt_GV 'GV01'
--3: Kiểm tra số lượng sinh viên viên của một lớp sinh viên (UDF)
CREATE FUNCTION SLSVCuaLopSV(@MaLop nchar(10))
RETURNS int 
AS
BEGIN
DECLARE @int int
SET @int  = (SELECT count(MSSV) FROM dbo.SinhVien WHERE MaLopSV = @MaLop)
RETURN @int 
END
PRINT dbo.SLSVCuaLopSV('MI05')
--4: Kiểm tra số lượng sinh viên của một lớp học phần (UDF)
CREATE FUNCTION SlSVCuaLopHP(@MalopHp nchar(10))
RETURNS int
AS
BEGIN
DECLARE @int INT
SET @int = (SELECT COUNT(MSSV) FROM dbo.DiemHP WHERE MaLopHP = @MalopHp )
RETURN @int
END

print dbo.SlSVCuaLopHP('105370')

--5: thống kê sinh viên học những học phần nào trong một học kỳ cho trước
CREATE PROC HP_Hoc_Trong_Ky @hocky NCHAR(10) , @MSSV NCHAR(10)
AS
SELECT a.MSSV, B.MaLopHP , B.MaHP , c.TenHP FROM dbo.DiemHP AS a , dbo.LopHP AS b , dbo.HocPhan AS c
WHERE  a.MaLopHP = B.MaLopHP AND b.MaHP= c.MaHP AND a.MSSV = @MSSv AND b.HocKy = @hocky

EXEC HP_Hoc_Trong_Ky '20161', '20161898'
--6: đưa ra lịch thi của một học phần cho trước
CREATE PROC Lich_Thi_HP @MaHP NCHAR(10)
AS
SELECT a.MaLopThi, a.PhongThi , a.Ngthi ,a.KipThi , a.MaLopHP , a.GVcoithi , a.GVchamthi FROM lopthi AS a, dbo.LopHP AS b
WHERE a.MaLopHP = b.MaLopHP AND b.MaHP = @MaHP
EXEC Lich_Thi_HP 'MI1033'

--7: đưa ra lịch thi của một sinh viên cho trước (UDF)
CREATE Function Lich_Thi_SV (@MSSV NCHAR(10))
RETURNS table
AS
RETURN (SELECT a.MaLopThi, a.PhongThi , a.Ngthi ,a.KipThi , a.MaLopHP , a.GVcoithi , a.GVchamthi FROM lopthi AS a, dbo.LopHP AS b , dbo.DiemHP AS c
WHERE a.MaLopHP = b.MaLopHP AND c.MaLopHP=b.MaLopHP AND c.MSSV= @MSSV)

SELECT*from Lich_Thi_SV('20161898')



--8: Cập nhật điểm chữ của một lớp học phần 
CREATE PROC CN_Diem_LopHP @MaLopHP NCHAR(10)
AS
BEGIN
UPDATE dbo.DiemHP
SET DiemTK = (DiemQT*(1-TrongSo) + DiemKT*Trongso) 
FROM dbo.HocPhan , dbo.LopHP WHERE dbo.LopHP.MaHP = dbo.HocPhan.MaHP AND dbo.LopHP.MaLopHP = dbo.DiemHP.MaLopHP AND DiemHP.MaLopHP =@MaLopHP
UPDATE dbo.DiemHP
SET Diemchu = 
CASE
WHEN DiemTK >=0 AND DiemTK<4 THEN 'F'
WHEN DiemTK >=4 AND DiemTK<5 THEN 'D'
WHEN DiemTK >=5 AND DiemTK<5.5 THEN 'D+'
WHEN DiemTK >=5.5 AND DiemTK<6.5 THEN 'C'
WHEN DiemTK >=6.5 AND DiemTK<7 THEN 'C+'
WHEN DiemTK >=7 AND DiemTK<8 THEN 'B'
WHEN DiemTK >=8 AND DiemTK<8.5 THEN 'B+'
WHEN DiemTK >=8.5 AND DiemTK<9.5 THEN 'A'
WHEN DiemTK >=9.5 AND DiemTK<=10 THEN 'A+'
END
END

EXEC dbo.CN_Diem_LopHP @MaLopHP = N'105370' -- nchar(10)
select*from DiemHP

--9: Đưa ra bảng điểm của một sinh viên (UDF)
CREATE FUNCTION Bang_Diem_Cua_SV(@MSSV nchar(10))
RETURNS TABLE
AS
RETURN select MSSV,TenHP, DiemQT,DiemKT,DiemChu from DiemHP,HocPhan,LopHP
  where HocPhan.MaHP=LopHP.MaHP and LopHP.MaLopHP=DiemHP.MaLopHP and MSSV=@MSSV 

--10: thống kê điểm trung bình của một học phần (UDF)
CREATE FUNCTION Diem_TB_HP(@MaHP nchar(10))
RETURNS @Diem_TB_HP TABLE ( MaHP NCHAR(10) ,[Điểm trung bình] float )
AS
BEGIN
DECLARE @tb FLOAT 
SET @tb =( SELECT SUM(a.DiemTK)/COUNT(a.MSSV) FROM dbo.DiemHP AS a , dbo.LopHP AS b
   WHERE a.MaLopHP = b.MaLopHP AND b.MaHP =@MaHP GROUP BY b.HocKy)
INSERT INTO @Diem_TB_HP VALUES (@MaHP , @tb)
RETURN 
END

 SELECT*from dbo.Diem_TB_HP('MI1033')

----11 thống điểm trung bình của một lớp học phần (UDF)
CREATE FUNCTION Diem_TB_LopHP(@MaLopHP nchar(10))
RETURNS @Diem_TB_HP TABLE ( MaHP NCHAR(10) ,[Điểm trung bình] float )
AS
BEGIN
DECLARE @tb FLOAT 
SET @tb =( SELECT SUM(a.DiemTK)/COUNT(a.MSSV) FROM dbo.DiemHP AS a , dbo.LopHP AS b
   WHERE a.MaLopHP = b.MaLopHP AND b.MaLopHP =@MaLopHP GROUP BY b.HocKy)
INSERT INTO @Diem_TB_HP VALUES (@MaLopHP , @tb)
RETURN 
END

SELECT*FROM dbo.Diem_TB_LopHP('105370')





--12: thống kê điểm CPA trung bình của một lớp sinh viên ứng với học kỳ cho trước . 
CREATE PROC Diem_TB_LopSV @MaLopSV NCHAR(10) , @HocKy NCHAR(10)
AS
BEGIN
SELECT a.MaLopSV , SUM(b.CPA)/COUNT(B.MSSV) FROM dbo.SinhVien AS a , dbo.TongKet AS b
WHERE a.MSSV= B.MSSV AND a.MaLopSV = @MaLopSV AND B.HocKy = @HocKy
group by a.MaLopSV,hocky
END
EXEC Diem_TB_LopSV 'MI05','20161'
select*from HocKi

--13: cập nhật mức cảnh cáo của sinh viên 
ALTER PROC CN_SV_BiCC @hocky NCHAR(10)
AS
BEGIN
INSERT dbo.CanhCao SELECT MSSV,HocKy,SUM(SoTC) FROM dbo.HocPhan , dbo.LopHP , dbo.DiemHP WHERE dbo.HocPhan.MaHP = dbo.LopHP.MaHP AND dbo.LopHP.MaLopHP=DiemHP.MaLopHP AND DiemChu = 'F' GROUP by MSSV, HocKy

UPDATE dbo.CanhCao
SET MucCC=
CASE 
WHEN muccc > 16 THEN  2
WHEN muccc >8 THEN 1
WHEN muccc <=8 THEN 0
END
--DELETE FROM dbo.CanhCao WHERE MucCC =0
 UPDATE dbo.CanhCao
 SET muccc = (select SUM(MucCC) FROM dbo.CanhCao WHERE MSSV=MSSV GROUP BY MSSV) 
 WHERE HocKy = @HocKy
end

EXEC CN_SV_BiCC '20161'
select*from CanhCao
--14: thống kê sinh viên bị cảnh cáo các mức cảnh cảnh cáo nào đó trong một học kỳ 
Create proc Thong_Ke_MucCc_SV  @HocKi nchar(10) , @Muccc int 
AS
BEGIN
SELECT sinhvien.MSSV, HoTenSV, MucCC FROM sinhvien , dbo.CanhCao WHERE CanhCao.MSSV = SinhVien.MSSV AND @Muccc= MucCC AND HocKy = @HocKi
END
EXEC Thong_Ke_MucCc_SV '20161', 1 

--15: thống kê số tín chỉ còn nợ của sinh viên (UDF)
 CREATE  FUNCTION So_TC_No (@MSSV nchar(10))
RETURNS @TCno TABLE (MSSV nchar(10), [Số TC Nợ] int)
AS 
BEGIN
DECLARE @tc INT 
SET @tc = (SELECT SUM(c.SoTC) FROM dbo.DiemHP AS a, dbo.LopHP AS b , dbo.HocPhan AS c
WHERE a.MaLopHP = b.MaLopHP AND b.MaHP = c.MaHP AND  a.MSSV = @MSSV AND a.DiemChu = 'F')
INSERT INTO @TCno VALUES (@MSSV,@tc)
return
end

SELECT*FROM So_TC_No('20161898')
--16: thống kê học phần sinh viên còn nợ (UDF)
CREATE  FUNCTION Thong_Ke_HP_No_SV(@MSSV nchar(10))
RETURNS TABLE
AS
RETURN (SELECT c.MaHP, c.TenHP FROM dbo.DiemHP AS a, dbo.LopHP AS b , dbo.HocPhan AS c
WHERE a.MaLopHP = b.MaLopHP AND b.MaHP = c.MaHP AND  a.MSSV = @MSSV AND a.DiemChu = 'F')

SELECT*FROM Thong_Ke_HP_No_SV('20161898')



--17: cập nhật GPA cho sinh viên 
CREATE PROC CN_GPA @hocky NCHAR(10)
AS
BEGIN
UPDATE dbo.DiemHP
SET DiemTk= 
case
WHEN diemchu ='F' THEN 0*SoTC
WHEN diemchu ='D' THEN 1*SoTC
WHEN diemchu ='D+' THEN 1.5*SoTC
WHEN diemchu ='C' THEN 2*SoTC
WHEN diemchu ='C+' THEN 2.5*SoTC
WHEN diemchu ='B' THEN 3*SoTC
WHEN diemchu ='B+' THEN 3.5*SoTC
WHEN diemchu ='A' OR diemchu = 'A+' THEN 4*SoTC
END
FROM dbo.HocPhan, dbo.LopHP WHERE HocPhan.MaHP = dbo.LopHP.MaHP AND dbo.LopHP.MaLopHP = dbo.DiemHP.MaLopHP

UPDATE dbo.TongKet
SET GPA = (SELECT sum(diemTk)/SUM(SoTC) FROM diemhp , dbo.HocPhan, dbo.LopHP WHERE dbo.HocPhan.MaHP= dbo.LopHP.MaHP AND dbo.LopHP.MaLopHP = dbo.DiemHP.MaLopHP AND TongKet.MSSV =dbo.DiemHP.MSSV GROUP BY dbo.DiemHP.MSSV)
WHERE HocKy = @hocky

UPDATE dbo.DiemHP
SET DiemTK = (DiemQT*(1-TrongSo) + DiemKT*Trongso) 
FROM dbo.HocPhan , dbo.LopHP WHERE dbo.LopHP.MaHP = dbo.HocPhan.MaHP AND dbo.LopHP.MaLopHP = dbo.DiemHP.MaLopHP 
END

EXEC CN_GPA '20161'
select*from TongKet
SELECT*FROM dbo.TongKet
--18 Cập nhập điểm CPA cho sinh viên 
Create PROC CN_CPA @hocky NCHAR(10)
AS
BEGIN
UPDATE dbo.DiemHP
SET DiemTk= 
case
WHEN diemchu ='F' THEN 0*SoTC
WHEN diemchu ='D' THEN 1*SoTC
WHEN diemchu ='D+' THEN 1.5*SoTC
WHEN diemchu ='C' THEN 2*SoTC
WHEN diemchu ='C+' THEN 2.5*SoTC
WHEN diemchu ='B' THEN 3*SoTC
WHEN diemchu ='B+' THEN 3.5*SoTC
WHEN diemchu ='A' OR diemchu = 'A+' THEN 4*SoTC
END
FROM dbo.HocPhan, dbo.LopHP WHERE HocPhan.MaHP = dbo.LopHP.MaHP AND dbo.LopHP.MaLopHP = dbo.DiemHP.MaLopHP

UPDATE dbo.TongKet
SET CPA = (SELECT sum(diemTk)/SUM(SoTC) FROM diemhp , dbo.HocPhan, dbo.LopHP WHERE dbo.HocPhan.MaHP= dbo.LopHP.MaHP AND dbo.LopHP.MaLopHP = dbo.DiemHP.MaLopHP AND TongKet.MSSV =dbo.DiemHP.MSSV GROUP BY dbo.DiemHP.MSSV)
WHERE HocKy <= @hocky

UPDATE dbo.DiemHP
SET DiemTK = (DiemQT*(1-TrongSo) + DiemKT*Trongso) 
FROM dbo.HocPhan , dbo.LopHP WHERE dbo.LopHP.MaHP = dbo.HocPhan.MaHP AND dbo.LopHP.MaLopHP = dbo.DiemHP.MaLopHP 
END
EXEC CN_CPA '20162'
select*from TongKet
select*from DiemHP
--19 xem sinh viên tốt nghiêp loại gì (UDF)
CREATE FUNCTION Xep_Loai_TotNghiep(@MSSV nchar(10))
RETURNs  @tn TABLE(MSSV nchar(10), [Loại] nvarchar(10))
AS
BEGIN
DECLARE @loai NVARCHAR(20) , @CPA FLOAT , @hockimax NCHAR(10)
SET @hockimax = ( SELECT MAX(HocKy) FROM dbo.TongKet WHERE MSSV = @MSSV)
SET @CPA = (SELECT CPA FROM dbo.TongKet WHERE MSSV = @MSSV AND HocKy = @hockimax)
 SET @loai =
 CASE
 WHEN @CPA <1 THEN N'Kém'
 WHEN @CPA>=1 AND @CPA <1.5 THEN N'Yếu'
 WHEN @CPA>=1.5 AND @CPA <2 THEN N'Trung bình yếu'
 WHEN @CPA>=2 AND @CPA <2.5 THEN N'Trung bình'
 WHEN @CPA>=2.5 AND @CPA <3.2 THEN N'Khá'
 WHEN @CPA>=3.2 AND @CPA <3.6 THEN N'Yếu'
 WHEN @CPA>=3.6 AND @CPA <=4 THEN N'Yếu'
 end
 INSERT INTO @tn VALUES (@MSSV, @loai)
 RETURN 
end 
SELECT*FROM dbo.Xep_Loai_TotNghiep('20161898')

--20: thống kê số lượng sinh viên theo loại bằng nào đó khi xét tốt nghiệp. (UDF)
Create FUNCTION SL_Loai_Bang_TotNghiep()
RETURNs  @tn TABLE( [Loại] nvarchar(20) , [Số Lượng] int)
AS
BEGIN
DECLARE  @SLCPA FLOAT , @hockimax NCHAR(10)
SET @hockimax = ( SELECT MAX(HocKy) FROM dbo.TongKet)
SET @SLCPA = (SELECT COUNT(CPA) FROM dbo.TongKet WHERE HocKy = @hockimax AND CPA < 1 )
INSERT INTO @tn VALUES (N'Kém', @SLCPA);
SET @SLCPA = (SELECT COUNT(CPA) FROM dbo.TongKet WHERE HocKy = @hockimax AND CPA >=1 AND CPA <1.5)
INSERT INTO @tn VALUES (N'yếu', @SLCPA);
SET @SLCPA = (SELECT COUNT(CPA) FROM dbo.TongKet WHERE HocKy = @hockimax AND CPA >=1.5 AND CPA <2)
INSERT INTO @tn VALUES (N'Trung bình yếu ', @SLCPA);
SET @SLCPA = (SELECT COUNT(CPA) FROM dbo.TongKet WHERE HocKy = @hockimax AND CPA >=2 AND CPA <2.5)
INSERT INTO @tn VALUES (N'Trung bình', @SLCPA);
SET @SLCPA = (SELECT COUNT(CPA) FROM dbo.TongKet WHERE HocKy = @hockimax AND CPA >=2.5 AND CPA <3.2)
INSERT INTO @tn VALUES (N'Khá', @SLCPA);
SET @SLCPA = (SELECT COUNT(CPA) FROM dbo.TongKet WHERE HocKy = @hockimax AND CPA >=3.2 AND CPA <3.6)
INSERT INTO @tn VALUES (N'Giỏi', @SLCPA);
SET @SLCPA = (SELECT COUNT(CPA) FROM dbo.TongKet WHERE HocKy = @hockimax AND CPA >=3.6 AND CPA <=4)
INSERT INTO @tn VALUES (N'Xuất sắc', @SLCPA);
 RETURN 
end 

SELECT*FROM SL_Loai_Bang_TotNghiep()

--21 Thống kê sinh viên học lại của một học phần
alter proc sinhvienhoclai @MaHP nchar(10)
  as
  select COunt(MSSV)as soluong from DiemHP,LopHP,HocPhan 
  where LopHP.MaHP=HocPhan.MaHP and LopHP.MaLopHP=DiemHP.MaLopHP and HocPhan.MaHP=@MaHP 
  and DiemChu='F'
  exec sinhvienhoclai 'MI1033'
--22Thống kê số lượng sinh viên theo từng loại điểm của lớp học phần
Create proc thongkediemchu @diemchu nchar(10) , @lophp NCHAR(10)
  as
  select Count(MSSV) as N'Số lượng sinh viên' from DiemHP 
  where  DiemChu=@diemchu AND MaLopHP = @lophp
  exec thongkediemchu 'A+','105371'

--23 Thống kế số lượng giảng viên của từng viện 
create PROC  SLGVTV
  as  
  begin 
  select Vien.MaVien,TenVien,Count(GiangVien.MaGV) as N'Số lượng giảng viên' from GiangVien,Vien
  where Vien.MaVien= GiangVien.MaVien 
  GROUP BY Vien.MaVien,TenVien
 end 
 exec SLGVTV

--24: Thống kê sinh viên không đạt chuẩn toeic năm 2
Create proc Chuantoiec
	as
	select SinhVien.MSSV,SinhVien.HoTenSV ,(DiemDoc+DiemNghe)as N'Tổng Điểm' 
	from SinhVien,DiemToeic,QuyDoiDiemDoc,QuyDoiDiemNghe
	where SinhVien.MSSV=DiemToeic.MSSV and DiemToeic.SoCauDoc=QuyDoiDiemDoc.SoCauDoc and 
	DiemToeic.SoCauNghe=QuyDoiDiemNghe.SoCauNghe and 
	(DiemToeic.MSSV like '2016%') and  (DiemDoc+DiemNghe)<=350 
	exec Chuantoiec

--25: thống kê sinh viên đạt học bổng 
CREATE proc thongkesinhvienhocbong @malopsv nchar(10) , @hocki nchar(10)
	as
	select top 3  SinhVien.MSSV, SinhVien.HoTenSV , GPA from LopSV,SinhVien,TongKet
	where SinhVien.MSSV=TongKet.MSSV and LopSV.MaLopSV=SinhVien.MaLopSV and LopSV.MaLopSV=@malopsv and HocKy=@hocki
	order by GPA DESC 
	EXEC thongkesinhvienhocbong 'MI05','20161'
	SELECT*FROM dbo.TongKet
--26: thống kê số lượng sinh viên bị cảnh cáo ở các mức(UDF)
CREATE FUNCTION SL_SV_CC()
RETURNS @cc TABLE([Mức 1] int ,[Mức 2] int,[Mức 3] int )
AS
BEGIN
DECLARE @sl1 INT ,@sl2 INT ,@sl3 INT 
SET @sl1 = (SELECT COUNT(MSSV) FROM dbo.CanhCao WHERE MucCC = '1')
SET @sl2 = (SELECT COUNT(MSSV) FROM dbo.CanhCao WHERE MucCC = '2')
SET @sl3 = (SELECT COUNT(MSSV) FROM dbo.CanhCao WHERE MucCC = '3')
INSERT INTO @cc VALUES(@sl1,@sl2,@sl3)
RETURN
END

SELECT*FROM SL_SV_CC()

--27: đưa ra danh sách giảng viên của một viện (UDF)
CREATE FUNCTION DS_GV_Vien (@MaVien nchar(10))
RETURNS TABLE
AS
RETURN (SELECT MaGV , TenGV FROM dbo.GiangVien WHERE @Mavien = MaVien)

SELECT*FROM DS_GV_Vien('BK01')
--28: đưa ra danh sách sinh viên của một lớp sinh viên (UDF)
CREATE FUNCTION DS_Lop (@Malop nchar(10))
RETURNS TABLE
AS
RETURN (SELECT MSSV , HoTenSV , NgSinh FROM dbo.SinhVien WHERE @Malop = MaLopSV)

SELECT*FROM DS_Lop('MI05')

--29: đưa ra chương trình đào tạo của sinh viên(UDF)
CREATE FUNCTION CT_DT_SV(@MSSV nchar(10))
RETURNS TABLE
AS
RETURN (SELECT c.MaNganh , c.MaHP ,c.KyHocChuan FROM dbo.SinhVien AS a , dbo.LopSV AS b , dbo.CTDaoTao AS c 
WHERE a.MaLopSV = b.MaLopSV AND b.MaNganh = c.MaNganh AND a.MSSV = @MSSV)
SELECT*FROM CT_DT_SV('20161898')
 
--30: Đưa ra học phần tương đương của một học phần cho trước (UDF)
CREATE FUNCTION HP_Tuong_Duong(@MaHP nchar(10))
RETURNS TABLE
AS
RETURN (SELECT*FROM dbo.HPTuongDuong WHERE MaHP= @MaHP)

SELECT*FROM HP_Tuong_Duong('IT1010')
 select*from DiemHP
 select*from LopHP
 select*from DiemToeic
 create proc ShowCC 
 as
 select CanhCao.MSSV,HoTenSV,CanhCao.HocKy,GPA,CPA, MucCC from CanhCao,SinhVien,TongKet where
 SinhVien.MSSV=CanhCao.MSSV and CanhCao.MSSV=TongKet.MSSV and CanhCao.HocKy=TongKet.HocKy 
 exec showCC 
 create proc TKCC @MSSV nchar(10)
 as
 select CanhCao.MSSV,HoTenSV,CanhCao.HocKy,GPA,CPA, MucCC from CanhCao,SinhVien,TongKet where
 SinhVien.MSSV=CanhCao.MSSV and CanhCao.MSSV=TongKet.MSSV and CanhCao.HocKy=TongKet.HocKy and CanhCao.MSSV=@MSSV 
 exec TKCC '20161898'
 alter proc TKLopSV @MaLopSV nchar(10)
 as
 select SinhVien.* ,LopSV.TenLopSV from SinhVien,LopSV where SinhVien.MaLopSV=LopSV.MaLopSV and LopSV.MaLopSV=@MaLopSV
 exec TKLopSV 'MI05'
 --111
 alter proc sinhvienhoclaihp @MaHP nchar(10)
  as
  select DiemHP.MSSV , HotenSV as N'Họ Tên SV',TenLopSV as N'Lớp Sinh Viên',DiemChu as N'Điểm Chữ' from DiemHP,LopHP,HocPhan,SinhVien,LopSV
   
  where SinhVien.MSSV=DiemHP.MSSV and SinhVien.MaLopSV=LopSV.MaLopSV and LopHP.MaHP=HocPhan.MaHP and LopHP.MaLopHP=DiemHP.MaLopHP and HocPhan.MaHP=@MaHP 
  and DiemChu='F'
  exec sinhvienhoclaihp 'MI1033'
  create function tksinhvienhoclai(@MaHP nchar(10))
  returns int
  as
  begin
  declare @a int 
  set @a=(select COunt(MSSV) from DiemHP,LopHP,HocPhan 
  where LopHP.MaHP=HocPhan.MaHP and LopHP.MaLopHP=DiemHP.MaLopHP and HocPhan.MaHP=@MaHP 
  and DiemChu='F')
  return @a
  end
  print dbo.tksinhvienhoclai ('MI1033')
