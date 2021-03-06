USE [master]
GO
/****** Object:  Database [QuanLyDiem]    Script Date: 27/12/2018 9:33:15 SA ******/
CREATE DATABASE [QuanLyDiem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyDiem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyDiem.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyDiem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyDiem_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyDiem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyDiem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyDiem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyDiem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDiem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyDiem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDiem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyDiem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyDiem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyDiem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyDiem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyDiem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyDiem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyDiem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyDiem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyDiem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyDiem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyDiem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyDiem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyDiem] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyDiem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyDiem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyDiem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyDiem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyDiem]
GO
/****** Object:  StoredProcedure [dbo].[CN_CPA]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[CN_CPA] @hocky NCHAR(10)
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

GO
/****** Object:  StoredProcedure [dbo].[CN_Diem_LopHP]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CN_Diem_LopHP] @MaLopHP NCHAR(10)
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

GO
/****** Object:  StoredProcedure [dbo].[CN_GPA]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CN_GPA] @hocky NCHAR(10)
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


GO
/****** Object:  StoredProcedure [dbo].[CN_SV_BiCC]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CN_SV_BiCC] @hocky NCHAR(10)
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
DELETE FROM dbo.CanhCao WHERE MucCC =0
 UPDATE dbo.CanhCao
 SET muccc = (select SUM(MucCC) FROM dbo.CanhCao WHERE MSSV=MSSV GROUP BY MSSV) 
 WHERE HocKy = @HocKy
end
GO
/****** Object:  StoredProcedure [dbo].[Chuantoiec]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Chuantoiec]
	as
	select SinhVien.MSSV,SinhVien.HoTenSV ,(DiemDoc+DiemNghe)as N'Tổng Điểm' 
	from SinhVien,DiemToeic,QuyDoiDiemDoc,QuyDoiDiemNghe
	where SinhVien.MSSV=DiemToeic.MSSV and DiemToeic.SoCauDoc=QuyDoiDiemDoc.SoCauDoc and 
	DiemToeic.SoCauNghe=QuyDoiDiemNghe.SoCauNghe and 
	(DiemToeic.MSSV like '2016%') and  (DiemDoc+DiemNghe)<=350 

GO
/****** Object:  StoredProcedure [dbo].[Diem_TB_LopSV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Diem_TB_LopSV] @MaLopSV NCHAR(10) , @HocKy NCHAR(10)
AS
BEGIN
SELECT a.MaLopSV , SUM(b.CPA)/COUNT(B.MSSV) FROM dbo.SinhVien AS a , dbo.TongKet AS b
WHERE a.MSSV= B.MSSV AND a.MaLopSV = @MaLopSV AND B.HocKy = @HocKy
group by a.MaLopSV,hocky
END
GO
/****** Object:  StoredProcedure [dbo].[HP_Hoc_Trong_Ky]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[HP_Hoc_Trong_Ky] @hocky NCHAR(10) , @MSSV NCHAR(10)
AS
SELECT a.MSSV, B.MaLopHP , B.MaHP , c.TenHP FROM dbo.DiemHP AS a , dbo.LopHP AS b , dbo.HocPhan AS c
WHERE  a.MaLopHP = B.MaLopHP AND b.MaHP= c.MaHP AND a.MSSV = @MSSv AND b.HocKy = @hocky
GO
/****** Object:  StoredProcedure [dbo].[kT_GV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[kT_GV] @maGV nchar(10)
as
select MaGV,TenGV,MaLopHP from GiangVien,LopHP
where MaGV=GVDay and MaGV=@maGV
GO
/****** Object:  StoredProcedure [dbo].[kt_HP]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[kt_HP] @MaHP nchar(10)
as
select HocPhan.MaHP,TenNganh FROM HocPhan,CTDaoTao,Nganh
where	HocPhan.MaHP=CTDaoTao.MaHP and CTDaoTao.MaNganh=Nganh.MaNganh AND HocPhan.MaHP=@MaHP
GO
/****** Object:  StoredProcedure [dbo].[Lich_Thi_HP]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Lich_Thi_HP] @MaHP NCHAR(10)
AS
SELECT a.MaLopThi, a.PhongThi , a.Ngthi ,a.KipThi , a.MaLopHP , a.GVcoithi , a.GVchamthi FROM lopthi AS a, dbo.LopHP AS b
WHERE a.MaLopHP = b.MaLopHP AND b.MaHP = @MaHP
GO
/****** Object:  StoredProcedure [dbo].[sinhvienhoclai]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sinhvienhoclai] @MaHP nchar(10)
  as
  select COunt(MSSV) from DiemHP,LopHP,HocPhan 
  where LopHP.MaHP=HocPhan.MaHP and LopHP.MaLopHP=DiemHP.MaLopHP and HocPhan.MaHP=@MaHP 
  and DiemChu='F'

GO
/****** Object:  StoredProcedure [dbo].[SLGVTV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC  [dbo].[SLGVTV]
  as  
  begin 
  select Vien.MaVien,TenVien,Count(GiangVien.MaGV) as N'Số lượng giảng viên' from GiangVien,Vien
  where Vien.MaVien= GiangVien.MaVien 
  GROUP BY Vien.MaVien,TenVien
 end 

GO
/****** Object:  StoredProcedure [dbo].[Thong_Ke_MucCc_SV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Thong_Ke_MucCc_SV]  @HocKi nchar(10) , @Muccc int 
AS
BEGIN
SELECT sinhvien.MSSV, HoTenSV, MucCC FROM sinhvien , dbo.CanhCao WHERE CanhCao.MSSV = SinhVien.MSSV AND @Muccc= MucCC AND HocKy = @HocKi
END

GO
/****** Object:  StoredProcedure [dbo].[thongkediemchu]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[thongkediemchu] @diemchu nchar(10) , @lophp NCHAR(10)
  as
  select Count(MSSV) as N'Số lượng sinh viên' from DiemHP 
  where  DiemChu=@diemchu AND MaLopHP = @lophp

GO
/****** Object:  StoredProcedure [dbo].[thongkesinhvienhocbong]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[thongkesinhvienhocbong] @malopsv nchar(10) , @hocki nchar(10)
	as
	select top 3  SinhVien.MSSV, SinhVien.HoTenSV , GPA from LopSV,SinhVien,TongKet
	where SinhVien.MSSV=TongKet.MSSV and LopSV.MaLopSV=SinhVien.MaLopSV and LopSV.MaLopSV=@malopsv and HocKy=@hocki
	order by GPA DESC 

GO
/****** Object:  UserDefinedFunction [dbo].[cnGPA]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cnGPA]( @MSSV nchar(10), @HKi nchar(10))
	returns float
	as
	begin
	declare @a float
	set @a= (Select Sum(DiemQuyDoi*SoTC )/Sum(SoTc) as GPA from DiemHP,HocPhan,LopHP,HocKi,TongKet--,SinhVien
	where  DiemHP.MaLopHP=LopHP.MaLopHP
    and HocPhan.MaHP=LopHP.MaHP
	and LopHP.HocKy=HocKi.HocKy and TongKet.HocKY=HOCKI.HOCKY AND  LopHP.HocKy=@HKi  and DiemHP.MSSV=@MSSV
	group by DiemHP.MSSV)
	return @a
	end
GO
/****** Object:  UserDefinedFunction [dbo].[Diem_TB_HP]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Diem_TB_HP](@MaHP nchar(10))
RETURNS @Diem_TB_HP TABLE ( MaHP NCHAR(10) ,[Điểm trung bình] float )
AS
BEGIN
DECLARE @tb FLOAT 
SET @tb =( SELECT SUM(a.DiemTK)/COUNT(a.MSSV) FROM dbo.DiemHP AS a , dbo.LopHP AS b
   WHERE a.MaLopHP = b.MaLopHP AND b.MaHP =@MaHP GROUP BY b.HocKy)
INSERT INTO @Diem_TB_HP VALUES (@MaHP , @tb)
RETURN 
END


GO
/****** Object:  UserDefinedFunction [dbo].[Diem_TB_LopHP]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Diem_TB_LopHP](@MaLopHP nchar(10))
RETURNS @Diem_TB_HP TABLE ( MaHP NCHAR(10) ,[Điểm trung bình] float )
AS
BEGIN
DECLARE @tb FLOAT 
SET @tb =( SELECT SUM(a.DiemTK)/COUNT(a.MSSV) FROM dbo.DiemHP AS a , dbo.LopHP AS b
   WHERE a.MaLopHP = b.MaLopHP AND b.MaLopHP =@MaLopHP GROUP BY b.HocKy)
INSERT INTO @Diem_TB_HP VALUES (@MaLopHP , @tb)
RETURN 
END


GO
/****** Object:  UserDefinedFunction [dbo].[SL_Loai_Bang_TotNghiep]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[SL_Loai_Bang_TotNghiep]()
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


GO
/****** Object:  UserDefinedFunction [dbo].[SL_SV_CC]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SL_SV_CC]()
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


GO
/****** Object:  UserDefinedFunction [dbo].[SlSVCuaLopHP]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SlSVCuaLopHP](@MalopHp nchar(10))
RETURNS int
AS
BEGIN
DECLARE @int INT
SET @int = (SELECT COUNT(MSSV) FROM dbo.DiemHP WHERE MaLopHP = @MalopHp )
RETURN @int
END
GO
/****** Object:  UserDefinedFunction [dbo].[SLSVCuaLopSV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SLSVCuaLopSV](@MaLop nchar(10))
RETURNS int 
AS
BEGIN
DECLARE @int int
SET @int  = (SELECT count(MSSV) FROM dbo.SinhVien WHERE MaLopSV = @MaLop)
RETURN @int 
END
GO
/****** Object:  UserDefinedFunction [dbo].[So_TC_No]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[So_TC_No] (@MSSV nchar(10))
RETURNS @TCno TABLE (MSSV nchar(10), [Số TC Nợ] int)
AS 
BEGIN
DECLARE @tc INT 
SET @tc = (SELECT SUM(c.SoTC) FROM dbo.DiemHP AS a, dbo.LopHP AS b , dbo.HocPhan AS c
WHERE a.MaLopHP = b.MaLopHP AND b.MaHP = c.MaHP AND  a.MSSV = @MSSV AND a.DiemChu = 'F')
INSERT INTO @TCno VALUES (@MSSV,@tc)
return
end
GO
/****** Object:  UserDefinedFunction [dbo].[Xep_Loai_TotNghiep]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Xep_Loai_TotNghiep](@MSSV nchar(10))
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

GO
/****** Object:  Table [dbo].[CanhCao]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanhCao](
	[MSSV] [nchar](10) NOT NULL,
	[HocKy] [nchar](10) NOT NULL,
	[MucCC] [int] NULL,
 CONSTRAINT [PK_CanhCao] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC,
	[HocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDaoTao]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDaoTao](
	[MaNganh] [nchar](10) NOT NULL,
	[MaHP] [nchar](10) NOT NULL,
	[KyHocChuan] [nchar](10) NULL,
 CONSTRAINT [PK_CTDaoTao] PRIMARY KEY CLUSTERED 
(
	[MaNganh] ASC,
	[MaHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiemHP]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemHP](
	[MSSV] [nchar](10) NOT NULL,
	[MaLopHP] [nchar](10) NOT NULL,
	[DiemQT] [float] NULL,
	[DiemKT] [float] NULL,
	[DiemTK] [float] NULL,
	[DiemChu] [nchar](10) NULL,
 CONSTRAINT [PK_DiemHP] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC,
	[MaLopHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiemToeic]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemToeic](
	[MSSV] [nchar](10) NOT NULL,
	[NgayThi] [datetime] NOT NULL,
	[SoCauDoc] [int] NULL,
	[SoCauNghe] [int] NULL,
 CONSTRAINT [PK_DiemToeic] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC,
	[NgayThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [nchar](10) NOT NULL,
	[TenGV] [nvarchar](100) NULL,
	[MaVien] [nchar](10) NULL,
 CONSTRAINT [PK_GiangVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocKi]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKi](
	[HocKy] [nchar](10) NOT NULL,
	[NamHoc] [nchar](10) NULL,
 CONSTRAINT [PK_HocKi] PRIMARY KEY CLUSTERED 
(
	[HocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocPhan]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocPhan](
	[MaHP] [nchar](10) NOT NULL,
	[TenHP] [nvarchar](100) NULL,
	[SoTC] [int] NULL,
	[TrongSo] [float] NULL,
	[VienDaoTao] [nchar](10) NULL,
 CONSTRAINT [PK_HocPhan] PRIMARY KEY CLUSTERED 
(
	[MaHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HPTuongDuong]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HPTuongDuong](
	[MaHP] [nchar](10) NOT NULL,
	[MaHPTD] [nchar](10) NULL,
 CONSTRAINT [PK_HocPhanTuongDuong] PRIMARY KEY CLUSTERED 
(
	[MaHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LopHP]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHP](
	[MaLopHP] [nchar](10) NOT NULL,
	[MaHP] [nchar](10) NULL,
	[Phong] [nchar](10) NULL,
	[Thu] [nvarchar](10) NULL,
	[Tgian] [nchar](50) NULL,
	[GVDay] [nchar](10) NULL,
	[HocKy] [nchar](10) NULL,
 CONSTRAINT [PK_LopHP] PRIMARY KEY CLUSTERED 
(
	[MaLopHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LopSV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopSV](
	[MaLopSV] [nchar](10) NOT NULL,
	[TenLopSV] [nvarchar](100) NULL,
	[MaNganh] [nchar](10) NULL,
	[GVCN] [nchar](10) NULL,
 CONSTRAINT [PK_LopSV] PRIMARY KEY CLUSTERED 
(
	[MaLopSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LopThi]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopThi](
	[MaLopThi] [nchar](10) NOT NULL,
	[PhongThi] [nchar](10) NULL,
	[KipThi] [nchar](10) NULL,
	[MaLopHP] [nchar](10) NULL,
	[GVcoithi] [nchar](10) NULL,
	[GVchamthi] [nchar](10) NULL,
	[NgThi] [datetime] NULL,
 CONSTRAINT [PK_LopThi] PRIMARY KEY CLUSTERED 
(
	[MaLopThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nganh]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nganh](
	[MaNganh] [nchar](10) NOT NULL,
	[TenNganh] [nvarchar](50) NULL,
	[VienDaoTao] [nchar](10) NULL,
	[HeDaoTao] [nvarchar](10) NULL,
 CONSTRAINT [PK_Nganh] PRIMARY KEY CLUSTERED 
(
	[MaNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhucTra]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhucTra](
	[MSSV] [nchar](10) NOT NULL,
	[MaLopThi] [nchar](10) NOT NULL,
	[DiemCu] [nchar](10) NOT NULL,
 CONSTRAINT [PK_PhucTra_1] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC,
	[MaLopThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDoiDiemDoc]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDoiDiemDoc](
	[SoCauDoc] [int] NOT NULL,
	[DiemDoc] [int] NULL,
 CONSTRAINT [PK_QuyDoiDiemDoc] PRIMARY KEY CLUSTERED 
(
	[SoCauDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDoiDiemNghe]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDoiDiemNghe](
	[SoCauNghe] [int] NOT NULL,
	[DiemNghe] [int] NULL,
 CONSTRAINT [PK_QuyDoiDiemNghe] PRIMARY KEY CLUSTERED 
(
	[SoCauNghe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MSSV] [nchar](10) NOT NULL,
	[HoTenSV] [nvarchar](100) NULL,
	[NgSinh] [datetime] NULL,
	[MaLopSV] [nchar](10) NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TongKet]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TongKet](
	[MSSV] [nchar](10) NOT NULL,
	[HocKy] [nchar](10) NOT NULL,
	[GPA] [float] NULL,
	[CPA] [float] NULL,
 CONSTRAINT [PK_TongKet] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC,
	[HocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vien]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vien](
	[MaVien] [nchar](10) NOT NULL,
	[TenVien] [nvarchar](100) NULL,
	[VPVien] [nchar](10) NULL,
 CONSTRAINT [PK_Vien] PRIMARY KEY CLUSTERED 
(
	[MaVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[Bang_Diem_Cua_SV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Bang_Diem_Cua_SV](@MSSV nchar(10))
RETURNS TABLE
AS
RETURN select MSSV,TenHP, DiemQT,DiemKT,DiemChu from DiemHP,HocPhan,LopHP
  where HocPhan.MaHP=LopHP.MaHP and LopHP.MaLopHP=DiemHP.MaLopHP and MSSV=@MSSV 

GO
/****** Object:  UserDefinedFunction [dbo].[CT_DT_SV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CT_DT_SV](@MSSV nchar(10))
RETURNS TABLE
AS
RETURN (SELECT c.MaNganh , c.MaHP ,c.KyHocChuan FROM dbo.SinhVien AS a , dbo.LopSV AS b , dbo.CTDaoTao AS c 
WHERE a.MaLopSV = b.MaLopSV AND b.MaNganh = c.MaNganh AND a.MSSV = @MSSV)
GO
/****** Object:  UserDefinedFunction [dbo].[DS_GV_Vien]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DS_GV_Vien] (@MaVien nchar(10))
RETURNS TABLE
AS
RETURN (SELECT MaGV , TenGV FROM dbo.GiangVien WHERE @Mavien = MaVien)


GO
/****** Object:  UserDefinedFunction [dbo].[DS_Lop]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DS_Lop] (@Malop nchar(10))
RETURNS TABLE
AS
RETURN (SELECT MSSV , HoTenSV , NgSinh FROM dbo.SinhVien WHERE @Malop = MaLopSV)


GO
/****** Object:  UserDefinedFunction [dbo].[HP_Tuong_Duong]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[HP_Tuong_Duong](@MaHP nchar(10))
RETURNS TABLE
AS
RETURN (SELECT*FROM dbo.HPTuongDuong WHERE MaHP= @MaHP)

GO
/****** Object:  UserDefinedFunction [dbo].[Lich_Thi_SV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Lich_Thi_SV] (@MSSV NCHAR(10))
RETURNS table
AS
RETURN (SELECT a.MaLopThi, a.PhongThi , a.Ngthi ,a.KipThi , a.MaLopHP , a.GVcoithi , a.GVchamthi FROM lopthi AS a, dbo.LopHP AS b , dbo.DiemHP AS c
WHERE a.MaLopHP = b.MaLopHP AND c.MaLopHP=b.MaLopHP AND c.MSSV= @MSSV)
GO
/****** Object:  UserDefinedFunction [dbo].[Thong_Ke_HP_No_SV]    Script Date: 27/12/2018 9:33:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[Thong_Ke_HP_No_SV](@MSSV nchar(10))
RETURNS TABLE
AS
RETURN (SELECT c.MaHP, c.TenHP FROM dbo.DiemHP AS a, dbo.LopHP AS b , dbo.HocPhan AS c
WHERE a.MaLopHP = b.MaLopHP AND b.MaHP = c.MaHP AND  a.MSSV = @MSSV AND a.DiemChu = 'F')

GO
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20161259  ', N'20161     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20161367  ', N'20161     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20161367  ', N'20162     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20161775  ', N'20161     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20161775  ', N'20162     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20161775  ', N'20171     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20161898  ', N'20161     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20161898  ', N'20162     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20161898  ', N'20171     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20162345  ', N'20161     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20162345  ', N'20162     ', NULL)
INSERT [dbo].[CanhCao] ([MSSV], [HocKy], [MucCC]) VALUES (N'20162345  ', N'20171     ', NULL)
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'CH1       ', N'CH1010    ', N'20171     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'CH1       ', N'CH3008    ', N'20172     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'IT1       ', N'MI1010    ', N'20161     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'IT1       ', N'MI1030    ', N'20161     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'IT1       ', N'PH1016    ', N'20161     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'IT1       ', N'PH1026    ', N'20162     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'IT2       ', N'MI1030    ', N'20161     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'IT2       ', N'PH1016    ', N'20161     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'MI1       ', N'MI1010    ', N'20161     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'MI1       ', N'MI1030    ', N'20161     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'MI1       ', N'MI3010    ', N'20171     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'MI1       ', N'MI3030    ', N'20172     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'MI1       ', N'PH1016    ', N'20161     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'MI1       ', N'PH1026    ', N'20162     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'MI2       ', N'MI1010    ', N'20161     ')
INSERT [dbo].[CTDaoTao] ([MaNganh], [MaHP], [KyHocChuan]) VALUES (N'MI2       ', N'MI1030    ', N'20161     ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161102  ', N'105371    ', 4, 3, 3.3, N'F         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161102  ', N'105372    ', 5, 5, 5, N'D+        ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161234  ', N'105370    ', 5, 4, 4.3, N'D         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161234  ', N'105371    ', 6, 6, 6, N'C         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161258  ', N'105371    ', 9, 8, 8.3, N'B+        ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161258  ', N'105372    ', 9, 9, 9, N'A         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161259  ', N'105372    ', 9, 9, 9, N'A         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161360  ', N'105372    ', 4, 5, 4.7, N'D         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161367  ', N'105372    ', 10, 10, 10, N'A+        ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161368  ', N'105370    ', 3, 2, 2.3, N'F         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161660  ', N'105370    ', 2, 2, 2, N'F         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161660  ', N'105372    ', 4, 4, 4, N'D         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161775  ', N'105370    ', 10, 9, 9.3, N'A         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161775  ', N'105371    ', 8, 9, 8.7, N'A         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161898  ', N'105370    ', 10, 9, 9.3, N'A         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161898  ', N'105371    ', 8, 8, 8, N'B+        ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161991  ', N'105370    ', 6, 6, 6, N'C         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20161991  ', N'105371    ', 6, 7, 6.6999999999999993, N'C+        ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20164329  ', N'105370    ', 5, 6, 5.6999999999999993, N'C         ')
INSERT [dbo].[DiemHP] ([MSSV], [MaLopHP], [DiemQT], [DiemKT], [DiemTK], [DiemChu]) VALUES (N'20164329  ', N'105371    ', 6, 7, 6.6999999999999993, N'C+        ')
INSERT [dbo].[DiemToeic] ([MSSV], [NgayThi], [SoCauDoc], [SoCauNghe]) VALUES (N'20161102  ', CAST(0x0000A8EC00000000 AS DateTime), 67, 50)
INSERT [dbo].[DiemToeic] ([MSSV], [NgayThi], [SoCauDoc], [SoCauNghe]) VALUES (N'20161234  ', CAST(0x0000A90D00000000 AS DateTime), 56, 54)
INSERT [dbo].[DiemToeic] ([MSSV], [NgayThi], [SoCauDoc], [SoCauNghe]) VALUES (N'20161660  ', CAST(0x0000A7DC00000000 AS DateTime), 40, 45)
INSERT [dbo].[DiemToeic] ([MSSV], [NgayThi], [SoCauDoc], [SoCauNghe]) VALUES (N'20161775  ', CAST(0x0000A87400000000 AS DateTime), 32, 36)
INSERT [dbo].[DiemToeic] ([MSSV], [NgayThi], [SoCauDoc], [SoCauNghe]) VALUES (N'20161775  ', CAST(0x0000A8AF00000000 AS DateTime), 28, 50)
INSERT [dbo].[DiemToeic] ([MSSV], [NgayThi], [SoCauDoc], [SoCauNghe]) VALUES (N'20161898  ', CAST(0x0000A8AF00000000 AS DateTime), 33, 39)
INSERT [dbo].[DiemToeic] ([MSSV], [NgayThi], [SoCauDoc], [SoCauNghe]) VALUES (N'20161898  ', CAST(0x0000A92800000000 AS DateTime), 28, 40)
INSERT [dbo].[DiemToeic] ([MSSV], [NgayThi], [SoCauDoc], [SoCauNghe]) VALUES (N'20161898  ', CAST(0x0000A98A00000000 AS DateTime), 39, 41)
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV01      ', N'Trần Ngọc Thăng', N'BK01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV02      ', N'Lê Chí Ngọc', N'BK01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV03      ', N'Nguyễn Cảnh Nam', N'BK01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV04      ', N'Nguyễn Danh Tú ', N'BK01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV05      ', N'Nguyễn Thúy Hằng ', N'BK05      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV06      ', N'Nguyễn Thị Anh Nga', N'BK04      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV07      ', N'Nguyễn Đức Huy', N'BK02      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV08      ', N'Lê Ngọc Anh ', N'BK08      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV09      ', N'Vũ Văn Lâm', N'BK08      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV10      ', N'Thái Văn Trung', N'BK03      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV11      ', N'Minh An Nhi', N'BK11      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV12      ', N'Bùi Thảo Mai', N'BK10      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV13      ', N'Vũ Trí An', N'BK02      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV14      ', N'Hoàng Minh Lâm', N'BK06      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV15      ', N'Vũ Thái Sơn', N'BK07      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV16      ', N'Nguyễn Thị Lan', N'BK12      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV17      ', N'Minh Đức An', N'BK09      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV18      ', N'Trần Phương Linh', N'BK13      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV19      ', N'Hoàng Bảo Minh', N'BK14      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV20      ', N'Tô Minh Lâm', N'BK15      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV21      ', N'Văn Như Minh', N'BK09      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV22      ', N'Nguyễn Thị Mai', N'BK02      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV23      ', N'Huyền Nguyễn ', N'BK01      ')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [MaVien]) VALUES (N'GV24      ', N'Huyền Nguyễn Minh', N'BK02      ')
INSERT [dbo].[HocKi] ([HocKy], [NamHoc]) VALUES (N'20151     ', N'2015-2016 ')
INSERT [dbo].[HocKi] ([HocKy], [NamHoc]) VALUES (N'20152     ', N'2015-2016 ')
INSERT [dbo].[HocKi] ([HocKy], [NamHoc]) VALUES (N'20161     ', N'2016-2017 ')
INSERT [dbo].[HocKi] ([HocKy], [NamHoc]) VALUES (N'20162     ', N'2016-2017 ')
INSERT [dbo].[HocKi] ([HocKy], [NamHoc]) VALUES (N'20171     ', N'2017-2018 ')
INSERT [dbo].[HocKi] ([HocKy], [NamHoc]) VALUES (N'20172     ', N'2017-2018 ')
INSERT [dbo].[HocKi] ([HocKy], [NamHoc]) VALUES (N'20181     ', N'2018-2019 ')
INSERT [dbo].[HocKi] ([HocKy], [NamHoc]) VALUES (N'20182     ', N'2018-2019 ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'BF2010    ', N'Hóa Sinh thực Phẩm', 3, 0.7, N'BK11      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'BF2410    ', N'Công Nghệ Sinh Học Đại Cương', 3, 0.7, N'BK11      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'CH1010    ', N'Hóa Học Đại Cương', 3, 0.5, N'BK07      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'CH3008    ', N'Hóa Lý', 2, 0.7, N'BK07      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'ED3010    ', N'Giao dục học', 3, 0.7, N'BK05      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'ED3030    ', N'Tâm Lý Học Đại Cương', 4, 0.7, N'BK05      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'EE2010    ', N'Kĩ Thuật Điện', 3, 0.7, N'BK03      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'EE3000    ', N'Tín Hiệu Và Hệ Thống', 3, 0.7, N'BK03      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'EM1010    ', N'Quản Trị học đại cương', 2, 0.7, N'BK04      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'EM1700    ', N'Nhập Môn kế toán', 2, 0.7, N'BK04      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'EM3522    ', N'Quản Trị Tài Chính', 2, 0.7, N'BK04      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'EM4720    ', N'Kinh Tế Doanh Nghiệp', 2, 0.7, N'BK04      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'ET3030    ', N'lý Thuyết Mạch', 4, 0.7, N'BK08      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'ET3080    ', N'Điện tử Số', 3, 0.7, N'BK08      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'ET3110    ', N'Kĩ thuật Vi Xử Lý', 4, 0.5, N'BK08      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'EV1014    ', N'Môi Trường', 2, 0.7, N'BK12      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'EV3113    ', N'Hóa Học Môi Trường ', 3, 0.7, N'BK12      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'HE2010    ', N'Kĩ Thuật Nhiệt', 3, 0.7, N'BK13      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'ICT1020   ', N'Kiến Thức Máy Tính', 3, 0.7, N'BK02      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'IT1010    ', N'Tin Đại Cương', 3, 0.6, N'BK02      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'IT1013    ', N'Tin Đại Cương', 4, 0.5, N'BK02      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'IT1020    ', N'Tin Đại Cương', 3, 0.6, N'BK02      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'IT4779    ', N'Xử Lý Dữ Liệu Lớn', 3, 0.7, N'BK02      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'ME2040    ', N'Cơ Học Kĩ Thuật', 3, 0.7, N'BK15      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'ME3060    ', N'Nguyên Lý Máy', 3, 0.7, N'BK15      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI1010    ', N'giải tích 1', 3, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI1016    ', N'giải tích 1', 4, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI1020    ', N'giải tích 2', 3, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI1026    ', N'giải tích 2', 3, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI1030    ', N'Đại Số ', 3, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI1033    ', N'Đại Số ', 4, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI1043    ', N'giải tích 3', 3, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI2010    ', N'Phương Pháp Tính ', 3, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI2020    ', N'Xác Suất Thống Kê', 3, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI2047    ', N'Toán rời rạc', 3, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI3010    ', N'Toán Rời rạc', 3, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MI3030    ', N'Xác Suất thống Kê', 4, 0.7, N'BK01      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'MSE4001   ', N'Vật Liệu Kĩ Thuật', 2, 0.7, N'BK14      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'PH1010    ', N'Vật Lý Đai Cương 1', 4, 0.7, N'BK09      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'PH1016    ', N'Vật Lý Đại Cương 1', 4, 0.6, N'BK09      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'PH1020    ', N'Vật Lý Đại Cương 2', 4, 0.7, N'BK09      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'PH1026    ', N'Vật Lý Đại Cương 2', 4, 0.6, N'BK09      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'TE3210    ', N'Lý Thuyết ô tô', 3, 0.7, N'BK06      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'TE3400    ', N'Máy Thủy Khí', 3, 0.7, N'BK06      ')
INSERT [dbo].[HocPhan] ([MaHP], [TenHP], [SoTC], [TrongSo], [VienDaoTao]) VALUES (N'TEX4005   ', N'Hình Họa thời trang cơ bản', 2, 0.6, N'BK10      ')
INSERT [dbo].[HPTuongDuong] ([MaHP], [MaHPTD]) VALUES (N'IT1010    ', N'IT1013    ')
INSERT [dbo].[HPTuongDuong] ([MaHP], [MaHPTD]) VALUES (N'IT1020    ', N'IT1013    ')
INSERT [dbo].[HPTuongDuong] ([MaHP], [MaHPTD]) VALUES (N'MI1010    ', N'MI1016    ')
INSERT [dbo].[HPTuongDuong] ([MaHP], [MaHPTD]) VALUES (N'MI1020    ', N'MI1026    ')
INSERT [dbo].[HPTuongDuong] ([MaHP], [MaHPTD]) VALUES (N'MI1030    ', N'MI1033    ')
INSERT [dbo].[HPTuongDuong] ([MaHP], [MaHPTD]) VALUES (N'MI2047    ', N'MI2010    ')
INSERT [dbo].[HPTuongDuong] ([MaHP], [MaHPTD]) VALUES (N'PH1016    ', N'PH1010    ')
INSERT [dbo].[HPTuongDuong] ([MaHP], [MaHPTD]) VALUES (N'PH1026    ', N'PH1020    ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'105270    ', N'PH1010    ', N'D3-101    ', N'tư', N'7H35-10H05                                        ', N'GV17      ', N'20161     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'105271    ', N'PH1010    ', N'D3-102    ', N'tư', N'7h35-10h05                                        ', N'GV21      ', N'20161     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'105370    ', N'MI1016    ', N'D3-406    ', N'hai', N'6H45-10h05                           6h45-10h15   ', N'GV01      ', N'20161     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'105371    ', N'MI1033    ', N'D5-102    ', N'hai', N'6h45-10h05                                        ', N'GV01      ', N'20161     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'105372    ', N'MI1016    ', N'D3-406    ', N'ba', N'7h35-11h05                                        ', N'GV02      ', N'20161     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'105373    ', N'MI1033    ', N'D5-105    ', N'sáu', N'6h45-10h05                                        ', N'GV02      ', N'20161     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'105374    ', N'MI1016    ', N'D9-105    ', N'tư', N'12h30-3h50                                        ', N'GV03      ', N'20161     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'105375    ', N'MI1033    ', N'D3-406    ', N'năm', N'6h45-10h05                                        ', N'GV04      ', N'20161     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'106270    ', N'PH1020    ', N'D3-303    ', N'năm', N'7h35-10h05                                        ', N'GV21      ', N'20162     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'106271    ', N'PH1020    ', N'D5-106    ', N'năm', N'7H35-10H05                                        ', N'GV17      ', N'20162     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'106370    ', N'MI1020    ', N'D3-406    ', N'năm', N'6h45-10h05                                        ', N'GV01      ', N'20162     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'106371    ', N'MI1043    ', N'D5-106    ', N'sáu', N'12H30-3H50               12H30-3H50               ', N'GV02      ', N'20162     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'106372    ', N'MI1020    ', N'D5-107    ', N'năm', N'6H45-10H05                                        ', N'GV03      ', N'20162     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'106373    ', N'MI1043    ', N'D5-202    ', N'hai', N'6H45-10H05                                        ', N'GV03      ', N'20162     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'107370    ', N'MI1010    ', N'D5-206    ', N'năm', N'6h45-10h05                                        ', N'GV01      ', N'20171     ')
INSERT [dbo].[LopHP] ([MaLopHP], [MaHP], [Phong], [Thu], [Tgian], [GVDay], [HocKy]) VALUES (N'107371    ', N'MI1030    ', N'D3-204    ', N'năm', N'12H30-3H50                                        ', N'GV03      ', N'20171     ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'CH01      ', N'Kĩ Thuật Hóa Học K61', N'CH1       ', N'GV15      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'CH02      ', N'Kĩ Thuật In-K62', N'CH3       ', N'GV15      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'IT01      ', N'CNTT-K62', N'IT3       ', N'GV05      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'IT02      ', N'Kĩ Thuật MT-K62', N'IT2       ', N'GV06      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'IT03      ', N'CNTT-K61', N'IT3       ', N'GV06      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'MI01      ', N'Toán Tin 01-K62', N'MI1       ', N'GV01      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'MI02      ', N'Toán Tin 02-K62', N'MI1       ', N'GV02      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'MI03      ', N'HTTTQL-K62', N'MI2       ', N'GV01      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'MI04      ', N'Toán Tin -K59', N'MI1       ', N'GV03      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'MI05      ', N'Toán Tin- K61', N'MI1       ', N'GV04      ')
INSERT [dbo].[LopSV] ([MaLopSV], [TenLopSV], [MaNganh], [GVCN]) VALUES (N'MI06      ', N'HTTTQL-K61', N'MI2       ', N'GV03      ')
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110001    ', N'T-406     ', N'1         ', N'105270    ', N'GV17      ', N'GV21      ', CAST(0x0000A6E700000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110002    ', N'T-407     ', N'1         ', N'105270    ', N'GV01      ', N'GV17      ', CAST(0x0000A6E700000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110003    ', N'D3-405    ', N'2         ', N'105271    ', N'GV03      ', N'GV17      ', CAST(0x0000A6E700000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110004    ', N'D3-406    ', N'2         ', N'105271    ', N'GV02      ', N'GV21      ', CAST(0x0000A6E700000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110005    ', N'D3-405    ', N'1         ', N'105370    ', N'GV06      ', N'GV01      ', CAST(0x0000A6E800000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110006    ', N'D3-406    ', N'1         ', N'105370    ', N'GV07      ', N'GV02      ', CAST(0x0000A6E800000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110007    ', N'D5-104    ', N'2         ', N'105372    ', N'GV11      ', N'GV03      ', CAST(0x0000A6E800000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110008    ', N'D5-103    ', N'2         ', N'105372    ', N'GV13      ', N'GV04      ', CAST(0x0000A6E800000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110009    ', N'D3-201    ', N'3         ', N'105374    ', N'GV18      ', N'GV02      ', CAST(0x0000A6E800000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110010    ', N'D3-202    ', N'3         ', N'105374    ', N'GV21      ', N'GV03      ', CAST(0x0000A6E800000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110011    ', N'D9-105    ', N'2         ', N'105375    ', N'GV20      ', N'GV01      ', CAST(0x0000A6E900000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110012    ', N'D9-106    ', N'2         ', N'105375    ', N'GV15      ', N'GV04      ', CAST(0x0000A6E900000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110013    ', N'D3-204    ', N'3         ', N'105371    ', N'GV14      ', N'GV01      ', CAST(0x0000A6E900000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110014    ', N'D3-205    ', N'3         ', N'105371    ', N'GV16      ', N'GV02      ', CAST(0x0000A6E900000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110015    ', N'D5-204    ', N'4         ', N'105373    ', N'GV09      ', N'GV03      ', CAST(0x0000A6E900000000 AS DateTime))
INSERT [dbo].[LopThi] ([MaLopThi], [PhongThi], [KipThi], [MaLopHP], [GVcoithi], [GVchamthi], [NgThi]) VALUES (N'110016    ', N'D5-205    ', N'4         ', N'105373    ', N'GV12      ', N'GV04      ', CAST(0x0000A6E900000000 AS DateTime))
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'BF1       ', N'Kĩ Thuật Sinh Học ', N'BK11      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'BF2       ', N'Kĩ Thuật Thực Phẩm', N'BK11      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'CH1       ', N'Kĩ Thuật Hóa Học ', N'BK07      ', N'Kĩ Sư ')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'CH2       ', N'Hóa Học ', N'BK07      ', N'Cử Nhân')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'CH3       ', N'Kĩ Thuật In', N'BK07      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'ED1       ', N'Sư Phạm KTCN', N'BK05      ', N'Cử Nhân')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'EE1       ', N'Kĩ Thuật Điện', N'BK03      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'EE2       ', N'Kĩ Thuật Điều Khiển-Tự Động Hóa', N'BK03      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'EM1       ', N'Kinh tế Công Nghiệp', N'BK04      ', N'Cử Nhân')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'EM2       ', N'Quản Lý Công Nghiệp', N'BK04      ', N'Cử Nhân')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'EM3       ', N'Quản Trị Kinh Doanh', N'BK04      ', N'Cử Nhân')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'EM4       ', N'Kế Toán', N'BK04      ', N'Cử Nhân')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'EM5       ', N'Tài Chính Ngân Hàng', N'BK04      ', N'Cử Nhân')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'ET1       ', N'Kĩ Thuật Điện Tử Viễn Thông', N'BK08      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'EV1       ', N'Kĩ Thuật Môi Trường ', N'BK12      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'HE1       ', N'Kĩ Thuật Nhiệt', N'BK13      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'IT1       ', N'Khoa Học Máy Tính', N'BK02      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'IT2       ', N'Kĩ Thuật Máy Tính', N'BK02      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'IT3       ', N'CNTT', N'BK02      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'IT-E6     ', N'CNTT-Việt Nhật', N'BK02      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'IT-E7     ', N'CNTT-ICT', N'BK02      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'ME1       ', N'Kĩ Thuật Cơ Điện Tử', N'BK15      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'ME2       ', N'Kĩ Thuật Cơ Khí ', N'BK15      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'MI1       ', N'Toán Tin', N'BK01      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'MI2       ', N'HTTTQL', N'BK01      ', N'Cử Nhân')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'MS1       ', N'Kĩ Thuật Vật Liệu', N'BK14      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'NE1       ', N'Kĩ Thuật Hạt Nhân', N'BK09      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'PH1       ', N'Vật Lý Kĩ Thuật', N'BK09      ', N'Cử Nhân')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'TE1       ', N'Kĩ Thuật Ô tô', N'BK06      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'TE2       ', N'Kĩ Thuật CKDL', N'BK06      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'TE3       ', N'Kĩ Thuật Hàng Không ', N'BK06      ', N'Kĩ Sư ')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'TE4       ', N'Kĩ Thuật Tàu Thủy ', N'BK06      ', N'Kĩ Sư ')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'TX1       ', N'Kĩ Thuật Dệt', N'BK10      ', N'Kĩ Sư')
INSERT [dbo].[Nganh] ([MaNganh], [TenNganh], [VienDaoTao], [HeDaoTao]) VALUES (N'TX2       ', N'Công Nghệ May', N'BK10      ', N'Cử Nhân')
INSERT [dbo].[PhucTra] ([MSSV], [MaLopThi], [DiemCu]) VALUES (N'20161102  ', N'110008    ', N'4         ')
INSERT [dbo].[PhucTra] ([MSSV], [MaLopThi], [DiemCu]) VALUES (N'20161234  ', N'110005    ', N'4         ')
INSERT [dbo].[PhucTra] ([MSSV], [MaLopThi], [DiemCu]) VALUES (N'20161360  ', N'110007    ', N'2         ')
INSERT [dbo].[PhucTra] ([MSSV], [MaLopThi], [DiemCu]) VALUES (N'20161991  ', N'110005    ', N'5         ')
INSERT [dbo].[PhucTra] ([MSSV], [MaLopThi], [DiemCu]) VALUES (N'20161991  ', N'110013    ', N'4         ')
INSERT [dbo].[PhucTra] ([MSSV], [MaLopThi], [DiemCu]) VALUES (N'20164329  ', N'110013    ', N'5         ')
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (0, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (1, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (2, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (3, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (4, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (5, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (6, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (7, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (8, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (9, 5)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (10, 10)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (11, 15)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (12, 20)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (13, 25)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (14, 30)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (15, 35)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (16, 40)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (17, 45)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (18, 50)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (19, 55)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (20, 60)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (21, 65)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (22, 70)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (23, 75)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (24, 80)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (25, 90)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (26, 95)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (27, 100)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (28, 110)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (29, 115)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (30, 120)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (31, 125)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (32, 130)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (33, 135)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (34, 140)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (35, 145)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (36, 150)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (37, 155)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (38, 160)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (39, 170)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (40, 175)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (41, 180)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (42, 185)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (43, 195)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (44, 200)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (45, 205)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (46, 210)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (47, 220)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (48, 225)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (49, 230)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (50, 235)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (51, 240)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (52, 250)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (53, 255)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (54, 260)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (55, 270)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (56, 275)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (57, 280)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (58, 285)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (59, 290)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (60, 295)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (61, 300)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (62, 305)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (63, 310)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (64, 320)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (65, 325)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (66, 330)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (67, 335)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (68, 340)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (69, 345)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (70, 350)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (71, 355)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (72, 360)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (73, 365)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (74, 370)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (75, 375)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (76, 380)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (77, 385)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (78, 390)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (79, 395)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (80, 400)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (81, 405)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (82, 405)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (83, 410)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (84, 415)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (85, 420)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (86, 425)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (87, 430)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (88, 435)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (89, 445)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (90, 450)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (91, 455)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (92, 465)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (93, 470)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (94, 480)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (95, 485)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (96, 490)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (97, 495)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (98, 495)
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (99, 495)
GO
INSERT [dbo].[QuyDoiDiemDoc] ([SoCauDoc], [DiemDoc]) VALUES (100, 495)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (0, 5)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (1, 5)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (2, 5)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (3, 5)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (4, 5)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (5, 5)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (6, 5)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (7, 10)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (8, 15)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (9, 20)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (10, 25)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (11, 30)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (12, 35)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (13, 40)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (14, 45)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (15, 50)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (16, 55)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (17, 60)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (18, 65)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (19, 70)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (20, 75)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (21, 80)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (22, 85)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (23, 90)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (24, 95)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (25, 100)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (26, 105)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (27, 110)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (28, 115)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (29, 120)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (30, 125)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (31, 135)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (32, 140)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (33, 145)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (34, 150)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (35, 155)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (36, 160)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (37, 165)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (38, 170)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (39, 180)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (40, 185)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (41, 190)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (42, 195)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (43, 200)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (44, 210)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (45, 220)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (46, 225)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (47, 230)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (48, 235)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (49, 240)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (50, 245)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (51, 250)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (52, 255)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (53, 260)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (54, 270)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (55, 275)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (56, 280)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (57, 285)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (58, 295)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (59, 300)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (60, 305)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (61, 310)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (62, 315)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (63, 320)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (64, 325)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (65, 330)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (66, 335)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (67, 340)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (68, 345)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (69, 350)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (70, 360)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (71, 365)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (72, 370)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (73, 375)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (74, 380)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (75, 390)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (76, 395)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (77, 400)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (78, 405)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (79, 410)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (80, 420)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (81, 425)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (82, 430)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (83, 435)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (84, 440)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (85, 450)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (86, 455)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (87, 460)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (88, 470)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (89, 475)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (90, 480)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (91, 485)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (92, 490)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (93, 495)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (94, 495)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (95, 495)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (96, 495)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (97, 495)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (98, 495)
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (99, 495)
GO
INSERT [dbo].[QuyDoiDiemNghe] ([SoCauNghe], [DiemNghe]) VALUES (100, 495)
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161102  ', N'Đỗ Thị Anh', CAST(0x00008CAC00000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161111  ', N'Thảo Bùi  ', CAST(0x0000A6BB00000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161112  ', N'Thảo', CAST(0x00008C4400000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161113  ', N'Tùng', CAST(0x00008C4500000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161114  ', N'Tùng Lê', CAST(0x00008C4600000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161115  ', N'Tùng Lê Nam', CAST(0x00008C4700000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161224  ', N'Phan Thanh Dinh', CAST(0x00008BDC00000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161234  ', N'Đoàn Văn Dương ', CAST(0x00008C8E00000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161257  ', N'Vũ Việt Anh', CAST(0x00008BED00000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161258  ', N'Đỗ Trung Anh', CAST(0x00008CD000000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161259  ', N'Đặng Thị Cần', CAST(0x00008CB000000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161360  ', N'Nguyễn Thanh Bình', CAST(0x00008C3C00000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161367  ', N'Lương Tùng Dương', CAST(0x00008B6E00000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161368  ', N'Nguyễn Hữu Đạt', CAST(0x00008C8F00000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161369  ', N'Phạm Minh Đức ', CAST(0x00008C2300000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161660  ', N'Nguyễn Trọng Hiếu', CAST(0x00008CDD00000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161663  ', N'Trần Quốc Huy', CAST(0x00008C1A00000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161770  ', N'huyền', CAST(0x00008D3700000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161775  ', N'Lê Thị Huệ', CAST(0x00008A4700000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161786  ', N'Trần Quang Huy', CAST(0x00008D1700000000 AS DateTime), N'IT03      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161898  ', N'Nguyễn Thị Ngọc Huyền', CAST(0x00008CDF00000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161991  ', N'Nguyễn Thị Quỳnh Lê', CAST(0x00008D3100000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20161993  ', N'Lại Thùy Linh', CAST(0x00008BE100000000 AS DateTime), N'MI05      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20162345  ', N'Lê Thanh Lâm', CAST(0x00008B5F00000000 AS DateTime), N'IT03      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20162346  ', N'Trịnh Ngọc Nam', CAST(0x00008D2800000000 AS DateTime), N'IT03      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20164329  ', N'Hà Minh Tuấn ', CAST(0x00008CAA00000000 AS DateTime), N'MI06      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20166818  ', N'Vũ Ngọc Yến', CAST(0x00008C9200000000 AS DateTime), N'IT03      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20171111  ', N'Nguyễn Tiến Đức ', CAST(0x00008E4400000000 AS DateTime), N'MI02      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20171112  ', N'Phạm Trung Đức ', CAST(0x00008E4000000000 AS DateTime), N'MI02      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20171134  ', N'Nguyễn Thị Hiền', CAST(0x00008D6D00000000 AS DateTime), N'MI02      ')
INSERT [dbo].[SinhVien] ([MSSV], [HoTenSV], [NgSinh], [MaLopSV]) VALUES (N'20171456  ', N'Vũ Thị Thanh Hậu', CAST(0x00008D6900000000 AS DateTime), N'MI02      ')
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161259  ', N'20161     ', 4, 4)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161259  ', N'20162     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161259  ', N'20171     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161259  ', N'20172     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161360  ', N'20161     ', 1, 1)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161367  ', N'20161     ', 4, 4)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161367  ', N'20162     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161368  ', N'20161     ', 0, 0)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161368  ', N'20162     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161775  ', N'20161     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161775  ', N'20162     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161775  ', N'20171     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161775  ', N'20172     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161786  ', N'20161     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161786  ', N'20162     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161898  ', N'20161     ', 3.75, 3.75)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161898  ', N'20162     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161898  ', N'20171     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20161898  ', N'20172     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20162345  ', N'20161     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20162345  ', N'20162     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20166818  ', N'20161     ', NULL, NULL)
INSERT [dbo].[TongKet] ([MSSV], [HocKy], [GPA], [CPA]) VALUES (N'20166818  ', N'20162     ', NULL, NULL)
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK01      ', N'Viện Toán ứng Dụng & Tin Học', N'D3-106    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK02      ', N'Viện CNTT-TT', N'D5-105    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK03      ', N'Viện Điện', N'D9-107    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK04      ', N'Viện Kinh Tế -Quản Lý', N'D6-106    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK05      ', N'Viện Sư Phạm Kĩ Thuật', N'D4-104    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK06      ', N'Viện Cơ Khí Động Lực ', N'D5-205    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK07      ', N'Viện Kĩ Thuật Hóa Học ', N'D3-203    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK08      ', N'Viện Điện Tử Viễn Thông', N'D9-109    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK09      ', N'Viện Vật Lý Kĩ Thuật ', N'D4-405    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK10      ', N'Viện Dệt May -Da giầy & Thời Trang', N'D5-201    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK11      ', N'Viện Công Nghệ Sinh Học & Công Nghệ Thực Phẩm ', N'D6-102    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK12      ', N'Viện Khoa Học & Công Nghệ Môi Trường', N'D8-104    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK13      ', N'Viện Khoa Học & Công Nghệ Nhiệt Lạnh', N'D9-202    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK14      ', N'Viện Khoa Học & Kĩ Thuật Vật Liệu', N'D6-103    ')
INSERT [dbo].[Vien] ([MaVien], [TenVien], [VPVien]) VALUES (N'BK15      ', N'Viện Cơ Khí ', N'D6-104    ')
ALTER TABLE [dbo].[CanhCao]  WITH CHECK ADD  CONSTRAINT [FK_CanhCao_HocKi] FOREIGN KEY([HocKy])
REFERENCES [dbo].[HocKi] ([HocKy])
GO
ALTER TABLE [dbo].[CanhCao] CHECK CONSTRAINT [FK_CanhCao_HocKi]
GO
ALTER TABLE [dbo].[CanhCao]  WITH CHECK ADD  CONSTRAINT [FK_CanhCao_SinhVien] FOREIGN KEY([MSSV])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[CanhCao] CHECK CONSTRAINT [FK_CanhCao_SinhVien]
GO
ALTER TABLE [dbo].[CTDaoTao]  WITH CHECK ADD  CONSTRAINT [FK_CTDaoTao_HocPhan] FOREIGN KEY([MaHP])
REFERENCES [dbo].[HocPhan] ([MaHP])
GO
ALTER TABLE [dbo].[CTDaoTao] CHECK CONSTRAINT [FK_CTDaoTao_HocPhan]
GO
ALTER TABLE [dbo].[CTDaoTao]  WITH CHECK ADD  CONSTRAINT [FK_CTDaoTao_Nganh] FOREIGN KEY([MaNganh])
REFERENCES [dbo].[Nganh] ([MaNganh])
GO
ALTER TABLE [dbo].[CTDaoTao] CHECK CONSTRAINT [FK_CTDaoTao_Nganh]
GO
ALTER TABLE [dbo].[DiemHP]  WITH CHECK ADD  CONSTRAINT [FK_DiemHP_LopHP] FOREIGN KEY([MaLopHP])
REFERENCES [dbo].[LopHP] ([MaLopHP])
GO
ALTER TABLE [dbo].[DiemHP] CHECK CONSTRAINT [FK_DiemHP_LopHP]
GO
ALTER TABLE [dbo].[DiemHP]  WITH CHECK ADD  CONSTRAINT [FK_DiemHP_SinhVien] FOREIGN KEY([MSSV])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[DiemHP] CHECK CONSTRAINT [FK_DiemHP_SinhVien]
GO
ALTER TABLE [dbo].[DiemToeic]  WITH CHECK ADD  CONSTRAINT [FK_DiemToeic_QuyDoiDiemDoc] FOREIGN KEY([SoCauDoc])
REFERENCES [dbo].[QuyDoiDiemDoc] ([SoCauDoc])
GO
ALTER TABLE [dbo].[DiemToeic] CHECK CONSTRAINT [FK_DiemToeic_QuyDoiDiemDoc]
GO
ALTER TABLE [dbo].[DiemToeic]  WITH CHECK ADD  CONSTRAINT [FK_DiemToeic_QuyDoiDiemNghe] FOREIGN KEY([SoCauNghe])
REFERENCES [dbo].[QuyDoiDiemNghe] ([SoCauNghe])
GO
ALTER TABLE [dbo].[DiemToeic] CHECK CONSTRAINT [FK_DiemToeic_QuyDoiDiemNghe]
GO
ALTER TABLE [dbo].[DiemToeic]  WITH CHECK ADD  CONSTRAINT [FK_DiemToeic_SinhVien] FOREIGN KEY([MSSV])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[DiemToeic] CHECK CONSTRAINT [FK_DiemToeic_SinhVien]
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_GiangVien_Vien] FOREIGN KEY([MaVien])
REFERENCES [dbo].[Vien] ([MaVien])
GO
ALTER TABLE [dbo].[GiangVien] CHECK CONSTRAINT [FK_GiangVien_Vien]
GO
ALTER TABLE [dbo].[HPTuongDuong]  WITH CHECK ADD  CONSTRAINT [FK_HPTuongDuong_HocPhan] FOREIGN KEY([MaHP])
REFERENCES [dbo].[HocPhan] ([MaHP])
GO
ALTER TABLE [dbo].[HPTuongDuong] CHECK CONSTRAINT [FK_HPTuongDuong_HocPhan]
GO
ALTER TABLE [dbo].[LopHP]  WITH CHECK ADD  CONSTRAINT [FK_LopHP_GiangVien] FOREIGN KEY([GVDay])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[LopHP] CHECK CONSTRAINT [FK_LopHP_GiangVien]
GO
ALTER TABLE [dbo].[LopHP]  WITH CHECK ADD  CONSTRAINT [FK_LopHP_HocKi1] FOREIGN KEY([HocKy])
REFERENCES [dbo].[HocKi] ([HocKy])
GO
ALTER TABLE [dbo].[LopHP] CHECK CONSTRAINT [FK_LopHP_HocKi1]
GO
ALTER TABLE [dbo].[LopHP]  WITH CHECK ADD  CONSTRAINT [FK_LopHP_HocPhan] FOREIGN KEY([MaHP])
REFERENCES [dbo].[HocPhan] ([MaHP])
GO
ALTER TABLE [dbo].[LopHP] CHECK CONSTRAINT [FK_LopHP_HocPhan]
GO
ALTER TABLE [dbo].[LopSV]  WITH CHECK ADD  CONSTRAINT [FK_LopSV_GiangVien] FOREIGN KEY([GVCN])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[LopSV] CHECK CONSTRAINT [FK_LopSV_GiangVien]
GO
ALTER TABLE [dbo].[LopSV]  WITH CHECK ADD  CONSTRAINT [FK_LopSV_Nganh] FOREIGN KEY([MaNganh])
REFERENCES [dbo].[Nganh] ([MaNganh])
GO
ALTER TABLE [dbo].[LopSV] CHECK CONSTRAINT [FK_LopSV_Nganh]
GO
ALTER TABLE [dbo].[LopThi]  WITH CHECK ADD  CONSTRAINT [FK_LopThi_GiangVien] FOREIGN KEY([GVcoithi])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[LopThi] CHECK CONSTRAINT [FK_LopThi_GiangVien]
GO
ALTER TABLE [dbo].[LopThi]  WITH CHECK ADD  CONSTRAINT [FK_LopThi_GiangVien1] FOREIGN KEY([GVchamthi])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[LopThi] CHECK CONSTRAINT [FK_LopThi_GiangVien1]
GO
ALTER TABLE [dbo].[LopThi]  WITH CHECK ADD  CONSTRAINT [FK_LopThi_LopHP] FOREIGN KEY([MaLopHP])
REFERENCES [dbo].[LopHP] ([MaLopHP])
GO
ALTER TABLE [dbo].[LopThi] CHECK CONSTRAINT [FK_LopThi_LopHP]
GO
ALTER TABLE [dbo].[Nganh]  WITH CHECK ADD  CONSTRAINT [FK_Nganh_Vien] FOREIGN KEY([VienDaoTao])
REFERENCES [dbo].[Vien] ([MaVien])
GO
ALTER TABLE [dbo].[Nganh] CHECK CONSTRAINT [FK_Nganh_Vien]
GO
ALTER TABLE [dbo].[PhucTra]  WITH CHECK ADD  CONSTRAINT [FK_PhucTra_LopThi] FOREIGN KEY([MaLopThi])
REFERENCES [dbo].[LopThi] ([MaLopThi])
GO
ALTER TABLE [dbo].[PhucTra] CHECK CONSTRAINT [FK_PhucTra_LopThi]
GO
ALTER TABLE [dbo].[PhucTra]  WITH CHECK ADD  CONSTRAINT [FK_PhucTra_SinhVien] FOREIGN KEY([MSSV])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[PhucTra] CHECK CONSTRAINT [FK_PhucTra_SinhVien]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_LopSV] FOREIGN KEY([MaLopSV])
REFERENCES [dbo].[LopSV] ([MaLopSV])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_LopSV]
GO
ALTER TABLE [dbo].[TongKet]  WITH CHECK ADD  CONSTRAINT [FK_TongKet_HocKi] FOREIGN KEY([HocKy])
REFERENCES [dbo].[HocKi] ([HocKy])
GO
ALTER TABLE [dbo].[TongKet] CHECK CONSTRAINT [FK_TongKet_HocKi]
GO
ALTER TABLE [dbo].[TongKet]  WITH CHECK ADD  CONSTRAINT [FK_TongKet_SinhVien] FOREIGN KEY([MSSV])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[TongKet] CHECK CONSTRAINT [FK_TongKet_SinhVien]
GO
USE [master]
GO
ALTER DATABASE [QuanLyDiem] SET  READ_WRITE 
GO
