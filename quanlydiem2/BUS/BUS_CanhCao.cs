using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
   public  class BUS_CanhCao:DAO_ConnectionDb
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
        public DataTable ShowCanhCao()
        {
            SqlParameter[] sqlPara = new SqlParameter[0];
            return da.executeSelectQuery(" exec showCC ", sqlPara);
        }
        public int InsertCanhCao(BUS_CanhCao CanhCao)
        {
            SqlParameter[] sqlPara = { new SqlParameter("@mssv", SqlDbType.NChar, 10),
                                       new SqlParameter("@hocky", SqlDbType.NChar,10)  
                                                                                       };
            sqlPara[0].Value = CanhCao.mssv;
            sqlPara[1].Value = CanhCao.hocky;
            return da.executeInsertQuery("Insert dbo.CanhCao (MSSV,HocKy)  values( @mssv,@hocky)", sqlPara);
        }
        public DataTable LookCanhCao(string mssv)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            return da.executeSelectQuery(" exec TKCC @MSSV", sqlPara);
        }

    }
}
