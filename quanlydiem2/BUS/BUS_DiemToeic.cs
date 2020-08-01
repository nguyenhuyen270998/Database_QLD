using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
    public class BUS_DiemToeic:DAO_ConnectionDb
    {
        private string mssv;

        public string MSSV
        {
            get { return mssv; }
            set { mssv = value; }
        }
        private string ngaythi;

        public string NgayThi
        {
            get { return ngaythi; }
            set { ngaythi = value; }
        }
        private string socaudoc;

        public string SoCauDoc
        {
            get { return socaudoc; }
            set { socaudoc = value; }
        }
        private string socaunghe;
        public string SoCauNghe
        {
            get { return socaunghe; }
            set { socaunghe = value; }
        }
        DAO_ConnectionDb da = new DAO_ConnectionDb();
        public DataTable ShowDiemToeic()
        {
            SqlParameter[] sqlPara = new SqlParameter[0];
            return da.executeSelectQuery("select MSSV ,NgayThi,DiemToeic.SoCaudoc, DiemToeic.SoCauNghe,(DiemDoc+DiemNghe)as TongDiem from DiemToeic,QuyDoiDiemDoc,QuyDoiDiemNghe where DiemToeic.SoCauDoc=QuyDoiDiemDoc.SoCauDoc and DiemToeic.SoCauNghe=QuyDoiDiemNghe.SoCauNghe", sqlPara);
        }
        public int InsertDiemToeic(BUS_DiemToeic DiemToeic)
        {
            SqlParameter[] sqlPara = { new SqlParameter("@mssv", SqlDbType.NChar, 10),
                                       new SqlParameter("@ngaythi", SqlDbType.DateTime), 
                                       new SqlParameter("@socaudoc",SqlDbType.Int ),
                                       new SqlParameter("@socaunghe",SqlDbType.Int)};
            sqlPara[0].Value = DiemToeic.mssv;
            sqlPara[1].Value = DiemToeic.ngaythi;
            sqlPara[2].Value = DiemToeic.socaudoc;
            sqlPara[3].Value = DiemToeic.socaunghe;
            return da.executeInsertQuery("Insert dbo.DiemToeic  values( @mssv,Convert(DateTime,@ngaythi),Convert(Int,@socaudoc),Convert(Int,@socaunghe))", sqlPara);
        }
        public int UpdateDiemToeic(string mssv, string ngaythi, string socaudoc, string socaunghe)
        {
            SqlParameter[] sqlPara = new SqlParameter[4];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            sqlPara[1] = new SqlParameter("@ngaythi", SqlDbType.DateTime, 10);
            sqlPara[1].Value = ngaythi;
            sqlPara[2] = new SqlParameter("@socaudoc", SqlDbType.Int);
            sqlPara[2].Value = socaudoc;
            sqlPara[3] = new SqlParameter("@socaunghe", SqlDbType.Int);
            sqlPara[3].Value = socaunghe;
            return da.executeInsertQuery("Update DiemToeic set  SoCauDoc=Convert(Int,@socaudoc),SoCauNghe=Convert(Int,@socaunghe) where MSSV=@mssv and NgayThi= Convert(DateTime,@ngaythi )", sqlPara);
        }
        public DataTable LookDiemToeic(string mssv, string ngaythi)
        {
            SqlParameter[] sqlPara = new SqlParameter[2];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            sqlPara[1] = new SqlParameter("@ngaythi", SqlDbType.DateTime);
            sqlPara[1].Value = ngaythi;

            return da.executeSelectQuery("select* from DiemToeic where MSSV=@mssv and NgayThi=Convert(DateTime,@ngaythi)", sqlPara);
        }
        public DataTable LookDiemToeicSV(string mssv)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;

            return da.executeSelectQuery(" select* from DiemToeic where MSSV=@mssv", sqlPara);
        }
    }
}
