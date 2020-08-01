using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
    public class BUS_KQHT:DAO_ConnectionDb
    {
        private string mssv;

        public string MSSV
        {
            get { return mssv; }
            set { mssv = value; }
        }
        private string hocky;

        public string HocKy
        {
            get { return hocky; }
            set { hocky = value; }
        }
        DAO_ConnectionDb da = new DAO_ConnectionDb();
        public DataTable ShowKetQuaHocTap()
        {
            SqlParameter[] sqlPara = new SqlParameter[0];
            return da.executeSelectQuery("exec KQHTSV",sqlPara);

        }
        public int InsertKetQuaHocTap(BUS_KQHT KetQuaHocTap)
        {
            SqlParameter[] sqlPara = { new SqlParameter("@mssv", SqlDbType.NChar, 10),
                                       new SqlParameter("@hocky", SqlDbType.NChar,10) };
            sqlPara[0].Value = KetQuaHocTap.mssv;
            sqlPara[1].Value = KetQuaHocTap.hocky;
            return da.executeInsertQuery("Insert dbo.TongKet (MSSV,HocKy)  values( @mssv,@hocky)", sqlPara);
        }
        public DataTable LookKetQuaHocTap(string mssv)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            return da.executeSelectQuery("  exec TKKQHTSV @mssv", sqlPara);
        }
        public int CapNhatGPA(string hocky)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@hocky", SqlDbType.NChar, 10);
            sqlPara[0].Value = hocky;
            return da.executeInsertQuery("EXEC CN_GPA @hocky ", sqlPara);
        }
        public int CapNhatCPA(string hocky)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@hocky", SqlDbType.NChar, 10);
            sqlPara[0].Value = hocky;
            return da.executeInsertQuery("EXEC CN_CPA @hocky ", sqlPara);
        }
        }

    }

