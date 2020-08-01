using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
   public  class BUS_ThongKe:DAO_ConnectionDb
    {
        private string mahp;
        public string MaHP
        {
            get { return mahp; }
            set { mahp = value; }
        }
        DAO_ConnectionDb da = new DAO_ConnectionDb();
        public DataTable LookSinhVienHocLai(string mahp)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@mahp", SqlDbType.NChar, 10);
            sqlPara[0].Value = mahp;
            return da.executeSelectQuery("exec sinhvienhoclai @mahp", sqlPara);

        }
        public DataTable LookDSSinhVienHocLai(string mahp)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@mahp", SqlDbType.NChar, 10);
            sqlPara[0].Value = mahp;
            
            return da.executeSelectQuery(" exec sinhvienhoclaihp @mahp", sqlPara);

        }
    }
}
